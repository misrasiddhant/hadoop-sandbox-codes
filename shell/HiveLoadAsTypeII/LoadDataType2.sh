ValidateReturnCode(){
	CODE=$1
	echo "CODE $CODE"
	IF [[ "$CODE" == "0" ]];THEN
		echo "Successful Execution"
		return 0
	ELSE
		echo "Execution Error"
		return 1
	FI
}

PrintLog(){
	echo $#
	LOG_TYPE=$1
	LOG_MSG=$2
	echo "$LOG_TYPE - $LOG_MSG"
}

while getopts 's:t:p:h:' option
do
	case "${option}" in
		s) 
			SOURCE=${OPTARG}
			;;
		t)
			TARGET=${OPTARG}
			;;
		p)
			PRIMARY_KEY=${OPTARG}
			;;
		help)
			FORMAT=${OPTARG}
			;;
	esac
done

echo "Hive Type 2 Data Load initiated"
echo $SOURCE
echo $TARGET
echo $PRIMARY_KEY
echo $FORMAT

PrintLog "INFO" "Fetching Columns from src tbl $SOURCE"
SRC_COLUMNS=`hive -e "SHOW COLUMNS IN $SOURCE"`
ValidateReturnCode $?
if [[ $? == "0" ]];then
	echo $SRC_COLUMNS
fi




PrintLog "INFO" "Fetching Columns from tgt tbl $TARGET"
TGT_COLUMNS=`hive -e "SHOW COLUMNS IN $TARGET"`
ValidateReturnCode $?
if [[ $? == "0" ]];then
	echo $TGT_COLUMNS
fi
