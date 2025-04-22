# GitHub API requires a Personal Access Token with appropriate permissions
# Replace these variables with your values
GITHUB_TOKEN="your_personal_access_token"
REPO_OWNER="your_username_or_org_name"
REPO_NAME="your_repo_name"

# Set RANCHER_HOST secret
curl -X PUT \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/actions/secrets/RANCHER_HOST \
  -d "{\"encrypted_value\":\"$(echo -n 'your_rancher_host_value' | base64)\", \"key_id\":\"$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/actions/secrets/public-key | jq -r .key_id)\"}"

# Set RANCHER_ADMIN_TOKEN secret
curl -X PUT \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/actions/secrets/RANCHER_ADMIN_TOKEN \
  -d "{\"encrypted_value\":\"$(echo -n 'your_admin_token_value' | base64)\", \"key_id\":\"$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/actions/secrets/public-key | jq -r .key_id)\"}"

# Set CLUSTER_NAME secret
curl -X PUT \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/actions/secrets/CLUSTER_NAME \
  -d "{\"encrypted_value\":\"$(echo -n 'your_cluster_name_value' | base64)\", \"key_id\":\"$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/actions/secrets/public-key | jq -r .key_id)\"}"