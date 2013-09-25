#!/bin/sh
#Code by Christian Caicedo 
#Start your code from here

RutaEV="your_path/data.data"    #Path Event-Member.data
RutaEmail="your_path/Reminder.email"    #Path Reminder.email

Month=$(date +%m) #It takes the currently month 
Day=$(date +%d) #It takes the currently day

while IFS="," read Event FirstName LastName MeetingMonth MeetingDay EmailAddress
do
#IFS=$oIFS
 	if [ "$MeetingMonth" == "$Mes" ] && [ "$MeetingDay" == "$Dia" ]
	then
		name=$FirstName
		lastN=$LastName
		email=$EmailAddress
		Meeting=$Event
		Full_Name= $FirstName $LastName 
sed 's/__FULLNAME__/$Full_Name/g' $RutaEmail | mail -s "Meeting on: $Month $Day" $email

fi

done < $RutaEV
