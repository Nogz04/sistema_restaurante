
# Sistema de Restaurante com Interface Gráfica <br> (Java Swing + SQL + POO)

Este projeto é um projeto academico desenvolvido para disciplina de **Projeto de Software**, com o objetivo de demonstrar um Sistema de Pedidos para um restaurante, além disso contamos com a interação entre o **Diagrama de Classes** e o **Diagrama de Sequência** do respectivo trabalho.

Iremos abordar diversas funcionalidades com suas respectivas interfaces, junto com seu Diagrama de Classe e Diagrama de Sequência.

---

## ✨ Funcionalidades Funcionário/Gerente

- Cadastro de Itens (Comidas, Bebidas, Sobremesas) com os campos:
  - Tipo de Item
  - Nome
  - Valor
  - Quantidade
  - Estado (Disponivel/Indisponivel)
  - Descrição (para Comidas/Sobremesas)
  - Interface simples com Java Swing
  - Botão de Cadastro do Item

- Editar itens (Comidas, Bebidas, Sobremesas) com os campos:
  - Tipo de Item
  - ID (Informar o ID do Item que quer editar)
  - Mostrar o ID do Item (Informar o ID do Item que quer editar)
  - Mostrar Nome, Valor, Quantidade, Descrição, Estado do Item (seja Comida, Bebida, Sobremesa)
  - Botão de Consulta para consultar com base no ID informado + Tipo de Item
  - Botão de Atualizar após mudar os dados
  
  
---

## 🧱 Estrutura do Projeto

- pkg beans
  - `Comida`: classe modelo que representa a comida
  - `Bebida`: classe modelo que representa a bebida
  - `Sobremesa`: classe modelo que representa a sobremesa
  - `Mesa`: classe modelo que representa a mesa
  - `Pedido`: classe modelo que representa o pedido
  
- pkg DAO
  - `ComidaDAO`: responsável por conter os métodos com os seus respectivos comandos SQL e estabelecer a conexão com o BD
  - `BebidaDAO`: responsável por conter os métodos com os seus respectivos comandos SQL e estabelecer a conexão com o BD
  - `SobremesaDAO`: responsável por conter os métodos com os seus respectivos comandos SQL e estabelecer a conexão com o BD
  - `MesaDAO`: responsável por conter os métodos com os seus respectivos comandos SQL e estabelecer a conexão com o BD
  - `PedidosDAO`: responsável por conter os métodos com os seus respectivos comandos SQL e estabelecer a conexão com o BD
    
- pkg interfaces (Parte do Funcionario/Gerente)
  - `CadastrarItens`: interface gráfica para cadastro de Itens
  - `EditarItens`: interface gráfica para editar os Itens

- pkg conexao (Parte do Cliente)
  - `TelaInicial`: interface gráfica com a tela inicial do sistema
  - `Cardapio`: interface gráfica para visualizar o cardápio
  - `IniciarPedidos`: interface gráfica para enviar pedidos para o carrinho
  - `VisualizarCarrinho`: interface gráfica para visualizar os pedidos do carrinho e confirmá-los
  - `FecharConta`: interface gráfica para visualizar o valor total da conta e fechá-la

- pkg conexao 
  - `Conexao`: classe responsável por estabelecer a conexão com o Banco de Dados

---

## ➡️ Diagrama de Caso de Uso

![Caso de Uso](https://github.com/user-attachments/assets/a9517420-60a3-46c8-b2e8-b5ed97e32168)

## 📘 Diagrama de Classes

### Astah

## ➝ CadastrarItens / EditarItens - Classes de Interfaces (Uso do Funcionario/Gerente)

![Cadastro de Itens/Edição de Itens](https://github.com/user-attachments/assets/cb0e2011-29ca-4d5c-8201-e357a7b563d0)

## ➝ Conexão com Banco de Dados - Classe de Conexao

![Classe Conexao com Banco](https://github.com/user-attachments/assets/22e25bbf-e965-4ea9-9138-150a1b0b1434)

## ➝ DAO(Repository) - Classes para passar comandos SQL
![image](https://github.com/user-attachments/assets/0ac9f490-79d7-4ad4-9e4d-e822b0d1b779)

## ➝ TelaInicial - Classe de Interface (Uso do Cliente)
![image](https://github.com/user-attachments/assets/33d007a1-e47e-4edf-9921-81c27125b37e)

## ➝ Cardapio - Classe de Interface (Uso do Cliente)
![image](https://github.com/user-attachments/assets/4c076cea-c792-4873-a936-56867a703f20)

## ➝ IniciarPedidos - Classe de Interface (Uso do Cliente) 
![image](https://github.com/user-attachments/assets/5148b7d0-2ec4-434e-9580-86f38da98e9b)

## ➝ VisualizarCarrinhoCliente - Classe de Interface (Uso do Cliente)
![image](https://github.com/user-attachments/assets/63086c4e-df3a-4945-99c1-a401dab657dd)

## ➝ FecharConta - Classe de Interface (Uso do Cliente)
![image](https://github.com/user-attachments/assets/f259c276-626a-41b8-ad04-fc51974b57eb)


---

## 🔄 Diagrama de Sequência (ainda falta)

<!-- Substitua o link abaixo com a imagem do seu diagrama de sequência -->
### Astah

![DS - Cadastro de Produto](https://github.com/user-attachments/assets/4cd7a905-574e-483d-85d8-ca076026c51f)

---

### PlantUML

![image](https://github.com/user-attachments/assets/687dad68-2687-40fd-a1ac-9112088cc1a1)

---

#### PlantUML – code

```plantuml
@startuml
title Diagrama de Sequência - Cadastro de Produto

actor Usuario

boundary ProdutoForm
control ProdutoRepository
entity Produto

== Início do Cadastro ==

Usuario -> ProdutoForm : preencherCampos()
Usuario -> ProdutoForm : clicarEmCadastrar()

ProdutoForm -> Produto : new Produto(nome, preco, quantidade)

ProdutoForm -> ProdutoRepository : salvar(produto)

ProdutoRepository -> "Arquivo CSV" : escreverLinha(produto)

ProdutoRepository --> ProdutoForm : retorno (void)

ProdutoForm -> Usuario : mostrarMensagem("Produto cadastrado com sucesso!")

@enduml
```

## 🧠 Objetivos do Projeto

- Demonstrar o sistema e suas funcionalidades
- Mostrar os diagramas do projeto (Caso de Uso, Classe, Sequência)
- Trabalhar com Banco de Dados e Organização de pedidos.
- Desenvolver interfaces gráficas com Swing e trabalhar lógica de POO com SQL

---

## 📂 Organização dos Arquivos

```
SistemaRestaurante/
├── ProjetoSistemaRestaurante/
│   ├── src/
│   │   └── DAO/
│   │   │     ├── ComidaDAO.java
│   │   │     ├── BebidaDAO.java
│   │   │     ├── SobremesaDAO.java      
│   │   │     ├── MesaDAO.java         
│   │   │     ├── PedidosDAO.java              
│   │   │                    
│   │   └── beans/
│   │   │     ├── Comida.java 
│   │   │     ├── Bebida.java 
│   │   │     ├── Sobremesa.java
│   │   │     ├── Pedido.java
│   │   │     ├── Mesa.java
│   │   │
│   │   └── interfaces/
│   │   │     ├── CadastrarItens.java 
│   │   │     ├── CadastrarItens.form 
│   │   │     ├── Cardapio.java 
│   │   │     ├── Cardapio.form
│   │   │     ├── EditarItens.java 
│   │   │     ├── EditarItens.form 
│   │   │     ├── IniciarPedidos.java 
│   │   │     ├── IniciarPedidos.form 
│   │   │     ├── VisualizarCarrinho.java
│   │   │     ├── VisualizarCarrinho.form
│   │   │
│   │   └── conexao/
│   │   │     ├── Conexao.java
│   │   │
│   │   └── Imagens/
│   │              
│   │
│   └── notinhaConta.csv
│
│
└── Diagramas/
│          ├── CasoDeUso.md
│          ├── DescriçãoNumerada.md
│          ├── DiagramasDeClasses.md
│
└── BancoDeDadosSistemaRestaurante.sql
└── mysql-connector-j-8.1.0.jar
│
├── LICENSE
└── README.md
```

---

### 🗂️ Descrição dos Diretórios e Arquivos

- **`DAO/`**: Pasta que armazena as classes responsáveis pelos métodos específicos com comandos SQL.
- **`beans/`**: Pasta que armazena as classes com seus atributos e métodos (models)
- **`interfaces/`**: Pasta que armazena as interfaces gráficas (forms) do sistema.
- **`conexao/`**: Pasta responsável por armazenar a classe Conexao.java que faz a conexão do sistema com o BD
- **`Imagens/`**: Pasta responsável por armazenar as imagens utilizadas na implementação da interface gráfica do sistema
- **`notinhaConta.csv`**: Arquivo onde a notinha com valor total é persistida.
- **`Diagramas/`**: Pasta responsável por armazenar os diagramas
- **`BancoDeDadosSistemaRestaurante.sql`**: Arquivo.sql que contém o Banco de Dados criado no MYSQL
- **`mysql-connector-j-8.1.0.jar`**: Arquivo.jar que contém a biblioteca que utilizamos para utilizar as funções para criar a conexão com o BD
- **`LICENSE`**: Arquivo de licença MIT.
- **`README.md`**: Este arquivo com instruções e explicações do projeto.

---

## 📄 Licença

Este projeto está licenciado sob os termos da licença MIT.  
Consulte o arquivo [LICENSE](LICENSE) para mais informações.

---
---

## 👤 Autores

**Matheus Nogueira Albuquerque**  
Curso de Ciência da Computação – Universidade Franciscana (UFN)

📧 E-mail: matheus.nalbuquerque@ufn.edu.br

🔗 GitHub: [@Matheus](https://github.com/Nogz04) 

---

**Romeo Noro Guterres**  
Curso de Ciência da Computação – Universidade Franciscana (UFN)

📧 E-mail: romeo.noro@ufn.edu.br 

🔗 GitHub: [@Romeo](https://github.com/romeonoro) 


---

**Gilberto Morales**  
Curso de Ciência da Computação – Universidade Franciscana (UFN)

📧 E-mail: g.morales@ufn.edu.br  

🔗 GitHub: [@Gilberto](https://github.com/eumorales) 
 


