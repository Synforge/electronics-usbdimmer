v 20110115 2
C 43400 44800 1 0 0 crystal-1.sym
{
T 43600 45300 5 10 0 0 0 0 1
device=CRYSTAL
T 43500 45300 5 10 1 1 0 0 1
refdes=U1
T 43600 45500 5 10 0 0 0 0 1
symversion=0.1
T 43500 45100 5 10 1 1 0 0 1
value=12Mhz
T 43400 44800 5 10 0 0 0 0 1
footprint=HC49/US
}
C 43900 43700 1 0 0 ground.sym
N 44700 45800 43400 45800 4
N 43400 45800 43400 44900 4
N 44700 45600 44100 45600 4
N 44100 45600 44100 44900 4
C 44300 44000 1 90 0 capacitor-1.sym
{
T 43600 44200 5 10 0 0 90 0 1
device=CAPACITOR
T 43700 44200 5 10 1 1 90 0 1
refdes=C3
T 43400 44200 5 10 0 0 90 0 1
symversion=0.1
T 43900 44200 5 10 1 1 90 0 1
value=22pF
}
C 43600 44000 1 90 0 capacitor-1.sym
{
T 42900 44200 5 10 0 0 90 0 1
device=CAPACITOR
T 42900 44200 5 10 1 1 90 0 1
refdes=C2
T 42700 44200 5 10 0 0 90 0 1
symversion=0.1
T 43100 44200 5 10 1 1 90 0 1
value=22pF
}
N 43400 44000 44100 44000 4
C 48900 47500 1 0 0 vcc-2.sym
C 39700 49000 1 0 0 connector4-1.sym
{
T 41500 49900 5 10 0 0 0 0 1
device=CONNECTOR_4
T 39700 50400 5 10 1 1 0 0 1
refdes=USB
}
C 42100 51000 1 0 0 vcc-2.sym
C 42200 47700 1 0 0 ground.sym
C 42800 49700 1 0 0 resistor-1.sym
{
T 43100 50100 5 10 0 0 0 0 1
device=RESISTOR
T 43000 50000 5 10 1 1 0 0 1
refdes=R3
T 43300 50000 5 10 1 1 0 0 1
value=68R
}
C 43300 49200 1 0 0 resistor-1.sym
{
T 43600 49600 5 10 0 0 0 0 1
device=RESISTOR
T 43500 49500 5 10 1 1 0 0 1
refdes=R4
T 43800 49500 5 10 1 1 0 0 1
value=68R
}
N 44200 49300 44700 49300 4
N 41400 49800 42800 49800 4
N 43700 49800 44700 49800 4
N 44700 49800 44700 49700 4
N 41700 49300 43300 49300 4
N 44700 49500 44200 49500 4
N 44200 49500 44200 49300 4
C 42200 50900 1 270 0 resistor-1.sym
{
T 42600 50600 5 10 0 0 270 0 1
device=RESISTOR
T 42500 50700 5 10 1 1 270 0 1
refdes=R5
T 42500 50400 5 10 1 1 270 0 1
value=1k5R
}
N 42300 51000 42300 50900 4
N 42300 49800 42300 50000 4
C 42200 48400 1 90 0 zener-2.sym
{
T 41700 48800 5 10 0 0 90 0 1
device=ZENER_DIODE
T 41900 48700 5 10 1 1 90 0 1
refdes=Z1
T 41600 48500 5 10 1 1 0 0 1
value=3.6v
}
C 42800 48400 1 90 0 zener-2.sym
{
T 42300 48800 5 10 0 0 90 0 1
device=ZENER_DIODE
T 42500 48700 5 10 1 1 90 0 1
refdes=Z2
T 42800 48500 5 10 1 1 0 0 1
value=3.6v
}
N 42700 49200 42700 49800 4
N 42100 48400 42100 48000 4
N 42700 48400 42700 48000 4
N 41400 49500 41700 49500 4
N 41700 49500 41700 49300 4
N 42100 49200 42100 49300 4
N 42100 48000 42700 48000 4
C 41200 48900 1 0 0 ground.sym
C 41200 50100 1 0 0 vcc-2.sym
N 44700 46000 42000 46000 4
N 42000 43400 45500 43400 4
N 50000 43400 50000 46000 4
N 50000 46000 51200 46000 4
N 44700 46200 41800 46200 4
N 50200 43100 50200 46200 4
N 50200 46200 51200 46200 4
N 44700 46400 41600 46400 4
N 41600 42800 41600 46400 4
N 50400 42800 50400 46400 4
N 50400 46400 51200 46400 4
N 44700 46600 41400 46600 4
N 41400 46600 41400 42500 4
N 50600 42500 50600 46600 4
N 50600 46600 51200 46600 4
N 44700 47000 41200 47000 4
N 41200 47000 41200 42200 4
N 41200 42200 50800 42200 4
N 50800 42200 50800 45800 4
N 50800 45800 51200 45800 4
C 47900 47400 1 0 0 resistor-1.sym
{
T 48200 47800 5 10 0 0 0 0 1
device=RESISTOR
T 48100 47700 5 10 1 1 0 0 1
refdes=R2
T 48400 47700 5 10 1 1 0 0 1
value=4K7
}
N 48800 47500 49100 47500 4
N 47300 46700 49100 46700 4
N 49100 46400 49100 47500 4
N 47300 46400 49100 46400 4
C 55600 47500 1 0 0 vcc-2.sym
C 54100 47400 1 0 0 resistor-1.sym
{
T 54400 47800 5 10 0 0 0 0 1
device=RESISTOR
T 54200 47700 5 10 1 1 0 0 1
refdes=R8
T 54500 47700 5 10 1 1 0 0 1
value=4K7
}
N 55000 47500 55800 47500 4
N 53800 46700 55800 46700 4
N 55800 46400 55800 47500 4
N 53800 46400 55800 46400 4
C 62900 45800 1 90 0 triac-1.sym
{
T 62000 46100 5 10 0 0 90 0 1
device=TRIAC
T 62300 46100 5 10 1 1 90 0 1
refdes=D2
T 63100 45800 5 10 1 1 90 0 1
value=BTA06-600B
}
C 58200 45800 1 0 0 ground.sym
N 58400 46500 58400 46100 4
C 57200 47000 1 0 0 resistor-1.sym
{
T 57500 47400 5 10 0 0 0 0 1
device=RESISTOR
T 57200 47300 5 10 1 1 0 0 1
refdes=R10
T 57700 47300 5 10 1 1 0 0 1
value=470R
}
N 58100 47100 58400 47100 4
C 56900 43200 1 0 0 vcc-2.sym
C 58250 40100 1 0 0 ground.sym
N 58450 40800 58450 40400 4
N 51200 49300 50300 49300 4
N 50300 49300 50300 50400 4
N 50300 50400 56300 50400 4
C 57000 43000 1 270 0 resistor-1.sym
{
T 57400 42700 5 10 0 0 270 0 1
device=RESISTOR
T 57300 42800 5 10 1 1 270 0 1
refdes=R14
T 57300 42500 5 10 1 1 270 0 1
value=10K
}
N 57100 43200 57100 43000 4
N 57100 41200 57100 42100 4
C 60800 41500 1 0 0 resistor-1.sym
{
T 61100 41900 5 10 0 0 0 0 1
device=RESISTOR (3W)
T 60900 41800 5 10 1 1 0 0 1
refdes=R17
T 61300 41800 5 10 1 1 0 0 1
value=22K
}
C 60800 40700 1 0 0 resistor-1.sym
{
T 61100 41100 5 10 0 0 0 0 1
device=RESISTOR (3W)
T 60900 41000 5 10 1 1 0 0 1
refdes=R18
T 61300 41000 5 10 1 1 0 0 1
value=22K
}
N 60800 41600 60250 41600 4
N 60250 40800 60800 40800 4
C 61000 47000 1 0 0 resistor-1.sym
{
T 61300 47400 5 10 0 0 0 0 1
device=RESISTOR
T 61100 47300 5 10 1 1 0 0 1
refdes=R16
T 61500 47300 5 10 1 1 0 0 1
value=360R
}
C 49900 48200 1 0 0 vcc-2.sym
C 49900 47000 1 0 0 ground.sym
C 49900 48200 1 270 0 capacitor-2.sym
{
T 50600 48000 5 10 0 0 270 0 1
device=POLARIZED_CAPACITOR
T 50400 48000 5 10 1 1 270 0 1
refdes=C4
T 50800 48000 5 10 0 0 270 0 1
symversion=0.1
T 49600 47900 5 10 1 1 0 0 1
value=10uF
}
C 43800 48400 1 0 0 vcc-2.sym
C 43800 47200 1 0 0 ground.sym
C 43800 48400 1 270 0 capacitor-2.sym
{
T 44500 48200 5 10 0 0 270 0 1
device=POLARIZED_CAPACITOR
T 44300 48200 5 10 1 1 270 0 1
refdes=C1
T 44700 48200 5 10 0 0 270 0 1
symversion=0.1
T 43500 48100 5 10 1 1 0 0 1
value=10uF
}
C 47000 50900 1 0 0 vcc-2.sym
C 49200 50600 1 0 0 ground.sym
C 47200 50700 1 0 0 led-1.sym
{
T 48000 51300 5 10 0 0 0 0 1
device=LED
T 48000 51100 5 10 1 1 0 0 1
refdes=LED1
T 48000 51500 5 10 0 0 0 0 1
symversion=0.1
}
C 48500 50800 1 0 0 resistor-1.sym
{
T 48800 51200 5 10 0 0 0 0 1
device=RESISTOR
T 48600 51100 5 10 1 1 0 0 1
refdes=R1
T 49000 51100 5 10 1 1 0 0 1
value=360R
}
N 48500 50900 48100 50900 4
N 60300 47100 61000 47100 4
N 61900 47100 62600 47100 4
N 62600 46700 62600 47600 4
N 60300 46500 62200 46500 4
C 63500 43500 1 0 0 connector3-2.sym
{
T 64200 45200 5 10 1 1 0 6 1
refdes=T2
T 63800 45150 5 10 0 0 0 0 1
device=7.5mm SCREW TERMINAL
T 63800 45350 5 10 0 0 0 0 1
footprint=SIP3N
}
N 63500 43900 62600 43900 4
N 62600 43900 62600 42900 4
N 63600 42900 62600 42900 4
N 62600 45800 62600 44700 4
N 62600 44700 63500 44700 4
C 60900 43700 1 0 0 ground.sym
{
T 60900 43400 5 10 1 1 0 0 1
value=Earth
}
N 63500 44300 61100 44300 4
N 61100 44300 61100 44000 4
T 40300 50200 9 10 1 0 0 0 1
+5V
T 40300 49300 9 10 1 0 0 0 1
GND
T 40300 49900 9 10 1 0 0 0 1
D-
T 40300 49600 9 10 1 0 0 0 1
D+
C 45500 43000 1 0 0 resistor-1.sym
{
T 45800 43400 5 10 0 0 0 0 1
device=RESISTOR
T 45600 43300 5 10 1 1 0 0 1
refdes=R12
T 46000 43300 5 10 1 1 0 0 1
value=1K
}
N 41800 43100 45500 43100 4
N 46400 43100 50200 43100 4
C 45500 42700 1 0 0 resistor-1.sym
{
T 45800 43100 5 10 0 0 0 0 1
device=RESISTOR
T 45600 43000 5 10 1 1 0 0 1
refdes=R11
T 46000 43000 5 10 1 1 0 0 1
value=1K
}
N 41600 42800 45500 42800 4
N 46400 42800 50400 42800 4
N 41400 42500 50600 42500 4
C 47300 48600 1 0 0 resistor-1.sym
{
T 47600 49000 5 10 0 0 0 0 1
device=RESISTOR
T 47400 48900 5 10 1 1 0 0 1
refdes=R6
T 47800 48900 5 10 1 1 0 0 1
value=360R
}
C 48200 48500 1 0 0 led-1.sym
{
T 49000 49100 5 10 0 0 0 0 1
device=LED
T 49000 48900 5 10 1 1 0 0 1
refdes=LED2
T 49000 49300 5 10 0 0 0 0 1
symversion=0.1
}
C 48900 48400 1 0 0 ground.sym
C 49300 41500 1 0 0 vcc-2.sym
C 49300 40600 1 0 0 ground.sym
N 54100 47500 53800 47500 4
C 44700 41500 1 0 0 vcc-2.sym
C 44700 40600 1 0 0 ground.sym
N 47100 41500 47100 43100 4
N 47650 41200 46900 41200 4
N 46900 41200 46900 43400 4
N 49050 41200 49700 41200 4
N 49700 41200 49700 42800 4
N 41800 46200 41800 43100 4
N 42000 46000 42000 43400 4
N 43050 41500 42500 41500 4
N 42500 41500 42500 43100 4
N 43050 41200 42300 41200 4
N 42300 41200 42300 43400 4
N 44450 41200 45200 41200 4
N 45200 41200 45200 42800 4
N 47100 41500 47650 41500 4
N 56300 50400 56300 41200 4
N 56300 41200 58450 41200 4
C 62900 51400 1 90 0 triac-1.sym
{
T 62000 51700 5 10 0 0 90 0 1
device=TRIAC
T 62300 51700 5 10 1 1 90 0 1
refdes=D1
T 63100 51400 5 10 1 1 90 0 1
value=BTA06-600B
}
C 58200 51400 1 0 0 ground.sym
N 58400 52100 58400 51700 4
C 57200 52600 1 0 0 resistor-1.sym
{
T 57500 53000 5 10 0 0 0 0 1
device=RESISTOR
T 57300 52900 5 10 1 1 0 0 1
refdes=R9
T 57700 52900 5 10 1 1 0 0 1
value=470R
}
N 58100 52700 58400 52700 4
C 61000 52600 1 0 0 resistor-1.sym
{
T 61300 53000 5 10 0 0 0 0 1
device=RESISTOR
T 61100 52900 5 10 1 1 0 0 1
refdes=R15
T 61500 52900 5 10 1 1 0 0 1
value=360R
}
N 60300 52700 61000 52700 4
N 61900 52700 62600 52700 4
N 60300 52100 62200 52100 4
C 63500 49100 1 0 0 connector3-2.sym
{
T 64200 50800 5 10 1 1 0 6 1
refdes=T1
T 63800 50750 5 10 0 0 0 0 1
device=7.5mm SCREW TERMINAL
T 63800 50950 5 10 0 0 0 0 1
footprint=SIP3N
}
N 63500 49500 62600 49500 4
N 62600 51400 62600 50300 4
N 62600 50300 63500 50300 4
C 60900 49300 1 0 0 ground.sym
{
T 60900 49000 5 10 1 1 0 0 1
value=Earth
}
N 63500 49900 61100 49900 4
N 61100 49900 61100 49600 4
N 62600 49500 62600 48500 4
N 63600 48500 62600 48500 4
N 57200 52700 50600 52700 4
N 50600 52700 50600 49500 4
N 50600 49500 51200 49500 4
N 56700 47100 56700 52400 4
N 50900 52400 56700 52400 4
N 50900 52400 50900 49700 4
N 50900 49700 51200 49700 4
N 56700 47100 57200 47100 4
N 47100 40900 47100 40200 4
N 47100 40200 54000 40200 4
N 54000 40200 54000 47500 4
N 47900 47500 47300 47500 4
N 47600 47500 47600 44000 4
N 44400 44000 47600 44000 4
N 44400 44000 44400 41900 4
N 44400 41900 41800 41900 4
N 41800 41900 41800 40900 4
N 41800 40900 43050 40900 4
C 54900 48500 1 0 0 led-1.sym
{
T 55700 49100 5 10 0 0 0 0 1
device=LED
T 55700 48900 5 10 1 1 0 0 1
refdes=LED3
T 55700 49300 5 10 0 0 0 0 1
symversion=0.1
}
C 55600 48400 1 0 0 ground.sym
C 54000 48600 1 0 0 resistor-1.sym
{
T 54100 48900 5 10 1 1 0 0 1
refdes=R7
T 54500 48900 5 10 1 1 0 0 1
value=360R
T 54300 49000 5 10 0 0 0 0 1
device=RESISTOR
}
N 54000 48700 54000 47700 4
N 54000 47700 53800 47700 4
N 47100 40900 47650 40900 4
C 45500 43300 1 0 0 resistor-1.sym
{
T 45800 43700 5 10 0 0 0 0 1
device=RESISTOR
T 45600 43600 5 10 1 1 0 0 1
refdes=R13
T 46000 43600 5 10 1 1 0 0 1
value=1K
}
N 46400 43400 50000 43400 4
C 63500 40400 1 0 0 connector3-2.sym
{
T 64200 42100 5 10 1 1 0 6 1
refdes=T3
T 63800 42050 5 10 0 0 0 0 1
device=7.5mm SCREW TERMINAL
T 63800 42250 5 10 0 0 0 0 1
footprint=SIP3N
}
N 61700 41600 63500 41600 4
N 61700 40800 63500 40800 4
C 62900 40250 1 0 0 ground.sym
{
T 62900 39950 5 10 1 1 0 0 1
value=Earth
}
N 63500 41200 63100 41200 4
N 63100 41200 63100 40550 4
C 60650 40700 1 0 1 h11aa1.sym
{
T 59350 41750 5 10 1 1 0 6 1
device=H11AA1
T 60000 41750 5 10 1 1 0 6 1
refdes=OC3
T 59450 41800 5 10 0 1 0 6 1
footprint=DIP-6
}
C 58400 46300 1 0 0 moc3020.sym
{
T 58675 47325 5 10 1 1 0 0 1
device=MOC3020
T 59650 47325 5 10 1 1 0 0 1
refdes=OC2
T 58400 46300 5 10 0 0 0 0 1
footprint=DIP-6
}
C 58400 51900 1 0 0 moc3020.sym
{
T 58675 52925 5 10 1 1 0 0 1
device=MOC3020
T 59650 52925 5 10 1 1 0 0 1
refdes=OC1
T 58400 51900 5 10 0 0 0 0 1
footprint=DIP-6
}
C 44700 45400 1 0 0 ATmega48-1.sym
{
T 44800 50200 5 10 0 0 0 0 1
footprint=DIP28N
T 47000 50000 5 10 1 1 0 6 1
refdes=MCU1
T 45000 50000 5 10 1 1 0 0 1
device=ATmega48
}
C 51200 45400 1 0 0 ATmega48-1.sym
{
T 51300 50200 5 10 0 0 0 0 1
footprint=DIP28N
T 53500 50000 5 10 1 1 0 6 1
refdes=MCU2
T 51500 50000 5 10 1 1 0 0 1
device=ATmega48
}
C 43050 40600 1 0 0 AVR_ISP6-1.sym
{
T 44150 41800 5 10 1 1 0 6 1
refdes=H1
T 43350 42050 5 10 0 0 0 0 1
device=HEADER6
T 43350 42250 5 10 0 0 0 0 1
footprint=CON_HDR-254P-3C-2R-6N__Molex_8624-Series
}
N 44900 41500 44450 41500 4
N 44900 40900 44450 40900 4
C 47650 40600 1 0 0 AVR_ISP6-1.sym
{
T 48750 41800 5 10 1 1 0 6 1
refdes=H2
T 47950 42050 5 10 0 0 0 0 1
device=HEADER6
T 47950 42250 5 10 0 0 0 0 1
footprint=CON_HDR-254P-3C-2R-6N__Molex_8624-Series
}
N 49500 41500 49050 41500 4
N 49050 40900 49500 40900 4
C 62400 47600 1 0 0 generic-power.sym
{
T 62600 47850 5 10 1 1 0 3 1
net=AC:1
}
N 62600 52300 62600 53200 4
C 62400 53200 1 0 0 generic-power.sym
{
T 62600 53450 5 10 1 1 0 3 1
net=AC:1
}
C 62500 41600 1 0 0 generic-power.sym
{
T 62700 41850 5 10 1 1 0 3 1
net=AC:1
}
C 62500 40800 1 0 0 generic-power.sym
{
T 62700 41050 5 10 1 1 0 3 1
net=AC:2
}
C 63400 42900 1 0 0 generic-power.sym
{
T 63600 43150 5 10 1 1 0 3 1
net=AC:2
}
C 63400 48500 1 0 0 generic-power.sym
{
T 63600 48750 5 10 1 1 0 3 1
net=AC:2
}
