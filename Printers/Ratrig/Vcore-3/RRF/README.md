These macros are not universal yet and are designed to function with my RRF configuration. They should provide a reasonable starting point to get you up and running though!

1. Place klicky_pick and klicky_place into the macros folder. You will need to change the positions and test the pick/place routine - My configuration uses 0,0 as the center of the bed.
2. Update config.g (overwrite lines related to probe definition and global variables)
3. update homez and homeall to include checks on whether to pick probe up or not
4. update mesh.g 
5. update bed.g

