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