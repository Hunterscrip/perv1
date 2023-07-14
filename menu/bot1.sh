#!/bin/bash

clear
echo -e " $COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}           ${WH}• TERIMA KASIH SUDAH •          ${NC} $COLOR1 $NC"
echo -e "$COLOR1 ${NC} ${COLBG1}           ${WH}• MENGGUNAKAN SCRIPT •          ${NC} $COLOR1 $NC"
echo -e "$COLOR1 ${NC} ${COLBG1}           ${WH}• PREMIUM DARI SAYA  •          ${NC} $COLOR1 $NC"
echo -e "$COLOR1 ${NC} ${COLBG1}           ${WH}• KALAU ADA KENDALA  •          ${NC} $COLOR1 $NC"
echo -e "$COLOR1 ${NC} ${COLBG1}           ${WH}• CHAT SAYA LEWAT WA •          ${NC} $COLOR1 $NC"
echo -e "$COLOR1 ${NC} ${COLBG1}        ${WH}• https:/wa.me/085321 •      ${NC} $COLOR1 $NC"
echo -e " $COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -rp "  New ID CHAT TELEGRAM : " -e id
echo "$id" > /etc/per/id
echo -e " $COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
sleep 2
read -rp "  New TOKEN BOT TELEGRAM : " -e token
echo "$token" > /etc/per/token
sleep 3
echo -e " $COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to menu"
menu
fi
