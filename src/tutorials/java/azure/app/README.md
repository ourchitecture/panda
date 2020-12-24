# Tutorials: Java on Azure

## What you will build

Deploy a [Java][java] application to Azure using the Azure CLI. This guide builds on the quick start guide ["Create a Java app on Azure App Service"][tutorial-base].

## What you will need

The following prerequisites are required in order to follow the steps in this tutorial:

- A [Microsoft Azure account][azure-account] with an existing App Service Plan and permission to create and deploy an AppService (this Java application) to the plan. _\*See the tutorials to [create a new resource group][tutorial-rg] and [create a Java App Service][tutorial-app-service-plan]._
- [git][git]
- [make][make]
- [docker][docker]

## Build and run

In this section, you will clone the tutorial and execute it:

1. Open a terminal window.

2. If you don't already have one, make a local directory to hold the code and change to that directory by typing `mkdir ./tutorials && cd ./tutorials`.

3. Clone the tutorial into the directory you created by typing:

   ```shell
     git clone https://github.com/ourchitecture/panda --depth=1
   ```

4. Change to the directory of this tutorial project by typing `cd ./src/tutorials/java/azure/app`.

5. Type `make prerequisites` and read the output to verify you have the right tools. Output should look similar to:

   ```shell
   make prerequisites
       GNU Make 4 or later is required. You have:
       ------------------------------------------
       GNU Make 4.2.1
       Built for x86_64-pc-linux-gnu
       Copyright (C) 1988-2016 Free Software Foundation, Inc.
       License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
       This is free software: you are free to change and redistribute it.
       There is NO WARRANTY, to the extent permitted by law.

       Git 2.20 or later is required. You have:
       ----------------------------------------
       git version 2.25.1

       Docker 19.03.0 or later is required. You have:
       ----------------------------------------------
       Docker version 19.03.13, build 4484c46d9d
   ```

6. Initialize the application and install dependencies by typing `make check`. You should see output similar to the below:

   ```shell
   make check
      Downloading https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.6.3/apache-maven-3.6.3-bin.zip
      ................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
      Unzipping /root/.m2/wrapper/dists/apache-maven-3.6.3-bin/1iopthnavndlasol9gbrbg6bf2/apache-maven-3.6.3-bin.zip to /root/.m2/wrapper/dists/apache-maven-3.6.3-bin/1iopthnavndlasol9gbrbg6bf2
      Set executable permissions for: /root/.m2/wrapper/dists/apache-maven-3.6.3-bin/1iopthnavndlasol9gbrbg6bf2/apache-maven-3.6.3/bin/mvn
      [INFO] Scanning for projects...
      [INFO]
      [INFO] --< com.ourchitecture.tutorials.java.springboot:java-spring-boot-hello >--
      [INFO] Building java-spring-boot-hello 0.0.1-SNAPSHOT
      [INFO] --------------------------------[ jar ]---------------------------------
      [INFO]
      [INFO] --- maven-resources-plugin:3.1.0:resources (default-resources) @ java-spring-boot-hello ---
      [INFO] Using 'UTF-8' encoding to copy filtered resources.
      [INFO] skip non existing resourceDirectory /app/src/main/resources
      [INFO] skip non existing resourceDirectory /app/src/main/resources
      [INFO]
      [INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ java-spring-boot-hello ---
      [INFO] Nothing to compile - all classes are up to date
      [INFO]
      [INFO] --- maven-resources-plugin:3.1.0:testResources (default-testResources) @ java-spring-boot-hello ---
      [INFO] Using 'UTF-8' encoding to copy filtered resources.
      [INFO] skip non existing resourceDirectory /app/src/test/resources
      [INFO]
      [INFO] --- maven-compiler-plugin:3.8.1:testCompile (default-testCompile) @ java-spring-boot-hello ---
      [INFO] Nothing to compile - all classes are up to date
      [INFO]
      [INFO] --- maven-surefire-plugin:2.22.2:test (default-test) @ java-spring-boot-hello ---
      [INFO]
      [INFO] -------------------------------------------------------
      [INFO]  T E S T S
      [INFO] -------------------------------------------------------
      [INFO] Running com.ourchitecture.tutorials.java.springboot.HelloControllerTest
      21:23:37.795 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating CacheAwareContextLoaderDelegate from class [org.springframework.test.context.cache.DefaultCacheAwareContextLoaderDelegate]
      21:23:37.831 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating BootstrapContext using constructor [public org.springframework.test.context.support.DefaultBootstrapContext(java.lang.Class,org.springframework.test.context.CacheAwareContextLoaderDelegate)]
      21:23:37.925 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating TestContextBootstrapper for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest] from class [org.springframework.boot.test.context.SpringBootTestContextBootstrapper]
      21:23:37.957 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Neither @ContextConfiguration nor @ContextHierarchy found for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest], using SpringBootContextLoader
      21:23:37.966 [main] DEBUG org.springframework.test.context.support.AbstractContextLoader - Did not detect default resource location for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]: class path resource [com/ourchitecture/tutorials/java/springboot/HelloControllerTest-context.xml] does not exist
      21:23:37.968 [main] DEBUG org.springframework.test.context.support.AbstractContextLoader - Did not detect default resource location for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]: class path resource [com/ourchitecture/tutorials/java/springboot/HelloControllerTestContext.groovy] does not exist
      21:23:37.968 [main] INFO org.springframework.test.context.support.AbstractContextLoader - Could not detect default resource locations for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]: no resource found for suffixes {-context.xml, Context.groovy}.
      21:23:37.970 [main] INFO org.springframework.test.context.support.AnnotationConfigContextLoaderUtils - Could not detect default configuration classes for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]: HelloControllerTest does not declare any static, non-private, non-final, nested classes annotated with @Configuration.
      21:23:38.286 [main] DEBUG org.springframework.test.context.support.ActiveProfilesUtils - Could not find an 'annotation declaring class' for annotation type [org.springframework.test.context.ActiveProfiles] and class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]
      21:23:38.646 [main] DEBUG org.springframework.context.annotation.ClassPathScanningCandidateComponentProvider - Identified candidate component class: file [/app/target/classes/com/ourchitecture/tutorials/java/springboot/Application.class]
      21:23:38.736 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Found @SpringBootConfiguration com.ourchitecture.tutorials.java.springboot.Application for test class com.ourchitecture.tutorials.java.springboot.HelloControllerTest
      21:23:39.036 [main] DEBUG org.springframework.boot.test.context.SpringBootTestContextBootstrapper - @TestExecutionListeners is not present for class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]: using defaults.
      21:23:39.038 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Loaded default TestExecutionListener class names from location [META-INF/spring.factories]: [org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener, org.springframework.boot.test.mock.mockito.ResetMocksTestExecutionListener, org.springframework.boot.test.autoconfigure.restdocs.RestDocsTestExecutionListener, org.springframework.boot.test.autoconfigure.web.client.MockRestServiceServerResetTestExecutionListener, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcPrintOnlyOnFailureTestExecutionListener, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverTestExecutionListener, org.springframework.boot.test.autoconfigure.webservices.client.MockWebServiceServerTestExecutionListener, org.springframework.test.context.web.ServletTestExecutionListener, org.springframework.test.context.support.DirtiesContextBeforeModesTestExecutionListener, org.springframework.test.context.support.DependencyInjectionTestExecutionListener, org.springframework.test.context.support.DirtiesContextTestExecutionListener, org.springframework.test.context.transaction.TransactionalTestExecutionListener, org.springframework.test.context.jdbc.SqlScriptsTestExecutionListener, org.springframework.test.context.event.EventPublishingTestExecutionListener]
      21:23:39.083 [main] DEBUG org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Skipping candidate TestExecutionListener [org.springframework.test.context.transaction.TransactionalTestExecutionListener] due to a missing dependency. Specify custom listener classes or make the default listener classes and their required dependencies available. Offending class: [org/springframework/transaction/TransactionDefinition]
      21:23:39.084 [main] DEBUG org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Skipping candidate TestExecutionListener [org.springframework.test.context.jdbc.SqlScriptsTestExecutionListener] due to a missing dependency. Specify custom listener classes or make the default listener classes and their required dependencies available. Offending class: [org/springframework/transaction/interceptor/TransactionAttribute]
      21:23:39.085 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Using TestExecutionListeners: [org.springframework.test.context.web.ServletTestExecutionListener@4dc8caa7, org.springframework.test.context.support.DirtiesContextBeforeModesTestExecutionListener@1d730606, org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener@3bcbb589, org.springframework.boot.test.autoconfigure.SpringBootDependencyInjectionTestExecutionListener@3b00856b, org.springframework.test.context.support.DirtiesContextTestExecutionListener@3016fd5e, org.springframework.test.context.event.EventPublishingTestExecutionListener@35d08e6c, org.springframework.boot.test.mock.mockito.ResetMocksTestExecutionListener@53d102a2, org.springframework.boot.test.autoconfigure.restdocs.RestDocsTestExecutionListener@6c45ee6e, org.springframework.boot.test.autoconfigure.web.client.MockRestServiceServerResetTestExecutionListener@6b3e12b5, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcPrintOnlyOnFailureTestExecutionListener@5aac4250, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverTestExecutionListener@1338fb5, org.springframework.boot.test.autoconfigure.webservices.client.MockWebServiceServerTestExecutionListener@42463763]
      21:23:39.095 [main] DEBUG org.springframework.test.context.support.AbstractDirtiesContextTestExecutionListener - Before test class: context [DefaultTestContext@5911e990 testClass = HelloControllerTest, testInstance = [null], testMethod = [null], testException = [null], mergedContextConfiguration = [WebMergedContextConfiguration@31000e60 testClass = HelloControllerTest, locations = '{}', classes = '{class com.ourchitecture.tutorials.java.springboot.Application}', contextInitializerClasses = '[]', activeProfiles = '{}', propertySourceLocations = '{}', propertySourceProperties = '{org.springframework.boot.test.context.SpringBootTestContextBootstrapper=true}', contextCustomizers = set[[ImportsContextCustomizer@1d470d0 key = [org.springframework.boot.test.autoconfigure.web.servlet.MockMvcAutoConfiguration, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcWebClientAutoConfiguration, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcWebDriverAutoConfiguration, org.springframework.boot.autoconfigure.security.oauth2.client.servlet.OAuth2ClientAutoConfiguration, org.springframework.boot.autoconfigure.security.oauth2.resource.servlet.OAuth2ResourceServerAutoConfiguration, org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration, org.springframework.boot.autoconfigure.security.servlet.SecurityFilterAutoConfiguration, org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcSecurityConfiguration]], org.springframework.boot.test.context.filter.ExcludeFilterContextCustomizer@7975d1d8, org.springframework.boot.test.json.DuplicateJsonObjectContextCustomizerFactory$DuplicateJsonObjectContextCustomizer@5167f57d, org.springframework.boot.test.mock.mockito.MockitoContextCustomizer@0, org.springframework.boot.test.web.client.TestRestTemplateContextCustomizer@41488b16, org.springframework.boot.test.autoconfigure.properties.PropertyMappingContextCustomizer@4b3fa0b3, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverContextCustomizerFactory$Customizer@21d03963, org.springframework.boot.test.context.SpringBootTestArgs@1], resourceBasePath = 'src/main/webapp', contextLoader = 'org.springframework.boot.test.context.SpringBootContextLoader', parent = [null]], attributes = map['org.springframework.test.context.web.ServletTestExecutionListener.activateListener' -> true]], class annotated with @DirtiesContext [false] with mode [null].
      21:23:39.281 [main] DEBUG org.springframework.test.context.support.TestPropertySourceUtils - Adding inlined properties to environment: {spring.jmx.enabled=false, org.springframework.boot.test.context.SpringBootTestContextBootstrapper=true}

        .   ____          _            __ _ _
      /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
      ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
      \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
        '  |____| .__|_| |_|_| |_\__, | / / / /
      =========|_|==============|___/=/_/_/_/
      :: Spring Boot ::        (v2.3.3.RELEASE)

      2020-12-23 21:23:40.178  INFO 83 --- [           main] c.o.t.j.springboot.HelloControllerTest   : Starting HelloControllerTest on docker-desktop with PID 83 (started by root in /app)
      2020-12-23 21:23:40.183  INFO 83 --- [           main] c.o.t.j.springboot.HelloControllerTest   : No active profile set, falling back to default profiles: default
      2020-12-23 21:23:45.244  INFO 83 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
      2020-12-23 21:23:46.437  INFO 83 --- [           main] o.s.b.t.m.w.SpringBootMockServletContext : Initializing Spring TestDispatcherServlet ''
      2020-12-23 21:23:46.438  INFO 83 --- [           main] o.s.t.web.servlet.TestDispatcherServlet  : Initializing Servlet ''
      2020-12-23 21:23:46.481  INFO 83 --- [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 2 endpoint(s) beneath base path '/actuator'
      2020-12-23 21:23:46.553  INFO 83 --- [           main] o.s.t.web.servlet.TestDispatcherServlet  : Completed initialization in 115 ms
      2020-12-23 21:23:46.656  INFO 83 --- [           main] c.o.t.j.springboot.HelloControllerTest   : Started HelloControllerTest in 7.36 seconds (JVM running for 10.764)
      [INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 10.315 s - in com.ourchitecture.tutorials.java.springboot.HelloControllerTest
      2020-12-23 21:23:48.041  INFO 83 --- [extShutdownHook] o.s.s.concurrent.ThreadPoolTaskExecutor  : Shutting down ExecutorService 'applicationTaskExecutor'
      [INFO]
      [INFO] Results:
      [INFO]
      [INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
      [INFO]
      [INFO]
      [INFO] --- maven-jar-plugin:3.2.0:jar (default-jar) @ java-spring-boot-hello ---
      [INFO] Building jar: /app/target/java-spring-boot-hello-0.0.1-SNAPSHOT.jar
      [INFO]
      [INFO] --- spring-boot-maven-plugin:2.3.3.RELEASE:repackage (repackage) @ java-spring-boot-hello ---
      [INFO] Replacing main artifact with repackaged archive
      [INFO] ------------------------------------------------------------------------
      [INFO] BUILD SUCCESS
      [INFO] ------------------------------------------------------------------------
      [INFO] Total time:  01:58 min
      [INFO] Finished at: 2020-12-23T21:24:21Z
      [INFO] ------------------------------------------------------------------------
   ```

7. Start the application by typing `make start`. You should see output similar to the below:

   ```shell
   make start
      38db98874bcf86687fd23fae9fe3a592726ea46f10e79319f6572b526ed7c788
      Docker image "our-scripts-spring-boot-app-make" started at http://localhost:3000
      NOTE: This could take several seconds to minutes to start...
      Use "make logs" to check the logs for status
   ```

8. Type `make logs` to check the application logs. You should see output similar to the below:

   ```shell
   make logs
     Downloading https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.6.3/apache-maven-3.6.3-bin.zip
     ................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
     Unzipping /root/.m2/wrapper/dists/apache-maven-3.6.3-bin/1iopthnavndlasol9gbrbg6bf2/apache-maven-3.6.3-bin.zip to /root/.m2/wrapper/dists/apache-maven-3.6.3-bin/1iopthnavndlasol9gbrbg6bf2
     Set executable permissions for: /root/.m2/wrapper/dists/apache-maven-3.6.3-bin/1iopthnavndlasol9gbrbg6bf2/apache-maven-3.6.3/bin/mvn
     [INFO] Scanning for projects...
     [INFO]
     [INFO] --< com.ourchitecture.tutorials.java.springboot:java-spring-boot-hello >--
     [INFO] Building java-spring-boot-hello 0.0.1-SNAPSHOT
     [INFO] --------------------------------[ jar ]---------------------------------
     [INFO]
     [INFO] >>> spring-boot-maven-plugin:2.3.3.RELEASE:run (default-cli) > test-compile @ java-spring-boot-hello >>>
     [INFO]
     [INFO] --- maven-resources-plugin:3.1.0:resources (default-resources) @ java-spring-boot-hello ---
     [INFO] Using 'UTF-8' encoding to copy filtered resources.
     [INFO] Copying 1 resource
     [INFO] Copying 0 resource
     [INFO]
     [INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ java-spring-boot-hello ---
     [INFO] Nothing to compile - all classes are up to date
     [INFO]
     [INFO] --- maven-resources-plugin:3.1.0:testResources (default-testResources) @ java-spring-boot-hello ---
     [INFO] Using 'UTF-8' encoding to copy filtered resources.
     [INFO] skip non existing resourceDirectory /app/src/test/resources
     [INFO]
     [INFO] --- maven-compiler-plugin:3.8.1:testCompile (default-testCompile) @ java-spring-boot-hello ---
     [INFO] Nothing to compile - all classes are up to date
     [INFO]
     [INFO] <<< spring-boot-maven-plugin:2.3.3.RELEASE:run (default-cli) < test-compile @ java-spring-boot-hello <<<
     [INFO]
     [INFO]
     [INFO] --- spring-boot-maven-plugin:2.3.3.RELEASE:run (default-cli) @ java-spring-boot-hello ---
     [INFO] Attaching agents: []

       .   ____          _            __ _ _
     /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
     ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
     \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
       '  |____| .__|_| |_|_| |_\__, | / / / /
     =========|_|==============|___/=/_/_/_/
     :: Spring Boot ::        (v2.3.3.RELEASE)

     2020-12-23 21:49:26.510  INFO 72 --- [           main] c.o.t.java.springboot.Application        : Starting Application on 349a74e50718 with PID 72 (/app/target/classes started by root in /app)
     2020-12-23 21:49:26.516  INFO 72 --- [           main] c.o.t.java.springboot.Application        : No active profile set, falling back to default profiles: default
     2020-12-23 21:49:28.729  INFO 72 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
     2020-12-23 21:49:28.747  INFO 72 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
     2020-12-23 21:49:28.747  INFO 72 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.37]
     2020-12-23 21:49:28.872  INFO 72 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
     2020-12-23 21:49:28.872  INFO 72 --- [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 2270 ms
     2020-12-23 21:49:29.363  INFO 72 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
     2020-12-23 21:49:29.674  INFO 72 --- [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 2 endpoint(s) beneath base path '/actuator'
     2020-12-23 21:49:29.760  INFO 72 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
     2020-12-23 21:49:29.789  INFO 72 --- [           main] c.o.t.java.springboot.Application        : Started Application in 4.433 seconds (JVM running for 5.337)
   ```

9. Type `curl localhost:3000` or open a web browser and visit http://localhost:3000. You should see a welcome message like "Greetings from Spring Boot!" in the output.

10. Stop the application by typing `make stop`. You should see output similar to the below:

    ```shell
    make stop
     our-scripts-spring-boot-app-make
     Docker image "our-scripts-spring-boot-app-make" stopped and removed
    ```

11. Copy the file ".env.example" and rename the copy as simply ".env". Review the variable values in the file. The name of the application should be globally unique, since the URL will need to be globally unique (e.g. http://app-our-tutorials-java-hello.azurewebsites.net). Change the values as needed. The resource group name should already exist. To get a list of existing resource groups type `make azure-resource-groups-list`. The AppService Plan name should already exist. To get a list of existing plans type `make azure-app-service-plans-list ARM_RESOURCE_GROUP=rg-our-tutorials` where "rg-our-tutorials" is the name of the resource group to deploy to.

12. Deploy the application to Azure by typing `make install ENV_FILE=.env`. You should see output similar to the below:

    ```shell
    make install ENV_FILE=.env
        Deploying webapp...
        Downloading https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.6.3/apache-maven-3.6.3-bin.zip
        ................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
        Unzipping /root/.m2/wrapper/dists/apache-maven-3.6.3-bin/1iopthnavndlasol9gbrbg6bf2/apache-maven-3.6.3-bin.zip to /root/.m2/wrapper/dists/apache-maven-3.6.3-bin/1iopthnavndlasol9gbrbg6bf2
        Set executable permissions for: /root/.m2/wrapper/dists/apache-maven-3.6.3-bin/1iopthnavndlasol9gbrbg6bf2/apache-maven-3.6.3/bin/mvn
        [INFO] Scanning for projects...
        [INFO]
        [INFO] --< com.ourchitecture.tutorials.java.springboot:java-spring-boot-hello >--
        [INFO] Building java-spring-boot-hello 0.0.1-SNAPSHOT
        [INFO] --------------------------------[ jar ]---------------------------------
        [INFO]
        [INFO] --- maven-clean-plugin:3.1.0:clean (default-clean) @ java-spring-boot-hello ---
        [INFO]
        [INFO] --- maven-resources-plugin:3.1.0:resources (default-resources) @ java-spring-boot-hello ---
        [INFO] Using 'UTF-8' encoding to copy filtered resources.
        [INFO] Copying 1 resource
        [INFO] Copying 0 resource
        [INFO]
        [INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ java-spring-boot-hello ---
        [INFO] Changes detected - recompiling the module!
        [INFO] Compiling 2 source files to /app/target/classes
        [INFO]
        [INFO] --- maven-resources-plugin:3.1.0:testResources (default-testResources) @ java-spring-boot-hello ---
        [INFO] Using 'UTF-8' encoding to copy filtered resources.
        [INFO] skip non existing resourceDirectory /app/src/test/resources
        [INFO]
        [INFO] --- maven-compiler-plugin:3.8.1:testCompile (default-testCompile) @ java-spring-boot-hello ---
        [INFO] Changes detected - recompiling the module!
        [INFO] Compiling 2 source files to /app/target/test-classes
        [INFO]
        [INFO] --- maven-surefire-plugin:2.22.2:test (default-test) @ java-spring-boot-hello ---
        [INFO]
        [INFO] -------------------------------------------------------
        [INFO]  T E S T S
        [INFO] -------------------------------------------------------
        [INFO] Running com.ourchitecture.tutorials.java.springboot.HelloControllerTest
        17:13:28.961 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating CacheAwareContextLoaderDelegate from class [org.springframework.test.context.cache.DefaultCacheAwareContextLoaderDelegate]
        17:13:28.986 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating BootstrapContext using constructor [public org.springframework.test.context.support.DefaultBootstrapContext(java.lang.Class,org.springframework.test.context.CacheAwareContextLoaderDelegate)]
        17:13:29.076 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating TestContextBootstrapper for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest] from class [org.springframework.boot.test.context.SpringBootTestContextBootstrapper]
        17:13:29.120 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Neither @ContextConfiguration nor @ContextHierarchy found for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest], using SpringBootContextLoader
        17:13:29.134 [main] DEBUG org.springframework.test.context.support.AbstractContextLoader - Did not detect default resource location for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]: class path resource [com/ourchitecture/tutorials/java/springboot/HelloControllerTest-context.xml] does not exist
        17:13:29.136 [main] DEBUG org.springframework.test.context.support.AbstractContextLoader - Did not detect default resource location for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]: class path resource [com/ourchitecture/tutorials/java/springboot/HelloControllerTestContext.groovy] does not exist
        17:13:29.137 [main] INFO org.springframework.test.context.support.AbstractContextLoader - Could not detect default resource locations for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]: no resource found for suffixes {-context.xml, Context.groovy}.
        17:13:29.139 [main] INFO org.springframework.test.context.support.AnnotationConfigContextLoaderUtils - Could not detect default configuration classes for test class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]: HelloControllerTest does not declare any static, non-private, non-final, nested classes annotated with @Configuration.
        17:13:29.681 [main] DEBUG org.springframework.test.context.support.ActiveProfilesUtils - Could not find an 'annotation declaring class' for annotation type [org.springframework.test.context.ActiveProfiles] and class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]
        17:13:30.059 [main] DEBUG org.springframework.context.annotation.ClassPathScanningCandidateComponentProvider - Identified candidate component class: file [/app/target/classes/com/ourchitecture/tutorials/java/springboot/Application.class]
        17:13:30.110 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Found @SpringBootConfiguration com.ourchitecture.tutorials.java.springboot.Application for test class com.ourchitecture.tutorials.java.springboot.HelloControllerTest
        17:13:30.359 [main] DEBUG org.springframework.boot.test.context.SpringBootTestContextBootstrapper - @TestExecutionListeners is not present for class [com.ourchitecture.tutorials.java.springboot.HelloControllerTest]: using defaults.
        17:13:30.360 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Loaded default TestExecutionListener class names from location [META-INF/spring.factories]: [org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener, org.springframework.boot.test.mock.mockito.ResetMocksTestExecutionListener, org.springframework.boot.test.autoconfigure.restdocs.RestDocsTestExecutionListener, org.springframework.boot.test.autoconfigure.web.client.MockRestServiceServerResetTestExecutionListener, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcPrintOnlyOnFailureTestExecutionListener, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverTestExecutionListener, org.springframework.boot.test.autoconfigure.webservices.client.MockWebServiceServerTestExecutionListener, org.springframework.test.context.web.ServletTestExecutionListener, org.springframework.test.context.support.DirtiesContextBeforeModesTestExecutionListener, org.springframework.test.context.support.DependencyInjectionTestExecutionListener, org.springframework.test.context.support.DirtiesContextTestExecutionListener, org.springframework.test.context.transaction.TransactionalTestExecutionListener, org.springframework.test.context.jdbc.SqlScriptsTestExecutionListener, org.springframework.test.context.event.EventPublishingTestExecutionListener]
        17:13:30.385 [main] DEBUG org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Skipping candidate TestExecutionListener [org.springframework.test.context.transaction.TransactionalTestExecutionListener] due to a missing dependency. Specify custom listener classes or make the default listener classes and their required dependencies available. Offending class: [org/springframework/transaction/interceptor/TransactionAttributeSource]
        17:13:30.387 [main] DEBUG org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Skipping candidate TestExecutionListener [org.springframework.test.context.jdbc.SqlScriptsTestExecutionListener] due to a missing dependency. Specify custom listener classes or make the default listener classes and their required dependencies available. Offending class: [org/springframework/transaction/interceptor/TransactionAttribute]
        17:13:30.389 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Using TestExecutionListeners: [org.springframework.test.context.web.ServletTestExecutionListener@404bbcbd, org.springframework.test.context.support.DirtiesContextBeforeModesTestExecutionListener@1e81f160, org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener@1acaf3d, org.springframework.boot.test.autoconfigure.SpringBootDependencyInjectionTestExecutionListener@6986852, org.springframework.test.context.support.DirtiesContextTestExecutionListener@1bab8268, org.springframework.test.context.event.EventPublishingTestExecutionListener@a307a8c, org.springframework.boot.test.mock.mockito.ResetMocksTestExecutionListener@6e01f9b0, org.springframework.boot.test.autoconfigure.restdocs.RestDocsTestExecutionListener@2b9ed6da, org.springframework.boot.test.autoconfigure.web.client.MockRestServiceServerResetTestExecutionListener@6c61a903, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcPrintOnlyOnFailureTestExecutionListener@658c5a19, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverTestExecutionListener@421e361, org.springframework.boot.test.autoconfigure.webservices.client.MockWebServiceServerTestExecutionListener@59d4cd39]
        17:13:30.406 [main] DEBUG org.springframework.test.context.support.AbstractDirtiesContextTestExecutionListener - Before test class: context [DefaultTestContext@57ad2aa7 testClass = HelloControllerTest, testInstance = [null], testMethod = [null], testException = [null], mergedContextConfiguration = [WebMergedContextConfiguration@5b3f61ff testClass = HelloControllerTest, locations = '{}', classes = '{class com.ourchitecture.tutorials.java.springboot.Application}', contextInitializerClasses = '[]', activeProfiles = '{}', propertySourceLocations = '{}', propertySourceProperties = '{org.springframework.boot.test.context.SpringBootTestContextBootstrapper=true}', contextCustomizers = set[[ImportsContextCustomizer@3e2059ae key = [org.springframework.boot.test.autoconfigure.web.servlet.MockMvcAutoConfiguration, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcWebClientAutoConfiguration, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcWebDriverAutoConfiguration, org.springframework.boot.autoconfigure.security.oauth2.client.servlet.OAuth2ClientAutoConfiguration, org.springframework.boot.autoconfigure.security.oauth2.resource.servlet.OAuth2ResourceServerAutoConfiguration, org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration, org.springframework.boot.autoconfigure.security.servlet.SecurityFilterAutoConfiguration, org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcSecurityConfiguration]], org.springframework.boot.test.context.filter.ExcludeFilterContextCustomizer@236e3f4e, org.springframework.boot.test.json.DuplicateJsonObjectContextCustomizerFactory$DuplicateJsonObjectContextCustomizer@dd0c991, org.springframework.boot.test.mock.mockito.MockitoContextCustomizer@0, org.springframework.boot.test.web.client.TestRestTemplateContextCustomizer@7e9131d5, org.springframework.boot.test.autoconfigure.properties.PropertyMappingContextCustomizer@4b3fa0b3, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverContextCustomizerFactory$Customizer@6a370f4, org.springframework.boot.test.context.SpringBootTestArgs@1], resourceBasePath = 'src/main/webapp', contextLoader = 'org.springframework.boot.test.context.SpringBootContextLoader', parent = [null]], attributes = map['org.springframework.test.context.web.ServletTestExecutionListener.activateListener' -> true]], class annotated with @DirtiesContext [false] with mode [null].
        17:13:30.583 [main] DEBUG org.springframework.test.context.support.TestPropertySourceUtils - Adding inlined properties to environment: {spring.jmx.enabled=false, org.springframework.boot.test.context.SpringBootTestContextBootstrapper=true}

          .   ____          _            __ _ _
        /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
        ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
        \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
          '  |____| .__|_| |_|_| |_\__, | / / / /
        =========|_|==============|___/=/_/_/_/
        :: Spring Boot ::        (v2.3.3.RELEASE)

        2020-12-24 17:13:31.988  INFO 101 --- [           main] c.o.t.j.springboot.HelloControllerTest   : Starting HelloControllerTest on docker-desktop with PID 101 (started by root in /app)
        2020-12-24 17:13:32.010  INFO 101 --- [           main] c.o.t.j.springboot.HelloControllerTest   : No active profile set, falling back to default profiles: default
        2020-12-24 17:13:34.950  INFO 101 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
        2020-12-24 17:13:35.904  INFO 101 --- [           main] o.s.b.t.m.w.SpringBootMockServletContext : Initializing Spring TestDispatcherServlet ''
        2020-12-24 17:13:35.905  INFO 101 --- [           main] o.s.t.web.servlet.TestDispatcherServlet  : Initializing Servlet ''
        2020-12-24 17:13:35.937  INFO 101 --- [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 2 endpoint(s) beneath base path '/actuator'
        2020-12-24 17:13:36.015  INFO 101 --- [           main] o.s.t.web.servlet.TestDispatcherServlet  : Completed initialization in 110 ms
        2020-12-24 17:13:36.087  INFO 101 --- [           main] c.o.t.j.springboot.HelloControllerTest   : Started HelloControllerTest in 5.452 seconds (JVM running for 9.489)
        [INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 8.142 s - in com.ourchitecture.tutorials.java.springboot.HelloControllerTest
        2020-12-24 17:13:36.979  INFO 101 --- [extShutdownHook] o.s.s.concurrent.ThreadPoolTaskExecutor  : Shutting down ExecutorService 'applicationTaskExecutor'
        [INFO]
        [INFO] Results:
        [INFO]
        [INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
        [INFO]
        [INFO]
        [INFO] --- maven-jar-plugin:3.2.0:jar (default-jar) @ java-spring-boot-hello ---
        [INFO] Building jar: /app/target/java-spring-boot-hello-0.0.1-SNAPSHOT.jar
        [INFO]
        [INFO] --- spring-boot-maven-plugin:2.3.3.RELEASE:repackage (repackage) @ java-spring-boot-hello ---
        [INFO] Replacing main artifact with repackaged archive
        [INFO]
        [INFO] --- azure-webapp-maven-plugin:1.8.0:deploy (default-cli) @ java-spring-boot-hello ---
        [INFO]
        [INFO] Data/Telemetry
        [INFO] ---------
        [INFO] This project collects usage data and sends it to Microsoft to help improve our products and services.
        [INFO] Read Microsoft's privacy statement to learn more: https://privacy.microsoft.com/en-us/privacystatement.
        [INFO]
        [INFO] You can change your telemetry configuration through 'allowTelemetry' property.
        [INFO] For more information, please go to https://aka.ms/azure-maven-config.
        WARNING: An illegal reflective access operation has occurred
        WARNING: Illegal reflective access by com.microsoft.applicationinsights.core.dependencies.xstream.core.util.Fields (file:/root/.m2/repository/com/microsoft/azure/applicationinsights-core/2.5.1-BETA/applicationinsights-core-2.5.1-BETA.jar) to field java.util.TreeMap.comparator
        WARNING: Please consider reporting this to the maintainers of com.microsoft.applicationinsights.core.dependencies.xstream.core.util.Fields
        WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
        WARNING: All illegal access operations will be denied in a future release
        [INFO] [Correlation ID: 8277bc40-8bc8-4283-88e8-5972c15d7baa] Instance discovery was successful
        [INFO] Updating app service plan
        [INFO] Updating target Web App...
        [INFO] Successfully updated Web App.
        [INFO] Using 'UTF-8' encoding to copy filtered resources.
        [INFO] Copying 1 resource to /app/target/azure-webapp/app-our-tutorials-java-hello-767bb64e-9cd1-4923-8974-38fa6a260bd3
        [INFO] Trying to deploy artifact to app-our-tutorials-java-hello...
        [INFO] Renaming /app/target/azure-webapp/app-our-tutorials-java-hello-767bb64e-9cd1-4923-8974-38fa6a260bd3/java-spring-boot-hello-0.0.1-SNAPSHOT.jar to app.jar
        [INFO] Deploying the zip package app-our-tutorials-java-hello-767bb64e-9cd1-4923-8974-38fa6a260bd39606545483513089732.zip...
        [INFO] Exception occurred during deployment: java.net.SocketTimeoutException: timeout, retry immediately(1/3)...
        [INFO] Successfully deployed the artifact to https://app-our-tutorials-java-hello.azurewebsites.net
        [INFO] ------------------------------------------------------------------------
        [INFO] BUILD SUCCESS
        [INFO] ------------------------------------------------------------------------
        [INFO] Total time:  08:19 min
        [INFO] Finished at: 2020-12-24T17:20:10Z
        [INFO] ------------------------------------------------------------------------
    ```

13. Lookup the URL in the output of your deployed application. Type `curl ...` with your unique URL or open a web browser and visit the application. You should see a welcome message like "Welcome to Express" in the output. _\*If you check this URL immediately after deploying, it may take several seconds to respond while the application starts._

14. To remove the new application, type `make uninstall ENV_FILE=.env`.

15. Check the list of deployed Azure "WebApp" instances by typing `make azure-webapps-list ARM_RESOURCE_GROUP=rg-our-tutorials`.

[java]: https://openjdk.java.net/
[tutorial-base]: https://docs.microsoft.com/en-us/azure/app-service/quickstart-java?tabs=javase&pivots=platform-linux
[tutorial-rg]: ../../../terraform/azure/resource-group/#readme
[tutorial-app-service-plan]: ../infrastructure/#readme
[git]: ../../../../../docs/git.md
[make]: ../../../../../docs/make.md
[docker]: ../../../../../docs/docker.md
[azure-account]: https://azure.microsoft.com/en-us/free/
