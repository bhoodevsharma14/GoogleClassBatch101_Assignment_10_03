#!/bin/bash -x

	read -p "Enter How many times You Want to Flip Coin : " Total_Flips

	declare -A Singlet
	declare -A Doublet
	declare -A Triplet
	declare -A Persentage

	function getpersentage()
	{
		dict_keys=("$@")
		length=${#dict_keys[@]}
		for occur in ${dict_keys[@]}
		do
			case $length in

			2) persent=`echo ${Singlet[$occur]} $Total_Flips |awk '{print $1/$2*100} ' `
				Persentage["$occur"]=$persent
						;;

			4) persent=`echo ${Doublet[$occur]} $Total_Flips |awk '{print $1/$2*100} ' `
				Persentage["$occur"]=$persent
                  ;;

         8) persent=`echo ${Triplet[$occur]} $Total_Flips |awk '{print $1/$2*100} ' `
            Persentage["$occur"]=$persent
                  ;;

			esac

		done


	}


	# Singlet
	# 0-> H , 1->T

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

	getpersentage ${!Singlet[@]}


	# Doublet
	# 0->HH , 1 -> HT , 2 -> TH , 3-> TT

	Doublet=(["HH"]=0 ["HT"]=0 ["TH"]=0 ["TT"]=0)

	for((num_flips=1;num_flips<=$Total_Flips;num_flips++))
	do
		flip=$((RANDOM%4))

		case $flip in

		0) double_occur=${Doublet["HH"]}
			Doublet["HH"]=$((++double_occur))
		;;

		1) double_occur=${Doublet["HT"]}
			Doublet["HT"]=$((++double_occur))
		;;

		2) double_occur=${Doublet["TH"]}
			Doublet["TH"]=$((++double_occur))
		;;

		3) double_occur=${Doublet["TT"]}
			Doublet["TT"]=$((++double_occur))
		;;

		esac

	done

	getpersentage ${!Doublet[@]}

	# Triplet
	# 0->HHH 1->HHT 2->HTH 3->THH 4->TTH 5->THT 6->HTT 7->TTT

	Triplet=( ["HHH"]=0 ["HHT"]=0 ["HTH"]=0 ["THH"]=0 ["TTH"]=0 ["THT"]=0 ["HTT"]=0 ["TTT"]=0 )

	for((num_flips=1;num_flips<=$Total_Flips;num_flips++))
	do
		
      flip=$((RANDOM%8))

      case $flip in

      0) triple_occur=${Triplet["HHH"]}
         Triplet["HHH"]=$((++triple_occur))
      ;;

      1) triple_occur=${Triplett["HHT"]}
         Triplet["HHT"]=$((++triple_occur))
      ;;

      2) triple_occur=${Triplet["HTH"]}
         Triplet["HTH"]=$((++triple_occur))
      ;;

      3) triple_occur=${Triplet["THH"]}
         Triplet["THH"]=$((++triple_occur))
      ;;

		4) triple_occur=${Triplet["TTH"]}
         Triplet["TTH"]=$((++triple_occur))
      ;;

		5) triple_occur=${Triplet["THT"]}
         Triplet["THT"]=$((++triple_occur))
      ;;

		6) triple_occur=${Triplet["HTT"]}
         Triplet["HTT"]=$((++triple_occur))
      ;;

		7) triple_occur=${Triplet["TTT"]}
         Triplet["TTT"]=$((++triple_occur))
      ;;

      esac

	done

	getpersentage ${!Triplet[@]}

	# Printing Persentage of All Combination
	for i in ${!Persentage[@]}
	do
		echo "Persentage of $i : ${Persentage[$i]}"
	done
