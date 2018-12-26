#!/bin/sh

arr_soft=(
lrzsz
telnet
man
vim
gcc-c++
cmake
unzip
git
ntpdate
samba
expect
#zabbix-get
#httpd
)

RETVAL=0
function CheckInstall()
{
    txt=`rpm -qa $1 |grep $1`
    if [ -n "$txt" ];then
        printf "\033[36m %s \033[0m is installed\t%s\n" $1  $txt
        RETVAL=0
    else
        txt=`rpm -qa|grep $1`
        if [ -n "$txt" ];then
            printf "\033[33m %s \033[0m is installed\t" $1 
            echo $txt
            RETVAL=0
        else
            RETVAL=1
        fi
    fi
}

for n in  ${arr_soft[*]}
do
    CheckInstall $n
    if [ $RETVAL -eq 0 ];then
        continue
    else
        echo "$n is installing..... "
        yum install -y $n >>/dev/null
        CheckInstall $n
        [ $RETVAL -ne 0 ] &&  printf "\033[31m %s \033[0m install failed\n" $n
    fi



done


