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
${TEXT_BIRTH_DATE}           17011988
${SELECT_GENRE}              id:AddOrSetCustomer-Gender 
${FIELD_CPF}                 xpath://*[@id="AddOrSetCustomer-Cpf"]
${TEXT_CPF}                  25009421208


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