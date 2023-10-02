# Created by Luong (Please 4don't copy, this is only for huynvb4)
FROM        nexus.huynvb.lab.ocp.lan/openjdk:17-alpine
WORKDIR     app
COPY         target/ ./
ENTRYPOINT  java -jar *.jar --server.servlet.context-path=/${ENVIROMENT}

# ARG         ENVIROMENT=uat
# ARG         USERNAME=petclinic
# ARG         USER_UID=1001
# ARG         USER_GID=1002

# ENV         ENVIROMENT=$ENVIROMENT

# # Create petclinic user
# RUN         addgroup -g $USER_GID $USERNAME 
# RUN         adduser -u $USER_UID -G $USERNAME -HD $USERNAME

# RUN         mkdir /app && chown -R $USERNAME:$USERNAME /app

# USER        $USERNAME
# WORKDIR     app
# COPY        --chown=$USERNAME:$USERNAME target/ ./
# ENTRYPOINT  java -jar *.jar --server.servlet.context-path=/${ENVIROMENT}