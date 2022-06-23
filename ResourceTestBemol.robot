*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${URL}                       https://www.bemol.com.br/
${BROWSER}                   chrome

*** Keywords ***

Access Home page
  Open Browser  ${URL}  ${BROWSER}
  Maximize Browser Window
  
Check page title ${TITULO}
  Title Should Be  ${TITULO}