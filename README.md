# eks-bedrock-agent
This is your main agent that fetches pods from EKS and sends insights to Teams via Bedrock.



# EKS Bedrock Agent

This agent fetches Kubernetes pod information from an EKS cluster, sends it to **AWS Bedrock LLM** for analysis, and posts alerts to **Microsoft Teams**.

## Setup

1. Configure AWS CLI or use IRSA in EKS.
2. Install dependencies:
```bash
pip install -r requirements.txt

