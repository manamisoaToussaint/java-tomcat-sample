#This is a dockerfile when we need to copy my war file inside the tomcat and then run my tomcat


FROM tomcat:8.0

#COPY this particular war file which i'm creating in my job at this particular location inside the tomcat
ADD **/*.war /usr/local/tomcat/webapps

EXPOSE 8080
# Make sure this port is not open on the host machine
# this port is not open on the machine where the docker is running
# this port is open inside the container only

# jereo am docker hub ny fomba atao hi lancena tomcat

CMD [ "catalina.sh","run" ]