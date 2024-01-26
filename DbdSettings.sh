#!/bin/sh

echo "__        __       _                                _ 
\ \\      / /  ___ | |  ___   ___   _ __ ___    ___ | |
 \\ \\ /\\ / /  / _ \\| | / __| / _ \\ | '_ \` _ \\  / _ \\| |
  \\ V  V /  |  __/| || (__ | (_) || | | | | ||  __/|_|
   \\_/\\_/    \\___||_| \\___| \\___/ |_| |_| |_| \\___|(_)
                                                   "

echo "All Dead By Daylight paths: " 
find /home -name DeadByDaylight


gamepath=$(find /home -name DeadByDaylight)
gamename="DeadByDaylight"

echo Enter the address with AppData/Local
read ADDRESS

if [[ $ADDRESS = *"DeadByDaylight"* ]] && [[ $ADDRESS = *"AppData"* ]] && [[ $ADDRESS = *"Local"* ]]; then
       	echo *****Game Address Found*******
else
	echo Game Address wrong, program terminate
	exit 1
fi

ADDRESS="${ADDRESS}/Saved/Config/WindowsClient/"


while [ 1 ]
do
message=$'Choose one of the three options :-\n\t1 - Change Engine.ini file\n\t2 - Change GameUserSettings.ini file\n\t3 - exit'

echo "$message"
read num

if [ $num = 1 ]
then
	echo "Enter your new Engine.ini file path * make sure to name it Engine.ini *"
	read enginepath
	sudo mkdir ~/Desktop/oldenginefile
	sudo mv "${ADDRESS}Engine.ini" ~/Desktop/oldenginefile
	sudo mv $enginepath $ADDRESS
	chmod u-w "${ADDRESS}Engine.ini"
	echo Process has been done successfully
elif [ $num = 2 ]
then
	echo "Enter your new GameUserSettings.ini file path * make sure to name it GameUserSettings.ini *"
	read gamespath
	sudo mkdir ~/Dekstop/oldgamesettingsfile
	sudo mv "${ADDRESS}GameUserSettings.ini" ~/Desktop/oldgamesettingsfile
	sudo mv $gamespath $ADDRESS
	chmod u-w "${ADDRESS}GameUserSettings.ini"
	echo Process has been done successfully
elif [ $num = 3 ]
then
	exit 0
else 
	echo "wrong number, "
fi
done
