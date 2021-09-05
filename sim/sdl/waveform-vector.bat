@echo off
title FFmpeg Waveform and Vectorscope

REM Waveform and Vectorscope using ffmpeg to verify output of SMPTE Test Pattern Generators

ffplay -fs -window_title "FFmpeg Waveform and Vectorscope" -i %1 -vf "split=4[vid][vec][wavh][wavv],[vec]vectorscope=mode=color3:graticule=green[vec],[wavh]waveform=mode=column:graticule=green:components=1:display=overlay[wavh],[wavv]waveform=mode=row:components=1:display=overlay[wavv],[vid][wavh]vstack[s1],[wavv][vec]vstack[s2],[s1][s2]hstack[out]"
