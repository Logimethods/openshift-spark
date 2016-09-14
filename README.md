# Apache Spark images for OpenShift

# Build

    make

# Push

    make push REPO=hub.docker.com/r/logimethods
    
# Deploy

    make create

# Zeppelin (external)

    docker pull dylanmei/zeppelin
    docker run --rm -p 8080:8080 dylanmei/zeppelin
