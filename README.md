# RP-Evaluation-of-5G-Open-Radio-Access-Network-Simulation-Environments.
## 1 Introduction

The rise of 5G networks has become crucial to meeting the growing demand for fast data transmission and improved network capacity. The Open Radio Access Network (O-RAN) architecture offers a solution to enhance the flexibility and interoperability of 5G networks. To ensure the successful deployment and optimization of O-RAN, it is essential to evaluate and test its components and functionalities. Simulating O-RAN in controlled environments provides a costeffective way to assess its performance.

This research project aims to evaluate simulation environments for deploying O-RAN. By analyzing simulation tools and methodologies, this study aims to identify their components and suitability for simulating O-RAN. Additionally, this research will test the connectivity of components and create a service using the Open Network Automation Platform (ONAP). This platform was introduced by the O-RAN Alliance software community.

O-RAN Alliance has developed O-RAN components and published their releases, including this research paper based on G-Release. G-Release is developed on Docker and Kubernetes, and this research followed Kubernetes implementation. 
Apart from that, this Kubernetes implementation needs additional support from Docker and Helm Chart.

**Kubernetes**: Kubernetes, an open-source container orchestration platform, revolutionizes how applications are deployed, scaled, and managed. Initially created by Google and overseen by the Cloud Native Computing Foundation, Kubernetes provides developers with a powerful and intuitive solution to handle applications across server clusters or virtual machines effectively. By abstracting the complexities of the underlying infrastructure, it offers features such as load balancing, automatic scaling, and storage orchestration. With its widespread adoption, Kubernetes has emerged as the de facto standard for container orchestration, empowering the development of resilient and scalable cloud-native solutions.

**Docker for Kubernetes**: Docker is a platform that helps automate the deployment of applications using containers. In Kubernetes, Docker is used as the container runtime. It allows applications to be packaged as Docker images, which are portable and self-contained. Kubernetes utilizes Docker to manage and run these containers on a cluster, making it easier to scale and deploy applications efficiently. Together, Docker and Kubernetes provide developers with the ability to build, package, and manage applications in a containerized environment.

**Helm Chart**: Helm emerges as a convenient package manager designed specifically for Kubernetes, streamlining the process of deploying and managing applications. With Helm, applications can be packaged into Helm Charts, which consist of multiple files that configure and encapsulate Kubernetes resources. This packaging approach enables effortless 
nstallation and consistent management of applications, fostering repeatability and ease of use. By providing a standardized mechanism for defining, sharing, and deploying applications, Helm significantly simplifies the management of complex applications while promoting seamless collaboration among teams.

Chapter 2 will detail information about the O-RAN Alliance and the ecosystem. Apart from that, the O-RAN architecture [Figure 1] will be presented, along with complete information on every component of O-RAN.

In Chapter 3, possible solutions with an environment for the deployment of virtual infrastructure able to deploy O-RAN RIC components are discussed—moreover, a detailed description of prerequisite installation steps with necessary commands and example output.

Next, Chapter 4 will describe the steps to connect RIC components and create a service between them. In addition, in the result section, there is a Wireshark capture and analysis of packets.

# 2 O-RAN Alliance and O-RAN Ecosystem
**2.1 O-RAN Alliance Overview**

The O-RAN Alliance was established with the primary objective of advancing openness and intelligence within the Radio Access Network (RAN) industry. Since its inception, the alliance has garnered significant momentum, attracting over 200 members, including major mobile operators, network equipment vendors, and system integrators.

A key focus of the O-RAN Alliance is the development of open interface specifications that facilitate multi-vendor interoperability and enable the deployment of virtualized RAN solutions. These open interfaces empower network operators to select and integrate components from different vendors, fostering competition and avoiding vendor lock-in. To ensure compliance with the alliance’s specifications and promote interoperability, the organization offers testing and certification services. This ensures that RAN components from various vendors can seamlessly work together, reducing the risk of vendor lock-in and providing network operators with the flexibility to choose the most suitable components for their specific requirements.

In addition, the O-RAN Alliance has created a range of use cases that exemplify the benefits of an open RAN architecture. These use cases span diverse scenarios and exemplify how an open and interoperable RAN can enhance coverage, offer flexible deployment options, and deliver improved performance.

The O-RAN Alliance seeks to create a more open and intelligent RAN by:

1. **Open RAN architecture:** The O-RAN Alliance promotes an open RAN architecture that enables network operators to select best-of-breed components from different vendors. This approach allows network operators to avoid vendor lock-in and promotes competition in the industry.
2. **O-RAN specifications:** The Alliance develops and maintains a set of specifications that define the interfaces between different RAN components. These specifications are designed to be open and interoperable, allowing network operators to mix and match components from different vendors.
  
3. **O-RAN testing and certification:** The Alliance provides testing and certification services to ensure that RAN components from different vendors are interoperable and compliant with the Alliance’s specifications. This helps reduce vendor lock-in risk and enables network operators to choose the best components for their specific needs.

4. **O-RAN use cases:** The Alliance has developed several use cases that demonstrate the benefits of an open RAN architecture. These use cases cover a range of scenarios, from rural coverage to indoor deployments, and showcase the advantages of open and interoperable RAN components.

5. **O-RAN market momentum:** The O-RAN Alliance has gained significant momentum recently, with many major mobile network operators and equipment vendors joining the organization. The Alliance’s focus on open and interoperable RAN components has struck a chord with many industry stakeholders seeking more choice and flexibility.

Overall, the O-RAN Alliance is crucial in driving innovation and competition in the RAN industry. Its focus on openness and interoperability is helping to create a more diverse and vibrant market. At the same time, its testing and certification services ensure that RAN components from different vendors work together seamlessly.

**2.2 Release Specifications**
The O-RAN Alliance has released several specifications and technical reports since its inception. These releases are designed to promote interoperability and support the development of open and intelligent RAN solutions.

Here are some of the key releases from the o-ran Alliance:
1. **O-RAN Architecture:** In this release, we aim to give you an in-depth understanding of the O-RAN architecture. We outline the key components and interfaces that constitute this system. The architecture is purposefully designed to offer flexibility and scalability, enabling it to adapt to various deployment scenarios. Whether it’s a small-scale or large-scale
implementation, the O-RAN architecture is built to accommodate diverse needs and ensure seamless scalability.

2. **O-RAN Use Cases:** The O-RAN Alliance has developed several use  cases demonstrating the benefits of an open and interoperable RAN. These use cases cover a range of scenarios, from small indoor cells to rural deployments, and highlight the flexibility and cost savings that can be achieved with an open RAN architecture.

3. **O-RAN Radio Intelligent Controller (RIC) Functional Description:** At the heart of the O-RAN architecture, the O-RAN RIC (Radio Intelligent Controller) is a central intelligence layer. It is vital for managing and orchestrating RAN (Radio access network) resources. This specification offers an extensive overview of the RIC’s functionalities and interfaces, providing a comprehensive understanding of its capabilities and how it interacts within the O-RAN ecosystem.

4. **O-RAN Testing and Integration:** The O-RAN Alliance provides testing and integration services to ensure that RAN components from different vendors are interoperable and compliant with the Alliance’s specifications. This release provides an overview of the testing and certification process and information on the testing tools and environments used.

5. **O-RAN Software Community:** The O-RAN Alliance has established a software community to promote the development of open-source software for the RAN industry. The community is focused on developing software that supports the Alliance’s specifications and promotes interoperability between different vendors.

These updates demonstrate the O-RAN Alliance’s strong commitment to openness and interoperability in the RAN industry. The Alliance provides precise specifications and guidelines to create a more diverse and competitive market. This, in turn, benefits both network operators and end-users by offering more choices and improving performance in the industry.

**2.3 O-RAN Software Community**
The O-RAN Alliance has started a cooperative project called the O-RAN Software Community to promote the creation of open-source software for the RAN sector. The community is designed to bring together developers, vendors, and network operators to work on software projects that support the O-RAN Alliance’s specifications and promote interoperability between different RAN components.

The community’s primary focus is on developing software for the O-RAN Intelligent Controller (RIC), which is a key component of the O-RAN architecture. The RIC provides a centralized intelligence layer that can be used to manage and orchestrate RAN resources, and the community is working on developing software that supports the RIC’s functionality and interfaces.

 In addition to the RIC, the community is also working on other software projects that support the O-RAN Alliance’s specifications. These include projects related to network management, performance monitoring, testing, and integration. One of the key benefits of the O-RAN Software Community is that it provides a collaborative environment for developers to work on 
 oftware projects that are aligned with the O-RAN Alliance’s goals. By working together, developers can share knowledge and resources and ensure that their software is compatible with other components of the RAN ecosystem. 
 
Overall, the O-RAN Software Community is a key initiative that is helping to drive innovation and openness in the RAN industry. By promoting the devel-opment of open-source software, the community is helping to create a more diverse and competitive market, which ultimately benefits network operators and end-users alike. Developing software that supports the RIC’s functionality and interfaces.

**2.4 Architectural Release**

Accordingly, the O-RAN architecture [Figure 1] contains several components that are developed by O-RAN Alliance software community.

There are eight releases with release dates:

1. A Release (Amber) November 2019
2. B Release (Bronze) Jun 2020
3. C Release (Cherry) December 2020
4. D Release (Dawn) July 2021
5. E Release (Emerald) December 2021
6. F Release July 2022
7. G Release December 2022
8. H Release Upcoming
Table 1: O-RAN Alliance Releases

2.4.1 **Release Notes**
This research focused on G-Release, which has specific release notes. The release notes are below:

• RAN Intelligent Controller Applications (RICAPP) features.
• Near Real-time RAN Intelligent Controller (RIC) features.
• Non-Real time RAN Intelligent Controller (NONRTRIC) features.
• Operations and Maintenance (OAM) features.
• O-RAN Central Unit (OCU) features.
• O-RAN Distributed Unit High Layers (ODU-HIGH) features.
• Infrastructure (INF) features.
• Integration and Testing (INT) features.
• Service Management and Orchestration (SMO) features.

**2.5 Architecture of O-RAN**
The Open RAN logical architecture provides versatility, adapting to diverse network needs. With standardized interfaces, RAN components from different vendors can seamlessly communicate and work together. The division into radio and non-radio domains enables effective management of both physical and control aspects of the RAN system. This architecture empowers network operators to have greater flexibility in deploying and optimizing their RAN infrastructure. By promoting interoperability and modularity, the Open RAN architecture drives innovation and competition in the RAN industry.

The architecture [Figure 1] is thoughtfully divided into two main domains to facilitate efficient management and control. The radio domain encompasses the base station and associated equipment responsible for wireless signal transmission and reception. The non-radio domain focuses on management and orchestration functions, providing the necessary intelligence to oversee and optimize RAN resources effectively.

![Logical Architecture of Open RAN](asset/arch.PNG).

       Figure 1: Logical Architecture of Open RAN.

**2.5.1 Service Management and Orchestration (SMO)**
Service Management and Orchestration (SMO) is a functional area in the ORAN architecture [figure 1] that is responsible for managing and orchestrating services and applications across the RAN network. The SMO layer is designed to work in conjunction with other functional areas, such as the Management and Orchestration (MANO) layer and the Network Slicing Function (NSF) layer, to ensure that services and applications are deployed and managed effectively.

The Service Management and Orchestration (SMO) layer within the O-RAN architecture plays a crucial role in enabling the non-RT RIC to access specific functionalities related to RAN optimization actions, such as collecting Performance Measurements (PM) through O1 and O2 interfaces. However, SMO also has a much broader mandate, including the orchestration of the Network Functions Virtualization Infrastructure (NFVI) and managing the lifecycle of ORAN network elements, which can be either Virtual Network Functions (VNFs) hosted in specific locations of the O-Cloud infrastructure or Physical Network Functions (PNFs) exposed by cell sites.

For non-virtualized parts, such as O-RU functionalities that are related to area coverage and must be placed at cell sites, the SMO supports the deployment of physical network elements on dedicated physical resources with management through the O1 interface. However, for virtualized network elements, the SMO has the capability to interact with the O-Cloud to perform network element lifecycle management. For example, it can instantiate the virtualized network element on the target infrastructure through the O2 interface or indicate the selected geo-location for each VNF to be instantiated.

To ensure smooth communication between the deployed network elements, the SMO is also responsible for IP addressing, network reconfiguration, and system updates. To support a range of deployment solutions, the Operation and Maintenance architecture defined by O-RAN describes in detail the requirements necessary for the SMO framework to be provided by third-party Network Management Systems (NMS) or orchestration platforms, such as the Linux Foundation’s Open Network Automation Platform (ONAP).

Overall, the Service Management and Orchestration framework is a critical component of the O-RAN architecture, providing a standardized interface and protocols for managing and orchestrating services and applications across the RAN network. With its ability to interact with both virtualized and physical network elements, the SMO enables greater 
 nteroperability, flexibility, and efficiency, ultimately benefiting both network operators and end-users.

**2.5.2 near-real time RAN Intelligent Controller (near-RT RIC)**
In the O-RAN architecture [figure 1], the near-RT RIC, or near-real-time RAN Intelligent Controller, serves as a crucial function for enabling real-time control and optimization of O-RAN resources via fine-grained data collection and actions through the E2 interface. 

Figure 2 shows the logical architecture and interfaces of the near-RT RIC. The near-RT RIC is connected to the non-RT RIC through the A1 interface. A1 interface work for policy-based guidance.

Now the E2 is a logical interface that connects the near-RT RIC with an E2 node. The O-CU-CP, O-CU-UP, O-DU, and O-eNB are connected with the near-RT RIC. Only one E2 node will be connected with near-RT RIC, and multiple E2 nodes will be connected with E2 nodes, i.e., multiple O-CU, O-DU, and O-eNBs. The F1 and E1 are logical 3GPP interfaces.

![O-RAN architecture overview showing Near-RT RIC interfaces:](asset/arch2.PNG).

          Figure 2: O-RAN architecture overview showing Near-RT RIC interfaces
          
Additionally, the Near-RT RIC serves as a host for multiple xApps that collect real-time information and provide extra services using the E2 interface. It can receive policies and obtain data enrichment information through the A1 interface. The E2 interface protocols are based on control plane protocols. In the event of an E2 or Near-RT RIC failure, the E2 Node can still offer services, but certain value-added services exclusive to the Near-RT RIC may experience an outage.

• Near-RT RIC Requirements: The Near-RT RIC architecture is expected
to meet the following set of requirements:

– Each E2 node configured to directly supply RIC services to the Near-RT RIC must be uniquely identified via the dedicated E2 connection that the Near-RT RIC uses.

– A fact Several E2 nodes that each support a different RAT type may be able to establish E2 connections with near-RT RIC.

– The Near-RT RIC is in charge of requesting from the E2 Nodes a list of the functions that provide RIC services and their related E2 service models.

– The Near-RT RIC hosts a set of applications known as xApps. Each xApp can target specific RAN functions within a specific E2 node.

– The Near-RT RIC, like other network elements, should provide an O1 interface to the Service Management Orchestration layer. This interface makes element administration and onfiguration easier.

– The Near-RT RIC should provide an A1 interface to the Non-RT RIC, allowing for the exchange of policies that can affect the behavior of the Near-RT RIC and its hosted xApps, influencing the behavior of E2 Nodes.

– In the event of an E2 interface or Near-RT RIC failure, the E2 nodes ought to be able to function without the Near-RT RIC.

– The 10 ms to 1 s latency requirements for near-real-time optimization should be met by the Near-RT RIC.

• Near-RT RIC functions: Following functions are supported by near-
RT RIC:

– Termination of the A1 interface: First, terminate the interface from a non-RT RIC. After that, forward the A1 messages.

– Termination of the O1 interface: In order to send management messages to the Near-RT RIC management function, the O1 interface from the Service Management Orchestration layer terminates at the Near-RT RIC.

– Termination of E2 interface: The Near-RT RIC terminates the E2 interface from an E2 Node, directing xApp-related messages to the intended xApp and non xApp-related messages to the E2 Manager.

– xApps host: The Near-RT RIC enables the execution of RRM control functionalities within its domain and enforces them in the E2 Nodes through the E2 interface. It also initiates xApp-related transactions over the E2 interface and handles the corresponding responses received from the E2 interface.

**2.5.3 non-real time RAN Intelligent Controller (non-RT-RIC))**
The non-RT RIC, or non-real-time RAN Intelligent Controller, is responsible for non-real-time control and optimization of RAN resources, including AI/ML workflows such as model training and updates and policy-based guidance of applications/features in the near-RT RIC. [Figure 3] demonstrating the interface and services of non-real time RIC.

![Non-RT RIC reference Architecture](asset/arch3.PNG)

        Figure 3: Non-RT RIC reference Architecture
        
**R1 Services:**
R1 services refer to a collection of services provided by logical functions within the Non-RT RIC framework or SMO (Service Management and Orchestration) framework, as well as by rApps (RIC applications).

These services are designed to enable various functions such as service registration, service discovery, service notification, authorization, authentication, communication support, and potentially bootstrap and heartbeat services. 

The R1 services are essential for managing and exposing functionalities within the Non-RT RIC framework, or rApps.

**R1 Service Management and Exposure:**
R1 service management and exposure functions are responsible for facilitating the usage and access of R1 services.

These functions handle tasks such as registering R1 services, discovering available services, notifying relevant parties about service updates, and providing authorization and authentication mechanisms for secure access to the services.

Additionally, communication support is provided to enable the exchange of messages between the Non-RT RIC framework, rApps, and the R1 services.

**R1 Termination and R1 Interface:**
The R1 termination represents the endpoint or interface through which the Non-RT RIC framework and rApps communicate with the R1 services.

The R1 interface acts as the means for exchanging messages and accessing the R1 services. 

It enables the Non-RT RIC framework and rApps to interact with the R1 services, leveraging the functionalities provided by the R1 service management and exposure functions.

**Service management and exposure services:**
Service management and exposure services within the Non-RT RIC (Non-Real- Time RAN Intelligent Controller) framework or SMO (Service Management and Orchestration) framework encompass essential functionalities for handling services. These services include registration, discovery, notification, and secure access.

**Service Registration:** It involves making services available within the framework, or SMO environment. The framework or related apps register the services they offer, making it possible for other entities to find and use them.

**Service Discovery:** This feature enables entities within the framework or SMO environment to find and identify available services. By querying a registry or directory, entities can locate the specific services they require for their operations or interactions.

**Service Notification:** When changes or updates occur to registered services, relevant parties are informed through notifications. This ensures that entities stay informed about modifications, such as updates or terminations, to the services they rely on. 

Service management and exposure services play a critical role in the Non-RT RIC framework or SMO  ramework, ensuring efficient operation, coordination, and secure access to services. By providing registration, discovery, notification, authorization, and communication support, these services enable seamless utilization of services within the framework or SMO environment.

**A1 policy related services:**
A1 policy-related services are services that pertain to the management, enforcement, and administration of policies within a system or framework. These services are responsible for defining, configuring, and enforcing policies to guide the behavior, actions, and access rights of entities within the system. Here are key aspects of A1 policy-related services:

**Policy Definition and Configuration:** These services allow the definition and configuration of policies that govern various aspects of the system, such as security, access control, resource allocation, or behavior guidelines. Policies are typically defined using policy languages or rule-based systems, specifying conditions and actions to be enforced.

**Policy Evaluation and Enforcement:** A1 policy-related services evaluate and enforce policies in real-time or as needed. They assess the current state of the system, including the actions of entities and the context, and compare it against the defined policies. 

If a policy violation is detected, appropriate actions are taken to enforce compliance or trigger mitigation procedures.

**Policy Monitoring and Reporting:** These services provide monitoring capabilities to track policy compliance and system behavior. They generate reports and alerts regarding policy 
 iolations, exceptions, or patterns of non-compliance, enabling system administrators to
take appropriate actions.

**Policy Adaptation and Learning:** A1 policy-related services may incorporate adaptive or learning capabilities to dynamically adjust policies based on evolving system conditions or changing requirements.

They can analyze system behavior, gather feedback, and modify policies accordingly to optimize system performance or adapt to new circumstances.

**Policy Interoperability and Integration:** A1 policy-related services facilitate the integration and interoperability of policies across different components or systems within an ecosystem. They enable policy exchange, translation, or synchronization mechanisms to ensure consistent policy enforcement and coordination across the system.

A1 policy-related services play a crucial role in managing and enforcing policies within a system, ensuring compliance, security, and appropriate behavior. They provide the necessary mechanisms to define, evaluate, adapt, and monitor policies, promoting system stability, consistency, and governance.

**2.5.4 O-RAN Central Unit (O-CU)**
The O-RAN Central Unit, or O-CU, is a logical node that houses the RRC, SDAP, and PDCP protocols. Specifically, the O-CU-CP hosts the RRC and control plane parts of the PDCP protocol, while the O-CU-UP hosts the user plane parts of the PDCP protocol and the SDAP protocol.

**2.5.5 O-RAN Distributed Unit (O-DU)**
The O-RAN Distributed Unit, or O-DU, is a logical node that houses the RLC, AC, and High-PHY layers based on a lower layer functional split.

**2.5.6 O-RAN Radio Unit (O-RU)**
The O-RAN Radio Unit, or O-RU, is a logical node that houses the low-PHY layer and RF processing based on a lower-layer functional split. This is like 3GPP’s ”TRP” or ”RRH,” but is more specific in including the Low-PHY layer, such as FFT/IFFT and PRACH extraction.

**2.5.7 O1 Interface**
O1 is an interface that facilitates communication between management entities in the Service Management and Orchestration Framework and O-RAN managed elements. Its primary purpose is to enable the operation and management of these elements by supporting functions such as FCAPS management, software management, and file management. The O1 interface provides a standardized and secure means of accessing and controlling O-RAN network elements, ensuring efficient and effective management of these critical components.

**2.6 RAN Intelligent Controller**
RAN Intelligent Controller (RIC) [Figure 4] is a logical function that provides near-real-time control and optimization of Radio Access Network (RAN) resources through fine-grained data collection and actions over the E2 interface. RIC architecture is based on the principles of Open RAN and is designed to be flexible, scalable, and vendor neutral.

The RIC comprises two main elements: the near-RT RIC and the non-RT RIC. The near-RT RIC provides near-real-time control and optimization of RAN elements and resources, such as radio resource allocation, traffic steering, and interference management. On the other hand, the non-RT RIC enables nonreal- time control and optimization of RAN elements and resources, including AI/ML workflows for model training and updates and policy-based guidance of applications/features in near-RT RIC.

![RAN Intelligent Controller Architecture](asset/arch4.PNG)
Figure 4: RAN Intelligent Controller Architecture

The RIC architecture also includes other key elements such as O-CU, O-CUCP, O-CU-UP, O-DU, and O-RU. O-CU is the central unit in the RAN that hosts RRC, SDAP, and PDCP protocols. O-CU-CP is the control plane part of the PDCP protocol, while O-CU-UP hosts the user plane part of the PDCP protocol and the SDAP protocol. O-DU hosts RLC, MAC, and high-PHY layers based on a lower-layer functional split, while O-RU hosts low-PHY layers and RF processing based on a lower-layer functional split.

RIC architecture also includes an O1 interface between management entities in the Service Management and Orchestration Framework and O-RAN managed elements. The O1 interface is used for operation and management, through which FCAPS management, software management, file management, and other operations are achieved.

**3 RIC Environment Set-up and Deployment**
**3.1 Infrastructure Preparation and Deployment of near- RT RIC.**

Hardware Requirements:
Operating System Ubuntu 20.04
-Core 8 vCPU
-Memory 16 GB
-Disk 100 GB
-GPU 16 GB

Software Requirements:
• Container orchestration: Kubernetes- v1.16
• Container runtime: Docker and docker-compose (latest)
• Kubernetes Package manager Helm Chart v3.5
• Helm Chart Repository: ChartMuseum

**3.1.1 Prerequisites Installation and deployment of near-RT RIC.**

1. Start by preparing a fresh Ubuntu 20.04 environment specifically tailored for near-RT RIC deployment.
2. Install Kubernetes, helm, and the necessary base chart, ensuring they are properly configured for the upcoming Near-RT RIC deployment.
3. Proceed with the installation of near-RT RIC, taking care to follow the recommended guidelines and dependencies.
4. Compile and establish a seamless connection to the O-RAN E2 (e2-node) simulator sourced from the O-RAN SC simulator project.
5. Utilize the dms-cli tool to effortlessly deploy xApps, streamlining the deployment process and enhancing efficiency.
6. Compile, onboard, and install the hw-go xapp derived from the O-RAN SC xApp project, incorporating its functionality into the system with precision.


**Step (1): Prepared ubuntu 20.04 from DN.Lab with hardware specifications.**

According to the prerequisites, set up the Ubuntu server from DN.LAB (TH K¨oln). Now we can check the Ubuntu version [Figure 5] against the requirements by following the command.

```bash
lsb_release -a
```

To ensure that, Ubuntu version is right:

```bash
root@srv6 :/ home /o- ran # lsb_release -a
No LSB modules are available .
Distributor ID: Ubuntu
Description : Ubuntu 20.04.6 LTS
Release : 20.04
Codename : focal
```

**Step (2): Install Kubernetes, helm, and the necessary base chart, ensuring they are properly configured for the upcoming Near-RT RIC deployment.**

(Note: Run all command in root user.)
Sample command: sudo su

Now clone the git repository that has deployment scripts and additional
files (ric-plt/dep) with the following command.

```bash
git clone https :// gerrit .o-ran -sc. org /r/ric - plt /ric - dep
```

To deploy near-RT RIC we need to install Docker, Kubernetes, Helm, and Kubernetes-CNI.

To install Kubernetes, run the following command in the right directory:

```bash
cd ric - dep / bin
./ install \ _k8s \ _and \ _helm .sh
```

Note: It will take time, and once it’s done, check if Kubernetes is installed or not with the following command. It will show whether Kubernetes system pods are running or not.

```bash
Kubectl get pods -n kube - system
```
Output:

```bash
root@srv :/ home /o- ran # kubectl get pods -n kube - system
NAME READY STATUS RESTARTS AGE
coredns -5644 d7b6d9 -58 xml 1/1 Running 2 12d
coredns -5644 d7b6d9 - d446p 1/1 Running 2 12d
etcd - srv6 .5g.dn.th. koeln .de 1/1 Running 2 12d
kube - apiserver - srv6 .5g.dn.th ... 1/1 Running 2 12d
kube - flannel -ds - rr56g 1/1 Running 2 12d
kube -proxy - dgxvm 1/1 Running 2 12d
kube - scheduler - srv6 .5g.dn.th .... 1/1 Running 2 12d
```

This is the output of the Kubectl get pods -n kube-system command. Here, all necessary pods are running, which is mandatory for Kubernetes installation. Now Kubernetes is installed properly.

Note: Make sure curl is installed. If not, then run this command to install curl:

```bash
apt install curl
```
To set up the new systemconfig folder, we need to create it and then include the *PROXY variables. Additionally, make sure to add the line ”EnvironmentFile=-/etc/sysconfig/docker” and include the registry-mirrors in the ExecStart.

Include the line ”EnvironmentFile=-/etc/sysconfig/docker” in the ”systemconfig” folder. This line configures the Docker environment.

Add the registry-mirrors entry in the ExecStart section. This enables the system to use mirror servers for faster Docker image downloads.

Ensure that the systemconfig folder contains all the necessary configurations, including the *PROXY variables, the ”EnvironmentFile=-/etc/sysconfig /docker” line, and registry-mirrors.
Run the commands below:

```bash
mkdir / etc / sysconfig
vi / etc / sysconfig / docker
vi / lib / systemd / system / docker . service
systemctl daemon - reload
```
Now we will install Chart Museum into Helm and add ric-common templates
with the following command.

```bash
./ install \ _common \ _templates \ _to \ _helm .sh
```

**Step (3):Proceed with the installation of near-RT RIC, taking care to follow the recommended guidelines and dependencies.**

Now Create a txt file to separate the image pull from the public image registry from the actual installation. make sure to use same versions as in ../RECIPE EXAMPLE/example recipe oran f release.yaml

Run this command:

```bash
vim versions . txt
```

Note: ’vim’ is an editor. Make sure vim is installed.
Now create a Docker container text file.From the developer images list
(below), copy them and save them as versions.txt.

```bash
versions . txt
nexus3 .o-ran -sc. org :10002/o-ran -sc/ric -plt -a1 :3.0.0
nexus3 .o-ran -sc. org :10002/o-ran -sc/ric -plt - appmgr :0.5.7
nexus3 .o-ran -sc. org :10002/o-ran -sc/ric -plt - dbaas :0.6.2
nexus3 .o-ran -sc. org :10002/o-ran -sc/ric -plt - e2mgr :6.0.1
nexus3 .o-ran -sc. org :10002/o-ran -sc/ric -plt -e2 :6.0.1
nexus3 .o-ran -sc. org :10002/o-ran -sc/ric -plt - rtmgr :0.9.4
nexus3 .o-ran -sc. org :10002/o-ran -sc/ric -plt - submgr :0.9.5
nexus3 .o-ran -sc. org :10002/o-ran -sc/ric -plt - vespamgr :0.7.5
nexus3 .o-ran -sc. org :10002/o-ran -sc/ric -plt -o1 :0.6.1
nexus3 .o-ran -sc. org :10002/o-ran -sc/ric -plt - alarmmanager
:0.5.14
nexus3 .o-ran -sc. org :10002/o-ran -sc/it -dep - init :0.0.1
docker .io/ prom / prometheus :v2 .18.1
docker .io/ kong / kubernetes - ingress - controller :0.7.0
docker .io/ kong :1.4
docker .io/ prom / alertmanager :v0 .20.0
```
So, we saved all Docker images in versions.txt file . Now Pull the docker images from nexus3.o-rano-sc.org
Run the command below.

```bash
for i in `cat versions .txt `; do echo $i; docker pull $i;
done
```
Note: It will take time. We pulled this image before creating Kubernetes pods because Kubernetes will create as following RECIPE EXAMPLE file. We pulled the actual Docker container file for near-real-time ric deployment.

After the recipes are edited and helm started, the Near Realtime RIC platform is ready to be deployed, but first update the deployment recipe as per instructions in the next section.

Now modify and deploy near-RT RIC. Now we can start the installation of near-RT RIC. Before that, we need the IP address of the particular node, and to get the IP address, run the following command.

```bash
ip a
```

Edit the recipe files ./RECIPE EXAMPLE/example recipe latest stable.yaml (which is a softlink that points to the latest release version). “example recipe latest unstable.yaml points to the latest example file that is under current development.

```bash
vim ../ RECIPE \ _EXAMPLE / example \ _recipe \ _oran \_f\ _release .
yaml
```

Deployment scripts support both helm v2 and v3. The deployment script will determine the helm version installed in cluster during the deployment. 

After updating the recipe, we can deploy the RIC with the command below. Note that we generally use the latest recipe marked stable or one from a specific release.
Run the command below:

```bash
cd ric - dep / bin
./ install -f ../ RECIPE \ _EXAMPLE / example \ _recipe \ _oran \_f\
_release . yaml
```

Note: It will take time. After installation succeeds, we can see that near the RT RIC platform, pods are actually running.
Now check the deployment status with the following command


```bash
Kubectl get pods -n ricplt
```

The output of Kubectl get pods -n ricplt command is below:

```bash
root@srv6 :/ home /o- ran # kubectl get po -n ricplt
NAME READY STATUS
deployment - ricplt - a1mediator -669 cc7 1/1 Running
4647 - t22qp
deployment - ricplt - alarmmanager -577 1/1 Running
85458 dd - p95s4
deployment - ricplt - appmgr -77986 c9c 1/1 Running
bb - l6b21
deployment - ricplt -e2mgr -5 dd878f58 1/1 Running
b- npdff
deployment - ricplt - e2term -alpha -68 1/1 Running
98 f8696d -5 smjj
deployment - ricplt -01 mediator -5 ddd6 1/1 Running
6b4d6 -5 xlv9
deployment - ricplt -rtmgr -788975975 1/1 Running
b- ghlgs
deployment - ricplt - submgr -68 fc6564 1/1 Running
88 -6 wnd6
deployment - ricplt - vespamgr -84 f7d8 1/1 Running
7dfb - rq7zx
r4 - infrastructure -kong -7995 f4679b 2/2 Running
-bs95n
r4 - infrastructure - prometheus - aler 2/2 Running
tmanager -5798 b78f48 - gkkcn
r4 - infrastructure - prometheus - serv 1/1 Running
er - c8ddcfdf5 -6 kd48
statefulset -ricplt -dbaas - server -0 1/1 Running
```

Here, near-real-time RIC pods (ricplt) are running with all of the RIC services installed properly.

Once all ricplt pods are running, we need to check whether the helm list was created or not with the following command:

```bash
helm list -A
```
Output:

```bash
root@srv6 :/ home /o- ran # helm list -A
NAME NAMESPACE REVISION STATUS CHART
r4 - a1mediator ricplt 1 deployed a1mediator
r4 - a1alarmmanager ricplt 1 deployed a1alarmm ..
r4 - appmgr ricplt 1 deployed appmgr
r4 - dbaas ricplt 1 deployed dbaas
r4 - e2mgr ricplt 1 deployed e2mgr
r4 - e2term ricplt 1 deployed e2term
r4 - infrastructure ricplt 1 deployed infrastr ..
r4 -01 mediator ricplt 1 deployed 01 mediator
r4 - rtmgr ricplt 1 deployed rtmgr
r4 - submgr ricplt 1 deployed submgr
r4 - vespamgr ricplt 1 deployed vespamgr
```

Here, all (r4) of the helm lists are deployed in the same (ricplt) nampespaces, which are for near-RT-RIC.

**Step (4): Compile and establish a seamless connection to the O-RAN E2 (e2-node) simulator sourced from the O-RAN SC simulator project.**

Now we compile and build the Connection E2 simulator. First, we clone the git repository of source code from O-RAN SC.
Run the command below:

```bash
git clone https :// gerrit .o-ran -sc. org /r/ sim /e2 - interface
```

Now we will install the prerequisites to compile and connect the E2 simulator.
Run the command below:

```bash
apt - get install cmake g++ libsctp -dev
```

Now we will modify the Dockerfile with this command to change the directory first.
Run the command below:

```bash
cd e2 - interface / e2sim
cd docker /
vi Dockerfile
```

Now go to the last line of the Dockerfile and edit the CMD part and change the IP address, which is the E2 termination of the RIC side.

”sleep 100000000”
Let’s start the compilation process of the simulator by taking the first step, which involves creating specific Debian packages that will be utilized in the subsequent Docker stage.
Run the command below:

```bash
mkdir build
cd build
cmake .. && make package && cmake .. -DDEV_PKG =1 && make
package
```

Now copy the Debian directory to create a Docker file to connect to the E2 simulator.
Run the command below:

```bash
cp *. deb ../ e2sm_examples / kpm_e2sm /
cd ../ e2sm_examples / kpm_e2sm /
```

Now build oran simulator Docker container with following command.

```bash
docker build -t oransim :0.0.999 .
docker run -d --name oransim -it oransim :0.0.999
```

Now, to run the simulator, we launch the bash terminal within the container with the following command:

```bash
docker exec -ti oransim / bin / bash
```

Now check if the simulator is running or not with the following command:

```bash
kpm \ _sim "IP" 36422
```

Note: Replace ”IP” to run the simulator. For that, run the command below.

```bash
kubectl get services -n ricplt
```

Output:

```bash
root@srv6 :/ home /o- ran # kubectl get services -n ricplt
NAME TYPE CLUSTER -IP PORT (S)
aux - entry ClusterIP 10.105.132.177 80/ TCP
,443/ TCP
r4 - infrastructur -kong - proxy NodePort 10.98.2.131
32080:32080/ TCP ,32443
r4 - infrastructure - alertman : ClusterIP 10.100.7.125 80/ TCP
r4 - infrastructure - server ClusterIP 10.105.33.31 80/ TCP
service - ricplt - a1media :- http ClusterIP 10.102.109.89 10000/
TCP
service - ricplt - a1media :- rmr ClusterIP 10.96.120.158 4561/
TCP ,4562/ TCP
service - ricplt - alarm :- http ClusterIP 10.105.220.145 8080/
TCP
service - ricplt - alarm :- rmr ClusterIP 10.107.6.137 4560/
TCP ,4561/ TCP
service - ricplt -appmgr - http ClusterIP 10.100.8.154 8080/
TCP
service - ricplt -appmgr - http ClusterIP 10.102.179.240 4561/
TCP ,4560/ TCP
service - ricplt -dbass - tcp ClusterIP None 6379/
TCP
service - ricplt -e2mgr - http ClusterIP 10.109.47.153 3800/
TCP
service - ricplt -e2mgr - rmr ClusterIP 10.108.234.78 4561/
TCP ,3801/ TCP
service - ricplt -e2term - pro .. ClusterIP 10.96.118.19 8088/
TCP
service - ricplt -e2term - rmr .. ClusterIP 10.102.139.254 4561/
TCP ,38000/ TCP
service - ricplt -e2term - sctp .. NodePort 10.102.107.2
36422:32222/ SCTP
service - ricplt - o1mediator - htt ClusterIP 10.111.228.73 9001/
TCP ,8080/ TCP ,3000/ TCP
```

Now copy the IP from output services in ricplt with the 36422 port and use it in the previous step.

```bash
Example : kpm_sim 10.102.107.2 36422
```

Once we run that command, we will see the simulator is connected to near-RT RIC.

To show that the e2 simulator is connected to the near RT RIC follow the below steps.

Copy the E2 manager IP and run the curl command with the following command:

```bash
curl -X GET http ://" IP ":3800/ v1/ nodeb / states 2>/ dev/ null |
jq
```

Now run the following command and take the correct IP:

```bash
kubectl get services -n ricplt
```

Output:

```bash
root@srv6 :/ home /o- ran # kubectl get services -n ricplt
NAME TYPE CLUSTER -IP PORT (S)
aux - entry ClusterIP 10.105.132.177 80/ TCP
,443/ TCP
r4 - infrastructur -kong - proxy NodePort 10.98.2.131
32080:32080/ TCP ,32443
r4 - infrastructure - alertman : ClusterIP 10.100.7.125 80/ TCP
r4 - infrastructure - server ClusterIP 10.105.33.31 80/ TCP
service - ricplt - a1media :- http ClusterIP 10.102.109.89 10000/
TCP
service - ricplt - a1media :- rmr ClusterIP 10.96.120.158 4561/
TCP ,4562/ TCP
service - ricplt - alarm :- http ClusterIP 10.105.220.145 8080/
TCP
service - ricplt - alarm :- rmr ClusterIP 10.107.6.137 4560/
TCP ,4561/ TCP
service - ricplt -appmgr - http ClusterIP 10.100.8.154 8080/
TCP
service - ricplt -appmgr - http ClusterIP 10.102.179.240 4561/
TCP ,4560/ TCP
service - ricplt -dbass - tcp ClusterIP None 6379/
TCP
service - ricplt -e2mgr - http ClusterIP 10.109.47.153 3800/
TCP
service - ricplt -e2mgr - rmr ClusterIP 10.108.234.78 4561/
TCP ,3801/ TCP
service - ricplt -e2term - pro .. ClusterIP 10.96.118.19 8088/
TCP
service - ricplt -e2term - rmr .. ClusterIP 10.102.139.254 4561/
TCP ,38000/ TCP
service - ricplt -e2term - sctp .. NodePort 10.102.107.2
36422:32222/ SCTP
service - ricplt - o1mediator - htt ClusterIP 10.111.228.73 9001/
TCP ,8080/ TCP ,3000/ TCP
service - ricplt - o1mediator - tcp NodePort 10.108.87.21
830:30830/ TCP
service - ricplt -rtmgr - http ClusterIP 10.109.105.95 3800/
TCP
service - ricplt -rtmgr - rmr ClusterIP 10.105.222.135 4561/
TCP ,4560/ TCP
service - ricplt -submgr - http ClusterIP None 3800/
TCP
service - ricplt -submgr - rmr ClusterIP None 4560/
TCP ,4561/ TCP
service - ricplt - vespamgr - http ClusterIP 10.100.198.129 8080/
TCP ,9095/ TCP
```

Now, copy the E2 manager IP (service - ricplt - e2mgr - http) and Replace ”IP” with the e2 manager IP. Run this command in the ric-dep/bin directory. And we will see the E2 simulator connected to RT RIC.

```bash
Example : curl -X GET http :// 10.109.47.153:3800/ v1/ nodeb /
states 2>/ dev / null |jq
```

**Step (5): Utilize the dms-cli tool to effortlessly deploy xApps, streamlining the deployment process and enhancing efficiency.**

The DMS component plays a vital role in the RIC platform as it manages the near-real-time (NRT) data and metadata utilized by the platform, including policy and configuration data. To interact with the DMS and perform tasks like querying, updating, and deleting data and metadata, the ”dms cli” tool is commonly employed through command-line instructions.

In the context of xApp onboarding services for operators, the xApp onboarder offers a convenient cli tool named ”dms cli.” This tool takes in the xApp descriptor and optionally an additional schema file and generates xApp helm charts.

To ensure the successful deployment of any xApp, it is essential to load its corresponding Helm chart into a designated private Helm repository. This repository serves as a prerequisite for xApp deployment.

Run the command below.

```bash
docker run --rm -u 0 -it -d -p 8090:8080 -e DEBUG =1 -e STORAGE
= local -e STORAGE_LOCAL_ROOTDIR =/ charts -v $( pwd )/ charts :/
charts chartmuseum / chartmuseum : latest
```

Note: Run it in the home directory.

Set up the environment variables for a CLI connection using the same port as used above. Now export the chart repository url with the following command:

```bash
export CHART \ _REPO \ _URL = http ://0.0.0.0:8090
```

**Step(6): Utilize the dms-cli tool to effortlessly deploy xApps, streamlining the deployment process and enhancing efficiency.**

To deploy xapp we need to clone the app-manager repository with the following command:

```bash
git clone https :// gerrit .o-ran -sc. org /r/ric - plt / appmgr -b
f- release
```

Now change the xapp onboarder directory to install Python for onboarding xapp with the following command:

```bash
cd appmgr / xapp \ _orchestrater /dev / xapp \ _onboarder
```

Note: If pip3 is not installed, install pip packages for python install with the following command:

```bash
apt - get install python3 - pip
```

Note: If the dms cli binary is already installed, then uninstall it first´using following command.

```bash
pip3 uninstall xapp \ _onboarder
```

Now it’s time to install xapp onboarder. For that first install Python dependencies with the following command:

```bash
pip3 install ./
```

Now modify the permissions. The instructions are for Python 3.6, and here we will install Python 3.8 with the following commands:

```bash
ls -la / usr/ local /lib/ python3 .8
chmod -R 755 / usr / local / lib / python3 .8
```

**Step(7): Compile, onboard, and install the hw-go xapp derived from the O-RAN SC xApp project, incorporating its functionality into the system with precision.**

To compile and deploy hw-go xapp, we need source code, and for that, run clone the ric-app repository by using the following command:

```bash
git clone https :// gerrit .o-ran -sc. org /r/ric - app /hw -go
```

Build Docker templates and examples. con:80 is a tag. It could be any url. It will run in the local registry. This will be used later. Follow the below commands:

```bash
cd hw -go
docker build -t example . com :80/ hw -go :1.2 .
```

Now modify config-file.json to build a connection with xapp onboard for deployment. We are changing the registry, name, and tag in the configuration. For this, run the command below:

```bash
vim config / config - file . json
```

Note: Edit the config file in the following steps:

```bash
registry : nexus3 .o-ran -sc. org :10004 to example . com :80.
name : hw -go.
tag : 1.2
```

Now make sure the xapp descriptor config file and the schema file are on my local file system. We can do it by following the command:

```bash
dms_cli onboard ./ config / config - file . json ./ config / schema .
json
```

To Install hw-go use the following command:

```bash
dms_cli install hw -go 1.0.0 ricxapp
```

When hw-go is installed, it will make e2 subscriptions to all e2 nodes that it finds connected. Now we can see ric-xapp is running and connected with the E2 simulator.

Run this command to check if ricxapp pods are running or not.

```bash
kubectl get pods -n ricxapp
```

Summary: Now the near-RT RIC is successfully deployed with the specifications of the O-RAN software community.

**3.2 Infrastructure Preparation and Deployment of non-RT RIC.**

Hardware Requirements:
- Operating System Ubuntu 20.04
- Core 8 vCPU
- Memory 32 GB
- Disk 150 GB
- GPU 16 GB

Software Requirements:

• Container orchestration: Kubernetes- v1.19+
• Container runtime: Docker and docker-compose (latest)
• Kubernetes Package manager Helm Chart v3.5
• Helm Chart Repository: ChartMuseum

**3.2.1 Prerequisites Installation of non-RT RIC.**
To deploy non-RT RIC, it requires Kubernetes, Kubernetes CNI, Helm Chart, Chartmeusume, and Docker with non-RT RIC dependencies. The following steps will show the installation process for all of them. 
**1. Install Packages** To install the package, we need ca-certificates, and we will install it with the command below:

```bash
sudo apt - get update
sudo apt - get install -y apt - transport - https ca -
certificates curl
```

**2. Install Containerd:** We have a few container runtimes available. Before we install a container, we need to create its configuration file. We will do it with the following commands:

```bash
curl -fsSLo containerd - config . toml \ https :// gist .
githubusercontent . com / oradwell /31
ef858de3ca43addef68ff971f459c2 / raw /5099
df007eb717a11825c3890a0517892fa12dbf / containerd - config .
toml
sudo mkdir / etc / containerd
sudo mv containerd - config . toml /etc / containerd / config . toml
```

Now, without any convenience, we can install container ed from the official GitHub repo with the following commands:

```bash
curl -fsSLo containerd -1.6.14 - linux - amd64 .tar.gz\ https ://
github . com / containerd / containerd / releases / download /v1
.6.14/ containerd -1.6.14 - linux - amd64 .tar.gz
```

Note: It will pull compressed binaries, so we need to extract that, which will happen with the below command:

```bash
sudo tar Cxzvf / usr / local containerd -1.6.14 - linux - amd64 .tar .gz
```

Now it’s time to install containered as a service. Follow the command below:

```bash
sudo curl -fsSLo /etc / systemd / system / containerd . service \
https :// raw . githubusercontent . com / containerd / containerd /
main / containerd . service
sudo systemctl daemon - reload
sudo systemctl enable --now containerd
```

**3. Install runc:** To create and run containers we need to install a native feature called runc which is a low level of container runtime. Following command will install it:

```bash
curl -fsSLo runc . amd64 \
https :// github .com/ opencontainers / runc / releases / download /v1
.1.3/ runc . amd64
sudo install -m 755 runc . amd64 / usr / local / sbin / runc
```

**4. Install network plugins CNI:** We install network interface plugins from their official git repository. Following commands will install CNI:

```bash
curl -fsSLo cni - plugins -linux -amd64 -v1 .1.1. tgz \
https :// github .com/ containernetworking / plugins / releases /
download /v1 .1.1/ cni - plugins -linux -amd64 -v1 .1.1. tgz
sudo mkdir -p / opt / cni / bin
sudo tar Cxzvf / opt / cni / bin cni - plugins -linux -amd64 -v1 .1.1. tgz
```

**5.Enable IPv4 forwarding and configure iptables for bridged network traffic.**

To enable proper functionality, ensure the overlay and br netfilter kernel modules are enabled, and grant iptables the capability to inspect bridged network traffic.
Run the following command:

```bash
cat <<EOF | sudo tee / etc/ modules - load .d/k8s. conf
overlay
br_netfilter
EOF
sudo modprobe -a overlay br_netfilter
```

The required sysctl parameters must be configured for the setup, ensuring their persistence across reboots. Run the following commands:

```bash
cat <<EOF | sudo tee / etc/ sysctl .d/ k8s . conf
net . bridge .bridge -nf -call - iptables = 1
net . bridge .bridge -nf -call - ip6tables = 1
net . ipv4 . ip_forward = 1
EOF
# Apply sysctl params without reboot
sudo sysctl[U+FFFD]system
```

**6. Install Kubectl, Kubelet,Kubeadm:** Now we are ready to install kuberenetes. We need to make sure that their versions are compatible with the following commands:

```bash
# Add Kubernetes GPG key
sudo curl -fsSLo /usr / share / keyrings / kubernetes - archive -
keyring .gpg \
https :// packages . cloud . google . com /apt/ doc/apt - key . gpg
# Add Kubernetes apt repository
echo "deb [ signed -by =/ usr / share / keyrings / kubernetes -
archive - keyring .gpg ] https :// apt . kubernetes .io/ kubernetes
- xenial main " \
| sudo tee / etc / apt / sources . list .d/ kubernetes . list
# Fetch package list
sudo apt - get update
sudo apt - get install -y kubelet kubeadm kubectl
# Prevent them from being updated automatically
sudo apt - mark hold kubelet kubeadm kubectl
```

**7. Ensure swap is disabled:** In order to comply with Kubernetes’ lack of support for the swap feature, it is necessary to disable it. Run the following commands:

```bash
swapon --show
sudo swapoff -a
```

**8. Create the cluster using kubeadm:** Our non-RT RIC will work on single node clusters or multi node clusters. This research project is based
on a single-node cluster.

With just a single command, the cluster can be initialized. However, in single-node environments, it may not offer full functionality until certain modifications are made. It is important to note that we are providing the ”–pod-network-cidr” parameter, as mandated by our CNI plugin (Flannel).

Run the following commands:

```bash
sudo kubeadm init --pod - network - cidr =10.244.0.0/16
```

**9. Configure kubectl:** Configuring Kubectl is important to get access to the cluster. Run the following commands:

```bash
mkdir -p $HOME /. kube
sudo cp -i / etc/ kubernetes / admin . conf $HOME /. kube / config
sudo chown $(id -u):$(id -g) $HOME /. kube / config
```

**10. Untaint node:** To ensure pods can be deployed to our single-node cluster without any issues, it is necessary to untaint the node. Failure to do so may result in pods being stuck in a pending state. Run the commands below to avoid this issue:

```bash
kubectl taint nodes --all node - role . kubernetes .io/ master -
kubectl taint nodes --all node - role . kubernetes .io/ control -
plane -
```

Note: Sometimes it will not work. At that time, run the following command:

```bash
kubectl get nodes
kubectl taint nodes "IP" node - role . kubernetes .io/ control -
plane =: NoSchedule
```

**11. Install a CNI pligin:** To enable networking functionality, the installation of a Container Network Interface (CNI) plugin is required. In our case, we are installing flannel as the chosen plugin with the following command:

```bash
kubectl apply -f https :// raw . githubusercontent . com / coreos /
flannel / master / Documentation /kube - flannel .yml
```

**12. Install Helm:** For non-RT RIC, we need helm v3.5. We install our package by following the command:

```bash
curl https :// raw . githubusercontent . com / helm / helm / master /
scripts /get -helm -3 | bash
```

**13. Install ChartMuseum:** To run the chartmuseum we insrtalled packages with the following command:

```bash
curl https :// raw . githubusercontent . com / helm / chartmuseum /
main / scripts /get - chartmuseum | bash
```

**14. Install CSI driver:** For the storage to work, need to install the Container Storage Interface driver. Here used CSI is OpenEBS with the command below:

```bash
helm repo add openebs https :// openebs . github .io/ charts
kubectl create namespace openebs
helm -- namespace = openebs install openebs openebs / openebs
```

**15. Run Kubectl proxy:** To avoid the localhost error for a single node cluster, open a new terminal and run the following command:
################################################################################ 33 number page
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```
```bash
./ install
```

```bash
./ install
```
```bash
./ install
```
```bash
./ install
```

```bash
./ install
```
```bash
./ install
```


```bash
./ install
```

```bash
./ install
```

```bash
./ install
```



