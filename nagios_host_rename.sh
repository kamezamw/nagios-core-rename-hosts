#!/bin/bash
# Script to rename hosts and services in Nagios Core without affecting availability data
oldhost="Raiko Company Lilongwe"
newhost="Raiko Company Blantyre"

# Edit below commands to fit your file locations and names
echo -ne '>>>                       [20%]\r'
cd /usr/local/nagios/etc/servers/ && sudo sed -i "s/$oldhost/$newhost/g" clients.cfg
sleep 2

echo -ne '>>>>>>>                   [40%]\r'
cd ../objects/ && sudo sed -i "s/$oldhost/$newhost/g" services.cfg && sudo sed -i "s/$oldhost/$newhost/g" hostgroups.cfg
sleep 2

echo -ne '>>>>>>>>>>>>>>            [60%]\r'
cd ../../var/archives/ && sudo sed -i "s/$oldhost/$newhost/g" *
sleep 2

echo -ne '>>>>>>>>>>>>>>>>>>>>>>>   [80%]\r'
cd .. && sudo sed -i "s/$oldhost/$newhost/g" nagios.log
sleep 2

echo -ne '>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\r'
sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
echo -ne '\n'
