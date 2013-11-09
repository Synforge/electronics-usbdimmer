USBFLAGS = `libusb-config --cflags`
USBLIBS = `libusb-config --libs` #-framework CoreFoundation
EXE_SUFFIX =

# Use the following 3 lines on Windows and comment out the 3 above. You may
# have to change the include paths to where you installed libusb-win32
#USBFLAGS = -I/usr/local/include
#USBLIBS = -L/usr/local/lib -lusb
#EXE_SUFFIX = .exe


CC		= gcc
CFLAGS	= $(USBFLAGS) -O -Wall
LIBS	= $(USBLIBS)

PROGRAM = usbdim$(EXE_SUFFIX)


all: $(PROGRAM)

.c.o:
	$(CC) $(CFLAGS) -c $<

$(PROGRAM): usbdim.o
	$(CC) -o $(PROGRAM) usbdim.o $(LIBS)

strip: $(PROGRAM)
	strip $(PROGRAM)

clean:
	rm -f *.o $(PROGRAM)
