# Linux Shell
---

* In this course you will learn how to make your work more effiecient. You will learn how to navigate the linux os by basic command line inputs and also where to find help when you don't know how to do something. Linux shell has many terms, but its all just working in a text interface. There are different flavors of shells, but all the concepts are the same. In this course we will use bash shell. 


**Topics**
1. Navigation
    * terminal window, file permissions and content of a directory
    * changing file permissions

2. File Operations
    * view fields (cat, less, tail, head)
    * edit files (nano, touch)

3. File Management
    * copy, move, and remove files
    * symbolic links
<br>
4. Pipelines
<br>
5. Redirects


### Notes
---

**Man Page**
`man #command` This will pull up a help page that tells you all about the options you can use
with the command you are trying to use


**File Permissions**
* Find file permission with ```ls -a -l```

```drwxr-xr-x+```. First group represents permissions
    drw = write 
    x = executable 
    r = read 

Second group represents permissions to other users on the system. 

```jonathanphouminh  staff      1824 Feb 22 10:02 <fileName>``` This information tells us the owner
and the group as well as the file size. 


**Navigating File System**

`/`: This is the root directory, that is followed by the sub paths
`mkdir`: Creates a new folder
`mkdir`: Deletes a folder (must be empty)
`cd`: "change directory" 
`touch`: create new file


**Navigating Command Line**
`ctrl-r`: Lets you search the history of commands you inputted
`ctrl-a`: Take you to the first spot in your current command
`ctrl-e`: Take you to the last spot in your current command





## Shell Scripts
---
* All bash scripts start of the shebang, it just tells the console where the script binaries are located

```#!/bin/sh```


```*.sh```: This is the executables. 


* To exectute the bash script just type ```./<scriptName>```. Shell scripts by default don't have executable permission so any script you create you need to change the file permissions
    * ```chmod +x <scriptName>```: makes this executable for everyone
    * ```chmod u+x <scriptName>```: makes this executable for only the user


**Bash Commands**
    * ```echo```: This is the print statement of bash


**File Viewing**
    * ```cat```: Prints contents of files. Useful for printing small files and piping outputs. Alternative source to view larger files is with ```less```. It pulls you into separate area in the terminal for viewing. Search files by typing ```/<what you want>``` and it will highlight all the stuff ahead of your current location in the file. Similarly to search all items before you location just use ```?<what you want>```. There is also the alternative to that is ```more```
    ```head / tail```: These will print the first / last 10 lines of a file we specify. We can specify how many lines we want to print by adding the ```-n #Number```. These are useful for printing this like error reports as errors usually sit at the end. 


**File Editing**
* Use text editors to create your source files.
* ```cp #this #tohere```. You can also use wildcards to move more than one. ```run*.sh subl/``` This copies all bash files starting with sh the subl directories
* ```mv run*.sh sub/run2.sh```. This moves all bash files that start with run to the directory and renames it at the same time. 
    *   Moving directories is similary, we just need to specify to move all its subdirectoes with the -r flag (recursive).



**Creating Symbolic Links**: 
* Think of these as reference to certain files. For example, if we have different versions of scripts that we want to interchangable use without having to change our script calling routine we can just map the sym-links to whatver versions script we want

**Symbolic Links**: These help manipulate file names without changing the original files. Useful for dealing with versions of libraries or you just have many different executables.


```ln -s #file #symbolic-link```. To change the link we just remove the link than run the previous command.
```rm run-link.sh``` or if you don't want to remove it then do ```ln -sf #newVersion #previousSymbol```



**find**
* This is a very powerful command. The first paremeter defines the path that we will start searching down recursively. Then we can specify options such as name and specify a pattern

```find ./ -name '*.sh'```. This is saying to go and find all the files that have bash extenstions starting with the patter ```./```

* We can also use this command to find directory

```find . -type d```: I am only interested in results that are directories
```find . -type l```: I am only interested in results that are symbolic links
```find . -type d -exec ls -l {} \;``` : For every output of the first command, I want to execute the ls -l commnad. The ```\``` is an escape character; So we can chain commands. 


**LINUX PIPELINES**

* This is a very important concept as we start to deal with large files that would give outputs that would otherwise not be useful to look at on the terminal. With pipelines we can chain commands together and pass the results along to each other. 

* We simply pipe along commands by chaining them together with ```|```. 
* When we are piping commands, we are just filtering down the data and getting the information that we want. 
* Its important to also know some regex because it will help you filter down data. 
* Its a good idea to construct pipelines command by command, to make it so you don't have to always type everything just put them all in scripts. 
<em> Some cool examples </em>
```
  689  cat people_store_visits.csv | less | sort | less
  690  cat people_store_visits.csv | cut -d ',' -f1
  691  cat people_store_visits.csv | cut -d ',' -f1,2,3

  cat people_store_visits.csv | cut -d ',' -f1 | sort | uniq
  cat people_store_visits.csv | wc -l
  cat people_store_visits.csv | wc -c


  // using the grab command to filter specifc data with GREP
  cat people_store_visits.csv | grep "Bob"
  cat people_store_visits.csv | grep "Bob\|Jane" | sort

  cat people_store_visits.csv | grep "Bob\|Jane" | grep Aldi

  cat people_store_visits.csv | grep "Bob\|Jane" | grep -v Aldi  <-- This is the inverse 
```


**Output Redirecting**
* When we execute big pipelines we will mostlikely want to redirect them to a file

Copying a file into another one, but not the permissions
```
    cat run.sh > run2.sh
```

We can append using the double '>' symbol

```
 713* cat run1.sh > Output.sh | echo "=====" >> Output.sh | cat firstScript.sh >> Output.sh
  714  cat Output.sh 
```

* Just remember that in this case since we outputted to another bash script we must also change the permissions

If we want to disregard shell output
```
    # this path in the file system is where all the ignored shit goes. 
    ./run2.sh > /dev/null 
```

* There are also two different output file paths, stdout / stderror
    * 1 is the stdout stream, 2 is the stderror stream
    * redirect like this ```2>&1``` where this tells us to redirect all stderr to the stdout also. 

examples, the source code has the actual specific output details, but this is how you run it
```
    ./firstScript.sh > noError.log 
    ./firstScript.sh > noError.log 2>&1
```