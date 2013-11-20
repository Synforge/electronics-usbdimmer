#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>    /* for getopt */
#include <string.h>
#include <usb.h>    /* this is libusb, see http://libusb.sourceforge.net/ */

#define USBDEV_SHARED_VENDOR    0x16C0  /* VOTI */
#define USBDEV_SHARED_PRODUCT   0x05DC  /* Obdev's free shared PID */
/* Use obdev's generic shared VID/PID pair and follow the rules outlined
 * in firmware/usbdrv/USBID-License.txt.
 */

#define CMD_SET         0x01
#define CMD_STATUS      0x02

#define METHOD_SWITCH   0x00
#define METHOD_RAMP     0x01

static int  usbGetStringAscii(usb_dev_handle *dev, int index, int langid, char *buf, int buflen)
{
char    buffer[256];
int     rval, i;

    if((rval = usb_control_msg(dev, USB_ENDPOINT_IN, USB_REQ_GET_DESCRIPTOR, (USB_DT_STRING << 8) + index, langid, buffer, sizeof(buffer), 1000)) < 0)
        return rval;
    if(buffer[1] != USB_DT_STRING)
        return 0;
    if((unsigned char)buffer[0] < rval)
        rval = (unsigned char)buffer[0];
    rval /= 2;
    /* lossy conversion to ISO Latin1 */
    for(i=1;i<rval;i++){
        if(i > buflen)  /* destination buffer overflow */
            break;
        buf[i-1] = buffer[2 * i];
        if(buffer[2 * i + 1] != 0)  /* outside of ISO Latin1 range */
            buf[i-1] = '?';
    }
    buf[i-1] = 0;
    return i-1;
}

#define USB_ERROR_NOTFOUND  1
#define USB_ERROR_ACCESS    2
#define USB_ERROR_IO        3

#define USB_CMD_SPI         1
#define USB_CMD_SET         2

static int usbOpenDevice(usb_dev_handle **device, int vendor, char *vendorName, int product, char *productName)
{
struct usb_bus      *bus;
struct usb_device   *dev;
usb_dev_handle      *handle = NULL;
int                 errorCode = USB_ERROR_NOTFOUND;
static int          didUsbInit = 0;

    if(!didUsbInit){
        didUsbInit = 1;
        usb_init();
    }
    usb_find_busses();
    usb_find_devices();
    for(bus=usb_get_busses(); bus; bus=bus->next){
        for(dev=bus->devices; dev; dev=dev->next){
            if(dev->descriptor.idVendor == vendor && dev->descriptor.idProduct == product){
                char    string[256];
                int     len;
                handle = usb_open(dev); /* we need to open the device in order to query strings */
                if(!handle){
                    errorCode = USB_ERROR_ACCESS;
                    fprintf(stderr, "Warning: cannot open USB device: %s\n", usb_strerror());
                    continue;
                }
                if(vendorName == NULL && productName == NULL){  /* name does not matter */
                    break;
                }
                /* now check whether the names match: */
                len = usbGetStringAscii(handle, dev->descriptor.iManufacturer, 0x0409, string, sizeof(string));
                if(len < 0){
                    errorCode = USB_ERROR_IO;
                    fprintf(stderr, "Warning: cannot query manufacturer for device: %s\n", usb_strerror());
                }else{
                    errorCode = USB_ERROR_NOTFOUND;
                    /* fprintf(stderr, "seen device from vendor ->%s<-\n", string); */
                    if(strcmp(string, vendorName) == 0){
                        len = usbGetStringAscii(handle, dev->descriptor.iProduct, 0x0409, string, sizeof(string));
                        if(len < 0){
                            errorCode = USB_ERROR_IO;
                            fprintf(stderr, "Warning: cannot query product for device: %s\n", usb_strerror());
                        }else{
                            errorCode = USB_ERROR_NOTFOUND;
                            /* fprintf(stderr, "seen product ->%s<-\n", string); */
                            if(strcmp(string, productName) == 0)
                                break;
                        }
                    }
                }
                usb_close(handle);
                handle = NULL;
            }
        }
        if(handle)
            break;
    }
    if(handle != NULL){
        errorCode = 0;
        *device = handle;
    }
    return errorCode;
}

static void usage(char *name)
{
    fprintf(stderr, "Usage: %s [OPTION]\n", name);
    fprintf(stderr, "Controls a Synforge USB dimmer device\n");
    fprintf(stderr, "\t--set\tPerforms a set command\n");
    fprintf(stderr, "\t--status\tIssues a status command to the device (not implemented)\n");
    fprintf(stderr, "\t--switch,-s\tUsed with --set, this will switch to the new level immediately\n");
    fprintf(stderr, "\t--ramp,-r\tUsed with --set, this will ramp to the new level (Default)\n");
    fprintf(stderr, "\t--index,-i\tIndex of the channel to use\n");
    fprintf(stderr, "\t--level,-l\tThe level to set (0-255)\n\n");
}

int main(int argc, char **argv)
{

    int c;
    static int command = 0;
    int index = 0;
    int level = 0;
    static int method = METHOD_RAMP;

    static struct option long_options[] = {
        {"set",         no_argument, &command, CMD_SET},
        {"status",      no_argument, &command, CMD_STATUS},
        {"switch",      no_argument, &method, METHOD_SWITCH},
        {"ramp",        no_argument, &method, METHOD_RAMP},
        {"index",       required_argument,  0, 'i'},
        {"level",       required_argument,  0, 'l'},
        {0, 0, 0, 0}
    };
    int option_index = 0;
    while ((c = getopt_long(argc, argv, "i:l:sr",
                 long_options, &option_index)) != -1) {

        switch (c) {
            case 'i':
                index = atoi(optarg);
                break;
            case 's':
                method = METHOD_SWITCH;
                break;
            case 'l':
                level = atoi(optarg);
                break;
            case 'r':
                method = METHOD_RAMP;
                break;
        }
    }

    if(command == 0) {
        usage(argv[0]);
    }

    usb_dev_handle      *handle = NULL;
    int                 nBytes;

    usb_init();
    if(usbOpenDevice(&handle, USBDEV_SHARED_VENDOR, "Synforge", USBDEV_SHARED_PRODUCT, "USB Dimmer") != 0){
        fprintf(stderr, "Could not find USB device \"USB Dimmer\" with vid=0x%x pid=0x%x\n", USBDEV_SHARED_VENDOR, USBDEV_SHARED_PRODUCT);
        exit(1);
    }

    if(command == CMD_SET) {
        if(level < 0 || level > 255) {
            usage(argv[0]);
        }

        char data[3] = {method, index, level};
        nBytes = usb_control_msg(handle, 
            USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_ENDPOINT_OUT, 
            USB_CMD_SET, 
            0,
            0,
            data,
            sizeof(data),
            5000);

        if(nBytes < 0)
            fprintf(stderr, "USB error: %s\n", usb_strerror());
    } else if(command == CMD_STATUS) {
        //Currently not implemented
    }

    usb_close(handle);
    return 0;
}
