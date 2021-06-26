#!/bin/bash

#[ipd - Ip to details]

#This tool can easily extract general informations of ip address using terminal...

#Youtube : https://youtube.com/channel/UCPNhwkJ4zc3FXGn-Rba6Hvg
#Facebook : https://www.facebook.com/a.onetech.9

if [ "$1" == "" ]
then
    echo  "Useage: $0 Type your Target IP address"
 echo
    echo  "E.x : /ipd.sh 10.0.0.1"
   exit
fi
res=$(curl http://ip-api.com/json/$1 -s )
status=$(echo $res | jq '.status' -r)
if [ $status == "success" ]
then 
   status=$(echo $res | jq '.status')
    echo "STATUS : $status"
   country=$(echo $res | jq '.country' -r)
   echo "COUNTRY : $country"
   city=$(echo $res | jq '.city' -r)
   echo "CITY : $city"
   region=$(echo $res | jq '.regionName' -r)
   echo "REGION : $region"
   time=$(echo $res | jq '.timezone' -r)
   echo "TIME ZONE : $time"
   currency=$(echo $res | jq '.countryCode')
   echo "CURRENCY : $currency"
   zip=$(echo $res | jq '.zip' -r)
   echo "ZIP CODE : $zip"
   isp=$(echo $res | jq '.isp' -r)
   echo "ISP : $isp" 
   org=$(echo $res | jq '.org' -r)
   echo "Organization : $org" 
   as=$(echo $res | jq '.as' -r)
   echo "ACCESS POINT : $as"
    query=$(echo $res | jq '.query' -r)
    echo "QUERY IP ADDRESS : $query"
fi
if [ $status == "fail" ]
then
  status=$(echo $res | jq '.status')
  echo  " STATUS : $status"
  message=$(echo $res | jq '.message' -r)
  echo " MESSAGE : $message"
  query=$(echo $res | jq '.query' -r)
  echo " YOUR QUERY IP : $query"
fi
