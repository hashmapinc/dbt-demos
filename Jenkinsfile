pipeline {
  agent {
    docker {
      args '-u root'
      image 'hashmapinc/python:dbt'
    }
  }
  stages {
    stage('Test and Deploy Models') {
      steps {
        configFileProvider([configFile(fileId: 'dbt-profile-snowflake', variable: 'DBT_PROFILE')]) {
          sh 'cp \$DBT_PROFILE ~/.dbt/'
        }        
        sh 'cd snowflake_tpc_demo'
        sh 'dbt compile'
        sh 'dbt test'       
        sh 'dbt run'
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