. .gh-api-examples.conf

# https://docs.github.com/en/rest/reference/activity#notifications
# GET /users/{username}/received_events

curl ${curl_custom_flags} \
     -H "Accept: application/vnd.github.v3+json" \
     -H "Authorization: Bearer ${GITHUB_TOKEN}" \
        ${GITHUB_API_BASE_URL}/users/${U}/received_events
