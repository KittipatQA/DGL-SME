*** Settings ***
Library              SeleniumLibrary
Library              BuiltIn
Resource             ${path_jenkins}/Resource/dglforsme.resource
Resource             ${path_jenkins}/Page/home_page.resource
Resource             ${path_jenkins}/Page/oe_page.resource
Resource             ${path_jenkins}/Page/login_page.resource   
Resource             ${path_jenkins}/Logic/TS_OE_Lis_1.resource
Suite Setup          Open the web page
Test Setup           Go to login page
Test Teardown        Run Keyword If Test Failed     Capture Screen
Test Template        Oe Check Result 1
# Suite Teardown       Close Browser

*** Variables ***

*** Keywords ***

*** Tasks ***
1ตรวจสอบการแสดงรายการ_โดยมีเงื่อนไขดังนี้_เลือก_Checkbox_ชำระแล้ว   tester@gmail.com   123123   OE Page Search   yes   no   no   ชำระแล้ว
2ตรวจสอบการแสดงรายการ_โดยมีเงื่อนไขดังนี้_เลือก_Checkbox_ค้างชำระ   tester@gmail.com   123123   OE Page Search   no   yes   no   ค้างชำระ
3ตรวจสอบการแสดงรายการ_โดยมีเงื่อนไขดังนี้_เลือก_Checkbox_ยกเลิกรายการ   tester@gmail.com   123123   OE Page Search   no   no   yes   ยกเลิกรายการ