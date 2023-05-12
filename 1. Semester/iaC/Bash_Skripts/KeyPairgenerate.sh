#ssh-keygen -t rsa -N "" -f /tmp/iackey
ssh-keygen -t rsa -N "" -f /tmp/gitlabkey
sed 's/^/    /g' /tmp/gitlabkey > /tmp/gitlabkey.mod
#GITLAB_TOKEN="glpat-31uWYjAniRyycmKmC2jM"
#curl -X POST -F "private_token=$GITLAB_TOKEN" -F "usage_type=auth" -F "title=IacTest" -F "key=$(cat /tmp/iackey.pub)" "https://gitlab.com/api/v4/user/keys"