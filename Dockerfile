FROM maven:latest

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Build directories and copy itself
RUN mkdir /test
COPY . /test
WORKDIR /test

# Add user and change access
RUN addgroup admin && adduser -D admin -G admin \
&& chown -R admin:admin /test

USER admin

# Install the repository
RUN mvn clean install -DskipTests

# Export the config and run the process using PM2
ENTRYPOINT mvn integration-test