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
        echo -e "             \033[0;33mContact Your Admin ${NC}"
       # echo -e "     \033[0;36mTelegram${NC}: https://t.me/CasperGaming"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        exit
    fi
}
checking_sc

function ins-helium(){    
clear
if [[ -e /usr/bin/helium ]]; then
helium
else
echo -e " OS UBUNTU GA BISA INSTALL MENU INI"
echo -e " [ 1 ]  instal menu ini"
echo -e " [ 2 ]  Keluar ga jadi install"
read -p "  Silahkan Pilih Angka Anda atau random aja: " dns
if [[ $dns == "1" ]]; then
rm -rf /usr/bin/helium
mkdir -p /etc/dnsmasq
touch /etc/dnsmasq/providers.txt
wget -q -O /usr/bin/helium "https://cdn.discordapp.com/attachments/1043809011474112566/1054014513428566016/helium.sh" && chmod +x /usr/bin/helium && helium
fi
menu
fi
}
function add-host(){
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
    echo -ne "  \033[0;33mUodate Domain... \033[1;37m- \033[0;33m["
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
wget https://raw.githubusercontent.com/casper9/perv1/main/install/casper.sh && chmod +x casper.sh && ./casper.sh

}
res2() {
wget https://raw.githubusercontent.com/casper9/perv1/main/slowdns/installsl.sh && chmod +x installsl.sh && ./installsl.sh

}
res3() {
wget https://raw.githubusercontent.com/casper9/perv1/main/install/casper1.sh && chmod +x casper1.sh && ./casper1.sh
clear
}
res4() {
wget https://raw.githubusercontent.com/casper9/perv1/main/install/casper2.sh && chmod +x casper2.sh && ./casper2.sh
clear
}
res5() {
wget https://raw.githubusercontent.com/casper9/perv1/main/install/casper3.sh && chmod +x casper3.sh && ./casper3.sh
clear
}
res6() {
wget https://raw.githubusercontent.com/casper9/perv1/main/install/casper4.sh && chmod +x casper4.sh && ./casper4.sh
clear
}
clear
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ ${WH}Please select a your Choice to Set Domain              ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│  [ 1 ]  ${WH}Domain kamu sendiri & Random SlowDNS       ${NC}"
echo -e "$COLOR1│"
echo -e "$COLOR1│  [ 2 ]  ${WH}Domain Yang Punya Script & Random SlowDNS     ${NC}"
echo -e "$COLOR1│"
echo -e "$COLOR1│  [ 3 ]  ${WH}Domain Kamu Sendiri & Domain SlowDNS Kamu Sendiri    ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
until [[ $dns =~ ^[0-9]+$ ]]; do 
read -p "   Please select numbers 1-3 or Any Button(Random) : " dns
done
if [[ $dns == "1" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│             ${WH}TERIMA KASIH                 $COLOR1│${NC}"
echo -e  "$COLOR1│        ${WH}SUDAH MENGGUNAKAN SCRIPT          $COLOR1│${NC}"
echo -e  "$COLOR1│               ${WH}DARI SAYA                  $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dnss =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan domain kamu Disini : " -e dnss
done
echo ""
echo "$dnss" > /etc/xray/domain
echo "$dnss" > /etc/v2ray/domain
echo "IP=$dnss" > /var/lib/ipvps.conf
echo ""
fun_bar 'res2'
read -n 1 -s -r -p "  Press any key to Renew Cert or Ctrl + C to Exit"
certv2ray
clear
elif [[ $dns == "2" ]]; then
clear
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ \033[1;37mPlease select a your Choice to Set Domain$COLOR1│${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│  [ 1 ]  \033[1;37mDomain xxx.vpnvip.cloud       ${NC}"
echo -e "$COLOR1│  "                                        
echo -e "$COLOR1│  [ 2 ]  \033[1;37mDomain xxx.vpnvip.app     ${NC}"
echo -e "$COLOR1│  "                                        
echo -e "$COLOR1│  [ 3 ]  \033[1;37mDomain xxx.slowapp.cfd       ${NC}"
echo -e "$COLOR1│  "                                        
echo -e "$COLOR1│  [ 4 ]  \033[1;37mDomain xxx.slowapp.dev     ${NC}"
echo -e "$COLOR1│  "                                        
echo -e "$COLOR1│  [ 5 ]  \033[1;37mDomain xxx.vpnvip.tech     ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
until [[ $domain2 =~ ^[1-5]+$ ]]; do 
read -p "   Please select numbers 1 sampai 5 : " domain2
done
if [[ $domain2 == "1" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│  \033[1;37mContoh subdomain xxx.vpnvip.cloud       $COLOR1│${NC}"
echo -e  "$COLOR1│    \033[1;37mxxx jadi subdomain kamu               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn1
done
echo "$dn1" > /etc/xray/domain
echo "$dn1" > /root/subdomainx
cd
sleep 1
fun_bar 'res1'
fun_bar 'res2'
clear
rm -rf /root/subdomainx
fi
if [[ $domain2 == "2" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│  \033[1;37mContoh subdomain xxx.vpnvip.app         $COLOR1│${NC}"
echo -e  "$COLOR1│    \033[1;37mxxx jadi subdomain kamu               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn2
done
echo "$dn2" > /etc/xray/domain
echo "$dn2" > /root/subdomainx
cd
sleep 1
fun_bar 'res3'
fun_bar 'res2'
clear
rm -rf /root/subdomainx
fi
if [[ $domain2 == "3" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│  \033[1;37mContoh subdomain xxx.slowapp.cfd        $COLOR1│${NC}"
echo -e  "$COLOR1│    \033[1;37mxxx jadi subdomain kamu               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn3 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn3
done
echo "$dn3" > /etc/xray/domain
echo "$dn3" > /root/subdomainx
cd
sleep 1
fun_bar 'res4'
fun_bar 'res2'
clear
rm -rf /root/subdomainx
fi
if [[ $domain2 == "4" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│  \033[1;37mContoh subdomain xxx.slowapp.dev        $COLOR1│${NC}"
echo -e  "$COLOR1│    \033[1;37mxxx jadi subdomain kamu               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn4 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn4
done
echo "$dn4" > /etc/xray/domain
echo "$dn4" > /root/subdomainx
cd
sleep 1
fun_bar 'res5'
fun_bar 'res2'
clear
rm -rf /root/subdomainx
fi
if [[ $domain2 == "5" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│  \033[1;37mContoh subdomain xxx.vpnvip.tech        $COLOR1│${NC}"
echo -e  "$COLOR1│    \033[1;37mxxx jadi subdomain kamu               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn4 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn5
done
echo "$dn5" > /etc/xray/domain
echo "$dn5" > /root/subdomainx
cd
sleep 1
fun_bar 'res6'
fun_bar 'res2'
clear
rm -rf /root/subdomainx
fi
read -n 1 -s -r -p "  Press any key to Renew Cert or Ctrl + C to Exit"
certv2ray
clear
elif [[ $dns == "3" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│             ${WH}TERIMA KASIH                 $COLOR1│${NC}"
echo -e  "$COLOR1│        ${WH}SUDAH MENGGUNAKAN SCRIPT          $COLOR1│${NC}"
echo -e  "$COLOR1│               ${WH}DARI SAYA                  $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dns1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan domain kamu Disini : " -e dns1
done
echo ""
echo "$dns1" > /etc/xray/domain
echo "$dns1" > /etc/v2ray/domain
echo "IP=$dns1" > /var/lib/ipvps.conf
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│             ${WH}TERIMA KASIH                 $COLOR1│${NC}"
echo -e  "$COLOR1│        ${WH}SUDAH MENGGUNAKAN SCRIPT          $COLOR1│${NC}"
echo -e  "$COLOR1│               ${WH}DARI SAYA                  $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dns2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan Domain SlowDNS kamu Disini : " -e dns2
done
echo $dns2 >/etc/xray/dns
read -n 1 -s -r -p "  Press any key to Renew Cert or Ctrl + C to Exit"
certv2ray
clear
fi
}
function auto-reboot(){
clear
if [ ! -e /etc/cron.d/re_otm ]; then
rm -rf /etc/cron.d/re_otm
fi
if [ ! -e /usr/local/bin/reboot_otomatis ]; then
echo '#!/bin/bash' > /usr/local/bin/reboot_otomatis
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis
echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot_otomatis
echo 'echo "Server successfully rebooted on the date of $tanggal hit $waktu." >> /etc/log-reboot.txt' >> /usr/local/bin/reboot_otomatis
echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis
chmod +x /usr/local/bin/reboot_otomatis
fi
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;100;33m       • AUTO-REBOOT MENU •        \e[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "[\e[36m•1\e[0m] Set Auto-Reboot Setiap 1 Jam"
echo -e "[\e[36m•2\e[0m] Set Auto-Reboot Setiap 6 Jam"
echo -e "[\e[36m•3\e[0m] Set Auto-Reboot Setiap 12 Jam"
echo -e "[\e[36m•4\e[0m] Set Auto-Reboot Setiap 1 Hari"
echo -e "[\e[36m•5\e[0m] Set Auto-Reboot Setiap 1 Minggu"
echo -e "[\e[36m•6\e[0m] Set Auto-Reboot Setiap 1 Bulan"
echo -e "[\e[36m•7\e[0m] Set Auto-Rebooot CPU 100%"
echo -e "[\e[36m•8\e[0m] Matikan Auto-Reboot & Auto-Reboot CPU 100%"
echo -e "[\e[36m•9\e[0m] View reboot log"
echo -e "[\e[36m•10\e[0m] Remove reboot log"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e ""
echo -e "Press x or [ Ctrl+C ] • To-Exit"
echo -e ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " x
if test $x -eq 1; then
echo "10 * * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been set every an hour."
sleep 2
menu
elif test $x -eq 2; then
echo "10 */6 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 6 hours."
sleep 2
menu
elif test $x -eq 3; then
echo "10 */12 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 12 hours."
sleep 2
menu
elif test $x -eq 4; then
echo -e " CONTOH FORMAT Tiap jam 5 Subuh Tulis 5 "
read -p " Waktu Restart : " wkt
echo "0 $wkt * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a day."
sleep 2
menu
elif test $x -eq 5; then
echo -e " CONTOH FORMAT Tiap jam 8 Malam Tulis 20 "
read -p " Waktu Restart : " wkt2
echo "10 $wkt2 */7 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a week."
sleep 2
menu
elif test $x -eq 6; then
echo -e " CONTOH FORMAT Tiap jam 10 Malam Tulis 20 "
read -p " Waktu Restart : " wkt3
echo "10 $wkt3 1 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a month."
sleep 2
menu
elif test $x -eq 7; then
cat> /etc/cron.d/autocpu << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/7 * * * * root /usr/bin/autocpu
END
echo "Auto-Reboot CPU 100% TURN ON."
sleep 2
menu
elif test $x -eq 8; then
rm -f /etc/cron.d/reboot_otomatis
rm -f /etc/cron.d/autocpu
echo "Auto-Reboot successfully TURNED OFF."
sleep 2
menu
elif test $x -eq 9; then
if [ ! -e /etc/log-reboot.txt ]; then
	clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}       ${WH} • AUTO-REBOOT •        ${NC} $COLOR1 $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e ""
    echo "No reboot activity found"
    echo -e ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    auto-reboot
	else
	clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}        ${WH}• AUTO-REBOOT •        ${NC} $COLOR1 $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e ""
	echo 'LOG REBOOT'
	cat /etc/log-reboot.txt
    echo -e ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    auto-reboot
fi
elif test $x -eq 10; then
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}        ${WH}• AUTO-REBOOT •        ${NC} $COLOR1 $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo "" > /etc/log-reboot.txt
echo "Auto Reboot Log successfully deleted!"
echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
auto-reboot
elif test $x -eq 0; then
clear
menu
else
clear
echo ""
echo "Options Not Found In Menu"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
auto-reboot
fi
}
function bw3(){
echo "Checking VPS"
sleep 2
clear
_APISERVER=127.0.0.1:10000
_XRAY=/usr/sbin/xray

apidata () {
    local ARGS=
    if [[ $1 == "reset" ]]; then
      ARGS="-reset=true"
    fi
    $_XRAY api statsquery --server=$_APISERVER "${ARGS}" \
    | awk '{
        if (match($1, /"name":/)) {
            f=1; gsub(/^"|link"|,$/, "", $2);
            split($2, p,  ">>>");
            printf "%s:%s->%s\t", p[1],p[2],p[4];
        }
        else if (match($1, /"value":/) && f){
          f = 0;
          gsub(/"/, "", $2);
          printf "%.0f\n", $2;
        }
        else if (match($0, /}/) && f) { f = 0; print 0; }
    }'
}

print_sum() {
    local DATA="$1"
    local PREFIX="$2"
    local SORTED=$(echo "$DATA" | grep "^${PREFIX}" | sort -r)
    local SUM=$(echo "$SORTED" | awk '
        /->up/{us+=$2}
        /->down/{ds+=$2}
        END{
            printf "SUM->up:\t%.0f\nSUM->down:\t%.0f\nSUM->TOTAL:\t%.0f\n", us, ds, us+ds;
        }')
    echo -e "${SORTED}\n${SUM}" \
    | numfmt --field=2 --suffix=B --to=iec \
    | column -t
}

DATA=$(apidata $1)
echo -e "\033[1;93m──────────────────────────────────────────\033[0m"
echo -e "\033[42m    ∆ CASPER MANAGER BANDWITH ∆    \033[0m"
echo -e "\033[1;93m──────────────────────────────────────────\033[0m"
echo -e "$ijo------------Inbound----------$NC" | lolcat
print_sum "$DATA" "inbound"  | lolcat
echo -e "$ijo========= ⋆⋅☆⋅⋆ =========$NC" | lolcat
echo -e "$ijo-----------Outbound----------$NC" | lolcat
print_sum "$DATA" "outbound" | lolcat
echo -e "$ijo========= ⋆⋅☆⋅⋆ =========$NC" | lolcat
echo
echo -e "$ijo-------------User------------$NC" | lolcat
print_sum "$DATA" "user" | lolcat
echo -e "$ijo========= ⋆⋅☆⋅⋆ =========$NC" | lolcat
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
}
function bw(){
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}      • BANDWITH MONITOR •         ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e " ${WH}[${COLOR1}•1${WH}]${NC} ${COLOR1} Lihat Total Bandwith Tersisa"
echo -e " ${WH}[${COLOR1}•2${WH}]${NC} ${COLOR1} Tabel Penggunaan Setiap 5 Menit"
echo -e " ${WH}[${COLOR1}•3${WH}]${NC} ${COLOR1} Tabel Penggunaan Setiap Jam"
echo -e " ${WH}[${COLOR1}•4${WH}]${NC} ${COLOR1} Tabel Penggunaan Setiap Hari"
echo -e " ${WH}[${COLOR1}•5${WH}]${NC} ${COLOR1} Tabel Penggunaan Setiap Bulan"
echo -e " ${WH}[${COLOR1}•6${WH}]${NC} ${COLOR1} Tabel Penggunaan Setiap Tahun"
echo -e " ${WH}[${COLOR1}•7${WH}]${NC} ${COLOR1} Tabel Penggunaan Tertinggi"
echo -e " ${WH}[${COLOR1}•8${WH}]${NC} ${COLOR1} Statistik Penggunaan Setiap Jam"
echo -e " ${WH}[${COLOR1}•9${WH}]${NC} ${COLOR1} Lihat Penggunaan Aktif Saat Ini"
echo -e " ${WH}[${COLOR1}10${WH}]${NC} ${COLOR1} Lihat Trafik Penggunaan Aktif Saat Ini [5s]"
echo -e ""
echo -e " [\e[31m•0${WH}]${NC} ${COLOR1} \e[31mBACK TO MENU${NC}"
echo -e " [\e[31m•x${WH}]${NC} ${COLOR1} Keluar"
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1} • TOTAL BANDWITH SERVER TERSISA • ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat

echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

2)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1} • TOTAL BANDWITH SETIAP 5 MENIT • ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -5

echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

3)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}   • TOTAL BANDWITH SETIAP JAM •   ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -h

echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

4)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}  • TOTAL BANDWITH SETIAP HARI •   ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -d

echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

5)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}  • TOTAL BANDWITH SETIAP BULAN •  ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -m

echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

6)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}  • TOTAL BANDWITH SETIAP TAHUN •  ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -y

echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

7)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}    • TOTAL BANDWITH TERTINGGI •   ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -t

echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

8)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1} • STATISTIK TERPAKAI SETIAP JAM • ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -hg

echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

9)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}     • LIVE BANDWITH SAAT INI •    ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e   " Press [ Ctrl+C ] • To-Exit"
echo -e ""

vnstat -l

echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

10)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}• LIVE TRAFIK PENGGUNAAN BANDWITH •${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -tr

echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

0)
sleep 1
menu
;;
x)
exit
;;
*)
echo -e ""
echo -e "Anda salah tekan"
sleep 1
bw
;;
esac
}
function m-tcp(){
#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
sh_ver="1.3.2"
github="raw.githubusercontent.com/chiakge/Linux-NetSpeed/master"

Green_font_prefix="\033[32m"
Red_font_prefix="\033[31m"
Green_background_prefix="\033[42;37m"
Red_background_prefix="\033[41;37m"
Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[Info]${Font_color_suffix}"
Error="${Red_font_prefix}[Error]${Font_color_suffix}"
Tip="${Green_font_prefix}[Tip]${Font_color_suffix}"

#Install BBR kernel
installbbr(){
	kernel_version="4.11.8"
	if [[ "${release}" == "centos" ]]; then
		rpm --import http://${github}/bbr/${release}/RPM-GPG-KEY-elrepo.org
		yum install -y http://${github}/bbr/${release}/${version}/${bit}/kernel-ml-${kernel_version}.rpm
		yum remove -y kernel-headers
		yum install -y http://${github}/bbr/${release}/${version}/${bit}/kernel-ml-headers-${kernel_version}.rpm
		yum install -y http://${github}/bbr/${release}/${version}/${bit}/kernel-ml-devel-${kernel_version}.rpm
	elif [[ "${release}" == "debian" || "${release}" == "ubuntu" ]]; then
		mkdir bbr && cd bbr
		wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u10_amd64.deb
		wget -N --no-check-certificate http://${github}/bbr/debian-ubuntu/linux-headers-${kernel_version}-all.deb
		wget -N --no-check-certificate http://${github}/bbr/debian-ubuntu/${bit}/linux-headers-${kernel_version}.deb
		wget -N --no-check-certificate http://${github}/bbr/debian-ubuntu/${bit}/linux-image-${kernel_version}.deb
	
		dpkg -i libssl1.0.0_1.0.1t-1+deb8u10_amd64.deb
		dpkg -i linux-headers-${kernel_version}-all.deb
		dpkg -i linux-headers-${kernel_version}.deb
		dpkg -i linux-image-${kernel_version}.deb
		cd .. && rm -rf bbr
	fi
	detele_kernel
	BBR_grub
	echo -e "${Tip} After restarting the VPS, please re-run the script to start${Red_font_prefix}BBR/BBR magic revision${Font_color_suffix}"
	stty erase '^H' && read -p "You need to restart the VPS before you can start the BBR/BBR magic revision. Do you want to restart now? [Y/n] :" yn
	[ -z "${yn}" ] && yn="y"
	if [[ $yn == [Yy] ]]; then
		echo -e "${Info} VPS restarting..."
		reboot
	fi
}

#Install BBRplus kernel
installbbrplus(){
	kernel_version="4.14.129-bbrplus"
	if [[ "${release}" == "centos" ]]; then
		wget -N --no-check-certificate https://${github}/bbrplus/${release}/${version}/kernel-${kernel_version}.rpm
		yum install -y kernel-${kernel_version}.rpm
		rm -f kernel-${kernel_version}.rpm
		kernel_version="4.14.129_bbrplus" #fix a bug
	elif [[ "${release}" == "debian" || "${release}" == "ubuntu" ]]; then
		mkdir bbrplus && cd bbrplus
		wget -N --no-check-certificate http://${github}/bbrplus/debian-ubuntu/${bit}/linux-headers-${kernel_version}.deb
		wget -N --no-check-certificate http://${github}/bbrplus/debian-ubuntu/${bit}/linux-image-${kernel_version}.deb
		dpkg -i linux-headers-${kernel_version}.deb
		dpkg -i linux-image-${kernel_version}.deb
		cd .. && rm -rf bbrplus
	fi
	detele_kernel
	BBR_grub
	echo -e "${Tip} After restarting the VPS, please re-run the script to start${Red_font_prefix}BBRplus${Font_color_suffix}"
	stty erase '^H' && read -p "You need to restart the VPS before you can start BBRplus. Do you want to restart it now? [Y/n] :" yn
	[ -z "${yn}" ] && yn="y"
	if [[ $yn == [Yy] ]]; then
		echo -e "${Info} VPS restarting..."
		reboot
	fi
}

#Install Lotserver kernel
installlot(){
	if [[ "${release}" == "centos" ]]; then
		rpm --import http://${github}/lotserver/${release}/RPM-GPG-KEY-elrepo.org
		yum remove -y kernel-firmware
		yum install -y http://${github}/lotserver/${release}/${version}/${bit}/kernel-firmware-${kernel_version}.rpm
		yum install -y http://${github}/lotserver/${release}/${version}/${bit}/kernel-${kernel_version}.rpm
		yum remove -y kernel-headers
		yum install -y http://${github}/lotserver/${release}/${version}/${bit}/kernel-headers-${kernel_version}.rpm
		yum install -y http://${github}/lotserver/${release}/${version}/${bit}/kernel-devel-${kernel_version}.rpm
	elif [[ "${release}" == "ubuntu" ]]; then
		bash <(wget --no-check-certificate -qO- "http://${github}/Debian_Kernel.sh")
	elif [[ "${release}" == "debian" ]]; then
		bash <(wget --no-check-certificate -qO- "http://${github}/Debian_Kernel.sh")
	fi
	detele_kernel
	BBR_grub
	echo -e "${Tip} After restarting the VPS, please re-run the script to start${Red_font_prefix}Lotserver${Font_color_suffix}"
	stty erase '^H' && read -p "You need to restart the VPS before you can start Lotserver. Do you want to restart it now? [Y/n] :" yn
	[ -z "${yn}" ] && yn="y"
	if [[ $yn == [Yy] ]]; then
		echo -e "${Info} VPS restarting..."
		reboot
	fi
}

#Enable BBR
startbbr(){
	remove_all
	echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
	echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
	sysctl -p
	echo -e "${Info} BBR started successfully!"
}

#Enable BBRplus
startbbrplus(){
	remove_all
	echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
	echo "net.ipv4.tcp_congestion_control=bbrplus" >> /etc/sysctl.conf
	sysctl -p
	echo -e "${Info} BBRplus started successfully!"
}

#Compile and enable BBR magic change
startbbrmod(){
	remove_all
	if [[ "${release}" == "centos" ]]; then
		yum install -y make gcc
		mkdir bbrmod && cd bbrmod
		wget -N --no-check-certificate http://${github}/bbr/tcp_tsunami.c
		echo "obj-m:=tcp_tsunami.o" > Makefile
		make -C /lib/modules/$(uname -r)/build M=`pwd` modules CC=/usr/bin/gcc
		chmod +x ./tcp_tsunami.ko
		cp -rf ./tcp_tsunami.ko /lib/modules/$(uname -r)/kernel/net/ipv4
		insmod tcp_tsunami.ko
		depmod -a
	else
		apt-get update
		if [[ "${release}" == "ubuntu" && "${version}" = "14" ]]; then
			apt-get -y install build-essential
			apt-get -y install software-properties-common
			add-apt-repository ppa:ubuntu-toolchain-r/test -y
			apt-get update
		fi
		apt-get -y install make gcc
		mkdir bbrmod && cd bbrmod
		wget -N --no-check-certificate http://${github}/bbr/tcp_tsunami.c
		echo "obj-m:=tcp_tsunami.o" > Makefile
		ln -s /usr/bin/gcc /usr/bin/gcc-4.9
		make -C /lib/modules/$(uname -r)/build M=`pwd` modules CC=/usr/bin/gcc-4.9
		install tcp_tsunami.ko /lib/modules/$(uname -r)/kernel
		cp -rf ./tcp_tsunami.ko /lib/modules/$(uname -r)/kernel/net/ipv4
		depmod -a
	fi
	

	echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
	echo "net.ipv4.tcp_congestion_control=tsunami" >> /etc/sysctl.conf
	sysctl -p
    cd .. && rm -rf bbrmod
	echo -e "${Info} The Magic Revamped BBR was launched successfully!"
}

#Compile and enable BBR magic change
startbbrmod_nanqinlang(){
	remove_all
	if [[ "${release}" == "centos" ]]; then
		yum install -y make gcc
		mkdir bbrmod && cd bbrmod
		wget -N --no-check-certificate https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/bbr/centos/tcp_nanqinlang.c
		echo "obj-m := tcp_nanqinlang.o" > Makefile
		make -C /lib/modules/$(uname -r)/build M=`pwd` modules CC=/usr/bin/gcc
		chmod +x ./tcp_nanqinlang.ko
		cp -rf ./tcp_nanqinlang.ko /lib/modules/$(uname -r)/kernel/net/ipv4
		insmod tcp_nanqinlang.ko
		depmod -a
	else
		apt-get update
		if [[ "${release}" == "ubuntu" && "${version}" = "14" ]]; then
			apt-get -y install build-essential
			apt-get -y install software-properties-common
			add-apt-repository ppa:ubuntu-toolchain-r/test -y
			apt-get update
		fi
		apt-get -y install make gcc-4.9
		mkdir bbrmod && cd bbrmod
		wget -N --no-check-certificate https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/bbr/tcp_nanqinlang.c
		echo "obj-m := tcp_nanqinlang.o" > Makefile
		make -C /lib/modules/$(uname -r)/build M=`pwd` modules CC=/usr/bin/gcc-4.9
		install tcp_nanqinlang.ko /lib/modules/$(uname -r)/kernel
		cp -rf ./tcp_nanqinlang.ko /lib/modules/$(uname -r)/kernel/net/ipv4
		depmod -a
	fi
	

	echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
	echo "net.ipv4.tcp_congestion_control=nanqinlang" >> /etc/sysctl.conf
	sysctl -p
	echo -e "${Info} The Magic Revamped BBR was launched successfully!"
}

#Enable Lotserver
startlotserver(){
	remove_all
	if [[ "${release}" == "centos" ]]; then
		yum install ethtool
	else
		apt-get update
		apt-get install ethtool
	fi
	bash <(wget --no-check-certificate -qO- https://raw.githubusercontent.com/chiakge/lotServer/master/Install.sh) install
	sed -i '/advinacc/d' /appex/etc/config
	sed -i '/maxmode/d' /appex/etc/config
	echo -e "advinacc=\"1\"
maxmode=\"1\"">>/appex/etc/config
	/appex/bin/lotServer.sh restart
	start_menu
}

#Uninstall all speed up
remove_all(){
	rm -rf bbrmod
	sed -i '/net.core.default_qdisc/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf
    sed -i '/fs.file-max/d' /etc/sysctl.conf
	sed -i '/net.core.rmem_max/d' /etc/sysctl.conf
	sed -i '/net.core.wmem_max/d' /etc/sysctl.conf
	sed -i '/net.core.rmem_default/d' /etc/sysctl.conf
	sed -i '/net.core.wmem_default/d' /etc/sysctl.conf
	sed -i '/net.core.netdev_max_backlog/d' /etc/sysctl.conf
	sed -i '/net.core.somaxconn/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syncookies/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_tw_reuse/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_tw_recycle/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_fin_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_keepalive_time/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_local_port_range/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_syn_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_tw_buckets/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_rmem/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_wmem/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_mtu_probing/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_forward/d' /etc/sysctl.conf
	sed -i '/fs.inotify.max_user_instances/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syncookies/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_fin_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_tw_reuse/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_syn_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_local_port_range/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_tw_buckets/d' /etc/sysctl.conf
	sed -i '/net.ipv4.route.gc_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_synack_retries/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syn_retries/d' /etc/sysctl.conf
	sed -i '/net.core.somaxconn/d' /etc/sysctl.conf
	sed -i '/net.core.netdev_max_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_timestamps/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_orphans/d' /etc/sysctl.conf
	if [[ -e /appex/bin/lotServer.sh ]]; then
		bash <(wget --no-check-certificate -qO- https://github.com/MoeClub/lotServer/raw/master/Install.sh) uninstall
	fi
	clear
	echo -e "${Info} Clear acceleration is complete."
	sleep 1s
}

#Optimize system configuration
optimizing_system(){
	sed -i '/fs.file-max/d' /etc/sysctl.conf
	sed -i '/fs.inotify.max_user_instances/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syncookies/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_fin_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_tw_reuse/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_syn_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_local_port_range/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_tw_buckets/d' /etc/sysctl.conf
	sed -i '/net.ipv4.route.gc_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_synack_retries/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syn_retries/d' /etc/sysctl.conf
	sed -i '/net.core.somaxconn/d' /etc/sysctl.conf
	sed -i '/net.core.netdev_max_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_timestamps/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_orphans/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_forward/d' /etc/sysctl.conf
	echo "fs.file-max = 1000000
fs.inotify.max_user_instances = 8192
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 16384
net.ipv4.tcp_max_tw_buckets = 6000
net.ipv4.route.gc_timeout = 100
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_synack_retries = 1
net.core.somaxconn = 32768
net.core.netdev_max_backlog = 32768
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_max_orphans = 32768
# forward ipv4
net.ipv4.ip_forward = 1">>/etc/sysctl.conf
	sysctl -p
	echo "*               soft    nofile           1000000
*               hard    nofile          1000000">/etc/security/limits.conf
	echo "ulimit -SHn 1000000">>/etc/profile
	read -p "The VPS needs to be restarted for the system optimization configuration to take effect. Do you want to restart now? [Y/n] :" yn
	[ -z "${yn}" ] && yn="y"
	if [[ $yn == [Yy] ]]; then
		echo -e "${Info} VPS restarting..."
		reboot
	fi
}

#Update script
Update_Shell(){
	echo -e "The current version is [ ${sh_ver} ], start checking the latest version..."
	sh_new_ver=$(wget --no-check-certificate -qO- "http://${github}/tcp.sh"|grep 'sh_ver="'|awk -F "=" '{print $NF}'|sed 's/\"//g'|head -1)
	[[ -z ${sh_new_ver} ]] && echo -e "${Error} Failed to detect the latest version!" && start_menu
	if [[ ${sh_new_ver} != ${sh_ver} ]]; then
		echo -e "Found a new version [ ${sh_new_ver} ], do you want to update? [Y/n]"
		read -p "(Default: y):" yn
		[[ -z "${yn}" ]] && yn="y"
		if [[ ${yn} == [Yy] ]]; then
			wget -N --no-check-certificate http://${github}/tcp.sh && chmod +x tcp.sh
			echo -e "The script has been updated to the latest version [ ${sh_new_ver} ] !"
		else
			echo && echo "Cancelled..." && echo
		fi
	else
		echo -e "Currently the latest version [ ${sh_new_ver} ] !"
		sleep 5s
	fi
}

#Start menu
start_menu(){
clear
echo && echo -e "TCP acceleration - Key installation management script ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
 
${Green_font_prefix}0.${Font_color_suffix} Upgrade script
———————————————Kernel management———————————————
${Green_font_prefix}1.${Font_color_suffix} Install BBR/BBR Magic Revised Kernel
${Green_font_prefix}2.${Font_color_suffix} Install the BBRplus version of the kernel
${Green_font_prefix}3.${Font_color_suffix} Install Lotserver (Sharp Speed) Kernel
——————————————Speed ​​up management——————————————
${Green_font_prefix}4.${Font_color_suffix} Use BBR to accelerate
${Green_font_prefix}5.${Font_color_suffix} Use BBR Magic Revamp to accelerate
${Green_font_prefix}6.${Font_color_suffix} Use violent BBR magic revision to accelerate
${Green_font_prefix}7.${Font_color_suffix} Use BBRplus version to accelerate
${Green_font_prefix}8.${Font_color_suffix} Use Lotserver (sharp speed) to accelerate
————————————Miscellaneous Management———————————
${Green_font_prefix}9.${Font_color_suffix} Uninstall all speed up
${Green_font_prefix}10.${Font_color_suffix} System configuration optimization
${Green_font_prefix}11.${Font_color_suffix} Exit script
———————————————————————————————————————————————" && echo

	check_status
	if [[ ${kernel_status} == "noinstall" ]]; then
		echo -e "Current status: ${Green_font_prefix}Not installed${Font_color_suffix} Speed ​​up the kernel ${Red_font_prefix}Please install the kernel first${Font_color_suffix}"
	else
		echo -e "Current status: ${Green_font_prefix}Installed${Font_color_suffix} ${_font_prefix}${kernel_status}${Font_color_suffix} Speed ​​up the kernel, ${Green_font_prefix}${run_status}${Font_color_suffix}"
		
	fi
echo
read -p "Please enter the numbers [0-11]: " num
case "$num" in
	0)
	Update_Shell
	;;
	1)
	check_sys_bbr
	;;
	2)
	check_sys_bbrplus
	;;
	3)
	check_sys_Lotsever
	;;
	4)
	startbbr
	;;
	5)
	startbbrmod
	;;
	6)
	startbbrmod_nanqinlang
	;;
	7)
	startbbrplus
	;;
	8)
	startlotserver
	;;
	9)
	remove_all
	;;
	10)
	optimizing_system
	;;
	11)
	exit 1
	;;
	*)
	clear
	echo -e "${Error} Please enter the correct number [0-11]"
	sleep 5s
	start_menu
	;;
esac
}
#############Kernel management component#############

#Remove redundant cores
detele_kernel(){
	if [[ "${release}" == "centos" ]]; then
		rpm_total=`rpm -qa | grep kernel | grep -v "${kernel_version}" | grep -v "noarch" | wc -l`
		if [ "${rpm_total}" > "1" ]; then
			echo -e "${rpm_total} remaining cores are detected, start uninstalling..."
			for((integer = 1; integer <= ${rpm_total}; integer++)); do
				rpm_del=`rpm -qa | grep kernel | grep -v "${kernel_version}" | grep -v "noarch" | head -${integer}`
				echo -e "Start uninstalling the ${rpm_del} kernel..."
				rpm --nodeps -e ${rpm_del}
				echo -e "Uninstall ${rpm_del} The kernel has been uninstalled, continue..."
			done
			echo --nodeps -e "After the kernel has been unloaded, continue..."
		else
			echo -e "Incorrect number of cores detected, please check!" && exit 1
		fi
	elif [[ "${release}" == "debian" || "${release}" == "ubuntu" ]]; then
		deb_total=`dpkg -l | grep linux-image | awk '{print $2}' | grep -v "${kernel_version}" | wc -l`
		if [ "${deb_total}" > "1" ]; then
			echo -e "${deb_total} remaining cores are detected, uninstall..."
			for((integer = 1; integer <= ${deb_total}; integer++)); do
				deb_del=`dpkg -l|grep linux-image | awk '{print $2}' | grep -v "${kernel_version}" | head -${integer}`
				echo -e "Start uninstalling the ${deb_del} kernel..."
				apt-get purge -y ${deb_del}
				echo -e "Uninstall ${deb_del} The kernel has been uninstalled, continue..."
			done
			echo -e "After the kernel has been unloaded, continue..."
		else
			echo -e "Incorrect number of cores detected, please check!" && exit 1
		fi
	fi
}

#Update guide
BBR_grub(){
	if [[ "${release}" == "centos" ]]; then
        if [[ ${version} = "6" ]]; then
            if [ ! -f "/boot/grub/grub.conf" ]; then
                echo -e "${Error} /boot/grub/grub.conf cannot be found, please check."
                exit 1
            fi
            sed -i 's/^default=.*/default=0/g' /boot/grub/grub.conf
        elif [[ ${version} = "7" ]]; then
            if [ ! -f "/boot/grub2/grub.cfg" ]; then
                echo -e "${Error} /boot/grub2/grub.cfg cannot be found, please check."
                exit 1
            fi
            grub2-set-default 0
        fi
    elif [[ "${release}" == "debian" || "${release}" == "ubuntu" ]]; then
        /usr/sbin/update-grub
    fi
}

#############Kernel management component#############



#############System detection components#############

#Check the system
check_sys(){
	if [[ -f /etc/redhat-release ]]; then
		release="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
    fi
}

#Check Linux version
check_version(){
	if [[ -s /etc/redhat-release ]]; then
		version=`grep -oE  "[0-9.]+" /etc/redhat-release | cut -d . -f 1`
	else
		version=`grep -oE  "[0-9.]+" /etc/issue | cut -d . -f 1`
	fi
	bit=`uname -m`
	if [[ ${bit} = "x86_64" ]]; then
		bit="x64"
	else
		bit="x32"
	fi
}

#Check the system requirements for installing bbr
check_sys_bbr(){
	check_version
	if [[ "${release}" == "centos" ]]; then
		if [[ ${version} -ge "6" ]]; then
			installbbr
		else
			echo -e "${Error} The BBR kernel does not support the current system ${release} ${version} ${bit} !" && exit 1
		fi
	elif [[ "${release}" == "debian" ]]; then
		if [[ ${version} -ge "8" ]]; then
			installbbr
		else
			echo -e "${Error} The BBR kernel does not support the current system ${release} ${version} ${bit} !" && exit 1
		fi
	elif [[ "${release}" == "ubuntu" ]]; then
		if [[ ${version} -ge "14" ]]; then
			installbbr
		else
			echo -e "${Error} The BBR kernel does not support the current system ${release} ${version} ${bit} !" && exit 1
		fi
	else
		echo -e "${Error} The BBR kernel does not support the current system ${release} ${version} ${bit} !" && exit 1
	fi
}

check_sys_bbrplus(){
	check_version
	if [[ "${release}" == "centos" ]]; then
		if [[ ${version} -ge "6" ]]; then
			installbbrplus
		else
			echo -e "${Error} The BBRplus kernel does not support the current system ${release} ${version} ${bit} !" && exit 1
		fi
	elif [[ "${release}" == "debian" ]]; then
		if [[ ${version} -ge "8" ]]; then
			installbbrplus
		else
			echo -e "${Error} The BBRplus kernel does not support the current system ${release} ${version} ${bit} !" && exit 1
		fi
	elif [[ "${release}" == "ubuntu" ]]; then
		if [[ ${version} -ge "14" ]]; then
			installbbrplus
		else
			echo -e "${Error} The BBRplus kernel does not support the current system ${release} ${version} ${bit} !" && exit 1
		fi
	else
		echo -e "${Error} The BBRplus kernel does not support the current system ${release} ${version} ${bit} !" && exit 1
	fi
}


#Check the system requirements for installing Lotsever
check_sys_Lotsever(){
	check_version
	if [[ "${release}" == "centos" ]]; then
		if [[ ${version} == "6" ]]; then
			kernel_version="2.6.32-504"
			installlot
		elif [[ ${version} == "7" ]]; then
			yum -y install net-tools
			kernel_version="3.10.0-327"
			installlot
		else
			echo -e "${Error} Lotsever does not support the current system ${release} ${version} ${bit} !" && exit 1
		fi
	elif [[ "${release}" == "debian" ]]; then
		if [[ ${version} = "7" || ${version} = "8" ]]; then
			if [[ ${bit} == "x64" ]]; then
				kernel_version="3.16.0-4"
				installlot
			elif [[ ${bit} == "x32" ]]; then
				kernel_version="3.2.0-4"
				installlot
			fi
		elif [[ ${version} = "9" ]]; then
			if [[ ${bit} == "x64" ]]; then
				kernel_version="4.9.0-4"
				installlot
			fi
		else
			echo -e "${Error} Lotsever does not support the current system ${release} ${version} ${bit} !" && exit 1
		fi
	elif [[ "${release}" == "ubuntu" ]]; then
		if [[ ${version} -ge "12" ]]; then
			if [[ ${bit} == "x64" ]]; then
				kernel_version="4.4.0-47"
				installlot
			elif [[ ${bit} == "x32" ]]; then
				kernel_version="3.13.0-29"
				installlot
			fi
		else
			echo -e "${Error} Lotsever does not support the current system ${release} ${version} ${bit} !" && exit 1
		fi
	else
		echo -e "${Error} Lotsever does not support the current system ${release} ${version} ${bit} !" && exit 1
	fi
}

check_status(){
	kernel_version=`uname -r | awk -F "-" '{print $1}'`
	kernel_version_full=`uname -r`
	if [[ ${kernel_version_full} = "4.14.129-bbrplus" ]]; then
		kernel_status="BBRplus"
	elif [[ ${kernel_version} = "3.10.0" || ${kernel_version} = "3.16.0" || ${kernel_version} = "3.2.0" || ${kernel_version} = "4.4.0" || ${kernel_version} = "3.13.0"  || ${kernel_version} = "2.6.32" || ${kernel_version} = "4.9.0" ]]; then
		kernel_status="Lotserver"
	elif [[ `echo ${kernel_version} | awk -F'.' '{print $1}'` == "4" ]] && [[ `echo ${kernel_version} | awk -F'.' '{print $2}'` -ge 9 ]] || [[ `echo ${kernel_version} | awk -F'.' '{print $1}'` == "5" ]]; then
		kernel_status="BBR"
	else 
		kernel_status="noinstall"
	fi

	if [[ ${kernel_status} == "Lotserver" ]]; then
		if [[ -e /appex/bin/lotServer.sh ]]; then
			run_status=`bash /appex/bin/lotServer.sh status | grep "LotServer" | awk  '{print $3}'`
			if [[ ${run_status} = "running!" ]]; then
				run_status="Successfully started"
			else 
				run_status="Startup failed"
			fi
		else 
			run_status="No acceleration module installed"
		fi
	elif [[ ${kernel_status} == "BBR" ]]; then
		run_status=`grep "net.ipv4.tcp_congestion_control" /etc/sysctl.conf | awk -F "=" '{print $2}'`
		if [[ ${run_status} == "bbr" ]]; then
			run_status=`lsmod | grep "bbr" | awk '{print $1}'`
			if [[ ${run_status} == "tcp_bbr" ]]; then
				run_status="BBR started successfully"
			else 
				run_status="BBR failed to start"
			fi
		elif [[ ${run_status} == "tsunami" ]]; then
			run_status=`lsmod | grep "tsunami" | awk '{print $1}'`
			if [[ ${run_status} == "tcp_tsunami" ]]; then
				run_status="BBR Magic Revamp launched successfully"
			else 
				run_status="BBR Magic Revamp failed to start"
			fi
		elif [[ ${run_status} == "nanqinlang" ]]; then
			run_status=`lsmod | grep "nanqinlang" | awk '{print $1}'`
			if [[ ${run_status} == "tcp_nanqinlang" ]]; then
				run_status="Violent BBR Magic Revamp launched successfully"
			else 
				run_status="Violent BBR demo revision failed to start"
			fi
		else 
			run_status="No acceleration module installed"
		fi
	elif [[ ${kernel_status} == "BBRplus" ]]; then
		run_status=`grep "net.ipv4.tcp_congestion_control" /etc/sysctl.conf | awk -F "=" '{print $2}'`
		if [[ ${run_status} == "bbrplus" ]]; then
			run_status=`lsmod | grep "bbrplus" | awk '{print $1}'`
			if [[ ${run_status} == "tcp_bbrplus" ]]; then
				run_status="BBRplus started successfully"
			else 
				run_status="BBRplus failed to start"
			fi
		else 
			run_status="No acceleration module installed"
		fi
	fi
}

#############System detection components#############
check_sys
check_version
[[ ${release} != "debian" ]] && [[ ${release} != "ubuntu" ]] && [[ ${release} != "centos" ]] && echo -e "${Error} This script does not support the current system ${release} !" && exit 1
start_menu
}
function limitspeed(){
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(cat /home/limit)
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');
function start () {
echo -e "Limit Speed All Service"
read -p "Set maximum download rate (in Kbps): " down
read -p "Set maximum upload rate (in Kbps): " up
if [[ -z "$down" ]] && [[ -z "$up" ]]; then
echo > /dev/null 2>&1
else
echo "Start Configuration"
sleep 0.5
wondershaper -a $NIC -d $down -u $up > /dev/null 2>&1
systemctl enable --now wondershaper.service
echo "start" > /home/limit
echo "Done"
fi
}
function stop () {
wondershaper -ca $NIC
systemctl stop wondershaper.service
echo "Stop Configuration"
sleep 0.5
echo > /home/limit
echo "Done"
}
if [[ "$cek" = "start" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e "=================================="
echo -e "    Limit Bandwidth Speed $sts    "
echo -e "=================================="
echo -e "[1]. Start Limit"
echo -e "[2]. Stop Limit"
echo -e "==============================="
read -rp "Please Enter The Correct Number : " -e num
if [[ "$num" = "1" ]]; then
start
elif [[ "$num" = "2" ]]; then
stop
else
clear
echo " You Entered The Wrong Number"
menu
fi
}
function m-dns(){
#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);

colornow=$(cat /etc/casper/theme/color.conf)
NC="\e[0m"
COLOR1="$(cat /etc/casper/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/casper/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

export RED='\033[0;31m';
export GREEN='\033[0;32m';
export ERROR="[${RED}ERROR${NC}]";
export INFO="[${GREEN}INFo${NC}]";


function setdns(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 • USERS LOGS •                ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -p "   DNS : " setdnss

if [ -z $setdnss ]; then
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  ${ERROR} DNS Cannot Be Empty";
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• C A S P E R •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
else
echo "$setdnss" > /root/dns
echo -e "$COLOR1 ${NC}  ${INFO} Copy DNS To Resolv.conf";
echo "nameserver $setdnss" > /etc/resolv.conf
sleep 2
echo -e "$COLOR1 ${NC}  ${INFO} Copy DNS To Resolv.conf.d/head";
echo "nameserver $setdnss" > /etc/resolvconf/resolv.conf.d/head
sleep 2
echo -e "$COLOR1 ${NC}  ${INFO} DNS Update Successfully";
fi
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• C A S P E R •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
}

function resdns(){
    clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 • USERS LOGS •                ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -p "    Reset Default DNS [Y/N]: " -e answer
if [[ "$answer" = 'y' ]]; then
dnsfile="/root/dns"
if test -f "$dnsfile"; then
rm /root/dns
fi
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  ${INFO} Delete Resolv.conf DNS";
echo "nameserver 8.8.8.8" > /etc/resolv.conf
sleep 2
echo -e "$COLOR1 ${NC}  ${INFO} Delete Resolv.conf.d/head DNS";
echo "nameserver 8.8.8.8" > /etc/resolvconf/resolv.conf.d/head
sleep 2
else
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}   $INFO Operation Cancelled By User"
fi
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• C A S P E R •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
}

function check-dns(){
    bash <(curl -sSL https://raw.githubusercontent.com/casper9/perv1/main/install/ceknet.sh)
read -n 1 -s -r -p "   Press any key to back on menu"
menu
}

clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 • USERS LOGS •                ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"

dnsfile="/root/dns"
if test -f "$dnsfile"; then
udns=$(cat /root/dns)
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}   Active DNS : $udns"
echo -e "$COLOR1 ${NC}"
fi
echo -e "$COLOR1 ${NC}  ${WH}[${COLOR1}01${WH}]$NC ${COLOR1}• ${WH}CHANGE DNS       ${WH}[${COLOR1}03${WH}]$NC ${COLOR1}• ${WH}CONTENT CEK"
echo -e "$COLOR1 ${NC}  ${WH}[${COLOR1}02${WH}]$NC ${COLOR1}• ${WH}RESET DNS        ${WH}[${COLOR1}04${WH}]$NC ${COLOR1}• ${WH}REBOOT"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  ${WH}[${COLOR1}00${WH}]$NC ${COLOR1}• ${WH}GO BACK${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• C A S P E R •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; setdns ;;
02 | 2) clear ; resdns ;;
03 | 3) clear ; check-dns ;;
04 | 4) clear ; renewipvps ;;
05 | 5) clear ; useripvps ;;
06 | 6) clear ; $ressee ;;
00 | 0) clear ; menu ;;
*) clear ; m-dns ;;
esac
}
function certv2ray(){
echo -e ""
echo start
sleep 0.5
source /var/lib/ipvps.conf
domain=$(cat /etc/xray/domain)
STOPWEBSERVER=$(lsof -i:89 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
rm -rf /root/.acme.sh
mkdir /root/.acme.sh
systemctl stop $STOPWEBSERVER
systemctl stop nginx
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --register-account -m casper@slowapp.cfd
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
chmod 777 /etc/xray/xray.key  
systemctl restart nginx
systemctl restart xray
menu
}
function clearcache(){
clear
echo ""
echo ""
echo -e "[ \033[32mInfo\033[0m ] Clear RAM Cache"
echo 1 > /proc/sys/vm/drop_caches
sleep 3
echo -e "[ \033[32mok\033[0m ] Cache cleared"
echo ""
echo "Back to menu in 2 sec "
sleep 2
menu
}
function m-bot2(){
clear
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1  ${WH}Please select a Bot type below                 ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1  [ 1 ] ${WH}Buat/Edit BOT INFO Multi Login SSH, & XRAY       ${NC}"
echo -e ""
echo -e "$COLOR1  [ 2 ] ${WH}Buat/Edit BOT INFO Create User & Lain Lain    ${NC}"
echo -e ""
echo -e "$COLOR1  [ 3 ] ${WH}Buat/Edit BOT INFO Backup Telegram    ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
read -p "   Please select numbers 1-3 or Any Button(Random) to exit : " bot
echo ""
if [[ $bot == "1" ]]; then
clear
rm -rf /etc/perlogin
mkdir -p /etc/perlogin
cd /etc/perlogin
touch token
touch id
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Multi Login"
read -rp "Enter Token (Creat on @BotFather) : " -e token2
echo "$token2" > token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idat
echo "$idat" > id
sleep 1
m-bot2
fi
if [[ $bot == "2" ]]; then
clear
rm -rf /etc/per
mkdir -p /etc/per
cd /etc/per
touch token
touch id
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Akun Dan Lain Lain"
read -rp "Enter Token (Creat on @BotFather) : " -e token3
echo "$token3" > token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idat2
echo "$idat2" > id
sleep 1
m-bot2
fi
if [[ $bot == "3" ]]; then
clear
rm -rf /usr/bin/token
rm -rf /usr/bin/idchat
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Backup Telegram"
read -rp "Enter Token (Creat on @BotFather) : " -e token23
echo "$token23" > /usr/bin/token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idchat
echo "$idchat" > /usr/bin/idchat
sleep 1
m-bot2
fi
menu
}
function m-webmin() {
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[Installed]${Font_color_suffix}"
Error="${Red_font_prefix}[Not Installed]${Font_color_suffix}"
cek=$(netstat -ntlp | grep 10000 | awk '{print $7}' | cut -d'/' -f2)
function install () {
IP=$(wget -qO- ifconfig.me/ip);
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m        • INSTALL WEBMIN •         \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 0.5
echo ""
echo -e "\033[32m[Info]\033[0m Adding Repository Webmin"
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
apt install gnupg gnupg1 gnupg2 -y > /dev/null 2>&1
wget http://www.webmin.com/jcameron-key.asc > /dev/null 2>&1
apt-key add jcameron-key.asc > /dev/null 2>&1
sleep 0.5
echo -e "\033[32m[Info]\033[0m Start Install Webmin"
sleep 0.5
apt update > /dev/null 2>&1
apt install webmin -y > /dev/null 2>&1
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
echo -e "\033[32m[Info]\033[0m Restart Webmin"
/etc/init.d/webmin restart > /dev/null 2>&1
rm -f /root/jcameron-key.asc > /dev/null 2>&1
sleep 0.5
echo -e "\033[32m[Info]\033[0m Webmin Install Successfully !"
echo ""
echo " $IP:10000"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-webmin
}
function restart () {
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m        • RESTART WEBMIN •         \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 0.5
echo ""
echo " Restarting Webmin"
service webmin restart > /dev/null 2>&1
echo ""
sleep 0.5
echo -e "\033[32m[Info]\033[0m Webmin Start Successfully !"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-webmin
}
function uninstall () {
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m       • UNINSTALL WEBMIN •        \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 0.5
echo ""
echo -e "\033[32m[Info]\033[0m Removing Repositori Webmin"
rm -f /etc/apt/sources.list.d/webmin.list
apt update > /dev/null 2>&1
sleep 0.5
echo -e "\033[32m[Info]\033[0m Start Uninstall Webmin"
apt autoremove --purge webmin -y > /dev/null 2>&1
sleep 0.5
echo -e "\033[32m[Info]\033[0m Webmin Uninstall Successfully !"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-webmin
}
if [[ "$cek" = "perl" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m          • WEBMIN MENU •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " Status $sts"
echo -e " [\e[36m•1\e[0m] Install Webmin"
echo -e " [\e[36m•2\e[0m] Restart Webmin"
echo -e " [\e[36m•3\e[0m] Uninstall Webmin"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -rp " Please Enter The Correct Number : " -e num
if [[ "$num" = "1" ]]; then
install
elif [[ "$num" = "2" ]]; then
restart
elif [[ "$num" = "3" ]]; then
uninstall
elif [[ "$num" = "0" ]]; then
menu
elif [[ "$num" = "x" ]]; then
exit
else
clear
echo " You Entered The Wrong Number"
sleep 2
m-webmin
fi
}
function speed(){
cd
if [[ -e /etc/speedi ]]; then
speedtest
else
sudo apt-get install curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install speedtest
touch /etc/speedi
speedtest
fi
}
function gotopp(){
cd
if [[ -e /usr/bin/gotop ]]; then
gotop
else
git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop &> /dev/null
/tmp/gotop/scripts/download.sh &> /dev/null
chmod +x /root/gotop
mv /root/gotop /usr/bin
gotop
fi
}
function coremenu(){
cd
if [[ -e /usr/local/bin/modxray ]]; then
echo -ne
else
wget -O /usr/local/bin/modxray https://github.com/dharak36/Xray-core/releases/download/v1.0.0/xray.linux.64bit &> /dev/null
fi
cd
if [[ -e /usr/local/bin/offixray ]]; then
echo -ne
else
cp -r /usr/local/bin/xray /usr/local/bin/offixray &> /dev/null
fi
clear
echo -e " "
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ ${WH}Please select a your Choice to Set CORE MENU           ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│  [ 1 ]  ${WH}XRAY CORE OFFICIAL       ${NC}"
echo -e "$COLOR1│"
echo -e "$COLOR1│  [ 2 ]  ${WH}XRAY CORE MOD DHARAK    ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
until [[ $core =~ ^[0-9]+$ ]]; do 
read -p "   Please select numbers 1-2 or Any Button(EXIT) : " core
done
if [[ $core == "1" ]]; then
clear
echo -e " "
cp -r /usr/local/bin/offixray /usr/local/bin/xray &> /dev/null
chmod 755 /usr/local/bin/xray
systemctl restart xray
echo -e "$COLOR1 [ INFO ] ${WH}Succes Change Xray Core Official"
fi
if [[ $core == "2" ]]; then
clear
echo -e " "
cp -r /usr/local/bin/modxray /usr/local/bin/xray &> /dev/null
chmod 755 /usr/local/bin/xray
systemctl restart xray
echo -e  "$COLOR1 [ INFO ] ${WH}Succes Change Xray Core Mod Dharak"
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function dobot(){
clear
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ ${WH}Please select a your Choice to Set           ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│  [ 1 ]  ${WH}INSTAL BOT CRATE AKUN DIGITAL OCEAN      ${NC}"
echo -e "$COLOR1│"
echo -e "$COLOR1│  [ 2 ]  ${WH}COPY BOT CREATE AKUN DIGITAL OCEAN   ${NC}"
if [[ -e /etc/cron.d/bantwidth ]]; then
echo -ne
else
echo -e "$COLOR1│"
echo -e "$COLOR1│  [ 3 ]  ${WH}SET BANTWIDTH BUAT JUALAN DIGITAL OCEAN${NC}"
fi
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
until [[ $dobot =~ ^[0-9]+$ ]]; do 
read -p "   Please select numbers 1-3 or Any Button(BACK) : " dobot
done
if [[ $dobot == "1" ]]; then
clear
wget https://raw.githubusercontent.com/casper9/dobot/main/install.sh &> /dev/null
chmod +x install.sh
bash install.sh
rm -rf install.sh
fi
if [[ $dobot == "2" ]]; then
clear
if [[ -e /etc/dobot ]]; then
echo -ne
else
echo -e " SILAHKAN INSTALL DULU BOT CREATE AKUN DIGITAL OCEAN NYA"
read -n 1 -s -r -p "Press any key to back on menu"
m-system
fi
until [[ $dobot2 =~ ^[0-9]+$ ]]; do 
read -p "   SILAHKAN TULIS COPY BOTNYA CONTOH 1 atau 3 : " dobot2
done

if [[ -e /etc/dobot${dobot2} ]]; then
echo -e "Angka Copyan Sudah ADA Silahkan tulis Angka yg lain"
read -n 1 -s -r -p "Press any key to back on menu"
m-system
fi

cp -r /etc/dobot /etc/dobot${dobot2}
read -e -p "[*] Input your Nama Store : " nama
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin

rm -rf /etc/dobot${dobot2}/config.json

cat > /etc/dobot${dobot2}/config.json << END
{
  "BOT": {
    "NAME": "$nama",
    "TOKEN": "$bottoken",
    "ADMINS": [$admin
    ]
  }
}
END

cat > /etc/systemd/system/dobot${dobot2}.service << END
[Unit]
Description=SGDO
After=network.target

[Service]
WorkingDirectory=/etc/dobot${dobot2}
ExecStart=/usr/bin/python3 -m main
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl enable dobot${dobot2}
systemctl start dobot${dobot2}
systemctl restart dobot${dobot2}
echo -e "SILAHKAN KETIK /start di botnya"
fi
if [[ $dobot == "3" ]]; then
if [[ -e /etc/cron.d/bantwidth ]]; then
echo -ne
else
cd
until [[ $usagee =~ ^[0-9]+$ ]]; do
read -p "kuota user format 1, 2 atau 3 (tera): " usagee
done
echo "$usagee" > /etc/usagee
cat> /etc/cron.d/bantwidth << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/10 * * * * root /usr/bin/bantwidth
END
echo "Auto-Shutdown $usagee TERA TURN ON."
sleep 1
fi
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function speed2(){
apt install -y neofecth >/dev/null
clear
neofetch
speedtest
}
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SYSTEM MENU •                 ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}CHANGE DOMAIN   ${WH}    ${WH}[${COLOR1}09${WH}]${NC} ${COLOR1}• ${WH}GANTI BANNER${WH}        $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}SPEEDTEST   ${WH}        ${WH}[${COLOR1}10${WH}]${NC} ${COLOR1}• ${WH}INSTALL ADBLOCK/PANEL ${WH} $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}AUTO REBOOT   ${WH}      ${WH}[${COLOR1}11${WH}]${NC} ${COLOR1}• ${WH}BUAT DATABAESE BOT INFO  ${WH}        $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}CHECK BANDWITH${WH}      ${WH}[${COLOR1}12${WH}]${NC} ${COLOR1}• ${WH}RENEW CERTV2RAY FIX NGINX OFF${WH}  $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}INSTALL WEBMIN${WH}      ${WH}[${COLOR1}13${WH}]${NC} ${COLOR1}• ${WH}CEK PERFORMA VPS ${WH}   $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}INSTALL TCP BBR ${WH}    ${WH}[${COLOR1}14${WH}]${NC} ${COLOR1}• ${WH}GANTI CORE MENU ${WH}   $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}GANTI TEMA WARNA${WH}    ${WH}[${COLOR1}15${WH}]${NC} ${COLOR1}• ${WH}BOT DIGITAL OCEAN MENU ${WH}   $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}08${WH}]${NC} ${COLOR1}• ${WH}LIMIT SPEED${WH}         ${WH}[${COLOR1}16${WH}]${NC} ${COLOR1}• ${WH}BOT CREATE AKUN MENU ${WH}   $COLOR1 $NC" 
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK $NC         ${WH}[${COLOR1}99${WH}]${NC} ${COLOR1}• ${WH}CLEAR RAM CACHE ${WH}    $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 |1) clear ; add-host ; exit ;;
02 |2) clear ; speed2 ; exit ;;
03 |3) clear ; auto-reboot ; exit ;;
04 |4) clear ; bw ; exit ;;
05 |5) clear ; m-webmin ; exit ;;
06 |6) clear ; m-tcp ; exit ;;
07 |7) clear ; m-theme ; exit ;;
08 |8) clear ; limitspeed ; exit ;;
09 |9) clear ; nano /etc/issue.net ; exit ;;
10 |10) clear ; ins-helium ;;
11 |11) clear ; m-bot2 ; exit ;;
12 |12) clear ; certv2ray ; exit ;;
13 |13) clear ; gotopp ; exit ;;
14 |14) clear ; coremenu ; exit ;;
15 |15) clear ; dobot ; exit ;;
15 |16) clear ; m-bot ; exit ;;
99 |99) clear ; clearcache ; exit ;;
00 |0) clear ; menu ; exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; m-system ;;
esac 