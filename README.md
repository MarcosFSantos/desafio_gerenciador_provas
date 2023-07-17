# Desafio Gerenciador Provas

## Instalação

### Instalação do Docker Compose

Primeiro passo para instalação do projeto em sua máquina é garantir a instalação do Docker Compose em sua máquina. Para mais informações de como instalar o Docker Compose acesse a documentação oficial https://docs.docker.com/compose/install/.

### Instalação do Git

Após instalar o Docker Compose, o próximo passo é a instalação do Git na sua máquina, para isso acesse a documentação oficial https://git-scm.com/book/pt-br/v2/Come%C3%A7ando-Instalando-o-Git.

### Instalação do PostgreSQL

Após instalar o Git, será necessário instalar o PostgreSQL para o gerenciamento de banco de dados, para isso, acesse a documentação oficial https://www.postgresql.org/docs/current/installation.html.

### Clonagem do repositório

Com o Docker Compose, PostgreSQL e o Git instalados, agora é necessário clonar este repositório, para isso siga os seguintes passos:

* Clicar no Botão "Code" e copiar o código HTTPS do Repositório.

![imagem1](examples\readme1.png)

* Abrir o terminal Git na pasta que você desejar manter a pasta do projeto instalado.

* Executar o comando:

```bash
git clone "https://github.com/MarcosFSantos/desafio_gerenciador_provas.git"
```

* Abrir a pasta "desafio_gerenciador_provas" gerada após o comando com a IDE da sua preferência.

### Configurar banco de dados

Ao abrir o projeto com a IDE de sua preferência, será necessário abrir o arquivo .env e modifica-lo para conter as variáveis de ambiente do banco de dados, ao abrir o arquivo .env, o código esperado é esse:

![Imagem2](examples\readme2.png)

Siga as seguintes etapas para o configuração do banco de dados do projeto:

* Acesse o pgAdmin que foi instalado junto com o gerenciador de banco de dados postgreSQL.

![Imagem3](examples\readme3.png)

* Abra a seguinte guia no lado superior esquerdo:

![Imagem4](examples\readme4.png)

* Na aba "Connection" será possível ver as informações "Host name/address" e "Username".

* Volte ao arquivo .env

* Modifique o trecho ```<db_username>``` para o "Username" do pgAdmin.

* Modifique o trecho ```<db_host>``` para o "Host name/address" do pgAdmin.

* Modifique o trecho ```<db_password>``` para a sua senha do pgAdmin.

### Construção dos containers Docker Compose

* Abra a pasta "desafio_gerenciador_provas" com o terminal de sua preferência.

* Digite o seguinte comando pra construir as imagens:

```console
docker-compose build
```

* Espere a execução do comando e execute esse outro comando para a criação do banco de dados:

```console
docker-compose run web rails db:create db:migrate
```

* Após a execução do comando digite o seguinte comando para levantar os containers:

```console
docker-compose up -d
```

* Após a execução do último comando execute o próximo para entrar no container que contém a aplicação Rails:

```console
docker-compose exec web bash
```

### Execução do server

* Execute o seguinte comando para iniciar o Sidekiq para processos em background:

```console
sidekiq
```

Agora finalmente a aplicação já esta rodando, acesse uma das suas URLs para finalmente interagir com a aplicação.

## URLs

Para mais informações sobre quais as URLs da aplicação, aqui está o link da "collection" do Postman que contém todas URLS do projeto: https://www.postman.com/technical-architect-64624556/workspace/deafio-fractal/collection/24721771-e27a214c-b679-4bb9-8044-6d3218c245cd?action=share&creator=24721771