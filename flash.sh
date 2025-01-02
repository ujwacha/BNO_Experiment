#! /bin/bash
arm-none-eabi-objcopy -O binary -S build/robot_top.elf build/robot_top.bin

if (( $(st-info --probe 2>/dev/null | wc -l) == 1 ))
then
    CubeProgrammer -c port=JLINK -w build/robot_top.bin 0x8000000 -c port=JLINK reset=SWrst
else
    CubeProgrammer -c port=SWD -w build/robot_top.bin 0x8000000 -c port=SWD reset=SWrst
fi
