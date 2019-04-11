# Apache Maven Environment Variables
# MAVEN_HOME for Maven 1 - M2_HOME for Maven 2
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export M2_HOME=/usr/local/apache-maven-3.5.4
export MAVEN_HOME=$M2_HOME
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=$M2:$PATH
