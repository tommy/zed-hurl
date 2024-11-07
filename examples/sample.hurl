# Check search API:
GET http://localhost:3000/api/search
[QueryStringParams]
q: 1982
sort: name

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$" count == 5
jsonpath "$[0].name" == "Blade Runner"
jsonpath "$[0].director" == "Ridley Scott"
jsonpath "$[0].release_date" == "1982-06-25"

# First GET request to get CSRF token value:
GET https://example.org
HTTP 200
# Capture the CSRF token value from html body.
[Captures]
csrf_token: xpath "normalize-space(//meta[@name='_csrf_token']/@content)"

# Do the login !
POST https://acmecorp.net/login?user=toto&password=1234
X-CSRF-TOKEN: {{csrf_token}}
HTTP 302
