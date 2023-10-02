env.NEXUS_HOST = "nexus.ducluong.co"

env.NEXUS_DOCKER_UAT = "10.98.86.30:8082"
env.NEXUS_DOCKER_MAIN = "${NEXUS_HOST}:9001"

env.DEPLOY_HOST = "deploy.ducluong.co"

env.NEXUS_URL = "${NEXUS_HOST}:8081"

env.MAIN_BRANCH_REPO = "spring-petclinic-main"
env.UAT_BRANCH_REPO = "spring-petclinic-uat"