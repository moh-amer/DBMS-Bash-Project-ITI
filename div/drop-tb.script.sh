
#import here
fileNo="${#file_names[@]}"
if [[ $fileNo == 0 ]]; then
    echo "No Tables yet"
    exit 1
fi

echo "+---------------------------+"
for ((i=0; i< $fileNo; i++))
    do
        echo "|     $(($i+1))  - ${file_names[$i]}            |"
    done
echo "+---------------------------+"

select file in ${file_names[@]}
do
    break
done

Table_name=$file
echo $Table_name
./drop.sh $Table_name
