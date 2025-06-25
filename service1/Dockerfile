# Start from the official Golang image (for building the app)
FROM golang:1.22
# Set working directory inside the container
WORKDIR /app

# Copy Go source code
COPY . .

# Build the Go application
RUN go mod init service1 || true

RUN go mod tidy
RUN go build -o main . 

# Expose the port the app runs on
EXPOSE 8001

# Command to run the executable
CMD ["./main"]

