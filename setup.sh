#!/bin/bash

clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
secs_to_human() {
echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
rm -rf /etc/casper
mkdir -p /etc/casper
mkdir -p /etc/casper/theme
mkdir -p /var/lib/ >/dev/null 2>&1
echo "IP=" >> /var/lib/ipvps.conf
clear
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e  "${tyblue}|              MASUKKAN NAMA AUTHOR        |${NC}"
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}"
echo " "
read -rp "Masukan Nama Author Disini : " -e dnss
rm -rf /etc/profil
echo "$dnss" > /etc/profil
echo ""
clear
author=$(cat /etc/profil)
echo ""
echo ""

function Casper1() {
MYIP=$(curl -sS ipv4.icanhazip.com)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/t3aaqcej >> /etc/github/api
curl -s https://pastebin.com/raw/cfivDKk2 >> /etc/github/email
curl -s https://pastebin.com/raw/bSskAgjw >> /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari=$(date -d "1 days" +"%Y-%m-%d")
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mBuat Trial VPS... \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mBuat Trial VPS... \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Succes !\033[1;37m"
    tput cnorm
}
res1() {
wget https://raw.githubusercontent.com/Hunterscrip/izinvps/main/ip

}
res2() {
git add ipmini
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/izinvps &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/izinvps &> /dev/null
sleep 1
}
res3() {
wget https://raw.githubusercontent.com/Hunterscrip/perv1/main/install/rmbl.sh && chmod +x rmbl.sh && ./rmbl.sh
clear
}

git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
rm -rf /root/casper
mkdir /root/casper
cd /root/casper/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
fun_bar 'res1'
echo "### $author $hhari $MYIP @trial" >>ipmini
fun_bar 'res2'
rm -rf /root/casper
rm -rf /etc/github
}
function domain(){
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mUpdate Domain.. \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mUpdate Domain... \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Succes !\033[1;37m"
    tput cnorm
}
res1() {
wget https://raw.githubusercontent.com/Hunterscrip/perv1/main/install/casper.sh && chmod +x rmbl.sh && ./rmbl.sh
clear
}
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}         Please select a domain type below                 ${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}  [ 1 ]  Enter your Domain & Random SlowDNS       ${NC}"
echo -e "${tyblue}  [ 2 ]  Use a random Domain & Random SlowDNS     ${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
read -p "   Please select numbers 1-2 or Any Button(Random) : " dns
echo ""
if [[ $dns == "1" ]]; then
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e  "${tyblue}|              TERIMA KASIH                |${NC}"
echo -e  "${tyblue}|         SUDAH MENGGUNAKAN SCRIPT         |${NC}"
echo -e  "${tyblue}|                DARI SAYA                 |${NC}"
#echo -e  "${tyblue}|            BY RMBL VPN              |${NC}"
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}"
echo " "
read -rp "Masukan domain kamu Disini : " -e dnss
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dnss" > /root/domain
echo "$dnss" > /root/scdomain
echo "$dnss" > /etc/xray/scdomain
echo "$dnss" > /etc/v2ray/scdomain
echo "$dnss" > /etc/xray/domain
echo "$dnss" > /etc/v2ray/domain
echo "IP=$dnss" > /var/lib/ipvps.conf
echo ""
clear
elif [[ $dns == "2" ]]; then
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
cd
sleep 1
fun_bar 'res1'
clear
fi
}
cat <<EOF>> /etc/casper/theme/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
cat <<EOF>> /etc/casper/theme/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
cat <<EOF>> /etc/casper/theme/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
cat <<EOF>> /etc/casper/theme/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
cat <<EOF>> /etc/casper/theme/magenta
BG : \E[40;1;95m
TEXT : \033[0;95m
EOF
cat <<EOF>> /etc/casper/theme/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
cat <<EOF>> /etc/casper/theme/color.conf
magenta
EOF
function Casper2(){
cd
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
clear
wget https://raw.githubusercontent.com/Hunterscrip/perv1/main/tools.sh && chmod +x tools.sh && ./tools.sh
clear
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
}
function Casper3(){
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mLagi Menginstal File \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mLagi Menginstal File \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Succes !\033[1;37m"
    tput cnorm
}


res2() {
wget https://raw.githubusercontent.com/Hunterscrip/perv1/main/install/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
clear
} 

res3() {
wget https://raw.githubusercontent.com/Hunterscrip/perv1/main/install/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
clear
}

res4() {
wget https://raw.githubusercontent.com/Hunterscrip/perv1/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear
}

res5() {
wget https://raw.githubusercontent.com/Hunterscrip/perv1/main/install/set-br.sh && chmod +x set-br.sh && ./set-br.sh
clear
}

res6() {
wget https://raw.githubusercontent.com/Hunterscrip/perv1/main/sshws/ohp.sh && chmod +x ohp.sh && ./ohp.sh
clear
}

res7() {
wget https://raw.githubusercontent.com/Hunterscrip/perv1/main/menu/update.sh && chmod +x update.sh && ./update.sh
clear
}

res8() {
wget https://raw.githubusercontent.com/Hunterscrip/perv1/main/slowdns/installsl.sh && chmod +x installsl.sh && bash installsl.sh
clear
}

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}|      PROCESS INSTALLED SSH & OPENVPN     |${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
fun_bar 'res2'

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}|           PROCESS INSTALLED XRAY         |${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
fun_bar 'res3'

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}|       PROCESS INSTALLED WEBSOCKET SSH    |${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
fun_bar 'res4'

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}|       PROCESS INSTALLED BACKUP MENU       |${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
fun_bar 'res5'

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}|           PROCESS INSTALLED OHP          |${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
fun_bar 'res6'


echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}|           DOWNLOAD EXTRA MENU            |${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
fun_bar 'res7'

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}|           DOWNLOAD SLOWDNS               |${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
fun_bar 'res8'
}

function iinfo(){
IP=$(echo $SSH_CLIENT | awk '{print $1}')
TMPFILE='/tmp/ipinfo-$DATE_EXEC.txt'
curl http://ipinfo.io/$IP -s -o $TMPFILE
ORG=$(cat $TMPFILE | jq '.org' | sed 's/"//g')
domain=$(cat /etc/xray/domain)
LocalVersion=$(cat /root/versi)
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )
CHATID="1319592446"
KEY="6084073663:AAHdbteum38_25MavUHrZb_bt-NbZul9mvE"
URL="https://api.telegram.org/bot$KEY/sendMessage"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain) 
token=""
chatid=""
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"
DATE_EXEC="$(date "+%d %b %Y %H:%M")"
CITY=$(cat $TMPFILE | jq '.city' | sed 's/"//g')
REGION=$(cat $TMPFILE | jq '.region' | sed 's/"//g')
COUNTRY=$(cat $TMPFILE | jq '.country' | sed 's/"//g')
author=$(cat /etc/profil)
MYIP=$(curl -sS ipv4.icanhazip.com)
IZIN=$(curl -sS https://raw.githubusercontent.com/Hunterscrip/izinvps/main/ip | awk '{print 3}' | grep $MYIP)
TIME=$(date +'%Y-%m-%d %H:%M:%S')
RAMMS=$(free -m | awk 'NR==2 {print $2}')


TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️ AUTOSCRIPT INSTALLER ⚠️</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>TIME :</b> <code>$TIME </code>
<b>DOMAIN :</b> <code>${domain} </code>
<b>IPVPS :</b> <code>${MYIP} </code>
<b>ISP AND CITY :</b> <code>$ISP $CITY </code>
<b>AUTHOR :</b> <code>$author </code>
<code>◇━━━━━━━━━━━━━━◇</code>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
}

CEKIP
Casper3

cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile
if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/Hunterscrip/perv1/main/versi  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
rm -rf /etc/baca
rm -rf /etc/myipvps
curl -sS ifconfig.me > /etc/myipvps
curl -s ipinfo.io/city?token=75082b4831f909 >> /etc/xray/city
curl -s ipinfo.io/org?token=75082b4831f909  | cut -d " " -f 2-10 >> /etc/xray/isp
curl -s https://pastebin.com/raw/0gWiX6hE >> /etc/baca
echo " "
echo "━━━━━━━━━━━━━━━━━━[ Script Premium ]━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo ""
echo "   >>> Service & Port "              | tee -a log-install.txt
echo "   - OpenSSH                  : 22"  | tee -a log-install.txt
echo "   - SSH Websocket            : 80, 8080" | tee -a log-install.txt
echo "   - SSH SSL Websocket        : 443, 444" | tee -a log-install.txt
echo "   - Stunnel4                 : 8443, 8880" | tee -a log-install.txt
echo "   - Dropbear                 : 109, 143" | tee -a log-install.txt
echo "   - Badvpn                   : 7100-7900" | tee -a log-install.txt
echo "   - Nginx                    : 89"  | tee -a log-install.txt
echo "   - Vmess WS TLS             : 443" | tee -a log-install.txt
echo "   - Vless WS TLS             : 443" | tee -a log-install.txt
echo "   - Trojan WS TLS            : 443" | tee -a log-install.txt
echo "   - Shadowsocks WS TLS       : 443" | tee -a log-install.txt
echo "   - Vmess WS none TLS        : 80, 8080"  | tee -a log-install.txt
echo "   - Vless WS none TLS        : 80, 8080"  | tee -a log-install.txt
echo "   - Trojan WS none TLS       : 80, 8080"  | tee -a log-install.txt
echo "   - Shadowsocks WS none TLS  : 80, 8080"  | tee -a log-install.txt
echo "   - Vmess gRPC               : 443" | tee -a log-install.txt
echo "   - Vless gRPC               : 443" | tee -a log-install.txt
echo "   - Trojan gRPC              : 443" | tee -a log-install.txt
echo "   - Shadowsocks gRPC         : 443" | tee -a log-install.txt
echo "   - Websocket Ovpn           : 2086"| tee -a log-install.txt
echo "   - OHP SSH                  : 8181"| tee -a log-install.txt
echo "   - OHP Dropbear             : 8282"
echo "   - OHP OpenVPN              : 8383"| tee -a log-install.txt
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On           : $aureb:00 $gg GMT +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Backup & Restore Data" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "━━━━━━━━━━━━━━━━━━[ Script Premium ]━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
echo ""
echo "" | tee -a log-install.txt
rm /root/setup.sh >/dev/null 2>&1
rm /root/slhost.sh >/dev/null 2>&1
rm /root/ssh-vpn.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
rm /root/set-br.sh >/dev/null 2>&1
rm /root/ohp.sh >/dev/null 2>&1
rm /root/update.sh >/dev/null 2>&1
rm /root/slowdns.sh >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt

sleep 3
echo  ""
echo -e "                ${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "                ${tyblue}|           PROCESS INSTALLED SSH UDP      |${NC}"
echo -e "                ${tyblue}└──────────────────────────────────────────┘${NC}"
sleep 3
iinfo
sleep 1
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2" -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp 
