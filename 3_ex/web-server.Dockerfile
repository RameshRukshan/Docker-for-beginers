# Use the official Ubuntu base image
FROM ubuntu

# Set the maintainer information
LABEL maintainer="Carlos Nunez <dev@carlosnunez.me>"

# Switch to the root user temporarily to perform setup tasks
USER root

# Copy the web-server.bash script to the root directory
COPY ./web-server.bash /

# Make the web-server.bash script executable
RUN chmod 755 /web-server.bash

# Update the package repository and install bash and netcat
RUN apt -y update
RUN apt -y install bash netcat

# Switch to the 'nobody' user for better security
USER nobody

# Set the default command to run the web-server.bash script
ENTRYPOINT [ "/web-server.bash" ]
