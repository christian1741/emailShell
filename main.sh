#!/bin/sh
#Code by Christian Caicedo 
#Start your code from here

PathEV="your_path/data.data"    #Path data.data  - > list of users with the event details
PathEmail="your_path/FriendlyRemainderEmail.email"    #Path FriendlyRemainderEmail.email -> Message to be mailed. 

Month=$(date +%m) #It takes the currently month 
Day=$(date +%d) #It takes the currently day

while IFS="," read Event FirstName LastName MeetingMonth MeetingDay EmailAddress
do
#IFS=$oIFS
 	if [ "$MeetingMonth" == "$Month" ] && [ "$MeetingDay" == "$Day" ]
	then
		name=$FirstName
		lastN=$LastName
		email=$EmailAddress
		Meeting=$Event
		Full_Name= $FirstName $LastName 
sed 's/__FULLNAME__/$Full_Name/g' $PathEmail | mail -s "Meeting on: $Month $Day" $email

fi

done < $PathEV
