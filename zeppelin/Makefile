IMAGE=logimethods/openshift-zeppelin

.PHONY: build clean push deploy destroy

build:
	docker build -t openshift-zeppelin .

clean:
	docker rmi openshift-zeppelin

push: build
	docker tag openshift-zeppelin $(IMAGE)
	docker push $(IMAGE)

deploy: oc process -f template.yaml -v IMAGE=$(IMAGE) > template.active
	oc create -f template.active

destroy: template.active
	oc delete -f template.active
	rm template.active
