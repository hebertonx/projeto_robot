*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ADD_TO_CART}                          xpath=//span[contains(text(),'Add to cart')]
${BROWSER}                              chrome
${CHECK}                                xpath=//input[@name='cgv']
${CONFIRM_ORDER}                        xpath=//button[@class='button btn btn-default button-medium']
${EMAIL}                                heberton@gmail.com.br
${EMAIL_INPUT}                          xpath=//input[@id='email']
${MSG}                                  xpath=//class[@name='dark']
${MSG_VALUE}                            Your order on My Store is complete.
${MSG_VALUE2}                           Your shopping cart is empty.
${PAY_BY_BANK}                          xpath=//*[contains(@href,'http://automationpractice.com/index.php?fc=module&module=bankwire&controller=payment')]
${PRODUCT}                              css=#homefeatured > li:nth-child(1)
${PASSWORD}                             123456
${PASSWORD_INPUT}                       xpath=//input[@id='passwd'] 
${Proceed_to_checkout}                  xpath=//*[contains(@href,'http://automationpractice.com/index.php?controller=order')]
${Proceed_to_checkout_car}              xpath=//*[contains(@href,'http://automationpractice.com/index.php?controller=order&step=1')]
${Proceed_to_checkout_addres}           xpath=//button[@name='processAddress']
${Proceed_to_checkout_shipping}         xpath=//button[@name='processCarrier']
${SIG_IN}                               xpath=//button[@id='SubmitLogin'] 
${URL}                                  http://automationpractice.com/index.php
${DELETE}                               xpath=//a[@id='1_1_0_0'] 


*** Keywords ***
Dado que esteja na tela de home 
   Open Browser                                            ${URL}  ${BROWSER}
Quando adicionar ao carrinho de compras
   Mouse Over                                              ${PRODUCT}
   Wait Until Element Is Visible                           ${ADD_TO_CART}      10
   Click Element                                           ${ADD_TO_CART} 
E seguir para o carrinho de compras               
   Click Element                                           ${Proceed_to_checkout} 
   Click Element                                           ${Proceed_to_checkout} 
E seguir para o login               
   Click Element                                           ${Proceed_to_checkout_car}
E preencher os dados de email, senha e confirmar
   Input Text                                              ${EMAIL_INPUT}    ${EMAIL} 
   Input Password                                          ${PASSWORD_INPUT}   ${PASSWORD}
   Click Element                                           ${SIG_IN}  
E seguir para a remesa                
   Click Element                                           ${Proceed_to_checkout_addres} 
E marcar o checkbox de termo de aceite e seguir para o pagamento
   Select Checkbox                                         ${CHECK}
   Click Element                                           ${Proceed_to_checkout_shipping} 
E selecionar a forma de pagamento e confirmar
   Click Element                                           ${PAY_BY_BANK}  
   Click Element                                           ${CONFIRM_ORDER} 

Então deverá ser exibida a mensagem "Your order on My Store is complete."
   Page Should Contain                                     ${MSG_VALUE} 

E excluir o item adicionado
   Sleep     5
   Click Element                                           ${DELETE}   

Então deverá ser exibida a mensagem "Your shopping cart is empty."
   Page Should Contain                                     ${MSG_VALUE2} 