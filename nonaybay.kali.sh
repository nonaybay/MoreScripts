#!/usr/bin/bash

if [ $(whoami) != root ]; then
    clear && printf "\nPlease, login as root\n\n" && exit
fi


sources="/etc/apt/sources.list"

rm -rf $sources

mirror="http://http.kali.org"
branch="kali-rolling"
components="main contrib non-free"

echo "deb       ${mirror}   ${branch}   ${components}" >> $sources
echo "deb-src   ${mirror}   ${branch}   ${components}" >> $sources
