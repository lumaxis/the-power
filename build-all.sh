normal=$(tput sgr0)
highlight=$(tput setaf 2)

printf "$highlight"

cat << EOF

  ________            ____
 /_  __/ /_  ___     / __ \____ _      _____  _____
  / / / __ \/ _ \   / /_/ / __ \ | /| / / _ \/ ___/
 / / / / / /  __/  / ____/ /_/ / |/ |/ /  __/ /
/_/ /_/ /_/\___/  /_/    \____/|__/|__/\___/_/

EOF

printf "${normal}"

   printf "${highlight} - Creating organization: ${normal}"
    ./create-organization.sh | jq -r '.url'
   printf "${highlight} - Creating organization webhook: ${normal}"
    ./create-an-organization-webhook.sh | jq -r '.id'
   printf "${highlight} - Creating team:${normal}\n"
   ./create-team.sh | jq -r '.html_url'
   printf "${highlight} - Creating users:${normal}\n"
   ./pwr-create-users.sh
   printf "${highlight} - Creating org members:${normal}\n"
   ./pwr-create-org-members.sh 
   printf "${highlight} - Adding users to team:${normal}\n"
   ./pwr-add-users-to-team.sh | jq -r '.url'
   printf "${highlight} - Adding maintainers to team:${normal}\n"
   ./add-maintainers-to-team.sh | jq -r '.url'
   printf "${highlight} - Creating repo: ${normal}"
    ./create-repo-testrepo.sh | jq -r '.html_url'
    ./add-team-to-repo.sh
   printf "${highlight} - Creating webhook: ${normal}"
    ./create-webhook.sh  | jq -r '.id'
   printf "${highlight} - Creating docs/README: ${normal}"
    ./create-commit-readme.sh | jq -r ".content.html_url"
   printf "${highlight} - Creating CODEOWNERS: ${normal}"
    ./create-commit-codeowners.sh| jq -r ".content.html_url"
   printf "${highlight} - Creating requirements.txt: ${normal}"
    ./create-commit-python-pip.sh| jq -r ".content.html_url"
    sleep 2.5
   printf "${highlight} - Creating new branch: ${normal}"
    ./create-branch-newbranch.sh | jq -r '.url'
   printf "${highlight} - Creating a commit on the new branch: ${normal}"
    ./create-commit-on-new-branch.sh | jq -r ".content.html_url"
   printf "${highlight} - Creating an issue: ${normal}"
    ./create-repo-issue.sh | jq -r '.html_url'
   printf "${highlight} - Creating a pull request: ${normal}"
    ./create-pull-request.sh | jq -r '.html_url'
    # set the branch protection rules for main
   printf "${highlight} - Setting branch protection rules on default branch: ${normal}"
    ./set-branch-protection.sh | jq -r '.url'
   printf "${highlight} - Creating a release: ${normal}"
    ./create-release.sh  | jq -r '.url'
   printf "${highlight} - Adding a .gitattributes file to new branch: ${normal}"
    ./create-commit-gitattributes.sh | jq -r ".content.html_url"
