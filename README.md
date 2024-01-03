# Terraform Beginner Bootcamp 2023


## Project Overview
The task is to build and deploy a custom **Terraform provider** onto TerraTowns, integrating it with **Amazon S3** to host a static website and **Amazon CloudFront** for content delivery.
- TerraTowns is a central hub for bootcamp students to share and connect their personal websites. These websites are hosted on their own servers and are called TerraHouse.
- **Infrastructure as Code (IaC)** is used to deploy the TerraHouse, which is like a tool that build the websites and seamlessly integrate them into the TerraTowns community.

## TerraTowns Architectural Diagram 
![terraform bootcamp](https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/4b6d09fc-7f76-403f-9313-dce81bf6d65e)

## Weekly Journals
- [Week 0 Journal](journal/week0.md)
- [Week 1 Journal](journal/week1.md)
- [Week 2 Journal](journal/week2.md)

## Extras
- [GitHub Markdown TOC Generator](https://ecotrust-canada.github.io/markdown-toc/)
<br><br>
# KEY TAKEAWAYS
- Building a Terraform provider tailored to specific infrastructure requirements and integrating it with AWS Services.
- Implementing CRUD (Create, Read, Update, Delete) operations.
- Bash scripting to automate tasks, hence improve efficiency.
- Using bash scripts has helped massively with automating lengthy steps that need repeating.
- Creating paths, so things are not hardcoded - allows for more flexibility
- Successfully troubleshooting errors and code traps.
- Applying best practices in code management, including documentation and diagramming.
- Managing GitHub workflows, which include branching, commits, pull requests, code reviews, merging, and tagging.

## GITHUB WORKFLOW

- Created **features branches** for each initialised issue on GitHub to implement changes and work on new features until done.
  <img src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/20d59973-79b9-42dc-a5fd-346da9db9d22"/>

- Used **terminal commands** to handle my GitHub repository tasks effectively:
  - ```git checkout -b new_branch_name``` to create a new branch and switch to it.
  - ```git checkout branch_name``` to check out an existing branch.
  - ```git add .``` to stage changes.
  - ```git commit -m "type_message"``` to commit changes.
  - ```git push``` to push changes to the remote repository.
  - ```git checkout main``` to check out the main branch.
  - ```git pull``` to pull the latest updates from the remote repository.
  - ```git tag tag_name``` to create a tag name.
  - ```git push --tags``` to push tags to the remote repository.

- Completed a **Pull Request** and **Merge** from the main branch to integrate new code changes, facilitate code review and ensure synchronisation with my latest main branch updates.

- Used **git tags** after merging a Pull Request into the main branch.

- Learned Semantic Versioning: **MAJOR.MINOR.PATCH**

- Used the **Git Graph** in VS Code for branch and tag visualisation.

    |  |   |
    | --- | --- |
    | <img width = "700px" src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/a6b2af9b-a25e-43a7-8b3b-02cad00c3dd5"/> | <img width = "700px" src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/979a21cb-a9dd-4333-bcb6-a276a21441ee"/> |
    | <img width = "700px" src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/9573c3a1-057e-4816-bc82-5c31a7eb9a5a"/> | <img width = "700px" src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/f2fadbcd-fee6-41c2-a8fe-fd5bcdc5ebdb"/> |

## BASH SCRIPTING

- **Automated** repetitive tasks using shell scripts.
  - Created a "bin" folder, added a file named "install_terraform_cli.sh," and pasted [HashiCorp's](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) instructions, turning it into a bash script.
  - Preceded bash scripts with ```#!/usr/bin/env bash``` instead of ```#!/bin/bash``` for increased flexibility.

- Executed bash scripting tasks using terminal commands.

  - Ran the bash script file with the command ```source ./bin/install_terraform_cli```
  - Alternatively, ran the script using ```./bin/install_terraform_cli```, ensuring the file was executable.
  - Modified Linux permissions with the **chmod** command to grant execution rights.
    For instance, the command ```chmod u+x ./bin/install_terraform_cli``` specifically allowed me, the owner (u), to execute the install_terraform_cli script.

- **Refactored Terraform CLI** with a bash script for smoother operations, efficient execution, and easier maintainence.

- **Refactored AWS CLI** into a bash script to print credentials upon workspace opening, facilitating easy monitoring of logged-in users.

- Configured AWS CLI **environmental variables** through bash scripting and implemented **global variables** to echo these settings consistently in both "terraform: bash" and "aws-cli: bash" terminals.


## TERRAFORM
- Executed Terraform commands in the terminal to interact with and manage infrastructure as code.

  - ```terraform init``` to initialise a my Terraform project.
  - ```terraform plan``` to preview chnages.
  - ```terraform apply``` to apply changes with manual approval.
  - ```terraform apply --auto-approve``` for automatic approval.
  - ```terraform destroy``` to remove resources.
  - ```terraform output``` to display all outputs.
  - ```terraform output random_bucket_name``` for a specific output.
  - ```terraform import``` to bring back missing resources into the Terraform state.

- Restructured the Root Module into separate files - `main.tf`, `providers.tf`, `variables.tf`, and `outputs.tf` - to organise my code and help with readability in my Terraform project.

## CREATED AN AMAZON S3 BUCKET (USING TERRAFORM)

- Created an **Amazon S3 bucket **using Terraform, the Terraform Provider for AWS and the random bucket name generator. The randomly generated bucket name was then output to the Terraform outputs.
- <img width = "700px" src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/46051bcb-796d-4396-8b7b-a50d7573c907"/>

## STATIC WEBSITE HOSTING (USING TERRAFORM)

- Uploaded HTML file(s) to my S3 bucket using terraform code:
  <img width = "700px" src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/d16110ba-d52d-4037-b50c-446a344ab89a"/>
  <img width = "700px" src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/915fab79-2ac3-404f-a9ec-93ea4b87a8f9"/>
  <img width = "700px" src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/4ad05fe9-f377-4e82-82cd-9c9a9fd9bb33"/>

## CONTENT DELIVERY NETWORK

- Used AWS CloudFront to serve my static website with a CDN in front of it. The CDN provides a content delivery through a distributed network.

  <img width = "600px" src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/7cedf180-7795-42f3-a358-b8c8ac12cca6"/>

- Terraform data content version: to invalidate the cache when files change.

  <img width = "600px" src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/a5509534-e307-4a55-b0b3-cc6510de7f29"/>

- Deploying my Static Website to TerraTowns

  <img width = "500px" src = "https://github.com/teeseira/terraform-beginner-bootcamp-2023/assets/72232914/8ef01b75-f262-4cfd-ad65-18c3329ac937z"/>

# ACHEIVEMENTS
- Completed a practical 4-week Terraform bootcamp focusing on practical application and AWS integration in a cloud-based project.
- Successfully managed the challenges of an overseas (Canadian-based) bootcamp, adapting to different time zone and teaching method.
- Deployed and maintaned the automation of cloud-based resources using CloudFormation and Terraform.
- Earned the Pull Shark badge from GitHub by having pull requests merged into the repository.
- Received a certificate for validating project submissions using a project validation tool.
- Improved debugging skills while navigating coding traps set by the instructor.
- Documented on a README.md file to explain my errors, methods, decisions and deviations.
