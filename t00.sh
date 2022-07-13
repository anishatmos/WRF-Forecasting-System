#!/bin/bash

x=$(date +"%Y%m%d")

i=00

year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

h=12

URL='https://ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/gfs.'

wget -O /home/ats/Build_WRF/Data/gfs.$year-$month-${day}_$h.grib2 ${URL}${x}/12/atmos/gfs.t12z.pgrb2.0p25.f0${i}

