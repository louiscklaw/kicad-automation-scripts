EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 8500 5500
encoding utf-8
Sheet 2 2
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
L taobao-c:C1pf C1
U 1 1 5E083763
P 1750 1400
F 0 "C1" H 1842 1446 50  0000 L CNN
F 1 "C1pf" H 1842 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_2816_7142Metric" H 1750 1400 50  0001 C CNN
F 3 "~" H 1750 1400 50  0001 C CNN
	1    1750 1400
	1    0    0    -1  
$EndComp
$Comp
L taobao-c:C1pf C2
U 1 1 5E08391D
P 2300 1400
F 0 "C2" H 2392 1446 50  0000 L CNN
F 1 "C1pf" H 2392 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_2512_6332Metric_Pad1.52x3.35mm_HandSolder" H 2300 1400 50  0001 C CNN
F 3 "~" H 2300 1400 50  0001 C CNN
	1    2300 1400
	1    0    0    -1  
$EndComp
$Comp
L taobao-c:C1pf C3
U 1 1 5E083DC4
P 2750 1400
F 0 "C3" H 2842 1446 50  0000 L CNN
F 1 "C1pf" H 2842 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_2225_5664Metric_Pad1.80x6.60mm_HandSolder" H 2750 1400 50  0001 C CNN
F 3 "~" H 2750 1400 50  0001 C CNN
	1    2750 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1300 1750 1100
Wire Wire Line
	1750 1100 2300 1100
Wire Wire Line
	2750 1100 2750 1300
Wire Wire Line
	2300 1300 2300 1100
Connection ~ 2300 1100
Wire Wire Line
	2300 1100 2750 1100
Wire Wire Line
	1750 1600 2300 1600
Wire Wire Line
	2750 1600 2750 1500
Wire Wire Line
	2300 1500 2300 1600
Connection ~ 2300 1600
Wire Wire Line
	2300 1600 2750 1600
Wire Wire Line
	1750 1500 1750 1600
$EndSCHEMATC
