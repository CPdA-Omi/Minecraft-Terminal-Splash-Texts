#!/bin/bash

MINECRAFT_SPLASH_TEXT_PATH=$(find -P ~ | grep splashText.sh | head -n 1 | rev | cut -d '/' -f 2- | rev)

if [ ! -e "$MINECRAFT_SPLASH_TEXT_PATH/minecraft-splash-total" ]; then
	echo $(cat "$MINECRAFT_SPLASH_TEXT_PATH/minecraft-splash-texts" | wc -l) > "$MINECRAFT_SPLASH_TEXT_PATH/minecraft-splash-total"
	echo "file \"minecraft-splash-total\" created at $MINECRAFT_SPLASH_TEXT_PATH"
else #need update?
	if [ $(cat "$MINECRAFT_SPLASH_TEXT_PATH/minecraft-splash-total") -ne $(cat "$MINECRAFT_SPLASH_TEXT_PATH/minecraft-splash-texts" | wc -l) ]; then
		echo $(cat "$MINECRAFT_SPLASH_TEXT_PATH/minecraft-splash-texts" | wc -l) > "$MINECRAFT_SPLASH_TEXT_PATH/minecraft-splash-total"
		echo "file \"minecraft-splash-total\" updated at $MINECRAFT_SPLASH_TEXT_PATH"
	else
		echo "file \"minecraft-splash-total\" already up to date (thank you)"
	fi
fi

#bashrc
if [ -e ~/.bashrc ]; then
	if [ $(cat ~/.bashrc | grep ". ${MINECRAFT_SPLASH_TEXT_PATH}/splashText.sh" | wc -l) -eq 0 ]; then
		echo "# Minecraft Terminal Splash Texts by CPdA-Omi
if [ -f ${MINECRAFT_SPLASH_TEXT_PATH}/splashText.sh ]; then
	. ${MINECRAFT_SPLASH_TEXT_PATH}/splashText.sh
fi
# uncomment the following line if you want a new alias to display the message
# alias mcst='. ${MINECRAFT_SPLASH_TEXT_PATH}/splashText.sh'
" >> ~/.bashrc
		echo "~$USER/.bashrc updated with splashText.sh"
	else
		echo "splashText.sh already in your bashrc (thank you)"
	fi
fi

#zshrc
if [ -e ~/.zshrc ]; then
	if [ $(cat ~/.zshrc | grep ". ${MINECRAFT_SPLASH_TEXT_PATH}/splashText.sh" | wc -l) -eq 0 ]; then
		echo "# Minecraft Terminal Splash Texts by CPdA-Omi
if [ -f ${MINECRAFT_SPLASH_TEXT_PATH}/splashText.sh ]; then
	${MINECRAFT_SPLASH_TEXT_PATH}/./splashText.sh
fi
# uncomment the following line if you want a new alias to display the message
# alias mcst='$(echo "$MINECRAFT_SPLASH_TEXT_PATH/splashText.sh")/./splashText.sh'
" >> ~/.zshrc
		echo "~$USER/.zshrc updated with splashText.sh"
	else
		echo "splashText.sh already in your zshrc (thank you)"
	fi
fi
