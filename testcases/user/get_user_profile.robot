*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Get user profile success
    [Documentation]    To verify get user profile api will return correct data when trying to get profile of existing user
    ${response}=    GET    url=https://reqres.in/api/users/12    expected_status=200
    Should Be Equal    ${response.json()}[data][id]    ${12}
    Should Be Equal    ${response.json()}[data][email]    rachel.howell@reqres.in
    Should Be Equal    ${response.json()}[data][first_name]    Rachel
    Should Be Equal    ${response.json()}[data][last_name]    Howell
    Should Be Equal    ${response.json()}[data][avatar]    https://reqres.in/img/faces/12-image.jpg





