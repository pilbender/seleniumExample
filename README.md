seleniumExample
=================

A Basic Selenium Example Project

About
=====

Example code to illustrate how to use Selenium.

This example project uses Selenium techniques to automate front end testing.  WebDriver is wired in with Spring.  It also illustrates how to inject Javascript in a page for testing hidden objects.

How to
=======

 * Run with Tomcat, Spring MVC, Apache Tiles, and run Selenium tests against it.
 * Properly wire WebDriver with Spring so it is faster and more reusable.
 * Test for hidden objects on a page.
 * Test for web services.

Requirements
============

 * Only the JDK and Maven is required to run this project.

Configuration
=============

 * mvn clean install
 * mvn tomcat7:run
 * Navigate your browser to http://localhost:8080/seleniumExample
 * mvn -Pselenium test -Dspring.profiles.active=local

