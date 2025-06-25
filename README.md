DevOps Intern Project – Nginx Reverse Proxy with Docker Compose
This project sets up a containerized environment using Docker Compose, featuring:

A Golang service (Service 1)
A Python Flask service (Service 2, using uv)
An Nginx reverse proxy that routes all traffic via a single exposed port
All services are containerized and orchestrated using Docker Compose.

Project Structure
. ├── docker-compose.yml ├── nginx │ ├── nginx.conf │ └── Dockerfile ├── service_1 # Golang API │ └── Dockerfile ├── service_2 # Python Flask API │ └── Dockerfile └── README.md

Setup Instructions
Clone the repository:
git clone <your-repo-url>
cd devops_intern_project

2. Run the project:

```bash
docker-compose up --build

Docker Compose will build and start all services inside containers using bridge networking.

Access the services via Nginx on:

http://localhost:8080/service1/ping

http://localhost:8080/service1/hello

http://localhost:8080/service2/ping

http://localhost:8080/service2/hello

How Routing Works (Reverse Proxy)
Nginx is configured to act as a reverse proxy. It listens on port 80 inside the container (mapped to 8080 on host), and routes based on path prefix:

/service1 → Golang API (Service 1 on port 8001)

/service2 → Python Flask API (Service 2 on port 8002)

*Config details can be found in nginx/nginx.conf.

Example:
location /service1/ {
    proxy_pass http://service_1:8001/;
}

location /service2/ {
    proxy_pass http://service_2:8002/;
}

Nginx also logs all requests with timestamps and path details.

*Bonus Features Implemented*

Health Checks: Both services include HTTP health checks using the /ping endpoints.

Custom Nginx Access Logs: Logs timestamp and path of each incoming request.

Bridge Networking: Docker Compose default network allows services to communicate using service names.

Clean Docker Setup: Each service has its own Dockerfile and minimal image size.

UV Support: Python service uses uv for running the Flask app as required.
