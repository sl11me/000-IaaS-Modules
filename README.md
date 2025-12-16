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
- ✅ Validation des types d'instances (t2/t3 uniquement)
- ✅ Validation du format AMI
- ✅ Configuration d'IP publique
- ✅ Support multi-instance avec `for_each`
- ✅ Tags personnalisables
- ✅ Outputs: instance_id, public_ip, private_ip

### Utilisation

```hcl
module "ec2" {
  source = "./modules/ec2"

  ami_id              = "ami-068c0051b15cdb816"
  instance_type       = "t3.micro"
  associate_public_ip = true

  tags = {
    Name = "my-instance"
    Env  = "dev"
  }
}
```

## 🛠️ Prérequis

- Terraform >= 1.5.0
- AWS Provider ~> 5.0
- Credentials AWS configurées

## 📝 Commandes

```bash
# Initialiser Terraform
terraform init

# Valider la configuration
terraform validate

# Voir le plan d'exécution
terraform plan

# Appliquer les changements
terraform apply

# Détruire les ressources
terraform destroy
```

## 🔒 Sécurité

⚠️ **IMPORTANT**: Les fichiers suivants sont ignorés par Git car ils contiennent des données sensibles:
- `*.tfstate` - État Terraform avec IDs et metadata
- `.terraform/` - Plugins et providers
- `*.tfvars` - Variables potentiellement sensibles

## 📄 License

MIT
