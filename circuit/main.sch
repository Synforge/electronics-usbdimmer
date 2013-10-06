v 20110115 2
C 44700 45400 1 0 0 ATmega8-1.sym
{
T 44800 50200 5 10 0 0 0 0 1
footprint=DIP28N
T 47000 50000 5 10 1 1 0 6 1
refdes=MCU1
T 44800 51000 5 10 0 0 0 0 1
device=ATmega8
}
C 51200 45400 1 0 0 ATmega8-1.sym
{
T 51300 50200 5 10 0 0 0 0 1
footprint=DIP28N
T 53500 50000 5 10 1 1 0 6 1
refdes=MCU2
T 51300 51000 5 10 0 0 0 0 1
device=ATmega8
}
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
refdes=C2
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
refdes=C1
T 42700 44200 5 10 0 0 90 0 1
symversion=0.1
T 43100 44200 5 10 1 1 90 0 1
value=22pF
}
N 43400 44000 44100 44000 4
C 48300 47500 1 0 0 vcc-2.sym
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
refdes=R1
T 43300 50000 5 10 1 1 0 0 1
value=68R
}
C 43300 49200 1 0 0 resistor-1.sym
{
T 43600 49600 5 10 0 0 0 0 1
device=RESISTOR
T 43500 49500 5 10 1 1 0 0 1
refdes=R2
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
refdes=R3
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
}
C 42800 48400 1 90 0 zener-2.sym
{
T 42300 48800 5 10 0 0 90 0 1
device=ZENER_DIODE
T 42500 48700 5 10 1 1 90 0 1
refdes=Z2
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
N 42000 46000 42000 43200 4
N 42000 43200 50000 43200 4
N 50000 43200 50000 46000 4
N 50000 46000 51200 46000 4
N 44700 46200 41800 46200 4
N 41800 46200 41800 43000 4
N 41800 43000 50200 43000 4
N 50200 43000 50200 46200 4
N 50200 46200 51200 46200 4
N 44700 46400 41600 46400 4
N 41600 42800 41600 46400 4
N 41600 42800 50400 42800 4
N 50400 42800 50400 46400 4
N 50400 46400 51200 46400 4
N 44700 46600 41400 46600 4
N 41400 46600 41400 42600 4
N 41400 42600 50600 42600 4
N 50600 42600 50600 46600 4
N 50600 46600 51200 46600 4
N 44700 47000 40800 47000 4
N 40800 47000 40800 42200 4
N 40800 42200 50900 42200 4
N 50900 42200 50900 45800 4
N 50900 45800 51200 45800 4
C 47300 47400 1 0 0 resistor-1.sym
{
T 47600 47800 5 10 0 0 0 0 1
device=RESISTOR
T 47500 47700 5 10 1 1 0 0 1
refdes=R4
T 47800 47700 5 10 1 1 0 0 1
value=410K
}
N 48200 47500 48500 47500 4
N 47300 46700 48500 46700 4
N 48500 46400 48500 47500 4
N 47300 46400 48500 46400 4
C 54800 47500 1 0 0 vcc-2.sym
C 53800 47400 1 0 0 resistor-1.sym
{
T 54100 47800 5 10 0 0 0 0 1
device=RESISTOR
T 54000 47700 5 10 1 1 0 0 1
refdes=R5
T 54300 47700 5 10 1 1 0 0 1
value=410K
}
N 54700 47500 55000 47500 4
N 53800 46700 55000 46700 4
N 55000 46400 55000 47500 4
N 53800 46400 55000 46400 4
C 62600 44000 1 90 0 triac-1.sym
{
T 61700 44300 5 10 0 0 90 0 1
device=TRIAC
T 62000 44300 5 10 1 1 90 0 1
refdes=D1
T 62800 44000 5 10 1 1 90 0 1
value=BTA06-600B
}
C 58100 44500 1 0 0 moc3020.sym
C 57900 44000 1 0 0 ground.sym
N 58100 44700 58100 44300 4
C 56900 45200 1 0 0 resistor-1.sym
{
T 57200 45600 5 10 0 0 0 0 1
device=RESISTOR
T 57100 45500 5 10 1 1 0 0 1
refdes=R9
T 57400 45500 5 10 1 1 0 0 1
value=470R
}
N 57800 45300 58100 45300 4
C 60100 48100 1 0 1 4N25-1.sym
{
T 59200 50100 5 10 0 0 0 6 1
device=4N25
T 58300 49900 5 10 1 1 0 0 1
refdes=OK1
}
N 53800 48700 55800 48700 4
N 55800 48700 55800 45300 4
N 55800 45300 56900 45300 4
C 57100 50900 1 0 0 vcc-2.sym
N 54800 49300 58000 49300 4
C 57800 47700 1 0 0 ground.sym
N 58000 48400 58000 48000 4
N 51200 49300 50300 49300 4
N 50300 49300 50300 50400 4
N 50300 50400 54800 50400 4
N 54800 50400 54800 49300 4
C 57200 50700 1 270 0 resistor-1.sym
{
T 57600 50400 5 10 0 0 270 0 1
device=RESISTOR
T 57500 50500 5 10 1 1 270 0 1
refdes=R6
T 57500 50200 5 10 1 1 270 0 1
value=10K
}
N 57300 50900 57300 50700 4
N 57300 49300 57300 49800 4
C 60700 49200 1 0 0 resistor-1.sym
{
T 61000 49600 5 10 0 0 0 0 1
device=RESISTOR
T 60900 49500 5 10 1 1 0 0 1
refdes=R7
T 61200 49500 5 10 1 1 0 0 1
value=20K
}
C 60700 48300 1 0 0 resistor-1.sym
{
T 61000 48700 5 10 0 0 0 0 1
device=RESISTOR
T 60900 48600 5 10 1 1 0 0 1
refdes=R8
T 61200 48600 5 10 1 1 0 0 1
value=20K
}
N 60700 49300 60100 49300 4
N 60100 48400 60700 48400 4
C 63200 49400 1 180 0 terminal-1.sym
{
T 62890 48650 5 10 0 0 180 0 1
device=terminal
T 62890 48800 5 10 0 0 180 0 1
footprint=CONNECTOR 1 1
T 62950 49350 5 10 1 1 180 6 1
refdes=AC_IN-1
}
C 63200 48500 1 180 0 terminal-1.sym
{
T 62890 47750 5 10 0 0 180 0 1
device=terminal
T 62890 47900 5 10 0 0 180 0 1
footprint=CONNECTOR 1 1
T 62950 48450 5 10 1 1 180 6 1
refdes=AC_IN-2
}
N 62300 49300 61600 49300 4
N 62300 48400 61600 48400 4
C 60700 45200 1 0 0 resistor-1.sym
{
T 61000 45600 5 10 0 0 0 0 1
device=RESISTOR
T 60800 45500 5 10 1 1 0 0 1
refdes=R10
T 61200 45500 5 10 1 1 0 0 1
value=360R
}
C 49900 48200 1 0 0 vcc-2.sym
C 49900 47000 1 0 0 ground.sym
C 49900 48200 1 270 0 capacitor-2.sym
{
T 50600 48000 5 10 0 0 270 0 1
device=POLARIZED_CAPACITOR
T 50400 48000 5 10 1 1 270 0 1
refdes=C3
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
refdes=C4
T 44700 48200 5 10 0 0 270 0 1
symversion=0.1
T 43500 48100 5 10 1 1 0 0 1
value=10uF
}
C 52600 43500 1 0 0 vcc-2.sym
C 54800 43200 1 0 0 ground.sym
C 52800 43300 1 0 0 led-1.sym
{
T 53600 43900 5 10 0 0 0 0 1
device=LED
T 53600 43700 5 10 1 1 0 0 1
refdes=LED1
T 53600 44100 5 10 0 0 0 0 1
symversion=0.1
}
C 54100 43400 1 0 0 resistor-1.sym
{
T 54400 43800 5 10 0 0 0 0 1
device=RESISTOR
T 54200 43700 5 10 1 1 0 0 1
refdes=R11
T 54600 43700 5 10 1 1 0 0 1
value=360R
}
N 54100 43500 53700 43500 4
N 60000 45300 60700 45300 4
N 61600 45300 62300 45300 4
N 62300 44900 62300 46200 4
N 60000 44700 61900 44700 4
C 63200 46300 1 180 0 terminal-1.sym
{
T 62890 45550 5 10 0 0 180 0 1
device=terminal
T 62890 45700 5 10 0 0 180 0 1
footprint=CONNECTOR 1 1
T 62950 46250 5 10 1 1 180 6 1
refdes=AC_IN-1
}
C 63200 41700 1 0 0 connector3-2.sym
{
T 63900 43400 5 10 1 1 0 6 1
refdes=TERMINAL
T 63500 43350 5 10 0 0 0 0 1
device=CONNECTOR_3
T 63500 43550 5 10 0 0 0 0 1
footprint=SIP3N
}
C 64200 41200 1 180 0 terminal-1.sym
{
T 63890 40450 5 10 0 0 180 0 1
device=terminal
T 63890 40600 5 10 0 0 180 0 1
footprint=CONNECTOR 1 1
T 63950 41150 5 10 1 1 180 6 1
refdes=AC_IN-2
}
N 63200 42100 62300 42100 4
N 62300 42100 62300 41100 4
N 63300 41100 62300 41100 4
N 62300 44000 62300 42900 4
N 62300 42900 63200 42900 4
C 60600 41900 1 0 0 ground.sym
{
T 60600 41600 5 10 1 1 0 0 1
value=Earth
}
N 63200 42500 60800 42500 4
N 60800 42500 60800 42200 4
T 40300 50200 9 10 1 0 0 0 1
+5V
T 40300 49300 9 10 1 0 0 0 1
GND
T 40300 49900 9 10 1 0 0 0 1
D-
T 40300 49600 9 10 1 0 0 0 1
D+