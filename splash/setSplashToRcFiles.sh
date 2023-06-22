#!/bin/bash

MINECRAFT_SPLASH_TEXT_PATH=$(find -P ~ | grep splashText.sh | head -n 1)

#bashrc
if [ -e ~/.bashrc ]; then
	if [ $(cat ~/.bashrc | grep ". ${MINECRAFT_SPLASH_TEXT_PATH}" | wc -l) -eq 0 ]; then
		echo "# Minecraft Terminal Splash Texts by CPdA-Omi
if [ -f ${MINECRAFT_SPLASH_TEXT_PATH} ]; then
	. ${MINECRAFT_SPLASH_TEXT_PATH}
fi
# uncomment the following line if you want a new alias to display the message
# alias mcst='. ${MINECRAFT_SPLASH_TEXT_PATH}'
" >> ~/.bashrc
		echo "~$USER/.bashrc updated with splashText.sh"
	else
		echo "splashText.sh already in your bashrc (thank you)"
	fi
fi

#zshrc
if [ -e ~/.zshrc ]; then
	if [ $(cat ~/.zshrc | grep ". ${MINECRAFT_SPLASH_TEXT_PATH}" | wc -l) -eq 0 ]; then
		echo "# Minecraft Terminal Splash Texts by CPdA-Omi
if [ -f ${MINECRAFT_SPLASH_TEXT_PATH} ]; then
	$(echo $MINECRAFT_SPLASH_TEXT_PATH | cut -d '/' -f-$(echo $MINECRAFT_SPLASH_TEXT_PATH | grep -o '/' | wc -l))/./splashText.sh
fi
# uncomment the following line if you want a new alias to display the message
# alias mcst='$(echo $MINECRAFT_SPLASH_TEXT_PATH | cut -d '/' -f-$(echo $MINECRAFT_SPLASH_TEXT_PATH | grep -o '/' | wc -l))/./splashText.sh'
" >> ~/.zshrc
		echo "~$USER/.zshrc updated with splashText.sh"
	else
		echo "splashText.sh already in your zshrc (thank you)"
	fi
fi
