# Reinforcement Learning for RAN Slicing
### Author of Slicing Approach: Dick Carrillo Melgarejo
### Author of baseline generic spectrum and power allocation: S. NASIR

#### How to use this code?
 Instructions are for Linux (tested in ArchLinux - Linux 5.11.6-arch1-1).
> Please create a virtual environment and install the specified tensorflow and numpy versions:
> > `conda create -n RL-allocation python=3.6` <br />
> > `conda activate RL-allocation` <br />
> > `pip install -r requirements.txt`<br />

###### Installing miniconda in Linux (ArchLinux)
Follow the next steps:
> Download and install Miniconda following the next instructions: [Miniconda](https://conda.io/projects/conda/en/latest/user-guide/install/linux.html)

##### Note: if necessary the system will request you to update pip

##### For long Simulation and Iterations
It is important to extend the SWAP memory of the Linux distribution. In ArchLinux we used the following commands:
> > `sudo swapoff -a`
> > `sudo dd if=/dev/zero of=/swapfile bs=1G count=60`
> > `sudo mkswap /swapfile`
> > `sudo swapon /swapfile`

for details check [Here](https://arcolinux.com/how-to-increase-the-size-of-your-swapfile)
