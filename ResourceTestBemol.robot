*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${URL}                       https://www.bemol.com.br/
${BROWSER}                   chrome
${BUTTON_LOGIN}              xpath://*[@id="profile-orders-2"]/div[1]/a
${BUTTON_REGISTER}           xpath://*[@id="criarconta"]/div/div/div
${FIELD_NAME}                xpath://*[@id="AddOrSetCustomer-Name"]
${TEXT_NAME}                 Valentina Sophia Gomes
${FIELD_BIRTH_DATE}          xpath://*[@id="AddOrSetCustomer-BirthDate"]
${TEXT_BIRTH_DATE}           17011997
${SELECT_GENRE}              id:AddOrSetCustomer-Gender 
${FIELD_CPF}                 xpath://*[@id="AddOrSetCustomer-Cpf"]
${TEXT_CPF}                  25009421208
${TITLE3_DELIVERY_DATA}      xpath://*[@id="content-wrapper"]/div[1]/div/div/div/div/div[2]/form/div[2]/div
${FIELD_IDENTIFICATION}      xpath://*[@id="AddOrSetAddress-0-Name"]
${TEXT_IDENTIFICATION}       casa
${FIELD_CEP}                 id:AddOrSetAddress-0-PostalCode
${TEXT_CEP}                  69093067
${FIELD_ADDRESS}             id:AddOrSetAddress-0-AddressLine
${TEXT_ADDRESS}              rua Melquias
${FIELD_NUMBER}              id:AddOrSetAddress-0-Number
${TEXT_NUMBER}               05
${FIELD_COMPLEMENT}          id:AddOrSetAddress-0-AddressNotes
${TEXT_COMPLEMENT}           Proximo a  rua Flores
${FIELD_REFERENCE}           id:AddOrSetAddress-0-Landmark
${TEXT_REFERENCE}            Mercado Vidal
${TITLE4_CONTACT_DETAILS}    xpath://*[@id="content-wrapper"]/div[1]/div/div/div/div/div[2]/form/div[3]/div
${FIELD_EMAIL}               id:AddOrSetCustomer-Email
${TEXT_EMAIL}                valentina_sophia_gomes@soupelli.com.br
${FIELD_CELL}                id:AddOrSetCustomer-Contact-CellPhone
${TEXT_CELL}                 92993949212

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
  Input Text    ${FIELD_NAME}    ${TEXT_NAME}
  Input Text    ${FIELD_BIRTH_DATE}    ${TEXT_BIRTH_DATE}
  Click Element    ${SELECT_GENRE}
  Wait Until Element Is Visible    ${SELECT_GENRE}  5S
  Select From List By Value    ${SELECT_GENRE}    F
  List Selection Should Be     ${SELECT_GENRE}    F
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