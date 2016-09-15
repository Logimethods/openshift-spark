# Apache Spark images for OpenShift

# Install OpenShift

See [Setup instructions for All-In-One VM that matches Online](https://www.openshift.org/vm/instructions1_2.html)

    vagrant init thesteve0/openshift-origin
    
Edit the generated Vagrantfile:

      config.vm.provider "virtualbox" do |vb|
        vb.memory = "8192"
        vb.cpus = 4
      end
 
Start Vagrant:

    vagrant up

# Connect to OpenShift

## Install the CLI

See "Client tools:" on [Setup instructions for All-In-One VM that matches Online](https://www.openshift.org/vm/instructions1_2.html)

## Login to OpenShift

    oc login https://10.2.2.2:8443
    
## Create and join the Spark Cluster project

    oc new-project spark-cluster --display-name="Spark Cluster" --description="..."
    oc project spark-cluster
    
# Build & Deploy the Spark Cluster

    cd [root of this Git Project]
    
## Build & Push the `logimethods/openshift-spark` Spark Docker Image [Optional]

    make
    make push REPO=hub.docker.com/r/logimethods
    
## Deploy

    make create

# Build & Deploy Zeppelin

    cd zeppelin
    
## Build & Push the `logimethods/openshift-zeppelin` Spark Docker Image [Optional]

    make
    make push REPO=hub.docker.com/r/logimethods
    
## Deploy

    make deploy
