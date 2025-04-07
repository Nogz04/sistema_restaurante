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

## 🔄 Diagrama de Sequência (PlantUML)

<!-- Substitua o link abaixo com a imagem do seu diagrama de sequência -->
### CadastrarItem

![image](https://github.com/user-attachments/assets/595878b8-9929-4a80-9103-28f4aa3b0bb4)

---

#### PlantUML Code CadastrarItens

```plantuml
@startuml
actor FuncionarioGerente
participant "CadastrarItens" as Form
participant "Bebida" as B
participant "BebidaDAO" as BDAO
participant "Comida" as C
participant "ComidaDAO" as CDAO
participant "Sobremesa" as S
participant "SobremesaDAO" as SDAO
participant JOptionPane

== Cadastro de Bebida ==
FuncionarioGerente-> Form : btnCadastrar()
Form -> Form : verificar tipo == Bebida
Form -> B : new Bebida()
Form -> B : setNome(), setValor(), setQuantidade(), setEstado()
Form -> BDAO : new BebidaDAO()
Form -> BDAO : inserir(B)
BDAO --> Form : confirmação
Form -> JOptionPane : mostrarMensagem(B.getNome() + " cadastrado")

== Cadastro de Comida ==
FuncionarioGerente -> Form : btnCadastrar()
Form -> Form : verificar tipo == Comida
Form -> C : new Comida()
Form -> C : setNome(), setValor(), setQuantidade(), setDescricao(), setEstado()
Form -> CDAO : new ComidaDAO()
Form -> CDAO : inserir(C)
CDAO --> Form : confirmação
Form -> JOptionPane : mostrarMensagem(C.getNome() + " cadastrado")

== Cadastro de Sobremesa ==
FuncionarioGerente-> Form : btnCadastrar()
Form -> Form : verificar tipo == Sobremesa
Form -> S : new Sobremesa()
Form -> S : setNome(), setValor(), setQuantidade(), setDescricao(), setEstado()
Form -> SDAO : new SobremesaDAO()
Form -> SDAO : inserir(S)
SDAO --> Form : confirmação
Form -> JOptionPane : mostrarMensagem(S.getNome() + " cadastrado")
@enduml
```
### EditarItens

![image](https://github.com/user-attachments/assets/f08d91f0-15fa-4b20-907b-f8d8de5b0853)


#### PlantUML Code EditarItens

```plantuml
@startuml
actor FuncionarioGerente

participant "EditarItens" as EditarItens
participant "ComidaDAO" as ComidaDAO
participant "Comida" as Comida
participant "BebidaDAO" as BebidaDAO
participant "Bebida" as Bebida
participant "SobremesaDAO" as SobremesaDAO
participant "Sobremesa" as Sobremesa

== Consulta de Comida ==

FuncionarioGerente -> EditarItens : clica em bntConsultarItem
activate EditarItens
EditarItens -> EditarItens : bntConsultarItemActionPerformed()
EditarItens -> ComidaDAO : buscarPorId(id)
activate ComidaDAO
ComidaDAO --> EditarItens : retorna Comida
deactivate ComidaDAO
EditarItens -> EditarItens : setText nos campos com dados da Comida
deactivate EditarItens

== Atualização de Comida ==

FuncionarioGerente -> EditarItens : clica em btnAtualizarItem
activate EditarItens
EditarItens -> Comida : atualiza Comida com dados dos campos
activate Comida
deactivate Comida
EditarItens -> ComidaDAO : atualizar(comida)
activate ComidaDAO
ComidaDAO --> EditarItens : retorno void
deactivate ComidaDAO
EditarItens -> EditarItens : limpa os campos (setText(""))
deactivate EditarItens

== Consulta de Bebida ==

FuncionarioGerente -> EditarItens : clica em bntConsultarItem
activate EditarItens
EditarItens -> EditarItens : bntConsultarItemActionPerformed()
EditarItens -> BebidaDAO : buscarPorId(id)
activate BebidaDAO
BebidaDAO --> EditarItens : retorna Bebida
deactivate BebidaDAO
EditarItens -> EditarItens : setText nos campos com dados da Bebida
deactivate EditarItens

== Atualização de Bebida ==

FuncionarioGerente -> EditarItens : clica em btnAtualizarItem
activate EditarItens
EditarItens -> Bebida : atualiza Bebida com dados dos campos
activate Bebida
deactivate Bebida
EditarItens -> BebidaDAO : atualizar(bebida)
activate BebidaDAO
BebidaDAO --> EditarItens : retorno void
deactivate BebidaDAO
EditarItens -> EditarItens : limpa os campos (setText(""))
deactivate EditarItens

== Consulta de Sobremesa ==

FuncionarioGerente -> EditarItens : clica em bntConsultarItem
activate EditarItens
EditarItens -> EditarItens : bntConsultarItemActionPerformed()
EditarItens -> SobremesaDAO : buscarPorId(id)
activate SobremesaDAO
SobremesaDAO --> EditarItens : retorna Sobremesa
deactivate SobremesaDAO
EditarItens -> EditarItens : setText nos campos com dados da Sobremesa
deactivate EditarItens

== Atualização de Sobremesa ==

FuncionarioGerente -> EditarItens : clica em btnAtualizarItem
activate EditarItens
EditarItens -> Sobremesa : atualiza Sobremesa com dados dos campos
activate Sobremesa
deactivate Sobremesa
EditarItens -> SobremesaDAO : atualizar(sobremesa)
activate SobremesaDAO
SobremesaDAO --> EditarItens : retorno void
deactivate SobremesaDAO
EditarItens -> EditarItens : limpa os campos (setText(""))
deactivate EditarItens
@enduml
```
### TelaInicialCliente

![image](https://github.com/user-attachments/assets/51cbdb0d-be59-4bb0-84fb-51309b0b02fb)

#### PlantUML Code TelaInicial

```plantuml
@startuml
actor Cliente

Cliente -> TelaInicialCliente : new()
activate TelaInicialCliente
TelaInicialCliente -> TelaInicialCliente : initComponents()

== Acessar o Cardápio ==
Cliente -> TelaInicialCliente : btnCardapioActionPerformed()
TelaInicialCliente -> CardapioCliente : new()
CardapioCliente -> CardapioCliente : setVisible(true)
@enduml
```


### Cardapio

![image](https://github.com/user-attachments/assets/4d043a69-1aa3-4df3-ac06-9d635efd5ef7)

#### PlantUML Code Cardapio

```plantuml
@startuml
actor Cliente
Cliente --> CardapioCliente : visualizar cardapio
Cliente --> CardapioCliente : filtrar por comidas
Cliente --> CardapioCliente : filtrar por bebidas
Cliente --> CardapioCliente : filtrar por sobremesas
Cliente --> CardapioCliente : buscar por nome
Cliente --> CardapioCliente : iniciar pedidos
CardapioCliente --> IniciarPedidosCliente : abrir tela
@enduml
```

### IniciarPedidos

![image](https://github.com/user-attachments/assets/4c1fbc59-c489-4a93-82b0-1c0ef6439cf5)

#### PlantUML Code IniciarPedidos

```plantuml
@startuml
actor Cliente

Cliente -> IniciarPedidosCliente : new()
activate IniciarPedidosCliente
IniciarPedidosCliente -> IniciarPedidosCliente : preencherComboComidas()
IniciarPedidosCliente -> ComidaDAO : getComidas()
ComidaDAO --> IniciarPedidosCliente : List<Comida>

IniciarPedidosCliente -> IniciarPedidosCliente : preencherComboBebidas()
IniciarPedidosCliente -> BebidaDAO : getBebidas()
BebidaDAO --> IniciarPedidosCliente : List<Bebida>

IniciarPedidosCliente -> IniciarPedidosCliente : preencherComboSobremesas()
IniciarPedidosCliente -> SobremesaDAO : getSobremesas()
SobremesaDAO --> IniciarPedidosCliente : List<Sobremesa>

IniciarPedidosCliente -> IniciarPedidosCliente : preencherComboMesas()
IniciarPedidosCliente -> MesaDAO : getMesas()
MesaDAO --> IniciarPedidosCliente : List<Mesa>

Cliente -> IniciarPedidosCliente : btnEnviarParaCarrinhoActionPerformed()
IniciarPedidosCliente -> Pedido : new Pedido()
IniciarPedidosCliente -> Pedido : setId_comida(), setQuantidade_comida(), setValor_comida()
IniciarPedidosCliente -> Pedido : setId_bebida(), setQuantidade_bebida(), setValor_bebida()
IniciarPedidosCliente -> Pedido : setId_sobremesa(), setQuantidade_sobremesa(), setValor_sobremesa()
IniciarPedidosCliente -> Pedido : setId_mesa()
IniciarPedidosCliente -> PedidosDAO : inserir(Pedido)

Cliente -> IniciarPedidosCliente : btnVerCarrinhoActionPerformed()
IniciarPedidosCliente -> VisualizarCarrinhoCliente : new()
VisualizarCarrinhoCliente -> VisualizarCarrinhoCliente : setVisible(true)
IniciarPedidosCliente -> IniciarPedidosCliente : dispose()
@enduml
```
### VisualizarCarrinho

![image](https://github.com/user-attachments/assets/7f639ffa-5680-47e8-a4fe-1049277390d7)


#### PlantUML Code VisualizarCarrinho

```plantuml
@startuml
actor Cliente

Cliente -> VisualizarCarrinhoCliente : new()
activate VisualizarCarrinhoCliente
VisualizarCarrinhoCliente -> VisualizarCarrinhoCliente : preencherTabela()
VisualizarCarrinhoCliente -> PedidosDAO : getPedidos()
PedidosDAO --> VisualizarCarrinhoCliente : List<Pedido>
VisualizarCarrinhoCliente -> tblPedidosCarrinho : addRow(...)

== Confirmar Pedido ==
Cliente -> VisualizarCarrinhoCliente : btnConfirmarPedidoActionPerformed()
VisualizarCarrinhoCliente -> PedidosDAO : getPedidos()
PedidosDAO --> VisualizarCarrinhoCliente : List<Pedido>
VisualizarCarrinhoCliente -> JOptionPane : showMessageDialog("Pedido enviado com sucesso!")
VisualizarCarrinhoCliente -> JOptionPane : showMessageDialog("Resumo do pedido")
VisualizarCarrinhoCliente -> tblPedidosCarrinho : setNumRows(0)
VisualizarCarrinhoCliente -> PedidosDAO : excluirTodosPedidos()

== Ver Conta ==
Cliente -> VisualizarCarrinhoCliente : btnVerContaActionPerformed()
VisualizarCarrinhoCliente -> FecharContaCliente : new()
FecharContaCliente -> FecharContaCliente : setVisible(true)

== Fazer Mais Pedidos ==
Cliente -> VisualizarCarrinhoCliente : btnVoltarMenuPedidosActionPerformed()
VisualizarCarrinhoCliente -> IniciarPedidosCliente : new()
IniciarPedidosCliente -> IniciarPedidosCliente : setVisible(true)
VisualizarCarrinhoCliente -> VisualizarCarrinhoCliente : dispose()

== Limpar Carrinho ==
Cliente -> VisualizarCarrinhoCliente : btnLimparCarrinhoActionPerformed()
VisualizarCarrinhoCliente -> PedidosDAO : excluirTodosPedidos()
VisualizarCarrinhoCliente -> tblPedidosCarrinho : setNumRows(0)
@enduml

```


### FecharConta

![image](https://github.com/user-attachments/assets/7f003e7d-da4e-49d2-b9b1-6a630b24294c)



#### PlantUML Code FecharConta

```plantuml

@startuml
actor Cliente

Cliente -> FecharContaCliente : new()
activate FecharContaCliente
FecharContaCliente -> FecharContaCliente : carregarTotalPedidos()
FecharContaCliente -> VisualizarCarrinhoCliente : getTotalPedidosConfirmados()
VisualizarCarrinhoCliente --> FecharContaCliente : double
FecharContaCliente -> lblValorTotalConta : setText("R$ ...")

== Fechar Conta ==
Cliente -> FecharContaCliente : btnFecharContaActionPerformed()
FecharContaCliente -> VisualizarCarrinhoCliente : getTotalPedidosConfirmados()
VisualizarCarrinhoCliente --> FecharContaCliente : double
FecharContaCliente -> JOptionPane : showMessageDialog("Valor a pagar: R$...")

== Voltar ao Carrinho ==
Cliente -> FecharContaCliente : btnVoltarCarrinhoActionPerformed()
FecharContaCliente -> VisualizarCarrinhoCliente : new()
VisualizarCarrinhoCliente -> VisualizarCarrinhoCliente : setVisible(true)
FecharContaCliente -> FecharContaCliente : dispose()
@enduml

```

---

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
│   │   │     ├── CardapioCliente.java 
│   │   │     ├── CardapioCliente.form
│   │   │     ├── EditarItens.java 
│   │   │     ├── EditarItens.form 
│   │   │     ├── IniciarPedidosCliente.java 
│   │   │     ├── IniciarPedidos.form 
│   │   │     ├── VisualizarCarrinhoCliente.java
│   │   │     ├── VisualizarCarrinhoCliente.form
│   │   │     ├── FecharContaCliente.java
│   │   │     ├── FecharContaCliente.java.form
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
│          ├── DiagramasDeSequencia.md
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
 


