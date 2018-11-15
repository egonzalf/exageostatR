pipeline {
/*
 * Defining where to run
 */
//// Any:
// agent any
//// By agent label:
//    agent { label 'sandybridge' }

    agent { label 'jenkinsfile' }
    triggers {
        pollSCM('H/15 * * * *')
    }
    environment {
        XX="gcc"
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '50'))
        timestamps()
    }

    stages {
        stage ('build') {
            steps {
                sh '''#!/bin/bash -le
module purge
module load ecrc-extras
module load mkl/2018-update-1
module load gcc/5.5.0
module load pcre
module load r-base/3.5.1-mkl
module load gsl/2.4-gcc-5.5.0
module load nlopt/2.4.2-gcc-5.5.0
module load hwloc/1.11.8-gcc-5.5.0
module load starpu/1.2.6-gcc-5.5.0-mkl-openmpi-3.0.0


module list
set -x

R CMD build .
package=$(ls -rt exa*z | tail -n 1)
R CMD INSTALL ./$package
Rscript tests/test1.R

'''
            }
        }
    }

    // Post build actions
    post {
        //always {
        //}
        //success {
        //}
        //unstable {
        //}
        //failure {
        //}
        unstable {
                emailext body: "${env.JOB_NAME} - Please go to ${env.BUILD_URL}", subject: "Jenkins Pipeline build is UNSTABLE", recipientProviders: [[$class: 'CulpritsRecipientProvider'], [$class: 'RequesterRecipientProvider']]
        }
        failure {
                emailext body: "${env.JOB_NAME} - Please go to ${env.BUILD_URL}", subject: "Jenkins Pipeline build FAILED", recipientProviders: [[$class: 'CulpritsRecipientProvider'], [$class: 'RequesterRecipientProvider']]
        }
    }
}

