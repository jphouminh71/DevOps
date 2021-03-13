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


## 1st Script Notes
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