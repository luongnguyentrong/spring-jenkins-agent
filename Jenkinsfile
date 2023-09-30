// node {
//     @Library(['pipline-scripted-library', ]) _

//     try {
//         scripted()

//         // tag the current successfull version
//         // tag(env.BRANCH_NAME)
//     } catch (e) {

//         // If there was an exception thrown, the build failed
//         echo "Error: ${e}"
//         currentBuild.result = "FAILED"
//         throw e
//     } finally {
//         // Success or failure, always send notifications
//         sendEmail(currentBuild.currentResult, ["luong.nguyencs_student@hcmut.edu.vn"])
//     }
// }

// def tag(String branch_name) {
//     def formattedDate = new Date().format('yyMMdd')

//     def tagName = ""
//     if (branch_name == "main") {
//         tagName = "${formattedDate}-uat-release"
//     } else if ((env.BRANCH_NAME =~ '^uat\\/\\w+$').matches()) {
//         def git_commit = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)

//         tagName = "${formattedDate}-uat-${git_commit}"
//     }

//     // Tag the repository
//     sh "git tag ${tagName}"

//     withCredentials([gitUsernamePassword(credentialsId: 'gitlab-credentials')]) {
//         sh "git push origin ${tagName}"
//     }
// }

node {
    stage("TEST") {
        sh "ls"
    }
}