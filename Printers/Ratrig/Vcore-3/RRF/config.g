; General preferences
G90                                     ; send absolute coordinates...
M83                                     ; ...but relative extruder moves
M550 P"V-Core 3"                        ; set printer name
M669 K1                                 ; CoreXY
G29 S1                                  ; Set Units to Millimeters

; Network
M552 P0.0.0.0 S1                        ; enable network and acquire dynamic address via DHCP
M586 P0 S1                              ; enable HTTP
M586 P1 S0                              ; disable FTP
M586 P2 S0                              ; disable Telnet

; Drives
M569 P0.0 S0 D3                         ; physical drive 0.0 goes backwards
M569 P0.1 S0 D3                         ; physical drive 0.1 goes backwards
M569 P0.2 S0 D3                         ; physical drive 0.2 goes backwards
M569 P0.3 S1 D2                         ; physical drive 0.3 goes forwards
M569 P0.4 S1 D2                         ; physical drive 0.4 goes forwards
M569 P0.5 S1 D2                         ; physical drive 0.5 goes forwards
M584 X0.4 Y0.3 Z0.0:0.1:0.2 E0.5        ; set drive mapping
M350 X16 Y16 Z16 E16 I1                 ; configure microstepping with interpolation

M92 X80.00 Y80.00 Z800.00               ; set steps per mm
M906 X1200 Y1200 Z800I30               ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                 ; Set idle timeout

M566 X400.00 Y400.00 Z6.00 E300.00 P1          ; set maximum instantaneous speed changes (mm/min)
M203 X10800.00 Y10800.00 Z1000.00 E3600.00     ; set maximum speeds (mm/min)
M201 X4000.00 Y4000.00 Z100.00 E600.00        ; set accelerations (mm/s^2) E3600

; Axis Limits
M208 X-185.25 Y-149 Z0 S1                               ; set axis minima
M208 X185.25 Y149 Z375 S0                         ; set axis maxima

; Endstops
M574 X1 S1 P"xstop"                           ; configure active high endstops
M574 Y2 S1 P"ystop"                           ; configure active high endstops
M574 Z1 S2                                     ; configure Z-probe endstop for low end on Z

M671 X-228.5:-19.5:228.5 Y-169.5:202:-169.5 S5       ; define positions of Z leadscrews or bed levelling screws
M557 X-125:125 Y-130:120 P5                        ; define 5x5 mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950 A"Bed"    ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"bedheat" T0                                     ; create bed heater output on out5 and map it to sensor 0
M307 H0 B0 S1.00                                       ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                ; map heated bed to heater 0
M143 H0 S112                                           ; set temperature limit for heater 0 to 110C

;; Run Bed PID Tune!! Bellow is an example for a 300x300 bed
;; M307 H0 A303.1 C356.7 D1.4 S1.00 V24.0 B0
M307 H0 B0 R0.594 C27.1 D3.95 S1.00

; Fans
M950 F0 C"fan0" Q500                   ; create fan 0 on pin out3 and set its frequency
M106 P0 C"Hotend Fan" S0 H1 T45 L255   ; set fan 0 name and value. Thermostatic control turned on for Hotend
M950 F1 C"fan1" Q500                   ; create fan 1 on pin out4 and set its frequency
M106 P1 C"Layer Fan" S0 H-1 L255       ; set fan 1 name and value. Thermostatic control is turned off

; Tools
M563 P0 D0 H1 F1           ; define tool 0
G10 P0 X0 Y0 Z0            ; set tool 0 axis offsets
G10 P0 R0 S0               ; set initial tool 0 active and standby temperatures to 0C

M950 H1 C"e0heat" T1         ; create nozzle heater output on out2 and map it to sensor 1
M307 H1 B0 S1.00           ; disable bang-bang mode for heater and set PWM limit
M143 H1 S300               ; set the maximum temperature in C for heater

; EVA 2 / BMG / E3D V6

M92 E655          ; set extruder steps per mm, bmg wind 1.8deg
M906 E600         ; set extruder motor current (mA) and idle factor in per cent

M308 S1 P"e0temp" Y"thermistor" T100000 B4725 C7.060000e-8 A"Hotend"  
;; Run Heater PID Tune!! 
;; M307 H1 A751.5 C196.6 D4.7 S1.00 V23.9 B0
M307 H1 B0 R2.156 C173.8:95.3 D5.41 S1.00 V24.1

; Z-Probe
M558 P5 C"zprobe.in" H2 F50 T5000 A3       ; set Z probe type to unmodulated and the dive height + speeds
G31 P200 X-17.155 Y-24.826 Z3.861           ; set Z probe trigger value, offset and trigger height, more Z means closer to the bed
;; BLTouch
;M950 S0 C"zprobe.mod"                 ; Create a servo pin on io2
;M558 P9 C"zprobe.in" H10 F240 T10800 A5    ; set Z probe type to unmodulated and the dive height + speeds
;G31 P25 X31 Y-31.75 Z0.978         ; set Z probe trigger value, offset and trigger height, more Z means closer to the bed


M404 N1.75 D0.4                                 ; Filament width and nozzle diameter
T0

; Pressure Advance
; M572 D0 S0.10

; Global variables
global auto_dock = true
