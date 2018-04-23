ALL_COMPOSES=-f docker-compose-service-dependencies.yml -f docker-compose.yml
build: package
	docker-compose $(ALL_COMPOSES) build
start-stack: package
	docker-compose $(ALL_COMPOSES) up --build -d
start-infra:
	docker-compose -f docker-compose-service-dependencies.yml up -d
stop-stack:
	docker-compose -f docker-compose-service-dependencies.yml down --remove-orphans
package:
	mvn clean
	mvn $(ARGS) package
rebuild-container:
	docker-compose $(ALL_COMPOSES) stop -t 1 $(APP)
	mvn clean
	mvn package
rebuild-app: rebuild-container
	docker-compose $(ALL_COMPOSES) restart redis
	docker-compose $(ALL_COMPOSES) build $(APP)
	docker-compose $(ALL_COMPOSES) create $(APP)
	docker-compose $(ALL_COMPOSES) start $(APP)
	docker-compose $(ALL_COMPOSES) logs -f $(APP)
docker-tag-and-push:
	docker tag cvc/$(APP) $(REGISTRY)$(APP):$(TAG)
	docker push $(REGISTRY)$(APP):$(TAG)
transform-pod:
	cat $(APP)/kubernets/deploy.yaml.template | sed s/__TAG__/$(TAG)/ > $(APP)/kubernets/deploy.yaml
deploy-pod: transform-pod
	kubectl --kubeconfig ~jenkins/kube/.kube/config-$(ENV) --validate=false apply -f $(APP)/kubernets/deploy.yaml
