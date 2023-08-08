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
        echo -e "$COLOR1│${NC}${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •                 ${NC}$COLOR1│ $NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
        echo -e "$COLOR1│            ${RED}PERMISSION DENIED !${NC}                  $COLOR1│"
        echo -e "$COLOR1│   ${yl}Your VPS${NC} $ipsaya \033[0;36mHas been Banned${NC}      $COLOR1│"        
        echo -e "$COLOR1│     ${yl}Buy access permissions for scripts${NC}          $COLOR1│"
        echo -e "$COLOR1│             \033[0;32mContact Your Admin ${NC}                 $COLOR1│"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        exit
    fi
}
checking_sc


ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
domain=`cat /etc/xray/domain`
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}            ${WH}• Add All Xray •                     ${NC}$COLOR1│ $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
		    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
            echo -e "$COLOR1│${NC}${COLBG1}            ${WH}• Add Trojan Account •         ${NC}$COLOR1│ $NC"
            echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
	        echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
            echo -e "$COLOR1│                                                 │"
            echo -e "$COLOR1│${WH} Nama Duplikat Silahkan Buat Nama Lain.          $COLOR1│"
            echo -e "$COLOR1│                                                 │"
            echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
			read -n 1 -s -r -p "Press any key to back on menu"
			m-allxray
		fi
	done
if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi
if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi
if [ -z ${iplim} ]; then
  iplim="0"
fi

echo "${iplim}" >/etc/vmess/${user}IP
echo "${iplim}" >/etc/vless/${user}IP
echo "${iplim}" >/etc/trojan/${user}IP
uuid=$(cat /proc/sys/kernel/random/uuid)
until [[ $masaaktif =~ ^[0-9]+$ ]]; do
read -p "Expired (days): " masaaktif
done
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP): " iplim
done
if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi
if [ -z ${iplim} ]; then
  iplim="0"
fi


echo "${iplim}" >/etc/vmess/${user}IP
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\#vm '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vmessgrpc$/a\#vmg '"$user $exp $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"

VMESS_WS=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
VMESS_NON_TLS=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
VMESS_GRPC=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "/vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
VMESS_OPOK=`cat<<EOF  
      { 
      "v": "2", 
      "ps": "${user}",  
      "add": "${domain}", 
      "port": "80", 
      "id": "${uuid}",  
      "aid": "0", 
      "net": "ws",
      "path": "http://tsel.me/worryfree",
      "type": "none", 
      "host": "tsel.me",  
      "tls": "none" 
} 
EOF`

cat > /home/vps/public_html/vmess-$user.txt <<-END
_______________________________________________________
              Format Vmess WS (CDN)
_______________________________________________________
- name: vmess-$user-WS (CDN)
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
_______________________________________________________
              Format Vmess WS (CDN) Non TLS
_______________________________________________________
- name: vmess-$user-WS (CDN) Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
_______________________________________________________
              Format Vmess gRPC (SNI)
_______________________________________________________
- name: vmess-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
  grpc-service-name: vmess-grpc

_______________________________________________________
        Format Vmess WS (CDN) Non TLS Opok TSEL
_______________________________________________________
- name: vmess-$user-WS (CDN) Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: true
  servername: comunity.instagram.com
  network: ws
  ws-opts:
    path: : http://tsel.me/worryfree
    headers:
      Host: ${domain}
_______________________________________________________
              Link Vmess Account
_______________________________________________________
Link TLS : vmess://$(echo $VMESS_WS | base64 -w 0)
_______________________________________________________
Link none TLS : vmess://$(echo $VMESS_NON_TLS | base64 -w 0)
_______________________________________________________
Link GRPC : vmess://$(echo $VMESS_GRPC | base64 -w 0)
_______________________________________________________
Link Opok : vmess://$(echo $VMESS_OPOK | base64 -w 0)
_______________________________________________________

END


TEXT="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>    Xray/Vmess Account</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Remarks      : </code> <code>${user}</code>
<code>Domain       : </code> <code>${domain}</code>
<code>User Limit    : </code> <code>${iplim} IP</code>
<code>ISP           : </code> <code>${ISP}</code>
<code>CITY         : </code> <code>${CITY}</code>
<code>Port TLS     : </code> <code>443</code>
<code>Port NTLS    : </code> <code>80, 8080</code>
<code>Port GRPC    : </code> <code>443</code>
<code>User ID      : </code> <code>${uuid}</code>
<code>AlterId      : 0</code>
<code>Security     : auto</code>
<code>Network      : WS or gRPC</code>
<code>Path         : </code> <code>/vmess</code>
<code>Path Support : </code> <code>https://bug.com/worryfree</code>
<code>ServiceName  : </code> <code>vmess-grpc</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link TLS     :</code> 
<code>${vmesslink1}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link NTLS    :</code> 
<code>${vmesslink2}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link GRPC    :</code> 
<code>${vmesslink3}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Format OpenClash : </code>
http://$domain:89/vmess-$user.txt
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Expired On : $exp</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

clear
systemctl restart xray > /dev/null 2>&1
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}• V2RAY VMESS PREMIUM • ${NC} $COLOR1 $NC" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Remarks       ${COLOR1}: ${WH}${user}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ISP           ${COLOR1}: ${WH}$ISP" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}City          ${COLOR1}: ${WH}$CITY" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Domain        ${COLOR1}: ${WH}${domain}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}User IP       ${COLOR1}: ${WH}${iplim} IP" | tee -a /etc/log-create-.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS      ${COLOR1}: ${WH}$443" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port none TLS ${COLOR1}: ${WH}80,8080" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port gRPC     ${COLOR1}: ${WH}443" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}id            ${COLOR1}: ${WH}${uuid}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}alterId       ${COLOR1}: ${WH}0" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Security      ${COLOR1}: ${WH}auto" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Network       ${COLOR1}: ${WH}ws" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path          ${COLOR1}: ${WH}/vmess" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path Support  ${COLOR1}: ${WH}http://bug/worryfree" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ServiceName   ${COLOR1}: ${WH}vmess-grpc" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Expired On     ${COLOR1}: ${WH}$exp" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket TLS      ${WH}:${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink1}${NC}"  | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket None TLS ${WH}: ${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink2}${NC}"  | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket GRPC     ${WH}: ${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink3}${NC}"  | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Format Openclash ${COLOR1}:" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}http://$domain:89/vmess-$user.txt${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC}   ${WH}• $author •${NC}                 $COLOR1 $NC" | tee -a /etc/vmess/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vmess/akun/log-create-${user}.log
echo "" | tee -a /etc/vmess/akun/log-create-${user}.log

echo "${iplim}" >/etc/trojan/${user}IP
sed -i '/#trojanws$/a\#tr '"$user $exp $uuid"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#trg '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=$sni&type=ws&sni=${domain}#${user}"

trojan1="$(echo $trojanlink1 | base64 -w 0)"
trojan2="$(echo $trojanlink | base64 -w 0)"

cat > /home/vps/public_html/trojan-$user.txt <<-END
_______________________________
  Format Trojan WS (CDN)
_______________________________
- name: Trojan-$user-WS (CDN)
  server: ${domain}
  port: 443
  type: trojan
  password: ${uuid}
  network: ws
  sni: ${domain}
  skip-cert-verify: true
  udp: true
  ws-opts:
    path: /trojan-ws
    headers:
        Host: ${domain}
_______________________________
  Format Trojan gRPC
_______________________________
- name: Trojan-$user-gRPC (SNI)
  type: trojan
  server: ${domain}
  port: 443
  password: ${uuid}
  udp: true
  sni: ${domain}
  skip-cert-verify: true
  network: grpc
  grpc-opts:
    grpc-service-name: trojan-grpc
_______________________________
Link Trojan Account
_______________________________
Link WS : trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}
_______________________________
Link GRPC : trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}
_______________________________

END

TEXT="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>    Xray TROJAN Account</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Remarks      : </code> <code>${user}</code>
<code>Domain       : </code> <code>${domain}</code>
<code>User Limit    : </code> <code>${iplim} IP</code>
<code>ISP           : </code> <code>${ISP}</code>
<code>City           : </code> <code>${CITY}</code>
<code>Port TLS     : </code> <code>443</code>
<code>Port GRPC    : </code> <code>443</code>
<code>User ID      : </code> <code>${uuid}</code>
<code>AlterId      : 0</code>
<code>Security     : auto</code>
<code>Network      : WS or gRPC</code>
<code>Path WS    : </code> <code>/trojan-ws</code>
<code>Path GRPC  : </code> <code>/trojan-grpc</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link TLS    :</code> 
<code>${trojan2}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link GRPC    :</code> 
<code>${trojan1}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Format OpenClash : </code>
http://$domain:89/trojan-$user.txt
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Expired On : $exp</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

systemctl restart xray > /dev/null 2>&1
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}• XRAY TROJAN PREMIUM •  ${NC} $COLOR1 $NC" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Remarks      ${COLOR1}: ${WH}${user}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ISP          ${COLOR1}: ${WH}$ISP" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}City         ${COLOR1}: ${WH}$CITY" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Host/IP      ${COLOR1}: ${WH}${domain}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}User IP      ${COLOR1}: ${WH}${iplim} IP" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS     ${COLOR1}: ${WH}443" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port gRPC    ${COLOR1}: ${WH}443" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Key          ${COLOR1}: ${WH}${uuid}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path WS      ${COLOR1}: ${WH}/trojan-ws" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ServiceName  ${COLOR1}: ${WH}trojan-grpc" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Expired On   ${COLOR1}: ${WH}$exp" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link TLS     ${COLOR1}: " | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}${trojanlink}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link gRPC    ${COLOR1}: " | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}${trojanlink1}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Format Openclash ${COLOR1}: " | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}http://$domain:89/trojan-$user.txt${NC}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}• $author •${NC} $COLOR1 $NC"  | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo "" | tee -a /etc/trojan/akun/log-create-${user}.log

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
<code>    Xray/Vless Account</code>
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

systemctl restart xray > /dev/null 2>&1
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/vless/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}• V2RAY VLESS PREMIUM •${NC} $COLOR1 $NC" | tee -a /etc/vless/akun/log-create-${user}.log
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
menu 