# VPROFILE - Multi-VM Vagrant Setup 🧰

This project sets up a multi-VM development environment for the **VProfile** web application using **Vagrant** and **VirtualBox**.  
Each VM represents a component of a typical modern web application stack.

---

## 🚀 Project Overview

This project demonstrates how to build and deploy a **multi-tier Java web application** locally using **Vagrant** and VirtualBox.  
It provides automated provisioning of key services across multiple virtual machines for a modular, production-like environment.

---

## 🧱 Architecture Overview

                +-----------+
                |  NGINX    | (Web Server)
                |  (web01)  |
                +-----------+
                      |
                      v
                +-----------+
                |  Tomcat   | (App Server)
                |  (app01)  |
                +-----------+
               /     |     \
              v      v      v
         +--------+ +-----------+ +-----------+
         |  MySQL | | Memcached | | RabbitMQ  |
         | (db01) | | (mc01)    | | (rmq01)   |
         +--------+ +-----------+ +-----------+

---

## 🧱 Multi-VM Architecture

The `Vagrantfile` defines a **multi-VM environment**, where each virtual machine runs a specific service:

- 🗄️ **Database** (MySQL)  
- ⚡ **Cache** (Memcached)  
- 📩 **Message Broker** (RabbitMQ)  
- 🖥️ **Application Server** (Tomcat)  
- 🌐 **Web Server** (Nginx)

Provisioning scripts automate the installation and configuration of these components.

<img width="801" height="491" alt="Vagrant drawio" src="https://github.com/user-attachments/assets/abb90a71-ebcd-441a-aa22-ec0181d04387" />

---

## ⚙️ Provisioning

This project uses **shell scripts** to automatically provision and configure each virtual machine with the required services.

### 🧩 Services Provisioned

| Service         | Role / Function                                |
|-----------------|------------------------------------------------|
| 🌐 **Nginx**     | Web Server – handles HTTP requests             |
| 🖥️ **Tomcat**    | Application Server – runs the Java web app     |
| 📩 **RabbitMQ**  | Message Broker – handles async messaging       |
| ⚡ **Memcached** | Cache – speeds up database queries             |
| 🗄️ **MySQL**     | SQL Database – stores application data         |

Each service is isolated in its own VM for modularity and scalability.

<img width="699" height="529" alt="Screenshot 2025-07-30 014104" src="https://github.com/user-attachments/assets/f87a6480-9892-498b-a9a9-8cd9f73eaa6a" />

## Project Steps

### 1. Create Shell Script (Backend VMs)

Create a ShellScript file for Database we will call provision_db.sh We will write the following in the file
<img width="1287" height="950" alt="db" src="https://github.com/user-attachments/assets/a43a8f03-c679-4ad2-b0d4-a043758f6564" />


#2 Create a ShellScript file for Memcached we will call provision_memcashed.sh We will write the following in the file
<img width="1085" height="682" alt="memcached" src="https://github.com/user-attachments/assets/d42314c6-7689-46b7-9c48-e99c018d6cbe" />



#3 Create a ShellScript file for RabbitMQ we will call provision_rabbitmq.sh We will write the following in the file

<img width="1011" height="751" alt="rabbitmq" src="https://github.com/user-attachments/assets/b7358081-81cd-463d-9dcc-61727269e5d4" />


#4 Create a ShellScript file for APP in clude ( tomcat , nginx )
# TOMCAT
<img width="1407" height="916" alt="app_1" src="https://github.com/user-attachments/assets/2c59b730-c631-4d45-a413-276132c3bc05" />
<img width="1627" height="578" alt="app_2" src="https://github.com/user-attachments/assets/3e69a016-0b31-4d04-9ec2-574f5f12a152" />


# NGINX
<img width="1158" height="887" alt="nginx" src="https://github.com/user-attachments/assets/5c69f84d-bfd7-421e-98ef-3c714813b436" />



## Final Step: Run the Project and See the Result

<img width="1003" height="529" alt="358852689-d0e29e05-a444-4c23-9757-c3f63a38e0d8" src="https://github.com/user-attachments/assets/ac9c4318-a063-4370-8207-7c82e7786789" />

## Enjoy your fully provisioned multi-VM environment! 🚀


## 🎯 Why Use Vagrant?

Vagrant offers numerous benefits for developers, DevOps engineers, and learners working with virtual environments. Here’s why it’s a great tool to include in your workflow:

- **🔧 Improve Your Technical Skills**  
  Working with Vagrant will enhance your understanding of virtual machine management and automation. You'll gain experience setting up complex environments that simulate real-world scenarios.

- **⏱️ Save Time and Effort**  
  Vagrant allows you to spin up consistent environments quickly. This eliminates hours spent debugging environment-specific issues or manually configuring development stacks.

- **✅ Reduce Errors**  
  By ensuring consistency across all machines, Vagrant minimizes problems caused by environment differences, making development and testing more reliable.

- **🧪 Develop Isolated Environments for Testing**  
  You can easily create sandbox environments to test new software or configurations without risking your primary system.

- **🤝 Share Environments Easily**  
  Vagrantfiles can be version-controlled and shared across teams. This ensures that everyone is working in an identical environment, avoiding the classic "it works on my machine" problem.

- **🚀 Increase Productivity**  
  Vagrant simplifies the process of creating and destroying environments, letting you focus more on development rather than setup.

- **🧠 Explore New Technologies**  
  Vagrant can be integrated with tools like **Ansible**, **Chef**, or **Puppet**, giving you exposure to infrastructure automation and configuration management tools.

- **💻 Better Local Development Experience**  
  With fewer environment issues, you'll stay focused on coding, not on fixing broken setups.

- **🌍 Work Remotely with Ease**  
  Vagrant environments can be moved and replicated across multiple machines, making it easier to switch devices or collaborate remotely.

---

## 🆚 Vagrant vs Terraform

| Feature               | Vagrant                                         | Terraform                                           |
|-----------------------|--------------------------------------------------|-----------------------------------------------------|
| **Purpose**           | Manages local development VMs                   | Manages cloud infrastructure (IaC)                  |
| **Scope**             | Single-machine or multi-VM setups on local hypervisors | Full-stack infrastructure in cloud providers        |
| **Provisioning Tools**| Shell, Ansible, Puppet, Chef                    | Works with Terraform's declarative HCL language     |
| **Use Case**          | Local dev/testing environments                  | Production infrastructure automation                |
| **Providers**         | VirtualBox, VMware, Hyper-V                     | AWS, Azure, GCP, DigitalOcean, etc.                 |

> 🔍 **In Summary:**  
> - **Vagrant** is ideal for setting up consistent **local** development environments.  
> - **Terraform** is designed for defining and managing **cloud infrastructure** in a declarative and scalable way.





