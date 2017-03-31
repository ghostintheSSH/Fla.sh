#!/bin/bash

#Paper-light flashcards in under 75 lines of bash
#Original version coded by Joliv
#Forked version coded by SSH[ghost]


DIR=~/Flashcards
clear
if [[ ! -d $DIR ]]; then
	mkdir $DIR
fi
cd $DIR

if [[ -z $2 ]]; then
	CMD=$(basename $0)
	echo "Usage:"
	echo "  $CMD w(rite) <file...>"
	echo "  $CMD t(est)  <file...>"
	echo "  $CMD e(rase) <file...>"
	echo
	echo "Make sure an argument and a flashcard name are entered"
	exit 1
fi

case "$1" in
	[wW] | [wW]rite)
		if [[ ! -f $2 ]]; then
			touch $2
			NUMBER=1
		else
			NUMBER=$(grep -Eo '[0-9]+' $2 | tail -n 1)
			if [ "$NUMBER" -gt 0 ]; then
				((NUMBER++))
			fi
		fi
		while true; do
			read -p "Prompt: " PROMPT
			read -p "Answer: " ANSWER
			[[ $PROMPT == *"?" ]] || PROMPT+="?"
			echo $NUMBER")" $PROMPT $ANSWER >> $2
			((NUMBER++))
		done ;;
	[tT] | [tT]est)
		while true; do
			TEST=$(shuf -n 1 $2)
			IFS='?' read -ra CARDS <<< "$TEST"
			read -p "${CARDS[0]}? "
			echo ${CARDS[1]}
			sleep 5s
			clear
		done ;;
	[eE] | [eE]rase)
		cat $2 && echo
		read -p "Enter the number relating to the specific question you want to erase: " ERASE
		sed -i "/$ERASE/d" $2
		cat $2 | while read ANSWERS; do
			IFS=')' read -ra CARDS <<< $ANSWERS
			if [[ ${CARDS[0]} -gt $ERASE ]]; then
				sed -i "/${CARDS[0]}/d" $2
				((CARDS[0]--))
				echo ${CARDS[0]}")" ${CARDS[1]} >> $2 
			fi
		done
		echo && cat $2 && echo ;;
	*)
		CMD=$(basename $0)
		echo "Usage:"
		echo "  $CMD w(rite) <file...>"
		echo "  $CMD t(est)  <file...>"
		echo "  $CMD e(rase) <file...>" ;;
esac
