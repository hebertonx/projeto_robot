*** Settings ***
Resource           ../resources/ResourcesCases.robot


**** Test Case ****
Cenário 01 - Realizar compras com usuário não logado
   Dado que esteja na tela de home 
   Quando adicionar ao carrinho de compras
   E seguir para o carrinho de compras
   E seguir para o login
   E preencher os dados de email, senha e confirmar
   E seguir para a remesa 
   E marcar o checkbox de termo de aceite e seguir para o pagamento
   E selecionar a forma de pagamento e confirmar
   Então deverá ser exibida a mensagem "Your order on My Store is complete."

Cenário 02 - Não permitir finalizar a compra
   Dado que esteja na tela de home 
   Quando adicionar ao carrinho de compras
   E seguir para o carrinho de compras
   E excluir o item adicionado
   Então deverá ser exibida a mensagem "Your shopping cart is empty."