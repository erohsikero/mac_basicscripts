# mac_basicscripts


Add script as function in .bash_profile file to execute them as commnand whenever needed

Example : 
getalldns()
{
    hostname=$(hostname)
nslookup $hostname '192.168.100.54'
}

Then we can call getalldns to execte the script
