# A Simple spring boot project to practice jenkins pipeline and monitoring stack (Thanos, Grafana, ELK)
This is a typical spring boot application which i use to learn about jenkins and monitoring stacks to monitor spring applications. 
The jenkins file is in  [Jenkinsfile](https://github.com/luongnguyentrong/spring-jenkins-agent/blob/main/Jenkinsfile) which composes of different shared library ('scan-code-library', 'build-code-library', 'pipeline-scripted-library', 'deploy-code-library')

## Main Pipeline

<p align="center">
    <img src="img/spring-jenkins-agent.drawio.html">
</p>