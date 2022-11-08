all: darwin linux windows darwin_arm

darwin:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -trimpath -o build/rocketmq-exporter_amd64

darwin_arm:
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -trimpath -o build/rocketmq-exporter_darwin_arm64

linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -trimpath -o build/rocketmq-exporter_linux_amd64

windows:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -trimpath -o build/rocketmq-exporter_windows_amd64

clean:
	rm -rf build
