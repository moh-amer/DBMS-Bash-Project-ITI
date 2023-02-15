
function show_main_menu {

echo "+---------------------------+"
echo "| $(tput setaf 5)Welcome to our Bash DBMS !$(tput setaf 2)|"
echo "| $(tput setaf 3)Written By: ALAA & MANSOUR$(tput setaf 2)|"
echo "+---------------------------+"
echo "| 1 - Create Database       |"
echo "| 2 - List Databases        |"
echo "| 3 - Connect Database      |"
echo "| 4 - Drop Database         |"
echo "| 5 - Exit                  |"
echo "+---------------------------+"
}

function show_table_actions {
    echo "+---------------------------+"
    echo " $(tput setaf 5)  <  Connected To $IN_USE_DB   >$(tput setaf 2)"
    echo "| $(tput setaf 3)Written By: ALAA & MANSOUR$(tput setaf 2)|"
    echo "+---------------------------+"
    echo "| 1 - Create Table          |"
    echo "| 2 - Insert Into Table     |"
    echo "| 3 - Update Table          |"
    echo "| 4 - Delete Table          |"
    echo "| 5 - Select Table          |"
    echo "| 6 - Drop Table            |"
    echo "| 7 - Return TO Main        |"
    echo "+---------------------------+"
}

function back_to_main_from_list_dbs {

    echo "+-------------------------------------------------+"
    echo "|                                                 |"
    echo "|                  OPTIONS                        |"
	echo "|                                                 |"
    echo "+-------------------------------------------------+"
    echo "|                                                 |"
    echo "|             1 -  Back to DB Menu                |"
    echo "|                                                 |"
    echo "+-------------------------------------------------+"

}
