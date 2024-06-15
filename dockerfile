# Use the specified Ubuntu version as the base image
FROM ubuntu:latest

# Install necessary packages for prerequisite check
RUN apt-get update 
RUN apt-get install -y fortune-mod cowsay netcat-openbsd

# Set the PATH environment variable
ENV PATH="/usr/games:${PATH}"

# Copy the script file
COPY wisecow.sh /usr/local/bin/

# Set permissions and make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the port on which the application runs (if applicable)
EXPOSE 4499

# Run the script when the container starts
CMD ["wisecow.sh"]

