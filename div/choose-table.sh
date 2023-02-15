
#import here
clear
showtb_result=$(showtables)
tables_arr=( $showtb_result )
table_name=''
int_regex='^[0-9]+$'

fileNo="${#tables_arr[@]}"
if [[  $fileNo > 0 ]]; then

        echo "+---------------------------+"
        printf "|       %-20s|\n" "       DATABASES"
        echo "+---------------------------+"
        echo "+---------------------------+"
        for ((i=0; i< $fileNo; i++))
            do
                printf "|       %-20s|\n" "$(($i+1)) - ${tables_arr[$i]}"

            done
        echo "+---------------------------+"

        while read -p "Choose Table : " table_choice
        do
                
                if [[ ! $table_choice =~ $int_regex ]]
                then
                        continue
                fi

                tableIndex=$(($table_choice-1))

                table_name=${tables_arr[$tableIndex]}
                
                if [[ ! -z $table_name ]]
                then
                        break
                fi
        done

echo "You Choosed : $table_name" 

else

    echo "ERROR:No Databases to show"

fi

