SPARK_IMAGE=logimethods/openshift-spark

.PHONY: build clean push deploy destroy

build:
	docker build -t openshift-spark .

clean:
	docker rmi openshift-spark

push: build
	docker tag openshift-spark $(SPARK_IMAGE)
	docker push $(SPARK_IMAGE)

deploy: template.yaml
	oc process -f template.yaml -v SPARK_IMAGE=$(SPARK_IMAGE) > template.active
	oc create -f template.active

destroy: template.active
	oc delete -f template.active
	rm template.active
