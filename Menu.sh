# This is a script to perform some of the normal admin tasks
while :
do
# clear
echo "--------------------------------------------"
echo -n "Please enter a number 1 through 8\n"
echo "1 : Change Password"
echo "2 : See the disk space"
echo "3 : Login to other box using ssh"
echo "4 : ShoW all Services running"
echo "5 : Show all ports opened"
echo "6 : Show all java apps running"
echo "7 : Kill an app"
echo "8 : Exit"
echo "--------------------------------------------"

# set -x  # Uncomment to Debug the Script
read answer
clear
case $answer in
    1)    echo Please enter the new Password
          read Passwd
          echo -e "$Passwd\n$Passwd" | (sudo passwd $USER) 
	  echo "press a key. . ." ; read ;;
	
    2)    echo Disk Space Details\n
          df -h 
	  echo "press a key. . ." ; read ;;

    3)    echo Please enter the name of remote system
          read SERVER
          # Checks if the connection is successful or not
          ssh -n -o Batchmode=yes -o ConnectTimeout=30 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $SERVER "uname -n > /dev/null" > /dev/null 2>&1
        if [ $? -ne 0 ]
        then
                echo "FAILED: $SERVER"
                ERROR=1
        else
                echo "SUCCESS: $SERVER"
        fi
	echo "press a key. . ." ; read ;;

    4)    echo The list of services running are\n
		ls /etc/rc2.d
		echo "press a key. . ." ; read ;;

    5)    echo The list of opened ports are\n
		sudo netstat -tulpn
		echo "press a key. . ." ; read ;;

    6)    echo The Java applications currently running are\n
		ps aux | grep java
		echo "press a key. . ." ; read ;;

    7)    echo Please enter the name of the Process to be killed
		read ProcName
		for i in `ps ax | grep $ProcName | grep -v grep | sed 's/ *//' | sed 's/[^0-9].*//'`
		do
  			kill -9 $i
		done
		echo "press a key. . ." ; read ;;
		
    8)    exit 0;;
    *)    echo "Please select a valid choice 1 to 8"
		echo "Press a key. . ." ; read;;
   
esac
# set +x # Uncomment to debug the script
done
