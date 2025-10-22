# Jenkins

# Installation
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade

Installing Jenkins: https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos

Java Installation: Also requires JRE or JDK (Java Developemnt kit)
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-21-openjdk
sudo yum install jenkins

Finally:
#To reload daemon 
sudo systemctl daemon-reload 

#Jenkins by default listens on 8080 but you can change that in following file:
sudo vi /lib/systemd/system/jenkins.service

#Enable the Jenkins service to start at boot with the command 
sudo systemctl enable jenkins 

#start the Jenkins service
sudo systemctl start jenkins

#check the status of the Jenkins service
sudo systemctl status jenkins 

To unlock Jenkins password located at:
/var/lib/jenkins/secrets/initialAdminPassword

#Open the sudoers file for editing using visudo (to ensure you don't make any syntax mistakes)
sudo visudo 

#Add the following line to grant the Jenkins user (assuming the Jenkins user is jenkins) permission to run commands without entering a password
jenkins ALL=(ALL) NOPASSWD: ALL

On Jenkins:
Create project using below steps:

Description - Give any based on your preference.
Under Build Steps -> Add build step -> select Execute Shell (Here we will store our shell script)
Save the project.
Now click on Build Now to build the project.
You can see the output of current build under Builds -> Console Output section.

