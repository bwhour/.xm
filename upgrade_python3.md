Python upgrade in aws:

sudo amazon-linux-extras install python3.8

sudo yum install python3-devel

sudo yum install python3.8-devel

cd /usr/bin/  && sudo rm python3 &&  sudo ln -s /usr/bin/python3.8 /usr/bin/python3

sudo yum -y install python38-devel.x86_64

sudo pip3 install --upgrade --force-reinstall setuptools
