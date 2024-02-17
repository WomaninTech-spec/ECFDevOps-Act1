# ECFDevOps-Act1
1ere activite de l'ECF
Activité Type 1 : Automatisation du déploiement d’infrastructure dans le Cloud
Écrivez en code la création de : 
- Apache Spark Cluster
- Mongodb
Utilisation du fournisseur Terraforme avec aws

Pour résumer ce que j'ai fait pour l'activité 1 de l'ECF :

1- Configuration de Terraform :

# configuré Terraform en spécifiant le fournisseur AWS et sa version.
J'ai défini un bloc provider "aws" pour spécifier la région AWS à utiliser.
Création d'instances EC2 :

# défini des ressources AWS pour créer des instances EC2.
J'ai spécifié l'AMI, le type d'instance et les tags pour chaque instance.
Provisionnement des instances EC2 :

# utilisé des provisionneurs pour effectuer des tâches comme la mise à jour du système, l'installation de Python 3 et de PySpark, et l'exécution d'une application Python sur les instances EC2.
Déploiement d'un cluster EMR (Apache Spark) :

# configuré un cluster EMR avec des configurations spécifiques telles que le nom, la version, les applications, les groupes d'instances maître et esclave, etc.
Création d'un groupe de sécurité :

# défini un groupe de sécurité pour nos instances EC2 avec des règles d'entrée et de sortie spécifiques.
Déploiement d'un cluster DocumentDB (MongoDB) :

# configuré un cluster DocumentDB avec des paramètres tels que le nom, la version du moteur, les identifiants, etc.
Création d'instances DocumentDB :

# défini des ressources pour créer des instances DocumentDB dans le cluster que nous avons configuré.
Utilisation des variables :

# utilisé des variables pour les paramètres spécifiques afin de rendre notre code Terraform plus modulaire et réutilisable.
Sécurité :

# configuré des paramètres de sécurité tels que les clés SSH et les groupes de sécurité pour assurer un environnement sécurisé pour nos ressources AWS.

# Pour intégrer ces étapes dans mon projet via Visual Studio Code, j'ai simplement crée ou ouvert un répertoire de projet Terraform dans Visual Studio Code, puis copier-coller le code écrit dans des fichiers .tf. 

# Je me suis assurée d'avoir les extensions Terraform installées dans Visual Studio Code pour une meilleure prise en charge de la syntaxe et des fonctionnalités de Terraform. 

# Ensuite, utilisé les commandes Terraform à partir du terminal intégré de Visual Studio Code pour exécuter vos scripts Terraform.

2- Code de terraform.tfvars :

Le fichier terraform.tfvars que vous avez fourni contient les valeurs des variables utilisées dans votre configuration Terraform. Voici un résumé des valeurs définies dans ce fichier :

# subnet_id : L'ID du sous-réseau dans lequel les instances EC2 et les ressources EMR seront déployées.

# emr_managed_master_security_group : Le groupe de sécurité pour le nœud maître EMR.
# emr_managed_slave_security_group : Le groupe de sécurité pour les nœuds esclaves EMR.
# key_name : Le nom de la clé SSH utilisée pour accéder aux instances EC2.
# service_role : Le rôle IAM utilisé par EMR pour accéder à d'autres services AWS.
# autoscaling_role : Le rôle IAM utilisé par EMR pour effectuer le dimensionnement automatique.
# instance_profile : Le profil IAM associé aux instances EC2 pour accéder aux autres services AWS.
# cluster_name : Le nom du cluster EMR.
# release_label : La version de distribution EMR à utiliser.
# applications : Les applications à installer sur le cluster EMR (dans ce cas, Spark).
# core_instance_count : Le nombre d'instances principales dans le cluster EMR.
# core_instance_type : Le type d'instance pour les instances principales du cluster EMR.
# master_instance_type : Le type d'instance pour le nœud maître du cluster EMR.
# master_instance_count : Le nombre d'instances maîtres dans le cluster EMR.
# cluster_identifier : L'identifiant du cluster DocumentDB (MongoDB).
# master_username : Le nom d'utilisateur pour le cluster DocumentDB.
# master_password : Le mot de passe pour le cluster DocumentDB.
# engine_version : La version du moteur pour le cluster DocumentDB.
# instance_count : Le nombre d'instances DocumentDB à créer.
# instance_class : La classe d'instance pour les instances DocumentDB.

Ces valeurs seront utilisées par Terraform lors du déploiement de mes ressources AWS. 
Les valeurs correspondent à ma configuration et à mes besoins spécifiques.

# variables.tf : Le fichier variables.tf contient les définitions des variables utilisées dans votre configuration Terraform. Voici un résumé de chaque variable définie dans ce fichier :

1- region : La région AWS dans laquelle vous souhaitez déployer vos ressources.
2- subnet_id : L'ID du sous-réseau où le cluster EMR sera déployé.
3- emr_managed_master_security_group : L'ID du groupe de sécurité pour le nœud maître EMR.
4- emr_managed_slave_security_group : L'ID du groupe de sécurité pour les nœuds esclaves EMR.
5- master_instance_type : Le type d'instance EC2 pour le nœud maître EMR.
6- master_instance_count : Le nombre d'instances maîtres dans le cluster EMR.
7- core_instance_type : Le type d'instance EC2 pour les nœuds principaux du cluster EMR.
8- core_instance_count : Le nombre d'instances principales dans le cluster EMR.
9- key_name : Le nom de la paire de clés EC2 utilisée pour l'accès SSH aux instances EMR.
10- service_role : Le rôle IAM pour le service EMR.
11- autoscaling_role : Le rôle IAM pour le dimensionnement automatique EMR.
12- instance_profile : Le profil IAM pour les instances EC2 EMR.
13- cluster_name : Le nom du cluster EMR.
14- release_label : L'étiquette de version pour le logiciel EMR.
15- applications : La liste des applications à installer sur le cluster EMR.
16- cluster_identifier : L'identifiant du cluster DocumentDB (MongoDB).
17- engine_version : La version du moteur pour le cluster DocumentDB.
18- master_username : Le nom d'utilisateur principal pour le cluster DocumentDB.
19- master_password : Le mot de passe principal pour le cluster DocumentDB.
20- instance_count : Le nombre d'instances DocumentDB dans le cluster.
21- instance_class : La classe d'instance à utiliser pour les instances DocumentDB.
# Ces variables permettent de paramétrer et de personnaliser votre configuration Terraform en fonction de vos besoins spécifiques. 
# Jai ajusté les valeurs de ces variables dans le fichier terraform.tfvars pour chaque environnement ou projet.
