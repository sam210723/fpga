@echo off

REM Load compiled firmware into flash
icesprog -o 0x100000 picosoc_firmware.bin
