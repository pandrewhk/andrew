#!/bin/sh

screen -AxRR ses -X select "$@"
#sleep 1
#xte -x :0 "keyup Alt_L" "keydown Caps_Lock" "key 1" "keyup Caps_Lock" "keydown Alt_L"
