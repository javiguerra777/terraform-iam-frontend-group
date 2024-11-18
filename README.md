# Terraform IAM Group Project

This project uses Terraform to create an IAM Group for Front End Developers and IAM user to join this group.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account with appropriate permissions
- AWS CLI configured with your credentials

## Project Structure
```
├── .gitignore
├── .terraform/ 
├── .terraform.lock.hcl 
├── iam_user_group.tf 
├── iam_user.tf 
├── provider.tf 
├── README.md 
├── terraform.tfstate 
├── terraform.tfstate.backup 
├── variables.tf
```

## Files
- `iam_user_group.tf`: Defines the IAM group and permissions to be created on AWS.
- `iam_user.tf`: Defines the IAM user to be added to the group.
- `provider.tf`: Configures the AWS provider.
- `variables.tf`: Contains the variables used in the project.
- `.gitignore`: Specifies files and directories to be ignored by Git.
- `README.md`: Project documentation.

## Getting Started

1. Clone the repository:
    ```sh
    git clone https://github.com/javiguerra777/terraform-iam-frontend-group.git
    ```

2. After cloning the repository to your computer you will see a folder called `terraform-iam-frontend-group`, open this folder in a code editor of choice. 

3.  **Create a `variables.tf` file:**
    You will need to create a `variables.tf` file and structure it like this before you run the terraform project:
    ```hcl
    variable "aws_access_key" {
      default = "aws access key"
    }
    variable "aws_secret_key" {
      default = "aws secret key"
    }
    variable "region" {
      default = "us-west-1"
    }
    variable "group_name" {
      default = "IAM Group Name"
    }

    variable "user_name" {
      default = "IAM User name"
    }
    ```

## Usage

1. Initialize Terraform:
    ```sh
    terraform init
    ```

2. Review the plan:
    ```sh
    terraform plan
    ```

3. Apply the configuration:
    ```sh
    terraform apply
    ```

4. Confirm the apply step by typing `yes`.

5. If you go to your AWS IAM User Group and Users tables you can see the newest group and user created

## Variables

- **group_name**: The name of the IAM group.
- **user_name**: The name of the IAM user.

## Outputs

- **iam_group_name**: The name of the created IAM group.
- **iam_group_arn**: The ARN of the created IAM group.
- **iam_user_name**: The name of the created IAM user.
- **iam_user_arn**: The ARN of the created IAM user.

## Cleanup

To destroy the created resources, run:
```sh
terraform destroy
```