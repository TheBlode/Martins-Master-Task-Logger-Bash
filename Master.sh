#!/bin/bash
# Changelog
# 04/10/18
# Checked sleep tracker
# Clearing up menus
#######################################
# Function to log no duration
#######################################
cd info_files
function no_duration() {
		# Remove cat file
   		rm cat.txt
		# Toggle cat file to 1...meaning no duration
		echo "1" >> cat.txt
		# Throw an error back to the terminal
		myerror="No duration logged."
		echo $myerror
}

#######################################
# Function to log duration
#######################################
function duration() {
		# Remove cat file
		rm cat.txt
		# Toggle cat file to 0...meaning duration
		echo "0" >> cat.txt
		# Throw successful message
		myerror="Duration logged successfully."
		echo $myerror
		# Increase task count
		taskcount=$(sed -n 1p taskcount.txt)
		taskcount=$((taskcount+1))
		rm taskcount.txt
		echo $taskcount >> taskcount.txt
}

#######################################
# Function to increment task count for AM routine
#######################################
function task_increment_am() {
		# Read current task count
		task_count_am=$(sed -n 1p task_count_am.txt)
		# If task count is empty...then task count is zero
		if [ task_count_am = "" ]
			then
				task_count_am=0
		fi
		# Increment task count by 1
		task_count_am=$((task_count_am+1))
		# Remove current task count
		rm task_count_am.txt
		# Echo new task count
		echo $task_count_am >> task_count_am.txt
}

#######################################
# Function to increment task count for PM routine
#######################################
function task_increment_pm() {
		# Read current task count
		task_count_pm=$(sed -n 1p task_count_pm.txt)
		# If task count is empty...then task count is zero
		if [ task_count_pm = "" ]
			then
				task_count_pm=0
		fi
		# Increment task count by 1
		task_count_pm=$((task_count_pm+1))
		# Remove current task count
		rm task_count_pm.txt
		# Echo new task count
		echo $task_count_pm >> task_count_pm.txt
}

#######################################
# Function to generate the main menu
#######################################
function generate_main_menu() {
		echo "********************************"
		echo "Welcome to Martin's Task Logger!"
		echo "Select An Option (Option 1-39)"
		echo "Type 1 for Task Log"
		echo "Type 111 for Morning Routine Progress"
		echo "Type 222 for Evening Routine Progress"
		echo "Type 333 for Weekend Routine Progress"
		echo "Type 444 for Common Tasks"
		echo "Type 2 for Music Log"
		echo "Type 3 for TV/Movie Log"
		echo "Type 4 for Radio Log"
		echo "Type 5 for Thoughts/Ideas Log"
		echo "Type 6 for Underwear Tracker"
		echo "Type 7 for Water Tracker"
		echo "Type 8 for Alarm Tones (Not Working)"
		echo "Type 9 for To-Do List"
		echo "Type 10 for Meal Tracker"
		echo "Type 11 for Task Log Output"
		echo "Type 12 for Sleep Tracker"
		echo "Type 13 for Shopping List"
		echo "Type 14 for New Day"
		echo "Type 15 for Music Randomizer"
		echo "Type 16 for Time Logger"
		echo "Type 17 for Post Task Logger"
		echo "Type 18 for Quote Generator"
		echo "Type 19 for Weight Tracker"
		echo "Type 20 for Day Planner"
		echo "Type 21 for Possessions Tracker"
		echo "Type 22 for The Magic Eight Ball"
		echo "Type 23 for Depression & Anxiety"
		echo "Type 24 for Coin Flipper"
		echo "Type 25 for Inspiration"
		echo "Type 26 for Cash Tracker"
		echo "Type 27 for Day Calculator"
		echo "Type 28 for Name Generator"
		echo "Type 29 for Word Of The Day"
		echo "Type 30 for Remove Last Task"
		echo "Type 31 for Small Talk"
		echo "Type 32 for Verbal Script"
		echo "Type 33 for Battery Tracker"
		echo "Type 34 for Joke Generator"
		echo "Type 35 for Bags Tracker"
		echo "Type 36 for Calorie Tracker"
		echo "Type 37 for Appointments"
		echo "Type 38 for Stats Tracker"
		echo "Type 39 for Travel Tracker"
		echo "Type 40 for Game Randomizer"
		echo "Type 41 for Phone Numbers"
		echo "Type Exit to Quit"
		# Generate last task
		echo  "Last Task: "
		grab_last_line
		echo $last_line_time":"$last_line_task
		# Next scheduled task
		current_hour=$(date +%H)
		current_date=$(date +%u)
		if [ $current_date = 1 ]
			then
			dayfile="schedulemon.txt"
		elif [ $current_date = 2 ]
			then
			dayfile="scheduletue.txt"
		elif [ $current_date = 3 ]
			then
			dayfile="schedulewed.txt"
		elif [ $current_date = 4 ]
			then
			dayfile="schedulethu.txt"
		elif [ $current_date = 5 ]
			then
			dayfile="schedulefri.txt"
		elif [ $current_date = 6 ]
			then
			dayfile="schedulesat.txt"
		elif [ $current_date = 7 ]
			then
			dayfile="schedulesun.txt"
		fi
		if [ $current_hour = "00" ]
			then
				lineno=1
		elif [ $current_hour = "01" ]
			then
				lineno=3
		elif [ $current_hour = "02" ]
			then
				lineno=5
		elif [ $current_hour = "03" ]
			then
				lineno=7
		elif [ $current_hour = "04" ]
			then
				lineno=9
		elif [ $current_hour = "05" ]
			then
				lineno=11
		elif [ $current_hour = "06" ]
			then
				lineno=13
		elif [ $current_hour = "07" ]
			then
				lineno=15
		elif [ $current_hour = "08" ]
			then
				lineno=17
		elif [ $current_hour = "09" ]
			then
				lineno=19
		elif [ $current_hour = "10" ]
			then
				lineno=21
		elif [ $current_hour = "11" ]
			then
				lineno=23
		elif [ $current_hour = "12" ]
			then
				lineno=25
		elif [ $current_hour = "13" ]
			then
				lineno=27
		elif [ $current_hour = "14" ]
			then
				lineno=29
		elif [ $current_hour = "15" ]
			then
				lineno=31
		elif [ $current_hour = "16" ]
			then
				lineno=33
		elif [ $current_hour = "17" ]
			then
				lineno=35
		elif [ $current_hour = "18" ]
			then
				lineno=37
		elif [ $current_hour = "19" ]
			then
				lineno=39
		elif [ $current_hour = "20" ]
			then
				lineno=41
		elif [ $current_hour = "21" ]
			then
				lineno=43
		elif [ $current_hour = "22" ]
			then
				lineno=45
		elif [ $current_hour = "23" ]
			then
				lineno=47
		fi
		counter=1
		while read p; do
			if [ $counter = $lineno ]
				then
					echo "Current Day Task: "$p
					break
			fi
			counter=$((counter+1))
		done <$dayfile
		echo "Today's Task Count: "$taskcount
		echo "********************************"
}

#######################################
# Function to grab last task from task log file
#######################################
function grab_last_line() {
		# Read last line from task log file
		last_line=$( tail -n 1 Master_Task_Log.txt )
		# Output the last line but only the task part
		last_line_task=$(echo "$last_line" | cut -d ":" -f 3)
		last_line_time=$(echo "$last_line" | cut -d ":" -f 1)
}

#######################################
# Function to grab second to last task from task log file
#######################################
function grab_last_line_two() {
		# Read second to last linesfrom task log file
		last_line=$( tail -n 2 Master_Task_Log.txt )
		# Output the last line but only the task part
		last_line_task=$(echo "$last_line" | cut -d ":" -f 3)
		last_line_time=$(echo "$last_line" | cut -d ":" -f 1)
}

#######################################
# Function to grab task - task only
#######################################
function grab_last_line_task_only() {
		# Read last task
		last_line=$( tail -n 1 Master_Task_Log.txt )
		# Output the last line but only the task part
		last_line_task=$(echo "$last_line" | cut -d ":" -f 3)
		echo $last_line_task >> current_task_log.txt
		# Add to last 20 tasks
		# Remove and recreate files
		rm current_tasks_temp.txt
		touch current_tasks_temp.txt
		# Write current task to temp file
		echo $last_line_task >> current_tasks_temp.txt
		# Initialise counter
		counter=1
		while read p; do
			echo $p
			if [ $counter = 20 ]
				then
					echo "Skip This!"
					break
			fi
			echo $p >> current_tasks_temp.txt
			counter=$((counter+1))
		done <current_task_log.txt
		# Clean up files
		rm current_tasks_temp.txt
		cp current_tasks_temp.txt current_task_log.txt
		rm current_tasks_temp.txt
		no_duration
}

#######################################
# Function to log time between tasks
#######################################
function cat_log() {
		if [ $cat = 0 ]
			then
				if [ $logType != 11 ]
					then
						# echo $timestamp: "Duration :" $result >> Master_Task_Log.txt
						rm seconds.txt
						echo $epoch >> seconds.txt
				fi
		fi
		# Remove and reset the value in the cat file
		rm cat.txt
		echo "0" >> cat.txt
}

#######################################
# Function to generate alarm clock time
#######################################
function alarm_time_generator() {
		# Store time
		epoch=$(awk -vstart="$epoch" 'BEGIN { print strftime("%c", start); }')
		# Output alarm clock time
		echo "You Should Set Your Alarm Clock to "$epoch
		echo ""
		echo "I've Added 15 Minutes Extra For You. :)"
		echo ""
		echo "zzzzzzzzzzzz..."
}

#######################################
# Function to generate timestamp
#######################################
function generate_time_stamp() {
		# Generate time stamp
		timestamp=$(date +"%d-%m-%Y_%H_%M-%S")
}

#######################################
# Function to trim leading space
#######################################
function leading_space_trim() {
		# Trim leading space
		trim="$(echo -e "${trim}" | sed -e 's/^[[:space:]]*//')"
}

#######################################
# Function to check if input is numeric
#######################################
function is_numeric() {
		# Check if string is numeric
		case $numeric_test in
			''|*[!0-9]*) number=0 ;;
			*) number=1 ;;
		esac
		# Output to the terminal
		if [ $number = 1 ]
			then
				echo "Number received."
		else
			echo "Not a number."
		fi
}

#######################################
# Function to check morning routine progress
#######################################
function check_if_done() {
		# Initialise counter
		counter=1
		while read p; do
			echo $p
			if [ $morntask = $counter ]
				then
					echo "1" >> mornlisttemp.txt
			else
				line=$(sed -n "$counter"p mornlist.txt)
				echo $line >> mornlisttemp.txt
			fi
			counter=$((counter+1))
		done <mornlist.txt
		# Cleanup files
		rm mornlist.txt
		cp mornlisttemp.txt mornlist.txt
		rm mornlisttemp.txt
}

#######################################
# Function to check evening routine progress
#######################################
function check_if_done_eve() {
		# Initialise counter
		counter=1
		while read p; do
			echo $p
			if [ $evetask = $counter ]
				then
					echo "1" >> evelisttemp.txt
			else
				line=$(sed -n "$counter"p evelist.txt)
				echo $line >> evelisttemp.txt
			fi
			counter=$((counter+1))
		done <evelist.txt
		# Cleanup files
		rm evelist.txt
		cp evelisttemp.txt evelist.txt
		rm evelisttemp.txt
}

#######################################
# Function to convert strings to TitleCase
#######################################
function TitleCaseConverter() {
		# Convert string to TitleCase
		title=$(echo $title | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}')
}

#######################################
# Function to calculate time left on PM routine
#######################################
function time_left_subtraction_eve() {
		# Read PM time outstanding
		timelefteve=$(sed -n 1p timelefteve.txt)
		# Subtract current task from total time outstanding
		timevareve=$(($timelefteve-$timevareve))
		# Cleanup files
		rm timelefteve.txt
		touch timelefteve.txt
		echo $timevareve >> timelefteve.txt
}

#######################################
# Function to calculate time left on AM routine
#######################################
function time_left_subtraction() {
		# Read AM time outstanding
		timeleft=$(sed -n 1p timeleft.txt)
		# Subtract current task from total time outstanding
		timevar=$(($timeleft-$timevar))
		# Cleanup files
		rm timeleft.txt
		touch timeleft.txt
		echo $timevar >> timeleft.txt
}

#######################################
# Function to daily schedule
#######################################
function reset_day() {
		rm $dayofweekfile
		touch $dayofweekfile
		echo "1-Empty-00:00" >> $dayofweekfile
		echo "2-Empty-00:30" >> $dayofweekfile
		echo "3-Empty-01:00" >> $dayofweekfile
		echo "4-Empty-01:30" >> $dayofweekfile
		echo "5-Empty-02:00" >> $dayofweekfile
		echo "6-Empty-02:30" >> $dayofweekfile
		echo "7-Empty-03:00" >> $dayofweekfile
		echo "8-Empty-03:30" >> $dayofweekfile
		echo "9-Empty-04:00" >> $dayofweekfile
		echo "10-Empty-04:30" >> $dayofweekfile
		echo "11-Empty-05:00" >> $dayofweekfile
		echo "12-Empty-05:30" >> $dayofweekfile
		echo "13-Empty-06:00" >> $dayofweekfile
		echo "14-Empty-06:30" >> $dayofweekfile
		echo "15-Empty-07:00" >> $dayofweekfile
		echo "16-Empty-07:30" >> $dayofweekfile
		echo "17-Empty-08:00" >> $dayofweekfile
		echo "18-Empty-08:30" >> $dayofweekfile
		echo "19-Empty-09:00" >> $dayofweekfile
		echo "20-Empty-09:30" >> $dayofweekfile
		echo "21-Empty-10:00" >> $dayofweekfile
		echo "22-Empty-10:30" >> $dayofweekfile
		echo "23-Empty-11:00" >> $dayofweekfile
		echo "24-Empty-11:30" >> $dayofweekfile
		echo "25-Empty-12:00" >> $dayofweekfile
		echo "26-Empty-12:30" >> $dayofweekfile
		echo "27-Empty-13:00" >> $dayofweekfile
		echo "28-Empty-13:30" >> $dayofweekfile
		echo "29-Empty-14:00" >> $dayofweekfile
		echo "30-Empty-14:30" >> $dayofweekfile
		echo "31-Empty-15:00" >> $dayofweekfile
		echo "32-Empty-15:30" >> $dayofweekfile
		echo "33-Empty-16:00" >> $dayofweekfile
		echo "34-Empty-16:30" >> $dayofweekfile
		echo "35-Empty-17:00" >> $dayofweekfile
		echo "36-Empty-17:30" >> $dayofweekfile
		echo "37-Empty-18:00" >> $dayofweekfile
		echo "38-Empty-18:30" >> $dayofweekfile
		echo "39-Empty-19:00" >> $dayofweekfile
		echo "40-Empty-19:30" >> $dayofweekfile
		echo "41-Empty-20:00" >> $dayofweekfile
		echo "42-Empty-20:30" >> $dayofweekfile
		echo "43-Empty-21:00" >> $dayofweekfile
		echo "44-Empty-21:30" >> $dayofweekfile
		echo "45-Empty-22:00" >> $dayofweekfile
		echo "46-Empty-22:30" >> $dayofweekfile
		echo "47-Empty-23:00" >> $dayofweekfile
		echo "48-Empty-23:30" >> $dayofweekfile
}

#######################################
# Function to reset schedule with work day and travelling
#######################################
function reset_default_week_work_travel() {
		rm $dayofweekfile
		touch $dayofweekfile
		echo "1-Sleeping-00:00" >> $dayofweekfile
		echo "2-Sleeping-00:30" >> $dayofweekfile
		echo "3-Sleeping-01:00" >> $dayofweekfile
		echo "4-Sleeping-01:30" >> $dayofweekfile
		echo "5-Sleeping-02:00" >> $dayofweekfile
		echo "6-Sleeping-02:30" >> $dayofweekfile
		echo "7-Sleeping-03:00" >> $dayofweekfile
		echo "8-Sleeping-03:30" >> $dayofweekfile
		echo "9-Morning Routine-04:00" >> $dayofweekfile
		echo "10-Morning Routine-04:30" >> $dayofweekfile
		echo "11-Morning Routine-05:00" >> $dayofweekfile
		echo "12-Morning Routine-05:30" >> $dayofweekfile
		echo "13-Travelling-06:00" >> $dayofweekfile
		echo "14-Travelling-06:30" >> $dayofweekfile
		echo "15-Working-07:00" >> $dayofweekfile
		echo "16-Working-07:30" >> $dayofweekfile
		echo "17-Working-08:00" >> $dayofweekfile
		echo "18-Working-08:30" >> $dayofweekfile
		echo "19-Working-09:00" >> $dayofweekfile
		echo "20-Working-09:30" >> $dayofweekfile
		echo "21-Working-10:00" >> $dayofweekfile
		echo "22-Working-10:30" >> $dayofweekfile
		echo "23-Working-11:00" >> $dayofweekfile
		echo "24-Working-11:30" >> $dayofweekfile
		echo "25-Lunch-12:00" >> $dayofweekfile
		echo "26-Working-12:30" >> $dayofweekfile
		echo "27-Working-13:00" >> $dayofweekfile
		echo "28-Working-13:30" >> $dayofweekfile
		echo "29-Working-14:00" >> $dayofweekfile
		echo "30-Working-14:30" >> $dayofweekfile
		echo "31-Travelling-15:00" >> $dayofweekfile
		echo "32-Travelling-15:30" >> $dayofweekfile
		echo "33-Travelling-16:00" >> $dayofweekfile
		echo "34-Evening Routine-16:30" >> $dayofweekfile
		echo "35-Evening Routine-17:00" >> $dayofweekfile
		echo "36-Evening Routine-17:30" >> $dayofweekfile
		echo "37-Evening Routine-18:00" >> $dayofweekfile
		echo "38-Empty-18:30" >> $dayofweekfile
		echo "39-Empty-19:00" >> $dayofweekfile
		echo "40-Empty-19:30" >> $dayofweekfile
		echo "41-Empty-20:00" >> $dayofweekfile
		echo "42-Sleeping-20:30" >> $dayofweekfile
		echo "43-Sleeping-21:00" >> $dayofweekfile
		echo "44-Sleeping-21:30" >> $dayofweekfile
		echo "45-Sleeping-22:00" >> $dayofweekfile
		echo "46-Sleeping-22:30" >> $dayofweekfile
		echo "47-Sleeping-23:00" >> $dayofweekfile
		echo "48-Sleeping-23:30" >> $dayofweekfile
}

#######################################
# Function to reset schedule with work day and no travelling
#######################################
function reset_default_week_work_no_travel() {
		rm $dayofweekfile
		touch $dayofweekfile
		echo "1-Sleeping-00:00" >> $dayofweekfile
		echo "2-Sleeping-00:30" >> $dayofweekfile
		echo "3-Sleeping-01:00" >> $dayofweekfile
		echo "4-Sleeping-01:30" >> $dayofweekfile
		echo "5-Sleeping-02:00" >> $dayofweekfile
		echo "6-Sleeping-02:30" >> $dayofweekfile
		echo "7-Sleeping-03:00" >> $dayofweekfile
		echo "8-Sleeping-03:30" >> $dayofweekfile
		echo "9-Morning Routine-04:00" >> $dayofweekfile
		echo "10-Morning Routine-04:30" >> $dayofweekfile
		echo "11-Morning Routine-05:00" >> $dayofweekfile
		echo "12-Morning Routine-05:30" >> $dayofweekfile
		echo "13-Empty-06:00" >> $dayofweekfile
		echo "14-Empty-06:30" >> $dayofweekfile
		echo "15-Working-07:00" >> $dayofweekfile
		echo "16-Working-07:30" >> $dayofweekfile
		echo "17-Working-08:00" >> $dayofweekfile
		echo "18-Working-08:30" >> $dayofweekfile
		echo "19-Working-09:00" >> $dayofweekfile
		echo "20-Working-09:30" >> $dayofweekfile
		echo "21-Working-10:00" >> $dayofweekfile
		echo "22-Working-10:30" >> $dayofweekfile
		echo "23-Working-11:00" >> $dayofweekfile
		echo "24-Working-11:30" >> $dayofweekfile
		echo "25-Lunch-12:00" >> $dayofweekfile
		echo "26-Working-12:30" >> $dayofweekfile
		echo "27-Working-13:00" >> $dayofweekfile
		echo "28-Working-13:30" >> $dayofweekfile
		echo "29-Working-14:00" >> $dayofweekfile
		echo "30-Working-14:30" >> $dayofweekfile
		echo "31-Evening Routine-15:00" >> $dayofweekfile
		echo "32-Evening Routine-15:30" >> $dayofweekfile
		echo "33-Evening Routine-16:00" >> $dayofweekfile
		echo "34-Evening Routine-16:30" >> $dayofweekfile
		echo "35-Empty-17:00" >> $dayofweekfile
		echo "36-Empty-17:30" >> $dayofweekfile
		echo "37-Empty-18:00" >> $dayofweekfile
		echo "38-Empty-18:30" >> $dayofweekfile
		echo "39-Empty-19:00" >> $dayofweekfile
		echo "40-Empty-19:30" >> $dayofweekfile
		echo "41-Empty-20:00" >> $dayofweekfile
		echo "42-Sleeping-20:30" >> $dayofweekfile
		echo "43-Sleeping-21:00" >> $dayofweekfile
		echo "44-Sleeping-21:30" >> $dayofweekfile
		echo "45-Sleeping-22:00" >> $dayofweekfile
		echo "46-Sleeping-22:30" >> $dayofweekfile
		echo "47-Sleeping-23:00" >> $dayofweekfile
		echo "48-Sleeping-23:30" >> $dayofweekfile
}

#######################################
# Function to reset default weekend schedule
#######################################
function reset_default_week_weekend() {
		rm $dayofweekfile
		touch $dayofweekfile
		echo "1-Sleeping-00:00" >> $dayofweekfile
		echo "2-Sleeping-00:30" >> $dayofweekfile
		echo "3-Sleeping-01:00" >> $dayofweekfile
		echo "4-Sleeping-01:30" >> $dayofweekfile
		echo "5-Sleeping-02:00" >> $dayofweekfile
		echo "6-Sleeping-02:30" >> $dayofweekfile
		echo "7-Sleeping-03:00" >> $dayofweekfile
		echo "8-Sleeping-03:30" >> $dayofweekfile
		echo "9-Morning Routine-04:00" >> $dayofweekfile
		echo "10-Morning Routine-04:30" >> $dayofweekfile
		echo "11-Morning Routine-05:00" >> $dayofweekfile
		echo "12-Morning Routine-05:30" >> $dayofweekfile
		echo "13-Empty-06:00" >> $dayofweekfile
		echo "14-Empty-06:30" >> $dayofweekfile
		echo "15-Empty-07:00" >> $dayofweekfile
		echo "16-Empty-07:30" >> $dayofweekfile
		echo "17-Empty-08:00" >> $dayofweekfile
		echo "18-Empty-08:30" >> $dayofweekfile
		echo "19-Empty-09:00" >> $dayofweekfile
		echo "20-Empty-09:30" >> $dayofweekfile
		echo "21-Empty-10:00" >> $dayofweekfile
		echo "22-Empty-10:30" >> $dayofweekfile
		echo "23-Empty-11:00" >> $dayofweekfile
		echo "24-Empty-11:30" >> $dayofweekfile
		echo "25-Empty-12:00" >> $dayofweekfile
		echo "26-Empty-12:30" >> $dayofweekfile
		echo "27-Empty-13:00" >> $dayofweekfile
		echo "28-Empty-13:30" >> $dayofweekfile
		echo "29-Empty-14:00" >> $dayofweekfile
		echo "30-Empty-14:30" >> $dayofweekfile
		echo "31-Empty-15:00" >> $dayofweekfile
		echo "32-Empty-15:30" >> $dayofweekfile
		echo "33-Empty-16:00" >> $dayofweekfile
		echo "34-Empty-16:30" >> $dayofweekfile
		echo "35-Evening Routine-17:00" >> $dayofweekfile
		echo "36-Evening Routine-17:30" >> $dayofweekfile
		echo "37-Evening Routine-18:00" >> $dayofweekfile
		echo "38-Evening Routine-18:30" >> $dayofweekfile
		echo "39-Empty-19:00" >> $dayofweekfile
		echo "40-Empty-19:30" >> $dayofweekfile
		echo "41-Empty-20:00" >> $dayofweekfile
		echo "42-Sleeping-20:30" >> $dayofweekfile
		echo "43-Sleeping-21:00" >> $dayofweekfile
		echo "44-Sleeping-21:30" >> $dayofweekfile
		echo "45-Sleeping-22:00" >> $dayofweekfile
		echo "46-Sleeping-22:30" >> $dayofweekfile
		echo "47-Sleeping-23:00" >> $dayofweekfile
		echo "48-Sleeping-23:30" >> $dayofweekfile
}

#######################################
# Function to increment weekend task count
#######################################
function weekend_add_total() {
		# Read weekend task count and increment by 1
		wetotal=$((weekendtotal+1))
		# Cleanup files
		rm weekendtotal.txt
		touch weekendtotal.txt
		echo $wetotal >> weekendtotal.txt
}

#######################################
# Function to decrement weekend task count
#######################################
function weekend_sub_total() {
		# Read weekend task count and decrement by 1
		wetotal=$((weekendtotal-1))
		# Cleanup files
		rm weekendtotal.txt
		touch weekendtotal.txt
		echo $wetotal >> weekendtotal.txt
}

#######################################
# Function to log weekend tasks
#######################################
function weekend_routine() {
		# Task logging logic
		echo "Skip? 1 for Yes, Anything Else for No."
		read skip
		if [ $skip = 1 ]
			then
				echo "Skipped"
				no_duration
				echo $timestamp: "Task Skipped : "$task >> Master_Task_Log.txt
		else
			echo $timestamp: "Task : "$task >> Master_Task_Log.txt
			duration
		fi
		newday=$(date +%u)
		seconds=$(sed -n '1p' day.txt)
		if [ $newday -eq $seconds ]
			then
				wecheck=$(sed -n "$wetask"p welist.txt)
				check_if_done_we
				if [ $wecheck = 0 ]
					then
						echo $task"-----[x]" >> weekend_routine.txt
						task_increment_we
				fi
				time_left_subtraction_we
		fi
}

#######################################
# Function to check weekend task count
#######################################
function check_if_done_we() {
		counter=1
		while read p; do
			echo $p
			if [ $wetask = $counter ]
				then
					echo "1" >> welisttemp.txt
			else
				line=$(sed -n "$counter"p welist.txt)
				echo $line >> welisttemp.txt
			fi
			counter=$((counter+1))
		done <welist.txt
		# Cleanup files
		rm welist.txt
		cp welisttemp.txt welist.txt
		rm welisttemp.txt
}

#######################################
# Function to increment weekend task count
#######################################
function task_increment_we() {
		# Read weekend task count
		task_count_we=$(sed -n 1p task_count_we.txt)
		# Increment task count logic
		if [ task_count_we = "" ]
			then
				task_count_we=0
		fi
		task_count_we=$((task_count_we+1))
		rm task_count_we.txt
		echo $task_count_we >> task_count_we.txt
}

#######################################
# Function to decrement weekend task count
#######################################
function time_left_subtraction_we() {
		# Read weekend task count
		timeleftwe=$(sed -n 1p timeleftwe.txt)
		timevarwe=$(($timeleftwe-$timevarwe))
		# Cleanup files
		rm timeleftwe.txt
		touch timeleftwe.txt
		echo $timevarwe >> timeleftwe.txt
}

#######################################
# Function to log task type
#######################################
function log_task_type() {
		task_option=0
		if [ $logType = "1" ]
			then
				task_option=1
		elif [ $logType = "task111" ]
			then
				task_option=2
		elif [ $logType = "222" ]
			then
				task_option=3
		elif [ $logType = "333" ]
			then
				task_option=4
		elif [ $logType = "2" ]
			then
				task_option=5
		elif [ $logType = "3" ]
			then
				task_option=6
		elif [ $logType = "4" ]
			then
				task_option=7
		elif [ $logType = "5" ]
			then
				task_option=8
		elif [ $logType = "6" ]
			then
				task_option=9
		elif [ $logType = "7" ]
			then
				task_option=10
		elif [ $logType = "8" ]
			then
				task_option=11
		elif [ $logType = "9" ]
			then
				task_option=12
		elif [ $logType = "10" ]
			then
				task_option=13
		elif [ $logType = "11" ]
			then
				task_option=14
		elif [ $logType = "12" ]
			then
				task_option=15
		elif [ $logType = "13" ]
			then
				task_option=16
		elif [ $logType = "14" ]
			then
				task_option=17
		elif [ $logType = "15" ]
			then
				task_option=18
		elif [ $logType = "16" ]
			then
				task_option=19
		elif [ $logType = "17" ]
			then
				task_option=20
		elif [ $logType = "18" ]
			then
				task_option=21
		elif [ $logType = "19" ]
			then
				task_option=22
		elif [ $logType = "20" ]
			then
				task_option=23
		elif [ $logType = "21" ]
			then
				task_option=24
		elif [ $logType = "22" ]
			then
				task_option=25
		elif [ $logType = "23" ]
			then
				task_option=26
		elif [ $logType = "24" ]
			then
				task_option=27
		elif [ $logType = "25" ]
			then
				task_option=28
		elif [ $logType = "26" ]
			then
				task_option=29
		elif [ $logType = "27" ]
			then
				task_option=30
		elif [ $logType = "28" ]
			then
				task_option=31
		elif [ $logType = "29" ]
			then
				task_option=32
		elif [ $logType = "30" ]
			then
				task_option=33
		elif [ $logType = "31" ]
			then
				task_option=34
		elif [ $logType = "32" ]
			then
				task_option=35
		elif [ $logType = "33" ]
			then
				task_option=36
		elif [ $logType = "34" ]
			then
				task_option=37
		elif [ $logType = "35" ]
			then
				task_option=38
		elif [ $logType = "36" ]
			then
				task_option=39
		elif [ $logType = "37" ]
			then
				task_option=40
		elif [ $logType = "38" ]
			then
				task_option=41
		elif [ $logType = "39" ]
			then
				task_option=42
		elif [ $logType = "40" ]
			then
				task_option=43
		elif [ $logType = "41" ]
			then
				task_option=44
		else
			task_option=0
		fi
		generate_time_stamp
		if [ $task_option = 0 ]
			then
				echo $timestamp: "Task : Error" >> task_type_log.txt
		else
			tasklog=$(sed -n "$task_option"p task_type_options.txt)
			echo $timestamp: "Task : "$tasklog >> task_type_log.txt
		fi
}

#######################################
# Function to display meal history
#######################################
function meal_history() {
		counter=1
		while read p; do
			echo $counter "For "$p
			if [ $counter = 20 ]
				then
					echo "Skip This!"
				break
			fi
			counter=$((counter+1))
		done <meal_history.txt
}

#######################################
# Function to log meal choice
#######################################
function meal_history_choice() {
		if [ $meal -gt 0 ] && [ $meal -lt 21 ]
			then
			counter=1
			while read p; do
				if [ $counter = $meal ]
					then
						meal=$p
					break
				fi
				counter=$((counter+1))
			done <meal_history.txt
		fi
}

#######################################
# Function to display music history
#######################################
function music_history() {
		counter=1
		while read p; do
			echo $counter "For "$p
			if [ $counter = 20 ]
				then
					echo "Skip This!"
				break
			fi
			counter=$((counter+1))
		done <music_history.txt
}

#######################################
# Function to log music choice
#######################################
function music_history_choice() {
		if [ $music -gt 0 ] && [ $music -lt 21 ]
			then
			counter=1
			while read p; do
				if [ $counter = $music ]
					then
						music=$p
					break
				fi
				counter=$(($counter+1))
			done <music_history.txt
		fi
}

#######################################
# Function to display common history
#######################################
function common_task_history() {
		counter=1
		while read p; do
			echo $counter "For "$p
			if [ $counter = 20 ]
				then
					echo "Skip This!"
				break
			fi
			counter=$(($counter+1))
		done <current_task_log.txt
}

#######################################
# Function to display common task history
#######################################
function common_task_history_choice() {
		if [ $common_task -gt 0 ] && [ $common_task -lt 21 ]
			then
			counter=1
			while read p; do
				if [ $counter = $common_task ]
					then
						common_task=$p
					break
				fi
				counter=$(($counter+1))
			done <current_task_log.txt
		fi
}

#######################################
# Function to display game history
#######################################
function game_history() {
		counter=1
		while read p; do
			echo $counter "For "$p
			if [ $counter = 20 ]
				then
					echo "Skip This!"
				break
			fi
			counter=$((counter+1))
		done <game_history.txt
}

#######################################
# Function to log game choice
#######################################
function game_history_choice() {
		if [ $game -gt 0 ] && [ $game -lt 21 ]
			then
			counter=1
			while read p; do
				if [ $counter = $game ]
					then
						game=$p
					break
				fi
				counter=$((counter+1))
			done <game_history.txt
		fi
}

#######################################
# Function to display film history
#######################################
function film_history() {
		counter=1
		while read p; do
			echo $counter "For "$p
			if [ $counter = 20 ]
				then
					echo "Skip This!"
				break
			fi
			counter=$((counter+1))
		done <film_history.txt
}

#######################################
# Function to log film choice
#######################################
function film_history_choice() {
		if [ $film -gt 0 ] && [ $film -lt 21 ]
			then
			counter=1
			while read p; do
				if [ $counter = $film ]
					then
						film=$p
					break
				fi
				counter=$((counter+1))
			done <film_history.txt
		fi
}

#######################################
# Function to log calories
#######################################
function calorie_tracker()
{
		dailycalorie=$(sed -n 1p dailycal.txt)
		clear
		echo "********************************"
		echo "How Many Calories Did You Consume? #1"
		echo "********************************"
		read calorieintakeone
		clear
		echo "********************************"
		echo "How Many Calories Did You Consume? #2"
		echo "********************************"
		read calorieintaketwo
		clear
		echo "********************************"
		echo "How Many Calories Did You Consume? #3"
		echo "********************************"
		read calorieintakethree
		clear
		echo "********************************"
		echo "How Many Calories Did You Consume? #4"
		echo "********************************"
		read calorieintakefour
		clear
		echo "********************************"
		echo "How Many Calories Did You Consume? #5"
		echo "********************************"
		read calorieintakefive
		if [ "$calorieintakeone" != "" ]
			then
				calorieintakeone=$calorieintakeone
		else
				calorieintakeone=0
		fi
		if [ "$calorieintaketwo" != "" ]
			then
				calorieintaketwo=$calorieintaketwo
		else
				calorieintaketwo=0
		fi
		if [ "$calorieintakethree" != "" ]
			then
				calorieintakethree=$calorieintakethree
		else
				calorieintakethree=0
		fi
		if [ "$calorieintakefour" != "" ]
			then
				calorieintakefour=$calorieintakefour
		else
				calorieintakefour=0
		fi
		if [ "$calorieintakefive" != "" ]
			then
				calorieintakefive=$calorieintakefive
		else
				calorieintakefive=0
		fi
		dailycalorie=$((calorieintakeone+calorieintaketwo+calorieintakethree+calorieintakefour+calorieintakefive+dailycalorie))
		# Cleanup files
		rm dailycal.txt
		touch dailycal.txt
		echo $dailycalorie >> dailycal.txt
}

#######################################
# Function to perform a quick log
#######################################
function quick_log() {
	# Generate time stamp
	generate_time_stamp
	# Log task
	echo $timestamp: "Task : "$quick_log_task >> Master_Task_Log.txt
	grab_last_line_task_only
	duration
}

#######################################
# Main loop
#######################################
while :
do
	clear
	#######################################
	# Generate the main menu
	#######################################
	generate_main_menu
	#######################################
	# read option from the user
	#######################################
	read logType
	trim=$logType
	leading_space_trim
	logType=$trim
	# is_numeric - removed for now 2/11/19
	# numeric_test=$logType
	log_task_type
	#######################################
	# Grab the last line from the master log
	#######################################
	grab_last_line
	#######################################
	# Get the number of seconds from the seconds file
	#######################################
	seconds=$(sed -n '1p' seconds.txt)
	#######################################
	# Get the value set in the cat text file
	#######################################
	# cat=$(sed -n '1p' cat.txt)  - removed for now 2/11/19
	#######################################
	# Get the current epoch time
	#######################################
	epoch=$(date +%s)
	#######################################
	# Calculate the duration since the last task
	#######################################
	# calculation=`expr $epoch - $seconds` - removed for now 2/11/19
	# timestamp=$(date +"%d-%m-%Y_%H_%M-%S") - removed for now 2/11/19
	# result=$(printf '%02dh:%02dm:%02ds\n' $(($calculation/3600)) $(($calculation%3600/60)) $(($calculation%60))) - removed for now 2/11/19
	#######################################
	# Do duration logic
	#######################################
	cat_log
	#######################################
	# Get current day
	#######################################
	curday=$(date +%u)
	#######################################
	# If option input is blank then reload menu
	#######################################
	if [ $logType = "" ]
		then
			clear
			no_duration
		elif [ $logType = 1 ]
			then
				clear
				generate_time_stamp
				echo "********************************"
				echo "You Have Selected Option 1."
				echo "The Current Time Is: "$timestamp
				echo "What Are You Currently Doing?"
				echo "Type 1 for Submenu"
				echo "********************************"
				read task
				trim=$task
				leading_space_trim
				task=$trim
				title=$task
				TitleCaseConverter
				task=$title
				generate_time_stamp
				if [ $task = 1 ]
					then
						echo "********************************"
						echo "You Have Selected Option 1 for the Submenu."
						echo "The Current Time Is: "$timestamp
						echo "Please Make Your Selection"
						echo "1 for Morning Routine"
						echo "2 for Evening Routine"
						echo "3 for Daily Routine"
						echo "4 for Weekend Routine"
						echo "5 for Self Care Routine"
						echo "6 for Common Tasks"
						echo "********************************"
						read task
						trim=$task
						leading_space_trim
						task=$trim
						if [ $task = 1 ]
							then
								echo "********************************"
								echo "You Have Selected Option 1 for the Morning Routine."
								echo "The Current Time Is: "$timestamp
								echo "Please Make Your Selection"
								echo "111 for Today's Routine Progress"
								echo "999 for Minimal Routine"
								echo "1 for Oral Hygiene"
								echo "2 for Eye Care"
								echo "3 for Power On Phones"
								echo "4 for Turn off Electronics"
								echo "5 for Powerball Exercise"
								echo "6 for Having Breakfast"
								echo "7 for Warm Compress"
								echo "8 for Having a Cup of Tea"
								echo "9 for Cleaning Nose"
								echo "10 for Clearing Inbox"
								echo "11 for Ice Facial"
								echo "12 for Wash Face"
								echo "13 for Getting Dressed"
								echo "14 for Taking Supplements"
								echo "15 for Having a Shower"
								echo "16 for After Shower Routine"
								echo "17 for Weigh Yourself"
								echo "18 for Record Anxiety/Depression"
								echo "19 for Downloading Daily Data"
								echo "20 for Journal Entry"
								echo "21 for Articulation"
								echo "22 for Check Timers"
								echo "********************************"
								read task
								trim=$task
								leading_space_trim
								task=$trim
								if [ $task = 1 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Flossing, Brushing Teeth, Rinsing Mouthwash" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Flossing, Brushing Teeth, Rinsing Mouthwash" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=1
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Oral Hygiene-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=6
											time_left_subtraction
										fi
								elif  [ $task = 2 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Washing Hands, Rinsing Eyes" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Washing Hands, Rinsing Eyes" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=2
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Eye Care-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=3
											time_left_subtraction
										fi
								elif  [ $task = 3 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
												echo $timestamp: "Task Skipped : Power On Phones" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Power On Phones" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=3
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Power On Phones-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=2
											time_left_subtraction
										fi
								elif  [ $task = 4 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
												echo $timestamp: "Task Skipped : Turned Off Electronics" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Turned Off Electronics" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=4
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Turn off Electronics-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=1
											time_left_subtraction
										fi
								elif  [ $task = 5 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
												echo $timestamp: "Task Skipped : Powerball Exercise" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Powerball Exercise" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=5
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Powerball Exercise-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=3
											time_left_subtraction
										fi
								elif  [ $task = 6 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Having Breakfast" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Having Breakfast" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=6
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Having Breakfast-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=10
											time_left_subtraction
										fi
									elif  [ $task = 7 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Warm Compress" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Warm Compress" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=7
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Warm Compress-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=10
											time_left_subtraction
										fi
									elif  [ $task = 8 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Having a cup of tea" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Having a cup of tea" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=8
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Having A Cup Of Tea-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=5
											time_left_subtraction
										fi
									elif  [ $task = 9 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Cleaning Nose" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Cleaning Nose" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=9
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Cleaning Nose-----[x]" >> morning_routine.txt
													task_increment_am
												fi
												timevar=2
												time_left_subtraction
										fi
									elif  [ $task = 10 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Clearing Inbox" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Clearing Inbox" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=10
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Clearing Inbox-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=2
											time_left_subtraction
										fi
									elif  [ $task = 11 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Ice Facial" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Ice Facial" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=11
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Ice Facial-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=10
											time_left_subtraction
										fi
									elif  [ $task = 12 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Washed Face" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Washed Face" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=12
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Washed Face-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=10
											time_left_subtraction
										fi
									elif  [ $task = 13 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Getting Dressed" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Getting Dressed" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=13
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Getting Dressed-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=5
											time_left_subtraction
										fi
									elif  [ $task = 14 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
										else
											clear
											echo "********************************"
											echo "Which Supplements?"
											echo "Type 1 for Default"
											echo "********************************"
											read supplements
											if [ $supplements = 1 ]
												then
													supplements=$(sed -n '1p' day_supps.txt)
													echo $timestamp: "Task : Taking Supplements: "$supplements >> Master_Task_Log.txt
											else
												echo $timestamp: "Task : Taking Supplements: "$supplements >> Master_Task_Log.txt
												duration
											fi
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=14
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Taking Supplements-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=2
											time_left_subtraction
										fi
									elif  [ $task = 15 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Having a Shower" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Having a Shower" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=15
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Having a Shower-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=6
											time_left_subtraction
										fi
									elif  [ $task = 16 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : After Shower Routine" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : After Shower Routine" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=16
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "After Shower Routine-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=5
											time_left_subtraction
										fi
									elif  [ $task = 17 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Weigh Yourself" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Weigh Yourself" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=17
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Weigh Yourself-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=2
											time_left_subtraction
										fi
									elif  [ $task = 18 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Record Anxiety/Depression" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Record Anxiety/Depression" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=18
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Record Anxiety/Depression-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=1
											time_left_subtraction
										fi
									elif  [ $task = 19 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Downloading Daily Data" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Downloading Daily Data" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=19
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Downloading Daily Data-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=1
											time_left_subtraction
										fi
									elif  [ $task = 20 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Journal Entry" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Journal Entry" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=20
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Journal Entry-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=10
											time_left_subtraction
										fi
									elif  [ $task = 21 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Articulation" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Articulation" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=21
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Articulation-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=5
											time_left_subtraction
										fi
									elif  [ $task = 22 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Check Timers" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Check Timers" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											morntask=22
											morncheck=$(sed -n "$morntask"p mornlist.txt)
											check_if_done
											if [ $morncheck = 0 ]
												then
													echo "Check Timers-----[x]" >> morning_routine.txt
													task_increment_am
											fi
											timevar=1
											time_left_subtraction
										fi
									elif  [ $task = 111 ]
									then
										cat morning_routine.txt
										no_duration
										morn_count=$(sed -n 1p task_count_am.txt)
										echo "Completed: "$morn_count" / 20"
										read point
									elif [ $task = 999 ]
										then
											# Apply mininal routine
											rm mornlist.txt
											touch mornlist.txt
											echo "0" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "0" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "0" >> mornlist.txt
											echo "0" >> mornlist.txt
											echo "0" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											echo "1" >> mornlist.txt
											generate_time_stamp
											echo $timestamp: "Task : Minimal AM Routine Applied" >> Master_Task_Log.txt
								else
									no_duration
								fi
						elif [ $task = 2 ]
							then
								echo "********************************"
								echo "You Have Selected Option 2 for the Evening Routine."
								echo "The Current Time Is: "$timestamp
								echo "Please Make Your Selection"
								echo "111 for Today's Routine Progress"
								echo "999 for Minimal Routine"
								echo "1 for Oral Hygiene"
								echo "2 for Eye Care"
								echo "3 for Deodorant"
								echo "4 for Turn off Electronics"
								echo "5 for Have a Shower"
								echo "6 for Having Dinner"
								echo "7 for Power Off Phones"
								echo "8 for Having a Cup of Tea"
								echo "9 for Cleaning Nose"
								echo "10 for Clearing Inbox"
								echo "11 for Ironing Clothes"
								echo "12 for Facial / Mud Mask"
								echo "13 for Preparing Work Bag"
								echo "14 for Writing Diary Entry"
								echo "15 for Having a Shave"
								echo "16 for Washed Face"
								echo "17 for after Shower Routine"
								echo "18 for Getting Dressed"
								echo "19 for Taking Supplements"
								echo "********************************"
								read task
								trim=$task
								leading_space_trim
								task=$trim
								generate_time_stamp
								if [ $task = 1 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Flossing, Brushing Teeth, Rinsing Mouthwash" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Flossing, Brushing Teeth, Rinsing Mouthwash" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=1
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Oral Hygiene-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=6
											time_left_subtraction_eve
										fi
								elif  [ $task = 2 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Washing hands, Rinsing Eyes" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Washing hands, Rinsing Eyes" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=2
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Eye Care-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=3
											time_left_subtraction_eve
										fi
								elif  [ $task = 3 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Applied Deodorant" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Applied Deodorant" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=3
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Applied Deodorant-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=5
											time_left_subtraction_eve
										fi
								elif  [ $task = 4 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Turned Off Electronics" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Turned Off Electronics" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=4
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Turned Off Electronics Hygiene-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=1
											time_left_subtraction_eve
										fi
								elif  [ $task = 5 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Had A Shower" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Had A Shower" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=5
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Shower-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=5
											time_left_subtraction_eve
										fi
								elif  [ $task = 6 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Having Dinner" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Having Dinner" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=6
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Having Dinner-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=5
											time_left_subtraction_eve
										fi
								elif  [ $task = 7 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Power Off Phones" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Power Off Phones" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=7
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Power Off Phones-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
										    timevareve=1
											time_left_subtraction_eve
										fi
								elif  [ $task = 8 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Having A Cup Of Tea" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Having A Cup Of Tea" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=8
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Having A Cup Of Tea-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=5
											time_left_subtraction_eve
										fi
								elif  [ $task = 9 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Cleaning Nose" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Cleaning Nose" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=9
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Cleaning Nose-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=2
											time_left_subtraction_eve
										fi
								elif  [ $task = 10 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Clearing Inbox" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Clearing Inbox" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=10
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Clearing Inbox-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=2
											time_left_subtraction_eve
										fi
								elif  [ $task = 11 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Ironing Clothes" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Ironing Clothes" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=11
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Ironing Clothes-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=10
											time_left_subtraction_eve
										fi
								elif  [ $task = 12 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Facial / Mud Mask" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Facial / Mud Mask" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=12
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Facial / Mud Mask-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=12
											time_left_subtraction_eve
										fi
								elif  [ $task = 13 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Preparing Work Bag" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Preparing Work Bag" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=13
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Preparing Work Bag-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=5
											time_left_subtraction_eve
										fi
								elif  [ $task = 14 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Writing Diary Entry" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Writing Diary Entry" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=14
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Writing Diary Entry-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=10
											time_left_subtraction_eve
										fi
								elif  [ $task = 15 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Having A Shave" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Having A Shave" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=15
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Having A Shave-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=10
											time_left_subtraction_eve
										fi
								elif  [ $task = 16 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Washed Face" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Washed Face" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=16
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Washed Face Pot-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=10
											time_left_subtraction_eve
										fi
								elif  [ $task = 17 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
											echo $timestamp: "Task Skipped : Apply Deodorant, Apply Aftershave And Baby Powder To Genitals, Dry And Style Hair, Foot Powder" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Apply Deodorant, Apply Aftershave And Baby Powder To Genitals, Dry And Style Hair, Foot Powder" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=17
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "After Shower Routine-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=5
											time_left_subtraction_eve
										fi
								elif  [ $task = 18 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
													echo $timestamp: "Task Skipped : Getting Dressed" >> Master_Task_Log.txt
										else
											echo $timestamp: "Task : Getting Dressed" >> Master_Task_Log.txt
											duration
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=18
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Getting Dressed-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=5
											time_left_subtraction_eve
										fi
								elif  [ $task = 19 ]
									then
										echo "Skip? 1 for Yes, Anything Else for No."
										read skip
										if [ $skip = 1 ]
											then
												echo "Skipped"
													no_duration
										else
											clear
											echo "********************************"
											echo "Which Supplements?"
											echo "Type 1 for Default"
											echo "********************************"
											read supplements
											if [ $supplements = 1 ]
												then
													supplements=$(sed -n '1p' eve_supps.txt)
													echo $timestamp: "Task : Taking Supplements: "$supplements >> Master_Task_Log.txt
											else
												echo $timestamp: "Task : Taking Supplements: "$supplements >> Master_Task_Log.txt
												duration
											fi
										fi
										newday=$(date +%u)
										seconds=$(sed -n '1p' day.txt)
										if [ $newday -eq $seconds ]
											then
											evetask=19
											evecheck=$(sed -n "$evetask"p evelist.txt)
											check_if_done_eve
											if [ $evecheck = 0 ]
												then
													echo "Taking Supplements-----[x]" >> evening_routine.txt
													task_increment_pm
											fi
											timevareve=1
											time_left_subtraction_eve
										fi
								elif [ $task = 999 ]
									then
										# Apply mininal routine
										rm evelist.txt
										touch evelist.txt
										echo "0" >> evelist.txt
										echo "1" >> evelist.txt
										echo "0" >> evelist.txt
										echo "1" >> evelist.txt
										echo "0" >> evelist.txt
										echo "0" >> evelist.txt
										echo "1" >> evelist.txt
										echo "1" >> evelist.txt
										echo "1" >> evelist.txt
										echo "1" >> evelist.txt
										echo "1" >> evelist.txt
										echo "1" >> evelist.txt
										echo "1" >> evelist.txt
										echo "1" >> evelist.txt
										echo "0" >> evelist.txt
										echo "1" >> evelist.txt
										echo "1" >> evelist.txt
										echo "0" >> evelist.txt
										echo "0" >> evelist.txt
										generate_time_stamp
										echo $timestamp: "Task : Minimal PM Routine Applied" >> Master_Task_Log.txt
								elif  [ $task = 111 ]
									then
										no_duration
										cat evening_routine.txt
										eve_count=$(sed -n 1p task_count_pm.txt)
										echo "Completed: "$eve_count" / 19"
										read point
										no_duration
								else
									no_duration
								fi
						elif [ $task = 3 ]
							then
							echo ""
						elif [ $task = 4 ]
							then
								echo "********************************"
								echo "You Have Selected Option 4 for the Weekend Routine."
								echo "The Current Time Is: "$timestamp
								echo "Please Make Your Selection"
								echo "111 to Backup Current Progress"
								echo "1 for Charging Toothbrush"
								echo "2 for Charging Phone"
								echo "3 for Doing Laundry"
								echo "4 for Schedule Planning"
								echo "5 for Weekend Checks"
								echo "6 for Clipping Fingernails and Toenails"
								echo "7 for Charging Tablet Device"
								echo "8 for Ironing Clothes"
								echo "9 for Skip"
								echo "10 for Skip"
								echo "11 for Upload Journal File"
								echo "12 for Upload Task Log"
								echo "13 for Upload to Onedrive"
								echo "14 for Skip"
								echo "15 for Putting Wash Out To Dry"
								echo "16 for Electricity Usage"
								echo "17 for Plucking Eyebrows"
								echo "18 for Plucking Nose Hairs"
								echo "19 for Paying Rent"
								echo "20 for Paying Council Tax"
								echo "21 for Charging device"
								echo "22 for Paying Keep"
								echo "23 for Upload Pictures"
								echo "24 for Refill Supplements"
								echo "25 for Shaving Sideburns"
								echo "26 for Change Bedding"
								echo "27 for Buying Media"
								# echo "26 for Add/Subtract Counter"
								weekendtotal=$(sed -n '1p' weekendtotal.txt)
								echo "Count: "$weekendtotal" / 27"
								echo "********************************"
								read task
								trim=$task
								leading_space_trim
								task=$trim
								generate_time_stamp
								if [ $task = 1 ]
									then
										wetask=1
										task="Charging Toothbrush"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 2 ]
									then
										wetask=2
										echo "Which Device Are You Charging?"
										echo "Type 1 for Skype Phone."
										echo "Type 2 for Work Phone."
										echo "Type 3 for Personal Phone."
										echo "Type 4 for MP3 Phone."
										echo "Type 5 for Journal Phone."
										echo "Type 6 for Email Phone."
										echo "Type 7 for Movies Phone."
										echo "Type 8 for Other Phone."
										read phonetype
										if [ $phonetype != "" ]
											then
												if [ $phonetype = 1 ]
													then
														task="Charging Skype Phone"
												elif [ $phonetype = 2 ]
													then
														task="Charging Work Phone"
												elif [ $phonetype = 3 ]
													then
														task="Charging Personal Phone"
												elif [ $phonetype = 4 ]
													then
														task="Charging MP3 Phone"
												elif [ $phonetype = 5 ]
													then
														task="Charging Journal Phone"
												elif [ $phonetype = 6 ]
													then
														task="Charging Email Phone"
												elif [ $phonetype = 7 ]
													then
														task="Charging Movies Phone"
												elif [ $phonetype = 8 ]
													then
														task="Charging Phone"
												fi
												timevarwe=5
												weekend_routine
												weekend_add_total
												duration
										fi
								elif  [ $task = 3 ]
									then
										wetask=3
										task="Doing Laundry"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 4 ]
									then
										wetask=4
										task="Planning Schedule"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 5 ]
									then
										wetask=5
										task="Weekend Checks"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 6 ]
									then
										wetask=6
										task="Clipping Toenails And Fingernails"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 7 ]
									then
										wetask=7
										task="Charging Tablet Device"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 8 ]
									then
										wetask=8
										task="Ironing Clothes"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 9 ]
									then
										wetask=9
										task="Skip"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 10 ]
									then
										wetask=10
										task="Skip"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 11 ]
									then
										wetask=11
										task="Uploading Journal File"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 12 ]
									then
										wetask=12
										task="Uploading Task Log File"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 13 ]
									then
										wetask=13
										task="Upload files To OneDrive"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 14 ]
									then
										wetask=14
										task="Skip"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 15 ]
									then
										wetask=15
										task="Putting Washing Out To Dry"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 16 ]
									then
										echo ""
										echo "Please Enter Your Usage Below (in kwH)."
										echo ""
										read usage
										wetask=16
										task="Electricity Usage: "$usage
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 17 ]
									then
										wetask=17
										task="Plucking Eyebrows"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 18 ]
									then
										wetask=18
										task="Plucking Nose Hairs"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 19 ]
									then
										wetask=19
										task="Paying Rent"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 20 ]
									then
										wetask=20
										task="Paying Council Tax"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 21 ]
									then
										echo "Which Device Are You Charging?"
										echo "Type 1 for Laptop"
										echo "Type 2 for Bluetooth Speaker"
										echo "Type 3 for Mirror"
										read device
										if [ $device = 1 ]
											then
												device="Laptop"
										elif [ $device = 2 ]
											then
												device="Bluetooth Speaker"
										elif [ $device = 3 ]
											then
												device="Mirror"
										fi
										wetask=21
										task="Charging Device: "$device
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 22 ]
									then
										wetask=22
										task="Paying Keep"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 23 ]
									then
										wetask=23
										task="Upload Pictures"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 24 ]
									then
										wetask=24
										task="Refill Supplements"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 25 ]
									then
										wetask=25
										task="Shaving Sideburns"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 28 ]
									then
										echo "Type 1 for Add."
										echo "Type 2 for Subtract."
										read type
										if [ $type = 1 ]
											then
												weekend_add_total
										else
												weekend_sub_total
										fi
										no_duration
								elif  [ $task = 26 ]
									then
										wetask=26
										task="Changing Bedding"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif  [ $task = 27 ]
									then
										wetask=27
										task="Buying Media"
										timevarwe=5
										weekend_routine
										weekend_add_total
										duration
								elif [ $task = 111 ]
									then
										clear
											echo "********************************"
											echo "Would You Like To Save Your Progress?"
											echo "Type 1 for Save"
											echo "Would You Like To Restore Your Progress?"
											echo "Type 2 for Restore"
											echo "********************************"
											read wetype
											if [ $wetype = 1 ]
												then
													rm weekend_routine_backup.txt
													cp welist.txt weekend_routine_backup.txt
													rm weekend_routine_count.txt
													cp task_count_we.txt weekend_routine_count.txt
											elif [ $wetype = 2 ]
												then
													rm welist.txt
													cp weekend_routine_backup.txt welist.txt
													rm weekend_routine_backup.txt
													rm task_count_we.txt
													cp weekend_routine_count.txt task_count_we.txt
											fi
								else
									no_duration
								fi
						elif [ $task = 5 ]
							then
								echo "********************************"
								echo "You Have Selected Option 5 for the Self Care Routine."
								echo "The Current Time Is: "$timestamp
								echo "Please Make Your Selection"
								echo "111 for All Items"
								echo "1 for Lip Balm"
								echo "2 for Eye Spray / Drops"
								echo "3 for Nasal Inhaler"
								echo "4 for Blotting"
								echo "5 for Cleaning Hands"
								echo "6 for Flushing Eyes"
								echo "7 for Taking Glucose"
								echo "8 for Freshen Breath"
								echo "9 for Eating Sweet/Mint/Gum"
								echo "10 for Breathing Exercise"
								echo "11 for Spritzing Hair"
								echo "12 for Applying Talc"
								echo "13 for Spritzing Face with Rose Water"
								echo "14 for Wet Wipe"
								echo "********************************"
								read task
								trim=$task
								leading_space_trim
								task=$trim
								generate_time_stamp
								if [ $task = 1 ]
									then
										echo $timestamp: "Task : Applying Lip Balm" >> Master_Task_Log.txt
										duration
								elif  [ $task = 2 ]
									then
										echo $timestamp: "Task : Eye Spray / Drops" >> Master_Task_Log.txt
										duration
								elif  [ $task = 3 ]
									then
										echo $timestamp: "Task : Nasal Inhaler" >> Master_Task_Log.txt
										duration
								elif  [ $task = 4 ]
									then
										echo $timestamp: "Task : Blotting" >> Master_Task_Log.txt
										duration
								elif  [ $task = 5 ]
									then
										echo $timestamp: "Task : Cleaning Hands" >> Master_Task_Log.txt
										duration
								elif  [ $task = 6 ]
									then
										echo $timestamp: "Task : Flushing Eyes" >> Master_Task_Log.txt
										duration
								elif  [ $task = 7 ]
									then
										echo $timestamp: "Task : Taking Glucose" >> Master_Task_Log.txt
										duration
								elif  [ $task = 8 ]
									then
										echo $timestamp: "Task : Freshening Breath" >> Master_Task_Log.txt
										duration
								elif  [ $task = 9 ]
									then
										echo $timestamp: "Task : Eating Sweet/Mint/Gum" >> Master_Task_Log.txt
										duration
								elif  [ $task = 10 ]
									then
										echo $timestamp: "Task : Breathing Exercise" >> Master_Task_Log.txt
										duration
								elif  [ $task = 11 ]
									then
										echo $timestamp: "Task : Spritzing Hair" >> Master_Task_Log.txt
										duration
								elif  [ $task = 12 ]
									then
										echo $timestamp: "Task : Applying Talc" >> Master_Task_Log.txt
										duration
								elif  [ $task = 13 ]
									then
										echo $timestamp: "Task : Spritzing Face with Rose Water" >> Master_Task_Log.txt
										duration
								elif  [ $task = 14 ]
									then
										echo $timestamp: "Task : Wet Wipe" >> Master_Task_Log.txt
										duration
								elif  [ $task = 111 ]
									then
										rm self_care_time.txt
										touch self_care_time.txt
										# Get current time
										epoch=$(date +%s)
										# Add one hour
										epoch=$((epoch+3600))
										# Write time to file
										echo $epoch >> self_care_time.txt
										echo $timestamp: "Time Log : Self Care Routine" >> Master_Task_Log.txt
										no_duration
										echo $timestamp: "Task : Applying Lip Balm" >> Master_Task_Log.txt
										#echo $timestamp: "Task : Eye Spray / Eye Drops" >> Master_Task_Log.txt
										echo $timestamp: "Task : Nasal Inhaler" >> Master_Task_Log.txt
										#echo $timestamp: "Task : Blotting" >> Master_Task_Log.txt
										echo $timestamp: "Task : Cleaning Hands" >> Master_Task_Log.txt
										duration
								else
									no_duration
								fi
						elif [ $task = 6 ]
							then
								echo "********************************"
								echo "You Have Selected Option 6 for Common Tasks."
								echo "The Current Time Is: "$timestamp
								echo "Please Make Your Selection"
								echo "1 for Toilet Break"
								echo "2 for Tidying Room"
								echo "3 for Travelling"
								echo "4 for Gaming"
								echo "5 for Working"
								echo "6 for Shopping"
								echo "7 for Preparing Food"
								echo "8 for Making My Bed"
								echo "9 for Surfing the Internet"
								echo "10 for Reading/Audiobook"
								echo "11 for Facebook"
								echo "12 for Phone Call / Skype"
								echo "13 for Scripting"
								echo "14 for Break"
								echo "15 for Arriving Home"
								echo "16 for Using Computer"
								echo "17 for Washing Pots"
								echo "18 for Lighting Candle"
								echo "19 for Filling Up Water Bottles"
								echo "20 for Chatting"
								echo "21 for Drinking Beverage"
								echo "22 for Opening Window"
								echo "23 for Emptying Trash"
								echo "24 for Journaling"
								echo "25 for Taking Selfie"
								echo "26 for Boiling Kettle"
								echo "27 for Scanning"
								echo "28 for Private Time"
								#echo "29 for Waiting"
								#echo "30 for Walking"
								#echo "31 for Bus"
								echo "********************************"
								read task
								trim=$task
								leading_space_trim
								task=$trim
								generate_time_stamp
								if [ $task = 1 ]
									then
										toilet=$(sed -n '1p' toilet.txt)
										toilet=$((toilet+1))
										rm toilet.txt
										touch toilet.txt
										echo $toilet > toilet.txt
										echo $timestamp: "Task : Toilet Break #"$toilet >> Master_Task_Log.txt
										duration
								elif  [ $task = 2 ]
									then
										echo $timestamp: "Task : Tidying Room" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 3 ]
									then
										echo "********************************"
										echo "Where Are You Going?"
										echo "Type 1 For Work"
										echo "Type 2 For Home"
										echo "Type 3 For Shopping"
										echo "Type Anything Else For Another Place"
										echo "********************************"
										read destination
										if [ $destination = 1 ]
											then
												destination="To Work"
										elif [ $destination = 2 ]
											then
												destination="Home"
										elif [ $destination = 3 ]
											then
												destination="To The Shop"
										else
											destination="To "$destination
										fi
										echo $timestamp: "Task : Travelling "$destination >> Master_Task_Log.txt
										duration
								elif  [ $task = 4 ]
									then
										echo "********************************"
										echo "Which Game Is It?"
										echo "Type 111 for League of Legends"
										echo "********************************"
										game_history
										read game
										game_history_choice
										if [ "$game" != "" ]
											then
												if [ "$game" = 111 ]
													then
														echo $timestamp: "Game : League of Legends" >> Master_Task_Log.txt
												else
														echo $timestamp: "Game : "$game >> Master_Task_Log.txt
												fi
												# Record to current game file
												rm current_game.txt
												touch current_game.txt
												echo $game >> current_game.txt
												# Add to last ten games
												rm current_game_temp.txt
												touch current_game_temp.txt
												echo $game >> current_game_temp.txt
												counter=1
												while read p; do
													echo $p
													if [ $counter = 20 ]
														then
															echo "Skip This!"
													break
												fi
												echo $p >> current_game_temp.txt
												counter=$((counter+1))
												done <game_history.txt
												rm music_game.txt
												cp current_game_temp.txt game_history.txt
												rm current_game_temp.txt
												no_duration
										fi
										duration
								elif  [ $task = 5 ]
									then
										echo $timestamp: "Task : Working" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 6 ]
									then
										echo $timestamp: "Task : Shopping" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 7 ]
									then
										echo $timestamp: "Task : Preparing Food" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 8 ]
									then
										echo $timestamp: "Task : Making My Bed" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 9 ]
									then
										echo $timestamp: "Task : Surfing The Internet" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 10 ]
									then
										clear
										echo "********************************"
										echo "What Book Is It?"
										read book
										clear
										echo "********************************"
										echo "Type 1 for Start"
										echo "Type 2 for Stop"
										echo "********************************"
										read bookmarker
										if [ $bookmarker = 1 ]
											then
												bookmark=$bookmarker
												clear
												echo "********************************"
												echo "Enter Start Time / Page Number."
												echo "********************************"
												read booktime
												booktime="Start : "$booktime
										else
											bookmark=$bookmarker
											clear
											echo "********************************"
											echo "Enter End Time / Page Number."
											echo "********************************"
											read booktime
											booktime="End : "$booktime
										fi
										echo $timestamp: "Task : Reading/Audiobook: "$book" : "$booktime >> Master_Task_Log.txt
										duration
								elif  [ $task = 11 ]
									then
										echo $timestamp: "Task : Facebooking" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 12 ]
									then
										echo $timestamp: "Task : Phone Call / Skype" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 13 ]
									then
										echo $timestamp: "Task : Scripting" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 14 ]
									then
										echo $timestamp: "Task : Break" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 15 ]
									then
										echo $timestamp: "Task : Arriving Home" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 16 ]
									then
										echo $timestamp: "Task : Using Computer" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 17 ]
									then
										echo $timestamp: "Task : Washing Pots" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 18 ]
									then
										echo $timestamp: "Task : Lighting Candle" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 19 ]
									then
										echo $timestamp: "Task : Filling Up Water Bottles" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 20 ]
									then
										echo $timestamp: "Task : Chatting" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 21 ]
									then
										echo "********************************"
										echo "What Beverage Was It?"
										echo "Type 1 for Tea"
										echo "Type 2 for Coffee"
										echo "Type 3 for Alcohol"
										echo "Type 4 for Energy Drink"
										echo "Type 5 for Soda"
										echo "Type 6 for Fruit Juice"
										echo "********************************"
										read beverage
										if [ $beverage = 1 ]
											then
												beverage="Tea"
										elif [ $beverage = 2 ]
											then
												beverage="Coffee"
										elif [ $beverage = 3 ]
											then
												beverage="Alcohol"
										elif [ $beverage = 4 ]
											then
												beverage="Energy Drink"
										elif [ $beverage = 5 ]
											then
												beverage="Soda"
										elif [ $beverage = 6 ]
											then
												beverage="Fruit Juice"
										else
											echo ""
										fi
										clear
										echo "********************************"
										echo "How Much Did You Drink (in ml)?"
										echo "********************************"
										read measure
										echo $timestamp: "Task : Drinking Beverage - "$beverage" : "$measure"ml" >> Master_Task_Log.txt
										dailyamount=$(sed -n '1p' water_measure.txt)
										total=$((measure+$dailyamount))
										rm water_measure.txt
										echo $total > water_measure.txt
										duration
								elif  [ $task = 22 ]
									then
										echo $timestamp: "Task : Opening Window" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 23 ]
									then
										echo $timestamp: "Task : Emptying Trash" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 24 ]
									then
										echo $timestamp: "Task : Journaling" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 25 ]
									then
										echo $timestamp: "Task : Taking Selfie" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 26 ]
									then
										echo $timestamp: "Task : Boiling Kettle" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 27 ]
									then
										echo $timestamp: "Task : Scanning" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								elif  [ $task = 28 ]
									then
										echo $timestamp: "Task : Private Time" >> Master_Task_Log.txt
										grab_last_line_task_only
										duration
								#elif  [ $task = 29 ]
									#then
										#echo $timestamp: "Task : Waiting" >> Master_Task_Log.txt
										#grab_last_line_task_only
										#duration
								#elif  [ $task = 30 ]
									#then
										#echo $timestamp: "Task : Walking" >> Master_Task_Log.txt
										#grab_last_line_task_only
										#duration
								#elif  [ $task = 31 ]
									#then
										#echo "Are You Boarding or Deboarding?"
										#echo "Type 1 for Boarding"
										#echo "Type 2 for Deboarding"
										#read board
										#if [ $board = 1 ]
											#then
												#echo $timestamp: "Task : Boarding Bus" >> Master_Task_Log.txt
										#grab_last_line_task_only
										#elif [ $board = 2 ]
											#then
												#echo $timestamp: "Task : Deboarding Bus" >> Master_Task_Log.txt
										#grab_last_line_task_only
										#fi
										#duration
								else
									no_duration
								fi
						else
							no_duration
						fi
				else
					if [ "$task" != "" ]
						then
							echo $timestamp: "Task :" $task >> Master_Task_Log.txt
							grab_last_line_task_only
							duration
					else
							no_duration
					fi
				fi
		elif [ $logType = 2 ]
			then
				clear
				generate_time_stamp
				echo "********************************"
				echo "You Have Selected Option 2."
				echo "The Current Time Is: "$timestamp
				echo "What Are You Currently Listening To?"
				echo "Type 111 for Interviews"
				echo "Type 222 for Random"
				echo "********************************"
				music_history
				read music
				music_history_choice
				trim=$music
				leading_space_trim
				music=$trim
				title=$music
				TitleCaseConverter
				music=$title
				generate_time_stamp
				if [ $music = 111 ]
					then
						music="Interviews"
				fi
				if [ $music = 222 ]
					then
						music="Random Music"
				fi
				if [ "$music" != "" ]
					then
						echo $timestamp: "Album :" $music >> Master_Task_Log.txt
						# Record to current music file
						rm current_music.txt
						touch current_music.txt
						echo $music >> current_music.txt
						# Add to last ten albums
						rm current_music_temp.txt
						touch current_music_temp.txt
						echo $music >> current_music_temp.txt
						counter=1
						while read p; do
							echo $p
							if [ $counter = 20 ]
								then
									echo "Skip This!"
							break
						fi
						echo $p >> current_music_temp.txt
						counter=$((counter+1))
						done <music_history.txt
						rm music_history.txt
						cp current_music_temp.txt music_history.txt
						rm current_music_temp.txt
						no_duration
				fi
		elif [ $logType = 3 ]
			then
				clear
				generate_time_stamp
				echo "********************************"
				echo "You Have Selected Option 3."
				echo "The Current Time Is: "$timestamp
				echo "What Are You Currently Watching?"
				echo "Type 111 for Youtube"
				echo "Type 222 for Twitch"
				echo "********************************"
				film_history
				read film
				film_history_choice
				trim=$film
				leading_space_trim
				film=$trim
				title=$film
				TitleCaseConverter
				film=$title
				generate_time_stamp
				if [ $film = 111 ]
					then
						film="Youtube"
				elif [ $film = 222 ]
					then
						film="Twitch"
				fi
				if [ "$film" != "" ]
					then
						echo $timestamp: "TV/Movie :" $film >> Master_Task_Log.txt
						no_duration
						# Record to current film file
						rm current_film.txt
						touch current_film.txt
						echo $film >> current_film.txt
						# Add to last ten films
						rm current_film_temp.txt
						touch current_film_temp.txt
						echo $film >> current_film_temp.txt
						counter=1
						while read p; do
							echo $p
							if [ $counter = 20 ]
								then
									echo "Skip This!"
									break
							fi
							echo $p >> current_film_temp.txt
							counter=$((counter+1))
						done <film_history.txt
						rm music_film.txt
						cp current_film_temp.txt film_history.txt
						rm current_film_temp.txt
						no_duration
				fi
		elif [ $logType = 4 ]
			then
				clear
				generate_time_stamp
				echo "********************************"
				echo "You Have Selected Option 4."
				echo "The Current Time Is: "$timestamp
				echo "Which Station Are Listening To?"
				echo ""
				echo "Type 1 for Submenu"
				echo "********************************"
				read radio
				trim=$radio
				leading_space_trim
				radio=$trim
				title=$radio
				TitleCaseConverter
				radio=$title
				generate_time_stamp
				no_duration
				if [ "$radio" = 1 ]
					then
						echo "********************************"
						echo "You Have Selected Option 1 for the Submenu."
						echo "The Current Time Is: "$timestamp
						echo "Which Station Are Listening To?"
						echo ""
						echo "Type 1 for Xs Manchester"
						echo "Type 2 for Radio X"
						echo "Type 3 for Bbc Radio 4"
						echo "********************************"
						read radio
						generate_time_stamp
						if [ $radio = 1 ]
							then
								echo $timestamp: "Radio Station : XS Manchester" >> Master_Task_Log.txt
								no_duration
						elif [ $radio = 2 ]
							then
								echo $timestamp: "Radio Station : Radio X" >> Master_Task_Log.txt
								no_duration
						elif [ $radio = 3 ]
							then
								echo $timestamp: "Radio Station : BBC Radio 4" >> Master_Task_Log.txt
								no_duration
						else
							no_duration
						fi
				else
					if [ "$radio" != "" ]
						then
							echo $timestamp: "Radio Station :" $radio >> Master_Task_Log.txt
							no_duration
					fi
				fi
		elif [ $logType = 5 ]
			then
				clear
				generate_time_stamp
				echo "********************************"
				echo "You Have Selected Option 5."
				echo ""
				echo "The Current Time Is: "$timestamp
				echo ""
				echo "What Are You Currently Thinking About?"
				echo "********************************"
				read idea
				trim=$idea
				leading_space_trim
				idea=$trim
				title=$idea
				TitleCaseConverter
				idea=$title
				generate_time_stamp
				if [ "$idea" != "" ]
					then
						echo $timestamp: "Thoughts/Ideas :" $idea >> Master_Task_Log.txt
				fi
				no_duration
		elif [ $logType = 6 ]
			then
				clear
				echo "********************************"
				echo "You Have Selected Option 6."
				echo "Welcome to the Underwear Tracker!"
				echo ""
				echo "What Underwear Are You Checking out Today?"
				echo "Type a Number or Type Reset"
				echo "********************************"
				echo ""
				boxer=$(sed -n '1p' underwear.txt)
				socks=$(sed -n '2p' underwear.txt)
				echo "Boxers Count: " $boxer
				echo "Socks Count: " $socks
				if [ $boxer -lt 5 ]
					then
						echo "********************************"
						echo "NOTE: YOU NEED TO WASH YOUR UNDERWEAR SOON!"
						echo "********************************"
				fi
				read underwear
				trim=$underwear
				leading_space_trim
				underwear=$trim
				if [ $underwear != "" ]
					then
						if [ $underwear = 1 ]
							then
								result1=$((boxer-1))
								result2=$((socks-1))
								rm underwear.txt
								echo $result1 > underwear.txt
								echo $result2 >> underwear.txt
								generate_time_stamp
								echo $timestamp: "Under Tracker : 1 x Boxers & Socks" >> Master_Task_Log.txt
								no_duration
						elif [ $underwear = "reset" ]
							then
								rm underwear.txt
								echo "********************************"
								echo "Please Enter Your Boxer Shorts Count"
								echo "********************************"
								read boxer
								trim=$boxer
								leading_space_trim
								boxer=$trim
								echo "********************************"
								echo "Please Enter Your Socks Count"
								echo "********************************"
								read socks
								trim=$socks
								leading_space_trim
								socks=$trim
								echo $boxer > underwear.txt
								echo $socks >> underwear.txt
								echo $timestamp: "Reset : Reset Underwear Tracker" >> Master_Task_Log.txt
								no_duration
						else
							echo "Nothing Logged."
							no_duration
						fi
				else
					echo "Nothing Logged."
					no_duration
				fi
		elif [ $logType = 7 ]
			then
				clear
				echo "********************************"
				echo "You Have Selected Option 7."
				echo "Welcome to the Water Tracker!"
				echo ""
				echo "Grabbing Data..."
				water=$(sed -n '1p' water.txt)
				dailyquota=$(sed -n '1p' waterquota.txt)
				if [ $water = 0 ]
					then
						echo "You've Drunk " $water " Glasses of Water Today. Drink Some Water!"
				elif [ $water = 1 ]
					then
						echo "You've Drunk " $water " Glass of Water Today. Good Job!"
				else
					echo "You've Drunk " $water " Glasses of Water Today. Good Job!"
				fi
				dailyamount=$(sed -n '1p' water_measure.txt)
				echo "You've consumed: "$dailyamount"ml / "$dailyquota"ml"
				# Water log
				echo "Water Log;"
				while read p; do
					echo $p
				done <water_log.txt
				echo "How Many Glasses Did You Drink?"
				echo "Type a Number or Type Reset"
				echo "Type 2 for Default"
				echo "Type 3 to Change Default Cup"
				echo "Type 4 to Change Daily Quota"
				echo "********************************"
				read waterintake
				trim=$waterintake
				leading_space_trim
				waterintake=$trim
				generate_time_stamp
				if [ $waterintake != "" ]
					then
						if [ $waterintake = 1 ]
							then
								clear
								echo "********************************"
								echo "How Many Millilitres Did You Drink?"
								echo "********************************"
								read measure
								result=$((water+1))
								echo $timestamp: "Water Glass # :" $result "/ 5 - "$measure"ml" >> Master_Task_Log.txt
								echo $timestamp: $result "/ 5 - "$measure"ml" >> water_log.txt
								rm water.txt
								echo $result > water.txt
								dailyamount=$(sed -n '1p' water_measure.txt)
								total=$((measure+$dailyamount))
								rm water_measure.txt
								echo $total > water_measure.txt
								no_duration
						elif [ $waterintake = "reset" ]
							then
								rm water.txt
								echo 0 > water.txt
								echo $timestamp: "Reset : Reset Water Tracker" >> Master_Task_Log.txt
								no_duration
						elif [ $waterintake = 2 ]
							then
								measure=$(sed -n '1p' water_default.txt)
								result=$((water+1))
								echo $timestamp: "Water Glass # :" $result "/ 5 - "$measure"ml" >> Master_Task_Log.txt
								echo $timestamp: $result "/ 5 - "$measure"ml" >> water_log.txt
								rm water.txt
								echo $result > water.txt
								dailyamount=$(sed -n '1p' water_measure.txt)
								total=$((measure+$dailyamount))
								rm water_measure.txt
								echo $total > water_measure.txt
								no_duration
						elif [ $waterintake = 3 ]
							then
								rm water_default.txt
								touch water_default.txt
								echo "********************************"
								echo "Please Enter An Amount (in ml)."
								echo "********************************"
								read waterdefault
								echo $waterdefault >> water_default.txt
						elif [ $waterintake = 4 ]
							then
								rm waterquota.txt
								touch waterquota.txt
								echo "********************************"
								echo "Please Enter An Amount (in ml)."
								echo "********************************"
								read waterdefault
								echo $waterdefault >> waterquota.txt
						else
							echo "Nothing Logged."
							no_duration
						fi
				else
					echo "Nothing Logged."
					no_duration
				fi
		elif [ $logType = 8 ]
			then
				clear
				echo "This Function Is Currently Not Working. Proceed with Caution."
				# total=0
				# one=0
				# two=0
				# three=0
				# four=0
				# five=0
				# six=0
				# seven=0
				# eight=0
				# nine=0
				# ten=0
				# rm random.txt
				# while [ $total -lt 54 ]
					# do
						# echo $total
				    	# r=$(( $RANDOM % 11 ));
						# echo $r
						# if [ $r = 1 ]
							# then
								# if [ $one = 0 ]
									# then
										# total=$((total+1]
										# echo $r >> random.txt
										# one=1
								# fi
						# elif [ $r = 2 ]
							# then
								# if [ $two = 0 ]
									# then
										# total=$((total+2]
										# echo $r >> random.txt
										# two=1
								# fi
						# elif [ $r = 3 ]
							# then
								# if [ $three = 0 ]
									# then
										# total=$((total+3]
										# echo $r >> random.txt
										# three=1
								# fi
						# elif [ $r = 4 ]
							# then
								# if [ $four = 0 ]
									# then
										# total=$((total+4]
										# echo $r >> random.txt
										# four=1
								# fi
						# elif [ $r = 5 ]
							# then
								# if [ $five = 0 ]
									# then
										# total=$((total+5]
										# echo $r >> random.txt
										# five=1
								# fi
						# elif [ $r = 6 ]
							# then
								# if [ $six = 0 ]
									# then
										# total=$((total+6]
										# echo $r >> random.txt
										# six=1
								# fi
						# elif [ $r = 7 ]
							# then
								# if [ $seven = 0 ]
									# then
										# total=$((total+7]
										# echo $r >> random.txt
										# seven=1
								# fi
						# elif [ $r = 8 ]
							# then
							# if [ $eight = 0 ]
									# then
										# total=$((total+8]
										# echo $r >> random.txt
										# eight=1
								# fi
						# elif [ $r = 9 ]
							# then
							# if [ $nine = 0 ]
									# then
										# total=$((total+9]
										# echo $r >> random.txt
										# nine=1
								# fi
						# elif [ $r = 10 ]
							# then
								# if [ $ten = 0 ]
									# then
										# total=$((total+10]
										# echo $r >> random.txt
										# ten=1
								# fi
						# else
							# echo ""
						# fi
					# done
					# #rm -f /sdcard/music/alarm/*
					# counter=1
					# ls /sdcard/music/tmp |sort -r |tail -25 |while read file; do
						# $number=$(sed -n '$counter p' random.txt)
						# #cp /sdcard/music/tmp/$file /sdcard/music/alarm/$number.mp3
					# done
		elif [ $logType = 9 ]
			then
				clear
				counter=1
				countertwo=1
				echo "********************************"
				echo "You Have Selected Option 9."
				echo "Welcome to the To-Do List Tracker!"
				echo ""
				echo "Here Are Your Current To-Do Tasks"
				echo "********** To-Do List **********"
				last_line=$( tail -n 1 todo.txt )
				# Output the last line but only the task part
				counter=$(echo $last_line | cut -d "-" -f 1)
				while read p; do
				echo $p
				countertwo=$((countertwo+1))
				done <todo.txt
				echo "********************************"
				echo "Total Tasks: "$countertwo
				echo "Please Enter a New Item to Add to the List"
				echo "Type 1 for Remove"
				echo "Type 2 for Reset"
				echo "********************************"
				read todo
				trim=$todo
				leading_space_trim
				todo=$trim
				title=$todo
				TitleCaseConverter
				todo=$title
				generate_time_stamp
				if [ $todo = 2 ]
					then
						clear
						echo "********************************"
						echo "Are You Sure You Want To Reset?"
						echo "Type Reset Below To Confirm"
						echo "********************************"
						read reset
						if [ $reset = "reset" ]
							then
								rm todo.txt
								touch todo.txt
								echo $timestamp: "Reset : Reset Todo List" >> Master_Task_Log.txt
							fi
						no_duration
				elif [ $todo = 1 ]
					then
						echo "********************************"
						echo "Which Item Would You like to Remove?"
						echo "********************************"
						read item
						trim=$item
						leading_space_trim
						item=$trim
						counter=1
						while read p; do
						echo $p
						found=$(echo $p | cut -d "-" -f 1)
						if [ $found -eq $item ]
							then
							task=$p
							echo "Line "$p" = Found "$counter
							echo =$(sed -e "$counter"d todo.txt >> todotemp.txt)
							rm todo.txt
							cp todotemp.txt todo.txt
							rm todotemp.txt
							break
						fi
						counter=$((counter+1))
						done <todo.txt
						echo $timestamp: "Task Completed :" $task >> Master_Task_Log.txt
						no_duration
				else
					if [ "$todo" != "" ]
						then
							counter=$((counter+1))
							echo $counter"-"$todo >> todo.txt
							echo $timestamp: "New ToDo :" $todo >> Master_Task_Log.txt
							no_duration
					else
						no_duration
					fi
				fi
		elif [ $logType = 10 ]
			then
				clear
				echo "********************************"
				echo "You Have Selected Option 10."
				echo "Welcome to Meal Tracker!"
				echo ""
				echo "Please Type a Meal You Ate"
				echo ""
				echo "Type 1 for Common Meals"
				echo "********************************"
				read meal
				trim=$meal
				leading_space_trim
				meal=$trim
				if [ $meal = 1 ]
					then
						echo "********************************"
						echo "Thank You. Please Select From The Below."
						echo "1 for Beans on Toast"
						echo "2 for Cereal"
						echo "3 for Takeaway"
						echo "4 for Huel"
						echo "5 for Snack"
						echo "6 for Lunch"
						echo "7 for Dinner"
						echo "8 for Breakfast"
						echo "********************************"
						read meal
						trim=$meal
						leading_space_trim
						meal=$trim
						generate_time_stamp
						if [ $meal = 1 ]
							then
							meal="Beans On Toast"
							echo $timestamp: "Food : Beans On Toast" >> Master_Task_Log.txt
							no_duration
						elif [ $meal = 2 ]
							then
								clear
								echo "********************************"
								echo "What Cereal Was It?"
								echo "********************************"
								read meal
								calorie_tracker
								trim=$meal
								leading_space_trim
								meal=$trim
								title=$meal
								TitleCaseConverter
								meal=$title
								clear
								echo "********************************"
								echo "How Much Milk Did You Have? (in ml)"
								echo "********************************"
								read milkamount
								dailyamount=$(sed -n '1p' water_measure.txt)
								total=$((milkamount+$dailyamount))
								rm water_measure.txt
								echo $total > water_measure.txt
								echo $timestamp: "Cereal :" $meal" with "$milkamount"ml of Milk" >> Master_Task_Log.txt
								calorieintake=$((calorieintakeone+calorieintaketwo+calorieintakethree+calorieintakefour+calorieintakefive))
								echo $timestamp: "Calories :" $calorieintake >> Master_Task_Log.txt
								calorieintake
								no_duration
						elif [ $meal = 3 ]
							then
								clear
								echo "********************************"
								echo "What Takeaway Was It?"
								echo "********************************"
								meal_history
								read meal
								calorie_tracker
								meal_history_choice
								trim=$meal
								leading_space_trim
								meal=$trim
								title=$meal
								TitleCaseConverter
								meal=$title
								echo $timestamp: "Takeaway :" $meal >> Master_Task_Log.txt
								calorieintake=$((calorieintakeone+calorieintaketwo+calorieintakethree+calorieintakefour+calorieintakefive))
								echo $timestamp: "Calories :" $calorieintake >> Master_Task_Log.txt
								no_duration
						elif [ $meal = 4 ]
							then
								meal="Huel"
								calorie_tracker
								echo $timestamp: "Food : Huel" >> Master_Task_Log.txt
								calorieintake=$((calorieintakeone+calorieintaketwo+calorieintakethree+calorieintakefour+calorieintakefive))
								echo $timestamp: "Calories :" $calorieintake >> Master_Task_Log.txt
								no_duration
						elif [ $meal = 5 ]
							then
								clear
								echo "********************************"
								echo "What Snack Was It?"
								echo "********************************"
								meal_history
								read meal
								calorie_tracker
								meal_history_choice
								trim=$meal
								leading_space_trim
								meal=$trim
								title=$meal
								TitleCaseConverter
								meal=$title
								echo $timestamp: "Snack :" $meal >> Master_Task_Log.txt
								calorieintake=$((calorieintakeone+calorieintaketwo+calorieintakethree+calorieintakefour+calorieintakefive))
								echo $timestamp: "Calories :" $calorieintake >> Master_Task_Log.txt
								no_duration
						elif [ $meal = 6 ]
							then
								clear
								echo "********************************"
								echo "What Was For Lunch?"
								echo "********************************"
								meal_history
								read meal
								calorie_tracker
								meal_history_choice
								trim=$meal
								leading_space_trim
								meal=$trim
								title=$meal
								TitleCaseConverter
								meal=$title
								echo $timestamp: "Lunch :" $meal >> Master_Task_Log.txt
								calorieintake=$((calorieintakeone+calorieintaketwo+calorieintakethree+calorieintakefour+calorieintakefive))
								echo $timestamp: "Calories :" $calorieintake >> Master_Task_Log.txt
								no_duration
						elif [ $meal = 7 ]
							then
								clear
								echo "********************************"
								echo "What Was For Dinner?"
								echo "********************************"
								meal_history
								read meal
								calorie_tracker
								meal_history_choice
								trim=$meal
								leading_space_trim
								meal=$trim
								title=$meal
								TitleCaseConverter
								meal=$title
								echo $timestamp: "Dinner :" $meal >> Master_Task_Log.txt
								calorieintake=$((calorieintakeone+calorieintaketwo+calorieintakethree+calorieintakefour+calorieintakefive))
								echo $timestamp: "Calories :" $calorieintake >> Master_Task_Log.txt
								no_duration
						elif [ $meal = 8 ]
							then
								clear
								echo "********************************"
								echo "What Was For Breakfast?"
								echo "********************************"
								read meal
								calorie_tracker
								trim=$meal
								leading_space_trim
								meal=$trim
								title=$meal
								TitleCaseConverter
								meal=$title
								echo $timestamp: "Breakfast :" $meal >> Master_Task_Log.txt
								calorieintake=$((calorieintakeone+calorieintaketwo+calorieintakethree+calorieintakefour+calorieintakefive))
								echo $timestamp: "Calories :" $calorieintake >> Master_Task_Log.txt
								no_duration
						else
							no_duration
						fi
						# Record to current meal file
						rm current_meal.txt
						touch current_meal.txt
						echo $meal >> current_meal.txt
						# Add to last ten meals
						rm meal_history_temp.txt
						touch meal_history_temp.txt
						echo $meal >> meal_history_temp.txt
						counter=1
						while read p; do
							echo $p
							if [ $counter = 20 ]
								then
									echo "Skip This!"
									break
							fi
							echo $p >> meal_history_temp.txt
							counter=$((counter+1))
						done <meal_history.txt
						rm meal_history.txt
						cp meal_history_temp.txt meal_history.txt
						rm meal_history_temp.txt
				else
					if [ $meal != "" ]
						then
						generate_time_stamp
						echo $timestamp: "Food :" $meal >> Master_Task_Log.txt
						no_duration
					fi
				fi
		elif [ $logType = 11 ]
			then
				clear
				echo "********************************"
				echo "You Have Selected Option 11."
				echo "Welcome To Output Manager!"
				echo ""
				echo "What Would You Like To Do?"
				echo ""
				echo "Type 111 for Last 10 Tasks"
				echo "Type 1 To Cat Master Log"
				echo "Type 2 For Detailed Master Log"
				echo "Type 3 To Search Master Log"
				echo "Type 4 To Make A Backup"
				echo "Type 5 To Cat Task Type Log"
				echo "********************************"
				read opt
				trim=$opt
				leading_space_trim
				opt=$trim
				clear
				echo "********************************"
				echo "Which file would you like to use?"
				echo "Type 1 for Current"
				echo "Type 2 for Archive"
				echo "Type 3 for Archive 2"
				echo "********************************"
				read file
				trim=$file
				leading_space_trim
				file=$trim
				if [ $file = 1 ]
					then
						filename="Master_Task_Log.txt"
				elif [ $file = 2 ]
					then
						filename="Master_Task_Log_Archive.txt"
				elif [ $file = 3 ]
					then
						filename="Master_Task_Log_Archive_2.txt"
				fi
				if [ $opt = 1 ]
				    then
				        cat $filename
						echo "********************************"
				        echo "Press the Return Key to Confirm Exit."
						echo "********************************"
				        read exiting
				        no_duration
				elif [ $opt = 2 ]
				    then
				        more $filename
				        no_duration
				elif [ $opt = 3 ]
				    then
						clear
						echo "********************************"
				        echo "Please Enter A Search Term Below"
						echo "********************************"
				        read term
				        grep -iR -n "$term" $filename
				        read stop
                        no_duration
			   elif [ $opt = 4 ]
			        then
			            generate_time_stamp
						echo "********************************"
				        echo "Backing Files Up..."
						echo "********************************"
			            cp $filename Master_Task_Log_"$timestamp".txt
						cp shopping.txt shopping_"$timestamp".txt
						cp todo.txt todo_"$timestamp".txt
						# Schedule files
						cp schedulemon.txt schedulemon_"$timestamp".txt
						cp scheduletue.txt scheduletue_"$timestamp".txt
						cp schedulewed.txt schedulewed_"$timestamp".txt
						cp schedulethu.txt schedulethu_"$timestamp".txt
						cp schedulefri.txt schedulefri_"$timestamp".txt
						cp schedulesat.txt schedulesat_"$timestamp".txt
						cp schedulesun.txt schedulesun_"$timestamp".txt
						# Backup task type log
						cp task_type_log.txt task_type_log_"$timestamp".txt
			            no_duration
			   elif [ $opt = 111 ]
					then
						output=$(tail -n 10 Master_Task_Log.txt)
						echo $output
						echo "********************************"
						echo "Type Anything To Quit."
						echo "********************************"
						read stop
				elif [ $opt = 5 ]
				    then
				        cat task_type_log.txt
						echo "********************************"
				        echo "Press the Return Key to Confirm Exit."
						echo "********************************"
				        read exiting
				        no_duration
			   else
			        no_duration
			   fi
		elif [ $logType = 12 ]
			then
				clear
				generate_time_stamp
				hour_now=$(date +"%H")
				hour_string=$(echo $hour_now | sed 's/^0*//')
				minute=$(date +"%M")
				echo "********************************"
				echo "You Have Selected Option 12."
				echo "Welcome to Sleep Tracker!"
				echo ""
				echo "Type 1 to Go to Sleep"
				echo "Type 2 to Wake Up"
				echo "Type 3 for Alarm Time Generator"
				echo "********************************"
				read sleep
				trim=$sleep
				leading_space_trim
				sleep=$trim
				if [ $sleep = 1 ]
					then
						epoch=$(date +%s)
						rm sleepstart.txt
						touch sleepstart.txt
						echo $epoch > sleepstart.txt
						echo $timestamp: "Sleep : Going To Sleep" >> Master_Task_Log.txt
						duration
				elif [ $sleep = 2 ]
					then
						epoch=$(date +%s)
						sleepstop=$(sed -n 1p sleepstart.txt)
						sleepstop=$(($epoch-$sleepstop))
						secs=$sleepstop
						sleep_duration=$(printf '%dh:%dm:%ds\n' $(($secs/3600)) $(($secs%3600/60)) $(($secs%60)))
						echo $timestamp: "Sleep : Woke Up : "$sleep_duration >> Master_Task_Log.txt
						no_duration
				elif [ $sleep = 3 ]
					then
						# Get current time
						epoch=$(date +%s)
						epoch=$((epoch+4500-3600))
						# Add one hour
						clear
						echo "********************************"
						echo "How Many Hours Do You Want to Sleep?"
						echo "********************************"
						read hour
						trim=$hour
						leading_space_trim
						hour=$trim
						if [ $hour = 1 ]
							then
								epoch=$((epoch+3600))
								alarm_time_generator
								no_duration
						elif [ $hour = 2 ]
							then
								epoch=$((epoch+7200))
								alarm_time_generator
								no_duration
						elif [ $hour = 3 ]
							then
								epoch=$((epoch+10800))
								alarm_time_generator
								no_duration
						elif [ $hour = 4 ]
							then
								epoch=$((epoch+14400))
								alarm_time_generator
								no_duration
						elif [ $hour = 5 ]
							then
								epoch=$((epoch+18000))
								alarm_time_generator
								no_duration
						elif [ $hour = 6 ]
							then
								epoch=$((epoch+21600))
								alarm_time_generator
								no_duration
						elif [ $hour = 7 ]
							then
								epoch=$((epoch+25200))
								alarm_time_generator
								no_duration
						elif [ $hour = 8 ]
							then
								epoch=$((epoch+28800))
								alarm_time_generator
								no_duration
						elif [ $hour = 9 ]
							then
								epoch=$((epoch+32400))
								alarm_time_generator
								no_duration
						elif [ $hour = 10 ]
							then
								epoch=$((epoch+36000))
								alarm_time_generator
								no_duration
						elif [ $hour = 11 ]
							then
								epoch=$((epoch+39600))
								alarm_time_generator
								no_duration
						else
							no_duration
						fi
						read end
				else
					no_duration
				fi
		elif [ $logType = 13 ]
			then
				clear
				counter=1
				echo "********************************"
				echo "You Have Selected Option 13."
				echo "Welcome to the Shopping List Tracker!"
				echo ""
				echo "Here Is Your Shopping List"
				echo "********** Shopping List **********"
				last_line=$( tail -n 1 shopping.txt )
				# Output the last line but only the task part
				counter=$(echo $last_line | cut -d "-" -f 1)
				while read p; do
				echo $p
				done <shopping.txt
				echo "********************************"
				echo "Please Enter a New Item to Add to the List"
				echo ""
				echo "Type 1 for Remove"
				echo "Type 2 for Reset"
				echo "Type 3 for Default Weekly Shop (Retired)"
				echo "********************************"
				read shopping
				trim=$shopping
				leading_space_trim
				shopping=$trim
				title=$shopping
				TitleCaseConverter
				shopping=$title
				generate_time_stamp
				if [ $shopping = 2 ]
					then
						clear
						echo "********************************"
						echo "Are You Sure You Want To Reset?"
						echo "Type Reset Below To Confirm"
						echo "********************************"
						read reset
						if [ $reset = "reset" ]
							then
							echo "Resetting...Not Recoverable!"
							rm shopping.txt
							touch shopping.txt
							echo $timestamp: "Reset : Reset Shopping List" >> Master_Task_Log.txt
						fi
						no_duration
				elif [ $shopping = 1 ]
					then
						echo "********************************"
						echo "Which Item Would You like to Remove?"
						echo "********************************"
						read item
						trim=$item
						leading_space_trim
						item=$trim
						counter=1
						while read p; do
						echo $p
						found=$(echo $p | cut -d "-" -f 1)
						if [ $found -eq $item ]
							then
							echo "Line "$p" = Found "$counter
							shop=$(sed -n "$counter"p shopping.txt)
							generate_time_stamp
							echo $timestamp: "Shopping Item Removed :" $shop >> Master_Task_Log.txt
							echo =$(sed -e "$counter"d shopping.txt >> shoppingtemp.txt)
							rm shopping.txt
							cp shoppingtemp.txt shopping.txt
							rm shoppingtemp.txt
							break
						fi
						counter=$((counter+1))
						done <shopping.txt
						no_duration
				elif [ $shopping = 3 ]
					then
						#counter=$((counter+1]
						#shopping="2 x Boxes of Fish Fillets"
						#echo $counter"-"$shopping >> shopping.txt
						#generate_time_stamp
						#echo $timestamp: "New Shopping List Item : "$shopping  >> Master_Task_Log.txt
						#counter=$((counter+1]
						#shopping="2 x Bags of Frozen Chips"
						#echo $counter"-"$shopping >> shopping.txt
						#generate_time_stamp
						#echo $timestamp: "New Shopping List Item : "$shopping  >> Master_Task_Log.txt
						#counter=$((counter+1]
						#shopping="3 x Boxes of Instant Mash"
						#echo $counter"-"$shopping >> shopping.txt
						#generate_time_stamp
						#echo $timestamp: "New Shopping List Item : "$shopping  >> Master_Task_Log.txt
						#counter=$((counter+1]
						#shopping="7 x Cans of Peas"
						#echo $counter"-"$shopping >> shopping.txt
						#generate_time_stamp
						#echo $timestamp: "New Shopping List Item : "$shopping  >> Master_Task_Log.txt
						#counter=$((counter+1]
						#shopping="7 x Cans of Meatballs"
						#echo $counter"-"$shopping >> shopping.txt
						#generate_time_stamp
						#echo $timestamp: "New Shopping List Item : "$shopping  >> Master_Task_Log.txt
						#counter=$((counter+1]
						#shopping="1 x Bottle of Ketchup"
						#echo $counter"-"$shopping >> shopping.txt
						#generate_time_stamp
						#echo $timestamp: "New Shopping List Item : "$shopping  >> Master_Task_Log.txt
						#counter=$((counter+1]
						#shopping="2 x Bags of Multipack Crisps"
						#echo $counter"-"$shopping >> shopping.txt
						#generate_time_stamp
						#echo $timestamp: "New Shopping List Item : "$shopping  >> Master_Task_Log.txt
						no_duration
				else
						if [ "$shopping" != "" ]
							then
								counter=$((counter+1))
								echo $counter"-"$shopping >> shopping.txt
								generate_time_stamp
								echo $timestamp: "New Shopping List Item :" $shopping >> Master_Task_Log.txt
								no_duration
						else
							no_duration
						fi
				fi
		elif [ $logType = 14 ]
			then
				clear
				echo "********************************"
				echo "Are You Sure You Want To Reset?"
				echo "Type Reset Below To Confirm"
				echo "********************************"
				read reset
				if [ $reset = "reset" ]
					then
					generate_time_stamp
					echo $timestamp: "Previous Day Task Count :" $taskcount >> Master_Task_Log.txt
					rm taskcount.txt
					touch taskcount.txt
					newday=$(date +%u)
					rm day.txt
					echo $newday >> day.txt
					rm morning_routine.txt
					touch morning_routine.txt
					rm evening_routine.txt
					touch evening_routine.txt
					rm weekend_routine.txt
					touch weekend_routine.txt
					rm task_count_am.txt
					touch task_count_am.txt
					echo 0 > task_count_am.txt
					rm task_count_pm.txt
					touch task_count_pm.txt
					echo 0 > task_count_pm.txt
					rm task_count_we.txt
					touch task_count_we.txt
					toilet=$(sed -n '1p' toilet.txt)
					echo $timestamp: "Previous Day's Toilet Breaks : "$toilet >> Master_Task_Log.txt
					rm toilet.txt
					touch toilet.txt
					echo 0 > toilet.txt
					rm water.txt
					echo 0 > water.txt
					rm waterquota.txt
					echo 2000 > waterquota.txt
					rm caloriequota.txt
					echo 2000 > caloriequota.txt
					rm selfcarecount.txt
					echo 0 > selfcarecount.txt
					selfcarecount=$(sed -n '1p' selfcarecount.txt)
					echo $timestamp: "Previous Day's Self Care Routines : "$selfcarecount >> Master_Task_Log.txt
					dailyamount=$(sed -n '1p' water_measure.txt)
					echo $timestamp: "Previous Day's Liquid Intake : "$dailyamount >> Master_Task_Log.txt
					rm water_measure.txt
					echo 0 > water_measure.txt
					rm water_log.txt
					touch water_log.txt
					echo $timestamp: "Reset : Reset Water Tracker" >> Master_Task_Log.txt
					rm schedule.txt
					touch schedule.txt
					cals=$(sed -n '1p' dailycal.txt)
					echo $timestamp: "Previous Day's Calorie Intake : "$cals >> Master_Task_Log.txt
					rm dailycal.txt
					touch dailycal.txt
					echo 0 > dailycal.txt
					# Routine Progres
					# Morning
					amprogress=$(sed -n '1p' amprogress.txt)
					echo $timestamp: "Previous Day's Morning Routine Progress % : "$amprogress >> Master_Task_Log.txt
					rm amprogress.txt
					touch amprogress.txt
					echo 0 >> amprogress.txt
					# Evening
					pmprogress=$(sed -n '1p' pmprogress.txt)
					echo $timestamp: "Previous Day's Evening Routine Progress % : "$pmprogress >> Master_Task_Log.txt
					rm pmprogress.txt
					touch pmprogress.txt
					echo 0 >> pmprogress.txt
					echo "1-Empty-00:00" >> schedule.txt
					echo "2-Empty-00:30" >> schedule.txt
					echo "3-Empty-01:00" >> schedule.txt
					echo "4-Empty-01:30" >> schedule.txt
					echo "5-Empty-02:00" >> schedule.txt
					echo "6-Empty-02:30" >> schedule.txt
					echo "7-Empty-03:00" >> schedule.txt
					echo "8-Empty-03:30" >> schedule.txt
					echo "9-Empty-04:00" >> schedule.txt
					echo "10-Empty-04:30" >> schedule.txt
					echo "11-Empty-05:00" >> schedule.txt
					echo "12-Empty-05:30" >> schedule.txt
					echo "13-Empty-06:00" >> schedule.txt
					echo "14-Empty-06:30" >> schedule.txt
					echo "15-Empty-07:00" >> schedule.txt
					echo "16-Empty-07:30" >> schedule.txt
					echo "17-Empty-08:00" >> schedule.txt
					echo "18-Empty-08:30" >> schedule.txt
					echo "19-Empty-09:00" >> schedule.txt
					echo "20-Empty-09:30" >> schedule.txt
					echo "21-Empty-10:00" >> schedule.txt
					echo "22-Empty-10:30" >> schedule.txt
					echo "23-Empty-11:00" >> schedule.txt
					echo "24-Empty-11:30" >> schedule.txt
					echo "25-Empty-12:00" >> schedule.txt
					echo "26-Empty-12:30" >> schedule.txt
					echo "27-Empty-13:00" >> schedule.txt
					echo "28-Empty-13:30" >> schedule.txt
					echo "29-Empty-14:00" >> schedule.txt
					echo "30-Empty-14:30" >> schedule.txt
					echo "31-Empty-15:00" >> schedule.txt
					echo "32-Empty-15:30" >> schedule.txt
					echo "33-Empty-16:00" >> schedule.txt
					echo "34-Empty-16:30" >> schedule.txt
					echo "35-Empty-17:00" >> schedule.txt
					echo "36-Empty-17:30" >> schedule.txt
					echo "37-Empty-18:00" >> schedule.txt
					echo "38-Empty-18:30" >> schedule.txt
					echo "39-Empty-19:00" >> schedule.txt
					echo "40-Empty-19:30" >> schedule.txt
					echo "41-Empty-20:00" >> schedule.txt
					echo "42-Empty-20:30" >> schedule.txt
					echo "43-Empty-21:00" >> schedule.txt
					echo "44-Empty-21:30" >> schedule.txt
					echo "45-Empty-22:00" >> schedule.txt
					echo "46-Empty-22:30" >> schedule.txt
					echo "47-Empty-23:00" >> schedule.txt
					echo "48-Empty-23:30" >> schedule.txt
					rm mornlist.txt
					touch mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					echo "0" >> mornlist.txt
					rm evelist.txt
					touch evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					echo "0" >> evelist.txt
					rm welist.txt
					touch welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					echo "0" >> welist.txt
					rm timeleft.txt
					touch timeleft.txt
					echo "102" >> timeleft.txt
					rm timelefteve.txt
					touch timelefteve.txt
					echo "113" >> timelefteve.txt
					rm timeleftwe.txt
					touch timeleftwe.txt
					echo "130" >> timeleftwe.txt
					rm weekendtotal.txt
					touch weekendtotal.txt
					echo "0" >> weekendtotal.txt
					no_duration
				fi
		elif [ $logType = 15 ]
			then
				clear
				count=$(wc -l < albums.txt)
				count=$(echo $count | xargs)
				r=$((RANDOM % count));
				echo "You Have Selected Option 15."
				echo "Welcome To The Music Randomizer!"
				echo ""
				echo "********************************"
				echo "Random Number Generated = "$r
				echo "********************************"
				echo "Today's Random Album Is:"
				echo ""
				echo $(sed -n "$r"p albums.txt)
				echo ""
				echo "Enjoy!"
				echo "********************************"
				read end
				no_duration
		elif [ $logType = 16 ]
			then
				clear
				echo "********************************"
				echo "You Have Selected Option 16."
				echo "Welcome to the Time Logger!"
				echo ""
				echo "Type 111 for All Timers"
				echo "Type 1 to for Work Logger"
				echo "Type 2 to Blot Logger"
				echo "Type 3 for Self Care Routine Logger"
				echo "Type 4 for Eye Drop Expiry"
				echo "Type 5 for Haircut Appointment"
				echo "Type 6 for Razor Replacement"
				echo "Type 7 for Toothbrush Replacement"
				echo "Type 8 for Dehumidifier Cleaning"
				echo "Type 9 for Facial Brush"
				echo "Type 10 for Air Purifier Replacement"
				echo "Type 11 for Sponge Replacement"
				echo "Type 12 for Dentist Appointment"
				echo "Type 13 for Floss Replacement"
				echo "Type 14 for Eyebrow Appointment"
				echo "Type 15 for Towel Replacement"
				echo "Type 16 for Bedding Replacement"
				echo "********************************"
				read option
				trim=$option
				leading_space_trim
				option=$trim
				generate_time_stamp
				if [ $option = 1 ]
					then
						clear
						echo "********************************"
						echo "Welcome to the Work Time Logger"
						echo ""
						echo "Type 1 to Start Work"
						echo "Type 2 to See When Work Finishes"
						echo "********************************"
						read wlt
						trim=$wlt
						leading_space_trim
						wlt=$trim
						if [ $wlt = 1 ]
							then
								rm work_time.txt
								touch work_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> work_time.txt
								echo $timestamp: "Time Log : Started Work" >> Master_Task_Log.txt
								no_duration
						elif [ $wlt = 2 ]
							then
								clear
								start_time=$(sed -n '1p' work_time.txt)
								finish_time=$((start_time+28800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Work Time Logger"
								echo ""
								echo "You Started Work At; "
								echo ""
								echo $start
								echo ""
								echo "You Finish Work At; "
								echo ""
								echo $finish
								echo ""
								echo "Time To Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
					elif [ $option = 2 ]
					then
						clear
						echo "********************************"
						echo "Welcome to the Blot Logger"
						echo ""
						echo "Type 1 to Log a Blot Time"
						echo "Type 2 to See When Your next Blot Time Is"
						echo "********************************"
						read wlt
						trim=$wlt
						leading_space_trim
						wlt=$trim
						if [ $wlt = 1 ]
							then
								rm blot_time.txt
								touch blot_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> blot_time.txt
								echo $timestamp: "Time Log : Blotted Face" >> Master_Task_Log.txt
								no_duration
						elif [ $wlt = 2 ]
							then
								clear
								start_time=$(sed -n '1p' blot_time.txt)
								finish_time=$((start_time+3600))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Blot Time Logger"
								echo ""
								echo "You Blotted At; "
								echo ""
								echo $start
								echo ""
								echo "Your next Blot Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
					elif [ $option = 3 ]
					then
						clear
						echo "********************************"
						echo "Self Care Routine Logger"
						echo ""
						echo "Type 1 to Log Routine Time"
						echo "Type 2 to Check Next Routine"
						echo "********************************"
						read wlt
						trim=$wlt
						leading_space_trim
						wlt=$trim
						if [ $wlt = 1 ]
							then
								rm self_care_time.txt
								touch self_care_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> self_care_time.txt
								echo $timestamp: "Time Log : Self Care Routine" >> Master_Task_Log.txt
								no_duration
						elif [ $wlt = 2 ]
							then
								clear
								start_time=$(sed -n '1p' self_care_time.txt)
								finish_time=$((start_time+10800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Welcome to the Self Care Routine Logger"
								echo ""
								echo "Last Routine Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Routine Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
					elif [ $option = 4 ]
					then
						clear
						echo "********************************"
						echo "Eye Drop Expiry Logger"
						echo ""
						echo "Type 1 to Log an Expiry Time"
						echo "Type 2 to Check Expiry Time"
						echo "********************************"
						read wlt
						trim=$wlt
						leading_space_trim
						wlt=$trim
						if [ $wlt = 1 ]
							then
								rm eye_time.txt
								touch eye_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> eye_time.txt
								echo $timestamp: "Time Log : Eye Drop Opened" >> Master_Task_Log.txt
								no_duration
						elif [ $wlt = 2 ]
							then
								clear
								start_time=$(sed -n '1p' eye_time.txt)
								finish_time=$((start_time+7889238))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Eye Drop Expiry Logger"
								echo ""
								echo "Eye Drops Opened At; "
								echo ""
							    echo $start
								echo ""
								echo "Eye Drops Expire At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
					elif [ $option = 5 ]
					then
						clear
						echo "********************************"
						echo "Haircut Appointment Logger"
						echo ""
						echo "Type 1 to Log an Haircut Appointment"
						echo "Type 2 to Check Next Appointment"
						echo "********************************"
						read wlt
						trim=$wlt
						leading_space_trim
						wlt=$trim
						if [ $wlt = 1 ]
							then
								rm haircut_time.txt
								touch haircut_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> haircut_time.txt
								echo $timestamp: "Time Log : Had A Haircut" >> Master_Task_Log.txt
								no_duration
						elif [ $wlt = 2 ]
							then
								clear
								start_time=$(sed -n '1p' haircut_time.txt)
								finish_time=$((start_time+3628800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Haircut Appointment Logger"
								echo ""
								echo "Last Haircut Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Haircut Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
					elif [ $option = 6 ]
					then
						clear
						echo "********************************"
						echo "Razor Replacement Logger"
						echo ""
						echo "Type 1 to Log Replacement Time"
						echo "Type 2 to Check Replacement Time"
						echo "********************************"
						read wlt
						trim=$wlt
						leading_space_trim
						wlt=$trim
						if [ $wlt = 1 ]
							then
								rm razor_time.txt
								touch razor_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> razor_time.txt
								echo $timestamp: "Time Log : Razor Replaced" >> Master_Task_Log.txt
								no_duration
						elif [ $wlt = 2 ]
							then
								clear
								start_time=$(sed -n '1p' razor_time.txt)
								finish_time=$((start_time+3628800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Razor Replacement Logger"
								echo ""
								echo "Last Replacement Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Replacement Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
					elif [ $option = 7 ]
					then
						clear
						echo "********************************"
						echo "Toothbrush Replacement Logger"
						echo ""
						echo "Type 1 to Log Replacement Time"
						echo "Type 2 to Check Replacement Time"
						echo "********************************"
						read wlt
						trim=$wlt
						leading_space_trim
						wlt=$trim
						if [ $wlt = 1 ]
							then
								rm tooth_time.txt
								touch tooth_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> tooth_time.txt
								echo $timestamp: "Time Log : Toothbrush Replaced" >> Master_Task_Log.txt
								no_duration
						elif [ $wlt = 2 ]
							then
								clear
								start_time=$(sed -n '1p' tooth_time.txt)
								finish_time=$((start_time+7889238))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Toothbrush Replacement Logger"
								echo ""
								echo "Last Replacement Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Replacement Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
					elif [ $option = 8 ]
					then
						clear
						echo "********************************"
						echo "Dehumidifier Filter Logger"
						echo ""
						echo "Type 1 to Log Cleaning Time"
						echo "Type 2 to Check Cleaning Time"
						echo "********************************"
						read dhd
						trim=$dhd
						leading_space_trim
						dhd=$trim
						if [ $dhd = 1 ]
							then
								rm dhd_time.txt
								touch dhd_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> dhd_time.txt
								echo $timestamp: "Time Log : Dehumidifier Filter Cleaned" >> Master_Task_Log.txt
								no_duration
						elif [ $dhd = 2 ]
							then
								clear
								start_time=$(sed -n '1p' dhd_time.txt)
								finish_time=$((start_time+1209600))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Dehumidifier Filter Cleaning Logger"
								echo ""
								echo "Last Clean Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Clean Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
					elif [ $option = 9 ]
					then
						clear
						echo "********************************"
						echo "Facial Brush Logger"
						echo ""
						echo "Type 1 to Log Replacement Time"
						echo "Type 2 to Check Replacement Time"
						echo "********************************"
						read fbrush
						trim=$fbrush
						leading_space_trim
						fbrush=$trim
						if [ $fbrush = 1 ]
							then
								rm brush_time.txt
								touch brush_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> brush_time.txt
								echo $timestamp: "Time Log : Facial Brush Replaced" >> Master_Task_Log.txt
								no_duration
						elif [ $fbrush = 2 ]
							then
								clear
								start_time=$(sed -n '1p' brush_time.txt)
								finish_time=$((start_time+1209600))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Facial Brush Replacement Logger"
								echo ""
								echo "Last Replacement Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Replacement Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
					elif [ $option = 11 ]
					then
						clear
						echo "********************************"
						echo "Sponge Logger"
						echo ""
						echo "Type 1 to Log Replacement Time"
						echo "Type 2 to Check Replacement Time"
						echo "********************************"
						read sponge
						trim=$sponge
						leading_space_trim
						sponge=$trim
						if [ $sponge = 1 ]
							then
								rm sponge_time.txt
								touch sponge_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> sponge_time.txt
								echo $timestamp: "Time Log : Sponge Replaced" >> Master_Task_Log.txt
								no_duration
						elif [ $sponge = 2 ]
							then
								clear
								start_time=$(sed -n '1p' sponge_time.txt)
								finish_time=$((start_time+2592000))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Sponge Replacement Logger"
								echo ""
								echo "Last Replacement Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Replacement Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
					elif [ $option = 10 ]
					then
						clear
						echo "********************************"
						echo "Air Purifier Logger"
						echo ""
						echo "Type 1 to Log Replacement Time"
						echo "Type 2 to Check Replacement Time"
						echo "********************************"
						read purify
						trim=$purify
						leading_space_trim
						purify=$trim
						if [ $purify = 1 ]
							then
								rm purify_time.txt
								touch purify_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> purify_time.txt
								echo $timestamp: "Time Log : Air Purifier Filter Replaced" >> Master_Task_Log.txt
								no_duration
						elif [ $purify = 2 ]
							then
								clear
								start_time=$(sed -n '1p' purify_time.txt)
								finish_time=$((start_time+31536000))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Air Purifier Replacement Logger"
								echo ""
								echo "Last Replacement Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Replacement Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
				elif [ $option = 12 ]
					then
						clear
						echo "********************************"
						echo "Dentist Appointment Logger"
						echo ""
						echo "Type 1 to Log Appointment Time"
						echo "Type 2 to Check Appointment Time"
						echo "********************************"
						read dentist
						trim=$dentist
						leading_space_trim
						dentist=$trim
						if [ $dentist = 1 ]
							then
								echo "********************************"
								echo "Type 1 for 3 Months"
								echo "Type 2 for 6 Months"
								echo "********************************"
								read dentist_gap
								if [ $dentist_gap = 1 ]
									then
										dentist_gap=7776000
								else
										dentist_gap=15552000
								fi
								rm dentist_gap.txt
								touch dentist_gap.txt
								echo $dentist_gap >> dentist_gap.txt
								rm dentist_time.txt
								touch dentist_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> dentist_time.txt
								echo $timestamp: "Time Log : Dentist Appointment" >> Master_Task_Log.txt
								no_duration
						elif [ $dentist = 2 ]
							then
								clear
								dentist_gap=$(sed -n '1p' dentist_gap.txt)
								start_time=$(sed -n '1p' dentist_time.txt)
								finish_time=$((start_time+$dentist_gap))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Dentist Appointment Logger"
								echo ""
								echo "Last Appointment Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Appointment Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
				elif [ $option = 13 ]
					then
						clear
						echo "********************************"
						echo "Floss Replacement Logger"
						echo ""
						echo "Type 1 to Log Replacement Time"
						echo "Type 2 to Check Replacement Time"
						echo "********************************"
						read floss
						trim=$floss
						leading_space_trim
						floss=$trim
						if [ $floss = 1 ]
							then
								rm floss_time.txt
								touch floss_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> floss_time.txt
								echo $timestamp: "Time Log : Floss Replacement" >> Master_Task_Log.txt
								no_duration
						elif [ $floss = 2 ]
							then
								clear
								start_time=$(sed -n '1p' floss_time.txt)
								finish_time=$((start_time+1209600))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Floss Replacement Logger"
								echo ""
								echo "Last Replacement Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Replacement Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
				elif [ $option = 14 ]
					then
						clear
						echo "********************************"
						echo "Eyebrow Appointment Logger"
						echo ""
						echo "Type 1 to Log Appointment Time"
						echo "Type 2 to Check Appointment Time"
						echo "********************************"
						read eyebrow
						trim=$eyebrow
						leading_space_trim
						eyebrow=$trim
						if [ $eyebrow = 1 ]
							then
								rm eyebrow_time.txt
								touch eyebrow_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> eyebrow_time.txt
								echo $timestamp: "Time Log : Eyebrow Appointment" >> Master_Task_Log.txt
								no_duration
						elif [ $eyebrow = 2 ]
							then
								clear
								start_time=$(sed -n '1p' eyebrow_time.txt)
								finish_time=$((start_time+3628800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Eyebrow Appointment Logger"
								echo ""
								echo "Last Appointment Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Appointment Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
				elif [ $option = 15 ]
					then
						clear
						echo "********************************"
						echo "Towel Replacement Logger"
						echo ""
						echo "Type 1 to Log Appointment Time"
						echo "Type 2 to Check Appointment Time"
						echo "********************************"
						read towel
						trim=$towel
						leading_space_trim
						towel=$trim
						if [ $towel = 1 ]
							then
								rm towel_time.txt
								touch towel_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> towel_time.txt
								echo $timestamp: "Time Log : Towel Replaced" >> Master_Task_Log.txt
								no_duration
						elif [ $towel = 2 ]
							then
								clear
								start_time=$(sed -n '1p' towel_time.txt)
								finish_time=$((start_time+604800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Towel Replacement Logger"
								echo ""
								echo "Last Replacement Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Replacement Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
				elif [ $option = 16 ]
					then
						clear
						echo "********************************"
						echo "Bedding Replacement Logger"
						echo ""
						echo "Type 1 to Log Appointment Time"
						echo "Type 2 to Check Appointment Time"
						echo "********************************"
						read bedding
						trim=$bedding
						leading_space_trim
						bedding=$trim
						if [ $bedding = 1 ]
							then
								rm bedding_time.txt
								touch bedding_time.txt
								# Get current time
								epoch=$(date +%s)
								# Add one hour
								epoch=$((epoch+3600))
								# Write time to file
								echo $epoch >> bedding_time.txt
								echo $timestamp: "Time Log : Bedding Replaced" >> Master_Task_Log.txt
								no_duration
						elif [ $bedding = 2 ]
							then
								clear
								start_time=$(sed -n '1p' bedding_time.txt)
								finish_time=$((start_time+1209600))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sum=$((finish_time-$epoch))
								sum=$((sum/60))
								start=$(awk -vstart="$start_time" 'BEGIN { print strftime("%c", start); }')
								finish=$(awk -vfinish="$finish_time" 'BEGIN { print strftime("%c", finish); }')
								echo "********************************"
								echo "Bedding Replacement Logger"
								echo ""
								echo "Last Replacement Was At; "
								echo ""
								echo $start
								echo ""
								echo "Next Replacement Is At; "
								echo ""
								echo $finish
								echo ""
								echo "Time to Go: "$sum " Minutes"
								echo "********************************"
								read timetogo
								no_duration
						else
							no_duration
						fi
					elif [ $option = 111 ]
						then
								# Work sum
								start_time=$(sed -n '1p' work_time.txt)
								finish_time=$((start_time+28800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								work=$((finish_time-$epoch))
								work=$((work/60))
								work=$(awk -v m=$work 'BEGIN { print m / 60 }')
								work=$(printf "%.3g" "$work")
								# Blot sum
								start_time=$(sed -n '1p' blot_time.txt)
								finish_time=$((start_time+3600))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								blot=$((finish_time-$epoch))
								blot=$((blot/60))
								blot=$(awk -v m=$blot 'BEGIN { print m / 60 }')
								blot=$(printf "%.2g" "$blot")
								# Self care sum
								start_time=$(sed -n '1p' self_care_time.txt)
								finish_time=$((start_time+10800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								selfcare=$((finish_time-$epoch))
								selfcare=$((selfcare/60))
								selfcare=$(awk -v m=$selfcare 'BEGIN { print m / 60 }')
								selfcare=$(printf "%.3g" "$selfcare")
								# Eye sum
								start_time=$(sed -n '1p' eye_time.txt)
								finish_time=$((start_time+7889238))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								eyedrops=$((finish_time-$epoch))
								eyedrops=$((eyedrops/60))
								eyedrops=$(awk -v m=$eyedrops 'BEGIN { print m / 60 }')
								eyedrops=$(printf "%.4g" "$eyedrops")
								eyedrops_day=$eyedrops
								eyedrops_day=$(awk -v m=$eyedrops_day 'BEGIN { print m / 24 }')
								eyedrops_day=$(printf "%.2g" "$eyedrops_day")
								# Haircut sum
								start_time=$(sed -n '1p' haircut_time.txt)
								finish_time=$((start_time+3628800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								haircut=$((finish_time-$epoch))
								haircut=$((haircut/60))
								haircut=$(awk -v m=$haircut 'BEGIN { print m / 60 }')
								haircut=$(printf "%.4g" "$haircut")
								haircut_day=$haircut
								haircut_day=$(awk -v m=$haircut_day 'BEGIN { print m / 24 }')
								haircut_day=$(printf "%.2g" "$haircut_day")
								# Razor sum
								start_time=$(sed -n '1p' razor_time.txt)
								finish_time=$((start_time+3628800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								razor=$((finish_time-$epoch))
								razor=$((razor/60))
								razor=$(awk -v m=$razor 'BEGIN { print m / 60 }')
								razor=$(printf "%.4g" "$razor")
								razor_day=$razor
								razor_day=$(awk -v m=$razor_day 'BEGIN { print m / 24 }')
								razor_day=$(printf "%.2g" "$razor_day")
								# Toothbrush sum
								start_time=$(sed -n '1p' tooth_time.txt)
								finish_time=$((start_time+7889238))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								toothbrush=$((finish_time-$epoch))
								toothbrush=$((toothbrush/60))
								toothbrush=$(awk -v m=$toothbrush 'BEGIN { print m / 60 }')
								toothbrush=$(printf "%.4g" "$toothbrush")
								toothbrush_day=$toothbrush
								toothbrush_day=$(awk -v m=$toothbrush_day 'BEGIN { print m / 24 }')
								toothbrush_day=$(printf "%.2g" "$toothbrush_day")
								# Dehumidifer sum
								start_time=$(sed -n '1p' dhd_time.txt)
								finish_time=$((start_time+1209600))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								dehumid=$((finish_time-$epoch))
								dehumid=$((dehumid/60))
								dehumid=$(awk -v m=$dehumid 'BEGIN { print m / 60 }')
								dehumid=$(printf "%.3g" "$dehumid")
								dehumid_day=$dehumid
								dehumid_day=$(awk -v m=$dehumid_day 'BEGIN { print m / 24 }')
								dehumid_day=$(printf "%.2g" "$dehumid_day")
								# Facial Brush sum
								start_time=$(sed -n '1p' brush_time.txt)
								finish_time=$((start_time+7889238))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								brush=$((finish_time-$epoch))
								brush=$((brush/60))
								brush=$(awk -v m=$brush 'BEGIN { print m / 60 }')
								brush=$(printf "%.4g" "$brush")
								brush_day=$brush
								brush_day=$(awk -v m=$brush_day 'BEGIN { print m / 24 }')
								brush_day=$(printf "%.2g" "$brush_day")
								# Air purifier sum
								start_time=$(sed -n '1p' purify_time.txt)
								finish_time=$((start_time+31536000))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								purify=$((finish_time-$epoch))
								purify=$((purify/60))
								purify=$(awk -v m=$purify 'BEGIN { print m / 60 }')
								purify=$(printf "%.4g" "$purify")
								purify_day=$purify
								purify_day=$(awk -v m=$purify_day 'BEGIN { print m / 24 }')
								purify_day=$(printf "%.2g" "$purify_day")
								# Sponge sum
								start_time=$(sed -n '1p' sponge_time.txt)
								finish_time=$((start_time+2592000))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								sponge=$((finish_time-$epoch))
								sponge=$((sponge/60))
								sponge=$(awk -v m=$sponge 'BEGIN { print m / 60 }')
								sponge=$(printf "%.4g" "$sponge")
								sponge_day=$sponge
								sponge_day=$(awk -v m=$sponge_day 'BEGIN { print m / 24 }')
								sponge_day=$(printf "%.2g" "$sponge_day")
								# Dentist sum
								start_time=$(sed -n '1p' dentist_time.txt)
								dentist_gap=$(sed -n '1p' dentist_gap.txt)
								finish_time=$((start_time+$dentist_gap))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								dentist=$((finish_time-$epoch))
								dentist=$((dentist/60))
								dentist=$(awk -v m=$dentist 'BEGIN { print m / 60 }')
								dentist=$(printf "%.4g" "$dentist")
								dentist_day=$dentist
								dentist_day=$(awk -v m=$dentist_day 'BEGIN { print m / 24 }')
								dentist_day=$(printf "%.2g" "$dentist_day")
								# Floss sum
								start_time=$(sed -n '1p' floss_time.txt)
								finish_time=$((start_time+1209600))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								floss=$((finish_time-$epoch))
								floss=$((floss/60))
								floss=$(awk -v m=$floss 'BEGIN { print m / 60 }')
								floss=$(printf "%.4g" "$floss")
								floss_day=$floss
								floss_day=$(awk -v m=$floss_day 'BEGIN { print m / 24 }')
								floss_day=$(printf "%.2g" "$floss_day")
								# Eyebrow sum
								start_time=$(sed -n '1p' eyebrow_time.txt)
								finish_time=$((start_time+3628800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								eyebrow=$((finish_time-$epoch))
								eyebrow=$((eyebrow/60))
								eyebrow=$(awk -v m=$eyebrow 'BEGIN { print m / 60 }')
								eyebrow=$(printf "%.4g" "$eyebrow")
								eyebrow_day=$eyebrow
								eyebrow_day=$(awk -v m=$eyebrow_day 'BEGIN { print m / 24 }')
								eyebrow_day=$(printf "%.2g" "$eyebrow_day")
								# Towel sum
								start_time=$(sed -n '1p' towel_time.txt)
								finish_time=$((start_time+604800))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								towel=$((finish_time-$epoch))
								towel=$((towel/60))
								towel=$(awk -v m=$towel 'BEGIN { print m / 60 }')
								towel=$(printf "%.4g" "$towel")
								towel_day=$towel
								towel_day=$(awk -v m=$towel_day 'BEGIN { print m / 24 }')
								towel_day=$(printf "%.2g" "$towel_day")
								# Bedding sum
								start_time=$(sed -n '1p' bedding_time.txt)
								finish_time=$((start_time+1209600))
								epoch=$(date +%s)
								epoch=$((epoch+3600))
								bedding=$((finish_time-$epoch))
								bedding=$((bedding/60))
								bedding=$(awk -v m=$bedding 'BEGIN { print m / 60 }')
								bedding=$(printf "%.4g" "$bedding")
								bedding_day=$bedding
								bedding_day=$(awk -v m=$bedding_day 'BEGIN { print m / 24 }')
								bedding_day=$(printf "%.2g" "$bedding_day")
							echo "********************************"
							echo "Time Logger Times."
							echo "Work: "$work" Hours to Go."
							echo "********************************"
							#echo "Blot: "$blot" Hours to Go."
							#echo "********************************"
							echo "Self Care: "$selfcare" Hours to Go."
							echo "********************************"
							echo "Eye Drops: "$eyedrops" Hours to Go."
							echo $eyedrops_day" Days to Go."
							echo "********************************"
							echo "Haircut: "$haircut" Hours to Go."
							echo $haircut_day" Days to Go."
							echo "********************************"
							echo "Razor: "$razor" Hours to Go."
							echo  $razor_day" Days to Go."
							echo "********************************"
							echo "Toothbrush: "$toothbrush" Hours to Go.***"
							echo $toothbrush_day" Days to Go."
							echo "********************************"
							echo "Dehumidifier: "$dehumid" Hours to Go."
							echo $dehumid_day" Days to Go."
							echo "********************************"
							#echo "Facial Brush: "$brush" Hours to Go."
							#echo $brush_day" Days to Go."
							#echo "********************************"
							#echo "Air Purifier: "$purify" Hours to Go."
							#echo $purify_day" Days to Go."
							#echo "********************************"
							echo "Sponge: "$sponge" Hours to Go."
							echo $sponge_day" Days to Go."
							echo "********************************"
							echo "Dentist: "$dentist" Hours to Go."
							echo $dentist_day" Days to Go."
							echo "********************************"
							echo "Floss: "$floss" Hours to Go."
							echo $floss_day" Days to Go."
							echo "********************************"
							echo "Eyebrow: "$eyebrow" Hours to Go."
							echo $eyebrow_day" Days to Go."
							echo "********************************"
							echo "Towel: "$towel" Hours to Go."
							echo $towel_day" Days to Go."
							echo "********************************"
							echo "Bedding: "$bedding" Hours to Go."
							echo $bedding_day" Days to Go."
							echo "********************************"
							echo "Type Anything to Exit."
							read Point
							echo "********************************"
							no_duration
					else
						no_duration
					fi
		elif [ $logType = 17 ]
			then
				clear
				echo "********************************"
				echo "You Have Selected Option 18."
				echo "Welcome To The Post Task Logger"
				echo ""
				echo "Type 1 to Insert a Post Task Log"
				echo "Type 2 to Insert a Post Task Log for Yesterday"
				echo "********************************"
				read post_task
				trim=$post_task
				leading_space_trim
				post_task=$trim
				timestamp=$(date +"%d-%m-%Y_")
				if [ $post_task = 1 ]
					then
						clear
						echo "********************************"
						echo "What Task Was It?"
						echo "********************************"
						read post_task_detail
						trim=$post_task_detail
						leading_space_trim
						post_task_detail=$trim
						title=$post_task_detail
						TitleCaseConverter
						post_task_detail=$title
						if [ "$post_task_detail" != "" ]
							then
							clear
							echo "********************************"
							grab_last_line_two
							echo  "Second To Last Task: "
							echo $last_line_time":"$last_line_task
							grab_last_line
							echo  "Last Task: "
							echo $last_line_time":"$last_line_task
							echo "What Time Did This Happen?"
							echo "Format: HH_MM"
							echo "********************************"
							read new_time
							trim=$new_time
							leading_space_trim
							new_time=$trim
							echo $timestamp$new_time"-00: Post Task Log :" $post_task_detail >> Master_Task_Log.txt
							no_duration
						else
							no_duration
						fi
				elif [ $post_task = 2 ]
					then
						clear
						echo "********************************"
						echo "What Task Was It?"
						echo "********************************"
						read post_task_detail
						trim=$post_task_detail
						leading_space_trim
						post_task_detail=$trim
						title=$post_task_detail
						TitleCaseConverter
						post_task_detail=$title
						if [ "$post_task_detail" != "" ]
							then
							clear
							echo "********************************"
							echo "What Time Did This Happen?"
							echo "##########################"
							echo "# YOU MUST ENTER A DATE TOO! #"
							echo "##########################"
							echo "Format: DD-MM-YYYY_HH_MM"
							echo ""
							generate_time_stamp
							echo "Current Date: "$timestamp
							echo "********************************"
							read new_time
							trim=$new_time
							leading_space_trim
							new_time=$trim
							echo $new_time"-00: Post Task Log :" $post_task_detail >> Master_Task_Log.txt
							no_duration
						fi
				else
					no_duration
				fi
		elif [ $logType = 18 ]
			then
				clear
				count=$(wc -l < quotes.txt)
				count=$(echo $count | xargs)
				r=$(( $RANDOM % $count ));
				echo "********************************"
				echo "You Have Selected Option 18."
				echo "Welcome To The Quote Generator!"
				echo ""
				echo "Random Number Generated = "$r
				echo "********************************"
				echo "Today's Random Quote Is:"
				echo ""
				echo "\""$(sed -n "$r"p quotes.txt)"\""
				echo ""
				echo "********************************"
				read end
				no_duration
		elif [ $logType = 19 ]
			then
				clear
				cw=$(sed -n 1p currentweight.txt)
				echo "********************************"
				echo "You Have Selected Option 19."
				echo "Welcome to the Weight Tracker!"
				echo ""
				echo "Your Current Weight Is : "$cw "Kg."
				echo ""
				echo "Type 1 to Enter Your Weight."
				echo "Type 2 to See Your Current Bmi."
				echo "Type 3 for Yesterday's Steps."
				echo "Type 4 for Blood Pressure."
				echo "********************************"
				read weight
				trim=$weight
				leading_space_trim
				weight=$trim
				generate_time_stamp
				if [ $weight = 1 ]
					then
						clear
						echo "********************************"
						echo "Please Enter Your Weight Below."
						echo "********************************"
						read currentweight
						if [ $currentweight = "" ]
							then
								no_duration
						else
							rm currentweight.txt
							echo $currentweight >> currentweight.txt
							echo $timestamp: "Current Weight : "$currentweight" kg" >> Master_Task_Log.txt
							no_duration
						fi
						clear
						echo "********************************"
						echo "Please Enter Your BMI Below."
						echo "********************************"
						read bmi
						if [ $bmi = "" ]
							then
								no_duration
						else
							echo $timestamp: "Current BMI : "$bmi >> Master_Task_Log.txt
							no_duration
						fi
						clear
						echo "********************************"
						echo "Please Enter Your Body Fat Below."
						echo "********************************"
						read bodyfat
						if [ $bodyfat = "" ]
							then
								no_duration
						else
							echo $timestamp: "Current Body Fat : "$bodyfat" %" >> Master_Task_Log.txt
							no_duration
						fi
						clear
						echo "********************************"
						echo "Please Enter Your Body Water Below."
						echo "********************************"
						read bodywater
						if [ $bodywater = "" ]
							then
								no_duration
						else
							echo $timestamp: "Current Body Water : "$bodywater" %" >> Master_Task_Log.txt
							no_duration
						fi
						clear
						echo "********************************"
						echo "Please Enter Your Bone Mass Below."
						echo "********************************"
						read bonemass
						if [ $bonemass = "" ]
							then
								no_duration
						else
							echo $timestamp: "Current Bone Mass : "$bonemass" %" >> Master_Task_Log.txt
							no_duration
						fi
				elif [ $weight = 2 ]
					then
						clear
						cw=$(sed -n 1p currentweight.txt)
						cw=$((cw * 100))
						height=175
						sum=$((cw / height))
						sum=$((sum * 100))
						sum=$((sum / height))
						if [ $sum -lt 18 ]
							then
								state="Underweight"
						elif [ $sum -gt 17 ] && [ $sum -lt 25 ]
							then
								state="Healthy"
						elif [ $sum -gt 24 ] && [ $sum -lt 30 ]
							then
								state="Overweight"
						else
							state="Obese"
						fi
						clear
						echo "********************************"
						echo "Your Current BMI Is: "$sum
						echo "Current Health State: "$state
						echo "********************************"
						echo ""
						echo "Type Anything To Quit."
						read quit
						no_duration
				elif [ $weight = 3 ]
					then
						clear
						echo "********************************"
						echo "Please Enter Yesterday's Steps Below."
						echo "********************************"
						read steps
						echo $timestamp: "Steps : "$steps >> Master_Task_Log.txt
				elif [ $weight = 4 ]
					then
						clear
						echo "********************************"
						echo "Please Enter SYS Value Below."
						echo "********************************"
						read sys
						clear
						echo "********************************"
						echo "Please Enter DIA Value Below."
						echo "********************************"
						read dia
						clear
						echo "********************************"
						echo "Please Enter PUL Value Below."
						echo "********************************"
						read pul
						echo $timestamp: "Blood Pressure (SYS) : "$sys >> Master_Task_Log.txt
						echo $timestamp: "Blood Pressure (DIA) : "$dia >> Master_Task_Log.txt
						echo $timestamp: "Blood Pressure (PUL) : "$pul >> Master_Task_Log.txt
						clear
						if [ $sys -lt 120 ]
							then
								sysstatus="Normal"
						elif [ $sys -gt 119 ] && [ $sys -lt 130 ]
							then
								sysstatus="Elevated"
						elif [ $sys -gt 129 ] && [ $sys -lt 130 ]
							then
								sysstatus="High Pressure (Level 1)"
						elif [ $sys -gt 139 ] && [ $sys -lt 181 ]
							then
								sysstatus="High Pressure (Level 2)"
						else
								sysstatus="Hypertensive Crisis"
						fi
						if [ $dia -lt 81 ]
							then
								diastatus="Normal"
						elif [ $dia -gt 79 ] && [ $dia -lt 90 ]
							then
								diastatus="High Pressure (Level 1)"
						elif [ $dia -gt 89 ] && [ $dia -lt 120 ]
							then
								diastatus="High Pressure (Level 2)"
						else
								diastatus="Hypertensive Crisis"
						fi
						echo "********************************"
						echo "Systolic Value is: "$sysstatus
						echo "********************************"
						echo "********************************"
						echo "Diastolic Value is: "$diastatus
						echo "********************************"
						read exit
				else
					no_duration
				fi
		elif [ $logType = 20 ]
			then
				clear
				counter=1
				echo "********************************"
				echo "You Have Selected Option 20."
				echo "Welcome to the Day Planner!"
				echo ""
				echo "Type 1 for Monday"
				echo "Type 2 for Tuesday"
				echo "Type 3 for Wednesday"
				echo "Type 4 for Thursday"
				echo "Type 5 for Friday"
				echo "Type 6 for Saturday"
				echo "Type 7 for Sunday"
				echo "Type 8 for New Week"
				echo "Type 9 for Default Week"
				echo "********************************"
				read dayofweek
				dayofweekfile=''
				if [ $dayofweek = 1 ]
					then
						dayofweekfile=schedulemon.txt
						dayofweekfiletemp=schedulemontemp.txt
				elif [ $dayofweek = 2 ]
					then
						dayofweekfile=scheduletue.txt
						dayofweekfiletemp=scheduletuetemp.txt
				elif [ $dayofweek = 3 ]
					then
						dayofweekfile=schedulewed.txt
						dayofweekfiletemp=schedulewedtemp.txt
				elif [ $dayofweek = 4 ]
					then
						dayofweekfile=schedulethu.txt
						dayofweekfiletemp=schedulethutemp.txt
				elif [ $dayofweek = 5 ]
					then
						dayofweekfile=schedulefri.txt
						dayofweekfiletemp=schedulefritemp.txt
				elif [ $dayofweek = 6 ]
					then
						dayofweekfile=schedulesat.txt
						dayofweekfiletemp=schedulesattemp.txt
				elif [ $dayofweek = 7 ]
					then
						dayofweekfile=schedulesun.txt
						dayofweekfiletemp=schedulesuntemp.txt
				elif [ $dayofweek = 8 ]
					then
						clear
						echo "********************************"
						echo "Are You Sure You Want To Reset?"
						echo "Type reset below to confirm"
						echo "********************************"
						read reset
						if [ $reset = "reset" ]
							then
							dayofweekfile=schedulemon.txt
							reset_day
							dayofweekfile=scheduletue.txt
							reset_day
							dayofweekfile=schedulewed.txt
							reset_day
							dayofweekfile=schedulethu.txt
							reset_day
							dayofweekfile=schedulefri.txt
							reset_day
							dayofweekfile=schedulesat.txt
							reset_day
							dayofweekfile=schedulesun.txt
							reset_day
							weekreset=1
							generate_time_stamp
							echo $timestamp: "Reset Week Planner" >> Master_Task_Log.txt
						fi
				elif [ $dayofweek = 9 ]
					then
						clear
						echo "********************************"
						echo "Are You Sure You Want To Reset?"
						echo "Type reset below to confirm"
						echo "********************************"
						read reset
						if [ $reset = "reset" ]
							then
							no_duration
							dayofweekfile=schedulemon.txt
							reset_day
							reset_default_week_work_no_travel
							dayofweekfile=scheduletue.txt
							reset_day
							reset_default_week_work_travel
							dayofweekfile=schedulewed.txt
							reset_day
							reset_default_week_work_travel
							dayofweekfile=schedulethu.txt
							reset_day
							reset_default_week_work_travel
							dayofweekfile=schedulefri.txt
							reset_day
							reset_default_week_work_no_travel
							dayofweekfile=schedulesat.txt
							reset_day
							reset_default_week_weekend
							dayofweekfile=schedulesun.txt
							reset_day
							reset_default_week_weekend
							weekreset=1
							generate_time_stamp
							echo $timestamp: "Default Week Applied" >> Master_Task_Log.txt
						fi
				else
						dayofweekfile=schedulemon.txt
				fi
				if [ $weekreset != 1 ]
				then
				clear
				echo "Here Is How Your Day Is Looking;"
				echo "********** Start **********"
				while read p; do
				echo $p
				done <$dayofweekfile
				echo "********** End **********"
				echo "Please Type 1 to Add a New Task."
				echo "Please Type 2 to Empty a Slot."
				echo "Please Type 3 to Apply Template."
				echo "********************************"
				read sch
				trim=$sch
				leading_space_trim
				sch=$trim
				generate_time_stamp
				if [ $sch = 2 ]
					then
						echo "********************************"
						echo "Which Item Would You Like To Empty?"
						echo "********************************"
						read item
						trim=$item
						leading_space_trim
						item=$trim
						counter=1
						while read p; do
						echo $p
						found=$(echo $p | cut -d "-" -f 1)
						if [ $found -eq $item ]
							then
							echo "Line "$p" = Found "$counter
							found1=$(echo $p | cut -d "-" -f 3)
							echo $counter"-Empty-"$found1 >> $dayofweekfiletemp
						else
							echo $p >> $dayofweekfiletemp
						fi
						counter=$((counter+1))
						done <$dayofweekfile
						rm $dayofweekfile
						cp $dayofweekfiletemp $dayofweekfile
						rm $dayofweekfiletemp
						no_duration
				elif [ $sch = 1 ]
					then
						echo "********************************"
						echo "Which Item Would You Like to Update?"
						echo "********************************"
						IFS=',' read -ra line
						trim=$line
						leading_space_trim
						item=$trim
						line1=${line[-1]}
						line2=${line[-2]}
						line3=${line[-3]}
						line4=${line[-4]}
						line5=${line[-5]}
						line6=${line[-6]}
						line7=${line[-7]}
						line8=${line[-8]}
						echo $line1
						echo $line2
						echo "********************************"
						echo "What Task Will It Be?"
						echo "********************************"
						read task_sch
						trim=$task_sch
						leading_space_trim
						task_sch=$trim
						title=$task_sch
						TitleCaseConverter
						task_sch=$title
						counter=1
						while read p; do
						echo $p
						found=$(echo $p | cut -d "-" -f 1)
						if [ $found -eq $line1 ] || [ $found -eq $line2 ] || [ $found -eq $line3 ] || [ $found -eq $line4 ] || [ $found -eq $line5 ] || [ $found -eq $line6 ] || [ $found -eq $line7 ] || [ $found -eq $line8 ]
							then
							echo "Line "$p" = Found "$counter
							found1=$(echo $p | cut -d "-" -f 3)
							echo $counter"-"$task_sch"-"$found1 >> $dayofweekfiletemp
							echo $timestamp: "New Schedule Item: "$task_sch >> Master_Task_Log.txt
						else
							echo $p >> $dayofweekfiletemp
						fi
						counter=$((counter+1))
						done <$dayofweekfile
						rm $dayofweekfile
						cp $dayofweekfiletemp $dayofweekfile
						rm $dayofweekfiletemp
						no_duration
				elif [ $sch = 3 ]
					then
						echo "********************************"
						echo "Please Type 1 to Apply Work (Travel)."
						echo "Please Type 2 to Apply Work (No Travel)."
						echo "Please Type 3 to Apply Weekend."
						echo "********************************"
						read template
						if [ $template = 1 ]
							then
								reset_default_week_work_travel
						elif [ $template = 2 ]
							then
								reset_default_week_work_no_travel
						elif [ $template = 3 ]
							then
								reset_default_week_weekend
						fi
				else
					clear
					no_duration
				fi
				fi
				weekreset=0
		elif [ $logType = 21 ]
			then
				clear
				counter=1
				echo "********************************"
				echo "You Have Selected Option 21."
				echo "Welcome to the Possessions Tracker!"
				echo "Type 1 to Cat Your Entire Possessions List."
				echo "Type 2 to Add to Your Possessions List."
				last_line=$( tail -n 1 possessions.txt )
				# Output the last line but only the task part
				counter=$(echo $last_line | cut -d "-" -f 1)
				echo "Counter: "$counter
				read pos
				trim=$pos
				leading_space_trim
				pos=$trim
				generate_time_stamp
				if [ $pos = 1 ]
				then
				echo "********** Start **********"
				more possessions.txt
				echo "********** End **********"
				elif [ $pos = 2 ]
					then
						counter=$((counter+1))
						echo "What's the Barcode?"
						read Barcode
						trim=$Barcode
						leading_space_trim
						Barcode=$trim
						echo "What Box Number Is It?"
						read Box
						trim=$Box
						leading_space_trim
						Box=$trim
						echo "What Is the Item?"
						read Item
						trim=$Item
						leading_space_trim
						Item=$trim
						echo "What Is the Quantity?"
						read Quantity
						trim=$Quantity
						leading_space_trim
						Quantity=$trim
						echo "Usage Level?"
						read Usage
						trim=$Usage
						leading_space_trim
						Usage=$trim
						echo "Long Term Storage? (Yes or No)"
						read Lts
						trim=$Lts
						leading_space_trim
						Lts=$trim
						echo "Present? (Yes or No)"
						read Present
						trim=$Present
						leading_space_trim
						Present=$trim
						echo $counter"-"$barcode"-"$box"-"$item"-"$quantity"-"$usage"-"$lts"-"$present >> possessions.txt
						no_duration
				else
					clear
					no_duration
				fi
		elif [ $logType = 22 ]
			then
			    clear
				r=$((RANDOM % 20 ));
				echo "Random Number: "$r
				echo "********************************"
				echo "You Have Selected Option 22."
				echo "Welcome..."
				echo "To The Magic Eight Ball Section!"
				echo ""
				echo "Type A Question Below..."
				echo "And The Magic Eight Ball Will Answer..."
				echo ""
				echo "********************************"
				read question
				generate_time_stamp
				echo $timestamp: "Magic Eight Ball Question:" $question >> Master_Task_Log.txt
				answer=$(sed -n "$r"p magiceightballresponses.txt)
				echo "********************************"
				echo $answer
				echo "********************************"
				echo $timestamp: "Magic Eight Ball Answer:" $answer >> Master_Task_Log.txt
				read pause
				no_duration
		elif [ $logType = 23 ]
		    then
		        clear
		        echo "********************************"
				echo "You Have Selected Option 23."
		        echo "Depression & Anxiety Tracker!"
		        echo ""
				echo "Type 111 For All"
				echo "Type 222 for Common"
		        echo "Type 1 For Anxiety"
		        echo "Type 2 For Depression"
				echo "Type 3 For Happiness"
				echo "Type 4 For Sadness"
				echo "Type 5 For Anger"
				echo "Type 6 For Love"
				echo "Type 7 For Energy"
				echo ""
		        echo "********************************"
		        read input
		        trim=$input
		        leading_space_trim
		        input=$trim
		        if [ $input = 1 ]
		            then
		                clear
				        echo "********************************"
		                echo "Please Enter Current Anxiety Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
                        read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Anxiety Level:" $level >> Master_Task_Log.txt
		                no_duration
						echo $level
						if [ $level -gt 2 ]
							then
								count=$(wc -l < help.txt)
								count=$(echo $count | xargs)
								r=$(( $RANDOM % $count ));
								echo "********************************"
								echo "I Can See Your Not Doing Too Well At The Minute."
								echo "Here Is Some Advice For You;"
								echo ""
								echo "$(sed -n "$r"p help.txt)"
								echo "********************************"
								read read
						fi
		        elif [ $input = 2 ]
		            then
		                clear
				        echo "********************************"
		                echo "Please Enter Current Depression Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Depression Level:" $level >> Master_Task_Log.txt
		                no_duration
						if [ $level -gt 2 ]
							then
								count=$(wc -l < help.txt)
								count=$(echo $count | xargs)
								r=$(( $RANDOM % $count ));
								echo "********************************"
								echo "I Can See Your Not Doing Too Well At The Minute."
								echo "Here Is Some Advice For You;"
								echo ""
								echo "$(sed -n "$r"p help.txt)"
								echo "********************************"
								read read
						fi
		        elif [ $input = 3 ]
		            then
		                clear
				        echo "********************************"
		                echo "Please Enter Current Happiness Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Happiness Level:" $level >> Master_Task_Log.txt
		                no_duration
		        elif [ $input = 4 ]
		            then
		                clear
				        echo "********************************"
		                echo "Please Enter Current Sadness Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Sadness Level:" $level >> Master_Task_Log.txt
		                no_duration
		        elif [ $input = 5 ]
		            then
		                clear
				        echo "********************************"
		                echo "Please Enter Current Anger Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Anger Level:" $level >> Master_Task_Log.txt
		                no_duration
		        elif [ $input = 6 ]
		            then
		                clear
				        echo "********************************"
		                echo "Please Enter Current Love Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Love Level:" $level >> Master_Task_Log.txt
		                no_duration
		        elif [ $input = 7 ]
		            then
		                clear
				        echo "********************************"
		                echo "Please Enter Current Energy Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Energy Level:" $level >> Master_Task_Log.txt
		                no_duration
		        elif [ $input = 111 ]
					then
						clear
				        echo "********************************"
		                echo "Please Enter Current Anxiety Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Anxiety Level:" $level >> Master_Task_Log.txt
		                no_duration
						clear
				        echo "********************************"
		                echo "Please Enter Current Depression Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Depression Level:" $level >> Master_Task_Log.txt
		                no_duration
						clear
				        echo "********************************"
		                echo "Please Enter Current Happiness Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Happiness Level:" $level >> Master_Task_Log.txt
		                no_duration
						clear
				        echo "********************************"
		                echo "Please Enter Current Sadness Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Sadness Level:" $level >> Master_Task_Log.txt
		                no_duration
						clear
				        echo "********************************"
		                echo "Please Enter Current Anger Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Anger Level:" $level >> Master_Task_Log.txt
		                no_duration
						clear
				        echo "********************************"
		                echo "Please Enter Current Love Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Love Level:" $level >> Master_Task_Log.txt
		                no_duration
						clear
				        echo "********************************"
		                echo "Please Enter Current Energy Level Below."
		                echo "Using A Scale Of (1 - 10)"
						echo ""
				        echo "********************************"
		                read level
		                trim=$level
		                leading_space_trim
		                level=$trim
		                generate_time_stamp
		                echo $timestamp: "Energy Level:" $level >> Master_Task_Log.txt
		                no_duration
		        elif [ $input = 222 ]
					then
						clear
				        echo "********************************"
		                echo "Please Make Your Selection"
		                echo ""
						echo "Type 1 for Elated"
						echo "Type 2 for Sad"
						echo "Type 3 for Nothing"
						echo "Type 4 for Neutral"
						echo "Type 5 for Pissed Off"
						echo "Type 6 for In Love"
				        echo "********************************"
		                read level
						if [ $level = 1 ]
							then
								echo $timestamp: "Happiness Level: 10" >> Master_Task_Log.txt
						elif [ $level = 2 ]
							then
								echo $timestamp: "Sadness Level: 10" >> Master_Task_Log.txt
						elif [ $level = 3 ]
							then
								echo $timestamp: "Anxiety Level: 1" >> Master_Task_Log.txt
								echo $timestamp: "Depression Level: 1" >> Master_Task_Log.txt
								echo $timestamp: "Happiness Level: 1" >> Master_Task_Log.txt
								echo $timestamp: "Sadness Level: 1" >> Master_Task_Log.txt
								echo $timestamp: "Anger Level: 1" >> Master_Task_Log.txt
								echo $timestamp: "Love Level: 1" >> Master_Task_Log.txt
								echo $timestamp: "Energy Level: 5" >> Master_Task_Log.txt
						elif [ $level = 4 ]
							then
								echo $timestamp: "Anxiety Level: 5" >> Master_Task_Log.txt
								echo $timestamp: "Depression Level: 5" >> Master_Task_Log.txt
								echo $timestamp: "Happiness Level: 5" >> Master_Task_Log.txt
								echo $timestamp: "Sadness Level: 5" >> Master_Task_Log.txt
								echo $timestamp: "Anger Level: 5" >> Master_Task_Log.txt
								echo $timestamp: "Love Level: 5" >> Master_Task_Log.txt
								echo $timestamp: "Energy Level: 5" >> Master_Task_Log.txt
						elif [ $level = 5 ]
							then
								echo $timestamp: "Anger Level: 10" >> Master_Task_Log.txt
						elif [ $level = 6 ]
							then
								echo $timestamp: "Love Level: 10" >> Master_Task_Log.txt
						else
							echo "Nothing entered."
						fi
				else
		            clear
		            no_duration
		        fi
		elif [ $logType = 24 ]
		    then
		        clear
		        echo "********************************"
				echo "You Have Selected Option 24."
		        echo "Welcome To The Coin Flipper!"
		        echo ""
				echo "Helps You Decide Things..."
				echo ""
		        echo "********************************"
                r=$(( $RANDOM % 2 ));
                echo $r
                if [ $r = 1 ]
                    then
						echo "=====     ====="
		                echo "Heads.    Yes.  "
		                echo "=====     ====="
		            else
						echo "=====     ====="
		                echo "Tails.    No.  "
		                echo "=====     ====="
		            fi
		        no_duration
		        read exit
		elif [ $logType = 25 ]
		    then
		        clear
				count=$(wc -l < inspiration.txt)
				count=$(echo $count | xargs)
				r=$(( $RANDOM % $count ));
		        echo "********************************"
				echo "You Have Selected Option 25."
		        echo "Welcome To The Affirmations Section!"
		        echo ""
		        echo "Here Are Some Words To Inspire You."
				echo ""
				echo "\""$(sed -n "$r"p inspiration.txt)"\""
		        echo "********************************"
				read end
				no_duration
		elif [ $logType = 26 ]
			then
				clear
				bbalance=$(sed -n 1p bbalance.txt)
				cbalance=$(sed -n 1p cbalance.txt)
				echo "********************************"
				echo "You Have Selected Option 26."
		        echo "Welcome To The Cash Tracker!"
				echo ""
				echo "Bank Account: "$bbalance".00 (GBP)"
				echo ""
				echo "Wallet: "$cbalance".00 (GBP)"
				echo ""
				echo "Type 1 To Update Your Bank Balance"
				echo "Type 2 To Update Your Cash Balance"
				read balance
				if [ $balance = 1 ]
					then
					clear
					echo "********************************"
					echo "Enter Your Current Bank Balance"
					echo ""
					echo "Bank Account: "$bbalance".00 (GBP)"
					echo "********************************"
					read bbalance
					rm bbalance.txt
					touch bbalance.txt
					echo $bbalance >> bbalance.txt
					generate_time_stamp
					echo $timestamp: "Bank Balance : "$bbalance".00" >> Master_Task_Log.txt
				elif [ $balance = 2 ]
					then
					clear
					echo "********************************"
					echo "Enter Your Current Cash Balance"
					echo ""
					echo "Wallet: "$cbalance".00 (GBP)"
					echo "********************************"
					read cbalance
					rm cbalance.txt
					touch cbalance.txt
					echo $cbalance >> cbalance.txt
					generate_time_stamp
					echo $timestamp: "Cash Balance : "$cbalance".00" >> Master_Task_Log.txt
				else
					no_duration
				fi
				no_duration
		elif [ $logType = 27 ]
			then
				doy=$(date +%j)
				doy=$(expr $doy + 0)
				echo "Loading..."
				while read p; do
					cutdoy=$(echo $p | cut -d "," -f 1)
					if [ $cutdoy = $doy ]
						then
							doyhuman=$p
							break
					fi
				done <daysconvert.txt
				clear
		        echo "********************************"
				echo "You Have Selected Option 27."
		        echo "Welcome To The Date Calculator!"
		        echo ""
				doyhuman=$(echo $doyhuman | cut -d "," -f 2)
				echo "Current DOY = "$doy
				echo "Readable = "$doyhuman
				echo "Please choose an option."
				echo ""
				echo "Type 1 to Subtract from Today"
				echo "Type 2 to Add to Today"
				echo "Type 3 for Countdown"
		        echo "********************************"
				read day
				if [ $day = 1 ]
					then
						echo "********************************"
						echo "Please Enter The Number of Days You Wish"
						echo "to Subtract."
					    echo "********************************"
						read days
						dayscalc=$(($doy-$days))
						echo "Calculating..."
						while read p; do
						cutdoy=$(echo $p | cut -d "," -f 1)
						if [ $cutdoy = $dayscalc ]
							then
								dayscalc=$p
								break
						fi
						done <daysconvert.txt
						dayscalc=$(echo $dayscalc | cut -d "," -f 2)
						echo "********************************"
						echo "The result is: $dayscalc"
					    echo "********************************"
						read wait
				elif [ $day = 2 ]
					then
						echo "********************************"
						echo "Please Enter The Number of Days You Wish"
						echo "to Add."
					    echo "********************************"
						read days
						dayscalc=$(($doy+$days))
						echo "Calculating..."
						while read p; do
						cutdoy=$(echo $p | cut -d "," -f 1)
						if [ $cutdoy = $dayscalc ]
							then
								dayscalc=$p
								break
						fi
						done <daysconvert.txt
						dayscalc=$(echo $dayscalc | cut -d "," -f 2)
						echo "********************************"
						echo "The result is: $dayscalc"
						echo "********************************"
						read wait
				elif [ $day = 3 ]
					then
						echo "********************************"
						echo "Please Enter The Day Number (1 - 365)"
						echo ""
					    echo "********************************"
						read countdown
						echo "Calculating..."
						countdown_converted=$(sed -n "$countdown"p daysconvert.txt)
						dayscalc=$(echo $countdown_converted | cut -d "," -f 1)
						dayscalc_friendly=$(echo $countdown_converted | cut -d "," -f 2)
						echo "The result is: $dayscalc_friendly"
						echo "********************************"
						echo "Would you like to calculate how many days until then?"
						echo "Type 1 for Yes"
						echo "********************************"
						read choice
						if [ $choice = 1 ]
							then
								countdown_calc=$(($dayscalc-$doy))
								echo "********************************"
								echo "The result is: "$countdown_calc" days"
								echo "********************************"
								read stop
						else
							no_duration
						fi
				else
						no_duration
				fi
				no_duration
		elif [ $logType = 28 ]
			then
				clear
		        echo "********************************"
				echo "You Have Selected Option 29."
		        echo "Welcome To Name Generator!"
		        echo ""
				echo "Here is Your New Name;"
				echo ""
				count=$(wc -l < names.txt)
				count=$(echo $count | xargs)
				r=$(( $RANDOM % $count ));
				name=$(sed -n "$r"p names.txt)
				echo "$name"
		        echo "********************************"
				read stop
				no_duration
		elif [ $logType = 29 ]
			then
				clear
		        echo "********************************"
				echo "You Have Selected Option 29."
		        echo "Welcome To Word Of The Day!"
		        echo ""
				echo "Here is Today's Word;"
				echo ""
				count=$(wc -l < words.txt)
				count=$(echo $count | xargs)
				r=$(( $RANDOM % $count ));
				word=$(sed -n "$r"p words.txt)
				word1=$(echo $word | cut -d "," -f 1)
				word2=$(echo $word | cut -d "," -f 2)
				echo "\"$word1\""
				echo ""
				echo "Definition: $word2"
		        echo "********************************"
				read stop
				no_duration
		elif [ $logType = 30 ]
			then
				clear
		        echo "********************************"
				echo "Are You Sure You Want To Delete"
				echo "The Last Line Of The Log?"
				echo "Type 1 To Confirm"
		        echo "********************************"
				read sure
				if [ $sure = 1 ]
					then
						# Copy task file
						cp Master_Task_Log.txt tlb.txt
						length=$(wc -l < tlb.txt)
						echo "Word Count of Task Log is: "$length
						take_one=$((length-1))
						head -n "$take_one" tlb.txt > temptask.txt
						rm -f Master_Task_Log.txt
						rm -f tlb.txt
						cp temptask.txt Master_Task_Log.txt
						#rm temptask.txt
				fi
				no_duration
		elif [ $logType = 31 ]
			then
				clear
		        echo "********************************"
				echo "You Have Selected Option 31."
		        echo "Welcome To Small Talk Helper!"
		        echo ""
				echo "Type 1 for Random."
				echo "Type 2 to Search."
				echo "Type 3 to Explore List."
				echo ""
			    echo "********************************"
				read smalltalk
				if [ $smalltalk = 1 ]
					then
						clear
						count=$(wc -l < smalltalk.txt)
						count=$(echo $count | xargs)
						r=$(( $RANDOM % $count ));
						echo "********************************"
						echo "Try This Question Out;"
						echo ""
						echo $(sed -n "$r"p smalltalk.txt)
						echo ""
						echo "Type Anything To Quit."
						echo "********************************"
						read pause
				elif [ $smalltalk = 2 ]
					then
						clear
						echo "********************************"
				        echo "Please Enter A Search Term Below."
						echo "********************************"
				        read term
				        grep -iR -n "$term" smalltalk.txt
						echo ""
						echo "Type Anything To Quit."
						read pause
				elif [ $smalltalk = 3 ]
					then
						more smalltalk.txt
				fi
				no_duration
		elif [ $logType = 32 ]
			then
				clear
				counter=1
				echo "********************************"
				echo "You Have Selected Option 32."
				echo "Welcome To The Verbal Script!"
				echo ""
				echo "Here Is Your Script Today;"
				echo "********** Verbal Script ***********"
				last_line=$( tail -n 1 verbal.txt )
				# Output the last line but only the task part
				counter=$(echo $last_line | cut -d "-" -f 1)
				while read p; do
				echo $p
				done <verbal.txt
				echo "********************************"
				echo "Please Enter a New Item to Add to the List"
				echo ""
				echo "Type 1 for Remove"
				echo "Type 2 for Reset"
				echo "********************************"
				read verbal
				trim=$verbal
				leading_space_trim
				verbal=$trim
				title=$verbal
				TitleCaseConverter
				verbal=$title
				generate_time_stamp
				if [ $verbal = 2 ]
					then
						clear
						echo "********************************"
						echo "Are You Sure You Want To Reset?"
						echo "Type Reset Below To Confirm"
						echo "********************************"
						read reset
						if [ $reset = "reset" ]
							then
							echo "Resetting...Not Recoverable!"
							rm verbal.txt
							touch verbal.txt
							echo $timestamp: "Reset : Reset Verbal Script" >> Master_Task_Log.txt
						fi
						no_duration
				elif [ $verbal = 1 ]
					then
						echo "********************************"
						echo "Which Item Would You like to Remove?"
						echo "********************************"
						read item
						trim=$item
						leading_space_trim
						item=$trim
						counter=1
						while read p; do
						echo $p
						found=$(echo $p | cut -d "-" -f 1)
						if [ $found -eq $item ]
							then
							echo "Line "$p" = Found "$counter
							echo =$(sed -e "$counter"d verbal.txt >> verbaltemp.txt)
							rm verbal.txt
							cp verbaltemp.txt verbal.txt
							rm verbaltemp.txt
							break
						fi
						counter=$((counter+1))
						done <verbal.txt
						no_duration
				else
						if [ "$verbal" != "" ]
							then
								counter=$((counter+1))
								echo $counter"-"$verbal >> verbal.txt
								echo $timestamp: "New Verbal List Item :" $verbal >> Master_Task_Log.txt
								no_duration
						else
							no_duration
						fi
				fi
		elif [ $logType = 33 ]
			then
				clear
				echo "********************************"
				echo "You Have Selected Option 33."
				echo "Welcome to the Battery Tracker!"
				echo ""
				echo "What Battery Are You Checking out Today?"
				echo "Type 1 for Samsung"
				echo "Type 2 for Nokia"
				echo "Type Reset to Reset"
				echo "********************************"
				echo ""
				samsung=$(sed -n '1p' battery.txt)
				nokia=$(sed -n '2p' battery.txt)
				echo "Samsung Count: " $samsung
				echo "Nokia Count: " $nokia
				read battery
				trim=$battery
				leading_space_trim
				battery=$trim
				if [ $battery != "" ]
					then
						if [ $battery = 1 ]
							then
								result1=$((samsung-1))
								rm battery.txt
								echo $result1 > battery.txt
								echo $nokia >> battery.txt
								generate_time_stamp
								echo $timestamp: "Battery Tracker : 1 x Samsung Battery" >> Master_Task_Log.txt
								no_duration
						elif [ $battery = 2 ]
							then
								result2=$((nokia-1))
								rm battery.txt
								echo $samsung > battery.txt
								echo $result2 >> battery.txt
								generate_time_stamp
								echo $timestamp: "Battery Tracker : 1 x Nokia Battery" >> Master_Task_Log.txt
								no_duration
						elif [ $battery = "reset" ]
							then
								rm battery.txt
								clear
								echo "********************************"
								echo "Please Enter Your Samsung Battery Count"
								echo "********************************"
								read samsung
								trim=$samsung
								leading_space_trim
								samsung=$trim
								clear
								echo "********************************"
								echo "Please Enter Your Nokia Battery Count"
								echo "********************************"
								read nokia
								trim=$nokia
								leading_space_trim
								nokia=$trim
								echo $samsung > battery.txt
								echo $nokia >> battery.txt
								echo $timestamp: "Reset : Reset Battery Tracker" >> Master_Task_Log.txt
								no_duration
						else
							echo "Nothing Logged."
							no_duration
						fi
				else
					echo "Nothing Logged."
					no_duration
				fi
		elif [ $logType = 34 ]
			then
				clear
				count=$(wc -l < jokes.txt)
				count=$(echo $count | xargs)
				r=$(( $RANDOM % $count ));
				echo "********************************"
				echo "You Have Selected Option 34."
				echo "Welcome to the Joke Generator!"
				echo ""
				echo "\""$(sed -n "$r"p jokes.txt)"\""
				echo "********************************"
				read wait
				no_duration
		elif [ $logType = 35 ]
			then
				clear
				counter=1
				counter2=1
				echo "********************************"
				echo "You Have Selected Option 35."
				echo "Welcome to the Bags Tracker!"
				echo ""
				last_line=$( tail -n 1 bagone.txt )
				# Output the last line but only the task part
				counter=$(echo $last_line | cut -d "-" -f 1)
				last_line2=$( tail -n 1 bagtwo.txt )
				# Output the last line but only the task part
				counter2=$(echo $last_line2 | cut -d "-" -f 1)
				echo "Type 1 To Select Bag #1"
				echo "Type 2 To Select Bag #2"
				echo "********************************"
				echo ""
				read bag
				trim=$bag
				leading_space_trim
				bag=$trim
				if [ $bag = 1 ]
					then
						clear
							echo "********************************"
							echo "You Have Selected Bag #1."
							echo ""
							echo "Here Is A List Of Your Bags Contents"
							echo "********************************"
							while read p; do
							echo $p
							done <bagone.txt
							echo "********************************"
							echo "Please Enter a New Item to Add to the Bag"
							echo ""
							echo "Type 1 for Remove"
							echo "Type 2 for Reset"
							echo "********************************"
							read bagone
							trim=$bagone
							leading_space_trim
							bagone=$trim
							title=$bagone
							TitleCaseConverter
							bagone=$title
							generate_time_stamp
							if [ $bagone = 2 ]
								then
									clear
									echo "********************************"
									echo "Are You Sure You Want To Reset?"
									echo "Type Reset Below To Confirm"
									echo "********************************"
									read reset
									if [ $reset = "reset" ]
										then
										echo "Resetting...Not Recoverable!"
										rm bagone.txt
										touch bagone.txt
										echo $timestamp: "Reset : Reset Bag One List" >> Master_Task_Log.txt
									fi
									no_duration
							elif [ $bagone = 1 ]
								then
									echo "Which Item Would You like to Remove?"
									read item
									trim=$item
									leading_space_trim
									item=$trim
									counter=1
									while read p; do
									echo $p
									found=$(echo $p | cut -d "-" -f 1)
									if [ $found -eq $item ]
										then
										echo "Line "$p" = Found "$counter
										echo =$(sed -e "$counter"d bagone.txt >> bagonetemp.txt)
										rm bagone.txt
										cp bagonetemp.txt bagone.txt
										rm bagonetemp.txt
										break
									fi
									counter=$((counter+1))
									done <bagone.txt
									no_duration
							else
								if [ "$bagone" != "" ]
									then
										counter=$((counter+1))
										echo $counter"-"$bagone >> bagone.txt
										echo $timestamp: "New Bag One Item List Item :" $bagone >> Master_Task_Log.txt
										no_duration
								else
									no_duration
								fi
							fi
					elif [ $bag = 2 ]
						then
							clear
							echo "********************************"
							echo "You Have Selected Bag #2."
							echo ""
							echo "Here Is A List Of Your Bags Contents"
							echo "********************************"
							while read p; do
							echo $p
							done <bagtwo.txt
							echo "********************************"
							echo "Please Enter a New Item to Add to the Bag"
							echo ""
							echo "Type 1 for Remove"
							echo "Type 2 for Reset"
							echo "********************************"
							read bagtwo
							trim=$bagtwo
							leading_space_trim
							bagtwo=$trim
							title=$bagtwo
							TitleCaseConverter
							bagtwo=$title
							generate_time_stamp
							if [ $bagtwo = 2 ]
								then
									clear
									echo "********************************"
									echo "Are You Sure You Want To Reset?"
									echo "Type Reset Below To Confirm"
									echo "********************************"
									read reset
									if [ $reset = "reset" ]
										then
										echo "Resetting...Not Recoverable!"
										rm bagtwo.txt
										touch bagtwo.txt
										echo $timestamp: "Reset : Reset Bag Two List" >> Master_Task_Log.txt
									fi
									no_duration
							elif [ $bagtwo = 1 ]
								then
									echo "Which Item Would You Like To Remove?"
									read item
									trim=$item
									leading_space_trim
									item=$trim
									counter=1
									while read p; do
									echo $p
									found=$(echo $p | cut -d "-" -f 1)
									if [ $found -eq $item ]
										then
										echo "Line "$p" = Found "$counter
										echo =$(sed -e "$counter"d bagtwo.txt >> bagtwotemp.txt)
										rm bagtwo.txt
										cp bagtwotemp.txt bagtwo.txt
										rm bagtwotemp.txt
										break
									fi
									counter=$((counter+1))
									done <bagtwo.txt
									no_duration
							else
								if [ "$bagtwo" != "" ]
									then
										counter2=$((counter2+1))
										echo $counter2"-"$bagtwo >> bagtwo.txt
										echo $timestamp: "New Bag Two Item List Item :" $bagtwo >> Master_Task_Log.txt
										no_duration
								else
									no_duration
								fi
						fi
				fi
		elif [ $logType = 36 ]
			then
				clear
				echo "********************************"
				echo "You Have Selected Option 36."
				echo "Welcome to the Calorie Tracker!"
				echo ""
				echo "Daily Consumption;"
				dailycalorie=$(sed -n 1p dailycal.txt)
				dailyquota=$(sed -n '1p' caloriequota.txt)
				echo $dailycalorie" / "$dailyquota" kcal"
				echo ""
				echo "Type 1 to Record Calories"
				echo "Type 2 to Change Quota"
				read calchoice
				if [ $calchoice = 1 ]
					then
						clear
						echo "********************************"
						echo "How Many Calories Did You Consume?"
						echo "********************************"
						read calorieintake
						dailycalorie=$((calorieintake+$dailycalorie))
						rm dailycal.txt
						touch dailycal.txt
						echo $dailycalorie >> dailycal.txt
				elif [ $calchoice = 2 ]
					then
						clear
						rm caloriequota.txt
						touch caloriequota.txt
						echo "********************************"
						echo "What Is The New Calorie Quota?"
						echo "********************************"
						read calorieintake
						echo $calorieintake >> caloriequota.txt
				fi
		elif [ $logType = 37 ]
			then
				clear
				counter=1
				echo "********************************"
				echo "You Have Selected Option 37."
				echo "Welcome to the Appointment Tracker!"
				echo ""
				echo "Here Are Your Current Appointments"
				echo "********* Appointments *********"
				last_line=$( tail -n 1 appointments.txt )
				# Output the last line but only the task part
				counter=$(echo $last_line | cut -d "-" -f 1)
				while read p; do
				echo $p
				done <appointments.txt
				echo "********************************"
				echo "Please Enter a New Item to Add to the List"
				echo ""
				echo "Type 1 for Remove"
				echo "Type 2 for Reset"
				echo "********************************"
				read appointment
				trim=$appointment
				leading_space_trim
				appointment=$trim
				title=$appointment
				TitleCaseConverter
				appointment=$title
				generate_time_stamp
				if [ $appointment = 2 ]
					then
						clear
						echo "********************************"
						echo "Are You Sure You Want To Reset?"
						echo "Type Reset Below To Confirm"
						echo "********************************"
						read reset
						if [ $reset = "reset" ]
							then
							echo "Resetting...not recoverable!"
							rm appointments.txt
							touch appointments.txt
							echo $timestamp: "Reset : Reset Appointments List" >> Master_Task_Log.txt
						fi
						no_duration
				elif [ $appointment = 1 ]
					then
						echo "********************************"
						echo "Which Item Would You like to Remove?"
						echo "********************************"
						read item
						trim=$item
						leading_space_trim
						item=$trim
						counter=1
						while read p; do
						echo $p
						found=$(echo $p | cut -d "-" -f 1)
						if [ $found -eq $item ]
							then
							echo "Line "$p" = Found "$counter
							shop=$(sed -n "$counter"p appointments.txt)
							generate_time_stamp
							echo $timestamp: "Appointment Removed :" $shop >> Master_Task_Log.txt
							echo =$(sed -e "$counter"d appointments.txt >> appointmentstemp.txt)
							rm appointments.txt
							cp appointmentstemp.txt appointments.txt
							rm appointmentstemp.txt
							break
						fi
						counter=$((counter+1))
						done <appointments.txt
						no_duration
				else
						if [ "$appointment" != "" ]
							then
								counter=$((counter+1))
								echo $counter"-"$appointment >> appointments.txt
								generate_time_stamp
								echo $timestamp: "New Appointment :" $appointment >> Master_Task_Log.txt
								no_duration
						else
							no_duration
						fi
				fi
		elif [ $logType = 38 ]
			then
				clear
				counter=1
				echo "********************************"
				echo "You Have Selected Option 38."
				echo "Welcome to the Stats Tracker!"
				echo ""
				echo "Here Are Your Stats For Today;"
				echo "********************************"
				amprogress=$(sed -n '1p' amprogress.txt)
				echo "Morning Routine Progress: "$amprogress"%"
				pmprogress=$(sed -n '1p' pmprogress.txt)
				echo "Evening Routine Progress: "$pmprogress"%"
				cals=$(sed -n '1p' dailycal.txt)
				if [ $cals -gt 0 ] && [ $cals -lt 200 ]
					then
						calspercent=10
				elif [ $cals -gt 200 ] && [ $cals -lt 400 ]
					then
						calspercent=20
				elif [ $cals -gt 399 ] && [ $cals -lt 600 ]
					then
						calspercent=30
				elif [ $cals -gt 599 ] && [ $cals -lt 800 ]
					then
						calspercent=40
				elif [ $cals -gt 799 ] && [ $cals -lt 1000 ]
					then
						calspercent=50
				elif [ $cals -gt 999 ] && [ $cals -lt 1200 ]
					then
						calspercent=60
				elif [ $cals -gt 1199 ] && [ $cals -lt 1400 ]
					then
						calspercent=70
				elif [ $cals -gt 1399 ] && [ $cals -lt 1600 ]
					then
						calspercent=80
				elif [ $cals -gt 1599 ] && [ $cals -lt 1800 ]
					then
						calspercent=90
				elif [ $cals -gt 1799 ] && [ $cals -lt 2000 ]
					then
						calspercent=100
				else
						calspercent=100
				fi
				dailyquota=$(sed -n '1p' caloriequota.txt)
				echo "Calories: "$cals"kcal / "$dailyquota"kcal ("$calspercent"%)"
				toilet=$(sed -n '1p' toilet.txt)
				echo "Toilet Breaks: "$toilet
				echo "Task Count: "$taskcount
				dailyamount=$(sed -n '1p' water_measure.txt)
				if [ $dailyamount -gt 0 ] && [ $dailyamount -lt 370 ]
					then
						waterpercent=10
				elif [ $dailyamount -gt 369 ] && [ $dailyamount -lt 740 ]
					then
						waterpercent=20
				elif [ $dailyamount -gt 739 ] && [ $dailyamount -lt 1110 ]
					then
						waterpercent=30
				elif [ $dailyamount -gt 1109 ] && [ $dailyamount -lt 1480 ]
					then
						waterpercent=40
				elif [ $dailyamount -gt 1479 ] && [ $dailyamount -lt 1850 ]
					then
						waterpercent=50
				elif [ $dailyamount -gt 1849 ] && [ $dailyamount -lt 2220 ]
					then
						waterpercent=60
				elif [ $dailyamount -gt 2219 ] && [ $dailyamount -lt 2590 ]
					then
						waterpercent=70
				elif [ $dailyamount -gt 2589 ] && [ $dailyamount -lt 2960 ]
					then
						waterpercent=80
				elif [ $dailyamount -gt 2959 ] && [ $dailyamount -lt 3330 ]
					then
						waterpercent=90
				elif [ $dailyamount -gt 3329 ] && [ $dailyamount -lt 3700 ]
					then
						waterpercent=100
				else
						waterpercent=100
				fi
				dailyquota=$(sed -n '1p' waterquota.txt)
				echo "Water Intake: "$dailyamount"ml / "$dailyquota"ml ("$waterpercent"%)"
				selfcarecount=$(sed -n '1p' selfcarecount.txt)
				echo "Self Care Routine Count: "$selfcarecount" / 5"
				echo "********************************"
				read return
		elif [ $logType = 39 ]
			then
				clear
				counter=1
				echo "********************************"
				echo "You Have Selected Option 39."
				echo "Welcome to the Travel Tracker!"
				echo ""
				echo "Type 1 For Destination."
				echo "Type 2 For Walking."
				echo "Type 3 For Waiting."
				echo "Type 4 For Bus."
				echo "Type 5 For Arriving Home."
				echo "********************************"
				read travel
				generate_time_stamp
				if [ $travel = 1 ]
					then
						clear
						echo "********************************"
						echo "Where Are You Going?"
						echo "Type 1 For Work"
						echo "Type 2 For Home"
						echo "Type 3 For Shopping"
						echo "Type Anything Else For Another Place"
						echo "********************************"
						read destination
						if [ $destination = 1 ]
							then
								destination="To Work"
						elif [ $destination = 2 ]
							then
								destination="Home"
						elif [ $destination = 3 ]
							then
								destination="To The Shop"
						else
							destination="To "$destination
						fi
						echo $timestamp: "Task : Travelling "$destination >> Master_Task_Log.txt
						echo $timestamp: "Task : Walking" >> Master_Task_Log.txt
						duration
				elif [ $travel = 2 ]
					then
						echo $timestamp: "Task : Walking" >> Master_Task_Log.txt
				elif [ $travel = 3 ]
					then
						echo $timestamp: "Task : Waiting" >> Master_Task_Log.txt
				elif [ $travel = 4 ]
					then
						clear
						echo "********************************"
						echo "Are You Boarding or Deboarding?"
						echo "Type 1 for Boarding"
						echo "Type 2 for Deboarding"
						echo "********************************"
						read board
						if [ $board = 1 ]
							then
								echo $timestamp: "Task : Boarding Bus" >> Master_Task_Log.txt
						elif [ $board = 2 ]
							then
								echo $timestamp: "Task : Deboarding Bus" >> Master_Task_Log.txt
								echo $timestamp: "Task : Walking" >> Master_Task_Log.txt
						fi
						duration
				elif [ $travel = 5 ]
					then
						echo $timestamp: "Task : Arriving Home" >> Master_Task_Log.txt
				fi
		elif [ $logType = 40 ]
			then
				clear
				count=$(wc -l < games.txt)
				count=$(echo $count | xargs)
				r=$(( $RANDOM % $count ));
				echo "********************************"
				echo "You Have Selected Option 40."
				echo "Welcome To The Game Randomizer!"
				echo ""
				echo "********************************"
				echo "Random Number Generated = "$r
				echo "********************************"
				echo "Today's Game Is:"
				echo ""
				echo $(sed -n "$r"p games.txt)
				echo ""
				echo "Enjoy!"
				echo "********************************"
				read end
				no_duration
		elif [ $logType = 41 ]
			then
				clear
				echo "********************************"
				echo "You Have Selected Option 41."
				echo "Welcome To Phone Numbers!"
				echo ""
				echo "Type 1 for Emergency Numbers"
				echo "Type 2 for Transport Numbers"
				echo "Type 3 for Advice Numbers"
				echo "Type 4 for Hospitals/Health Numbers"
				echo "Type 5 for Taxis Numbers"
				echo "Type 6 for Local Numbers"
				echo "********************************"
				read phone
				if [ $phone = 1 ]
					then
						clear
							cat emergencynos.txt
							read end
				elif [ $phone = 2 ]
					then
						clear
							cat transportnos.txt
							read end
				elif [ $phone = 3 ]
					then
						clear
							cat advicenos.txt
							read end
				elif [ $phone = 4 ]
					then
						clear
							cat healthnos.txt
							read end
				elif [ $phone = 5 ]
					then
						clear
							cat taxinos.txt
							read end
				elif [ $phone = 6 ]
					then
						clear
							cat localnos.txt
							read end
				else
					clear
						echo ""
				fi
		elif [ $logType = 111 ]
			then
				clear
				echo "********************************"
				echo "Type 1 For Start Routine"
				echo "Type 2 For Stop Routine"
				echo "********************************"
				echo "Outstanding Tasks"
				echo "********************************"
				counter=1
				while read p; do
					if [ $p = 1 ]
						then
							# Done skip
							p=p
					else
						task=$(sed -n "$counter"p mornprog.txt)
						echo $task
					fi
					counter=$((counter+1))
				done <mornlist.txt
				morn_count=$(sed -n 1p task_count_am.txt)
				echo $message
				echo ""
				echo "Completed: "$morn_count" / 22"
				if [ $morn_count = 1 ]
					then
						completion=5
						message="Still some way to go..."
				elif [ $morn_count = 2 ]
					then
						completion=10
						message="Still some way to go..."
				elif [ $morn_count = 3 ]
					then
						completion=15
						message="Still some way to go..."
				elif [ $morn_count = 4 ]
					then
						completion=20
						message="Making progress..."
				elif [ $morn_count = 5 ]
					then
						completion=25
						message="Making progress..."
				elif [ $morn_count = 6 ]
					then
						completion=30
						message="Making progress..."
				elif [ $morn_count = 7 ]
					then
						completion=35
						message="Making progress..."
				elif [ $morn_count = 8 ]
					then
						completion=40
						message="Doing great..."
				elif [ $morn_count = 9 ]
					then
						completion=45
						message="Doing great..."
				elif [ $morn_count = 10 ]
					then
						completion=50
						message="Over half way there..."
				elif [ $morn_count = 11 ]
					then
						completion=55
						message="Over half way there..."
				elif [ $morn_count = 12 ]
					then
						completion=60
						message="Over half way there..."
				elif [ $morn_count = 13 ]
					then
						completion=65
						message="Over half way there..."
				elif [ $morn_count = 14 ]
					then
						completion=70
						message="Reaching the finish line..."
				elif [ $morn_count = 15 ]
					then
						completion=75
						message="Reaching the finish line..."
				elif [ $morn_count = 16 ]
					then
						completion=80
						message="Reaching the finish line..."
				elif [ $morn_count = 17 ]
					then
						completion=85
						message="Almost there dude..."
				elif [ $morn_count = 18 ]
					then
						completion=90
						message="Almost there dude..."
				elif [ $morn_count = 19 ]
					then
						completion=95
						message="Almost there dude..."
				elif [ $morn_count = 20 ]
					then
						completion=95
						message="Almost there dude..."
				elif [ $morn_count = 21 ]
					then
						completion=95
						message="Almost there dude..."
				elif [ $morn_count = 0 ]
					then
						completion=0
						message="Not Started Yet."
				else
					completion=100
					message="You did it! Nice job dude!"
				fi
				echo "Completion %: "$completion"%"
				# Write completion %
				rm amprogress.txt
				touch amprogress.txt
				echo $completion >> amprogress.txt
				echo "***$message***"
				timeleft=$(sed -n 1p timeleft.txt)
				echo "Time Left: "$timeleft" minutes"
				echo "Legend;"
				echo "(E) = Essential"
				echo "(NE) = Non-Essential"
				no_duration
				read l
				if [ $l = 1 ]
					then
						generate_time_stamp
						epoch=$(date +%s)
						rm amstart.txt
						touch amstart.txt
						echo $epoch > amstart.txt
						echo $timestamp: "Task : AM Routine Started" >> Master_Task_Log.txt
				elif [ $l = 2 ]
					then
						generate_time_stamp
						epoch=$(date +%s)
						amstart=$(sed -n 1p amstart.txt)
						amduration=$(($epoch-$amstart))
						secs=$amduration
						amduration=$(printf '%dh:%dm:%ds\n' $(($secs/3600)) $(($secs%3600/60)) $(($secs%60)))
						echo $timestamp: "Task : AM Routine Finished : "$amduration" Seconds" >> Master_Task_Log.txt
				fi
		elif [ $logType = 1162 ]
			then
				# Quick Option #2 Tidying Room
				quick_log_task="Tidying Room"
				quick_log
		elif [ $logType = 1165 ]
			then
				# Quick Option #5 Working
				quick_log_task="Working"
				quick_log
		elif [ $logType = 1166 ]
			then
				# Quick Option #6 Shopping
				quick_log_task="Shopping"
				quick_log
		elif [ $logType = 1167 ]
			then
				# Quick Option #7 Preparing Food
				quick_log_task="Preparing Food"
				quick_log
		elif [ $logType = 1168 ]
			then
				# Quick Option #8 Making My Bed
				quick_log_task="Making My Bed"
				quick_log
		elif [ $logType = 1169 ]
			then
				# Quick Option #9 Surfing The Internet
				quick_log_task="Surfing The Internet"
				quick_log
		elif [ $logType = 11611 ]
			then
				# Quick Option #11 Facebook
				quick_log_task="Facebook"
				quick_log
		elif [ $logType = 11612 ]
			then
				# Quick Option #12 Phone Call / Skype
				quick_log_task="Phone Call / Skype"
				quick_log
		elif [ $logType = 11613 ]
			then
				# Quick Option #13 Scripting
				quick_log_task="Scripting"
				quick_log
		elif [ $logType = 11614 ]
			then
				# Quick Option #14 Break
				quick_log_task="Break"
				quick_log
		elif [ $logType = 11616 ]
			then
				# Quick Option #16 Using Computer
				quick_log_task="Using Computer"
				quick_log
		elif [ $logType = 11617 ]
			then
				# Quick Option #17 Washing Pots
				quick_log_task="Washing Pots"
				quick_log
		elif [ $logType = 11618 ]
			then
				# Quick Option #18 Lighting Candle
				quick_log_task="Lighting Candle"
				quick_log
		elif [ $logType = 11619 ]
			then
				# Quick Option #19 Filling Up Water Bottles
				quick_log_task="Filling Up Water Bottles"
				quick_log
		elif [ $logType = 11620 ]
			then
				# Quick Option #20 Chatting
				quick_log_task="Chatting"
				quick_log
		elif [ $logType = 11622 ]
			then
				# Quick Option #22 Opening Window
				quick_log_task="Opening Window"
				quick_log
		elif [ $logType = 11623 ]
			then
				# Quick Option #23 Emptying Trash
				quick_log_task="Emptying Trash"
				quick_log
		elif [ $logType = 11626 ]
			then
				# Quick Option #26 Boiling Kettle
				quick_log_task="Boiling Kettle"
				quick_log
		elif [ $logType = 11628 ]
			then
				# Quick Option #28 Private Time
				quick_log_task="Private Time"
				quick_log
		elif [ $logType = 11111 ]
			then
				# Quick Option #11111 Cat Task Log
				filename="Master_Task_Log.txt"
				cat $filename
				echo "********************************"
				echo "Press the Return Key to Confirm Exit."
				echo "********************************"
				read exiting
		elif [ $logType = 115111 ]
			then
				# Quick Option #11511 Self Care Routine
				echo "Did You Apply Lip Balm?"
				echo "Type 1 to Skip"
				read didyou
				if [ $didyou = 1 ]
					then
						echo "Skipped"
				else
						quick_log_task="Applying Lip Balm"
						quick_log
				fi
				echo "Did You Use Nasal Inhaler?"
				echo "Type 1 to Skip"
				read didyou
				if [ $didyou = 1 ]
					then
						echo "Skipped"
				else
						quick_log_task="Nasal Inhaler"
						quick_log
				fi
				echo "Did You Clean Your Hands?"
				echo "Type 1 to Skip"
				read didyou
				if [ $didyou = 1 ]
					then
						echo "Skipped"
				else
						quick_log_task="Cleaning Hands"
						quick_log
				fi
				echo "Did You Drink Bovril?"
				echo "Type 1 to Skip"
				read didyou
				if [ $didyou = 1 ]
					then
						echo "Skipped"
				else
						echo "How Much Did You Drink?"
						read measure
						generate_time_stamp
						echo $timestamp: "Task : Drinking Beverage - Bovril : "$measure"ml" >> Master_Task_Log.txt
						dailyamount=$(sed -n '1p' water_measure.txt)
						total=$((measure+$dailyamount))
						rm water_measure.txt
						echo $total > water_measure.txt
				fi
				echo "Did You Eat Glucose?"
				echo "Type 1 to Skip"
				read didyou
				if [ $didyou = 1 ]
					then
						echo "Skipped"
				else
						quick_log_task="Taking Glucose"
						quick_log
				fi
				echo "Did You Protein?"
				echo "Type 1 to Skip"
				read didyou
				if [ $didyou = 1 ]
					then
						echo "Skipped"
				else
						quick_log_task="1.7g Protein"
						quick_log
						dailycalorie=$(sed -n 1p dailycal.txt)
						dailycalorie=$((30+$dailycalorie))
						rm dailycal.txt
						touch dailycal.txt
						echo $dailycalorie >> dailycal.txt
				fi
				echo "Did You Blot?"
				echo "Type 1 to Skip"
				read didyou
				if [ $didyou = 1 ]
					then
						echo "Skipped"
				else
						quick_log_task="Blotting"
						quick_log
				fi
				rm self_care_time.txt
				touch self_care_time.txt
				
				# Get current time
				epoch=$(date +%s)
				
				# Add one hour
				epoch=$((epoch+3600))
				
				# Write time to file
				echo $epoch >> self_care_time.txt
				
				# Increment self care count
				selfcarecount=$(sed -n '1p' selfcarecount.txt)
				selfcarecount=$(($selfcarecount+1))
				echo $selfcarecount > selfcarecount.txt
		elif [ $logType = 1154 ]
			then
				# Quick Option #1154 Blotting
				quick_log_task="Blotting"
				quick_log
		elif [ $logType = 1153 ]
			then
				# Quick Option #1153 Nasal Inhaler
				quick_log_task="Nasal Inhaler"
				quick_log
		elif [ $logType = 1155 ]
			then
				# Quick Option #1155 Cleaning Hands
				quick_log_task="Cleaning Hands"
				quick_log
		elif [ $logType = 1157 ]
			then
				# Quick Option #1157 Taking Glucose
				quick_log_task="Taking Glucose"
				quick_log
		elif [ $logType = 1159 ]
			then
				# Quick Option #1159 Eating Sweet/Mint/Gum
				quick_log_task="Eating Sweet/Mint/Gum"
				quick_log
		elif [ $logType = 395 ]
			then
				# Quick Option #395
				quick_log_task="Arriving Home"
				quick_log
		elif [ $logType = 392 ]
			then
				# Quick Option #392
				quick_log_task="Walking"
				quick_log
		elif [ $logType = 393 ]
			then
				# Quick Option #393
				quick_log_task="Waiting"
				quick_log
		elif [ $logType = 3941 ]
			then
				# Quick Option #3941 Boarding Bus
				quick_log_task="Boarding Bus"
				quick_log
		elif [ $logType = 3942 ]
			then
				# Quick Option #3942 Deboarding Bus
				quick_log_task=" Deboarding Bus"
				quick_log
				quick_log_task=" Walking"
				quick_log
		elif [ $logType = 222 ]
			then
				clear
				echo "********************************"
				echo "Type 1 For Start Routine"
				echo "Type 2 For Stop Routine"
				echo "********************************"
				echo "Outstanding Tasks"
				echo "********************************"
				counter=1
				while read p; do
					if [ $p = 1 ]
						then
							# Done skip
							p=p
					else
						task=$(sed -n "$counter"p eveprog.txt)
						echo $task
					fi
					counter=$((counter+1))
				done <evelist.txt
				eve_count=$(sed -n 1p task_count_pm.txt)
				echo ""
				echo "Completed: "$eve_count" / 19"
				if [ $eve_count = 1 ]
					then
						completion=5
						message="Still some way to go..."
				elif [ $eve_count = 2 ]
					then
						completion=10
						message="Still some way to go..."
				elif [ $eve_count = 3 ]
					then
						completion=15
						message="Still some way to go..."
				elif [ $eve_count = 4 ]
					then
						completion=20
						message="Making progress..."
				elif [ $eve_count = 5 ]
					then
						completion=25
						message="Making progress..."
				elif [ $eve_count = 6 ]
					then
						completion=30
						message="Making progress..."
				elif [ $eve_count = 7 ]
					then
						completion=35
						message="Making progress..."
				elif [ $eve_count = 8 ]
					then
						completion=40
						message="Doing great..."
				elif [ $eve_count = 9 ]
					then
						completion=45
						message="Doing great..."
				elif [ $eve_count = 10 ]
					then
						completion=50
						message="Over half way there..."
				elif [ $eve_count = 11 ]
					then
						completion=55
						message="Over half way there..."
				elif [ $morn_count = 12 ]
					then
						completion=60
						message="Over half way there..."
				elif [ $eve_count = 13 ]
					then
						completion=65
						message="Over half way there..."
				elif [ $eve_count = 14 ]
					then
						completion=70
						message="Reaching the finish line..."
				elif [ $eve_count = 15 ]
					then
						completion=75
						message="Reaching the finish line..."
				elif [ $eve_count = 16 ]
					then
						completion=80
						message="Reaching the finish line..."
				elif [ $eve_count = 17 ]
					then
						completion=85
						message="Almost there dude..."
				elif [ $eve_count = 18 ]
					then
						completion=90
						message="Almost there dude..."
				elif [ $eve_count = 19 ]
					then
						completion=95
						message="Almost there dude..."
				elif [ $eve_count = 20 ]
					then
						completion=95
						message="Almost there dude..."
				elif [ $eve_count = 21 ]
					then
						completion=95
						message="Almost there dude..."
				elif [ $eve_count = 0 ]
					then
						completion=0
						message="Not Started Yet."
				else
					completion=100
					message="You did it! Nice job dude!"
				fi
				echo "Completion %: "$completion"%"
				# Write completion %
				rm pmprogress.txt
				touch pmprogress.txt
				echo $completion >> pmprogress.txt
				echo "***$message***"
				timelefteve=$(sed -n 1p timelefteve.txt)
				echo "Time Left: "$timelefteve" minutes"
				echo "Legend;"
				echo "(E) = Essential"
				echo "(NE) = Non-Essential"
				read l
				if [ $l = 1 ]
					then
						generate_time_stamp
						epoch=$(date +%s)
						rm pmstart.txt
						touch pmstart.txt
						echo $epoch > pmstart.txt
						echo $timestamp: "Task : PM Routine Started" >> Master_Task_Log.txt
				elif [ $l = 2 ]
					then
						generate_time_stamp
						epoch=$(date +%s)
						pmstart=$(sed -n 1p pmstart.txt)
						pmduration=$(($epoch-$pmstart))
						secs=$pmduration
						pmduration=$(printf '%dh:%dm:%ds\n' $(($secs/3600)) $(($secs%3600/60)) $(($secs%60)))
						echo $timestamp: "Task : PM Routine Finished : "$pmduration" Seconds" >> Master_Task_Log.txt
				fi
				no_duration
		elif [ $logType = 333 ]
			then
				clear
				echo "********************************"
				echo "Outstanding Tasks"
				echo "********************************"
				counter=1
				while read p; do
					if [ $p = 1 ]
						then
							# Done skip
							p=p
					else
						task=$(sed -n "$counter"p weprog.txt)
						echo $task
					fi
					counter=$((counter+1))
				done <welist.txt
				we_count=$(sed -n 1p task_count_we.txt)
				echo ""
				echo "Completed: "$we_count" / 27"
				timeleftwe=$(sed -n 1p timeleftwe.txt)
				echo "Time Left: "$timeleftwe" minutes"
				no_duration
				read l
				no_duration
		elif [ $logType = 444 ]
			then
				clear
				generate_time_stamp
				echo "********************************"
				echo "You Have Selected Option 444."
				echo "The Current Time Is: "$timestamp
				echo ""
				echo "Please Make Your Selection"
				echo "********************************"
				common_task_history
				read common_task
				common_task_history_choice
				trim=$common_task
				leading_space_trim
				common_task=$trim
				title=$common_task
				TitleCaseConverter
				common_task=$title
				generate_time_stamp
				if [ "$common_task" != "" ]
					then
						echo $timestamp: "Album :" $common_task >> Master_Task_Log.txt
						# Record to current music file
						rm current_task.txt
						touch current_task.txt
						echo $common_task >> current_task.txt
						# Add to last ten albums
						rm current_task_temp.txt
						touch current_task_temp.txt
						echo $common_task >> current_task_temp.txt
						counter=1
						while read p; do
							echo $p
							if [ $counter = 20 ]
								then
									echo "Skip This!"
							break
						fi
						echo $p >> current_task_temp.txt
						counter=$($counter+1)
						done <current_task_log.txt
						rm current_task_log.txt
						cp current_task_temp.txt current_task_log.txt
						rm current_task_temp.txt
						no_duration
				fi
		elif [ $logType = "exit" ]
			then
				no_duration
				exit 1
	else
		no_duration
	fi
done