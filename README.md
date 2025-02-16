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

![Figure 1: Logical Architecture of Open RAN](asset/arcj.PNG)
Figure 1: Logical Architecture of Open RAN.
