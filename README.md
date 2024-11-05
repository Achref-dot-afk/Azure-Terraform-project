# Azure Development Environment Setup with Terraform and Azure DevOps

## Project Overview

This project automates the setup of a development environment on Azure using Terraform. It includes the following components:
- Azure App Service for the frontend and backend applications.
- Azure Storage for file storage.
- Azure SQL Database for data persistence.
- Virtual Networks (VNets) and a Gateway for secure communication.

Additionally, Azure DevOps will be used to implement CI/CD for deploying a MERN stack application along with an ASP.NET application.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Architecture Diagram](#architecture-diagram)
- [Terraform Setup](#terraform-setup)
- [Azure DevOps Pipeline](#azure-devops-pipeline)
- [Deployment Instructions](#deployment-instructions)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before you begin, ensure you have the following:

- An Azure account with an active subscription.
- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and configured.
- An Azure DevOps organization and a project created.

## Architecture Diagram

![Architecture Diagram](link_to_your_architecture_diagram.png)

## Terraform Setup

### Directory Structure

```plaintext
terraform-azure-environment/
├── main.tf
├── variables.tf
├── outputs.tf
├── backend.tf
└── vnet.tf
