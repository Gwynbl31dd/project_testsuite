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

## Where are the tests ?

By default the tests are in src/test/robotframework/acceptance/ 
(But you can modify that in pom.xml)

Use the quickstart if you are lost :) 

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

## Resources 

You can load resource. In this example, a device.json file.

The resources saved in ``src/test/resources`` can be accessible from ``target/test-classes/``
