build_date = `date +%Y%m%d%H%M`
version = `git rev-parse --short HEAD`
release-image = registry.cn-hangzhou.aliyuncs.com/shovel/shovel-kh:$(build_date)
package-image = registry.cn-hangzhou.aliyuncs.com/shovel-build/shovel-kh:$(build_date)
maven-dir = /Users/dio/.m2


## build package docker image
.PHONY: build-package-image
build-package-image:
	docker build . \
			--no-cache \
			--force-rm \
			-t $(package-image) \
			-f package.Dockerfile

## package
.PHONY: package
package:
	docker run \
		--rm \
		-v $(maven-dir):/root/.m2 \
		-v $(CURDIR):/workspace $(package-image)


## build release docker image
build-release-image:
	docker build . \
		--no-cache \
		--force-rm \
		-t $(release-image) \
		-f release.Dockerfile

## push release docker image
.PHONY: push-release-image
push-release-image:
	docker push $(release-image)