#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
MYIP=$(curl -sS ipv4.icanhazip.com)
###########- COLOR CODE -##############
colornow=$(cat /etc/casper/theme/color.conf)
export NC="\e[0m"
export yl='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/casper/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/casper/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
WKT=$(curl -s ipinfo.io/timezone?token=$ipn )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip?token=7578ac19afd785 )
MYIP=$(curl -sS ipv4.icanhazip.com)
Isadmin=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $5}')
Exp2=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $3}')
export RED='\033[0;31m'
export GREEN='\033[0;32m'

Name=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $2}')
ipsaya=$(curl -sS ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/casper9/permission/main/ipmini"
checking_sc() {
    useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
    if [[ $date_list < $useexp ]]; then
        echo -ne
    else
        systemctl stop nginx
        echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
        echo -e "$COLOR1│${NC}${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •                 ${NC}$COLOR1│ $NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
        echo -e "$COLOR1│            ${RED}PERMISSION DENIED !${NC}                  $COLOR1│"
        echo -e "$COLOR1│   ${yl}Your VPS${NC} $ipsaya \033[0;36mHas been Banned${NC}      $COLOR1│"        
        echo -e "$COLOR1│     ${yl}Buy access permissions for scripts${NC}          $COLOR1│"
        echo -e "$COLOR1│             \033[0;32mContact Your Admin ${NC}                 $COLOR1│"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        key
    fi
}

function key(){
echo -e  "${COLOR1}┌──────────────────────────────────────────┐${NC}"
echo -e  "${COLOR1}│              MASUKKAN LICENSE KEY        │${NC}"
echo -e  "${COLOR1}└──────────────────────────────────────────┘${NC}"
echo " "
read -rp "Masukan Key Kamu Disini ctrl + c Exit : " -e kode
cd
if [ -z $kode ]; then
echo -e "KODE SALAH SILAHKAN MASUKKAN ULANG KODENYA"
key
fi
clear
LIST=$(curl -sS https://raw.githubusercontent.com/casper9/license/main/key | grep $kode | awk '{print $2}')
Key=$(curl -sS https://raw.githubusercontent.com/casper9/license/main/key | grep $kode | awk '{print $3}')
KEY2=$(curl -sS https://raw.githubusercontent.com/casper9/license/main/key | grep $kode | awk '{print $4}')
ADMIN=$(curl -sS https://raw.githubusercontent.com/casper9/license/main/key | grep $kode | awk '{print $5}')
TOTALIP=$(curl -sS https://raw.githubusercontent.com/casper9/license/main/key | grep $kode | awk '{print $6}')
U2=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $2}')
U3=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $3}')
U4=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $4}')
U5=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $5}')
U6=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $6}')
MYIP=$(curl -sS ipv4.icanhazip.com)

if [[ $kode == "CASPERGG" ]]; then
MYIP=$(curl -sS ipv4.icanhazip.com)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/t3aaqcej > /etc/github/api
curl -s https://pastebin.com/raw/cfivDKk2 > /etc/github/email
curl -s https://pastebin.com/raw/bSskAgjw > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari=$(date -d "30 days" +"%Y-%m-%d")
mkdir /root/casper
cd /root/casper
wget https://raw.githubusercontent.com/casper9/permission/main/ipmini >/dev/null 2>&1

if [ "$ADMIN" = "ON" ]; then
sed -i '/# RESELLER/a ### $author $hhari $MYIP $ADMIN $TOTALIP' /root/casper/ipmini
else
if [ "$U4" = "$MYIP" ]; then
sed -i "s/### $U2 $U3 $U4 $U5/### $U2 $hhari $U4 $U5/g" /root/casper/ipmini
else
echo "### $author $hhari $MYIP @CASPER" >> ipmini
fi
fi
sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add ipmini 
git commit -m register >/dev/null 2>&1
git branch -M main >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/permission >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/permission >/dev/null 2>&1
sleep 0.5
rm ipmini
elif [[ $kode == $Key ]]; then
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/t3aaqcej > /etc/github/api
curl -s https://pastebin.com/raw/cfivDKk2 > /etc/github/email
curl -s https://pastebin.com/raw/bSskAgjw > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari=$(date -d "$KEY2 days" +"%Y-%m-%d")
mkdir /root/casper
cd /root/casper
wget https://raw.githubusercontent.com/casper9/permission/main/ipmini >/dev/null 2>&1
if [ "$ADMIN" = "ON" ]; then
sed -i '/# RESELLER/a ### $author $hhari $MYIP $ADMIN $TOTALIP' /root/casper/ipmini
else
if [ "$U4" = "$MYIP" ]; then
sed -i "s/### $U2 $U3 $U4 $U5/### $U2 $hhari $U4 $U5/g" /root/casper/ipmini
else
echo "### $author $hhari $MYIP @$LIST" >> ipmini
fi
fi
sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add ipmini 
git commit -m register >/dev/null 2>&1
git branch -M main >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/permission >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/permission >/dev/null 2>&1
sleep 0.5
rm ipmini
wget https://raw.githubusercontent.com/casper9/license/main/key >/dev/null 2>&1
if [ "$ADMIN" = "ON" ]; then
sed -i "/^### $LIST $Key $KEY2 $ADMIN $TOTALIP/d" /root/casper/key
else
sed -i "/^### $LIST $Key $KEY2/d" /root/casper/key
fi
sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add key
git commit -m register >/dev/null 2>&1
git branch -M main >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/license >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/license >/dev/null 2>&1
rm -rf /root/casper
rm -rf /etc/github
echo -e "SUCCES MASUKKAN KEY SILAHKAN DITUNGGU"
echo -e "5MENIT AGAR SERVER KEREFRESH"
read -n 1 -s -r -p "  Press any key to Exit"
exit
clear
else
echo -e "KODE SALAH SILAHKAN MASUKKAN ULANG KODENYA"
sleep 1
key
fi
}

checking_sc
#check folder
cd
if [ ! -e /etc/per/id ]; then
  mkdir -p /etc/per
  echo "" > /etc/per/id
  echo "" > /etc/per/token
elif [ ! -e /etc/perlogin/id ]; then
  mkdir -p /etc/perlogin
  echo "" > /etc/perlogin/id
  echo "" > /etc/perlogin/token
elif [ ! -e /usr/bin/id ]; then
  echo "" > /usr/bin/idchat
  echo "" > /usr/bin/token
fi

if [ ! -e /etc/xray/ssh ]; then
  echo "" > /etc/xray/ssh
elif [ ! -e /etc/xray/sshx ]; then
  mkdir -p /etc/xray/sshx
elif [ ! -e /etc/xray/sshx/listlock ]; then
  echo "" > /etc/xray/sshx/listlock
elif [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
elif [ ! -e /etc/vmess/listlock ]; then
  echo "" > /etc/vmess/listlock
elif [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
elif [ ! -e /etc/vless/listlock ]; then
  echo "" > /etc/vless/listlock
elif [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
elif [ ! -e /etc/trojan/listlock ]; then
  echo "" > /etc/trojan/listlock
fi
clear
MODEL2=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
# usage
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/etc/t1
bulan=$(date +%b)
tahun=$(date +%y)
ba=$(curl -s https://pastebin.com/raw/0gWiX6hE)
today=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
todayd=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
today_v=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $9}')
today_rx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $2}')
today_rxv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $3}')
today_tx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $5}')
today_txv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $6}')
if [ "$(grep -wc ${bulan} /etc/t1)" != '0' ]; then
    bulan=$(date +%b)
    month=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $9}')
    month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $10}')
    month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $3}')
    month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $4}')
    month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $6}')
    month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $7}')
else
    bulan2=$(date +%Y-%m)
    month=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $8}')
    month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $9}')
    month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $2}')
    month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $3}')
    month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $5}')
    month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $6}')
fi
if [ "$(grep -wc yesterday /etc/t1)" != '0' ]; then
    yesterday=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $8}')
    yesterday_v=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $9}')
    yesterday_rx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $2}')
    yesterday_rxv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $3}')
    yesterday_tx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $5}')
    yesterday_txv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $6}')
else
    yesterday=NULL
    yesterday_v=NULL
    yesterday_rx=NULL
    yesterday_rxv=NULL
    yesterday_tx=NULL
    yesterday_txv=NULL
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws="${COLOR1}ON${NC}"
else
    status_ws="${RED}OFF${NC}"
fi

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${COLOR1}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
    systemctl start nginx
fi

# status

rm -rf /etc/status

wget -q -O /etc/status "https://raw.githubusercontent.com/casper9/perv1/main/status"


# // SSH Websocket Proxy
xray=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_xray="${COLOR1}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi
# STATUS EXPIRED ACTIVE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}(Registered)${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"

today=$(date -d "0 days" +"%Y-%m-%d")
if [[ $today < $Exp2 ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
# TOTAL ACC CREATE VMESS WS
vmess=$(grep -c -E "^#vmg " "/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS WS
vless=$(grep -c -E "^#vlg " "/etc/xray/config.json")
# TOTAL ACC CREATE  TROJAN
trtls=$(grep -c -E "^#trg " "/etc/xray/config.json")
# TOTAL ACC CREATE OVPN SSH
total_ssh=$(grep -c -E "^### " "/etc/xray/ssh")
#total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
function updatews(){
clear

echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• UPDATE SCRIPT VPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  $COLOR1[INFO]${NC} Check for Script updates"
sleep 2
wget -q -O /root/install_up.sh "https://raw.githubusercontent.com/casper9/perv1/main/menu/install-up.sh" && chmod +x /root/install_up.sh
sleep 2
./install_up.sh
rm /root/install_up.sh
rm /opt/.ver
version_up=$( curl -sS https://raw.githubusercontent.com/casper9/permission/main/versi)
echo "$version_up" > /opt/.verecho "$version_up" > /opt/.ver
echo -e "$COLOR1 ${NC}  $COLOR1[INFO]${NC} Successfully Up To Date!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}             ${WH}• $author •${NC}                $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu
}
function m-ip2(){   
clear
cd
if [[ -e /etc/github/api ]]; then
bash m-ip
else
mkdir /etc/github
curl -s https://pastebin.com/raw/t3aaqcej >> /etc/github/api
curl -s https://pastebin.com/raw/cfivDKk2 >> /etc/github/email
curl -s https://pastebin.com/raw/bSskAgjw >> /etc/github/username
m-ip
fi
}
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s ipinfo.io/ip )
serverV=$( curl -sS https://raw.githubusercontent.com/casper9/perv1/main/versi)
if [ "$Isadmin" = "ON" ]; then
uis="${COLOR1}Premium ADMIN VIP$NC"
else
uis="${COLOR1}Premium Version$NC"
fi

clear
clear && clear && clear
clear;clear;clear
echo -e "$COLOR1╔═════════════════════════════════════════════════╗${NC}"
echo -e "$COLOR1║${NC}${COLBG1}              ${WH}• INFO SYSTEM VPS •                ${NC}$COLOR1║ $NC"
echo -e "$COLOR1╚═════════════════════════════════════════════════╝${NC}"
echo -e "$COLOR1╔═════════════════════════════════════════════════╗${NC}"
#echo -e "$COLOR1 $NC ${WH}User Roles        ${COLOR1}: ${WH}$uis"
echo -e "$COLOR1║ $NC${WH}¶ System OS          ${COLOR1}: ${WH}$MODEL2"
echo -e "$COLOR1║ $NC${WH}¶ Memory Usage       ${COLOR1}: ${WH}$uram - $tram"
if [ "$cekup" = "day" ]; then
echo -e "$COLOR1║ $NC${WH}¶ System Uptime      ${COLOR1}: ${WH}$uphours $upminutes $uptimecek"
else
echo -e "$COLOR1║ $NC${WH}¶ System Uptime      ${COLOR1}: ${WH}$uphours $upminutes"
fi
#echo -e "$COLOR1 $NC ${WH}LOAD CPU           ${COLOR1}: ${WH}$LOADCPU"
echo -e "$COLOR1║ $NC${WH}¶ Core & CPU Usage   ${COLOR1}: ${WH}$CORE & $cpu_usage"
echo -e "$COLOR1║ $NC${WH}¶ ISP & City         ${COLOR1}: ${WH}$ISP & $CITY"
echo -e "$COLOR1║ $NC${WH}¶ Domain             ${COLOR1}: ${WH}$(cat /etc/xray/domain)"
echo -e "$COLOR1║ $NC${WH}¶ NameServer Slowdns ${COLOR1}: ${WH}$(cat /etc/xray/dns)"
echo -e "$COLOR1║ $NC${WH}¶ IP-VPS             ${COLOR1}: ${WH}$IPVPS${NC}"
echo -e "$COLOR1║ $NC${WH}¶ DATE & TIME        ${COLOR1}: ${WH}$DATE2 WIB${NC}"
echo -e "$COLOR1║ $NC${WH}¶ NAMA AUTHOR        ${COLOR1}: ${WH}$author${NC}"
echo -e "$COLOR1╚═════════════════════════════════════════════════╝${NC}"
echo -e "$COLOR1╔═════════════════════════════════════════════════╗${NC}"
echo -e "$COLOR1║ ${COLOR1}Traffic${NC}      ${COLOR1}Today     Yesterday       Month    ║   ${NC}"
#echo -e "$COLOR1╚═════════════════════════════════════════════════╝${NC}"
#echo -e "$COLOR1╔═════════════════════════════════════════════════╗${NC}"
echo -e "$COLOR1║ ${WH}Download${NC}   ${WH}$today_tx $today_txv    $yesterday_tx $yesterday_txv     $month_tx $month_txv$COLOR1  ${NC}"
echo -e "$COLOR1║ ${WH}Upload${NC}     ${WH}$today_rx $today_rxv    $yesterday_rx $yesterday_rxv     $month_rx $month_rxv$COLOR1   ${NC}"
echo -e "$COLOR1║ ${COLOR1}Total${NC}    ${COLOR1}  $todayd $today_v    $yesterday $yesterday_v     $month $month_v$COLOR1  ${NC} "
echo -e "$COLOR1╚═════════════════════════════════════════════════╝${NC}"
echo -e "$COLOR1┌──────────────── • STATUS SERVER • ──────────────┐${NC}"
echo -e "$COLOR1│$NC ${WH}[ SSH WS : ${status_ws} ${WH}]  ${WH}[ XRAY : ${status_xray} ${WH}]   ${WH}[ NGINX : ${status_nginx} ${WH}] $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
#echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "   $COLOR1$NC${WH} [ SSH Account =  ${COLOR1}$total_ssh${WH}]${WH}    [ VMESS Account = ${COLOR1}$vmess${WH}]$COLOR1 $NC"
echo -e ""
echo -e "   $COLOR1$NC${WH} [ VLESS Account = ${COLOR1}$vless${WH}]${WH}   [ TROJAN Account = ${COLOR1}${trtls}${WH}] $COLOR1 $NC"
#echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1╔═════════════════════════════════════════════════╗${NC}"
echo -e "$COLOR1║${NC} ${COLBG1}                  ${WH}• LIST MENU •                ${NC}$COLOR1 ║ $NC"
echo -e "$COLOR1╚═════════════════════════════════════════════════╝${NC}"
echo -e "$COLOR1╔═════════════════════════════════════════════════╗${NC}"
echo -e "$COLOR1║ ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}SSH-WS   ${WH}[${COLOR1}Menu${WH}]   ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}STATUS SERVICE  $COLOR1║ $NC"
echo -e "$COLOR1║                                                 $COLOR1║ $NC"
echo -e "$COLOR1║ ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}VMESS    ${WH}[${COLOR1}Menu${WH}]   ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}REBOOT VPS      $COLOR1║ $NC"
echo -e "$COLOR1║                                                 $COLOR1║ $NC"
echo -e "$COLOR1║ ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}VLESS    ${WH}[${COLOR1}Menu${WH}]   ${WH}[${COLOR1}08${WH}]${NC} ${COLOR1}• ${WH}UPDATE    ${WH}[${COLOR1}Menu${WH}]$COLOR1║ $NC"
echo -e "$COLOR1║                                                 $COLOR1║ $NC"
echo -e "$COLOR1║ ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}TROJAN   ${WH}[${COLOR1}Menu${WH}]   ${WH}[${COLOR1}09${WH}]${NC} ${COLOR1}• ${WH}SETTING   ${WH}[${COLOR1}Menu${WH}]$COLOR1║ $NC"
echo -e "$COLOR1║                                                 $COLOR1║ $NC"
echo -e "$COLOR1║ ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}ALL XRAY ${WH}[${COLOR1}Menu${WH}]   ${WH}[${COLOR1}10${WH}]${NC} ${COLOR1}• ${WH}BACKUP    ${WH}[${COLOR1}Menu${WH}]$COLOR1║ $NC"
echo -e "$COLOR1╚═════════════════════════════════════════════════╝${NC}"
echo -e "$COLOR1┌───────────────── • INFO HARI INI • ─────────────┐${NC}"
echo -e "$COLOR1│ ${NC}${WH}•  $(cat /etc/status)  •${NC}  $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
if [ "$Isadmin" = "ON" ]; then
echo -e "$COLOR1┌──────────────── • PANEL ADMIN VIP • ────────────┐${NC}"
echo -e "$COLOR1│  ${WH}[${COLOR1}11${WH}]${NC} ${COLOR1}• ${WH}RESELLER IP ${WH}[${COLOR1}MENU${WH}] $COLOR1 $NC"
ressee="m-ip2"
bottt="m-bot"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
else
ressee="menu"
bottt="menu"
fi
myver="$(cat /opt/.ver)"

if [[ $serverV > $myver ]]; then
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ $NC ${WH}[${COLOR1}100${WH}]${NC} ${COLOR1}• ${WH}UPDATE TO V$serverV${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
up2u="updatews"
else
up2u="menu"
fi

DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
function new(){
cat> /etc/cron.d/autocpu << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/3 * * * * root /usr/bin/autocpu
END
echo "Auto-Reboot CPU 100% TURN ON."
sleep 1
menu
}

function newx(){
clear
until [[ $usagee =~ ^[0-9]+$ ]]; do
read -p "kuota user format angka 1, 2 atau 3 (TERA): " usagee
done
echo "$usagee" > /etc/usagee
cat> /etc/cron.d/bantwidth << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/10 * * * * root /usr/bin/bantwidth
END
echo "Auto-Shutdown $usagee TERA TURN ON."
sleep 1
menu
}
mai="datediff "$Exp" "$DATE""

# CERTIFICATE STATUS
d1=$(date -d "$Exp2" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))

function bannner(){
wget -O /etc/issue.net "https://raw.githubusercontent.com/casper9/perv1/main/install/issue2.net" &> /dev/null
menu
}
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ $NC ${WH}Versi Script  ${COLOR1}: ${WH}$(cat /opt/.ver) Latest Version${NC}$COLOR1"
echo -e "$COLOR1│ $NC ${WH}Nama Client   ${COLOR1}: ${WH}$Name${NC}$COLOR1"
echo -e "$COLOR1│ $NC ${WH}Durasi Script ${COLOR1}: ${WH}$certificate hari${NC}$COLOR1"                    
echo -e "$COLOR1│ $NC ${WH}Exp Script    ${COLOR1}: ${WH}$Exp2 $sts ${NC}$COLOR1"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; m-sshovpn ;;
02 | 2) clear ; m-vmess ;;
03 | 3) clear ; m-vless ;;
04 | 4) clear ; m-trojan ;;
05 | 5) clear ; m-allxray ;;
06 | 6) clear ; running ;;
07 | 7) clear ; reboot ;;
08 | 8) clear ; m-update ;;
19 | 9) clear ; m-system ;;
10 | 10) clear ; m-backup;;
11 | 11) clear ; $ressee ;;
12 | 12) clear ; key ;;
89 | 89) clear ; bannner ;;
88 | 88) clear ; new ;;
77 | 77) clear ; newx ;;
100) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac 