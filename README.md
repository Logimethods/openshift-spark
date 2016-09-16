# Apache Spark images for OpenShift

## Install OpenShift

See [Setup instructions for All-In-One VM that matches Online - version 1.2](https://www.openshift.org/vm/instructions1_2.html)

    vagrant init thesteve0/openshift-origin
    
Edit the generated Vagrantfile:

      config.vm.provider "virtualbox" do |vb|
        vb.memory = "8192"
        vb.cpus = 4
      end
 
Start Vagrant:

    vagrant up

## Connect to OpenShift

### Install the CLI

* See "Client tools:" on [Setup instructions for All-In-One VM that matches Online - version 1.2](https://www.openshift.org/vm/instructions1_2.html) or (probably best) [Installing the CLI](https://docs.openshift.org/latest/cli_reference/get_started_cli.html#installing-the-cli)
* Add the directory containing `oc` to the shell path (if not install through a tool like Homebrew).

### Login to OpenShift

    oc login https://10.2.2.2:8443      [you can choose any user/password you want]
    
### Create and join the Spark Cluster project

    oc new-project spark-cluster --display-name="Spark Cluster" --description="https://github.com/Logimethods/openshift-spark"

## Build & Deploy the Spark Cluster

    cd [root of this Git Project]
    
### [Optional] Build & Push the `logimethods/openshift-spark` Spark Docker Image

    make push REPO=hub.docker.com/r/logimethods
    
### Deploy

    make deploy

## Build & Deploy Zeppelin

    cd zeppelin
    
### [Optional] Build & Push the `logimethods/openshift-zeppelin` Spark Docker Image

    make push REPO=hub.docker.com/r/logimethods
    
### Deploy

    make deploy

## Make use of Zeppelin

* Log in to the [OpenShift Console](https://10.2.2.2:8443/console) with the user/password already defined through the `oc login` command.
* Choose the "Spark Cluster" project
* Create a route to the "spark-master-webui" service
* Open that URL
