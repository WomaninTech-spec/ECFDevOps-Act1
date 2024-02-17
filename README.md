
# ECFDevOps-Act1
## Table of Contents
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Construction Projet](#constructionprojet)
4. [Collaboration](#collaboration)
5. [FAQs](#faqs)


## Activité Type 1 : Automatisation du déploiement d’infrastructure dans le Cloud

### Installation Terraform

```bash
  brew tap hashicorp/tap
  brew install hashicorp/tap/terraform
```

### General Info
**Etapes** 
* 1 - init Terraform + AWS Configuration
* 2 - Configuration AMI sur AWS
* 3 - Mise en place security groupe
* 4 - Terraform fmt
* 5 - Terraform validate
* 6 - Terraform deploy

### Technologies
Configuration de Terraform 
* ✔ Prérequis : installation de Terraform en local Install Terraform
* ![Github - eks-getting-started](https://github.com/hashicorp/terraform-provider-aws/tree/main/examples/eks-getting-started)


```bash
terraform init # Initialise le dossier de travail avec les fichiers de configuration de terraform
terraform plan #  Création d'un plan d'exécution / Prévisualisation avant terraform apply
terraform apply # Création de l'infrastructure / Exécution des actions listées dans terraform plan
terraform destroy # Déstruction de toutes les ressources créées
```
- configuré Terraform en spécifiant le fournisseur AWS et sa version.
- définir un bloc provider "aws" pour spécifier la région AWS à utiliser.

#### Construction d'un projet terraform, avec les ressources suivantes :

* 1 VPC
* 2 subnets
* 1 internet gateway
* 1 route table
* 2 route table association
* 1 role iam pour le Cluster eks
* 2 policies associées (AmazonEKSClusterPolicy et AmazonEKSVPCResourceController)
* 1 groupe de sécurité pour le cluster eks
* 1 règle pour le groupe de sécurité
* 1 Cluster
* 1 role pour le node

✔ Remarque : Cette structure n'est pas parfaite mais suffit pour faire tourner notre container.

# Projet Terraform pour le Déploiement d'Infrastructures AWS

Ce projet Terraform est conçu pour déployer et gérer des infrastructures AWS, y compris des instances EC2, des clusters EMR (Apache Spark), des clusters DocumentDB (MongoDB), ainsi que les ressources associées.

## Table des Matières

- [Introduction](#introduction)
- [Configuration Terraform](#configuration-terraform)
  - [Fichier Main.tf](#fichier-maintf)
  - [Variables](#variables)
  - [Fichier terraform.tfvars](#fichier-terraformtfvars)
- [Création des Ressources AWS](#création-des-ressources-aws)
  - [Instances EC2](#instances-ec2)
  - [Cluster EMR](#cluster-emr)
  - [Cluster DocumentDB](#cluster-documentdb)
- [Utilisation des Variables](#utilisation-des-variables)
- [Sécurité](#sécurité)
- [Intégration dans Visual Studio Code](#intégration-dans-visual-studio-code)

## Introduction

Ce projet utilise Terraform pour automatiser le déploiement et la gestion des infrastructures AWS. Il permet de créer des instances EC2, des clusters EMR (Apache Spark), des clusters DocumentDB (MongoDB), et d'autres ressources AWS, tout en fournissant une flexibilité et une modularité accrues grâce à l'utilisation de variables.

## Configuration Terraform

### Fichier Main.tf

Le fichier `main.tf` contient la configuration principale de Terraform, définissant les ressources à créer, leurs paramètres et les étapes de provisionnement nécessaires.

```terraform
// main.tf
// terraform.tfvars
// variables.tf
// .gitattributes
// .gitignore
```


1.34 **InteractionsDocker**
✔ Prérequis : pour pouvoir communiquer avec notre Docker, il faut parametrer notre Dockerconfig avec une des méthodes ci-dessous :
* #1: Specify the base image.
* #2 Set the working directory usr.../JAVA HOME
* #3 Install dependencies.
* #4 Copy application files to the container.
* #5 Specify the environment variable.
* #6 Define the default command.
* #7 Create a .dockerignore file.

```bash
$ docker run -it image_name:tag_name bash
$ docker run -it ubuntu bash
# apt-get update && apt-get install -y nginx
$ docker ps
$ docker commit image_name
$ docker images
```


## Tech Stack

**Client:** Python, py-spark, Apache, Docker, terraform, Aws

**Server:** Node, Express

**OS:** Linux, Ubuntu, Mac sillicon Catalina

**Instances Aws:**  EC2, EMR, VPC, emr_managed_master_security_group


### FAQ

#### Etapes pour créer Terraform  file Main.tf

=> **configuré Terraform en spécifiant le fournisseur AWS et sa version.**
* J'ai défini un bloc provider "aws" pour spécifier la région AWS à utiliser.

#### Création d'instances EC2 : défini des ressources AWS pour créer des instances EC2 :
* J'ai spécifié l'AMI, le type d'instance et les tags pour chaque instance.

#### Provisionnement des instances EC2 :
* utilisé des provisionneurs pour effectuer des tâches comme la mise à jour du système, l'installation de Python 3 et de PySpark, et l'exécution d'une application Python sur les instances EC2.

#### Déploiement d'un cluster EMR (Apache Spark) :
* configuré un cluster EMR avec des configurations spécifiques telles que le nom, la version, les applications, les groupes d'instances maître et esclave, etc.

#### Création d'un groupe de sécurité :
* défini un groupe de sécurité pour nos instances EC2 avec des règles d'entrée et de sortie spécifiques.

#### Déploiement d'un cluster DocumentDB (MongoDB) :
* configuré un cluster DocumentDB avec des paramètres tels que le nom, la version du moteur, les identifiants, etc.

#### Création d'instances DocumentDB :
* défini des ressources pour créer des instances DocumentDB dans le cluster que nous avons configuré.

#### Utilisation des variables :
* utilisé des variables pour les paramètres spécifiques afin de rendre notre code Terraform plus modulaire et réutilisable.

#### Sécurité :
* configuré des paramètres de sécurité tels que les clés SSH et les groupes de sécurité pour assurer un environnement sécurisé pour nos ressources AWS.
* Pour intégrer ces étapes dans mon projet via Visual Studio Code, j'ai simplement crée ou ouvert un répertoire de projet Terraform dans Visual Studio Code, puis copier-coller le code écrit dans des fichiers .tf. 
* Je me suis assurée d'avoir les extensions Terraform installées dans Visual Studio Code pour une meilleure prise en charge de la syntaxe et des fonctionnalités de Terraform. 
* Ensuite, utilisé les commandes Terraform à partir du terminal intégré de Visual Studio Code pour exécuter vos scripts Terraform.

#### Code de terraform.tfvars 

Le fichier terraform.tfvars que vous avez fourni contient les valeurs des variables utilisées dans votre configuration Terraform. Voici un résumé des valeurs définies dans ce fichier :

#### - subnet_id : L'ID du sous-réseau dans lequel les instances EC2 et les ressources EMR seront déployées.

*  emr_managed_master_security_group : Le groupe de sécurité pour le nœud maître EMR.
*  emr_managed_slave_security_group : Le groupe de sécurité pour les nœuds esclaves EMR.
* key_name : Le nom de la clé SSH utilisée pour accéder aux instances EC2.
* service_role : Le rôle IAM utilisé par EMR pour accéder à d'autres services AWS.
*  autoscaling_role : Le rôle IAM utilisé par EMR pour effectuer le dimensionnement automatique.
* instance_profile : Le profil IAM associé aux instances EC2 pour accéder aux autres services AWS.
* cluster_name : Le nom du cluster EMR.
* release_label : La version de distribution EMR à utiliser.
* applications : Les applications à installer sur le cluster EMR (dans ce cas, Spark).
* core_instance_count : Le nombre d'instances principales dans le cluster EMR.
* core_instance_type : Le type d'instance pour les instances principales du cluster EMR.
* master_instance_type : Le type d'instance pour le nœud maître du cluster EMR.
* master_instance_count : Le nombre d'instances maîtres dans le cluster EMR.
* cluster_identifier : L'identifiant du cluster DocumentDB (MongoDB).
* master_username : Le nom d'utilisateur pour le cluster DocumentDB.
* master_password : Le mot de passe pour le cluster DocumentDB.
* engine_version : La version du moteur pour le cluster DocumentDB.
* instance_count : Le nombre d'instances DocumentDB à créer.
* instance_class : La classe d'instance pour les instances DocumentDB.

Ces valeurs seront utilisées par Terraform lors du déploiement de mes ressources AWS. 
Les valeurs correspondent à ma configuration et à mes besoins spécifiques.

#### variables.tf : Le fichier variables.tf contient les définitions des variables utilisées dans votre configuration Terraform. Voici un résumé de chaque variable définie dans ce fichier :

* 1- region : La région AWS dans laquelle vous souhaitez déployer vos ressources.
* 2- subnet_id : L'ID du sous-réseau où le cluster EMR sera déployé.
* 3- emr_managed_master_security_group : L'ID du groupe de sécurité pour le nœud maître EMR.
* 4- emr_managed_slave_security_group : L'ID du groupe de sécurité pour les nœuds esclaves EMR.
* 5- master_instance_type : Le type d'instance EC2 pour le nœud maître EMR.
* 6- master_instance_count : Le nombre d'instances maîtres dans le cluster EMR.
* 7- core_instance_type : Le type d'instance EC2 pour les nœuds principaux du cluster EMR.
* 8- core_instance_count : Le nombre d'instances principales dans le cluster EMR.
* 9- key_name : Le nom de la paire de clés EC2 utilisée pour l'accès SSH aux instances EMR.
* 10- service_role : Le rôle IAM pour le service EMR.
* 11- autoscaling_role : Le rôle IAM pour le dimensionnement automatique EMR.
* 12- instance_profile : Le profil IAM pour les instances EC2 EMR.
* 13- cluster_name : Le nom du cluster EMR.
* 14- release_label : L'étiquette de version pour le logiciel EMR.
* 15- applications : La liste des applications à installer sur le cluster EMR.
* 16- cluster_identifier : L'identifiant du cluster DocumentDB (MongoDB).
* 17- engine_version : La version du moteur pour le cluster DocumentDB.
* 18- master_username : Le nom d'utilisateur principal pour le cluster DocumentDB.
* 19- master_password : Le mot de passe principal pour le cluster DocumentDB.
* 20- instance_count : Le nombre d'instances DocumentDB dans le cluster.
* 21- instance_class : La classe d'instance à utiliser pour les instances DocumentDB.

#### Ces variables permettent de paramétrer et de personnaliser votre configuration Terraform en fonction de vos besoins spécifiques. 
#### Jai ajusté les valeurs de ces variables dans le fichier terraform.tfvars pour chaque environnement ou projet.
