bash# First make sure you're authenticated
gh auth login

# Then set the secrets
gh secret set RANCHER_HOST -b""
gh secret set RANCHER_ADMIN_TOKEN -b""
gh secret set CLUSTER_NAME -b""