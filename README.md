# 🏗️ Terraform IaaS Modules

Modules Terraform réutilisables pour Infrastructure as a Service (IaaS)

## 📁 Structure

```
.
├── modules/
│   ├── ec2/          # Module EC2 avec validation et configuration flexible
│   └── vpc/          # Module VPC (future implementation)
├── main.tf           # Configuration principale avec for_each
├── variables.tf      # Variables d'environnement
├── outputs.tf        # Outputs des ressources
├── provider.tf       # Configuration AWS provider
└── versions.tf       # Versions Terraform et providers
```

## 🚀 Module EC2

Module EC2 avec les fonctionnalités suivantes:

### Caractéristiques
- ✅ Validation du format AMI
- ✅ Support multi-instance avec `for_each`
- ✅ Tags personnalisables
- ✅ Outputs: instance_id, public_ip, private_ip

```

## 🛠️ Prérequis

- Terraform >= 1.5.0
- AWS Provider ~> 5.0

## � Versioning

Ce dépôt utilise des **Git Tags** pour versionner chaque module indépendamment.

### Utilisation des modules

Pour utiliser une version spécifique d'un module, utilisez la syntaxe `git::` avec le paramètre `ref` :

**Exemple VPC :**
```hcl
module "vpc" {
  source = "git::https://github.com/sl11me/terraform-aws-vpc//modules/vpc?ref=vpc-v1.0.0"
  
  # ... variables ...
}
```

**Exemple EC2 :**
```hcl
module "ec2" {
  source = "git::https://github.com/sl11me/terraform-aws-ec2//modules/ec2?ref=ec2-v1.0.0"
  
  # ... variables ...
}
```

## �🔒 Sécurité