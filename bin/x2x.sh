#!/bin/sh

pkill x2x
daemon -cf x2x -from :0 -to tyl:0 -north
