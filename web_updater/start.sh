#!/bin/sh
# Use full paths ending with /. Make sure tables/ and templates/ folders exist in FULL_PATH_TO_OUTPUT
FULL_PATH_TO_DATA=~/Meownodes/data/export/4d455743/
FULL_PATH_TO_OUTPUT=~/website/
./data_update.py $FULL_PATH_TO_DATA $FULL_PATH_TO_OUTPUT > logs/updater.log &
