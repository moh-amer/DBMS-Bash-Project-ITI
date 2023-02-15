

function use_database {

        #problem1
        var=$(ls $DATA_PATH)
        databases=($var)
    DatabaseNo="${#databases[@]}"
    if [[ $DatabaseNo == 0 ]]; then
        echo "No databases yet"
        exit 1
    fi

    echo "+---------------------------+"
    for ((i=0; i< $DatabaseNo; i++))
        do
            echo "     $(($i+1))  - ${databases[$i]}            "
        done
    echo "+---------------------------+"

    while read -p "Select Database To Use: " choose
    do
                                   
            no_re='^[0-9]+$' #to check if number entered
            if [[ $choose =~ $no_re ]]
            then
                    chosendb=${databases[$(($choose-1))]}
                    if [[ ! -z $chosendb  ]]
                    then
                            clear # to clear screen after right choise
                            break
                    fi
            fi
    done

    export IN_USE_DB=$(use $chosendb) 
    
}

