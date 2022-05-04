# Miscellaneous Beginner Commands
> **K8s doc similar to man pages**
<br>kubectl explain <resource> &rarr; `kubectl explain deployment`



Usage|Commands
:---|---:
List All Resources | `kubectl api-resources`
Access api's via curl / browser| `kubectl proxy --port=8080`

|**CRUD Operations**||
:---|---:
|Deployment<br>_no_ ~update~ | `kubectl (create\|edit\|delete) deployment [deploymentName]`|
|


Status : kubectl get (nodes|deployment|replicaset|pods|service)
Debugging :
- kubectl log [podName]
- kubectl describe [podName]
- kubectl exec -it [podName] --/bin/bash

Working with Config File :
- kubectl apply -f [fileName]
- kubectl delete -f [fileName]

Generate Yaml stub : 
> kubectl create deployment sample-deps --image=mysql `--dry-run=client -o yaml`
