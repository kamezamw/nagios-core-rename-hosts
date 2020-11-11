#!/bin/bash
# Script to rename hosts and services in Nagios Core without affecting availability data
oldhost="Raiko Company Lilongwe"
newhost="Raiko Company Blantyre"

# Edit below commands to fit your file locations and names
cd /usr/local/nagios/etc/servers/ && sudo sed -i "s/$oldhost/$newhost/g" clients.cfg
cd ../objects/ && sudo sed -i "s/$oldhost/$newhost/g" services.cfg && sudo sed -i "s/$oldhost/$newhost/g" hostgroups.cfg
cd ../../var/archives/ && sudo sed -i "s/$oldhost/$newhost/g" *
cd .. && sudo sed -i "s/$oldhost/$newhost/g" nagios.log
sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg