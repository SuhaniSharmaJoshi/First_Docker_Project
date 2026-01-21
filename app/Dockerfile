FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Copy dependencies file
COPY requirements.txt ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . ./

# Expose Flask port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
