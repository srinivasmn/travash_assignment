# How to use case-esac with upper or lower case.
echo "Please enter a number 1 through 8"
echo "1 : Change Password"
echo "2 : See the disk space"
echo "3 : Login to other box using ssh"
echo "4 : ShoW all Services running"
echo "5 : Show all ports opened"
echo "6 : Show all java apps running"
echo "7 : Kill an app"
echo "8 : Exit"

set -x
read answer
case $answer in
    1)    echo Please enter the new Password
          read Passwd
          echo -e "$Passwd\n$Passwd" | (sudo passwd $USER);;
    2)    echo Disk Space Details\n
          df -h ;;
    3)    echo Please enter the name of remote system
          read SERVER
          ssh -n -o Batchmode=yes -o ConnectTimeout=30 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $SERVER "uname -n > /dev/null" > /dev/null 2>&1
        if [ $? -ne 0 ]
        then
                echo "FAILED: $SERVER"
                ERROR=1
        else
                echo "SUCCESS: $SERVER"
        fi;;
    4)    echo You chose 4
		ls /etc/rc2.d;;
    5)    echo You chose 5;;
    6)    echo You chose 6;;
    7)    echo You chose 7;;
    8)    echo You chose 8;;
      *)    echo You did not choose the valid menu option;;
esac
set +x
