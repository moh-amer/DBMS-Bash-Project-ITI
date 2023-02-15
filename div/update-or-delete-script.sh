#! /bin/bash
function  update_or_delete {

    	regexOne="^([a-zA-Z]+[=][A-Za-z 0-9]+)(,[ ]*([a-zA-Z]+[=][A-Z 0-9 a-z]+))*$"
        numRegex="^([a-zA-Z]+[=<>][0-9]+)(,[ ]*([a-zA-Z]+[=<>][0-9]+))?$"
        stringRegex="^([a-zA-Z]+[=][A-Z a-z]+)(,[ ]*([a-zA-Z]+[=][A-Z a-z]+))?$"
        numStringRegex="^([a-zA-Z]+[=<>][0-9]+)(,[ ]*([a-zA-Z]+[=][A-Z a-z]+))?$"
        stringNumRegex="^([a-zA-Z]+[=<>][0-9]+)(,[ ]*([a-zA-Z]+[=][A-Z a-z]+))?$"


        regexOne="^([^0-9\\/?%:|\"<>. ][a-zA-Z0-9_]{1,64}=[^,]+)+(,([^0-9\\/?%:|\"<>. ][a-zA-Z0-9_]{1,64}=[^,]+))*$"
        numRegex="^[^0-9\\/?%:|\"<>. ][a-zA-Z0-9_]{1,64}[=<>]\d+(,[^0-9\\/?%:|\"<>. ][a-zA-Z0-9_]{1,64}[=<>]\d+){0,1}$"
        stringRegex="^([^0-9\/?%:|\"<>. ][a-zA-Z0-9_]{1,64}=[^,]+)(,([^0-9\/?%:|\"<>. ][a-zA-Z0-9_]{1,64}=[^,]+)){0,1}$"
        numStringRegex="^[^0-9\\/?%:|\"<>. ][a-zA-Z0-9_]{1,64}[=<>][0-9]+(([^0-9\\/?%:|\"<>. ][a-zA-Z0-9_]{1,64}=[^,]+)|)$"
        stringNumRegex="^[^0-9\\/?%:|\"<>. ][a-zA-Z0-9_]{1,64}=[^,]+(([^0-9\\/?%:|\"<>. ][a-zA-Z0-9_]{1,64}[=<>][0-9]+)|)$"

# file.sh   show tables
# elmafrood nloop 3la el tables bs ana mesh haloop 3lashan matz3lsh :D

unset update
unset update_col
unset condition
unset new_string
unset formatedUpdate
unset conditionCol
unset updateCol
unset fromatedCondtion
unset cond
unset var1
unset var2

if [[ $1 == 'update' ]]
then


    echo "+-------------------------------------------------+"
    echo "| Enter The Columns To Be Updated Separated By (,)|"
	echo "| eg: [Name=Mohamed,Age=50]                       |"
    echo "+-------------------------------------------------+"

        while read -p "Enter Columns To Update : " value
        do  # start of the first while:
           if [[ $value =~ $regexOne ]]
           then
                   update=$value 					#the colums tobe updated are saved in update var
                   update_col=$(echo "$update" | sed 's/=/:/g')   # sed to replace = to :
                   IFS=',' read -r -a updateCol <<< "$update_col"	# converstion to array of key value pairs
                   break						 # end of the first if condition
           fi

        done							 # end of reading update with codition
fi


    echo "+-------------------------------------------------+"
    echo "| Enter The Conditions Separated by (,)           |"
	echo "| eg: [Name=Mohamed,Age[>=<]50] MAX 2 CONITIONS   |"
	echo "| IF Empty Will Update Affect AL                  |"
    echo "+-------------------------------------------------+"
while read -p "Enter The Condition : " cond 
do # start of the second while loop
        if [[ ! -z $cond ]]; then  #if the user provies a condition

                if [[ $cond =~ $numRegex || $cond =~ $stringRegex || $cond =~ $numStringRegex || $cond =~ $stringNumRegex ]]; then
                        condition=$cond    #store the cond in condition var
                        new_string=$(echo "$condition" | sed 's/[=><]/:&:/g') # sed [=<>] to :[=<>:]
                        IFS=',' read -r -a conditionCol <<< "$new_string"
                        break           # exit the while loop if the conditions are true
                fi
               
        else
                break
        fi
       
done 						 # end of the second while loop

        
var1="${updateCol[@]}"
var2="${conditionCol[@]}"
formatedUpdate=$(echo $var1 | sed 's/ /|/g' )
formatedCondition=$(echo $var2  | sed 's/ /|/g')

if [[ $1 == 'update' ]]
then
        update-tb $table_name "$formatedUpdate"  "$formatedCondition"
        
elif [[ $1 == 'delete' ]]
then
        delete-tb $table_name "$formatedCondition"

fi

}
