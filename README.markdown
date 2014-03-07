.gitbin and .bashrc setup
------------
This is a quick copy and paste method I use to get setup.  First make sure Git is installed:

`sudo apt-get install git`

Copy and paste as it this applies to you:
```
cd $HOME
git clone https://github.com/jcalfee/.gitbin.git
# Quick access to edit .bashrc.  The file is re-sourced (re-ran) 
# after you exit the editor.
alias vb="vi ~/.bashrc && . ~/.bashrc"
vb
i
alias vb="vi ~/.bashrc && . ~/.bashrc"

export PATH=$PATH:$HOME/.gitbin

. $HOME/.gitbin/.encfs-aliases
. $HOME/.gitbin/.git-aliases
```

