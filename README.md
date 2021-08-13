# Project Test Suite Template

This maven project is a test suite template made to test NSO (mostly)

No need to install any extra dependency... maven will handle it.

## Usage

The installation is easy, 2 commands.

Simply clone this repository

```
git clone https://github.com/Gwynbl31dd/project_testsuite.git
```

Run the installation (download the dependencies)

```
mvn install
```

Run the test only

```
mvn integration-test
```

## Github token

Github requires an authorization token... This is not perfect. But easy to fix. I provide a public auth token with read access to the packages in ``settings.xml`` you can copy it to ~/.m2/settings.xml .

```xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      http://maven.apache.org/xsd/settings-1.0.0.xsd">

  <activeProfiles>
    <activeProfile>github</activeProfile>
  </activeProfiles>

  <profiles>
    <profile>
      <id>github</id>
      <repositories>
        <repository>
          <id>central</id>
          <url>https://repo1.maven.org/maven2</url>
        </repository>
        <repository>
          <id>github</id>
          <url>https://maven.pkg.github.com/Gwynbl31dd/*</url>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
      </repositories>
    </profile>
  </profiles>

  <servers>
    <server>
      <id>github</id>
      <username>Gwynbl31dd</username>
      <!-- This is a public key used to read the packages... No worries you can use it until github makes it public -->
      <password>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</password>
    </server>
  </servers>
</settings>
```

## Where are the tests ?

By default the tests are in src/test/robotframework/acceptance/ 
(But you can modify that in pom.xml)

Use the quickstart if you are lost :) 

## Extra libraries

This project includes extra libraries

* https://github.com/MarketSquare/robotframework-httprequestlibrary
* https://github.com/MarketSquare/robotframework-seleniumlibrary-java


## How can I had more libraries?

Simply modify pom.xml

E.g : Add selenium

```
<dependency>
    <groupId>com.github.hi-fi</groupId>
    <artifactId>robotframework-seleniumlibrary</artifactId>
    <version>2.53.1.1</version>
    <scope>test</scope>
</dependency>
```

## Docker

### Build

Build the image

```bash
docker build -t apaulin/maven-robot:latest .
```

Run the image

```
docker run -itd --name maven-robot apaulin/maven-robot:latest
```

Interactive access

```
docker run -i -t --name maven-robot apaulin/maven-robot:latest bash
```

## Resources 

You can load resource. In this example, a device.json file.

The resources saved in ``src/test/resources`` can be accessible from ``target/test-classes/``
