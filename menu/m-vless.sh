#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/casper/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/casper/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/casper/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
 WH='\033[1;37m'
###########- END COLOR CODE -##########
ipsaya=$(curl -sS ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/casper9/permission/main/ipmini"
checking_sc() {
    useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
    if [[ $date_list < $useexp ]]; then
        echo -ne
    else
        echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
        echo -e "$COLOR1│${NC}${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •                 ${NC}$COLOR1│$NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
        echo -e "$COLOR1│            ${RED}PERMISSION DENIED !${NC}                  │"
        echo -e "$COLOR1│   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}                             │"
        echo -e "$COLOR1│     \033[0;33mBuy access permissions for scripts${NC}          │"
        echo -e "$COLOR1│             \033[0;33mContact Your Admin ${NC}                 │"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        exit
    fi
}
checking_sc

ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)

TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=`cat /etc/xray/domain`

cd
if [ ! -e /etc/vless/akun ]; then
  mkdir -p /etc/vless/akun
fi
function add-vless(){
clear
until [[ $user =~ ^[a-zA-Z0-9_.-]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}            ${WH}• Add Vless Account •                ${NC}$COLOR1│ $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
		echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
		echo -e "$COLOR1│${NC}${COLBG1}            ${WH}• Add Vless Account •                ${NC}$COLOR1│ $NC"
		echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
	    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
        echo -e "$COLOR1│                                                 │"
        echo -e "$COLOR1│${WH} Nama Duplikat Silahkan Buat Nama Lain.          $COLOR1│"
        echo -e "$COLOR1│                                                 │"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        read -n 1 -s -r -p "Press any key to back"
	    add-vless
		fi
	done
#read -p "   Bug SNI/Host : " sni

uuid=$(cat /proc/sys/kernel/random/uuid)
until [[ $masaaktif =~ ^[0-9]+$ ]]; do
read -p "Expired (hari): " masaaktif
done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP): " iplim
done
if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi
if [ -z ${iplim} ]; then
  iplim="0"
fi
echo "${iplim}" >/etc/vless/${user}IP
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\#vl '"$user $exp $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#vlg '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&host=${domain}&type=ws&sni=bug.mu#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&security=none&encryption=none&host=${domain}&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"

vless1="$(echo $vlesslink1 | base64 -w 0)"
vless2="$(echo $vlesslink2 | base64 -w 0)"
vless3="$(echo $vlesslink3 | base64 -w 0)"

cat > /home/vps/public_html/vless-$user.txt <<-END
_______________________________
Format Vless WS (CDN)
_______________________________
- name: vless-$user-WS (CDN)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  udp: true
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
_______________________________
 Format Vless WS (CDN) Non TLS
_______________________________
- name: vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
  udp: true
    path: /vless
    headers:
      Host: ${domain}
_______________________________
 Format Vless gRPC (SNI)
_______________________________
- name: vless-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
  grpc-service-name: vless-grpc
  udp: true

_______________________________
 Format Vless WS (CDN) Non TLS Opok
_______________________________
- name: vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: true
  servername: comunity.instagram.com
  network: false
  udp: true
  ws-opts:
    path: http://tsel.me/worryfree
    headers:
      Host: ${domain}
_______________________________
 Link Vless Account
_______________________________
Link TLS : vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}
_______________________________
Link none TLS : vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}
_______________________________
Link GRPC : vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}
_______________________________
Link Opok NTLS : vless://${uuid}@${domain}:80?path=CF-RAY:http://tsel.me/worryfree&encryption=none&type=ws#${user}
_______________________________

END


TEXT="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>  Premium Vless Account</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Remarks      : </code> <code>${user}</code>
<code>Domain       : </code> <code>${domain}</code>
<code>User Limit    : </code> <code>${iplim} IP</code>
<code>ISP           : </code> <code>${ISP}</code>
<code>City           : </code> <code>${CITY}</code>
<code>Port TLS     : 443</code>
<code>Port NTLS    : 80, 8080</code>
<code>Port GRPC    : 443</code>
<code>User ID      : </code> <code>${uuid}</code>
<code>AlterId      : 0</code>
<code>Security     : auto</code>
<code>Network      : WS or gRPC</code>
<code>Path vless   : </code> <code>/vless</code>
<code>ServiceName  : </code> <code>/vless-grpc</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link TLS     :</code> 
<code>${vless1}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link NTLS    :</code> 
<code>${vless2}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link GRPC    :</code> 
<code>${vless3}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Format OpenClash : </code>
http://$domain:89/vless-$user.txt
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Expired On : </code> <code>$exp</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

clear
systemctl restart xray > /dev/null 2>&1
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}• Premium Vless Account •${NC} $COLOR1 $NC" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Remarks      ${COLOR1}: ${WH}${user}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ISP          ${COLOR1}: ${WH}$ISP" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}City         ${COLOR1}: ${WH}$CITY" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Domain       ${COLOR1}: ${WH}${domain}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}User IP      ${COLOR1}: ${WH}${iplim} IP" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS     ${COLOR1}: ${WH}443" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port none TLS${COLOR1}: ${WH}80,8080" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}id           ${COLOR1}: ${WH}${uuid}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Encryption   ${COLOR1}: ${WH}none" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Network      ${COLOR1}: ${WH}ws" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path         ${COLOR1}: ${WH}/vless" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path grpc    ${COLOR1}: ${WH}vless-grpc" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Expired On   ${COLOR1}: ${WH}$exp" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket TLS      ${WH}:${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vlesslink1}${NC}"  | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket non TLS  ${WH}:${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vlesslink2}${NC}"  | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link gRPC               ${WH}:${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vlesslink3}${NC}"  | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Format Openclash ${COLOR1}: " | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}http://$domain:89/vless-$user.txt${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC}   ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo "" | tee -a /etc/vless/akun/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function trial-vless(){
clear
cd
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}${COLBG1}            ${WH}• Trial Vless Account •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
until [[ $timer =~ ^[0-9]+$ ]]; do
read -p "Expired (Minutes): " timer
done

user=Trial-`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=0
iplim=1
if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi
if [ -z ${iplim} ]; then
  iplim="0"
fi
echo "${iplim}" > /etc/vless/${user}IP
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\#vl '"$user $exp $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#vlg '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&host=$sni&type=ws&sni=bug.mu#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&security=none&encryption=none&host=$sni&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=$sni#${user}"

vless1="$(echo $vlesslink1 | base64 -w 0)"
vless2="$(echo $vlesslink2 | base64 -w 0)"
vless3="$(echo $vlesslink3 | base64 -w 0)"

clear
echo "SHELL=/bin/sh" >/etc/cron.d/trialvless$user
echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >>/etc/cron.d/trialvless$user
echo "*/$timer * * * *  root /usr/bin/trialvless $user $timer" >>/etc/cron.d/trialvless$user

cat > /home/vps/public_html/vless-$user.txt <<-END
_______________________________
Format Vless WS (CDN)
_______________________________
- name: vless-$user-WS (CDN)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  udp: true
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
_______________________________
 Format Vless WS (CDN) Non TLS
_______________________________
- name: vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
  udp: true
    path: /vless
    headers:
      Host: ${domain}
_______________________________
 Format Vless gRPC (SNI)
_______________________________
- name: vless-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
  grpc-service-name: vless-grpc
  udp: true
_______________________________
 Format Vless WS (CDN) Non TLS Opok
_______________________________
- name: vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: true
  servername: comunity.instagram.com
  network: false
  udp: true
  ws-opts:
    path: http://tsel.me/worryfree
    headers:
      Host: ${domain}
_______________________________
 Link Vless Account
_______________________________
Link TLS : vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}
_______________________________
Link none TLS : vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}
_______________________________
Link GRPC : vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}
_______________________________
Link Opok NTLS : vless://${uuid}@${domain}:80?path=CF-RAY:http://tsel.me/worryfree&encryption=none&type=ws#${user}
_______________________________

END


TEXT="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>  Trial Premium Vless Account</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Remarks      : </code> <code>${user}</code>
<code>Domain       : </code> <code>${domain}</code>
<code>User Limit    : </code> <code>${iplim} IP</code>
<code>ISP           : </code> <code>${ISP}</code> 
<code>City           : </code> <code>${CITY}</code>
<code>Port TLS     : 443</code>
<code>Port NTLS    : 80, 8080</code>
<code>Port GRPC    : 443</code>
<code>User ID      : </code> <code>${uuid}</code>
<code>AlterId      : 0</code>
<code>Security     : auto</code>
<code>Network      : WS or gRPC</code>
<code>Path vless   : </code> <code>/vless</code>
<code>ServiceName  : </code> <code>/vless-grpc</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link TLS     :</code> 
<code>${vless1}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link NTLS    :</code> 
<code>${vless2}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link GRPC    :</code> 
<code>${vless3}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Format OpenClash : </code>
http://$domain:89/vless-$user.txt
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Expired On : </code> <code>$timer Minutes</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

clear
systemctl restart xray > /dev/null 2>&1
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}• Trial Premium Vless Account •${NC} $COLOR1 $NC" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Remarks      ${COLOR1}: ${WH}${user}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ISP          ${COLOR1}: ${WH}$ISP" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}City         ${COLOR1}: ${WH}$CITY" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Domain       ${COLOR1}: ${WH}${domain}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}User IP      ${COLOR1}: ${WH}${iplim} IP" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS     ${COLOR1}: ${WH}443" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port none TLS${COLOR1}: ${WH}80,8080" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}id           ${COLOR1}: ${WH}${uuid}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Encryption   ${COLOR1}: ${WH}none" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Network      ${COLOR1}: ${WH}ws" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path         ${COLOR1}: ${WH}/vless" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path grpc    ${COLOR1}: ${WH}vless-grpc" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Expired On   ${COLOR1}: ${WH}$timer Minutes" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket TLS      ${WH}:${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vlesslink1}${NC}"  | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket non TLS  ${WH}:${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vlesslink2}${NC}"  | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link gRPC               ${WH}:${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vlesslink3}${NC}"  | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Format Openclash ${COLOR1}: " | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}http://$domain:89/vless-$user.txt${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC}   ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo "" | tee -a /etc/vless/akun/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function limit-vless(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vlg " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}    ${WH}⇱ Limit Vless Account ⇲     ${NC} $COLOR1 $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo ""
	echo "You have no existing clients!"
	echo ""
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""
        read -n 1 -s -r -p "Press any key to back on menu"
        m-vless
	fi
 	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}    ${WH}⇱ Limit Vless Account ⇲     ${NC} $COLOR1 $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "Select the existing client you want to change ip"
	echo " ketik [0] kembali kemenu"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "     No  User   Expired"
	grep -E "^#vlg " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-vless
	fi
	fi
	done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP) New: " iplim
done
if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi
if [ -z ${iplim} ]; then
  iplim="0"
fi
user=$(grep -E "^#vlg " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
echo "${iplim}" >/etc/vless/${user}IP

TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  XRAY VLESS IP LIMIT</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>ISP      :</b> <code>$ISP $CITY </code>
<b>USERNAME :</b> <code>$user </code>
<b>IP LIMIT NEW :</b> <code>$iplim IP </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Succes Change IP LIMIT...</i>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " VLESS Account Was Successfully Change Limit IP"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo " Client Name : $user"
    echo " Limit IP    : $iplim IP"
    echo ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-vless
}
function renew-vless(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vl " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Renew Vless Account ⇲      ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""
        read -n 1 -s -r -p "Press any key to back on menu"
        m-vless
	fi
 	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "$COLOR1 ${NC}${COLBG1}     ${WH}⇱ Renew Vless Account ⇲      ${NC} $COLOR1 $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo " Select the existing client you want to renew"
	echo " ketik [0] kembali kemenu"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "     No  User   Expired"
	grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
			if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-vless
	fi
	fi
	done
read -p "Expired (days): " masaaktif
user=$(grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#vl $user $exp/#vl $user $exp4/g" /etc/xray/config.json
sed -i "s/#vlg $user $exp/#vlg $user $exp4/g" /etc/xray/config.json
clear
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>   XRAY VLESS RENEW</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>ISP      :</b> <code>$ISP $CITY </code>
<b>USERNAME :</b> <code>$user </code>
<b>EXPIRED  :</b> <code>$exp4 </code>
<code>◇━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
systemctl restart xray > /dev/null 2>&1
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " VLESS Account Was Successfully Renewed"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo " Client Name : $user"
    echo " Expired On  : $exp4"
    echo ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-vless
}
function del-vless(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vl " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Delete Vless Account ⇲     ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		read -n 1 -s -r -p "Press any key to back on menu"
        m-vless
	fi

	clear
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Delete Vless Account ⇲     ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo " Select the existing client you want to remove"
		echo " ketik [0] kembali kemenu"
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo "     No  User   Expired"
		grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
		until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
			if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-vless
	fi
	fi
	done
	user=$(grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
	uuid=$(grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
	if [ ! -e /etc/vless/akundelete ]; then
    echo "" > /etc/vless/akundelete
    fi
    clear
    echo "### $user $exp $uuid" >> /etc/vless/akundelete
	sed -i "/^#vl $user $exp/,/^},{/d" /etc/xray/config.json
	sed -i "/^#vlg $user $exp/,/^},{/d" /etc/xray/config.json
	clear
    clear
    rm /etc/vless/${user}IP >/dev/null 2>&1
    rm /home/vps/public_html/vless-$user.txt >/dev/null 2>&1
    rm /etc/vless/${user}login >/dev/null 2>&1
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Vless Account Deleted Successfully"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Client Name : $user"
    echo " Expired On  : $exp"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-vless
}

function cek-vless(){
clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '#vlg' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}              ${WH}• VLESS ONLINE NOW •               ${NC}$COLOR1│ $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"

for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi

echo -n > /tmp/ipvless.txt
data2=( `cat /var/log/xray/access.log | tail -n 150 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do

jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 100 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvless.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvless.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done

jum=$(cat /tmp/ipvless.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvless.txt | wc -l)
echo -e "$COLOR1${NC} USERNAME : \033[0;33m$akun";
echo -e "$COLOR1${NC} IP LOGIN : \033[0;33m$jum2";
echo -e ""

fi
rm -rf /tmp/ipvless.txt
done

rm -rf /tmp/other.txt
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-vless
}
function list-vless(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vl " "/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Config Vless Account ⇲     ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                read -n 1 -s -r -p "Press any key to back on menu"
        m-vless
	fi

	    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Config Vless Account ⇲     ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo " Select the existing client to view the config"
        echo " ketik [0] kembali kemenu"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  User   Expired"
        grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                	if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-vless
	fi
	fi
	done
clear
user=$(grep -E "^#vl " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
cat /etc/vless/akun/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
m-vless
}
function login-vless(){
clear
echo -e "$COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}           ${WH}• SETTING MULTI LOGIN •             ${NC}$COLOR1│ $NC"
echo -e "$COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e "${COLOR1}│ $NC SILAHKAN TULIS JUMLAH NOTIFIKASI UNTUK LOCK    ${NC}"
echo -e "${COLOR1}│ $NC AKUN USER YANG MULTI LOGIN     ${NC}"
echo -e "$COLOR1└───────────────────────────────────────────────┘${NC}"
read -rp "   Jika Mau 3x Notif baru kelock tulis 3, dst: " -e notif
cd /etc/vless
echo "$notif" > notif
clear
echo -e "$COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}           ${WH}• SETTING MULTI LOGIN •             ${NC}$COLOR1│ $NC"
echo -e "$COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e "${COLOR1}│ $NC SUCCES GANTI NOTIF LOCK JADI $notif $NC "
echo -e "$COLOR1└───────────────────────────────────────────────┘${NC}"
m-vless
}
function lock-vless(){
cd
clear
if [ ! -e /etc/vless/listlock ]; then
echo "" > /etc/vless/listlock
fi
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/vless/listlock")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Unlock Vless Account ⇲     ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo ""
		echo "You have no existing user Lock!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		read -n 1 -s -r -p "Press any key to back on menu"
        m-vless
	fi

	clear
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Unlock Vless Account ⇲     ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo " Select the existing client you want to Unlock"
	echo " ketik [0] kembali kemenu"
	echo " tulis clear untuk delete semua Akun"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "     No  User   Expired"
	grep -E "^### " "/etc/vless/listlock" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}] to Unlock: " CLIENT_NUMBER
			if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-vless
	fi
	if [[ ${CLIENT_NUMBER} == 'clear' ]]; then
	rm /etc/vless/listlock
	m-vless
	fi
	fi
	done
user=$(grep -E "^### " "/etc/vless/listlock" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/vless/listlock" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/etc/vless/listlock" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
sed -i '/#vless$/a\#vl '"$user $exp $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#vlg '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i "/### $user $exp $uuid/d" /etc/vless/listlock
systemctl restart xray

TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  XRAY VLESS UNLOCKED</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>ISP      :</b> <code>$ISP $CITY </code>
<b>USERNAME :</b> <code>$user </code>
<b>EXPIRED  :</b> <code>$exp </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Succes Unlocked This Akun...</i>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Vless Account Unlock Successfully"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Client Name : $user"
    echo " Status  : Unlocked"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-vless
}
function res-user(){
clear
cd
if [ ! -e /etc/vless/akundelete ]; then
  echo "" > /etc/vless/akundelete
fi
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/vless/akundelete")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Restore Vless Account ⇲    ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo ""
		echo "You have no existing user Expired!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		read -n 1 -s -r -p "Press any key to back on menu"
        m-vless
	fi

	clear
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Restore Vless Account ⇲    ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo " Select the existing client you want to Restore"
	echo " ketik [0] kembali kemenu"
	echo " tulis clear untuk delete semua Akun"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "     No  User   Expired"
	grep -E "^### " "/etc/vless/akundelete" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}] to Unlock: " CLIENT_NUMBER
			if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-vless
	fi
	if [[ ${CLIENT_NUMBER} == 'clear' ]]; then
	rm /etc/vless/akundelete
	m-vless
	fi
	fi
	done
	until [[ $masaaktif =~ ^[0-9]+$ ]]; do
read -p "Expired (days): " masaaktif
done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP): " iplim
done
user=$(grep -E "^### " "/etc/vless/akundelete" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
uuid=$(grep -E "^### " "/etc/vless/akundelete" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
sed -i '/#vless$/a\#vl '"$user $exp $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#vlg '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
echo "${iplim}" >/etc/vless/${user}IP
sed -i "/### $user $exp $uuid/d" /etc/vless/akundelete
systemctl restart xray
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  XRAY VLESS RESTORE</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>ISP      :</b> <code>$ISP $CITY </code>
<b>USERNAME :</b> <code>$user </code>
<b>IP LIMIT  :</b> <code>$iplim IP </code>
<b>EXPIRED  :</b> <code>$exp </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Succes Restore This Akun...</i>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Vless Account Restore Successfully"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Client Name : $user"
    echo " Expired  : $exp"
    echo " Succes to Restore"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-vless
}
function del-res(){
rm /etc/vless/akundelete
echo -e "Succes Delete Log Restore/Delete Akun"
m-vless
}
clear
author=$(cat /etc/profil)
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}             ${WH}• VLESS PANEL MENU •                ${NC}$COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│ $NC  ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}ADD AKUN${NC}        ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}CEK USER CONFIG${NC}   $COLOR1 $NC"
echo -e " $COLOR1│ $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1│ $NC  ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}TRIAL AKUN${NC}      ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}CHANGE USER IP LIMIT${NC}    $COLOR1 $NC"
echo -e " $COLOR1│ $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1│ $NC  ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}RENEW AKUN${NC}      ${WH}[${COLOR1}08${WH}]${NC} ${COLOR1}• ${WH}SETTING LOCK LOGIN ${NC}    $COLOR1 $NC"
echo -e " $COLOR1│ $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1│ $NC  ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}DELETE AKUN${NC}     ${WH}[${COLOR1}09${WH}]${NC} ${COLOR1}• ${WH}UNLOCK USER MULTI LOGIN${NC}    $COLOR1 $NC"
echo -e " $COLOR1│ $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1│ $NC  ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}CEK USER LOGIN${NC}  ${WH}[${COLOR1}10${WH}]${NC} ${COLOR1}• ${WH}RESTORE EXP/DEL USER${NC}    $COLOR1 $NC"
echo -e " $COLOR1│ $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1│ $NC  ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK${NC}"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1${NC}              ${WH}   • $author •                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
1) clear ; add-vless ; exit ;;
2) clear ; trial-vless ; exit ;;
3) clear ; renew-vless ; exit ;;
4) clear ; del-vless ; exit ;;
5) clear ; cek-vless ; exit ;;
6) clear ; list-vless ; exit ;;
7) clear ; limit-vless ; exit ;;
8) clear ; login-vless ; exit ;;
9) clear ; lock-vless ; exit ;;
10) clear ; res-user ; exit ;;
11) clear ; del-res ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "salah tekan " ; sleep 1 ; m-vless ;;
esac          