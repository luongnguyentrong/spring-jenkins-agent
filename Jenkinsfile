podTemplate(yaml: readTrusted('pod.yml')) {
  node(POD_LABEL) {
    @Library(['scan-code-library', 'build-code-library', 'pipline-scripted-library', 'deploy-code-library']) _

    try {
        scripted()

        // tag the current successfull version
        // tag(env.BRANCH_NAME)
    } catch (e) {

        // If there was an exception thrown, the build failed
        echo "Error: ${e}"
        currentBuild.result = "FAILED"
        throw e
    } finally {
        // Success or failure, always send notifications
        sendEmail(currentBuild.currentResult, ["luong.nguyencs_student@hcmut.edu.vn"])
    }
  }
}
    // stage('Build a Maven project') {
    //   container('maven') {
    //     checkout scm
    //     sleep(time: 3600, unit: 'SECONDS')
    //   }
    // }