NEXUS_BASE_URL=http://$1:8081
ARTIFACT_NAME=$2

ARTIFACT_FILE=$ARTIFACT_NAME.jar

artifact_path=/opt/$ARTIFACT_NAME/$ARTIFACT_FILE

# Remove old artifact file
if [-f "$artifact_path"]; then
    rm "$artifact_path"
    echo "Deleted $artifact_path."
fi

# Download lastest jar
curl -sSL -X GET -G "$NEXUS_BASE_URL/service/rest/v1/search/assets/download" \
    -d repository=spring-petclinic \
    -d maven.artifactId=$ARTIFACT_NAME \
    -d sort=version \
    -d maven.extension=jar \
    -o $artifact_path

# Restart 
sudo systemctl restart petclinic