# Deploy a High-Availability Web App Using CloudFormation  

In this project, you’ll deploy web servers for a highly available web app using CloudFormation. You will write the code that creates and deploys the infrastructure and application for an Instagram-like app from the ground up. You will begin with deploying the networking components, followed by servers, security roles and software. The procedure you follow here will become part of your portfolio of cloud projects. You’ll do it exactly as it’s done on the job - following best practices and scripting as much as possible.  

## Problem  
Your company is creating an Instagram clone called Udagram. Developers pushed the latest version of their code in a zip file located in a public S3 Bucket.  

You have been tasked with deploying the application, along with the necessary supporting software into its matching infrastructure.  

This needs to be done in an automated fashion so that the infrastructure can be discarded as soon as the testing team finishes their tests and gathers their results.  

There will be two parts to this project:  
* You'll first develop a diagram that you can present as part of your portfolio and as a visual aid to understand the CloudFormation script.  
* The second part is to interpret the instructions as well as your own diagram and create a matching CloudFormation script.  

## Project Requirements

### Server specs

You'll need to create a **Launch Configuration** for your application servers in order to deploy four servers, two located in each of your private subnets. The launch configuration will be used by an auto-scaling group.  

You'll need two vCPUs and at least 4GB of RAM. The Operating System to be used is Ubuntu 18. So, choose an Instance size and Machine Image (AMI) that best fits this spec. Be sure to allocate at least 10GB of disk space so that you don't run into issues.  

### Security Groups and Roles

Since you will be downloading the application archive from an **S3 Bucket**, you'll need to create an **IAM Role** that allows your instances to use the S3 Service.  

Udagram communicates on the default `HTTP Port: 80`, so your servers will need this inbound port open since you will use it with the **Load Balancer** and the **Load Balancer Health Check**. As for outbound, the servers will need unrestricted internet access to be able to download and update its software.  

The load balancer should allow all public traffic `(0.0.0.0/0)` on `port 80` inbound, which is the default `HTTP port`. Outbound, it will only be using `port 80` to reach the internal servers.  

The application needs to be deployed into private subnets with a **Load Balancer** located in a public subnet.  

One of the output exports of the **CloudFormation** script should be the public URL of the **LoadBalancer**.  

Bonus points if you add `http://` in front of the load balancer DNS Name in the output, for convenience.


## Other Considerations

You can deploy your servers with an **SSH Key** into Public subnets while you are creating the script. This helps with troubleshooting. Once done, move them to your private subnets and remove the **SSH Key** from your **Launch Configuration**.

It also helps to test directly, without the load balancer. Once you are confident that your server is behaving correctly, increase the instance count and add the load balancer to your script.

While your instances are in public subnets, you'll also need the `SSH port open (port 22)` for your access, in case you need to troubleshoot your instances.

Log information for UserData scripts is located in this file: `cloud-init-output.log` under the folder: `/var/log`.

You should be able to destroy the entire infrastructure and build it back up without any manual steps required, other than running the **CloudFormation** script.

The provided UserData script should help you install all the required dependencies. Bear in mind that this process takes several minutes to complete. Also, the application takes a few seconds to load. This information is crucial for the settings of your load balancer health check.

It's up to you to decide which values should be parameters and which you will hard-code in your script.

If you want to go the extra mile, set up a bastion host to allow you to SSH into your private subnet servers. This bastion host would be on a Public Subnet with `port 22` open only to your home `IP address`, and it would need to have the private key that you use to access the other servers.

## Solutions  

Infrastructure diagram of the web app on AWS:
<img src="./images/AWS Diagram.jpeg">  

The screenshot of the web app running successfully:  
<img src="./images/Screenshot.jpg">  

**Files**:
1. `network.yml`:  YAML file for creating the networking infrastructure using **CloudFormation**.  
2. `servers.yml`: YAML file for creating servers and security groups using **CloudFormation**.  
3. `network-parameters.json`: Parameters of networking infrastructure.  
4. `server-parameters.json`: Parameters of servers and security groups.  
5. `create.sh`: Script to create the networking components and security groups.    
6. `update.sh`: Script to update the networking components and security groups.  
