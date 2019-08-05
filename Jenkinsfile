pipeline {
  agent {
    docker {
      args '-u root'
      image 'hashmapinc/python:dbt'
    }
  }
  stages {
    stage('Setting up Profile'){
        steps{
            sh 'mkdir ~/.dbt'
            withCredentials([file(credentialsId: 'dbt-profile-snowflake', variable: 'DBT_PROFILE')]) {
            sh 'cp \$DBT_PROFILE ~/.dbt'
            }             
        }
    }
    stage('Compile and Test') {
      steps {
        sh '''cd snowflake_tpc_demo
                dbt compile       
                dbt test'''
      }
    }
    stage('Transformation') {
      steps {
        sh '''cd snowflake_tpc_demo
                dbt run'''
      }
    }    
  }
  options {
    timeout(time: 1, unit: 'HOURS')
  }
  post {
    always {
      sh 'chmod -R 777 .'
    }
  }
}