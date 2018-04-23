A ideia de ter um repositório esqueleto para springboot é facilitar no processo de desenvolvimento do microserviço, onde o desenvolvedor pode clonar o repositório skel e alterar os campos dos arquivos que já estão pré determinados.

Para clonar o repositório:
	
	git clone git@git.cvc.com.br:CVC_Labs/back_end/springboot_vault_consul.git 

Estrutura do repositório skel:

	repo_skel_springboot
	├── ConsulCliDockerfile
	├── data
	│   ├── consul
	│   │   └── data.json
	│   └── vault
	│       └── vault-initialize.sh
	├── docker
	│   ├── deploy.yaml.template
	│   └── Dockerfile
	├── kubernetes
	│   ├── configmaps.yaml
	│   ├── namespace.yaml
	│   ├── nome_app-deploy.yaml
	│   ├── nome_app-service.yaml
	│   └── secrets.yaml
	├── Makefile
	├── README.md
	└── VaultCliDockerfile

Arquivos que devem ser alterados:
 - data/consul/data.json
 - data/vault/vault-initialize.sh
 - docker/Dockerfile
 - kubernetes/configmaps.yaml
 - kubernetes/namespace.yaml
 - kubernetes/nome_app-deploy.yaml
 - kubernetes/nome_app-service.yaml
 - kubernetes/secrets.yaml
