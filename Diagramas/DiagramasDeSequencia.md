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


