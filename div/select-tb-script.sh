#! /bin/bash
function select_from_table {
	colRegex="^([A-Z_a-z]+)(,\s*[A-Z_a-z]+)*$"
 	numRegex="^([a-zA-Z]+[=<>][0-9]+)(,[ ]*([a-zA-Z]+[=<>][0-9]+))?$"
        stringRegex="^([a-zA-Z]+[=][A-Z a-z]+)(,[ ]*([a-zA-Z]+[=][A-Z a-z]+))?$"
        numStringRegex="^([a-zA-Z]+[=<>][0-9]+)(,[ ]*([a-zA-Z]+[=][A-Z a-z]+))?$"
        stringNumRegex="^([a-zA-Z]+[=<>][0-9]+)(,[ ]*([a-zA-Z]+[=][A-Z a-z]+))?$"

	# el mafroud nakhoud esm el table name hena
    unset conditions
    unset columns
    unset col
    unset new_string
    unset filtered_col
    unset conditions_col
    
    echo "+-------------------------------------------------+"
    echo "| Enter The Columns To Be Selected Separated By(,)|"
	echo "| eg: [Name,Age,Salary]                           |"
	echo "| To Select ALL Columns Leave It Empty            |"
    echo "+-------------------------------------------------+"

	while read -p "Enter Projection Columns: " columns
	do # start of do in first while
		if [[ ! -z $columns ]]; then # first if
			if [[ $columns =~ $colRegex ]]; then # second if
				col=$columns
				new_string=$(echo "$col" | sed 's/=/:/g')
				IFS=',' read -r -a filtered_col <<< "$new_string"
				echo ${filtered_col[@]}
				break
			fi # end of second if
		else
			break
		fi #end of first if

	done # end of first while

    echo "+-------------------------------------------------+"
    echo "| Enter The Conditions Separated by (,)           |"
	echo "| eg: [Name=Mohamed,Age[>=<]50] MAX 2 CONITIONS   |"
	echo "| IF Empty Will Update Affect AL                  |"
    echo "+-------------------------------------------------+"

	while read -p "Enter The Condition: " cond
	do #start of the second while
		if [[ ! -z $cond  ]]; then # start of the third if
			if [[ $cond =~ $numRegex || $cond =~ $stringRegex || $comd =~ $numstringRegex || $cond =~ $stringNumRegex ]]; then
				conditions=$cond
				new_string=$(echo "$conditions" | sed 's/[=<>]/:&:/g')
                                IFS=',' read -r -a conditions_col <<< "$new_string"

			#	echo $conditions
			break	
			fi # end of the fourth if
		else
			break
		fi # end of the third if

	done # end of the second while

    filteredcolsFormatted=$(echo "${filtered_col[@]}" | sed 's/ /|/g')

	select-tb $table_name "$filteredcolsFormatted" "${conditions_col[@]}"

}

select_from_table
