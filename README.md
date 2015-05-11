# mood_music

NSS Cohort 8 Ruby capstone project

# Project Vision
This is a simple command line program written in Ruby.
A user can input their mood and the program will recommend a song based
on the mood category.

# Features

## Adding a song recommendation
User is prompted with questions - to which they can type in their answer

```
  > ./mood_music manage
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


## Editing a song recommendation
```
  > ./mood_music manage
  1. Add song recommendation
  2. List song recommendations
  3. Exit
  > 2
  1. Elephant by Tame Impala HAPPY
  2. Last Resort by Papa Roach HAPPY
  3. Jolene by Dolly Parton SAD
  > 2
  What would you like to do:
  a. Edit recommendation
  b.  Delete recommendation
  > a
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

## Deleting a song recommendation
```
  > ./mood_music manage
  1. Add song recommendation
  2. List song recommendations
  3. Exit
  > 2
  1. Elephant by Tame Impala HAPPY
  2. Last Resort by Papa Roach ANGRY
  3. Jolene by Dolly Parton SAD
  > 2
  What would you like to do:
  a. Edit recommendation
  b.  Delete recommendation
  > b
  Your song recommendation has been deleted.
```
* When user lists entries and then enters the corresponding entry
  number, user is prompted about whether they want to edit.  Upon a "no"
  answer, the user is prompted to delete entry.

## Viewing list of song recommendations

If no data/recommendations exist in database:

```
  > ./mood_music manage
  1. Add song recommendation
  2. List song recommendations
  3. Exit
  > 2
  No recommendations found.
  ```

Otherwise:

```
  > ./mood_music manage
  1. Add song recommendation
  2. List song recommendations
  3. Exit
  > 2
  1. Elephant by Tame Impala HAPPY
  2. Last Resort by Papa Roach ANGRY
  3. Jolene by Dolly Parton SAD
```

## Getting a recommendation
```
  > ./mood_music recommend
  What is your mood today?
  1. happy
  2. sad
  3. mellow
  4. angry
  > 1
  I recommend the song Elephant by Tame Impala based on your happy mood.
```


