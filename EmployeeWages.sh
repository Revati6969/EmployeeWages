#!/bin/bash -x
echo "Welcome to Employee Wages Computation"

#variables
isPresent=1
empRatePerHour=20
empHour=0
salary=0

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
  if [[ $((RANDOM%2)) -eq $isPresent ]]
  then
       empHour=8
       salary=$(($empRatePerHour*$empHour))
  else
       salary=0
  fi
}
dailyWage
