# Use the official Python image from the Docker Hub
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Run tests
RUN python -m unittest discover tests

# Expose port 5000
EXPOSE 5000

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' myuser
USER myuser

# Set the entrypoint to python
ENTRYPOINT ["python"]

# Specify the command to run the application
CMD ["app.py"]