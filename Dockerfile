FROM python:3.11-slim

# Install dependencies
RUN pip install --no-cache-dir boto3 kubernetes requests

# Copy agent
COPY eks_bedrock_agent.py /app/eks_bedrock_agent.py
WORKDIR /app

CMD ["python", "eks_bedrock_agent.py"]
