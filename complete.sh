#!/bin/bash

#download the data
sh download.sh


#for start time
start_year=$(date +"%Y")
start_month=$(date +"%m")
start_day=$(date +"%d")


#for end time
end_year=$(date -d +3days +"%Y")
end_month=$(date -d +3days +"%m")
end_day=$(date -d +3days +"%d")


#cleaning yesterday's outputs
cd /home/ats/Build_WRF/WPS
rm geo_em*
rm met_em*
rm FILE*
cd /home/ats/Build_WRF/WRF/run
rm met_em*

cd /home/ats/Build_WRF/test/
sh process.sh

sleep 10

cd /home/ats/Build_WRF/test/
sh run.sh

cd /home/ats/Build_WRF/ARWpost

grads -l l -lbc met.gs

cd /home/ats/Build_WRF/ARWpost/plots/d01/precipitation/
convert -delay 200 -loop 0 *.png animatedGIF.gif

cd /home/ats/Build_WRF/ARWpost/plots/d01/pressure/
convert -delay 200 -loop 0 *.png animatedGIF.gif

cd /home/ats/Build_WRF/ARWpost/plots/d01/temperature/
convert -delay 200 -loop 0 *.png animatedGIF.gif

cd /home/ats/Build_WRF/ARWpost/plots/d01/wind_vector/
convert -delay 200 -loop 0 *.png animatedGIF.gif

cd /home/ats/Build_WRF/ARWpost/plots/d02/precipitation/
convert -delay 200 -loop 0 *.png animatedGIF.gif

cd /home/ats/Build_WRF/ARWpost/plots/d02/pressure/
convert -delay 200 -loop 0 *.png animatedGIF.gif

cd /home/ats/Build_WRF/ARWpost/plots/d02/temperature/
convert -delay 200 -loop 0 *.png animatedGIF.gif

cd /home/ats/Build_WRF/ARWpost/plots/d02/wind_vector/
convert -delay 200 -loop 0 *.png animatedGIF.gif

echo Thank you


