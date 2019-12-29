EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 8500 5500
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L taobao-r:R1R0 R1
U 1 1 5E082B15
P 1300 1500
F 0 "R1" H 1359 1546 50  0000 L CNN
F 1 "R1R0" H 1359 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_4020_10251Metric" H 1300 1500 50  0001 C CNN
F 3 "~" H 1300 1500 50  0001 C CNN
	1    1300 1500
	1    0    0    -1  
$EndComp
$Comp
L taobao-r:R1R0 R2
U 1 1 5E082CF4
P 1950 1500
F 0 "R2" H 2009 1546 50  0000 L CNN
F 1 "R1R0" H 2009 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_4020_10251Metric" H 1950 1500 50  0001 C CNN
F 3 "~" H 1950 1500 50  0001 C CNN
	1    1950 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1400 1300 1250
Wire Wire Line
	1300 1250 1950 1250
Wire Wire Line
	1950 1250 1950 1400
Wire Wire Line
	1300 1600 1300 1750
Wire Wire Line
	1300 1750 1950 1750
Wire Wire Line
	1950 1750 1950 1600
$Sheet
S 3700 1200 750  650 
U 5E0832B3
F0 "test_proj2-1.sch" 50
F1 "test_proj2-1.sch" 50
$EndSheet
$EndSCHEMATC
