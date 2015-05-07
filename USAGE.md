[./clean-file](./clean-file)
------------
Filter non-printable characters.  

Use -i to edit file in-place (see man sed)

Example: clean-file -i myfile.csv
     or: cat bad.csv | clean-file > good.csv

Redundant new lines characters removed (like dos2unix)

All parameters are passed to the sed command


[./.cmd_functions.sh](./.cmd_functions.sh)
------------
Command wrapper functions

Chain functions together in a selective order and prefix almost any bash command.  Use
these to add a log file, easy date printing (for timing), trace (like a single-command 
xtrace output), and email notices.

.cmd_functions, ctime, ctrace, cnotify, clog

Variables:
cret = the return value of the last command (initialize: export cret)
cerror = first error code of any command (initialize: export cerror=0)

ctime, prints date and time before and after command execution
ctrace, shows the exit value
crun, combins ctime and ctrace
clog, append to a log file. std err and out are combined and printed to the console
Depends on sendmail
USAGE: cnotify email@mymail.com "subject" echo Output from any command and parameters


[./edi-cat](./edi-cat)
------------

Display (or cat) one or more EDI files provided on the
command-line.  Each record separator is replaced by a
new line; this makes the message easy to read.

Depends: edi-isa (in same directory as this script)



[./edi-isa](./edi-isa)
------------

Sets environment variables by analyzing the ISA header

Usage: $0 EDI_FILE_NAME

sed 's/ *$//' removes all spaces from the end of the line


[./edi-less](./edi-less)
------------

Display (or less) one or more EDI files provided on the
command-line.  Each record separator is replaced by a 
new line; this makes the message easy to read.

Depends: edi-isa (in same directory as this script)



[./edi-type](./edi-type)
------------

Show the type of each EDI message provided on the command-line.
Example: 810, 855, 850, 997, etc....

Depends: edi-isa (in same directory as this script)



[./.encfs-aliases](./.encfs-aliases)
------------
Alias to mount and unmount an ~/Encrypted folder

Use after [./encfs-setup](./encfs-setup)

See [encfs-ln](encfs-ln) - relocate file or folder to ~/Encrypted and convert to a symbolic link


[./encfs-setup](./encfs-setup)
------------
Setup and encrypt ~/Encrypted


[./.git-aliases](./.git-aliases)
------------
A few short-cuts for Git
.git-aliases, examples: gci (checkin), gst (status), gstu (status ignoring non-checkins), gpu (push)


[./gnome-encfs](./gnome-encfs)
------------
gnome-encfs - GNOME keyring and auto-mount integration of EncFS folders.



[./ipsec-sonic-config](./ipsec-sonic-config)
------------
INSTALL
Debian/Ubuntu: sudo apt-get install openswan

USAGE:

    ipsec-sonic-config @id           @secret          sonicwall_ip  yr_subnet/mask vpn_subnet/mask 
    ipsec-sonic-config @0017A44CEE33 6FE2A2A2EF722A22 69.69.250.100 192.168.1.0/24 192.168.0.1/24
   
Overwrite using variables:

    home=@home connection_name=work ike=... ipsec-sonic-config ....



[./mouse-2-ptr.sh](./mouse-2-ptr.sh)
------------
Instructions to give second mouse its own pointer


[./mp3merge](./mp3merge)
------------
Merge multiple MP3 files into one MP3
Corrects the headler length so many players show correct scrolling
Recalc the variable bit rate


[./pathmunge](./pathmunge)
------------
Example:
 pathmunge bin # Adds bin to your PATH variable unless it is already there


[./prj-env](./prj-env)
------------
Usage:

    . prj-env alias,var1,etc...

Example:

    . prj-env my,user,host

Creates ~/.prj-env/my script.  The my script sets
the variables (var1,etc...).  Intially, this script will
prompt for variables that are not already found in the my
environment.  If all values are already available, this 
script runs silently.

    export user=john
    export host=johnDoe314.example.com

Alias is a short word used to retrieve envirnonment.
Prompts user then saves response in ~/.prj-env/my
   


[./rsync-host](./rsync-host)
------------

Calculates a path relative to the home directory.  That path is used to Sync 
folders with a remote host.  

Home directories may differ, but the path relative to the home directory 
is the same.  Under this configuration, it becomes simple to create and
use the sync commands based on the current working directory.  

Unless you force it, this script will always preview and prompt before 
actually making changes.

Example:
    /home/doej/projects/examples$ rscp host_alias (get|put)
OR
    /home/doej/projects/examples$ rscp host_alias (get|put) [path/]file

Sync ~/projects/examples from host_alias account with 
current directory (also ~/projects/examples).  

host_alias can be some short made-up alias; interactivly prompt and record 
the host and user.

get - sync from server to local directory
put - sync from local directory to server

-f, force  - skip the the dry-run and 'are you sure'
-e, echo   - just echo the command and exit
-d, delete - delete extraneous files from dest dir

Suffix commands to the main command: get-f, get-e, get-fed
###########
###########
#######


[./smb-examples](./smb-examples)
------------
Samba Examples


[./ssh-authorize](./ssh-authorize)
------------
Usage: ssh-authorize [user@]hostname

Create and place DSA public key on a remote ssh server.  Establishes 
an automatic public key private key authentication.    

Your default DSA key will be created and(or) used.  Keep the default name:
$HOME/.ssh/id_dsa.pub


[./ssh-host](./ssh-host)
------------
Wrapps the SSH command adding support for alias host names.

Example:
    ssh-host host_alias [ssh arguments]

host_alias is a short made-up alias.  The first time, this command 
interactivly prompts for the host and user values and saves them for the 
next runs.  Pay attention to the file name, you can edit that file.

Examples:
 
* SSH to to a remote host:
    ssh-host db

* List a remote directory: 
    ssh-host db ls

* List a remote directory: 
    echo ls | ssh-host db

* Testing return value: 
    echo ls . | ssh-host db && pwd

* Testing return value: 
    echo ls nowhere | ssh-host db && pwd



[./ssh-keygen-default](./ssh-keygen-default)
------------
Create DSA keypare. See $HOME/.ssh/id_dsa[.pub]"


[./svn-sync](./svn-sync)
------------
Generate a preview and offer to execute any svn commands needed
to sync this directory with the repository.


[./timefile.sh](./timefile.sh)
------------
Depends: sudo apt-get xprintidle watch -y
 
Record time entries under ~/.timefile/client1 every 10 minutes (unless idle).
`watch ~/.gitbin/timefile.sh client1`

Record the start of a task:
`~/.gitbin/timefile.sh client1 "Updating About page"`
  
Record a task that was started 10 minutes ago:
`~/.gitbin/timefile.sh client1 "About page design discussion" 10`
 
Get back on task:
`~/.gitbin/timefile.sh client1 "Updating About page"`

See: ~/.timefile


[./usage-generate.sh](./usage-generate.sh)
------------
Generates github USAGE file from script comments.

Usage: ./usage-generate.sh > USAGE.md



[./vbox-examples](./vbox-examples)
------------
Set XP activation parameters
http://forums.virtualbox.org/viewtopic.php?t=9697#37931
Probe the machine where your license is activated:

    sudo dmidecode | less



[./vbox-module-load-fix](./vbox-module-load-fix)
------------
If Ubuntu vbox bridged networking modules are needed and do not load,
try this alternative method using insmod.


[./xtrace](./xtrace)
------------
Enables bash's xtrace mode.

Usage: xtrace ./some-script "any parameters"



