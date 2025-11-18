import boto3
import json
import requests
from kubernetes import client, config

# Load kubeconfig (or use IRSA in EKS)
config.load_kube_config()
v1 = client.CoreV1Api()

# Fetch pod info
pods = v1.list_pod_for_all_namespaces(watch=False)
pod_summary = [
    {
        "name": p.metadata.name,
        "namespace": p.metadata.namespace,
        "status": p.status.phase,
        "restarts": sum([cs.restart_count for cs in p.status.container_statuses or []])
    } for p in pods
]

# Prepare Bedrock payload
payload = {
    "context": "EKS Cluster pod summary",
    "pods": pod_summary,
    "question": "Identify pods with repeated restarts and suggest action."
}

# Invoke Bedrock LLM
bedrock = boto3.client('bedrock-runtime', region_name="us-east-1")  # Change region
response = bedrock.invoke_model(
    modelId="amazon.titan",  # Choose your Bedrock model
    contentType="application/json",
    body=json.dumps(payload)
)

output = response['body'].read().decode('utf-8')

# Send alert to Teams
teams_webhook = "<YOUR_TEAMS_WEBHOOK_URL>"
teams_payload = {"text": f"**EKS Cluster Alert:**\n{output}"}
requests.post(teams_webhook, json=teams_payload)

print("Bedrock Output:\n", output)
