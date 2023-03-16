all: darwin linux windows darwin_arm

darwin:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -trimpath -o build/rocketmq-exporter_amd64

darwin_arm:
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -trimpath -o build/rocketmq-exporter_darwin_arm64

linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -trimpath -o build/rocketmq-exporter_linux_arm64
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -trimpath -o build/rocketmq-exporter_linux_amd64
	docker buildx build --build-arg TARGETOS=linux --build-arg TARGETARCH=amd64  -t repo-registry.cn-shanghai.cr.aliyuncs.com/yunxiao-paas/rocketmq-exporter:1.0.1-amd64 . --push
	docker buildx build --build-arg TARGETOS=linux --build-arg TARGETARCH=arm64  -t repo-registry.cn-shanghai.cr.aliyuncs.com/yunxiao-paas/rocketmq-exporter:1.0.1-arm64 . --push
	docker manifest create repo-registry.cn-shanghai.cr.aliyuncs.com/yunxiao-paas/rocketmq-exporter:1.0.1 repo-registry.cn-shanghai.cr.aliyuncs.com/yunxiao-paas/rocketmq-exporter\:1.0.1-amd64 repo-registry.cn-shanghai.cr.aliyuncs.com/yunxiao-paas/rocketmq-exporter\:1.0.1-arm64
	docker manifest annotate repo-registry.cn-shanghai.cr.aliyuncs.com/yunxiao-paas/rocketmq-exporter:1.0.1 repo-registry.cn-shanghai.cr.aliyuncs.com/yunxiao-paas/rocketmq-exporter\:1.0.1-arm64 --os linux --arch arm64
	docker manifest push repo-registry.cn-shanghai.cr.aliyuncs.com/yunxiao-paas/rocketmq-exporter:1.0.1

windows:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -trimpath -o build/rocketmq-exporter_windows_amd64

clean:
	rm -rf build
