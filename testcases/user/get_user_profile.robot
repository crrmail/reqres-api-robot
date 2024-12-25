*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}=    https://reqres.in/api/users/

*** Test Cases ***
Get user profile success
    [Documentation]    To verify get user profile api will return correct data when trying to get profile of existing user
    ${user_profile_success_url}=    Catenate  ${URL}    12
    ${response}=    GET    url=${user_profile_success_url}    expected_status=200
    Should Be Equal    ${response.json()}[data][id]    ${12}
    Should Be Equal    ${response.json()}[data][email]    rachel.howell@reqres.in
    Should Be Equal    ${response.json()}[data][first_name]    Rachel
    Should Be Equal    ${response.json()}[data][last_name]    Howell
    Should Be Equal    ${response.json()}[data][avatar]    https://reqres.in/img/faces/12-image.jpg

Get user profile but user not found
    [Documentation]    To verify get user profile api will return 404 not found when trying to get exist profile of not existing user
    ${user_profile_not_found_url}=    Catenate  ${URL}    1234
    ${response}=    GET    url=${user_profile_not_found_url}    expected_status=404
    Should Be Empty    ${response.json()}
