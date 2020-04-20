# Project Test Suite Template

This maven project is a test suite template made to test NSO

No need to install any extra dependency... maven will handle it.

## Usage

The installation is easy (3 commands)

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

By the default the test are in src/test/robotframework/acceptance/

Use the quickstart if you are lost :) 

## How can I had other libraries?

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

Easy ;)
