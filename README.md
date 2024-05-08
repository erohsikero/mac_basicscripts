# mac_basicscripts


Add script as function in .bash_profile file to execute them as commnand whenever needed

Example : 
getalldns()
{
    hostname=$(hostname)
nslookup $hostname '192.168.100.54'
}

Then we can call getalldns to execte the script


## Functions
### alljava
This funcation will list all java version installed in your mac

### setjava
Get the version numnber from above funcation and pass it to this funcation to switch particular version in JAVA_HOME

example : setjava 1.8.0 OR setjava 14
