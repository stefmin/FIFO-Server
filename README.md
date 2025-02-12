# FIFO-Server
**🖥️ Overview**

This project emulates a client-server communication system in Bash, utilizing a well-known FIFO for interprocess communication. Clients send structured requests, and the server fetches and returns manual pages for requested commands.

# The task:
Write a client-server program using Bash that uses special FIFO files as communication channels between clients and the server. The server uses a FIFO file with a known name (well-known FIFO), configurable in a configuration file. The server receives requests from clients for manual pages related to different commands through the FIFO file. The format of the client requests is as follows:

BEGIN-REQ [client-pid: command-name] END-REQ

Where pid is the client's process ID, and command-name is the name of the shell command for which the client requests the corresponding information from the manual page (i.e., executing man command-name). The server reads requests from the FIFO and responds to clients in FIFO files customized for each client. These customized FIFO files have a standard name that contains the client's PID (e.g., /tmp/server-reply-XXXX where XXXX represents the value of the client's PID). The concrete response is the content of the manual pages for command-name. After reading the manual pages and displaying their content on the screen, the client deletes their personalized FIFO file.

**🚀 Features**

FIFO-based interprocess communication

Client-server architecture using Bash scripting

Signal handling for process management (Ctrl-C, Ctrl-Z protection)

Configuration script to set up the environment

**🛠️ Technologies Used**

Bash scripting

FIFO (named pipes)

Linux signals (trap, kill, etc.)

**📥 Installation & Usage**

Clone the repository:
```
git clone https://github.com/stefmin/FIFO_Server.git
cd FIFO_Server
```
Set up the configuration script on your computer (locations of scripts will be differet):
```
./config.sh
```
Start the server:
```
./run_server.sh
```
Send a request from a client:
```
./fifo_client_side.sh ls
```
📌 Lessons Learned

Using FIFO for IPC (Inter-Process Communication)

Implementing signal trapping and process management


