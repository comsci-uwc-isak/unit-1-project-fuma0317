![CarRental](logo.png)

Car Rental Minimal App
===========================

A car rental management minimal app in Bash.

Contents
-----
  1. [Planning](#planning)
  1. [Design](#design)
  1. [Development](#development)
  1. [Evalution](#evaluation)

Planning
----------
** Defining the problem (Topic 1.1.1)**
100-150 words explaining the context of the problem

I felt before we make this app, we should identify what does "simple based program". I mean to what extent should it be simple.   Unless we identify the world, programmer might be struggling how to simplify the code.

Secondable, when you correct the trip history with the place name, the data probably become wrong because in the case that customers uses a ferry to go across the ocean and park your car on it, the distance might be diffrent from actual one.

Third, if you want to make the file deletable, you should make a autmatical back-up system which automatically save the data after you edit it. 

### Solution proposed
Rationale for proposed solution

I decided that choosing bash would be the best solution for Car rental app because bash is a kind of shells cript and it can be made in terminal which is really familiar with us and also even if you use windows you can download it easily.
And it is easy to understand the structure for beginners.


### Success Criteria
This are measurable outcomes
1. A car can be created and stored in the database 
1. A car information can be edited 
1. A car can be deleted from the database
1. The installation is ***simple-> one step process***.
1. A summary (total/average distance traveled) can be generated for a particular car
1. Trips can be recorded and stored for an existing car
1. A basic database system is implemented
1. A basic backup functionality is avialable.

Design
---------
### First sketch of the system
![systemDiagram](IMG_2213.JPG)

Development
--------
### 1. Script to install the app
The following script creates the folder structure

**Create

1. get input
1. Check nuumber of arguments 
    if 4 then continue, if not exit "message"
1. Write to main file with one extra line.   Not erasing other Entries.
1. Create car trip file with License plate.txt


Evaluation
-----------
Test 1:
First run of the test file was unsuccessful because the Database folder was not existent.  
Also the create program did not store the license file inside the Database folder.  Changing the line `echo " " > $license.txt to `echo 
```.sh
cd ../
```
This is necessary because the `create.sh` resides in the ain folder whereas the test file is inside the /tests folders.
To check that the car was created in the main file (maincarfile.txt), the folowing command is used `lastLine = $( tail -n 1 Database/maincarfile.txt )` which is used for setting the last line at the end of the file in valuable.
`""` is used for recognizing itself as one sentence

**Summary:** 
What types of test we did today is that White-box testing.  We firstly create the demo file for testing and then create the program for checking if the file exists or not. And after that, check if the car file was actually added to to the main file by comparing the last line of main file and content of car file.   



