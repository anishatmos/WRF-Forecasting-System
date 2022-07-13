#!/bin/bash

x=$(date +"%Y%m%d")

i=36

year=$(date -d +2day +%Y)
month=$(date -d +2day +%m)
day=$(date -d +2day +%d)

h=00

URL='https://ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/gfs.'

wget -O /home/ats/Build_WRF/Data/gfs.$year-$month-${day}_$h.grib2 ${URL}${x}/12/atmos/gfs.t12z.pgrb2.0p25.f0${i}

