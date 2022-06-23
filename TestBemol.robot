*** Settings ***

Resource  ResourceTestBemol.robot

*** Test Cases ***

Test Case 01: Access Site bemol 
  Access Home page
  Check page title Bemol | Escolha com Confiança

Test Case 02: Go to create account page
  Acess page Login
  Check login page title Login - Bemol
  Click on Faça cadastro