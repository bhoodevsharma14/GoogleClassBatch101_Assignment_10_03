#!/bin/bash -x

	read -p "Enter How many times You Want to Flip Coin : " Total_Flips

	declare -A Singlet

	function persentage()
	{
		dict_keys=("$@")
		for occur in ${dict_keys[@]}
		do
			persent=`echo ${Singlet[$occur]} $Total_Flips |awk '{print $1/$2*100} ' `
			echo "Persentage of $occur = $persent"
		done
	}

	heads=0
	tails=0
	for((i=1;i<=$Total_Flips;i++))
	do

		flip=$((RANDOM%2))

		case $flip in

		0) Singlet["H"]=$((++heads))			# 0 is for Heads
		;;

		1) Singlet["T"]=$((++tails))			# 1 is for Tails
		;;

	esac
	done

	persentage ${!Singlet[@]}
