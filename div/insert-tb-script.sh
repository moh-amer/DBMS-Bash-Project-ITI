#! /bin/bash
function insertdata {

                # "name:int:notnull::khaled"  "id:int:notnull:pk:"  "age:int:null::20")
                unset col_data
                unset Table_col_num
                unset row
                unset query
                unset array
                unset val

                col_data=($(getschema --columns $table_name))
                Table_col_num=$(getschema -n $table_name)

                for val in ${col_data[@]}
                do
                    if [[ $(cut -d: -f 3 <<< $val) == "auto" ]]; then
                    continue
                    fi
                    read -p "  $(cut -d: -f 1 <<< $val)  [ "$(echo $val | cut -d: -f2 )" ] : " "value"
                   row=$(cut -d: -f 1 <<< $val):"$value"
                    query=$query","$row
                done
                IFS="," read -a array <<< $query
                unset IFS

               array=("${array[@]:1}")

                insert-tb $table_name ${array[@]}

	    }

insertdata
