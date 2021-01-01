# IPMIchecking

A quick script to check ping and ipmi credentials with ipmitool


first write a file inside data/addresses/
every line should have the starting IPMI address and the ending one, but all in one subnet
ex: 
10.1.1.1 50
(this will check ip addresses from 10.1.1.1 10.1.1.2 10.1.1.3 ... 10.1.1.50)

I alreay have files for row 19 and 22. for tower that have 2 switches I differentiaded them by appending a "u" after the one on the top and a "d" for the one on the bottom. 
ex: 22wu means the upper switch on the 22w tower

first connect ethernet connection to an empty port on the switch
after that you can run ./check.sh *filename to check the pings and the ipmi login info
(if computer is windows, you might have to change the "ifconfig" in ping.sh to "ipconfig")

I named the files after each tower's label. a file with multiple lines means that tower has more than 1 subnet

after you run check.sh, the ipmi login info will be recorded in the data/ipmi folder in the file with the same name as the file you
provided as an argument

the ipmi login credentials that the program checks is in the file data/ipmi/credentials
