FROM maven:latest

# Build directories and copy itself
RUN mkdir /test
COPY . /test
WORKDIR /test

RUN mkdir ~/.m2 && mv settings.xml ~/.m2/settings.xml
# Install the repository
RUN mvn clean install -DskipTests

# Export the config and run the process using PM2
ENTRYPOINT mvn integration-test