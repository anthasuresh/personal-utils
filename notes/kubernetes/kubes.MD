# Kubernetes (k8s) Architecture
>### Why k8s?
>    ![](https://d33wubrfki0l68.cloudfront.net/26a177ede4d7b032362289c6fccd448fc4a91174/eb693/images/docs/container_evolution.svg)

> ### Types of nodes
>  - Master
>  - Worker
>   ![](https://d33wubrfki0l68.cloudfront.net/2475489eaf20163ec0f54ddc1d92aa8d4c87c96b/e7c81/images/docs/components-of-kubernetes.svg)


> **Master / Control-Plane**
> 1. _API Server_ [ kube-apiserver ]
>    - front end for the k8s control plane
>    - Entry point to system ( Schedule / Query )
> 2. _Scheduler_
>    - Selects nodes to run newly created pod (with unassigened node)
> 3. _etcd_
>    - Key value store [Cluster metadata]
> 4. _Controller Manager_
>    - Runs controller process
>    - A Control loop monitors clusters shared state through apiserver 
>    - Attempt to move current state to desired state 
>    - Eg: Node , Job, Endpoint, Service Account & Token Controllers
> 5. _Cloud Controller Manager_
>    - Links your cluster to cloud provider's API
>    - Only runs controllers that are specific to your cloud provider
>    - On-Prem / PC will not have ths component



> **Worker Node**
>
>
> 1. _Kubelet_
>    - Agent running on each node
>    - PodSpecs - Ensure container health
>    - Only manage container created by k8s
> 2. _Kube-Proxy_
>    - Network proxy on each node maintaining N/W rules
>    - Implements part of `SERVICE`
> 3. _Container Runtime_ [ Docker / containerd ]
>    - Software responsible for running containers

> **ADDONS**<br>
> Implements cluster features using  k8s resources (DaemonSet, Deployment, etc)
> ## _DNS_
>   - Required in every node
>   - Containers created by K8s, automatically has this DNS Server
> ## _WEB UI_
  
> **k8s Objects**
>   - Persistent entities in K8s
>   - Represent state of cluster
>   - - `SPEC`    -- User defined
>      - `STATUS` -- K8s modifies it based on system state


---
* Main Features 
  * high availability  -  no downtime 
  * scalability - high performance
  * previeDisaster recovery

* Basic Components 
> **Node**
>- Server [Physical or Virtual machine]
.

> **Pod**
>- Smallest unit of k8s [Abstraction over a container]
>- Creates this running
>- Gets it own IP address

> **Service**
>- Permanent Ip (not coupled with pods)
>- Load Balancer
>- Layer supports multiple pods (communicate inbetween pods)
.

> **Ingress**
>- Handles traffic coming from external 
>- What level is it ? Node or POD ?

> **External Configuration**
>- Config-Map  -- Key / value pair
>- Secret      -- Base64 Encrypted KV pair 

>**Data Persistence** 
>- Volume 
>   >-  Local  -- Within Node Server 
>   >- Remote -- Outside cluster (On-Prem / Cloud storage) 

> **Pod Blueprints**
> - Deployment 
>    > - Abstraction / Blueprint of pods
>    > - Will be used to create replicas    
> - StatefulSet
>    > - Stateful applications / databases will use this component
> * Managing statefulSets in K8s is tedious<br>
> Maintain stateless in K8s pods and StatefulSets / DB's outside K8s

---
> Deployment manages a <br>⤵️ 
> > ReplicaSet manages multiple <br>⤵️
> > > Pod - abstraction of <br>⤵️ 
> > > > Containers 
---

## References

- [Kubes Cheetsheet1](https://medium.com/hashmapinc/30-second-kubernetes-concepts-cheat-sheet-98ba813194cb)
- [ExamSimu-1](https://www.youtube.com/watch?v=X48VuDVv0do)
- [Kubes Cheetsheet](https://cheatography.com//gauravpandey44/cheat-sheets/kubernetes-k8s/pdf/)
- [Katacode Kubes](https://www.katacoda.com/courses/kubernetes)
- [ExamSimulator](https://www.youtube.com/watch?v=9UqkWcdy140)
- [CKAD-Exercise](https://github.com/dgkanatsios/CKAD-exercises)
- [CKAD-Bookmarks](https://github.com/reetasingh/CKAD-Bookmarks)
- [bb-tutorials-and-thoughts](https://medium.com/bb-tutorials-and-thoughts/practice-enough-with-these-questions-for-the-ckad-exam-2f42d1228552)

## Installation
> `Regular` ` **Not Preferred** `
> - [MiniKube](https://minikube.sigs.k8s.io/docs/start/)
> - [Hyperv](https://minikube.sigs.k8s.io/docs/drivers/hyperv/)
> - [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/)
> - Powershell tweaks
> - > $profile<br>set-alias minikube minukibe.exe<br> set-alias kubectl kubectl.exe
> - - Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
> - - Every PS session `kubectl completion powershell | Out-String |Invoke-Expression`
<br>

> `Through script`
> - Install any WSL (preferably ubuntu)
> - Download and execute the script in order 
> - install-minikube-1.sh (**Follow the instructions on screen**)
> - install-minikube-2.sh

