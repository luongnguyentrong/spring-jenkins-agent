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

// podTemplate(yaml: readTrusted('pod.yml')) {
//   node(POD_LABEL) {
//     container("maven") {
//       checkout scm
//       sh "mvn --version"
//       sh "ls"
//     }
//     stage("TEST") {
//       sleep(time: 3600, unit: 'SECONDS')
//     }
//   }
// }

podTemplate(yaml:'''
              spec:
                imagePullSecrets:
                - name: luongntd1-nexus-docker
                containers:
                - name: jnlp
                  image: jenkins/inbound-agent
                  volumeMounts:
                  - name: home-volume
                    mountPath: /home/jenkins
                  env:
                  - name: HOME
                    value: /home/jenkins
                - name: maven
                  image: docker.luongntd1.lab.ocp.lan/maven:3.9.4
                  command:
                  - sleep
                  args: 
                  - 99d
                  volumeMounts:
                  - name: home-volume
                    mountPath: /home/jenkins
                  env:
                  - name: HOME
                    value: /home/jenkins
                  - name: MAVEN_OPTS
                    value: -Duser.home=/home/jenkins
                volumes:
                - name: home-volume
                  emptyDir: {}
''') {
  node(POD_LABEL) {
    stage('Build a Maven project') {
      container('maven') {
        checkout scm
        sleep(time: 3600, unit: 'SECONDS')
      }
    }
  }
}