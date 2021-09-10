# Reinforcement Learning for RAN Slicing
### Author of Slicing Approach: Dick Carrillo Melgarejo
### Author of baseline generic spectrum and power allocation: S. NASIR

#### How to use this code?
 Instructions are for Linux (tested in ArchLinux - Linux 5.11.6-arch1-1).
> Please create a virtual environment and install the specified tensorflow and numpy versions:
> > `conda create -n RL-allocation python=3.6` <br />
> > `conda activate RL-allocation` <br />
> > Clone this repository in the folder that you wish,
> > `pip install -r requirements.txt`<br />

###### Installing miniconda in Linux (ArchLinux)
Follow the next steps:
> Download and install Miniconda following the next instructions: [Miniconda](https://conda.io/projects/conda/en/latest/user-guide/install/linux.html)

##### Note: if necessary the system will request you to update pip

##### For long Simulation and Iterations
> It is important to extend the SWAP memory of the Linux distribution. In ArchLinux we used the following commands:
> > `sudo swapoff -a` <br />
> > `sudo dd if=/dev/zero of=/swapfile bs=1G count=60` <br />
> > `sudo mkswap /swapfile`  <br />
> > `sudo swapon /swapfile` <br />

for details check [Here](https://arcolinux.com/how-to-increase-the-size-of-your-swapfile)

##### To Clone using SSH KeyGen use the following in your local pc
> please enter to the following link [generating key ssh for GitHub](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)