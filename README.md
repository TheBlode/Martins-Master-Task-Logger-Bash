# Martin's Master Task Logger (Bash)
Welcome to Martin's Master Task Logger! A task logger application that can help you track and log tasks to improve your life.

This wonderful script (or plebeian script, depending on your outlook on life) allows you to log most aspects of your existence.

# Why

I'm a grown man with Asperger Syndrome. Part of my condition is the incessant need for information and in the case of this script, information about myself and my activities.

# License

- GNU GPL

# Dependencies

- Bash Shell (available in most Linux distributions and now available in Windows 10).
- Busybox (if running on Android 4.4).
- 1MB of hard disk space.

# Usage

To use Martin's Master Task Logger (MMTL for short...doesn't quite have a ring to it though does it), use the following syntax;

```bash Master.sh```

OR

```bash /path/to/file/Master.sh```

OR

```./Master.sh```

OR

```./path/to/file/Master.sh```


# Types of Task Logging

Type 1 for Task Log - this is the main task logger function. It allows you to log custom tasks and has a submenu consisting of;
- morning routine tasks
- evening routine tasks
- daily routine tasks (currently not implemented)
- weekend routine tasks
- self care routine tasks
- common tasks

Type 111 for Morning Routine Progress - check your morning routine progress.

Type 222 for Evening Routine Progress - check your evening routine progress.

Type 333 for Weekend Routine Progress - check your weekend routine progress.

Type 444 for Common Tasks - not currently implemented.

Type 2 for Music Log - if you're listening to some rockin' tunes or epic albums, you can log the task using this function.

Type 3 for TV/Movie Log - if you're watching TV or a movie, you can log the task using this function.

Type 4 for Radio Log - if you're listening to the radio, you can log the task using this function.

Type 5 for Thoughts/Ideas Log - got a thought or idea? Don't let it slip away like I usually do (well before I had this function). Collate all your golden ideas and all your thoughts for deep analysis later on.

Type 6 for Underwear Tracker - you may laugh at this BUT...it's really handy keeping track of your underwear. You know exactly when to start a laundry cycle and optimize your washing machine usage.

Type 7 for Water Tracker - gotta stay hydrated dude! Use this to keep track your daily water intake.

Type 8 for Alarm Tones (Not Working) - not currently implemented.

Type 9 for To-Do List - lists are a great resource for me in maintaining structure in my life. Here you can log to-do items. These carry over day to day.

Type 10 for Meal Tracker - record what you've eaten. Handy to track your diet and what you're eating so you can improve it where necessary. Logging for breakfast, takeaway, Huel, snacks, lunch, dinner and cereals.

Type 11 for Task Log Output - this function allows you to output content from your master task log. You can;

- fetch the last 10 tasks
- output the entire task log
- go through the contents slowly
- search for tasks
- make a backup of your tasks file
- output task type log

Type 12 for Sleep Tracker - log your sleep times. Great if you want to analyse and report off of the times to improve your sleep patterns. It also has an alarm clock generator to allow you easily set your alarm clock based on how many hours of sleep you personally need. The function also adds an extra 15 minutes for you as a bonus! ;)

Type 13 for Shopping List - allows you to create and manage shopping lists. If you're a list fr3ak like me, this is a dream come true. You add stuff to it and tick them off as you shop. Very handly.

Type 14 for New Day - this function will reset and initialise all the daily files used within the task logger script. It is recommended that you run this function when a new day begins (soon after you wake up).

Type 15 for Music Randomizer - stuck for ideas on what to listen to? This function will serve you a random album from your music collection. Just populate `albums.txt` with your favourite artists or albums and it'll generate a good one for you to listen to (or maybe a bad one, depending on your taste).

Type 16 for Time Logger - this function allows you to log time for events that happen quite regularly, such as haircut appointments or dentist visits.

Type 17 for Post Task Logger - this function is used to add tasks after they have occurred say if you forgot to log it. This can be used for the current day's tasks or the previous day's tasks.

Type 18 for Quote Generator - this function will give you a random quote...to inspire or to impress your cohorts! Generate a quote and sound super intellectual (hopefully something smart comes out!). You can add your own quotes to `quotes.txt`. There are just over 2000 quotes preloaded into the file.

Type 19 for Weight Tracker - keep track of your weight. Handy if you're looking to get your weight to an optimal level. This function include other functions too;
- BMI calculation
- steps counter
- blood pressure logging

Type 20 for Day Planner - this is a comprehensive day planner for your entire week. It's split into 30 minute slots to allow you to squeeze as much out of your day as possible.

Type 21 for Possessions Tracker - 

Type 22 for The Magic Eight Ball - this function serves the classic 80s toy, Magic Eight Ball! If you ever had a burning question that you were too scared to ask anyone else about...ask the Magic Eight Ball! You can add your own responses to `magiceightballresponses.txt` but you get the default ones from the original toy.

Type 23 for Depression & Anxiety - this function allows you to log your mood and your state of mind. This isn't a perfect system but it's the only one I could invent that worked for me. Levels are measured on a scale of 1 (1 being the most mild level or lowest level) to 10 (10 being the most extreme level or the highest level). For example, Anger Level: 1 would be not angry at all and Anger Level: 10 would be exploding brain angry!

Type 24 for Coin Flipper - ever get indecisive? I do. All the dang time! Nice coin flip function for you.

Type 25 for Inspiration - if you're like me, you may sometimes get stuck for inspiration. This function will serve up an inspirational quote in the hope that it will inspire you to be a better person, live a better life or just accomplish whatever you need to for that day. You can add your own inspirational quotes to `inspiration.txt`.

Type 26 for Cash Tracker - keep track of the cash in your pocket and the cash in your bank! Nice handy view for it without using your data.

Type 27 for Day Calculator - this function will add days, subtract days and produce a countdown...all within Bash! NB: for this function to work, the `daysconvert.txt` must be updated every year.

Type 28 for Name Generator - this function produces a random name. I have a thing that has to do with echolalia (I think) where I compulsely will say random names in a weird sounding way...so if you like random words and names, this is for YOU! You can add names by editing `names.txt`.

Type 29 for Word Of The Day - this function generates a random word of the day. Nice if you like to learn new words. You can add your own words to `words.txt`. Currently, there are 780 words in this file.

Type 30 for Remove Last Task - this function allows you to remove the last task from the task logger script. Handy if you logged something by accident or something you didn't end up doing.

Type 31 for Small Talk - this function is great for people like me with ASC. It's not perfect, but it can generate small talk topics you can use in interviews or other social situations. You can add your own small talk things in `smalltalk.txt`

Type 32 for Verbal Script - this function is great for people with ASC. We have a tendency to be not so good in social communication so using a script is very usable for most of us. Here, you can write your own script for the day's interactions.

Type 33 for Battery Tracker - 

Type 34 for Joke Generator - a function used to generate jokes! I am humour impaired...but reading through some of these randomly generated jokes is interesting and I even learn a thing or two! NB: some jokes may be of an adult nature. There are 900 jokes built in and you can add jokes to the generator by editing `jokes.txt`

Type 35 for Bags Tracker - allows you to log the contents of your bag...so you can make sure you have the necessary equipment with you at all times. You can also use this to assess missing or stolen items from your bag. Currently supports 2 individual bags.

Type 36 for Calorie Tracker - this function allows you to count calories per day. Great if you're trying to curb your calorie intake.

Type 37 for Appointments - keep track of appointments and meetings.

Type 38 for Stats Tracker - a convenient tracker to track daily statistics including water intake, toilet breaks (gross...sorry), morning and evening routine progress, calorie intake, task count and self care routine count.

Type 39 for Travel Tracker - a function used to log travelling tasks such as walking, boarding and deboarding the bus, travelling to a destination and arriving home.

Type 40 for Game Randomizer - if you're feeling indecisive or you're indecisive by nature (like myself...hmpf) then you can use the function to generate a random game for you to play. To use this function, populate `games.txt` with a list of your own games...and be indecisive no more!

Type 41 for Phone Numbers - you can view lots of local numbers at a glance on the app itself. These numbers you can program in yourself by editing any one of the following files;
- advicenos.txt for Advice Numbers
- emergencynos.txt for Emergency numbers
- healthnos.txt for Health numbers
- localnos.txt for Local Service numbers
- taxinos.txt for Taxi numbers
- transportnos.txt for Transport numbers
