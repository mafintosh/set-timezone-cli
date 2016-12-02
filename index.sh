if [ "$1" == "" ]; then
  echo "Usage: set-timezone [place]"
  exit 1
fi

PLACE=$(echo "$@" | sed 's/ /_/g')
TZ=$(sudo systemsetup -listtimezones | grep -i $PLACE)

if [ $? != 0 ]; then
  echo "Could not find timezone"
  exit 1
fi

sudo systemsetup -settimezone $TZ
