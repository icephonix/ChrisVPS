#!/bin/sh
cd $HOME/app
wget https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip -d v2ray1 v2ray-linux-64.zip
cd v2ray1
chmod 777 *
cd ..
rm -rf v2ray-linux-64.zip
mv $HOME/app/v2ray1/v2ray $HOME/app/python
mv $HOME/app/v2ray1/v2ctl $HOME/app/v2ctl
rm -rf $HOME/app/v2ray1
uuid=`cat /proc/sys/kernel/random/uuid`
path=`echo $uuid | cut -f1 -d'-'`
echo '{"inbounds":[{"port":8000,"protocol":"vmess","settings":{"clients":[{"id":"'$uuid'","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"/'$path'"}}}],"outbounds":[{"protocol":"freedom","settings":{}}]}'>$HOME/app/config.json
./v2ctl  config config.json>server.pb
#zip -o c.zip c.pb
#echo 'applications:'>manifest.yml
#echo '- path: .'>>manifest.yml
#echo '  name: '$appname''>>manifest.yml
#echo '  random-route: true'>>manifest.yml
#echo '  memory: '$ramsize'M'>>manifest.yml
rm config.json
#rm c.pb
rm v2ctl
#ibmcloud target --cf
#ibmcloud cf push
#domain=`ibmcloud cf app $appname | grep routes | cut -f2 -d':' | sed 's/ //g'`
#vmess=`echo '{"add":"'$domain'","aid":"64","host":"","id":"'$uuid'","net":"ws","path":"/'$path'","port":"443","ps":"IBM_Cloud","tls":"tls","type":"none","v":"2"}' | base64 -w 0`
#cd ..
echo 地址: $domain
echo UUID: $uuid
echo path: /$path
echo vmess://$vmess
pkill -9 python && ./python -config server.pb >/dev/null &
cd ..
#rm -rf *
