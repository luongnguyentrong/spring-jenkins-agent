#!/bin/bash

while getopts "u:p:b:v:n:r:" opt; do
  case $opt in
    u)
      username="$OPTARG"
      ;;
    p)
      password="$OPTARG"
      ;;
    b)
      branch_name="$OPTARG"
      ;;
    v)
      version="$OPTARG"
      ;;
    n)
      nexus_host="$OPTARG"
      ;;
    r)
      repo="$OPTARG"
      ;;
    *)
      echo "Usage: $0 -u <username> -p <password> -b <branch_name> -v <version> -n <nexus_host> -r <repo>"
      exit 1
      ;;
  esac
done

if [[ -z "$username" || -z "$password" || -z "$branch_name" || -z "$version" || -z "$nexus_host" || -z "$repo" ]]; then
  echo "All arguments are required."
  exit 1
fi

set -e

# Store the first JAR file name in a variable
artifact_jar=$(ls -1 target/*.jar | head -n 1)

# Extract artifact ID from pom.xml
artifact_id=$(grep -m 1 '<artifactId>' pom.xml | sed -n 's/.*<artifactId>\(.*\)<\/artifactId>.*/\1/p')

# Push artifact to Nexus
echo "Pushing artifact to Nexus..."
response_code=$(curl -sSL -w "%{http_code}" -u $username:$password -X 'POST' \
  "http://$nexus_host/service/rest/v1/components?repository=$repo" \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F "maven2.groupId=$branch_name" \
  -F "maven2.artifactId=$artifact_id" \
  -F "maven2.version=$version" \
  -F "maven2.asset1=@$artifact_jar" \
  -F 'maven2.asset1.extension=jar')

if [[ "$response_code" -ne 204 ]]; then
  echo "Error: Response code is not 204"
  echo "Got: $response_code"
  exit 1
fi

echo "Done."

# ./uat_push.sh -u admin -p nexus -b luong -v something -n 172.31.8.23:8081 -r spring-petclinic-uat