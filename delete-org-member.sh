. .gh-api-examples.conf

# https://docs.github.com/en/rest/reference/orgs#remove-an-organization-member
# DELETE /orgs/:org/members/:username

org=${1:-$org}
username=${2}

curl ${curl_custom_flags} \
     -X DELETE \
     -H "Accept: application/vnd.github.v3+json" \
     -H "Authorization: Bearer ${GITHUB_TOKEN}" \
        ${GITHUB_API_BASE_URL}/orgs/${org}/members/${username}
