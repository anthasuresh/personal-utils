# Kubernetes Architecture
>### Why Kubernetes ?
>    ![](https://d33wubrfki0l68.cloudfront.net/26a177ede4d7b032362289c6fccd448fc4a91174/eb693/images/docs/container_evolution.svg)

> ### Types of nodes
>  - Master
>  - Worker
>   ![](https://d33wubrfki0l68.cloudfront.net/2475489eaf20163ec0f54ddc1d92aa8d4c87c96b/e7c81/images/docs/components-of-kubernetes.svg)


> **Master / Control-Plane**
> 1. _API Server_ [ kube-apiserver ]
>    - front end for the Kubernetes control plane
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
>    - Only manage container created by Kubernetes
> 2. _Kube-Proxy_
>    - Network proxy on each node maintaining N/W rules
>    - Implements part of `SERVICE`
> 3. _Container Runtime_ [ Docker / containerd ]
>    - Software responsible for running containers

> **ADDONS**<br>
> Implements cluster features using  Kubernetes resources (DaemonSet, Deployment, etc)
> ## _DNS_
>   - Required in every node
>   - Containers created by K8s, automatically has this DNS Server
> ## _WEB UI_
  
> **Kubernetes Objects**
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
>- Smallest unit of kubernetes [Abstraction over a container]
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



 
two masternodes and three worker nodes also to note here the
hardware resources of master and node servers actually differ the master
processes are more important but they actually have less load of work so they
need less resources like cpu ram and storage whereas the worker nodes do the
actual job of running those pods with containers inside therefore they need more resources and as your application
complexity and its demand of resources increases you may actually add more
master and node servers to your cluster and thus forming a more powerful and
robust cluster to meet your application resource requirements so in
an existing kubernetes cluster you can actually add new muster or node servers pretty easily so if you want to add a
master server you just get a new bare server you install all the master processes on it and add it to the
kubernetes cluster same way if you need two worker nodes you get bare servers
you install all the worker node processes like container runtime cubelet
and q proxy on it and add it to the kubernetes cluster that's it and this way you can infinitely increase
the power and resources of your kubernetes cluster as your replication complexity and its resource demand
increases so in this video i'm going to show you
what mini cube and cube ctl are and how to set them up so first of all let's see what is mini
cube usually in kubernetes world when you are setting up a production
cluster it will look something like this so you would have multiple masters
at least two in a production setting and you would have multiple worker nodes and
nodes and the worker nodes have their own separate responsibility so as you see on the diagram you would have actual
separate virtual or physical machines that each represent a node
now if you want to test something on your local environment or if you want to try something out very quickly for
example deploying new application or new components and you want to test it on your local
machine obviously setting up a cluster like this will be pretty difficult or maybe even impossible if you don't have
enough resources like memory and cpu etc and exactly for the use case
there's this open source tool that is called a mini cube so what a mini cube is is basically one node cluster where
the master processes and the worker processes both run on one node and this
node will have a docker container runtime pre-installed so you will be able to run the containers or the pods
with containers on this node and the way it's going to run on your laptop is through a virtual box or some other
hypervisor so basically minicube will create a virtual box on your laptop and
the note that you see here as this node will run in that virtual box so to
summarize minicube is a onenote kubernetes cluster that runs in a box on
your laptop which you can use for testing kubernetes on your local setup so now that you've set up a cluster or a
mini cluster on your laptop or pc on your local machine you need some way to interact with a cluster so you want to
create components configure it etc and that's where cubectl comes in the
picture so now that you have this virtual node
on your local machine that represents mini cube you need some way to interact
with that cluster so you need a way to create pods and other kubernetes components on the
node and the way to do it is using cubectl which is a command line tool for
kubernetes cluster so let's see how it actually works remember we said that minicube runs both master and work
processes so one of the master processes called api server is actually the main
entry point into the kubernetes cluster so if you want to do anything in the kubernetes if you want to configure
anything create any component you first have to talk to the api server and the way to talk to the api server is through
different clients so you can have a ui like a dashboard you can talk to it using kubernetes api
or a command line tool which is cubectl and cubectl is actually the most
powerful of all the three clients because with cubecdl you can basically do
anything in the kubernetes that you want and throughout this video tutorials we're going to be using cube ctl mostly
so once the cube ctl submits commands to the api server to create components delete components etc the work processes
on minicube node will actually make it happen so they will be actually executing the commands to create the
parts to destroy the parts to create services etc so this is the mini cube setup and this is how cube ctl is used
to interact with the cluster an important thing to note here is that kipctl isn't just for minikube cluster
if you have a cloud cluster or a hybrid cluster whatever cube ctl is the tool to
use to interact with any type of kubernetes cluster setup so that's important to note here so now that we
know what minicube and cubectl are let's actually install them to see them in practice
i'm using mac so the installation process will probably be easier but i'm going to put the links to the
installation guides in the description so you can actually follow them to install it on your operating system just
one thing to note here is that minicube needs a virtualization because as we
mentioned it's going to run in a virtual box setup or some hypervisor
so you will need to install some type of hypervisor it could be virtualbox i'm gonna install a hyperkit but it's gonna
be in those step-by-step instructions as well so i'm gonna show you how to install it on a mac
so i have a mac os mojave so i'm gonna show you how to install mini cube on
this macos version and i'm going to be using pruitt to install it so we're going to update
and the first thing is that i'm going to install
a hypervisor hyper kit so i'm going to go with the hyperkit
go ahead and install it
i already had it install it so with you if you're doing it for the first time it might take uh longer because it has to
download all these dependencies and stuff and now i'm gonna install mini cube
and here's the thing minicube has cube ctl as a dependency so when i
execute this it's going to install cube ctl as well
so i don't need to install it separately so let's see here
installing dependencies for minicube which is um kubernetes cli this is cube ctl again
because i already had it installed before it still has a local copy of the dependencies that's why it's pretty fast
it might take longer if you're doing it for the first time so now that everything is installed let's actually
check the commands so cubectl command should be working so i get this
list of the commands with cubectl so it's uh there and minicube should be working as well
and as you see minicube comes with this command line tool which is pretty simple so with one command it's going to bring
up the whole kubernetes cluster in this onenote setup and then you can do stuff
with it and you can just stop it or delete it it's pretty easy so now that we have both installed and the commands
are there let's actually create a mini cube kubernetes cluster and as you see there is a start command
let's actually clear this so this is how we're going to start a kubernetes cluster q mini cube start and here is
where the hypervisor installed comes in because since mini cube needs to run in
virtual environment we're gonna tell minicube which hypervisor
it should use to start a cluster so for that we're going to specify an option which is vm driver
and here i'm going to set the hyper key that i installed so i'm telling minicube please use hyperkit
hypervisor to start this virtual mini cube cluster so when i execute this it's
gonna download some stuff so again it may take a little bit longer if you're doing it for the first time
and as i mentioned minicube has docker runtime or docker daemon pre-installed so even if you
don't have docker on your machine it's still gonna work so you would be able to create containers inside because it
already contains docker which is a pretty good thing uh if you don't have docker already installed so done cube
ctl is now configured to use mini cube which means the mini cube cluster is set
up and cube ctl command which is meant to interact with the kubernetes clusters
is also connected with that mini cube cluster which means if i
do cube ctl get notes which just gets me a status of the notes of the kubernetes
cluster it's going to tell me that the mini cube node is ready and as you see
it's the only node and it has a must role because it obviously has to run the master processes
and i can also get the status with minicube executing minicube status
so i see host is running cubelet which is a service that actually runs the
parts using container runtime is running so basically everything is running and
by the way if you want to see kubernetes architecture in more detail and to understand how muster and worker nodes
actually work and what all these processes are i have a separate video that covers kubernetes architecture so
you can check it out on this link and we can also check which version of kubernetes we have installed and usually
it's going to be the latest version so with cube ctl version you actually know what the client version of kubernetes is
and what the server version of kubernetes is and here we see we're using 1.17
and that's the kubernetes version that is running in the mini cube cluster so if you see both client version and
server version in the output it means that mini cube is correctly installed so
from this point on we're going to be interacting with the mini cube cluster using cubectl command line tool so
minicube is basically just for the startup and for deleting the cluster but everything else configuring we're going
to be doing through cubectl and all these commands that i executed here i'm going to put them in a list in the
comment section so you can actually copy them
in this video i'm gonna show you some basic cubesitl commands and how to create and debug pods in minicube
so now we have a mini cube cluster and cube ctl installed and once the cluster
is set up you're going to be using cubectl to basically do anything in the cluster to create components uh to get
the status etc so first thing we are gonna just get the status of the
nodes so we see that there is one node which is a muster
and everything is gonna run on that note because it's a mini cube um so with cube city i'll get i can
check the pots and i don't have any that's why no resources i can check the
services give ctl get services
and i just have one default service and so on so this cube cdl get i can list
any kubernetes components so now since we don't have any parts
we're going to create one and to create kubernetes components there is a cube
ctl create command so if i do help on that cube ctrl
create command i can see available commands for it so i can create all these components using cube
ctl create but there is no pod on the list because in kubernetes world the way it works is
that the pod is the smallest unit of the kubernetes cluster but usually in
practice you're not creating pots or you're not working with the pots directly there is an abstraction layer
over the pots that is called deployment so this is what we are going to be
creating and that's going to create the parts underneath and this is a usage of
qctl create deployment so i need to give a name of the deployment and then
provide some options and the option that is required is the image because
the pod needs to be created based on certain some image or some container image so let's actually go ahead and
create nginx deployment so cubectl create deployment
we let's call it nginx deployment
image equals nginx it's just going to go ahead and download the latest nginx image from
docker hub that's how it's going to work so when i execute this you see deployment
nginx people created so now if i do cube ctl get
deployment you see that i have one deployment
created i have a status here which says it's not ready yet so
if i do cube ctl get pod you see that now i have a pod
which has a prefix of the deployment and some random hash here and it says container creating so it's
not ready yet so if i do it again it's running
and the way it works here is that when i create a deployment deployment has all the information or
the blueprint for creating the pod the for the this is the minimalistic or the
most basic configuration for a deployment we're just saying the name and the image that's it the rest is just
defaults and between deployment and nepal there is another layer which is automatically
managed by kubernetes deployment called replica set so if i do cube ctl
get replica set written together
you see i have an nginx dipple replica set hash and it just gives me a state
and if you notice here the pod name has
a prefix of deployment and the replica sets id and then its own id so this is
how the pod name is made up and the replica set basically is managing the replicas of a pod
you in practice will never have to create replica set or delete a replica
set or update in any way you're going to be working with deployments directly which is more
convenient because in deployment you can configure the pod blueprint completely
you can say how many replicas of the pod you want and you can do the rest of the configuration there
here with this command we just created one pod or one replica but if you wanted
to have two replicas of the nginx part we can just provide as additional
options so this is how the layers work first you have the deployment the deployment manages a
replica set a replica set manages all the replicas of that
pod and the pod is again an abstraction of a container and everything below the
deployment should be managed automatically by kubernetes you usually have to worry about any of it for
example the image that it uses i will have to edit that in the deployment directly and
not in the pod so let's go ahead and do that right away so i'm going to do equip ctl edit deployment
and i'm going to provide the name genex
and we get an auto-generated configuration file of the deployment because in the command line we just gave
two options everything else is default and auto generated by kubernetes
and you don't have to understand this now but i'm going to make a separate video where i break down the
configuration file and the syntax of the configuration file for now let's just go ahead and scroll
to the image which is somewhere down below and let's say i want to fixate the
version to 1 16. and save that change
and as you see deployment was edited and now when i do cube ctl get pod
i see that the old pod so this one here is terminating
and another one started 25 seconds ago so if i do it again
the old part is gone and the new one got created with a new image
and if i do if i get replica set
i see that the old one has no parts in it and a new one has been created as well
so we just edited the deployment configuration and everything else below
that got automatically updated and that's the magic of kubernetes and
that's how it works another very practical command
is cube ctel logs which basically shows you what the application running inside
the pod actually logged so if i do cube ctrl logs
and i will need the pod name for this um i will get nothing because nginx
didn't log anything so let's actually create another deployment
from mongodb so let's call it deployment and the image
and the image will be on go so let's see ctrl
pod so now i have the mongodb deployment creating so let's go ahead and lock
that this status here means that pod was created but the container inside the pod
isn't running yet and when i try to lock obviously tells me there is no container
running so it can show me any locks so let's get the status again at this point if i'm seeing that
container isn't starting i can actually get some additional information by cube ctl describe pod and the pod name
which here shows me what state changes happened inside the pot so it pulled the image created the
container and started container so cuba city get pod it should be running already
so now let's log it cubectl logs
and here we see the log output so it took a little bit but this is what the mongodb application
container actually locked inside the pod and obviously if container has some problems it's going
to help with debugging to see what the application is actually printing so let's clear that
and get the parts again so another very useful command when
debugging when something is not working or you just want to check what's going on inside the pod
is cube ctl exec so basically what it does is that it
gets the terminal of that mongodb application container so if i do keep
ctl exec interactive terminal that's what i t stands for i will need the pod name
dash dash so so with this command
i get the terminal of the mongodb application container and as you see here i am inside the container of
mongodb as a root user so i'm in a completely different setting now and as i said this is useful in
debugging or when you want to test something or try something you can enter the container or get the terminal and
execute some commands inside there so we can exit that again
and of course with cube ctl i can delete the pods
so if i do get deployment let me spell that so it keeps it here
deployment i see that i have two of them and if i do qc pod and replica said i have also
two of them so let's say if i wanted to get rid of all the pods replica sets
underneath i will have to delete the deployment so delete
deployment and i'll have to provide the name of the deployment i'm gonna
delete let's delete mongodb delete it and now if i'm gonna say
cubectl getpod the part should be terminating and if i do get replica set
the mongodb replica set is gone as well and the same if i do
delete deployment nginx deadpool
and do the replica set see everything gone so all the crud operations create delete
update etc happens on the deployment level and everything underneath just follows automatically
and the similar way we can create other coordinates resources like services etc
however as you notice when we're creating kubernetes components like deployment
using cubectl create deployment um and i misspelled it all the time
you'll have to provide all these options on the command line so you'll have to say the name and you'll have to specify
the image and then you have this option one option two uh etc
and there could be a lot of things that you want to configure in a deployment or
in a pod and obviously it will be impractical to write that all out on a command line
so because of that in practice you would usually work with kubernetes configuration files meaning what
component you're creating what the name of the component is what image is it based off
and any other options they're all gathered in a configuration file
and you just tell kubectl to execute that configuration file and the way you
do it is using cubectl apply command and apply basically takes the file the
configuration file as a parameter and does whatever you have written there so
apply takes an option called minus f that stands for file
and here you would say the name of the file so this will be the config file dot
yemo this is the format that you're usually gonna use for configuration files and this is the
command that executes whatever is in the configuration file so let's actually call the configuration
file i don't know nginx deployment
and let's go ahead and create a very simplistic super basic
uh nginx deployment file so here i'm gonna create that file
so this is the basic configuration for the deployment
so here i'm just specifying what i want to create i want to create a deployment the name of that deployment
you can ignore these labels uh right now uh how many replicas
of the pods i want to create and this plug right here the template and specification
is a blueprint for the pods so specification for the deployment
and specification for a pod and here we're just saying that we want one container inside of the pod
with nginx image and we are going to bind that on port 80. so this is going to be our
configuration file and once we have that we can apply that configuration
so so deployment created so now if i get
pod i see that nginx deployment pod was created and it's running and let's also
see the deployment was created 52 seconds ago and now if i
wanted to change something in that deployment i can actually change my local configuration
for example i wanted two replicas instead of one
i can apply that again
deployment nginx deployment configured and as you see the difference here is that
kubernetes can detect if the nginx deployment doesn't exist yet it's going to create one
but if it already exists and i apply the configuration file again
it's going to know that it should update it instead of creating a new one so if i
do get deployment i see this is the old one or the old deployment
and if i do cube ct i'll get pod i see the old one is still there and a new one got created because i
increased the replica count which means that with cube ctl apply you can both create and update a component
and obviously you can do coupe ctl with services volumes any other kubernetes components
just like we did it with the deployment so in the next video i'm going to break down the syntax of the configuration file which is pretty logical and simple
actually to understand and i'm going to explain all the different attributes and what they mean so you can write your own
configuration files for different components so to summarize we've looked at a couple of cube ctl commands in this
video we saw how to create a component like deployment how to edit it and
delete it we saw how to get status of parts deployments replica sets
etc we also logged on the console whatever application is writing it to
the console in the pod and we saw how to get a terminal of a running container using kubectl exec and finally we saw
how to use a kubernetes configuration file to create and update
components using the cube ctl apply command and last but not least we saw
cubesatl describe command which will when a container isn't starting in a pod and you want to get
some additional troubleshooting information about the pod
in this video i'm going to show you the syntax and the contents of kubernetes configuration file which is the main
tool for creating and configuring components in kubernetes cluster if you've seen large configuration files it
might seem overwhelming but in reality it's pretty simple and intuitive and also very logically structured so let's
go through it step by step
so here i have examples of a deployment and service configuration files side by
side so the first thing is that every configuration file in kubernetes has
three parts the first part is where the metadata of that component that you're
creating resides in one of the metadata is obviously name
of the component itself the second part in the configuration file is
specification so each component's configuration file will have a specification where you basically put
every kind of configuration that you want to apply for that
component um the first two lines here as you see is just declaring what you want to create here
we are creating deployment and here we're creating a service and this is basically you have to look
up for each component there's a different api version so now inside of the specification part
obviously the attributes will be specific to the kind of a component that
you're creating so deployment will have its own attributes that only apply for deployment and the
service will have its own stuff but i said there are three parts of a configuration file and
we just see metadata and the specification so where's the third part so the third part will be a status but
it's going to be automatically generated and edit by kubernetes so the way it
works is that kubernetes will always compare what is the desired state and
what is the actual state or the status of that component and if the status and desired state do not match then
kubernetes knows there is something to be fixed there so it's going to try to fix it and this is the basis of the
self-healing feature that kubernetes provides for example here you specify
you want two replicas of nginx deployment so when you apply this when
you actually create the deployment using this configuration file that's what apply means kubernetes will add here the
status of your deployment and it will update that state continuously so for
example if a status at some point will say just one replica is running then
kubernetes will compare that status with the specification and we'll know there
is a problem there another replica needs to be created sap now another
interesting question here is where does kubernetes actually get the status data to automatically add here or
update continuously that information comes from the ecd remember the cluster
brain one of the master processes that actually stores the cluster data so it
cd holds at any time the current status of any kubernetes component and that's
where the status information comes from
so as you see the format of the configuration files is yaml that's why the extension here and
generally it's pretty straightforward to understand it's a very simple format but yeml is very strict about the
indentations so for example if you have something wrongly indented here your
file will be invalid um so what i do especially if i have a configuration
file that has 200 lines it's pretty long um i usually use
some yemo online validator to see where i need to fix that
but other than that it's pretty simple um another thing is where do you actually store those
configuration files a usual practice is to store them with your code because
since the deployment and service is going to be applied to your application it's a good practice to store these
configuration files in your application code so usually it will be part of the
whole infrastructure as a code concept or you can also have its own git
repository just for the configuration files so in the previous video i showed you
that deployments manage the parts that are below them so whenever you
edit something in a deployment it kind of cascades down down to all the pods that it manages and whenever you
want to create some pods you would actually create a deployment and it will take care of the rest so how does this
happen or where is this whole thing defined in the configuration so here in the specification part of a
deployment you see a template and if i expand it you see the template
also has its own metadata and specification so it's basically a configuration file inside of a
configuration file and the reason for it is that this
configuration applies to a pod so pod should have its
own configuration inside of deployments configuration file and that's how all
the deployments will be defined and this is going to be the blueprint for a pod
like which image it should be based on which port it should open what is going to be the name of the
container etc
so the way the connection is established is using labels and selectors
so as you see metadata part contains the labels and the specification part contains
selectors it's pretty simple in a metadata you give
components like deployment or pod a key value pair and it could be any
key value pair that you think of in this case we have app nginx
and that label just sticks to that component so we give parts
created using this blueprint labeled app nginx and we tell the deployment
to connect or to match all the labels with app
and genex to create that connection so this way deployment will know which
parts belong to it now deployment has its own label app engine x
and these two labels are used by the service selector so in the specification of a
service we define a selector which basically makes a connection
between the service and the deployment or its pots
because service must know which pods are kind of registered with it so which pods
belong to that service and that connection is made through the selector
of the label and we're going to see that in a demo so another thing that must be configured in
the service and pod is the ports so if i expand this i see
that service has its ports configuration and
the container inside of a pod is obviously running or needs to run its import
right so how this is configured is basically service has a port
where the service itself is accessible at so if other service sends
a request to nginx service here it needs to send it on port 80 but the service
needs to know to which pod it should forward the request but also at which
port is that port listening and that is the target port so this one should match
the container port and with that we have our deployment and service basic configurations done
and to note here most of these attributes that you see here in both parts are required so this
will actually be the minimum configuration for deployment and service so once we have those files
let's actually apply them or create components using that
so let's head over to the console and here i'm going to create
both deployment and service so cubesatl apply
genex deployment created and
nginx service so now if i get the pods i see two replicas are
running because that's how we define it here and we have our service as well
which is engineering service this is a default service it's always there
this is the one we created and it's listening on port 80 as we specified
now how can we validate that the service um has the right pots that it forwards the
requests to we can do it using kubectl describe service
and the service name and
here you see the endpoints where you have all this status information here
like the things that we define in the configuration like app selector etc
we have the target port that we define and we have the end points here and this must be
the ip addresses and ports of the pods
that the service must forward the requests to so how do we know that
these are the ip addresses of the right parts because with cuba ctl get pod you
don't get this information so the way we do it or where we find that out is using get pod and then you
do dash o which is for output and then we want more information so
oh white and here we see more columns here so we have the name
and status ready etc but we also have the ip address so here
is the ip address endpoint specified here and this is the other one so we know that the
service has right endpoints so now let's see the third part of the configuration file
which is a status that kubernetes automatically generated and the way to do it is we can
get the deployment nginx deployment
in a yaml format so when i execute this command i will get the resulting or the
updated configuration of my deployment which actually resides in the cd because
etcd stores the status of the whole cluster including every component so um if i do this i'll get
the yaml output in my console but i want it in the file so i'm gonna save it into
um nginx deployment
result and i'm going to save it there
and i'm going to open it in my editor next to the original one so as you see a lot of stuff has been added but let's
just see the status part so all this is automatically added
and updated constantly by kubernetes so it says how many replicas are running what
the state of those replicas and some other information so this part can also
be helpful when debugging so there's a status but also if you noticed
other stuff has been added in the metadata and specification part as well so for
example uh creation timestamp when was the component created is automatically added
by kubernetes because it is a metadata some unique id etc you don't have to care about it and in the specification
part it just adds some defaults for that component but again you don't
have to care or understand most of these attributes but one thing to note here is
that if you for example want to copy a deployment that you already have using
um maybe automated scripts you will have to remove and get rid of
most of this generated stuff so you have to clean that deployment configuration file first
and then you can create another deployment from that blueprint configuration so that's it with this
video so from now on we're going to be working with the configuration files so for example if i want to delete the
deployment and the service i can do it using that file configuration file as well
using delete and
like this the deployment will be gone and i can do the same for service
all right so using cube city apply and cube cdl delete you can basically work
with the configuration files
in this video we're gonna deploy two applications mongodb and express
and i chose these two because it demonstrates really well a typical simple setup of a web application and
its database so you can apply this to any similar setup you have so let's see how we're going to do this
so first we will create a mongodb pod and in order to talk to that pod we are going to need a service and we're going
to create an internal service which basically means that no external requests are allowed to the pod only
components inside the same cluster can talk to it and that's what we want then we're going to create a express
deployment one we're going to need a database url of mongodb so that express can
connect to it and the second one is credentials so username and password of the database so that it can authenticate
so the way we can pass this information to express deployment is through its deployment
configuration file through environmental variables because that's how the application is configured
so we're going to create a config map that contains database url and we're going to create a secret that contains
the credentials and we're going to reference both inside of that deployment file so once we have that set up we're
going to need express to be accessible through browser in order to do that we're going to create an
external service that will allow external requests to talk to the pod
so the url will be http ip address of the node and the service
port so with this setup the request flow will now look like this so the request comes from the browser and it goes to
the external service of the express which will then forward it to the express pod
the pod will then connect to internal service of mongodb that's basically the database url here
and it will forward it then to mongodb pod where it will authenticate the request using
the credentials so now let's go and create this whole setup using kubernetes configuration files
let's dive right into it and create the whole setup so first of all i have a mini cube cluster running if i do cube
ctl get all which basically gets me all the components that are inside the
cluster i only have a default kubernetes service so my cluster is empty and i'm
starting from scratch so the first thing that i said we're gonna do is create a mongodb deployment
i usually create it in an editor so i'm going to go to visual studio code
and paste a prepared deployment file there
for mongodb and this is how it's going to look like so i have a deployment kind and i have
some metadata i'm just going to call it mongodb deployment um
labels and selectors in the previous video i already explained the syntax of
kubernetes yaml configuration file so if you want to
know what all these attributes mean then you can check out that video and here in the template i have a definition or
blueprint for parts that this deployment gonna create and i'm just gonna go with
one replica so the container is gonna be called mongodb and this is the image that i'm gonna
take so let's actually go and check out the image configuration for mongodb
so and i see
this image here let's open this and basically what i'm looking for is
how to use that um container meaning what ports it's going to open
and what's uh external configuration it's going to take so a default
port of mongodb container is 27017
so i'm going to use that and we are going to use
variables environmental variables the root username and root password so basically i can
on the container startup define the admin username and password so let's go
ahead and configure all of that inside the configuration file so here below the image of mongodb so
we're just gonna leave the name of the image and it's gonna pull the latest one and that's what we want so here i'm
gonna specify what port i want to expose so ports that's the attribute name and
container port
and that's the standard port so i'm gonna leave it and below that i'm gonna
specify those two environmental variables so one is
called let's see what it's called it's inidb root username
and here it's gonna be a value so we're gonna actually leave it blank for now and the
other one is called init root password and we're
gonna leave that blank as well just a video and once we have the values here um
going to have a complete deployment for mongodb this is basically all we need now note that this is a configuration
file that is going to be checked into a repository so usually you wouldn't write admin username and password inside the
configuration file so what we're going to do now is we're going to create a secret
from where we will reference the values so meaning that the secret is going to
live in kubernetes and nobody will have access to it in a git repository so
we're going to save this incomplete deployment file first of all so let's call it
deployment or let's just call it
yaml and save it here so that we get the syntax highlight
and now before we apply this configuration we're going to create the secret where the root username and
password will leave so let's create a new
file and i'm going to paste in the configuration of a secret which is actually pretty simple so we have a kind
secret then we have a metadata which again is just simply the name we're going to call it mongodb secret
the type opec is actually a default type which is the most basic key value secret
type other types for example include tls certificates so you can create a
secret specifically with the tls certificate type and a couple of more types but mostly you're going to use the
default one and these are the actual contents so you have the data and here
you have key value pairs um which of course are the names you
come up with so we're gonna specify username or we can actually call it um
root username and we're going to call it
root password and here's the thing the values in
in this key value pairs are not plain text so when we are creating a secret
the value must be base64 encoded so the way you can do that the simplest way is
go to your terminal so here i'm going to say echo minus n very important option
don't leave it out otherwise it's not going gonna work and here i'm gonna put a plain text value
that i want so i'm just gonna go with just username whatever of course you can
have something more secretive here and i'm gonna base64 encoding and the value that i get
here i'm gonna copy it into the secret configuration as a value and
i'm gonna do the same with password so again i'm just gonna go with simple
password obviously you want to have something more secure and i'm gonna copy that
as a value here and save it is secret dot yaml
okay now we have only written configuration files we haven't created anything yet in the cluster so this is
just preparation work and we have to create secret before the deployment if
we're gonna reference the secret inside of this so the order of creation matters
because if i'm creating a deployment that references a secret that doesn't exist yet i'm gonna get an error so it's
not going to start since we have our first component let's actually go ahead and create our secret
from a configuration file so again i'm going to go to my console let's actually clear all these
and i'm gonna go into the folder where i'm creating all these configuration files
i called it kubernetes configuration and here i have both of my files so i'm do
i'm gonna do cube ctl apply secret
and secret created so i'm gonna do cube ctl get secret
and i should see my secret has been created this is something created by default
with a different type and this is our secret here so now that we have our secrets we can
reference it inside of our deployment configuration file so let's go back
and this is how you reference contents specific key value data of
secret so instead of value we're going to say value from
and then i'm going to do secret key ref or secret key reference
and name is going to be the secret name so this one here
and key is going to be the key in the data i want the value of
this key value pair so i want this part of the data so i'm going to reference it by key so you don't have to learn it by
heart obviously all the syntax and attribute names important thing here is that you know approximately how to
reference it the actual syntax you can always look up in google or maybe from previous configuration files but yeah
this is how you reference it and we're gonna do the same with password so i'm gonna do from and i'm just gonna copy
the rest here remember yemo is very strict with the
indentation here is the same secret but a different key so i'm gonna use
password key here and that will be it so now we have
the root username and password referenced from the secret and no actual
values inside the configuration file which is good for security because you
don't want your credentials in your code repository okay so our deployment file is actually
ready so let's apply that
cdl apply
and the deployment created meaning if i do get all
i should see the pod starting up the deployment and the replica set so let's actually
check how pod is doing container creating so
let's actually watch it might take some time to create it if it takes long and if you want to
see whether there is a problem there you can also do cube ctl describe pod
and the pod name so at least we know nothing's wrong there
so we see that it's just pulling the image so that's what it takes so long
so let's see again cube ctl get pod and as you see it's running so we have
mongodb deployment and the port one replica of its part running now the second step is we're gonna
create an internal service so that other components or other ports can talk to
this mongodb so let's go ahead and create service configuration
so go back to yemo and here we can either create a separate yemo configuration file for
secret or we can also include it in the same one so in yaml you can actually put
multiple documents in one file so if i put three dashes
that's basically a syntax for document separation in yaml so i need new document is starting so actually i'm
gonna put both deployment and service in one configuration file because they usually belong together so here i'm
gonna paste the service configuration and by the way i'm gonna put all these
configuration files in git repository and link the repository in the
description of this video so this is a service for mongodb let's go through some of the attributes here
so it's the service kind just the name we're going to call it mongodb service
selector this is an important one because we want this service to connect to the pod right and the way to do that
is using selector and label so using this here the labels that
deployment and pod have service can find the parts that it's gonna attach to
all right so we have the selector here and this is important part where we
expose service port so this is going to be the service port and this is going to
be the container and since we exposed container port at this address right here
these two have to match so target port is container or pot
port and this is the service port and obviously these two here can be different but i'm gonna go with
the same port and that's basically it that's our service so i'm gonna create the service
now so let's save this file and go back to my console and i'm gonna apply
the same file that i applied before to create deployment so let's see what happens
see both deployment and service configuration but it's going to know that i haven't changed the deployment
that's what it means here and a service is created so if i were to
edit both for example i can reapply the file and deployment of service can be changed so i think using
local configuration files is a handy way to edit your components so now let's
actually check that our service was created get service
and this is our service and it's listening at port 27017 and i showed it in one of the
previous videos but we can actually also validate that the service is attached to the correct port
and to do that i'm gonna do describe subscribe service and i need the service
name for this so here i have the endpoint which is an
ip address of a pod and the port where the application
inside the pod is listening it so let's actually check that this is the right part i mean we just have one but still
so if i do get pawn and i want additional output to what i
get by default one of the columns includes the ip address which is
this one right here so 172.17.06
that's the pod ip address and this is the port where the application inside the pod is listening
at so everything is set up perfectly mongodb deployment and service has been created and by the way if you want to
see all the components for one application you can also
display them using cube ctl get all that will show all the components
and you can filter them by name so bongo db
and here you see the service deployment replica set and the pod
so when you do all the component type will be the first here okay that's uh just a
side info so now the next step we're gonna create express deployment
and service and also an external configuration um where we're gonna put
the database url for mongodb so let's go ahead and do it so i'm going to clear that up
and go and create a new file for express deployment and service
so this is the deployment draft of express
same things here express that's the name and here we have the pod definition
where the image name is express let's actually go ahead and check that image as well
we don't need this this is express and that's the name of the image mobile
express and let's see the same data here let's see the port the express
application inside the container starts at is 8081
and these are some of the environmental variables so obviously we need three
things for express we need to tell it which database application it should
connect to so obviously we need to tell it the mongodb address database address
it should connect to the internal service and we we're gonna need credentials so that mongodb can
authenticate that connection and the environmental variables to do that is
going to be admin username admin password and the mongodb endpoint will be this here so these three
environmental variables we need so let's go ahead and use that so first we're
going to open the port again container
ports and the reason why you have multiple ports is that inside of the pod you can
actually open multiple ports so that's going to be 8081 and now we're
gonna add the environment to variables for the connectivity so the first one is
the username and this is going to be obviously the same username and password that we
defined right here so what i'm going to do is i'm just going to copy them because it's really the same so the
value from we're going to read it from the secret that's already there so i'm gonna paste it here
second environmental variable is called admin password and i'm also gonna copy that from here
and the third one is going to be the database server
and since this is also an external configuration we can either do value here and we could write the mongodb
server address directly here or as i showed you in the diagram at the beginning we can put it in a config map
which is an external configuration so that it's centralized so it's stored in one place and also other components can
also use it so for example if i have two applications that are using mongodb
database then i can just reference that external configuration here and if
i have to change it at some point i just change it in one place and nothing else gets updated so because of that
we're going to keep this incomplete deployment configuration and
we're going to create the config map which will contain the mongodb server
address so i'm going to create a new file let's actually save this incomplete deployment
let's call it express yaml and we're going to come back to it later
so save that now we need a config map here so i'm going to copy the configuration
and this is also pretty simple just like secret you have
the kind which is configmap the name and the same construct see just
like you saw here data which is key value pair it doesn't have a type
because they're just one config map type and that's it and here you again have uh
key value pairs so database url and server name is actually the name of the
service it's as simple as that so what did we call our service we called it mongodb
service so i'm going to copy the service name and that's going to be the database
server url so i'm going to copy that and let's actually call it
config map for consistency and save it and just like with secret the order of
execution or creation matters so i have to have a config map already in the
cluster so that i can reference it so when we're done
i have to create the configmap first and then the deployment so the way that i
can reference the config map inside the deployment is very similar to
secret so i'm actually gonna copy the whole thing from secret put it here the only thing
different here is that instead of secret i'm gonna say config
map it's all camel case and obviously the name is gonna be
config map that's what we called it i think yes that's the name let's actually copy
it and again the key is the key in the key value pair here so
let's copy that as well so now i have our express deployment these are just standard stuff and this
is where the pod blueprint or container configuration exists we have exposed port 8081 this is the
image with latest tag and these are the three environmental variables
that express needs to connect and authenticate with mongodb
so deployment is done and let's go ahead and create config map first and then
express deployment ctl apply
config map and i'm going to do cdl apply
express and let's see
the part so container creating looks good
so let's see the pot and it's running and i actually want to see the locks
so i'm going to lock the express and here you see that express server
started and database connected so now the final step is to access
express from a browser and in order to do that we are gonna need an external service for mobile express so let's go
ahead and create that one as well so let's clear this output go back to visual code and as we did last time in
the same file as the deployment i'm going to create express service because actually
in practice you never have deployment without the service so it makes sense to
keep them together and this is express external service and this configuration right now
looks exactly same as the db service configuration and even ports are
the same like here i have exposed service port at 8081 and target port is
where the container port is listening so how do i make this external service
is by doing two things so in the specification section
so i'm gonna do it below the selector i'm gonna put a type
and the type of this external service is load balancer
which i think is a bad name for external service because internal service
also acts as a load balancer so if i had two mongodb pods the internal service
would also load balance the requests coming to these pods so i think the load balancer type name was
chosen not very well because it could be confusing but what this type load balancer does
basically is it accepts external requests by assigning the
service an external ip address so another thing that we're going to do here to make this
service external is right here we're going to provide third port
and this is going to be called node port and what this is basically
is the port where this external ip address will be open
so this will be the port that i'll have to put in the browser to access this service and this node port actually has
a range and that range is between thirty thousand and
thirty two thousand something so i can not give it the same port as here as i
said it has to be between that range so i'm just going to go with the 30 000
that's the minimum in that range and that would be it so this configuration here will create an external service
let's go ahead and do it and i will show you exactly how these ports differ from each
other so i'm going to apply
express so service created and if i do
get service i see that mongodb service that we created
previously has a type of cluster ip and the express service that we just created is
load balancer which is the type that we specifically defined in internal service we didn't specify any type because
cluster ip which is the same as internal service type is default so you don't have to
define it when you're creating internal service and the difference here is that
cluster ip will give the service an internal ip address which is this one right here so
this is an internal ip address of the service and load balancer will also give
service an internal ip address but in addition to that it will also give the service an external ip address where the
external requests will be coming from and here it says pending because we're in mini cube and
it works a little bit differently in a regular kubernetes setup here you would also see an actual ip address a public
one and this is another difference because with internal ip address you just have
port for that ip address with both internal and external ip addresses you have ports for both of them and that's
why we had to define third port which was for the external ip address as i said pending means that it doesn't have
the external ip address yet so in minicube the way to do that is using the
command mini cube service and i'm gonna need the name of the service
so this command will basically assign my external service a public ip address so
i'm gonna execute this and the browser window will open and i will see my express page so
if i go back to the command line you see that this command here assigned express
service a url with a public ip address or with an external ip address
and the port which is what we defined in the node port so i can basically copy
that command which is the same as this one here and i get the
page for express so now with this setup the way it's going to work is that when i make changes here
for example i'm going to create a new database let's call it test db whatever
and i'm going to create a request what just happened in background is that this request landed
with the external service of express which then forwarded it to the
express pod and the express part connected to the mongodb service and internal service
and mongodb service then forwarded that request finally to the mongodb pod and
then all the way back and we have the changes here so that's how you deploy a simple
application setup in a kubernetes cluster
in this video we're going to go through the usages of a namespace and the best practices of when and how
to use a namespace first of all what is a namespace in kubernetes in kubernetes cluster you can
organize resources in namespaces so you can have multiple namespaces in a
cluster you can think of a namespace as a virtual cluster inside of a kubernetes
cluster now when you create a cluster by default kubernetes gives you namespaces
out of the box so in the command line if i type cubect ctl get namespaces i see
the list of those out of the box namespaces that kubernetes offers and let's go through them one by one the
kubernetes dashboard namespace is shipped automatically in minicube so it's specific to mini cube installation
you will not have this in a standard cluster the first one is cube system
cube system namespace is not meant for your use so basically you shouldn't create anything or shouldn't modify
anything in cube system namespace the components that are deployed in the namespace are the system processes uh
they're from master managing processes or cubectl etc the next one is q public
and what q public contains is basically the publicly accessible data it has a config map that
contains cluster information which is accessible even without authentication
so if i type here cube ctl cluster info this is the output that i get through
that information and the third one is cube node lease which is actually a recent
addition to kubernetes and the purpose of that namespace is that it holds information about the heartbeats of
nodes so each node basically gets its own object that contains the information
about that node's availability and the fourth namespace is the default
namespace and default namespace is the one that you're going to be using to create the resources at the beginning if you
haven't created a new namespace but of course you can add and create new namespaces and the way that you can do
it is using kubectl create namespace command with the name of the namespace
so i can create my namespace and if i do kubectl
get namespaces i see that in my list now another way to create namespaces is
using a namespace configuration file which i think is a better way to create
namespaces because you also have a history in your configuration file repository of
what resources you created in the cluster okay so now we saw what namespaces are and
that you can create new ones and that kubernetes offer some of them by default but the question is
what is the need for namespaces when should you create them and how you should use them and the first use case
of using or creating your own namespaces is the following imagine you have
only default namespace which is provided by kubernetes and you create all your resources in that default namespace if
you have a complex application that has multiple deployments which create replicas of many pods and you have
resources like services and config maps etc very soon your default namespace is
going to be filled with different components and it will be really difficult to have an overview of what's
in there especially we have multiple users creating stuff inside so a better way to use namespaces in this case is to
group resources into namespaces so for example you can have a database namespace where you deploy your database
and all its required resources and you can have a monitoring namespace where
you deploy the promateos and all the stuff that it needs you can also have elasticstack namespace where all the
search kibana etc resources go and you can have nginx ingress resources so just
one way of logically grouping your resources inside of the cluster now
according to the official documentation of kubernetes you shouldn't use namespaces if you have
smaller projects and up to 10 users i personally think that it's always good
idea to group your resources in namespaces because as i said even if you
have a small project and 10 users you might still need some
additional resources for your application like you know logging system and monitoring system and even with the
minimum setup you can already get too much to just throw everything in a default namespace another use case where
you will need to use namespaces if you have multiple teams so imagine the scenario you have two teams that use the
same cluster and one team deploys an application which is called my app
deployment that's the name of the deployment they create and that deployment has its certain configuration
now if another team had a deployment that accidentally had the same name
but a different configuration and they created the deployment or they applied it
they would overwrite the first team's deployment and if they're using for
example a jenkins or some automated way to deploy those that application or to create that
deployment they wouldn't even know that they overwrote or disrupted another
team's deployment so to avoid such kind of conflicts again you can use namespaces so that each team can work in
their own namespace without disrupting the other another use case for using namespaces is let's say you have one
cluster and you want to host both staging and development environment in
the same cluster and the reason for that is that for example if you're using something like nginx controller or
elasticstack used for logging for example you can deploy it in one cluster
and use it for both environments in that way you don't have to deploy these common resources twice in two different
clusters so now the staging can use both resources as well as the development
environment another use case for using namespaces is when you use blue-green deployment for application which means
that in the same cluster you want to have two different versions of
production so the one that is active that is in production now and another one that is going to be the next
production version the versions of the applications in those blue and green production namespaces will be different
however the same as we saw before in staging and development this namespaces might need to use the
same resources like again nginx controller or elastic stack and this way again they can both
use this common shared resources without having to set up a separate cluster so
one more use case for using namespaces is to limit the resources and access
to namespaces when you're working with multiple teams so again we have a scenario where we have two teams working
in the same cluster and each one of them has their own namespace so what you can do in this
scenario is that you can give the teams access to only their namespace so they
can only be able to create updates delete resources in their own namespace but they can't do anything
in the other name spaces in this way you even restrict or even minimize the risk of one team accidentally interfering
with another team's work so each one has their own secured isolated environment
additional thing that you can do on a namespace level is limit the resources that each namespace consumes because if
you have a cluster with limited resources you want to give each team a share of resources for their application
so if one team let's say consumes too much resources then other teams will
eventually have much less and their applications may not schedule because the cluster will run out of the
resources so what you can do is that per namespace you can define resource quotas
that limit how much cpu ram storage resources one namespace can use so i
hope walking through these scenarios helped you analyze in which use cases and how you should use namespaces in
your specific project there are several characteristics that you should consider before deciding how to group and how to
use namespaces the first one is that you can't access most of the resources from
another namespace so for example if you have a configuration map in project a
namespace that references the database service you can't use that config map in
project b namespace but instead you will have to create the same config map that also references the database service so
each namespace will define or must define its own config map even if it's the same
reference and the same applies to secret so for example if you have credentials of a shared service you will have to
create that secret in each namespace where you are going to need that however
a resource that you can share across namespaces is service and that's what we
saw in the previous slide so config map in project b namespace references
service that is going to be used eventually in a pod and the way it works is that in a configmap definition the
database url in addition to its name which is mysql service will have namespace at the end so using that url
you can actually access services from other namespaces which is a very
practical thing and this is how you can actually use shared resources like elasticsearch or
nginx from other namespaces and one more characteristic is that we saw that most
of the components resources can be created uh within a namespace but there are some components in kubernetes
they're not namespaced so to say um so basically they live just
globally in the cluster and you can't isolate them or put them in a certain
namespace and examples of such resources are volume or persistent volume and node
so basically when you create the volume it's going to be accessible throughout the whole cluster because it's not in a
namespace and you can actually list components they're not bound to a namespace using a command cubectl api
resources namespaced false and the same way you can also list all the resources that are
bound to a namespace using namespace true so now that you've learned what the
namespaces are why to use them in which cases it makes sense to use them in
which way and also some characteristics that you should consider let's actually see how to create
components in a namespace in the last example we've created components using configuration files and nowhere there we
have defined a namespace so what happens is by default if you don't provide a namespace to a component it creates them
in a default namespace so if i apply this config mac component and let's do that actually right now so cubecd apply
minus f config map if i apply that and i do cube ctl get config map my config map was created in
a default namespace and notice that even in the cubectl getconfigmap command i didn't use a
namespace because cubectl get or cubectl commands they take the default namespace
as a default so creepctl.getconfigmap is actually same as
cubectlgetconfigmapdash in or namespace and default namespace so these are the
same commands it's just a shortcut because it takes default as a default namespace okay so one way that i can
create this config map in a specific namespace is using cubesitl apply command but adding flag namespace
and the namespace name so this will create config map in my namespace
and this is one way to do it another way is inside the configuration file itself
so i can adjust this configmap configuration file to include the information about the destination
namespace itself so in the metadata i can add a namespace attribute so if i apply this configuration file
again using cubectl apply and now if i want to get the component that i created in this specific namespace then i have
to add the option or the flag to kubectl get command because as i said by default
it will check only in the default namespace so i recommend using the namespace
attribute in a configuration file instead of providing it to the cube ctl command
because one it's it's better documented so you know by just looking at the
configuration file where the component is getting created because that could be an important
information and second if you're using automated deployment where you're just
applying the configuration files then again this will be a more convenient way to do it now
if for example we take a scenario where one team gets their own namespace and it has to
work entirely in the namespace it could be pretty annoying to have to add this
namespace tag to every cube ctl command so in order to make it more convenient there is a way to change this default or
active namespace which is default namespace to whatever namespace you
choose and kubernetes or cubactl doesn't have any out of the box solution for that but
there is a tool called cubens or cubans and you have to install the
tool so on mac so i'm going to execute brew install
cube ctx so this will install cubans tool as well so once i have the
cubans installed i can just execute cuban's command
and this will give me a list of all the name spaces and highlight the one that is active which is default right now and
if i want to change the active namespace i can do cube ends
my namespace and this will switch the active
namespace so if i do cube ends now i see that active1 is my namespace so now i
can execute cubectl commands without providing mynamespace namespace
but obviously if you switch a lot between the namespaces this will not be so much
convenient for your own operating system and environment
there will be different installation process so i'm going to link the cube ctx installation guide in the
description below so in this video we're going to talk
about what ingress is and how you should use it and also what are different use
cases for ingress so first of all let's imagine a simple kubernetes cluster
where we have a pod of my application and its corresponding service my app
service so the first thing you need for your ui application is to be accessible through browser right so for external
requests to be able to reach your application so one way to do that an easy way is
through an external service where basically you can access the application using http protocol the ip address of
the node and the port however this is good for test cases and if you want to
try something very fast but this is not what the final product should look like
the final product should be like this so you have a domain name for application and you want a secure connection using
https so the way to do that is using kubernetes component called ingress so
you'll have my app ingress and instead of external service you would
instead have an internal service so you would not open your application through
the ip address and the port and now if the request comes from the browser it's going to first reach the
ingress and ingress then we'll redirect it to the internal service and then it will eventually end up with the pod so
now let's actually take a look and see how external service configuration looks like so that you have a practical
understanding so you have the service which is of type load balancer this means we are opening it to public by
assigning an external ip address to the service and this is the port number that
user can access the application at so basically the ip address the external ip
address and the port number that you specify here now with ingress of course it looks
differently so let's go through the syntax of ingress basically you have a kind ingress instead of a
service and in the specification where the whole configuration happens you have
so-called rules or routing rules and this basically defines that the main
address or all the requests to that host must be forwarded to an internal service
so this is the host that user will enter in the browser and in ingress users define a mapping so what happens when
that request to that host gets issued you redirect it internally to a service
the path here basically means the url path so everything after the domain name
so slash whatever path comes up to that you can define those rules here and we'll see some different examples of the
path configuration later and as you see here in this configuration we have a http protocol so
later in this video i'm going to show you how to configure https connection using ingress component so right now in
the specification we don't have anything configured for the secure connection it's just http and one thing to note
here is that this http attribute here does not correspond to this one here
this is a protocol that the incoming request gets forwarded to to the internal
service so this is actually the second step and not to confuse it with this one
and now let's see how the internal service to that ingress will look like so basically backhand is
the target where the request the incoming request will be redirected and the service name should correspond the
internal service name like this and the port should be the internal service port
and as you see here the only difference between the external and internal services is that
here in internal service i don't have the third port which is the node ports starting from 30 thousands we now have
that attribute here and the type is a default type not a load balancer but
internal service type which is cluster ip so this should be a valid domain
address so you can just write anything here it has to be first of all valid and you should map that domain name to ip
address of the node that represents an entry point to your kubernetes cluster
so for example if you decide that one of the nodes inside the kubernetes cluster is going to be the entry point
then you should map this to the ap address of that node or and we will see that later if you configure a server outside
of the kubernetes cluster that will become the entry point to your kubernetes cluster then you should map
this host name to the ip address of that server so now that we saw what
kubernetes ingress components looks like let's see how to actually configure ingress in the cluster
so remember this diagram i showed you at the beginning so basically you have a pod service and corresponding ingress
now if you create that ingress component alone that won't be uh enough for
ingress routing rules to work what you need in addition is an implementation
for ingress and that implementation is called ingress controller so the step one will be to install an ingress
controllers which is basically another pod or another set of parts that run on
your node in your kubernetes cluster and thus evaluation and processing of
ingress rules so the yaml file that i showed you with the ingress component is basically this part
right here and this has to be additionally installed in kubernetes cluster so what is ingress controller um
exactly the function of ingress controller is to evaluate all the rules
that you have defined in your cluster and this way to manage all the redirections so basically this will be
the entry point in the cluster for all the requests to that domain or subdomain rules that you've
configured and this will evaluate all the rules because you may have 50 rules or 50
ingress components created in your cluster it will evaluate all the rules and
decide based on that which forwarding rule applies for that specific request
so in order to install this implementation of ingress in your cluster you have to decide which one of
many different third-party implementations you want to choose from i'll put a link
of the whole list in the description where you see different kinds of ingress controllers you can choose from there is
one from kubernetes itself which is kubernetes nginx ingress controller but there are others as well so once you
install ingress controller in your cluster you're good to go create ingress roles and the whole configuration is
going to work so now that i've shown you how ingress can be used in a kubernetes cluster there is one thing that i think
is important to understand in terms of setting up the whole cluster to be able
to receive external requests now first of all you have to consider the environment
where your kubernetes cluster is running if you are using some cloud service provider like amazon web services google
cloud lino there are a couple more that have out of the box kubernetes
solutions um or they have their own virtualized load balances etc your
cluster configuration would look something like this so you would have a cloud load balancer that is specifically
implemented by that cloud provider and external requests coming from the
browser will first hit the load balancer and that load balancer then will
redirect the request to ingress controller now this is not the only way
to do it even in cloud environment you can do it in in a couple of different ways but this is one of the most common
uh strategies an advantage of using cloud provider for that is that you
don't have to implement a load balancer yourself so with minimal effort probably on most
cloud providers you will have the load balancer up and running and ready to receive those requests and forward those
requests then to your kubernetes cluster so very easy setup now if you're
deploying your kubernetes cluster on a bare metal environment then you would have to do that part yourself so
basically you would have to configure some kind of entry point to your kubernetes cluster yourself
and there's a whole list of different ways to do that and i'm gonna put that also in the description
but generally speaking either inside of a cluster or outside as a separate server
you will have to provide an entry point and one of those types is an external proxy server
which can be a software or hardware solution that will take the role of that
load balancer and entry point to your cluster so basically what this would mean is
that you will have a separate server and you would give this a public ip address
and you would open the ports in order for the requests to be accepted
and this proxy server then will act as an entry point to your cluster so
this will be the only one accessible externally so none of the servers in your kubernetes cluster will have
publicly accessible ip address which is obviously a very good security practice
so all the requests will enter the proxy server and that will then redirect the request to ingress controller and
ingress controller will then decide which ingress rule applies to that
specific request and the whole internal request forwarding will happen so as i said
there are different ways to configure that and to set it up depending on which
environment you are and also which approach you choose but i think it's a very important concept to understand how
the whole cluster setup works so in my case since i'm using a mini cube to
demonstrate all this on my laptop the setup will be pretty easy and even
though this might not apply exactly to your cluster setting still you will see in practice how all these things work so
the first thing is to install ingress controller in minicube and the way to do that is by
executing minicube add-ons enable ingress so what this does is automatically
configures or automatically starts the kubernetes nginx implementation of
ingress controller so that's one of the many third-party implementations which you can also
safely use in production environments not just mini cube but this is what minicube actually offers you out of the
box so with one simple command ingress controller will be configured in your cluster
and if you do cube ctl get pod in a cube system namespace you will see the nginx
ingress controller pod running in your cluster so once i have ingress controller installed now i can create an
ingress rule that the controller can evaluate so let's actually head over to the command line where i'm going to
create ingress rule for kubernetes dashboard component so in my mini cube cluster i have
kubernetes dashboard which is right now not accessible externally so what i'm
going to do is since i already have internal service for kubernetes dashboard and a port for that i'm going
to configure an ingress rule for the dashboard so i can access it from a browser using some domain name
so i'm gonna so this shows me all the components that
i have in kuwait's dashboard and since i already have uh internal service for
kubernetes dashboard and the pod that's running i can now create an ingress uh
rule in order to access the kubernetes dashboard using some host name so let's go ahead and do that
so i'm going to create an ingress for kubernetes dashboard um so these are just metadata the name is going to be
dashboard ingress and the namespace is going to be in the same namespace as the service and pod so in the specification
we are going to define the rules so the first rule is the host name
i'm just gonna call i'm gonna define dashboard.com
and the http forwarding to internal service
path let's leave it at all path and this is the back end of the service
so service name will be what we saw here so this is the service name
and service port is where the service listens so this is
actually 80 right here and this will be it that's the ingress configuration for
uh forwarding every request that is directed to dashboard.com to internal
kubernetes dashboard service and we know it's internal because its type is cluster ip so no external ip address
so obviously i just made up host name dashboard.com it's not registered anywhere and i also
didn't configure anywhere which ip address this host name
should resolve to and this is something that you will always have to configure so first of all let's actually create
that ingress rule so keep ctl apply and it's called dashboard ingress
yaml see ingress was created so if i do get ingress
in the namespace
i should see my ingress here and as you see address is now empty because it takes a little bit of time to
assign the address um to ingress so we'll have to wait for
that to get the ip address that will map to this host
so i'm just gonna watch this and it's i see that
address was assigned so what i'm gonna do now is that i'm gonna take that address
and in my etc hosts file
at the end i'm going to define that mapping so that ip address
will be mapped to dashboard.com and again this works locally if i'm going to type
dashboard.com in the browser this will be the ip address that it's going to be mapped
to which basically means that the request will come in to my mini cube
cluster will be handed over to ingress controller and ingress controller then we'll go and evaluate this rule that
i've defined here and forward that request to service so this is all the configuration we need
so now i'm gonna go and enter dashboard.com
and i will see my kubernetes dashboard here so ingress also has something called a
default backend so if i do cubectl describe ingress
the name of the ingress and the namespace
i'll get this output and here there is an attribute called default
backend that maps to default http backend port 80. so what this means is that
whenever a request comes into the kubernetes cluster that is not mapped to any backend so there is no rule for
mapping that request to an to a service then this default backend is used to handle
that request so obviously if you don't have this service created or defined
in your cluster kubernetes will try to forward it to the service it won't find it and you would get some
default error response so for example if i entered some
path that i haven't configured i just get page not found so a good usage for
that is to define custom error messages when a page isn't found when a request
comes in that you can handle or the application can handle so that users still see some meaningful error message
or just a custom page where you can redirect them to your home page or something like this
so all you have to do is create an internal service with the same name so
default http backend and the port number and also create a pod or application
that sends that error custom error message response so till now i have shown you
what ingress is and how you can use it i've also shown you a demo of how to create an ingress rule in minicube but
we've used only a very basic ingress yaml configuration just a simple
forwarding to one internal service with one path but you can do much more with
ingress configuration than just basic uh forwarding and in the next section we're
gonna go through more use cases of how you can define more fine granular routing for
applications inside kubernetes cluster so the first thing is defining multiple
paths of the same host so consider following use case
google has one domain but has many services that it offers so for example if you have a
google account you can use its analytics you can use it shopping you you have a calendar you have a gmail etc so all of
these are separate applications that are accessible with the same domain
so consider you have an application that does something similar so you offer two
separate applications they're part of the same ecosystem but you still want to
have them on separate urls so what you can do is that in rules you can define the host
which is myapp.com and in the path section you can define multiple path so if user wants to access
your analytics application then they have to enter myapp.com analytics and that will forward the
request to internal and analytic service and the pod or if they want to access the shopping
application then the url for that would be myapp.com shopping so this way you can do
forwarding with one ingress of the same host to multiple applications using
multiple path another use case is when instead of using urls to
make different applications accessible some companies use sub-domains so
instead of having myapp.com analytics they create a sub-domain
analytics.myapp.com so if you have your application configured that way your configuration
will look like this so instead of having one host like in the previous example and multiple path here inside now you
have multiple hosts where each host represents a subdomain and inside you
just have one path that again redirects that request to analytic service
pretty straightforward so now in the same request setting you have analytic service and
a pod behind it now the request will look like this using the subdomain instead of path
and one final topic that i mentioned that we'll cover here is configuring tls
certificate till now we've only seen ingress configuration for http requests
but it's super easy to configure https forwarding in ingress so the only thing
that you need to do is define attribute called tls above the rules section with
host which is the same host as right here and the secret name which is a
reference of a secret that you have to create in a cluster that holds that tls
certificate so the secret configuration would look like this so the name is
the reference right here and the data or the actual contents contain tls certificate and tls key
if you've seen my other videos where i create different components like secret you probably notice the type additional
type attribute here in kubernetes there is a specific type of a secret called
tls so we'll have to use that type when you create a tls secret and there are
three small notes to be made here one is that the keys of this data have to be
named exactly like that the values are the actual file contents of the
certificate or key contents and not the file path or location so you have to put
the whole content here basics before encoded and the third one is that you
have to create the secret in the same namespace as the ingress component for
it to be able to use that otherwise you can't reference a secret from another namespace and these four
lines is all you need to configure mapping of an https request to that host
to internal service
in this video i'm going to explain all the main concepts of helm so that you are able to use it in your own projects
also help changes a lot from version to version so understanding the basic common principles and more importantly
its use cases to when and why we use helm will make it easier for you to use
it in practice no matter which version you choose so the topics i'm gonna go through in this
video are helm and helm charts uh what they are how to use them and in which
scenarios they're used and also what is tiller and what part it plays in the helm architecture
so what is helm helm has a couple of main features that it's used for the
first one is as a package manager for kubernetes so you can think of it as ept
yum or hombrew for kubernetes so it's a convenient way for packaging
collections of kubernetes yaml files and distributing them in public and private
registry now these definitions may sound a bit abstract so let's break them down
with specific examples so let's say you have deployed your application in
kubernetes cluster and you want to deploy elasticsearch additionally in your cluster that your
application will use to collect its logs in order to deploy elastic stack in your
kubernetes cluster you will need a couple of kubernetes components so you would need a stateful
set which is for stateful applications like databases you will need a config
map with external configuration you would need a secret where some credentials
and secret data are stored you will need to create the kubernetes user with its respective permissions
and also create couple of services now if you were to create all of these files manually by
searching for each one of them separately on internet would be a tedious job and until you have all these
yaml files collected and tested and tried out it might take some time and since elasticstack deployment is pretty
much the standard across all clusters other people will probably have to go
through the same so it made perfect sense that someone created these yaml files once and
packaged them up and made it available somewhere so that other people who also use the same kind
of deployment could use them in their kubernetes cluster and that bundle of yaml files is called
helm chart so using helm you can create your own helm charts or bundles of those yaml
files and push them to some helm repository to make it available for
others or you can consume so you can use download and use existing helm charts
that other people pushed and made available in different repositories so commonly used deployments like
database applications elasticsearch mongodb mysql or monitoring applications
like prometheus that all have this kind of complex setup
all have charts available in some helm repository so using a simple helm install chart
name command you can reuse the configuration that someone else has already made without additional effort
and sometimes that someone is even the company that created the application and this functionality of sharing charts
that became pretty widely used actually was one of the contributors to why helm
became so popular compared to its alternative tools so now if you're if
you have a cluster and you need some kind of deployment that you think should be available out there you can actually
look it up either using command line so you can do helm search with a keyword or
you can go to either helms on public repository helmhub or on helm
charts pages or other repositories that are available and i will put all the relevant links
for this video in the description so you can check them out now apart from those public registries for
helm charts they're also private registries because when companies start creating those charts they also started
distributing them among or internally in the organization so it made perfect sense to create registries to share
those charts within the organization and not publicly so there are a couple of
tools out there they're used as helm charts private repositories as well
another functionality of helm is that it's a templating engine so what does
that actually mean imagine you have an application that is made up of multiple
microservices and you're deploying all of them in your kubernetes cluster and
deployment and service of each of those microservices are pretty much the same
with the only difference that the application name and version are different or the docker image name and
version tags are different so without helm you would write
separate yml files configuration files for each of those microservices so you would have multiple deployment service
files where each one has its own application name and version defined but
since the only difference between those yaml files are just couple of lines or
couple of values using helm what you can do is that you can define a common blueprint for all
the microservices and the values that are dynamic or the values that are going to change
replace by placeholders and that would be a template file so the
template file would look something like this you would have a template file which is standard eml but instead of
values in some places you would have the syntax which means that you're taking a
value from external configuration and that external configuration if you see the
syntax here dot values that external configuration comes from an additional
yaml file which is called values.yemo and here you can define all
those values that you're going to use in that template file so for example
here those four values are defined in a values yml file and
what dot values is it's an object that is being created
based on the values that are supplied by a value cml file and
also through command line using dash dash set flag so whichever way you
define those additional values they're combined and put together in dot values object that you can then use in those
template files to get the values out so now instead of having yaml files for
each microservice you just have one and you can simply replace those values
dynamically and this is especially practical when you're using continuous delivery continuous integration for your
application because what you can do is that in your build pipeline you can use those template yaml files and
replace the values on the fly before deploying them another use case where
you can use the helm features of package manager and templating engine
is when you deploy the same set of applications across different kubernetes clusters so
consider use case where you have your micro service application
that you want to deploy on development staging and production clusters
so instead of deploying the individual yaml files separately in each cluster
you can package them up to make your own application chart that will have all the
necessary yaml files that that particular deployment needs and
then you can use them to redeploy the same application in different kubernetes cluster
environments using one command which can also make the whole deployment process
easier so now that you know what helm charts are used for it let's actually look at
an example helm chart structure to have a better understanding so typically chart is made up of such a
directory structure so would have the top level will be the name of the chart and inside the directory you would have
following so chart.yaml is basically a file that contains all the meta information about
the chart it could be name and version maybe list of dependencies etc
values.yaml that i mentioned before is place where all the values are cons
configured for the template files and this will actually be the default
values that you can override later the charts directory will have
chart dependencies inside meaning that if this chart depends on other charts
then those chart dependencies will be stored here and templates folder is basically where
the template files are stored so when you execute helm install command
to actually deploy those yaml files into kubernetes the template files from here will be filled
with the values from values.yaml producing valid kubernetes manifest that can then
be deployed into kubernetes and optionally you can have some other files in this folder
like readme or license file etc so to have a better understanding of how
values are injected into helm templates consider that in values.yaml which is a
default value configuration you have following three values image name port
and version and as i mentioned the default values that are defined here can be overridden
in couple of different ways one way is that when executing helm install command
you can provide an alternative values yaml file using values flag
so for example if values yemo file will have following three values which are
image name port and version you can define your own values yaml file
called myvalues.yaml and you can override one of those values or you can even add some
new attributes there and those two will be merged which will result into a dot
values object that will look like this so would have image name and port from values.ml and the one that you overwrote
with your own values file alternatively you can also provide
additional individual values using set flag where you can define the values
directly on the command line but of course it's more organized and better manageable to have files where
you store all those values instead of just providing them on a command line another feature of helm is release
management which is provided based on its setup but it's important to note
here the difference between helm versions 2 and 3. in version 2 of helm the helm
installation comes in two parts you have helm client and the server and the
server part is called tiller so whenever you deploy helm chart using helm install
my chart helm client will send the yaml files to tiller that actually runs or
has to run in a kubernetes cluster and tiller then will execute these requests and create components from
these yemo files inside the kubernetes cluster and exactly this architecture
offers additional valuable feature of helm which is release management so the
way helm client server setup works is that whenever you create or change
deployment pillar will store a copy of each configuration client send for
future reference thus creating a history of chart executions
so when you execute helm upgrade chart name the changes will be applied to the
existing deployment instead of removing it and creating a new one and also in case the upgrade goes wrong for
example some yaml files were false or some configuration was wrong you can
roll back that upgrade using helm rollback chart name comment
and all this is possible because of that chart execution history that dealer
keeps whenever you send those requests from helm client to tiller however this
setup has a big caveat which is that tiller has too much power inside the kubernetes cluster
it can create update delete components and it has too much permissions
and this makes it actually a big security issue and this was one of the reasons why in
helm3 they actually removed the tila part and it's just a simple helm binary
now and it's important to mention here because a lot of people have heard of
tiller and when you deploy a helm version 3 you shouldn't be confused that tiller isn't actually
there anymore in this video i will show you how you
can persist data in kubernetes using volumes we will cover three components
of kubernetes storage persistent volume persistent volume claim and storage class
and see what each component does and how it's created and used for data persistence
consider a case where you have a mysql database pod which your application uses
data gets added updated in the database maybe you create a new database with a
new user etc but default when you restart the pod
all those changes will be gone because kubernetes doesn't give you data persistence out of the box
that's something that you have to explicitly configure for each application that needs saving data
between pod restarts so basically you need a storage that
doesn't depend on the pod lifecycle so it will still be there when paul dies
a new one gets created so the new part can pick up where the previous one left off
so it will read the existing data from that storage to get up-to-date data
however you don't know on which node the new part restarts so your storage must
also be available on all nodes not just one specific one so that when the new
pod tries to read the existing data the up-to-date data is there on any node in
the cluster and also you need a highly available storage that will survive
even if the whole cluster crashed so these are the criteria or the requirements
that your storage for example your database storage will need to have
to be reliable another use case for persistent storage which is not for database is a directory maybe you have
an application that writes and reads files from pre-configured directory this
could be session files for application or configuration files etc and you can
configure any of this type of storage using kubernetes component called
persistent volume think of a persistent volume as a cluster resource just like ram or cpu
that is used to store data persistent volume just like any other
component gets created using kubernetes yaml file where you can specify the kind
which is persistent volume and in the specification section you have to define
different parameters like how much storage should be created for the volume but since
persistent volume is just an abstract component it must take the storage from
the actual physical storage right like local hard drive from the cluster nodes or your external
nfs servers outside of the cluster or maybe cloud storage like aws
block storage or from google cloud storage etc so the question is where
does this storage back-end come from local or remotes or on cloud who configures it who makes it available to
the cluster and that's the tricky part of data persistence in kubernetes because
kubernetes doesn't care about your actual storage it gives you persistent
volume component as an interface to the actual storage that you as a maintainer
or administrator have to take care of so you have to decide what type of
storage your cluster services or applications would need and create and
manage them by yourself managing meaning do backups and make sure they don't get corrupt etc so think
of storage in kubernetes as an external plug-in to your cluster
whether it's a local storage on the actual nodes where the cluster is running or a remote storage doesn't
matter they're all plugins to the cluster and you can have multiple storages configured for your cluster
where one application in your cluster uses local disk storage
another one uses the nfs server and another one uses some cloud storage or
one application may also use multiple of those storage types
and by creating persistent volumes you can use these actual physical storages
so in the persistent volume specification section you can define which
storage back-end you want to use to create that storage abstraction or storage resource for your
applications so this is an example where we use nfs storage backend so basically
we define how much storage we need um some additional parameters so that storage like should it be read write or
read only etc and the storage back end with its parameters
and this is another example where we use google cloud as a storage backend again
with the storage backend specified here and capacity and access modes here now
obviously depending on the storage type on the storage backend some of the attributes in the
specification will be different because they're specific to the storage type
this is another example of a local storage which is on the node itself
which has additional node affinity attribute now you don't have to remember and know all these attributes
at once because you may may not need all of them and also i will make separate videos covering
some of the most used volumes and explain them individually with examples and demos so there i'm going to explain
in more detail which attributes should be used for these specific volumes and what they actually
mean in the official kubernetes documentation you can actually see the complete list of more than 25 storage
back-ends that kubernetes supports note here that persistent volumes
are not namespaced meaning they're accessible to the whole cluster
and unlike other components that we saw like pods and services they're not in
any namespace they're just available to the whole cluster to all the namespaces
now it's important to differentiate here between two categories of the volumes local and remote each volume type in
these two categories has its own use case otherwise they won't exist and we will
see some of these use cases later in this video however the local volume types
violate the second and third requirements of data persistence for databases that i mentioned at the
beginning which is one not being tied to one specific node but rather to each
node equally because you don't know where the new pod will start and the second
surviving in cluster crash scenarios because of these reasons for database
persistence you should almost always use remote storage
so who creates this persistent volumes and when as i said persistent volumes are
resources like cpu or ram so they have to be already there in the cluster when
the pod that depends on it or that uses it is created so a side note here is
that there are two main roles in kubernetes there's an administrator who sets up the cluster and maintains it
and also makes sure the cluster has enough resources these are usually system administrators
or devops engineers in a company and the second role is kubernetes user
that deploys the applications in the cluster either directly or through ci pipeline these are developer devops
teams who create the applications and deploy them so in this case the kubernetes administrator would be the
one to configure the actual storage meaning to make sure that the nfs server
storage is there and configured or maybe create and configure a cloud storage
that will be available for the cluster and second create persistent volume components from these storage backends
based on the information from developer team of what types of storage their applications would need and the
developers then will know that storage is there and can be used by their applications but for that developers
have to explicitly configure the application yaml file to use those persistent volume
components in other words application has to claim that volume storage and you do that
using another component of kubernetes called persistent volume claim
persistent volume claims also pvcs are also created with yaml configuration
here's an example claim again don't worry about understanding each and every attribute that is defined here but on
the higher level the way it works is that pvc claims a volume with certain storage
size or capacity which is defined in the persistent volume claim and some additional characteristics
like access type it should be read only or read write or the type etc and
whatever persistent volume matches this criteria or in other words satisfies
this claim will be used for the application but that's not all you have to now use that claim in your pods
configuration like this so in the pod specification here you have the volumes
attribute that references the persistent volume claim
with its name so now the pod and all the containers inside the pod will have
access to that persistent volume storage so to go through those levels of
abstraction step by step pods access storage by using the claim as a volume
right so they request the volume through claim the claim then will go and try to find a
volume persistent volume in the cluster that satisfies the claim and the volume will have a storage the
actual storage backend that it will create that storage
resource from and this way the pod will now be able to use that actual storage backend
note here that claims must exist in the same namespace as the pod using the claim
while as i mentioned before persistent volumes are not namespaced so once the pod finds the matching
persistent volume through the volume claim through the persistent volume claim the volume is then mounted into
the pod like this here this is a pod level and then that volume can be mounted into
the container inside the pot which is this level right here
and if you have multiple containers here in the pot you can decide to mount this volume in all the
containers or just some of those so now the container and the application inside the container
can read and write to that storage and when the pot dies a new one gets created
it will have access to the same storage and see all the changes the previous pod
or the previous containers made again the attributes here like volumes and volume mounts etc and how they're used i
will show you more specifically and explain in a later demo video now you
may be wondering why so many abstractions for using volume where
admin role has to create persistent volume and reuser role creates a claim on that persistent volume and that isn't
used in pod can i just use one component and configure everything there well this
actually has a benefit because as a user meaning a developer who just wants to deploy their application in the cluster
you don't care about where the actual storage is you know you want your database to have
persistence and whether the data will leave on the gluster fs or aws ebs or
local storage doesn't matter for you as long as the data is safely stored or if
you need a directory storage for files you don't care where the directory actually leaves as long as it has enough
space and works properly and you sure don't want to care about setting up these actual storages
yourself you just want 50 gigabyte storage for your elastic or 10 gigabyte
for your application that's it so you make a claim for storage using pvc and assume that cluster has
storage resources already there and this makes deploying the
applications easier for developers because they don't have to take care of the stuff beyond
deploying the applications now there are two volume types that i think needs to be mentioned separately
because they're a bit different from the rest and these are config map and secret
now if you have watched my other video on kubernetes components then you are already familiar with both
both of them are local volumes but unlike the rest these two aren't created
via pv and pvc but are rather own components and managed by kubernetes itself
consider a case where you need a configuration file for your prometheus pod or maybe a message broker service
like mosquito or consider when you need a certificate file mounted inside your
application in both cases you need a file available to your pod
so how this works is that you create configmap or secret component and you can mount that into your pod and into
your container the same way as you would mount persistent volume claim so instead
you would have a config map or secret here and i will show you a demo of this
in a video where i cover local volume types so to quickly summarize what we've
covered so far as we see at its core a volume is just a directory possibly with some data in it
which is accessible to the containers in a pod how that directory is made available or
what storage medium actually packs that and the contents of the directory
are defined by a specific volume type you use so to use a volume a part specifies what
volumes to provide for the pod in the specification volumes attribute and inside the pod
then you can decide where to mount that storage into using volume mounts
attribute inside the container section and this is a path inside the container
where application can access whatever storage we mounted into the container
and as i said if you have multiple containers you can decide which container should get access to that
storage interesting note for you is that a pod can actually use multiple
volumes of different types simultaneously let's say you have an elasticsearch
application or pod running in your cluster that needs a configuration file
mounted through a config map needs a certificate let's say client certificate are mounted as a secret and
it needs database storage let's say which is backed with aws
elastic block storage so in this case you can configure all three
inside your pod or deployment so this is the pod specification that we
saw before and here on the volumes level you will just list all the volumes that you want to mount
into your pod so let's say you have a persistent volume claim that
in the background claims persistent volume from aws block storage and here you have the config map and here have a
secret and here in the volume mounts you can list all those uh storage mounts using the
names right so you have the persistent storage then you have the config map and
the secret and each one of them is mounted to a certain path inside the container
now we saw that to persist data in kubernetes admins need to configure storage for the cluster
create persistent volumes and developers then can claim them using pvcs but
consider a cluster with hundreds of applications where things get deployed daily and storage is needed for these
applications so developers need to ask admins to create persistent volumes they need
for applications before deploying them and admins then may have to manually request storage from cloud or storage
provider and create hundreds of persistent volumes for all the applications that need storage manually
and that can be tedious time consuming and can get messy very quickly
so to make this process more efficient there is a third component of kubernetes
persistence called storage class storage class basically creates or provisions
persistent volumes dynamically whenever pvc claims it and this way
creating or provisioning volumes in a cluster may be automated storage class also gets created using
yaml configuration file so this is an example file where we have the kind
storage class storage class creates persistent volumes dynamically in the background so
remember we define storage backend in the persistent volume component now we
have to define it in the storage class component and we do that using the provisioner attribute
which is the main part of the storage class configuration because it tells kubernetes which provisioner to be used
for a specific storage platform or cloud provider to create the persistent volume component
out of it so each storage backend has its own provisioner that kubernetes offers internally which are prefixed
with kubernetes.io like this one here and these are internal provisioners
and for others or other storage types they're external provisioners that you
have to then explicitly go and find and use that in your storage class
and in addition to provisioner attribute we configure parameters of the storage
we want to request for our persistent volume like this one's here so storage class is basically another abstraction
level that abstracts the underlying storage provider as well as parameters for that storage characteristics for the
storage like what disk type or etc so how does it work or how do you use storage class
in the pod configuration same as persistent volume it is requested or
claimed by pvc so in the pvc configuration here we add additional attribute
that is called storage class name that references the storage class to be
used to create a persistent volume that satisfies the claims
of this pvc so now when a pod claims storage through
pvc the pvc will request that storage from storage class which then will
provision or create persistent volume that meets the needs
of that claim using provisioner from the actual storage backend now this should
help you understand the concepts of how data is persisted in kubernetes is a
high level overview in this video we're going to talk about
what stateful set is in kubernetes and what purpose it has so what is stateful
set it's a kubernetes component that is used specifically for stateful applications
so in order to understand that first you need to understand what a stateful application is
examples of stateful applications are all databases like mysql elasticsearch
mongodb etc or any application that stores data to keep track of its state in other words
these are applications that track state by saving that information in some storage stateless applications on the
other hand do not keep records of previous interaction and each request or
interaction is handled as a completely new isolated interaction
based entirely on the information that comes with it and sometimes stateless applications connect to the stateful
application to forward those requests so imagine a simple setup of a node.js
application that is connected to mongodb database when a request comes in to the node.js
application it doesn't depend on any previous data to handle this incoming request
it can handle it based on the payload in the request itself now a typical such request will
additionally need to update some data in the database or query the data
that's where mongodb comes in so when node.js forwards that request to mongodb
mongodb will update the data based on its previous state or query the data
from its storage so for each request it needs to handle data and obviously always depends on the most up-to-date
data or state to be available while nodejs is just a pass-through for data
updates or queries and it just processes code now because of this difference between
stateful and stateless applications they're both deployed different ways
using different components in kubernetes stateless applications are deployed
using deployment component deployment is an abstraction of pods and allows you to replicate that
application meaning run two five ten identical parts of the same stateless
application in the cluster so while stateless applications are deployed using deployment
stateful applications in kubernetes are deployed using stateful set components
and just like deployment statefulset makes it possible to replicate the stateful app parts or to run multiple
replicas of it in other words they both manage parts that are based on an identical container
specification and you can also configure storage with both of them equally
in the same way so if both manage the replication of pods and also
configuration of data persistence in the same way the question is what a lot of
people ask and are also often confused about what is the difference between those two
components why we use different ones for each type of application so in the
next section we're gonna talk about the differences now replicating stateful application is more difficult and has a
couple of requirements that stateless applications do not have so let's look at this first with the example of a
mysql database let's say you have one mysql database part that handles
requests from a java application which is deployed using a deployment component
and let's say you scale the java application to three parts so they can handle more client requests
in parallel you want to scale mysql app so it can handle more java requests as
well scaling your java application here is pretty straightforward java applications replica parts
will be identical and interchangeable so you can scale it
using a deployment pretty easily deployment will create the pods in any order in any random order they will get
random hashes at the end of the pod name they will get one service that load
balances to any one of the replica pods for any request and also when you delete
them they get deleted in a random order or at the same time right or when you
scale them down from three to two replicas for example one random replica
part gets chosen to be deleted so no complications there on the other hand
mysql part replicas cannot be created and deleted at the same time in any
order and they can't be randomly addressed and the reason for that is because the replica parts are not
identical in fact they each have their own additional identity on top of the common
blueprint of the pot that they get created from and giving each part its own
required individual identity is actually what stateful set does different from
deployment it maintains a sticky identity for each of its spots and as i said these pods
are created from the same specification but they're not interchangeable each has a persistent identifier that it
maintains across any rescheduling so meaning when pod dies and it gets
replaced by a new part it keeps that identity so the question you may be
asking now is why do these parts need their own identities why they can't be
interchangeable just like with deployment so why is that and this is a concept that you need to understand about
scaling database applications in general when you start with a single mysql pod
it will be used for both reading and writing data but when you add a second one it cannot
act the same way because if you allow two independent instances of mysql to change the same data
you will end up with data inconsistency so instead there is a mechanism that decides that only one part is allowed to
write or change the data which is shared reading at the same time by multiple
parts mysql instances from the same data is completely fine and the pot that is
allowed to update the data is called the master the others are called slaves
so this is the first thing that differentiates these parts from each other so not all ports are same
identical but there is a must pod and they're the slave pots right and there's also difference between those slave pots
in terms of storage which is the next point so the thing is that these pods do
not have access to the same physical storage even though they use the same
data they're not using the same physical storage of the data they each have their
own replicas of the storage that each one of them can access for itself and
this means that each pod replica at any time must have the same data as the
other ones and in order to achieve that they have to continuously synchronize their data and since master is the only
one allowed to change data and the slaves need to take care of their own data storage obviously the slaves must
know about each such change so they can update their own data storage to be up
to date for the next query requests and there's a mechanism in such clustered
database setup that allows for continuous data synchronization
master changes data and all slaves update their own data storage to keep in
sync and to make sure that each pod has the same state now let's say you have
one master and two slave parts of my sequel now what happens when a new pod replica joins the existing
setup because now that new pod also needs to create its own storage and then
take care of synchronizing it what happens is that it first clones the data from the previous part not just any pod
in the in the setup but always from the previous part and once it has the up-to-date data
cloned it starts continuous synchronization as well to listen for any updates by masterpod and this also
means and i want to point this out since it's pretty interesting point it means that you can actually have a
temporary storage for a stateful application and not persist the data at all since the data gets replicated
between the pots so theoretically it is possible to just rely on data replication between the pots but this
will also mean that the whole data will be lost when all the parts die so for example if
stateful set gets deleted or the cluster crashes or all the nodes where these pod
replicas are running crash and every pod dies at the same time the data will be gone and therefore it's
still a best practice to use data persistence for stateful applications if
losing the data will be unacceptable which is the case in most database applications and with persistent storage
data will survive even if all the parts of the stateful set die or even if you delete the complete
stateful set component and all the parts get wiped out as well the persistent storage and the data will
still remain because persistent volume uh life cycle isn't connected or isn't
tied to a life cycle of other components like deployment or
stateful set and the way to do this is configuring persistent volumes for your
stateful set and since each pod has its own data storage meaning it's their own
persistent volume that is then backed up by its own physical storage which includes the synchronized data or the
replicated database data but also the state of the pod so each pod has its own
state which has information about whether it's a masterpod or a slave or
other individual characteristics and all of this gets stored in the pot's own
storage and that means when a pot dies and gets replaced
the persistent pot identifiers make sure that the storage volume
gets reattached to the replacement pod as i said because that storage has the
state of the pod in addition to that replicated data i mean you can clone the data again that
will be no problem but it shouldn't lose its state or identity state so to say
and for this reattachment to work it's important to use a remote storage
because if the pod gets rescheduled from one node to another node the previous storage must be available on
the other node as well and you cannot do that using local volume storage because they are usually
tied to a specific node and the last difference between deployment and
stateful set is something that i mentioned before is the pod identifier meaning that every
pod has its own identifier so unlike deployment where pods get random hashes
at the end stateful set parts get fixed ordered names which is made up of the stateful
set name and ordinal it starts from zero and each additional part will get the
next numeral so if you create a stateful set called mysql with three replicas you'll have parts with names must equal
zero one and two the first one is the master and then come the slaves in the
order of startup an important note here is that the stateful set will not create
the next part in the replica if the previous one isn't already up and
running if first pod creation for example failed or if it was pending the
next one won't get created at all it would just wait and the same order is
held in deletion but in reversed order so for example if you deleted the state rule set or if you scaled it down to one
for example from three the deletion will start from the last part so my sql two will get deleted
first it will wait until that pod is successfully deleted and then it will
delete mysql one and then it will delete must equal zero and again all these
mechanisms are in place in order to protect the data and the state that the
stateful application depends on in addition to this fixed predictable names
each part in a stateful set gets its own dns endpoint from a service so there's a service name for the satell application
just like for deployment for example that will address any replica pod
and plus in addition to that there is individual dns name for each pod which
deployment pods do not have the individual dns names are made up of pod
name and the manage or the governing service name which is basically a
service name that you define inside the stateful set so these two characteristics meaning
having a predictable or fixed name as well as it's fixed individual dns name
means that when pod restarts the ip address will change but the name and end
point will stay the same that's why i said pods get sticky identities so it gets stuck to it even between the
restarts and the sticky identity makes sure that each replica pod can retain
its state and its role even when it dies and gets recreated and finally i want to
mention an important point here as you see replicating stateful apps like databases with its persistent storage
requires a complex mechanism and kubernetes helps you and supports you to
set this whole thing up but you still need to do a lot by yourself where kubernetes doesn't actually help you or
doesn't provide you out-of-the-box solutions for example you need to configure the cloning and data
synchronization inside the stateful set and also make the remote storage available as well as take care of
managing and backing it up all of these you have to do yourself and the reason is that stateful
applications are not a perfect candidate for containerized environments in fact
docker kubernetes and generally containerization is perfectly fitting for stateless applications
that do not have any state and data dependency and only process code so scaling and replicating them in
containers is super easy
in this video i will give you a complete overview of kubernetes services first i'll explain shortly what service
component is in kubernetes and when we need it and then we'll go through the different service types cluster ip
service headless service node port and load balancer services i will explain
the differences between them and when to use which one so by the end of the video
you will have a great understanding of kubernetes services and will be able to use them in practice
so let's get started so what is the service in kubernetes and why do we need it in a kubernetes
cluster each pod gets its own internal ip address but the pods in kubernetes
are ephemeral meaning that they come and go very frequently and when the pod
restarts or when old one dies and the new one gets started in its place it gets a new ip
address so it doesn't make sense to use pod ip addresses directly because then
you would have to adjust that every time the pod gets recreated with the service however you have a solution of a stable
or static ip address that stays even when the pod dies so basically in front of each pod we set a service which
represents a persistent stable ip address access that pod a service also
provides load balancing because when you have pod replicas for example three
replicas of your micro service application or three replicas of mysql application
the service will basically get each request targeted to that mysql or your
micro service application and then forward it to one of those pods so
clients can call a single stable ip address instead of calling each pod
individually so services are a good abstraction for loose coupling for communication within the cluster so
within the cluster components or pods inside the cluster but also from external services like if you have
browser requests coming to the cluster or if you're talking to an external database for example
there are several types of services in kubernetes the first and the most common
one that you probably will use most of the time is the cluster ip type this is
a default type of a service meaning when you create a service and not specify a
type it will automatically take cluster ip as a type so let's see how cluster ip
works and where it's used in kubernetes setup imagine we have
a micro service application deployed in the cluster so we have a pod with
microservice container running inside that pod and beside that microservice
container we have a sidecar container that collects the logs of the microservice and then sends that to some
destination database so these two containers are running in the pod and let's say your micro service container
is running at pod 3000 and your logging container let's say is running on port
9000 this means that those two ports will be now open and accessible inside the pod
and pod will also get an ip address from a range that is assigned to a node so the way it
works is that if you have for example three worker nodes in your
kubernetes cluster each worker node will get a range of ip addresses
which are internal in the cluster so for example the pod one will get ip addresses from a range
of 10.2.1 onwards the second worker node will get
this ip range and the third worker node will get this one so let's say this pod starts on node 2 so it get an ip
address that looks like this if you want to see the ip addresses of your pods in
the cluster you can actually check them using cube ctl get pod output wide
command where you will get some extra information about the pods including its ip address and here you will see the ip
address that it got assigned and as i mentioned these are from the ip address range that each worker node in
the cluster will get so this is from the first worker node and these are from the second worker
node so now we can access those containers inside the pod at this ip address at
these ports if we set the replica count to 2 we're going to have another pod which is
identical to the first one which will open the same ports and it will get a different ip address let's say if it
starts on worker node 1 you will get an ip address that looks something like this
now let's say this microservice is accessible through a browser so we have ingress configured and
the requests coming in from the browser to the micro service will be handled by ingress how does this
incoming request get forwarded from ingress all the way to the pod and that happens through a service a
cluster ip or so-called internal service a service in kubernetes is a component
just like a pod but it's not a process it's just an abstraction layer that basically represents an ip address so
service will get an ip address that it is accessible at and service will also
be accessible at a certain port let's say we define that port to be 3200
so ingress will talk to the service or hand over the request to the service at
this ip address at this port so this is how service is accessible
within the cluster so the way it works is that we define ingress rules that
forward the request based on the request address to certain services and we define the
service by its name and the dns resolution then maps that service name
to an ip address that the service actually got assigned so this is how ingress knows
how to talk to the service so once the request gets handed over to the service
at this address then service will know to forward that request to one of those
parts that are registered as the service endpoints now here are two questions how
does service know which pods it is managing or which parts to forward the
request to and the second one is how does service know which port to forward
that request to on that specific pod the first one is defined by selectors
a service identifies its member pods or its endpoint parts using selector
attribute so in the service specification in the yaml file from which we create the service we specify
the selector attribute that has a key value pairs defined as a list now these
key value pairs are basically labels that pods should have to match that
selector so in the pod configuration file we assign the parts certain labels
in the metadata section and these labels can be arbitrary names so we can say my
app for example and give it some other labels this is basically something that we define ourselves we can give it any
name that we want these are just key value pairs that identify a set of pots
and in the survey cml file then we define a selector to match any part that has all of these labels this means if we
have a deployment component that creates three replicas of parts with label
called app my app and type microservice for example
and in the service selector attribute we define those two labels then service
will match all of those three pod replicas and it will register all three
parts as its endpoints and as i said it should match all the selectors not just one so this is how
service will know which parts belong to it meaning where to forward that request
to the second question was if a pod has multiple ports open where two different
applications are listening inside the pod how does service know which port to
forward the request to and this is defined in the target port attribute so
this target port attribute so let's say target port in our example is 3000 what
this means is that when we create the service it will find all the parts that match
this selector so these pods will become endpoints of the service and when the service gets a
request it will pick one of those pod replicas randomly because it's a load balancer and it will send the request it
received to that specific pod on a port
defined by target port attribute in this case 3000
also note that when you create a service kubernetes creates an endpoints object
that has the same name as the service itself and kubernetes will use this endpoints object to keep track
of which parts are members of the service or as i said which parts are the end
points of the service and since this is dynamic because whenever you create a new pod replica or a pod dies the end
points get updated so this object will basically track that and note here that the service port
itself is arbitrary so you can define it yourself whereas the target port is not
arbitrary it has to match the port where container the application
container inside the pod is listening at now let's say our micro service
application got its requests from the browser through ingress and internal
cluster ip service and now it needs to communicate with the database to handle
that request for example and in our example let's assume that the microservice application uses mongodb
database so we have two replicas of mongodb in the cluster which also have
their own service endpoint so mongodb service is also of cluster ip and it has
its own ip address so now the microservice application inside the pod
can talk to the mongodb database also using the service endpoint so the
request will come from one of the parts that gets the request from the service
to the mongodb service at this ip address and the port that service has
open and then service will again select one of those pod replicas and
forward that request to the selected pod at the port the target port defined here
and this is the port where mongodb application inside the pod is listening at
now let's assume that inside that mongodb pod there is another container running that selects the monitoring
metrics for prometheus for example and that will be a mongodb exporter and
that container let's say is running at port 9216 and this is where the application is
accessible at and in the cluster we have a prometheus application that scrapes
the metrics endpoint from this mongodb exporter container from this endpoint
now that means that service has to handle two different endpoint requests
which also means that service has two of its own ports open
for handling these two different requests one from the clients that want
to talk to the mongodb database and one from the clients like prometheus that want to talk to the mongodb exporter
application and this is an example of a multi-port service and note here that
when you have multiple ports defined in a service you have to name those ports
if it's just one port then you can leave it so to say anonymous you don't have to use the name attribute it's optional but
if you have multiple ports defined then you have to name each one of those so these were examples of cluster ip
service type now let's see another service type which is called headless service so let's see what headless
service type is as we saw each request to the service is forwarded to one of the pod replicas
that are registered as service endpoints but imagine if a client
wants to communicate with one of the parts directly and selectively or what
if the endpoint parts need to communicate with each other directly without going through the
service obviously in this case it would make sense to talk to the service endpoint which will randomly select one
of the parts because we want the communication with specific parts now what would be
such a use case a use case where this is necessary is when we're deploying stateful
applications in kubernetes stateful applications like databases mysql mongodb
elasticsearch and so on in such applications the pod replicas aren't
identical but rather each one has its individual state and characteristic for
example if we're deploying a mysql application you would have a master instance of mysql and worker instances
of mysql application and master is the only pod allowed to write to the
database and the worker pods must connect to the master to synchronize
their data after masterpod has made changes to the database
so they get the up-to-date data as well and when new worker pod starts
it must connect directly to the most recent worker node to clone the data
from and also get up to date with the data state so that's the most common use case where
you need direct communication with individual pots for such case for a
client to connect to all pots individually it needs to figure out the ip address of each individual pod
one option to achieve this would be to make an api call to kubernetes api server
and it will return the list of pods and their ip addresses but this will make your application too
tied to the kubernetes specific api and also this will be inefficient because you will have to get the whole list of
parts and their ip addresses every time you want to connect to one of the pods
but as an alternative solution kubernetes allows clients to discover pod ip addresses through dns lookups and
usually the way it works is that when a client performs a dns lookup for a service the dns server returns a single
ip address which belongs to the service and this will be the services cluster ip address which we saw previously however
if you tell kubernetes that you don't need a cluster ip address of the service by setting the cluster ip field to none
when creating a service then the dns server will return the pod ip addresses instead of the services ip address and
now the client can do a simple dns lookup to get the ip address of the pods that
are members of that service and then client can use that ip address to connect to the specific part he wants to
talk to or all of the parts so the way we define a headless service
in a service configuration file is basically setting the cluster ip to none
so when we create these service from this configuration file kubernetes will not assign the service a cluster ip
address and we can see that in the output when i list my services so i have a cluster ip
service that i created for the microservice and a headless service and
note here that when we deploy stateful applications in the cluster like mongodb for example we have
the normal service the cluster ip service that basically handles the
communication to mongodb and maybe other container inside the pod and in addition to that
service we have a headless service so we always have these two services alongside each other so this can do the usual load
balancing stuff for this kind of use case and for use cases where client needs to
communicate with one of those parts directly like a master node directly to perform the
right commands or the pods to talk to each other for data synchronization the
headless service will be used for that when we define a service configuration
we can specify a type of the service and the type attribute can have three
different values it could be cluster ip which is a default that's why we don't have to specify that we have a node port
and load balancer so type node port basically creates a service that is accessible on a static
port on each worker node in the cluster now to compare that to our previous
example the cluster ip service is only accessible within the cluster itself so
no external traffic can directly address the cluster ip service
the node port service however makes the external traffic accessible on
static or fixed port on each worker node so in this case instead of ingress the
browser request will come directly to the worker node at the port that the
service specification defines in the port that node port service type exposes
is defined in the node port attribute and here note that the node port value
has a predefined range between thirty thousand and thirty two thousand seven hundred
seven so you can have one of the values from that range as a
node port value anything outside that range won't be accepted so this means that the node port service
is accessible for the external traffic like browser request for example at ip address of the worker node and the node
port defined here however just like in cluster ip we have a port of the service
so when we create the node port service a cluster ip service to which the node port service will route is automatically
created and here as you see if i list the services the node port will have a cluster ip
address and for each ip address it will also have the ports open where the service is accessible at
and also note that service spends all the worker nodes so if you have three pod replicas
on three different notes basically the service will be able to handle that request coming on any of the worker nodes
and then forward it to one of those pod replicas now that type of service exposure is not
very efficient and also not secure because you are basically opening the ports to directly talk to the services
on each worker node so the external clients basically have access to the worker nodes directly
so if we give all the services this node port service type then we
would have a bunch of ports open on the worker nodes clients from outside can directly talk to so
it's not very efficient and secure way to handle that and as a better alternative there is a load balancer
service type and the way it works with load balance or service type is that the service becomes accessible externally
through a cloud provider's load balancer functionality so each cloud provider has its own native load balancer
implementation and that is created and used whenever we create a load balancer
service type uh google cloud platform aws azure lee node openstack and so on
all of them offer this functionality so whenever we create a load balancer service
node port and cluster ip services are created automatically by kubernetes to which the external load balancer of the
cloud platform will route the traffic to and this is an example of how did we
define load balancer service configuration so instead of node port type we have a
load balancer and the same way we have the port of the service which belongs to the cluster ip
and we have the node port which is the port that opens on the worker node but it's not directly
accessible externally but only through the load balancer itself so the entry
point becomes a load balancer first and it can then direct the traffic to node
port on the worker node and the cluster ip the internal service
so that's how the flow would work with the load balancer service so in other words the load balancer
service type is an extension of the node port type which itself is an extension of the
cluster ip type and again if i create a load balancer service type
and list all the services you can see the differences in the display as well where for each service type you see the
ip addresses you see the type and you see the ports that the service has opened
and i should mention here that in a real kubernetes setup example you would probably not use node port for external
connection you would maybe use it to test some surveys very quickly but not
for production use cases so for example if you have a application that is accessible through browser you will
either configure ingress for each such request so you would have internal services the cluster ip services that
ingress will route to or you would have a load balancer that uses the cloud platform's native load balancer
implementation congratulations you made it till the end i hope you learned a lot and got some
valuable knowledge from this course if you want to learn about modern devops tools be sure to check out my tutorials
on that topic and subscribe to my channel for more content also if you want to stay connected you
can follow me on social media or join the private facebook group i would love to see you there

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
- [MiniKube](https://minikube.sigs.k8s.io/docs/start/)
- [Hyperv](https://minikube.sigs.k8s.io/docs/drivers/hyperv/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/)
- Powershell tweaks
- > $profile<br>set-alias minikube minukibe.exe<br> set-alias kubectl kubectl.exe
- - Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
- - Every PS session `kubectl completion powershell | Out-String |Invoke-Expression`
