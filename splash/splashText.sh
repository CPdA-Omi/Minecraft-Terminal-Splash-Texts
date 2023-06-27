#!/bin/bash

colorsException=291
format="\e[1m\e[33m"

if [ -z "$MINECRAFT_SPLASH_TEXT_PATH" ]; then
	export MINECRAFT_SPLASH_TEXT_PATH=$(find -P ~ | grep minecraft-splash-texts | head -n 1)
fi

if [ -z "$MINECRAFT_SPLASH_TEXT_NUMBER" ] || [ "$1" == "new" ]; then
	nbMessages=$(cat $MINECRAFT_SPLASH_TEXT_PATH | wc -l)
	line=$((1+$RANDOM % $nbMessages))
	export MINECRAFT_SPLASH_TEXT_NUMBER=$line
else
	line=$MINECRAFT_SPLASH_TEXT_NUMBER
fi
	
msg=$(cat $MINECRAFT_SPLASH_TEXT_PATH | sed "${line}q;d" | cut -d ':' -f 2)

if [ "$line" == "$colorsException" ]; then
	echo -e "\e[1m\e[34mC\e[32mo\e[36ml\e[31mo\e[35mr\e[33mm\e[0m\e[1ma\e[30mt\e[34mi\e[32mc\e[34m\e[36m!\e[0m"
else
	echo -e "$format$msg\e[0m"
fi
