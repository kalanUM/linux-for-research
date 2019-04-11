## Jupyter Notebooks on Remote Server

- install local Firefox (to make sure there's a browser)
- install local Anaconda Python (to get Jupyter) 
- set `JUPYTER_RUNTIME_DIR` variable 


- launch X connection to Pegasus (for windows) 
- launch X connection to Interactive LSF job (for windows) 
- (unload Pegasus python module)

- navigate to /scratch directory (or Jupyter base dir) 
- launch Jupyter Notebook server (background)
- launch local Firefox to Jupyter Notebook address 


### Install Local (old) Firefox in Pegasus Home 

- The Pegasus Supercomputer is accessible only from secure University of Miami networks (wired on campus, SecureCanes wireless, or VPN)

#### Create Local Software dir 

- create a folder for local software 
- append PATH 
- append PATH "permanently" in Bash configs 

```
$ mkdir ~/local
$ export PATH="$PATH:$HOME/local"
$ echo 'export PATH="$PATH:$HOME/local"' >> ~/.bashrc
```

- or append PATH permanently by save & source 

```
$ echo 'export PATH="$PATH:$HOME/local"' >> ~/.bashrc
$ source ~/.bashrc
``` 


#### Get & Extract (old) Firefox 

- wget (old) firefox version from FTP site 
- extract firefox
- move (& rename by version) to local software folder

```
$ wget http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/36.0/linux-x86_64/en-GB/firefox-36.0.tar.bz2
..
$ tar xvjf firefox-36.0.tar.bz2 
..
$ ls -ld firefox
drwxr-xr-x  4096 Mar 23  2018 firefox
..

$ mkdir -p ~/local/firefox
$ mv firefox ~/local/firefox/36
```

#### Create Firefox36 Symbolic Link 

- create firefox36 symbolic link (in local folder)
  - ln -s _program file_ **link name**
  - this file is in `firefox` subdir (other launchers are typcially in `bin` subdirs) 
- test `which firefox` names 


```
$ ln -s ~/local/firefox/36/firefox ~/local/firefox36
$ which firefox
/usr/bin/firefox
$ which firefox36
~/local/firefox36
```




### Install Local Anaconda Python in Pegasus Home 


#### Get & Run Anaconda Linux installer  

https://www.anaconda.com/download/#linux

```
$ wget https://repo.anaconda.com/archive/Anaconda3-5.1.0-Linux-x86_64.sh
$ bash Anaconda3-5.1.0-Linux-x86_64.sh
..
````

- default Anaconda install location is `$HOME/anaconda3`
- `yes` to prepend PATH 


```
$ source ~/.bashrc
```

##### Anaconda3 manual prepend PATH

```
$ echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc
$ source ~/.bashrc
```


#### Create Jupyter Notebooks runtime dir 

- can go anywhere, a `/scratch` dir may be best 
- use **own** folder, not shared:  `/scratch/projects/projectID/username/jrd`

```
$ mkdir -p /scratch/projects/reu/kdawson/jrd
```


#### Set `JUPYTER_RUNTIME_DIR` variable 

http://jupyter.readthedocs.io/en/latest/projects/jupyter-directories.html#runtime-files

- can also be set during launch:
- `jupyter notebook --runtime-dir=/scratch/wherever/jrd`


```
$ export JUPYTER_RUNTIME_DIR="/scratch/projects/reu/kdawson/jrd"
$ echo $JUPYTER_RUNTIME_DIR 
/scratch/projects/reu/kdawson/jrd
```

- or set permanently 

```
$ echo 'export JUPYTER_RUNTIME_DIR="/scratch/projects/reu/kdawson/jrd"' >> .bashrc
$ source ~/.bashrc
$ echo $JUPYTER_RUNTIME_DIR 
/scratch/projects/reu/kdawson/jrd
```


#### PEGASUS -- Test Jupyter 

- unload Pegasus python
- confirm unload 
- test `jupyter` command (expect this error) 

```
$ module unload python
$ module list
Currently Loaded Modulefiles:
  1) perl/5.18.1(default)   2) gcc/4.4.7(default)     3) share-rpms65

$ jupyter
usage: jupyter [-h] [--version] [--config-dir] [--data-dir] [--runtime-dir]
               [--paths] [--json]
               [subcommand]
jupyter: error: one of the arguments --version subcommand --config-dir --data-dir --runtime-dir --paths is required
```


### Pegasus - Schedule a Graphical Interactive Job  

#### Connect to Pegasus graphically 

- `Y` for trusted connection 

```
$ ssh -Y username@pegasus.ccs.miami.edu 
..

[username@pegasus ~]$ 
```

#### Submit Graphical Interactive Job 

```
$ bsub -Is -q interactive -P reu -XF bash
password:
Job is submitted to <reu> project.
Job <16359723> is submitted to queue <interactive>.
<<Waiting for dispatch ...>>
<<Starting on n002>>
[kdawson@n002 ~]$ hostname
n002
```


#### Prepare & Launch Jupyter 

- unload Pegasus Python
- navigate to scratch directory (for launch)
  - can also be set during launch:
  - `jupyter notebook --notebook-dir=/scratch/wherever`

- launch `jupyter notebook --no-browser --ip=0.0.0.0 &` (`&` to bg process) 
- get web address from command output 
- (`ps` to confirm jupyter is running) 

```
[kdawson@n002 ~]$ module unload python
[kdawson@n002 ~]$ cd /scratch/projects/reu
[kdawson@n002 reu]$ jupyter notebook --no-browser --ip=0.0.0.0 &
...

[I 11:00:56.824 NotebookApp] The Jupyter Notebook is running at:
[I 11:00:56.824 NotebookApp] http://0.0.0.0:8888/?token=df2c273793f83b4bd811f0bb0ce4c7bb74e444134627c91c

...
[kdawson@n002 reu]$ ps
  PID TTY          TIME CMD
 7231 pts/2    00:00:00 1527184091.1636
 7233 pts/2    00:00:00 bash
 7368 pts/2    00:00:01 jupyter-noteboo
 7399 pts/2    00:00:00 ps
```

#### Suspend & BG Jupyter (if no &) 

- `CTRL-Z`, `bg` to background the fg process 



#### Launch (local) Firefox

- launch (local) firefox36 address in bg (`&`) 
- or, launch `firefox36 &` & paste address graphically 
- confirm /scratch dir contents in Jupyter 


```
$ firefox36 http://0.0.0.0:8888/?token=df2c273793f83b4bd811f0bb0ce4c7bb74e444134627c91c &
```

#### Suspend & BG Firefox (if no &) 

- `CTRL-Z`, `bg` to background the fg process 



#### Pegasus job cleanup 

- exit compute node 
- wait a bit 
- `bjobs` to see if interactive session still has Jupyter Notebook running 
- `bkill` jobID or all user jobs, if any 

```
[kdawson@n002 kdawson]$ exit
exit
[kdawson@pegasus ~]$ bjobs
JOBID     USER    STAT  QUEUE      FROM_HOST   EXEC_HOST   JOB_NAME   SUBMIT_TIME
16360357  kdawson RUN   interactiv login4      n002        bash       May 24 15:02
[kdawson@pegasus ~]$ bkill -u kdawson
Job <16360357> is being terminated
[kdawson@pegasus ~]$ bjobs
No unfinished job found
```


#### Notes 

Adapted from: 
https://gist.github.com/mcburton/d80e4395cd82737d3677c570aa31ee40

Differences:
- no SSH tunnel 
- Jupyter & browser run in the same interactive Pegasus session 


