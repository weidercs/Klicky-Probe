# Klipper macros

These macros are  based on the great Annex magprobe dockable probe macros "#Originally developed by Mental, modified for better use on K-series printers by RyanG and Trails", kudos to them.

That macro as since evolved into a klipper plugin that currently is pending inclusion in klipper, more information [here](https://github.com/Annex-Engineering/Quickdraw_Probe/tree/main/Klipper_Macros)

Would alse like to thank the Voron discord community and VoronDesign for all the work, suggestions and support that they have given to improve on the macros.

The macros are currently separated by funcion, there is klicky-probe.cfg that should include the remaining files, this both keeps klipper's printer.cfg cleaner and allow for backward compatibility.

The remaining files are the klicky-macros.cfg that stores all the general macros (like the dock and attach macros, this file is required on all the printers), the klicky-variables.cfg where it's necessary to configure the dock location and do other printer specific configurations and the klipper helper files for specific functions.

The helper files, work by expanding the standard klipper function with a attach and dock command, so that you can use all the klipper commands without the need to manually attach and dock the printer.



Right now the macros are divided in multiple files, that way it is much easier to upgrade, configure and maintain

| File                             | v2.4               | v1.8               | Legacy             | Trident            | v0                 | Tiny-M             | V-core3            |
| -------------------------------- | ------------------ | ------------------ | ------------------ | ------------------ | ------------------ | ------------------ | ------------------ |
| klicky-probe.cfg                 | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| klick-variables.cfg              | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| klicky-bed-mesh-calibrate.cfg    | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Klicky-quad-gantry-level.cfg     | :heavy_check_mark: | :x:                | :x:                | :x:                | :x:                | :x:                | :x:                |
| Klicky-screws-tilt-calculate.cfg | :x:                | :heavy_check_mark: | :heavy_check_mark: | :x:                | :heavy_check_mark: | :heavy_check_mark: | :grey_question:    |
| klicky-z-tilt-adjust.cfg         | :x:                | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :x:                | :x:                | :heavy_check_mark: |



* klicky-probe.cfg (includes all the necessary files in klipper)
* klick-variables.cfg, stores all the Klicky variables, printer specific, should not be necessary to update very often
* klicky-bed-mesh-calibrate.cfg, bed mesh helper scripts, assumes bed mesh is already configured, includes a commented example, further help on setup [here](https://www.klipper3d.org/Bed_Mesh.html#bed-mesh)
* Klicky-quad-gantry-level.cfg, Quad Gantry Level helper script, allows on machines with four Z independent motors to level the bed automatically, assumes QGL is already configured (it's used on a V2.4 to level the gantry relative to the bed), further help [here](https://www.klipper3d.org/Config_Reference.html?h=quad#quad_gantry_level)
* Klicky-screws-tilt-calculate.cfg, screws tilt adjust helper script, knowing where the bed screws are, it will assist in leveling the bed by calculating on the number of times each screw should be rotated, assumes that the configuration is already defined, further help on setup [here](https://www.klipper3d.org/Manual_Level.html#adjusting-bed-leveling-screws-using-the-bed-probe)
* klicky-z-tilt-adjust.cfg, Z tilt adjust helper script, allows on machines with two or three Z independent motors to level the bed automatically, assumes that the configuration is already defined, further help on setup [here](https://www.klipper3d.org/Config_Reference.html?h=z_tilt#z_tilt)



## printer.cfg configuration 

Download the appropriate files (or the zip containing them all and delete the ones that are not relevant) and upload it to your klipper Config folder.

Check the klicky-probe.cfg, remove or comment the macros that are not required for your printer, or that you do not want to implement.

Then edit klicky-variables.cfg, for klicky to operate properly there are some configurations that need to be checked, otherwise your printer will stop working.

Then open your printer.cfg file, comment out *safe_z_home* or *homing_override*, if you have them (the macros will take care of homing) and add the following line before the "Macros" Section.

`[include Klicky-Probe.cfg]`

You now need to configure the probe pin, that is printer specific, and the details are on your printer configuration guide.

Regarding you print start and end macros, with the helper scripts implemented, they do not need to be changed, if however you would like to reduce the times that the toolhead attaches and docks the probe, you can Attach_Probe_Lock that prevents the probe to be docked after an operation that normally would dock the probe. **BEWARE that the probe may hit the bed depending on what you are doing**. When you don't need the probe attached anymore, run Dock_Probe_Unlock to finally dock the probe.
