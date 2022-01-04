; BLTouch
;M280 P0 S160           ; Precautionary alarm release
;M280 P0 S90            ; Ensure the pin is raised
if global.auto_dock = true
  M98 P"0:/macros/klicky_pick"

;G91               ; relative positioning
;G1 H2 Z5 F6000    ; lift Z relative to current position
G90               ; absolute positioning
G1 X17.155 Y24.826 F10000 ; go to first probe point (accounting for probe offset)
G30               ; home Z by probing the bed

if global.auto_dock = true
  M98 P"0:/macros/klicky_place"


