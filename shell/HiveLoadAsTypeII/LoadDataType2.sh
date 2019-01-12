SOURCE="S"
TARGET="T"
PRIMARY_KEY="P"
FORMAT="F"

while getopts s:t:p:h: option
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
		h)
			FORMAT=${OPTARG}
			;;
	esac
done

echo "Hive Type 2 Data Load initiated"
echo $SOURCE
echo $TARGET
echo $PRIMARY_KEY
echo $FORMAT
