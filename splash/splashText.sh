#!/bin/bash

colorsException=291
format="\e[1m\e[33m"
isMissing=false

if [ -z "$MINECRAFT_SPLASH_TEXT_PATH" ]; then
	export MINECRAFT_SPLASH_TEXT_PATH=$(find -P ~ | grep "splashText.sh" | head -n 1 | rev | cut -d '/' -f 2- | rev)
fi

if [ ! -e "${MINECRAFT_SPLASH_TEXT_PATH}/minecraft-splash-texts.txt" ]; then
	isMissing=true
else

	if [ -z "$MINECRAFT_SPLASH_TEXT_NUMBER" ] || [ "$1" == "new" ]; then
		if [ ! -e "${MINECRAFT_SPLASH_TEXT_PATH}/minecraft-splash-total.txt" ]; then
			cat "${MINECRAFT_SPLASH_TEXT_PATH}/minecraft-splash-texts.txt" | wc -l > "${MINECRAFT_SPLASH_TEXT_PATH}/minecraft-splash-total.txt"
			isMissing=true
		fi
		nbMessages=$(cat "${MINECRAFT_SPLASH_TEXT_PATH}/minecraft-splash-total.txt")
		line=$((1+$RANDOM % $nbMessages))
		export MINECRAFT_SPLASH_TEXT_NUMBER=$line
	else
		line=$MINECRAFT_SPLASH_TEXT_NUMBER
	fi

fi

if [ $isMissing == true ]; then
	msg="missingno"
else
	msg=$(cat "${MINECRAFT_SPLASH_TEXT_PATH}/minecraft-splash-texts.txt" | sed "${line}q;d" | cut -d ':' -f 2)
fi

if [ "$line" == "$colorsException" ]; then
	echo -e "\e[1m\e[34mC\e[32mo\e[36ml\e[31mo\e[35mr\e[33mm\e[0m\e[1ma\e[30mt\e[34mi\e[32mc\e[34m\e[36m!\e[0m"
else
	echo -e "${format}${msg}\e[0m"
fi
