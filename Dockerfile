FROM python:3.11-slim

WORKDIR /app

# Env hygiene
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY app.py .

# DB persistent folder
RUN mkdir -p /app/data

# Expose Streamlit port
EXPOSE 8555

# Run Streamlit
CMD ["streamlit", "run", "app.py", \
     "--server.port=8555", \
     "--server.address=0.0.0.0"]
