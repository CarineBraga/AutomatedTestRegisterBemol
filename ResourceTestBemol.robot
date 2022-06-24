*** Settings ***

Library  SeleniumLibrary

*** Variables ***

# User registration data were taken from the website: https://www.4devs.com.br/gerador_de_pessoas

${URL}                       https://www.bemol.com.br/
${BROWSER}                   chrome
${BUTTON_LOGIN}              xpath://*[@id="profile-orders-2"]/div[1]/a
${BUTTON_REGISTER}           xpath://*[@id="criarconta"]/div/div/div
${ACCEPT_COOKIE}             css: .btn-aceptar
${FIELD_NAME}                xpath://*[@id="AddOrSetCustomer-Name"]
${TEXT_NAME}                 Fernando Moura
${ERROR_NAME}                id:AddOrSetCustomer-Name-error
${FIELD_BIRTH_DATE}          xpath://*[@id="AddOrSetCustomer-BirthDate"]
${TEXT_BIRTH_DATE}           14061974
${ERROR_BIRTH_DATE}          id:AddOrSetCustomer-BirthDate-error
${SELECT_GENRE}              id:AddOrSetCustomer-Gender
${TYPE_GENRE}                M   # M for Masculine and F for Female
${FIELD_CPF}                 xpath://*[@id="AddOrSetCustomer-Cpf"]
${TEXT_CPF}                  4965.204.440-73  # User CPF for example: 21100753257, 09809798202, 21462571212
${ERROR_CPF}                 id:AddOrSetCustomer-Cpf-error
${TITLE3_DELIVERY_DATA}      xpath://*[@id="content-wrapper"]/div[1]/div/div/div/div/div[2]/form/div[2]/div
${FIELD_IDENTIFICATION}      xpath://*[@id="AddOrSetAddress-0-Name"]
${TEXT_IDENTIFICATION}       beco
${FIELD_CEP}                 id:AddOrSetAddress-0-PostalCode
${TEXT_CEP}                  69030190
${ERROR_CEP}                 ID:AddOrSetAddress-0-PostalCode-error
${FIELD_ADDRESS}             id:AddOrSetAddress-0-AddressLine
${TEXT_ADDRESS}              Beco São Tomé
${ERROR_ADDRESS}             id:AddOrSetAddress-0-AddressLine-error
${FIELD_NUMBER}              id:AddOrSetAddress-0-Number
${TEXT_NUMBER}               792
${ERROR_NUMBER}              id:AddOrSetAddress-0-Number-error
${FIELD_COMPLEMENT}          id:AddOrSetAddress-0-AddressNotes
${TEXT_COMPLEMENT}           Proximo a  rua Flores
${ERROR_COMPLEMENT}          id:AddOrSetAddress-0-AddressNotes-error
${FIELD_REFERENCE}           id:AddOrSetAddress-0-Landmark
${TEXT_REFERENCE}            Mercado Vidal
${ERROR_REFERENCE}           id:AddOrSetAddress-0-Landmark-error
${TITLE4_CONTACT_DETAILS}    xpath://*[@id="content-wrapper"]/div[1]/div/div/div/div/div[2]/form/div[3]/div
${FIELD_CELL}                id:AddOrSetCustomer-Contact-CellPhone
${TEXT_CELL}                 92993949212
${ERROR_CELL}                id:AddOrSetCustomer-Contact-CellPhone-error
${TILE5_CONTACT_DETAILS}     xpath://*[@id="content-wrapper"]/div[1]/div/div/div/div/div[2]/form/div[4]/div
${FIELD_EMAIL}               id:AddOrSetCustomer-Email
${TEXT_EMAIL}                fernan.do.moura9451@gmail.com  # User Email for example: fer.nandomoura9451@gmail.com, fernandomoura.9451@gmail.com, fernando.moura.9451@gmail.com
${ERROR_EMAIL}               AddOrSetCustomer-Email-error
${FIELD_PASSWORD}            id:AddOrSetCustomer-Password
${TEXT_PASSWORD}             @familia23   
${ERROR_PASSWORD}            id:AddOrSetCustomer-Password-error
${REPEAT_TEXT_PASSWORD}      id:AddOrSetCustomer-Password-check
${ERROR_REPEAT_PASSWORD}     id:AddOrSetCustomer-Password-check-error
${BUTTON_REGISTER2}          css:.bt-submit
${ERROR_CPF_ALERT}           id:alert alert-error
${LOCATION_SUCCESS}          https://www.bemol.com.br/cadastro/sucesso
${TITLE6_MESSAGE_REGIS}      id:content-wrapper
${EMAIL_LOGIN}               id:widget75-email
${TEXT_EMAIL_LOGIN}          fernandomoura9451@gmail.com
${ERROR_EMAIL_LOGIN}         id:widget75-email-error
${PASSWORD_LOGIN}            id:widget75-password
${TEXT_PASSWORD_LOGIN}       @familia23
${ERROR_PASSWORD_LOGIN}      css:.the-modal-container
${BUTTON_ENTER}              xpath://*[@id="widget75-submit"]
${USER}                      css:.user-info

*** Keywords ***

Access Home page
  Open Browser  ${URL}  ${BROWSER}
  Maximize Browser Window
  
Check page title ${TITULO}
  Title Should Be  ${TITULO}

Acess page Login
  Click Element    ${BUTTON_LOGIN}

Check login page title ${TITULO1}
  Check page title ${TITULO1}

Click on Faça cadastro
  Click Element    ${BUTTON_REGISTER}

Check title of registration page ${TITULO2}
  Title Should Be    ${TITULO2}

Enter the user's personal data
  Click Element    ${ACCEPT_COOKIE}
  Input Text    ${FIELD_NAME}    ${TEXT_NAME}
  Input Text    ${FIELD_BIRTH_DATE}    ${TEXT_BIRTH_DATE}
  Click Element    ${SELECT_GENRE}
  Wait Until Element Is Visible    ${SELECT_GENRE}  5S
  Select From List By Value    ${SELECT_GENRE}    ${TYPE_GENRE}
  List Selection Should Be     ${SELECT_GENRE}    ${TYPE_GENRE}
  Input Text    ${FIELD_CPF}   ${TEXT_CPF}

Check if the page has Dados de entrega
  Page Should Contain Element   ${TITLE3_DELIVERY_DATA}

Fill in user delivery data  
  Input Text   ${FIELD_IDENTIFICATION}     ${TEXT_IDENTIFICATION}
  Input Text    ${FIELD_CEP}    ${TEXT_CEP}
  Double Click Element  ${FIELD_ADDRESS}  
  Input Text   ${FIELD_NUMBER}    ${TEXT_NUMBER}
  Input Text   ${FIELD_COMPLEMENT}   ${TEXT_COMPLEMENT}
  Input Text    ${FIELD_REFERENCE}    ${TEXT_REFERENCE}

Check if the page has Dados de contato
  Page Should Contain Element    ${TITLE4_CONTACT_DETAILS}

Fill in the user's contact details
  Input Text    ${FIELD_CELL}    ${TEXT_CELL}

Check if the page has Dados da conta
  Page Should Contain Element    ${TILE5_CONTACT_DETAILS}

Fill in user account details
  Input Text    ${FIELD_EMAIL}    ${TEXT_EMAIL}
  Input Password    ${FIELD_PASSWORD}    ${TEXT_PASSWORD}
  Input Password    ${REPEAT_TEXT_PASSWORD}    ${TEXT_PASSWORD}

Click on register button
  Wait Until Element Is Visible    ${BUTTON_REGISTER2}
  Click Element    ${BUTTON_REGISTER2}

Check if there is no visible error message
  Element Should Not Be Visible    ${ERROR_NAME}
  Element Should Not Be Visible    ${ERROR_BIRTH_DATE}
  Element Should Not Be Visible    ${ERROR_CPF}
  Element Should Not Be Visible    ${ERROR_CEP}
  Element Should Not Be Visible    ${ERROR_ADDRESS}
  Element Should Not Be Visible    ${ERROR_NUMBER}
  Element Should Not Be Visible    ${ERROR_COMPLEMENT}
  Element Should Not Be Visible    ${ERROR_REFERENCE}
  Element Should Not Be Visible    ${ERROR_CELL}
  Element Should Not Be Visible    ${ERROR_EMAIL}
  Element Should Not Be Visible    ${ERROR_PASSWORD}
  Element Should Not Be Visible    ${ERROR_REPEAT_PASSWORD}
  Element Should Not Be Visible    ${ERROR_CPF_ALERT}
Check registration confirmation message
  Wait Until Location Is  ${LOCATION_SUCCESS}

Close site 
  Close Browser

Fill email and password
  Input Text    ${EMAIL_LOGIN}    ${TEXT_EMAIL_LOGIN}
  Input Password    ${PASSWORD_LOGIN}    ${TEXT_PASSWORD_LOGIN}

Click on the button Entrar
  Click Button    ${BUTTON_ENTER}  

Check if there is no visible error message login
  Element Should Not Be Visible    ${ERROR_EMAIL_LOGIN}
  Element Should Not Be Visible   ${ERROR_PASSWORD_LOGIN}

Check login confirmation
  Wait Until Element Is Visible    ${USER}

