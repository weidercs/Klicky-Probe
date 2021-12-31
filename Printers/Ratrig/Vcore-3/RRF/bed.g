; this script compensates for what the Z offset is
; so if G31 P500 X-30 Y-15 Z1.7 then first probe will be at
; X30 Y20 (when G30 P0 X0 Y5)
if global.auto_dock = true
  M98 P"0:/macros/klicky_pick"

M561 ; clear any bed transform

G30 P0 X-150 Y-115 Z-99999 ; probe near a leadscrew
G30 P1 X0 Y115 Z-99999 ; probe near a leadscrew
G30 P2 X150 Y-115 Z-99999 S3 ; probe near a leadscrew and calibrate 3 motors

if global.auto_dock = true
  M98 P"0:/macros/klicky_place"