# Use official Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Environment variables
ENV PYTHONUNBUFFERED=1

# Expose port for Streamlit
EXPOSE 8501

# Command to run the application
CMD ["streamlit", "run", "health_assistant.py", "--server.port=8501", "--server.address=0.0.0.0"]