# mood_music

NSS Cohort 8 Ruby capstone project

# Project Vision
This is a simple command line application that will track a user's
physical and mental health on daily basis. The user can add/edit/delete
entries.  A daily entry will consist of mood, sleep, and time spent exercising.

# Features

## Adding an entry
User is prompted with questions - to which they can type in their answer

```
  > ./health_tracker manage
  1. Add song recommendation
  2. List song recommendations
  3. Exit
  > 1
  What is song title?
  > Elephant
  Who is artist of song?
  > Tame Impala
  How would you classify the feel of this song?
  1. happy
  2. sad
  3. mellow
  4. angry
  > 1
  Your song recommendation has been saved.
  ```
Acceptance Criteria:
* Confirmation that entry has been saved to database
* There are three questions asked


## Editing an entry
```
  > ./health_tracker manage
  1. Add health entry
  2. List past entries
  3. Exit
  > 2
  1. Elephant by Tame Impala HAPPY
  2. Last Resort by Papa Roach HAPPY
  3. Jolene by Dolly Parton SAD
  > 2
  Would you like to edit entry 2? [y/n]
  > y
  Update song title? [y/n]
  > n
  Update song's artist? [y/n]
  > n
  Update mood category? [y/n]
  > y
   How would you classify the feel of this song?
  1. happy
  2. sad
  3. mellow
  4. angry
  > 4
  Your song recommendation has been saved.
 ```
Acceptance Criteria:
* Confirmation that entry has been edited successfully
* When user lists entries and then enters the corresponding entry
  number, user is prompted about whether they want to edit

## Deleting an entry
```
  > ./health_tracker manage
  1. Add health entry
  2. List past entries
  3. Exit
  > 2
  1. Elephant by Tame Impala HAPPY
  2. Last Resort by Papa Roach ANGRY
  3. Jolene by Dolly Parton SAD
  > 2
  Would you like to edit entry 2? [y/n]
  > n
  Would you like to delete entry 2? [y/n]
  > y
  Your song recommendation has been deleted.
```
* When user lists entries and then enters the corresponding entry
  number, user is prompted about whether they want to edit.  Upon a "no"
  answer, the user is prompted to delete entry.

## Viewing user's data
```
  > ./health_tracker manage
  1. Add health entry
  2. List past entries
  3. Exit
  > 2
  1. Elephant by Tame Impala HAPPY
  2. Last Resort by Papa Roach HAPPY
  3. Jolene by Dolly Parton SAD
```
