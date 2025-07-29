Project Overview :
This project demonstrates how to build and deploy a multi-tier Java web application on a local environment using Vagrant. It includes both approaches:
    🔧 Manual Setup
    Configure each component (Web Server, App Server, Caching, and Database) step-by-step. This helps participants understand how different services integrate together.
    ⚙️ Automated Deployment
    Use shell scripts to automatically provision services like Tomcat, MySQL, and Nginx, allowing for a faster and more reliable setup.
Multi-VM Architecture
The Vagrantfile defines a multi-VM environment, where each virtual machine runs a specific service:
    🗄️ Database (e.g., MySQL)
    ⚡ Cache (e.g., Memcached)
    📩 Message Broker (e.g., RabbitMQ)
    🖥️ Application Server (e.g., Tomcat)
    🌐 Web Server (e.g., Nginx)
    
Provisioning scripts automate the installation and configuration of these components, simulating a real-world deployment environment on your local machine.
