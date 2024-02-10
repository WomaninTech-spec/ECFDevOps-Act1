terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my-first-server" {
  ami = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld!"
  }
}

resource "aws_emr_cluster" "spark_cluster" {
  name = var.cluster_name
  release_label = var.release_label 
  applications  = var.applications
  
  ec2_attributes {
    subnet_id = var.subnet_id
    instance_profile = var.instance_profile
    emr_managed_master_security_group = var.emr_managed_master_security_group
    emr_managed_slave_security_group  = var.emr_managed_slave_security_group
    key_name = var.key_name
  }

  service_role     = var.service_role
  autoscaling_role = var.autoscaling_role

  master_instance_group {
    instance_type  = var.master_instance_type
    instance_count = var.master_instance_count
  }

  core_instance_group {
    instance_type  = var.core_instance_type
    instance_count = var.core_instance_count
  }
}

# activité 1 deployer un cluster Apache / spark = 2 machines mini pour la hte dispo (load balancing)
# sur aws = serverless documentDB
# conseil : spliter le main.tf pour cacher le access key
# lancer EMR
# comment lancer sur GIT
# regarder commande ctrl C pour annuler sur aws + terraform destroy
# key pairs
