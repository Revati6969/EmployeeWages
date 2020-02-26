#!/bin/bash -x
echo "Welcome to Employee Wages Computation"

declare -A Emp

#Constant
isPresent=1
isPartTime=1
isFullTime=2
empRatePerHour=20

#Variables
day=1
empHour=0
WorkingDays=0
salary=0
empCheck=$((RANDOM%3))

#UC1:checked Employee is present or not
attendance()
{
  if [[ $((RANDOM%2)) -eq $isPresent ]]
  then
       attendenceflag=1
  else
       attendenceflag=0
  fi
}

#UC2:Daily wages of employee
dailyWage()
{
  if [[ $attendanceflag=1 ]]
  then
      if [[ $((RANDOM%2)) -eq $isPartTime ]]    #UC3:Added partTime employee and wage
      then
          empHour=4
      else [[ $((RANDOM%2)) -eq $isFullTime ]]
          empHour=8
      fi
  salary=$(($empRatePerHour*$empHour))
  fi
}

#UC7:Refactored to get work hours
function getWorkingHours()
{
   case $1 in     #UC4:Solved using case statement
	$isPartTime)
		empHour=4
		;;
	$isFullTime)
		empHour=8
		;;
  	*)
   		empHour=0
		;;
     esac
     echo $empHour
}

#UC8: Daily wage with total wage
calculateWage()
{
  empHour=$1
  wage=$(($empHour*$empRatePerHour))
  echo $wage
}

finalResult() 
{
echo "Days Wages"
while [[ day -le 20 ]]
do
	attendance
	dailyWage
	Emp[day]=$salary
	echo "$day--> ${Emp[day]}"
	day=$(($day+1))

done
}
finalResult
