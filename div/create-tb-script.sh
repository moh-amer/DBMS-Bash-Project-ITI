#Written by Dr.Mans

function create_table {

        unset row
        unset query
        unset array

        read -p "Enter Table Name : " table_name
        validator -d $table_name
        if [[ ! $? == 0 ]]; then
                exit
        fi

            read -p "Number Of Columns : " Table_col_num

            flag=0
            pk_flag=0

            for ((i=0; i< $Table_col_num; i++))
                do
                    col_Dtype=''
                    col_Nullable=''
                    col_default=''
                    col_name=''
                    col_Pk=''

                    read -p "Enter Column [ $(($i+1)) ] : " col_name

                    validator -d $col_name
                    #validate col name then choose metadata for the col
                    #if invalid name break the loop
                    if [[ ! $? == 0 ]]; then
                            break
                    fi

                                echo "------------------------------" 
                                PS3="Column Data Type : "
                                select dtype in "int" "string"
                                    do
                                            case $REPLY in 
                                                    1 | 2)
                                                        col_Dtype=$dtype
                                                        echo "------------------------------" 
                                                        break
                                                        ;;
                                        esac
                                    done


                                    #START
                                    if [[ $flag == 0 && $pk_flag == 0 && $col_Dtype == 'int' ]]; then
                                    PS3="Choose as auto increment key: "
                                    select val in "yes" "no"
                                        do
                                            if [[ $val == "yes" ]]; then
                                                col_Pk='pk'
                                                flag=1
                                                col_Nullable=auto
                                                pk_flag=1
                                            fi
                                            break
                                        done
                                echo "------------------------------" 
                                    fi
                                    #END

                                    #START
                                    if [[ $pk_flag -eq 0 ]]; then

                                            PS3="Is Primary Key : "
                                            select is_pk in "Yes" "No"
                                            do
                                                    if [[ $is_pk = "Yes" ]]; then
                                                        col_Pk='pk'
                                                       pk_flag=1
                                                        col_Nullable="notnull"
                                                    fi
                                                break
                                            done
                                echo "------------------------------" 
                                    fi
                                    #END

                                    #START
                                    if [[ -z $col_Pk ]]; then
                                    PS3="Nullable: "
                                    select nullable in "null" "notnull"
                                    do
                                        col_Nullable=$nullable
                                        break
                                    done
                                    echo "------------------------------" 
                                    fi
                                    #END


                                    #START
                                    if [[ -z $col_Pk  ]]; then
                                    read -p "defaul value: " col_default
                                    col_Pk=''
                                    echo "------------------------------" 
                                    fi
                                    #END
                                            
                                row=$col_name:$col_Dtype:$col_Nullable:$col_Pk:"$col_default"
                                query=$query","$row
                        done

                        validator -d $col_name
                        if [[ $? == 0 ]]
                        then
                                IFS="," read -a array <<< $query
                                array=( ${array[@]:1} )
                                create-tb $table_name "${array[@]}"


                        fi

}


create_table
