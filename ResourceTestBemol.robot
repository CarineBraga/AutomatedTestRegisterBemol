*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${URL}                       https://www.bemol.com.br/
${BROWSER}                   chrome
${BUTTON_LOGIN}              xpath://*[@id="profile-orders-2"]/div[1]/a
${BUTTON_REGISTER}           xpath://*[@id="criarconta"]/div/div/div

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