#!/bin/bash -x
echo "Welcome to Employee Wages Computation"

#variables
isPresent=1
empRatePerHour=20
empHour=0
salary=0
isPartTime=1
isFullTime=2
empCheck=$((RANDOM%3))
workingDaysPerMonth=22
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

#UC5: total wages per month
wagesPerMonth()         
{
	for (( index=1; index<=workingDaysPerMonth; index++ ))
	do
		case $empCheck in     #UC4:Solved using case statement
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
		salary=$(($empRatePerHour*$empHour))
		totalSalaryPerMonth=$(($totalSalaryPerMonth+$salary))
	done
}
wagesPerMonth
