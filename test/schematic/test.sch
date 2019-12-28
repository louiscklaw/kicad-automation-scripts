EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Device:R R1
U 1 1 5E06DC89
P 5350 1700
F 0 "R1" H 5420 1746 50  0000 L CNN
F 1 "R" H 5420 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5280 1700 50  0001 C CNN
F 3 "~" H 5350 1700 50  0001 C CNN
	1    5350 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E06DDF2
P 6050 1700
F 0 "R2" H 6120 1746 50  0000 L CNN
F 1 "R" H 6120 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_0815_2038Metric" V 5980 1700 50  0001 C CNN
F 3 "~" H 6050 1700 50  0001 C CNN
	1    6050 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1550 5350 1000
Wire Wire Line
	5350 1000 6050 1000
Wire Wire Line
	6050 1000 6050 1550
Wire Wire Line
	5350 1850 5350 2450
Wire Wire Line
	5350 2450 6050 2450
Wire Wire Line
	6050 2450 6050 1850
$EndSCHEMATC
