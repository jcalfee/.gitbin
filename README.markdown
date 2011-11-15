./edi-less
------------

Display (or less) one or more EDI files provided on the
command-line.  Each record separator is replaced by a 
new line; this makes the message easy to read.

Depends: edi-isa (in same directory as this script)



./dos2unix
------------
Strip off extra DOS carrage return characters.  The extra
return characters, when in shell scripts, can cause strange 
errors.

Some systems have this command already


./ssh-host
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



./ssh-keygen-default
------------
Create DSA keypare. See $HOME/.ssh/id_dsa[.pub]"


./ipsec-sonic-config
------------
TODO: document configuration on the Sonicwall
   
INSTALL
Debian/Ubuntu: sudo apt-get install openswan

USAGE:

    ipsec-sonic-config @id           @secret          sonicwall_ip  yr_subnet/mask vpn_subnet/mask 
    ipsec-sonic-config @0017A44CEE33 6FE2A2A2EF722A22 69.69.250.100 192.168.1.0/24 192.168.0.1/24
   
Overwrite using variables:

    home=@home connection_name=work ike=... ipsec-sonic-config ....



./edi-isa
------------

Sets environment variables by analyzing the ISA header

Usage: $0 EDI_FILE_NAME



./edi-type
------------

Show the type of each EDI message provided on the command-line.
Example: 810, 855, 850, 997, etc....

Depends: edi-isa (in same directory as this script)



./smb-examples
------------
Samba Examples


./edi-cat
------------

Display (or cat) one or more EDI files provided on the
command-line.  Each record separator is replaced by a
new line; this makes the message easy to read.

Depends: edi-isa (in same directory as this script)



./pathmunge
------------
Example:
 pathmunge bin # Adds bin to your PATH variable unless it is already there


./readme.sh
------------
Usage: ./readme.sh > README.markdown


./vbox-examples
------------
Set XP activation parameters
http://forums.virtualbox.org/viewtopic.php?t=9697#37931
Probe the machine where your license is activated:

    sudo dmidecode | less



./svn-sync
------------
Generate a preview and offer to execute any svn commands needed
to sync this directory with the repository.


./rsync-host
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


./gnome-encfs
------------
hg clone http://bitbucket.org/obensonne/gnome-encfs
hg clone ssh://hg@bitbucket.org/obensonne/gnome-encfs
   gnome-encfs - GNOME keyring and auto-mount integration of EncFS folders.
   Copyright (C) 2010 Oben Sonne <obensonne@googlemail.com>
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.



./prj-env
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
   


./vbox-module-load-fix
------------
If Ubuntu vbox bridged networking modules are needed and do not load,
try this alternative method using insmod.


./ssh-authorize
------------
Usage: ssh-authorize [user@]hostname

Create and place DSA public key on a remote ssh server.  Establishes 
an automatic public key private key authentication.    

Your default DSA key will be created and(or) used.  Keep the default name:
$HOME/.ssh/id_dsa.pub


