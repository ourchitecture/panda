# Tutorials: Node.js on Azure

## What you will build

Deploy a [Node.js][nodejs] application to Azure using the Azure CLI. This guide builds on the quick start guide ["Create a Node.js web app in Azure"][tutorial-base].

## What you will need

The following prerequisites are required in order to follow the steps in this tutorial:

- A [Microsoft Azure account][azure-account] with an existing App Service Plan and permission to create and deploy an AppService (this Node.js application) to the plan. _\*See the tutorials to [create a new resource group][tutorial-rg] and [create a new plan][tutorial-app-service-plan]._
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

4. Change to the directory of this tutorial project by typing `cd ./src/tutorials/node/azure/app`.

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

6. Initialize the application and install dependencies by typing `make init`. You should see output similar to the below:

   ```shell
   make init
      yarn install v1.22.10
      [1/4] Resolving packages...
      [2/4] Fetching packages...
      [3/4] Linking dependencies...
      [4/4] Building fresh packages...
      Done in 13.58s.
   ```

7. Start the application by typing `make start`. You should see output similar to the below:

   ```shell
   make start
      45a85c8c3427ae75f7c89293577172703e485db083628b98c2f85377b08ffbe0
      Docker image "our-tutorials-node-azure" started at http://localhost:3000
   ```

8. Type `curl localhost:3000` or open a web browser and visit http://localhost:3000. You should see a welcome message like "Welcome to Express" in the output.

9. Stop the application by typing `make stop`. You should see output similar to the below:

   ```shell
   make stop
    our-tutorials-node-azure
    Docker image "our-tutorials-node-azure" stopped and removed
   ```

10. Copy the file ".env.example" and rename the copy as simply ".env". Review the variable values in the file. The name of the application should be globally unique, since the URL will need to be globally unique (e.g. http://our-tutorials-node-hello.azurewebsites.net). Change the values as needed. The resource group name should already exist. To get a list of existing resource groups type `make azure-resource-groups-list`. The AppService Plan name should already exist. To get a list of existing plans type `make azure-app-service-plans-list ARM_RESOURCE_GROUP=our-tutorials-rg` where "our-tutorials-rg" is the name of the resource group to deploy to.

11. Deploy the application to Azure by typing `make install ENV_FILE=.env`. You should see output similar to the below:

    ```shell
    make install ENV_FILE=.env
      Deploying webapp...
      The webapp 'our-tutorials-node-hello' doesn't exist
      Creating webapp 'our-tutorials-node-hello' ...
      Configuring default logging for the app, if not already enabled
      Creating zip with contents of dir /app ...
      Getting scm site credentials for zip deployment
      Starting zip deployment. This operation can take a while to complete ...
      Deployment endpoint responded with status code 202
      You can launch the app at http://our-tutorials-node-hello.azurewebsites.net
      {
        "URL": "http://our-tutorials-node-hello.azurewebsites.net",
        "appserviceplan": "our-tutorials-linux-app-plan",
        "location": "eastus",
        "name": "our-tutorials-node-hello",
        "os": "Linux",
        "resourcegroup": "our-tutorials-rg",
        "runtime_version": "node|10.14",
        "runtime_version_detected": "0.0",
        "sku": "FREE",
        "src_path": "//app"
      }
    ```

12. Lookup the URL in the output of your deployed application. Type `curl ...` with your unique URL or open a web browser and visit the application. You should see a welcome message like "Welcome to Express" in the output. _\*If you check this URL immediately after deploying, it may take several seconds to respond while the application starts._

13. To remove the new application, type `make uninstall ENV_FILE=.env`.

14. Check the list of deployed Azure "WebApp" instances by typing `make azure-webapps-list ARM_RESOURCE_GROUP=our-tutorials-rg`.

[nodejs]: https://nodejs.org/en/
[tutorial-base]: https://docs.microsoft.com/en-us/azure/app-service/quickstart-nodejs?pivots=platform-linux
[tutorial-rg]: ../../../terraform/azure/resource-group/#readme
[tutorial-app-service-plan]: ../../../terraform/azure/app-service-plan/#readme
[git]: ../../../../../docs/git.md
[make]: ../../../../../docs/make.md
[docker]: ../../../../../docs/docker.md
[azure-account]: https://azure.microsoft.com/en-us/free/
