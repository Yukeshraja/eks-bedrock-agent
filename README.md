# eks-bedrock-agent
This is your main agent that fetches pods from EKS and sends insights to Teams via Bedrock.



# EKS Bedrock Agent

This agent fetches Kubernetes pod information from an EKS cluster, sends it to **AWS Bedrock LLM** for analysis, and posts alerts to **Microsoft Teams**.

## Setup

1. Configure AWS CLI or use IRSA in EKS.
2. Install dependencies:
```bash
pip install -r requirements.txt


```bash  
export EKS_CLUSTER_NAME=my‑eks‑cluster  
export TEAMS_WEBHOOK_URL=<your‑webhook>  
python eks‑bedrock‑agent.py


Set your Teams webhook URL in eks_bedrock_agent.py.

Run the agent:

python eks_bedrock_agent.py

Docker

Build and run:

docker build -t eks-bedrock-agent .
docker run -e AWS_REGION=us-east-1 eks-bedrock-agent
