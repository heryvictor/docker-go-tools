FROM golang:1.19-alpine

# Install desired tools: gocov, gocov-html and golangci-lint
RUN apk --no-cache add ca-certificates bash curl build-base \
    && go install github.com/axw/gocov/gocov@latest \
    && go install github.com/matm/gocov-html/cmd/gocov-html@latest \
    && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.50.1
