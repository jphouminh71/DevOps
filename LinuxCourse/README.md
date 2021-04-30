# Linux Training Course


### Module One: Understanding Linux Concepts
---
What is Linux Operating System?
* Its an operating system that sits in the middle of the hardware and user software  

Unix vs Linux 
* Unix was first develped for multi-user and multi-tasking in mid-1970 in Bell Labs. 
* Linux wa born in 1991  by Linus Torvalds
* Linux is mostly free
* Linux is open source; open to the community for modifications
* Unix is mostly used by Sun as Solaris, HP-UX, AIX etc. 
* Linux is use d by many developers community or companies (Redhat, CentoS, Debian) etc. 
* Unix comparartively supports a lot less File Systems. 
* Linux can be installed on a variey of computer hardware, ranging from mobile phones, tablet, video game consoles, to mainframes and supercomputers. 
<br><br>
### Module Two: Installing Linux
---
What is Oracle VirtualBox? 
* Free open source hyperviors for x86 computers 
* It isntall on your existing intel or AMD-based computers no matter the current OS. It extends your current computer so that it can run multiple operating systems at one time. 
<br><br>
### Module Three: System Access and File System
---


**Command Promps and Getting Prompts Back**
* A command prompt, is short text at the start of the command line followed by prompt symbol on a command line interface. 

<br>

**Access to Linux System**
* Each OS has a different protocol or client that is used to access the system
    * Windows = Remote Desktop (RDP)
    * VMWARE ESX = vSphere client 
    * Linux = Putty, SecureCRT \ SSH from Linux to Linux

<br>

**New Network Command (IP)
* CentOS/REHL 5 or 6  = **ifconfig**
* CentOS/REHL 7 = **ip**
* CentoOS/REHL7.5 and up = **ifconfig** ocmmand has been deprecated, so use **ip add**

<br> 


**Important Things to Remember**
* Linux has super administrator account "root"
* "root" is the most powerful account tha can create, modify delete accounts and make changes to system configuration files
* Linux is a case-sensative system
* Avoid using filennames with space in them

<br> <br>

## The Linux File System
* This is the closet of the operating system. Command files of an OS go to usr/bin attached devices go to /dev, applications go to /etc/var , so it makes it easy for the OS to get the data

* OS store data on disk drives usuing a strucure called a filesystem, consisting of files, directoires, and information needed to access and locate them 
* There are many different types of filesystems. In general, improvements hav ebeen made to filesystems with new relaes of operating systems, and each new filesystem has been given a different name (**ext3, ext4,XFS, NTFS, FAT etc**)
* Linux filesystems store information in a hierachry of directories and files.

<br>

**File System Structure and its Description**

* **/boot**: This directory contains the files for the bootloader (grub.cfg). This is the first item that the OS will look for upon startup. <br>
* **/root**: This is the root user home directory. It is not the same as **/**. <br> 
* **/dev**:  System devices (disk, cdrom, speakers, flashdrive, keyboard) all devices show up as files on linux <br>
* **/etc**: This contains all the configuration files that runs on top of the linux system.  <br>
* **/bin -> /usr/bin**:  This is where all the everyday user commmands are such as * **ls** <br>
* **/sbin -> /usr/sbin**: This is where all the system / filesystem level commands are located <br>
* **/opt**: Optional add on applications (Not part of OS apps)
* **/proc**: This is a list of all the running applications that reside in memory
* **/lib -> /usr/lib**: Location where all the C programming libray files needed by commpands and apps. Its the library for all the commands found in the bins 
* **/tmp**: Directory containing all the temporary files
* **/home**: Directory for user programs
* **/var**: Systems logs 
* **/run**: System daemons that start very early () to store tempory runtime files like PID files
* **/mnt**: Directory used to mount external filesystems
* **/media**: For cdrom mounts. 

<br><br>

| Navigating the File System