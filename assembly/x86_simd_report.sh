#!/bin/bash
printf "128-bit instructions: %d\n" $(grep "xmm" $1 -c)
printf "256-bit instructions: %d\n" $(grep "ymm" $1 -c)
printf "512-bit instructions: %d\n" $(grep "zmm" $1 -c)
