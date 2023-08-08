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
        echo -e "$COLOR1 ${NC} ${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •               ${NC} $COLOR1 $NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
        echo -e "            ${RED}PERMISSION DENIED !${NC}"
        echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
        echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
        echo -e "             \033[0;33mContact Admin :${NC}"
        echo -e "     \033[0;36mTelegram${NC}: https://t.me/CasperGaming"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        exit
    fi
}
checking_sc

author=$(cat /etc/profil)
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                ${WH}• THEME PANEL •                ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC  ${WH}[${COLOR1}01${WH}]$NC ${COLOR1}• ${WH}BLUE YODO     ${WH}[${COLOR1}04${WH}]$NC ${COLOR1}• ${WH}CYAN MEOW$NC"
echo -e " $COLOR1 $NC  ${WH}[${COLOR1}02${WH}]$NC ${COLOR1}• ${WH}RED HOTLINK   ${WH}[${COLOR1}05${WH}]$NC ${COLOR1}• ${WH}GREEN DAUN$NC"
echo -e " $COLOR1 $NC  ${WH}[${COLOR1}03${WH}]$NC ${COLOR1}• ${WH}YELLOW DIGI   ${WH}[${COLOR1}06${WH}]$NC ${COLOR1}• ${WH}MAGENTA AXIS$NC"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1 $NC  ${WH}[${COLOR1}00${WH}]$NC ${COLOR1}• ${WH}GO BACK$NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read colormenu
case $colormenu in
01 | 1)
clear
echo "blue" >/etc/casper/theme/color.conf
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                ${WH}• BLUE THEME •                 ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1 $NC ${WH}[${COLOR1}INFO${WH}] ${WH}TEAM BLUE Active Successfully${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
;;
02 | 2)
clear
echo "red" >/etc/casper/theme/color.conf
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                ${WH}• RED THEME •                  ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1 $NC ${WH}[${COLOR1}INFO${WH}] ${WH}TEAM RED Active Successfully${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
;;
03 | 3)
clear
echo "yellow" >/etc/casper/theme/color.conf
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• YELLOW THEME •                ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1 $NC ${WH}[${COLOR1}INFO${WH}] ${WH}TEAM YELLOW Active Successfully${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
;;
04 | 4)
clear
echo "cyan" >/etc/casper/theme/color.conf
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                ${WH}• CYAN THEME •                 ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1 $NC ${WH}[${COLOR1}INFO${WH}] ${WH}TEAM CYAN Active Successfully${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
;;
05 | 5)
clear
echo "green" >/etc/casper/theme/color.conf
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• GREEN THEME •                 ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1 $NC ${WH}[${COLOR1}INFO${WH}] ${WH}TEAM GREEN Active Successfully${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
;;
06 | 6)
clear
echo "magenta" >/etc/casper/theme/color.conf
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• MAGENTA THEME •               ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1 $NC ${WH}[${COLOR1}INFO${WH}] ${WH}TEAM MAGENTA Active Successfully${NC}"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
;;
00 | 0)
clear
menu
;;
*)
clear
m-theme
;;
esac
echo -e ""
read -n 1 -s -r -p "  Press any key to back on menu"
m-theme 
