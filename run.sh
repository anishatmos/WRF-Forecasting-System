#!/bin/bash

#for start time
start_year=$(date +"%Y")
start_month=$(date +"%m")
start_day=$(date +"%d")


#for end time
end_year=$(date -d +3days +"%Y")
end_month=$(date -d +3days +"%m")
end_day=$(date -d +3days +"%d")


#pre-processing done. Moving to WRF directory for model run
cd /home/ats/Build_WRF/WRF/run
#changing the start and end date inside namelist.input DAILY



sed -i '/start_year /c start_year                     = '$start_year,$start_year,$start_year, namelist.input
sed -i '/start_month /c start_month                   = '$start_month,$start_month,$start_month, namelist.input
sed -i '/start_day /c start_day                       = '$start_day,$start_day,$start_day, namelist.input


sed -i '/end_year /c end_year                         = '$end_year,$end_year,$end_year, namelist.input
sed -i '/end_month /c end_month                       = '$end_month,$end_month,$end_month, namelist.input
sed -i '/end_day /c end_day                           = '$end_day,$end_day,$end_day, namelist.input



#linking met_em files from WPS-4.0.3 directory
ln -sf /home/ats/Build_WRF/WPS/met_em* .

#MODEL INITIALISATION
mpirun -np 30 ./real.exe 

#MODEL RUN/PROCESSING
mpirun -np 30 ./wrf.exe 

