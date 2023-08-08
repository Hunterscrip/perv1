#!/bin/bash
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
        echo -e "$COLOR1 ${NC} ${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •               ${NC} $COLOR1 $NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
        echo -e "$COLOR1│            ${RED}PERMISSION DENIED !${NC}                  │"
        echo -e "$COLOR1│   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}           │"
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
if [ ! -e /etc/trojan/akun ]; then
  mkdir -p /etc/trojan/akun
fi
#!/bin/bash
function add-tr(){
clear
until [[ $user =~ ^[a-zA-Z0-9_.-]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}            ${WH}• Add Trojan Account •               ${NC}$COLOR1│ $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
		read -rp "User: " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
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
			add-tr
		fi
	done
#read -p "   Bug Host : " address
#read -p "   Bug SNI/Host : " sni

#bug_addr=${address}.
#bug_addr2=$address
#if [[ $address == "" ]]; then
#bug.com=$bug_addr2
#else
#bug.com=$bug_addr

uuid=$(cat /proc/sys/kernel/random/uuid)
until [[ $masaaktif =~ ^[0-9]+$ ]]; do
read -p "Expired (hari): " masaaktif
done
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

until [[ $iplim =~ ^[0-9]+$ ]]; do
  read -p "Limit User (IP): " iplim
done

if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi
if [ -z ${iplim} ]; then
  iplim="0"
fi
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
<code>  Premium Trojan Account</code>
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

clear
systemctl restart xray > /dev/null 2>&1
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}• Premium Trojan Account •  ${NC} $COLOR1 $NC" | tee -a /etc/trojan/akun/log-create-${user}.log
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
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function trial-trojan(){
clear
cd
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}            ${WH}• Trial Trojan Account •             ${NC}$COLOR1│ $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
until [[ $timer =~ ^[0-9]+$ ]]; do
read -p "Expired (Minutes): " timer
done

user=Trial-`</dev/urandom tr -dc X-Z-0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
iplim=1
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi
if [ -z ${iplim} ]; then
  iplim="0"
fi
echo "${iplim}" > /etc/trojan/${user}IP

exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#tr '"$user $exp $uuid"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#trg '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"


trojan1="$(echo $trojanlink1 | base64 -w 0)"
trojan2="$(echo $trojanlink | base64 -w 0)"

echo "SHELL=/bin/sh" >/etc/cron.d/trialtrojan$user
echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >>/etc/cron.d/trialtrojan$user
echo "*/$timer * * * *  root /usr/bin/trialtrojan $user $timer" >>/etc/cron.d/trialtrojan$user

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
<code>  Trial Premium Trojan Account</code>
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
<code>Expired On : $timer Minutes</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

clear
systemctl restart xray > /dev/null 2>&1
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
echo -e "$COLOR1 ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/trojan/akun/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}• Trial Premium Trojan Account •  ${NC} $COLOR1 $NC" | tee -a /etc/trojan/akun/log-create-${user}.log
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
echo -e "$COLOR1 ${NC} ${WH}Expired On   ${COLOR1}: ${WH}$timer Minutes" | tee -a /etc/trojan/akun/log-create-${user}.log
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
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function renew-tr(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#tr " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Renew Trojan Account ⇲     ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""
        read -n 1 -s -r -p "Press any key to back on menu"
        m-trojan
	fi
 	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Renew Trojan Account ⇲     ${NC} $COLOR1 $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo " Select the existing client you want to renew"
	echo " ketik [0] kembali kemenu"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "     No  User   Expired"
	grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-trojan
	fi
	fi
	done
read -p "Expired (days): " masaaktif
user=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#tr $user $exp/#tr $user $exp4/g" /etc/xray/config.json
sed -i "s/#trg $user $exp/#trg $user $exp4/g" /etc/xray/config.json
clear
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>   XRAY TROJAN RENEW</b>
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
    echo " Trojan Account Was Successfully Renewed"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo " Client Name : $user"
    echo " Expired On  : $exp4"
    echo ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-trojan
}
function limit-tr(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#tr " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
 	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Limit Trojan Account ⇲     ${NC} $COLOR1 $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo ""
	echo "You have no existing clients!"
	echo ""
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""
        read -n 1 -s -r -p "Press any key to back on menu"
        m-trojan
	fi
 	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Limit Trojan Account ⇲     ${NC} $COLOR1 $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  	echo "     No  User   Expired"
	echo " Select the existing client you want to change ip"
	echo " ketik [0] kembali kemenu"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-trojan
	fi
	fi
	done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP) New: " iplim
done
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi
if [ -z ${iplim} ]; then
  iplim="0"
fi
user=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
echo "${iplim}" >/etc/trojan/${user}IP
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  XRAY TROJAN IP LIMIT</b>
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
    echo " TROJAN Account Was Successfully Change Limit IP"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo " Client Name : $user"
    echo " Limit IP    : $iplim IP"
    echo ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-trojan
}
function del-tr(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#tr " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Delete Trojan Account ⇲    ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		read -n 1 -s -r -p "Press any key to back on menu"
        m-trojan
	fi

	clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Delete Trojan Account ⇲    ${NC} $COLOR1 $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo " Select the existing client you want to remove"
	echo " ketik [0] kembali kemenu"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "     No  User   Expired"
	grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-trojan
	fi
	fi
	done
user=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
if [ ! -e /etc/trojan/akundelete ]; then
  echo "" > /etc/trojan/akundelete
fi
clear
echo "### $user $exp $uuid" >> /etc/trojan/akundelete
sed -i "/^#tr $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^#trg $user $exp/,/^},{/d" /etc/xray/config.json
rm  /etc/trojan/${user}IP >/dev/null 2>&1
clear
rm /home/vps/public_html/trojan-$user.txt >/dev/null 2>&1
rm /etc/trojan/${user}login >/dev/null 2>&1
systemctl restart xray > /dev/null 2>&1
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Trojan Account Deleted Successfully"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Client Name : $user"
    echo " Expired On  : $exp"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-trojan
}

function cek-tr(){
clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '^#trg' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}             ${WH}• TROJAN ONLINE NOW •               ${NC}$COLOR1│ $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"

for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi

echo -n > /tmp/iptrojan.txt
data2=( `cat /var/log/xray/access.log | tail -n 150 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do

jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 100 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojan.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojan.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done

jum=$(cat /tmp/iptrojan.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/iptrojan.txt | wc -l)
echo -e "$COLOR1${NC} USERNAME : \033[0;33m$akun";
echo -e "$COLOR1${NC} IP LOGIN : \033[0;33m$jum2";
echo -e ""

fi
rm -rf /tmp/iptrojan.txt
done

rm -rf /tmp/other.txt
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-trojan
}
function list-trojan(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#tr " "/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Config Trojan Account ⇲    ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                read -n 1 -s -r -p "Press any key to back on menu"
        m-trojan
	fi

	    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Config Trojan Account ⇲    ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo " Select the existing client to view the config"
        echo " ketik [0] kembali kemenu"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo "     No  User   Expired"
        grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-trojan
	fi
	fi
	done
user=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p) 
clear
cat /etc/trojan/akun/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
m-trojan
}
function login-tr(){
clear
echo -e "$COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}           ${WH}• SETTING MULTI LOGIN •             ${NC}$COLOR1│ $NC"
echo -e "$COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e "${COLOR1}│ $NC SILAHKAN TULIS JUMLAH NOTIFIKASI UNTUK LOCK    ${NC}"
echo -e "${COLOR1}│ $NC AKUN USER YANG MULTI LOGIN     ${NC}"
echo -e "$COLOR1└───────────────────────────────────────────────┘${NC}"
read -rp "   Jika Mau 3x Notif baru kelock tulis 3, dst: " -e notif
cd /etc/trojan
echo "$notif" > notif
clear
echo -e "$COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}           ${WH}• SETTING MULTI LOGIN •             ${NC}$COLOR1│ $NC"
echo -e "$COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e "${COLOR1}│ $NC SUCCES GANTI NOTIF LOCK JADI $notif $NC "
echo -e "$COLOR1└───────────────────────────────────────────────┘${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
m-trojan
}
function lock-tr(){
clear
cd
if [ ! -e  /etc/trojan/listlock ]; then
echo "" > /etc/trojan/listlock
fi
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan/listlock")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Unlock Trojan Account ⇲    ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo ""
		echo "You have no existing user Lock!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		read -n 1 -s -r -p "Press any key to back on menu"
        m-trojan
	fi

	clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}⇱ Unlock Trojan Account ⇲    ${NC} $COLOR1 $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo " Select the existing client you want to Unlock"
	echo " ketik [0] kembali kemenu"
	echo " tulis clear untuk delete semua Akun"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "     No  User   Expired"
	grep -E "^### " "/etc/trojan/listlock" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}] to Unlock: " CLIENT_NUMBER
			if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-trojan
	fi
	if [[ ${CLIENT_NUMBER} == 'clear' ]]; then
	rm /etc/trojan/listlock
	m-trojan
	fi
	fi
	done
user=$(grep -E "^### " "/etc/trojan/listlock" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan/listlock" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/etc/trojan/listlock" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
sed -i '/#trojanws$/a\#tr '"$user $exp $uuid"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#trg '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i "/### $user $exp $uuid/d" /etc/trojan/listlock
systemctl restart xray
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  XRAY TROJAN UNLOCKED</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>ISP      :</b> <code>$ISP $CITY </code>
<b>USERNAME :</b> <code>$user </code>
<b>EXPIRED  :</b> <code>$exp </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Succes Unlocked This Akun...</i>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Trojan Account Unlock Successfully"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Client Name : $user"
    echo " Status  : Unlocked"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-trojan
}
clear
function res-user(){
clear
cd
if [ ! -e /etc/trojan/akundelete ]; then
  echo "" > /etc/trojan/akundelete
fi
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan/akundelete")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}   ${WH}⇱ Restore Trojan Account ⇲    ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo ""
		echo "You have no existing user Expired!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		read -n 1 -s -r -p "Press any key to back on menu"
        m-trojan
	fi

	clear
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}   ${WH}⇱ Restore Trojan Account ⇲    ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo " Select the existing client you want to Restore"
	echo " ketik [0] kembali kemenu"
	echo " tulis clear untuk delete semua Akun"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "     No  User   Expired"
	grep -E "^### " "/etc/trojan/akundelete" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}] to Unlock: " CLIENT_NUMBER
			if [[ ${CLIENT_NUMBER} == '0' ]]; then 
	m-trojan
	fi
	if [[ ${CLIENT_NUMBER} == 'clear' ]]; then
	rm /etc/trojan/akundelete
	m-trojan
	fi
	fi
	done
until [[ $masaaktif =~ ^[0-9]+$ ]]; do
read -p "Expired (days): " masaaktif
done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP): " iplim
done
user=$(grep -E "^### " "/etc/trojan/akundelete" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
uuid=$(grep -E "^### " "/etc/trojan/akundelete" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
sed -i '/#trojanws$/a\#tr '"$user $exp $uuid"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#trg '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
echo "${iplim}" >/etc/trojan/${user}IP
sed -i "/### $user $exp $uuid/d" /etc/trojan/akundelete
systemctl restart xray
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  XRAY TROJAN RESTORE</b>
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
clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Trojan Account Restore Successfully"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " DOMAIN : $domain"
    echo " ISP  : $ISP $CITY"
    echo " USERNAME : $user"
    echo " IP LIMIT : $iplim IP"
    echo " EXPIRED  : $exp"
    echo " Succes to Restore"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-trojan
}
function del-res(){
rm /etc/trojan/akundelete
echo -e "Succes Delete Log Restore/Delete Akun"
m-trojan
}
clear
author=$(cat /etc/profil)
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}             ${WH}• TROJAN PANEL MENU •               ${NC}$COLOR1│ $NC"
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
01 | 1) clear ; add-tr ;;
02 | 2) clear ; trial-trojan ;;
03 | 3) clear ; renew-tr ;;
04 | 4) clear ; del-tr ;;
05 | 5) clear ; cek-tr ;;
06 | 6) clear ; list-trojan ;;
07 | 7) clear ; limit-tr ;;
08 | 8) clear ; login-tr ;;
09 | 9) clear ; lock-tr ;;
00 | 0) clear ; menu ;;
10 | 10) clear ; res-user ;;
11 | 11) clear ; del-res ;;
x) exit ;;
*) echo "SALAH TEKAN" ; sleep 1 ; m-trojan ;;
esac      