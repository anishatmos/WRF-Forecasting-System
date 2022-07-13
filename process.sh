#!/bin/bash
#for start time
start_year=$(date +"%Y")
start_month=$(date +"%m")
start_day=$(date +"%d")


#for end time
end_year=$(date -d +3days +"%Y")
end_month=$(date -d +3days +"%m")
end_day=$(date -d +3days +"%d")


#start_date=$(date +%Y-%m-%d_00:00:00)
end_date=$(date -d +3days +%Y-%m-%d_00:00:00)
sleep 10
#moving to WPS directory for pre-processing 
cd /home/ats/Build_WRF/WPS
#changing the start and end date inside namelist.wps DAILY

sed -i '/start_year /c start_year                     = '$start_year,$start_year,$start_year, namelist.wps
sed -i '/start_month /c start_month                   = '$start_month,$start_month,$start_month, namelist.wps
sed -i '/start_day /c start_day                       = '$start_day,$start_day,$start_day, namelist.wps

sed -i '/end_year /c end_year                         = '$end_year,$end_year,$end_year, namelist.wps
sed -i '/end_month /c end_month                       = '$end_month,$end_month,$end_month, namelist.wps
sed -i '/end_day /c end_day                           = '$end_day,$end_day,$end_day, namelist.wps



./geogrid.exe 

./link_grib.csh /home/ats/Build_WRF/Data/gfs.* 

./ungrib.exe 

./metgrid.exe 
