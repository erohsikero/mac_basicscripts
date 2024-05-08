alljava(){
/usr/libexec/java_home -V
}

setjava(){
echo "OLD JAVA_HOME : $JAVA_HOME"
export JAVA_HOME=`/usr/libexec/java_home -v $1`
echo "NEW JAVA_HOME : $JAVA_HOME"
java -version
}

