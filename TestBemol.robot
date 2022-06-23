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

Test Case 03: Fill in the registration fields - Dados Pessoais
  Check title of registration page Área do Cliente - Bemol
  Enter the user's personal data

Test Case 04: Fill in the registration fields - Dados de entrega
  Check if the page has Dados de entrega
  Fill in user delivery data

Test Case 05: Fill in the registration fields - Dados de contato
  Check if the page has Dados de contato
  Fill in the user's contact details

Test Case 06: Fill in the registration fields - Dados da conta
  Check if the page has Dados da conta
  Fill in user account details
  Click on register button
  Check registration confirmation message
  Close site

Test Case 07: Go to login page
  Access Home page
  Check page title Bemol | Escolha com Confiança
  Acess page Login
  Check login page title Login - Bemol