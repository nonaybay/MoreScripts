#!/usr/bin/bash

currentrelease="$1"
repomirror="http://http.debian.net/debian"
repobranch="$1"
repocomponent="main"
sources="/etc/apt/sources.list"


if [ $(whoami) != root ]; then
        clear
        printf "\nPlease, login as root and try again\n\n"
        printf "Note that running <<< sudo nonaybay.debian.sources.list.sh >>> will not work.\nYou really need to be logged in as root\n\n"
        printf "Try running <<< sudo -s >>>\n\n"
        exit 1
fi


# ===== Remove current sources
clear && sleep 1 && printf "\nRemoving current sources.list located at ${sources}\n\n"
rm -fv ${sources} && printf "\nDone!\n\n"
sleep 2


# ===== My way to get the release name
clear && sleep 1 && printf "\nTesting with ${currentrelease}...\n\n"
echo "deb ${repomirror} ${repobranch} ${repocomponent}" >> ${sources}
apt-get update && apt-get reinstall base-files && printf "\nDone!\n\n"
sleep 2


# ===== Store new values
clear && sleep 1 && printf "\nStoring new values...\n\n"
oldrepobranch=$repobranch
repobranch="$(lsb_release -sc)"
oldrepocomponent=$repocomponent
repocomponent="main contrib non-free"
printf "\nChanged repo branch from [ ${oldrepobranch} ] to [ ${repobranch} ]" && sleep 1
printf "\nChanged repo components from [ ${oldrepocomponent} ] to [ ${repocomponent} ]\n" && printf "\nDone!\n\n"
sleep 2


# ===== Add new repos
clear && sleep 1 && printf "\nAdding final repositories...\n\n"
rm -f ${sources} && sleep 1 && printf "\n"


if [[ $oldrepobranch == "stable" ]]; then

    echo "deb       ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}           ${repobranch}-updates                   ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}           ${repobranch}-proposed-updates          ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}           ${repobranch}-backports                 ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}           ${repobranch}-backports-sloppy          ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}-debug     ${repobranch}-debug                     ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}-debug     ${repobranch}-proposed-updates-debug    ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}-debug     ${repobranch}-backports-debug           ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}-security  ${repobranch}-security/updates          ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}-updates                   ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}-proposed-updates          ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}-backports                 ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}-backports-sloppy          ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}-debug     ${repobranch}-debug                     ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}-debug     ${repobranch}-proposed-updates-debug    ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}-debug     ${repobranch}-backports-debug           ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}-security  ${repobranch}-security/updates          ${repocomponent}" >> ${sources}

fi


if [[ $oldrepobranch == "testing" ]]; then

    echo "deb       ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}           ${repobranch}-updates                   ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}           ${repobranch}-proposed-updates          ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}           ${repobranch}-backports                 ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}-debug     ${repobranch}-debug                     ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}-debug     ${repobranch}-proposed-updates-debug    ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}-debug     ${repobranch}-backports-debug           ${repocomponent}" >> ${sources}
    echo "deb       ${repomirror}-security  ${repobranch}-security/updates          ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}-updates                   ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}-proposed-updates          ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}-backports                 ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}-debug     ${repobranch}-debug                     ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}-debug     ${repobranch}-proposed-updates-debug    ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}-debug     ${repobranch}-backports-debug           ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}-security  ${repobranch}-security/updates          ${repocomponent}" >> ${sources}

    # from kali section
    repomirror="http://http.kali.org"

    repobranch="debian-testing"
    echo "deb       ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}
    
    repobranch="kali-debian-picks"
    echo "deb       ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}

    repobranch="kali-experimental"
    echo "deb       ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}

    repobranch="kali-bleeding-edge"
    echo "deb       ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}
    echo "deb-src   ${repomirror}           ${repobranch}                           ${repocomponent}" >> ${sources}

fi


apt-get update && printf "\nDone!\n\n"
sleep 2



# ===== End
clear && sleep 1 && printf "\nDone, exiting\n\n"
