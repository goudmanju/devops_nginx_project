# Use Python base image
FROM python:3.13-slim

# Install system dependencies
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Install uv (official method)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Update PATH where uv actually installs
ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /app
COPY . .

# Create virtual environment and sync with lockfile
RUN uv venv && \
    uv pip install -r requirements.txt

# Expose the Flask port
EXPOSE 8002

# Run the Flask app using uv's virtual environment
CMD ["uv","run", "app.py"]