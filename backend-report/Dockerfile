# Start from the latest golang base image
FROM golang:1.24 AS builder 
# Исправил as на AS и стабилизировал версию golang

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .


######## Start a new stage from scratch #######
FROM alpine:3.22
# стабилизировал версию alpine

WORKDIR /app
# Исправил название рабочей директории

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /app/main .
# Исправил builderer на builder

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["/app/main"] 