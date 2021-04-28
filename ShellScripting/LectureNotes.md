# Linux Bash Scripting
--- 
## Vagrant
Command line tool that scripts how virtual machines are set up through default. This tool provides easy to configure and reproducable work environments. 

<u>Vagrant Boxes</u>
* ```vagrant box add [USER/BOX]``` its a configured VM image.
* Vagrant also supports entry to VMs via **SSH** 


<u>Vagrant Project</u>
* Consists of Vagrant project = Folder with vagrantfile

```
    mkdir vm1
    cd vm1

    // init the vagrant project, that contains the options we want for gm image 
    vagrant init jasonc/centos7
```
<br>

<u>Vagrant Commands</u>
```js
commands

vagrant                 // lists all vagrant options

vagrant halt [vm]      // stops the VM
vagrant up [vm]        // starts the vm
vagrant suspend [VM]    // suspends VM
vagrant resume [VM]     // resumes VM
vagrant destroy [VM]    // removes VM
```
* These commands take effect in the current vagrant directory. 


<u>The Vagrant Files</u>
* The simplest vagrant file would be to set the vm's name, but this is where we essentially create our vm init options

```js
Vagrant.configure(2) do |config|
    config.vm.box = "jasonc/centos7"
    config.vm.hostname = "linuxsvr1"
    config.vm.network "private_network", ip: "10.2.3.4"
    config.vm.provision "shell", path: "setup.sh"
end
```

The provision section is where we can specify the things we want to download and execute shell scripts we have written upon ```vagrant up```     


### Excercise One 
---
* Creates new Accounts
* Checks for proper privileges
* Report if account creation failed 
<br>
<u> Notes </u>
* The Shebang at the top of the script provides the path to the interpretter. ```#!/bin/bash``` denotes the bash interpretter and we can change this to be other interpretters like python if we wanted to.
* All new bash scripts must be updated with executable permissions or else you cant run them. ```chmod 755 [script name]```. You want 755

read = 4
write = 2
exe = 1 

Then sum up these numbers for local-group-everyone else 

* Check types of bash functions with ```type```. ex ```type echo```. You should always try to use built in shell methods. 
* Get the man page for each builtin with ```help [command]```. 
* Shell scripts are nothing but a list of scripts that get executed automatically so you don't have to type them one by one 

**Syntax**
```sh
echo  # print
VALUE='this' # variable assignment 

# Quotes matter when accessing
echo '$WORD'
echo "This is string interopulation $WORD"
```

### Exercise Two 
---
* Focus is Conditionals 
```sh
# Display the UID and the username of the user executing this script 
# Display if the user is root user or not

# Display UID
echo "Your UID is ${UID}"

# Display Username 
USER_NAME=`id -un`
echo "Your username is ${USER_NAME}"

# Display if user is root user or not 
if [[ "${UID}" -eq 0 ]]
then
 echo 'You are the root user'
else
 echo 'You are not the root'
fi

```

### Exercise Three
--- 
* Focuses is what to do with conditionals that fail and also how to handle exit statuses. 
* ```=``` when we look for an exact match
* ```==``` when we want to match via pattern 

```${?}``` Special variable that holds the exit status of the most recently used command


### Exercise Four
---
* User Input
* Create Users 
* Naming Conventions
* More quoting

* Putting something in quotes treats it as a single argument 
<em> All code snippets in the demos and exercise directory </em>

**User input**
1. Read built in shell command
``` read -p 'Type Something' MYVAR```
2. Accept arguments via command line



### AddUser_v1
--- 
**Goal**: Create a user that adds a user to the same linux system that the script is executed on. 

<em> List Users </em>: ```less /etc/passwd```





### Excercise 3
--- 
* Password Generation / Hashing
* Random Data
* Text / String manipuation 

```!v``` this takes you to vim of the most recent file you edited 

* Wrap commands you want to use in scripts with ```$()```


```shuf```: generates random permutations. "shuffle" the string


**Parameter**: variable that is being used inside the shell script
**Argument**: data that is being passed into the shell script

```${0}``` the name of the script itself and how we called it
```${1..}``` the passed in parameters from the user


**Shell Exeuction**: 
* If there exists a shell function by that name, that function is invoked
* If the name doesn't match then the shell searches for it in the shell 
built ins
* If the name is neither a shell function nor a builtin, and conains no slashes, **bash** searches each element of the PATH for a directory containing an executable file by that name.

```[vagrant@localhost vagrant]$ sudo cp commandArg.sh /usr/local/bin/```, Now we don't have to specify the path to the program as bash looks here automatically. So if you want to store a script inside the path environment you need to put it in the environment variables so that bash can find it in there, otherwise to execute you must specify the entire path to the executable. 



**PATH VARIABLES**: This is a list of directories that bash will look for executable scripts in. If you had a script on your desktop and you didn't want to always specify calling with the direct path then you could add the script to the PATH so that it will automatically be searched here

```which```: shows you where that program or script you are calling is being called from

example
```which head``` prints ```/usr/bin/head```, this means that bash will execute a program called ```head``` located in this directory.

```which -a head```: this will list out all matching programs that bash finds


**Special Parameters**
* There are list of special bash parameters that return metadata. ```#``` returns the number of command line arguments. ```UID```: returns the current users ID. 



**For loops**
```
for X in Frank Claire Doug
do
 echo "Hi ${X}." 
done
```


**While Loops/InfiniteLoops/Shifting/Sleeping**
* Sleep command blocks the process for specified time
```
# while loop through parameters
echo 'looping through params'
ARGS=${@}
X=1

# shift moves all positional arguments down one index, so you pick each element up at index 1
while  [[ ${#} -ne 0 ]]
do
 echo "Number of Parameters: ${#}"
 echo "Next Arg: ${1}"
 shift
done
```
<br>

### Standard Input/Output , Standard Error
--- 
**Standard Input**: Input that comes from your keyboard. Doesn't have to come from keyboard you can also pipe it from commands such as ```echo ${PASSWORD} | passwd --stdin ${USER_NAME}```
**Standard/Error Output**: These are by default displayed to user.

```>```: redircts content, overwrites if already exist otherwise creates the file

```>>```: appends instead of overwriting existing content. 


**stderr/ stdout**

All output is by default sent to stdout 
```head -n1 /etc/passwd /etc/hosts /fakefile > head.out ```

I want all output put in head.out but all errors (2) to go to head.err
```head -n1 /etc/passwd /etc/hosts /fakefile >head.out  2> head.err```

I want all error and output to go to the same place

old way
```head -n1 /etc/passwd /etc/hosts /fakefile > head.both 2>&1 ```
new way
```head -n1 /etc/passwd /etc/hosts /fakefile &>> head.both```

* By default ```stderr``` does not flow through pipes so if you wanted them two then you have to route the ```stderr``` to flow through to ```stdout``` like you did above.

```head -n1 /etc/passwd /etc/hosts /fakefile |& cat -n```


**The null device**: redirect anything that you don't want to see to this place as it will just be like a black hole. You might want to use this if you have output that you don't want the user to see. 

redirecting all stdout to /dev/null, so we are left with stderr
```head -n1 /etc/passwd /etc/hosts /fakefile > /dev/null```
```
head -n1 /etc/passwd /etc/hosts /fakefile &> /dev/null
head -n1 /etc/passwd /etc/hosts /fakefile 1> /dev/null
```


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>