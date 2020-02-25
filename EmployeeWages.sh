#!/bin/bash -x
echo "Welcome to Employee Wages Computation"

#variables
isPresent=1

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
