# Purpose of this Folder

This folder should contain the scaffolded project files to get a student started on their project. This repo will be added to the Classroom for students to use, so please do not have any solutions in this folder.

I used this command to get the list and version of kubernetes distributions that can be used.
aws eks describe-addon-versions --addon-name coredns --query "addons[].addonVersions[].compatibilities[].clusterVersion"