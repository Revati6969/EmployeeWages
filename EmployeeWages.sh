#!/bin/bash -x
echo "Welcome to Employee Wages Computation"

#Constant
isPresent=1
isPartTime=1
isFullTime=2
empRatePerHour=20
maxHourInMonth=100
workingDaysPerMonth=20

#Variables
empHour=0
totalEmpHour=0
totalWorkingDays=0
salary=0
empCheck=$((RANDOM%3))
totalSalaryPerMonth=0

#UC1:checked Employee is present or not
attendance()
{
  if [[ $((RANDOM%2)) -eq $isPresent ]]
  then
       echo "Employee is present"
  else
       echo "Employee is not present"
  fi
}
attendance

#UC2:Daily wages of employee
dailyWage()
{
  if [[ $((RANDOM%3)) -eq $isPartTime ]]    #UC3:Added partTime employee and wage
  then
       empHour=4
  elif [[ $((RANDOM%3)) -eq $isFullTime ]]
  then
       empHour=8
  else
       empHour=0
  fi
  salary=$(($empRatePerHour*$empHour))
}
dailyWage

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

#UC5: total wages per month
wagesPerMonth()         
{
  while [[ $totalEmpHour -lt $maxHourInMonth && $totalWorkingDays -lt $workingDaysPerMonth ]]
  do
     ((totalWorkingDays++))
     empHour=$( getWorkingHours $((RANDOM%3)) )
     totalEmpHour=$(($totalEmpHour+$empHour))

  done

  totalSalary=$(($totalEmpHour*$empRatePerHour))
}
wagesPerMonth
