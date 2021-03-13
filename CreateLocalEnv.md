## Creating a local Lab Environment 
---
<em> Excersise 1 notes </em>

A vagrant box is an operating system image. You only need to download a box oncea s this image will be cloned when you create a new virtual machine with vagrant using the box's name
<br>
A vagrant project folder must consist of a folder and a Vagrant configuration File called a ```VargrantFile```
<br>

The first time you run the "vagrant up" command , Vagrant will import the vagrant box into VirtualBox and start it up. By default, VM's start in headless mode. 
<br>

confirm that vagrant is running a virutal machine with ```vagrant status```
reboot a vm with ```vagrant reboot```
<br>

Throughout this course you are going to create virutal machines that will be able to communicate with each other as well as your local workstations. To enable this you need to enable the VMs IP address
<br>

You can ping the server or any network with: ```ping -c 3 [ip]``` and this will test the connection by sending packets over. 
<br>

Destroy VMs with ```vagrant destroy``` in the working directory. 

**Creating another Vagrant Project with multiple VMs**
You can accesss the files in the vagrant project directoy that reside on your local machine inside of the virutal machine. The vagrant project directory is mounted, or shared, via /vagrant directory. The only file in our local directory is the ```Vagrantfile```<br>
You can look at the local files inside of a vm with 
```
ls /vagrant 
cat /vagrant/Vagrantfile
```