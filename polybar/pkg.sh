#!/bin/bash

pac=$(checkupdates | wc -l)
aur=$(yaourt -Qqu -a | wc -l)



echo "$pac $aur" >> ~/tmp.log
check=$((pac + aur))
echo " $check" >> ~/tmp.log
if [[ "$check" != "0" ]]
then
    echo "$pac $aur"
fi
