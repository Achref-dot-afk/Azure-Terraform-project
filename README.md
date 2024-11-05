# Azure Development Environment Setup with Terraform and Azure DevOps

## Project Overview

This project automates the setup of a development environment on Azure using Terraform. It includes the following components:
- **Azure App Service**: For hosting the frontend and backend applications.
- **Azure Storage**: For file storage, allowing for scalable and accessible storage solutions.
- **Azure SQL Database**: For data persistence and management of relational data.
- **Virtual Networks (VNets)**: To provide secure network communication between resources.
- **Gateway**: For enabling secure communication between on-premises networks and Azure.

Additionally, Azure DevOps will be used to implement Continuous Integration and Continuous Deployment (CI/CD) for deploying a MERN (MongoDB, Express.js, React, Node.js) application alongside an ASP.NET application.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Terraform Setup](#terraform-setup)
- [Azure DevOps Pipeline](#azure-devops-pipeline)
- [Deployment Instructions](#deployment-instructions)


## Prerequisites

Before you begin, ensure you have the following:

- An Azure account with an active subscription.
- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and configured.
- An Azure DevOps organization and a project created.
