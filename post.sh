#!/bin/bash
#moving to arwpost directory

cd /home/subrat/VaaT/ARWpost

#Editing namelist.ARWpost

################################## edited to post process nextday #################################

sed -i '/start_date   =/c start_date   = '$start_date,$start_date,$start_date, namelist.wps
sed -i '/end_date   =/c end_date   = '$end_date,$end_date,$end_date, namelist.wps

sed -i s/$(date -d -2days +%F_12:00:00)/$(date -d -1days +%F_12:00:00)/g ./namelist.ARWpost
sed -i s/$(date -d +1days +%F_12:00:00)/$(date -d +2days +%F_12:00:00)/g ./namelist.ARWpost

sed -i s/wrfout_d02_$(date -d -2days +%F_12:00:00)/wrfout_d02_$(date -d -1days +%F_12:00:00)/g ./namelist.ARWpost
sed -i s/3doutput$(date -d -2days +%Y%m%d)/3doutput$(date -d yesterday +%Y%m%d)/g ./namelist.ARWpost 
#### old format ################

./ARWpost.exe

#copying binary output files to archives
cp output.ctl /home/subrat/VaaT/output/9km/ctl/3d$(date -d yesterday +%Y%m%d).ctl
cp output.dat /home/subrat/VaaT/output/9km/ctl/3d$(date -d yesterday +%Y%m%d).dat

#plotting diagrams using grads
grads -a 1 -lbc met.gs

#copying plots to archives
cp met.png /home/subrat/VaaT/output/9km/figure/3d$(date -d yesterday +%Y%m%d).png


/Build_WRF/WRF/run
