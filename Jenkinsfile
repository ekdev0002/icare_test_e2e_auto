def formatDate(timestamp) {
    def date = new Date(timestamp)
    return date.format("dd/MM/yyyy HH:mm")
}

pipeline {
  agent {
    docker { 
      image "yabyoure/rbdockerimage:latest"
			args "-e TZ=Europe/Paris --user 0:0 --memory 2048mb --shm-size 3g"
    }
  }

 
  stages {
    stage('Install Libraries') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          // catchError allow to execute next stage even if current stage is in failure
          sh '''
            # Install libraries
          '''
        }
      }
    }

    stage('Execute Tests') {
          steps {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
              sh '''
                # Launch Robot Tests
                robot --pythonpath libraries --variablefile configurations/remote_chrome.py --log log.html --output output.xml --report report.html cases/*
              '''
            }
          }
        }

    stage('Publish results') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
					script {
            step([
              $class : 'RobotPublisher',
              outputPath : '',
              outputFileName : "output.xml",
              disableArchiveOutput : false,
              passThreshold : 100,
              unstableThreshold: 95.0,
              otherFiles : "*.png",
              logFileName: 'log.html', 
              reportFileName: 'report.html'
            ])
          }
        }
      }
    }

    stage('Creates custom HTML report') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          // Creates custom HTML report with robotmetrics
          sh '''
            robotmetrics --output output.xml --metrics-report-name metrics.html
          '''
        }
      }
    }
  }

  post {
    always {

      archiveArtifacts artifacts: '*.html, *.xml, *.png', fingerprint: true
       emailext to: "yabyourekabore@gmail.com sanourarouna90@gmail.com arouna.sanou@nest.sn ali.nakoulima@gmail.com lauriane.leflour@nest.sn",
       subject: "[ICARE][Test AUTO][${currentBuild.result}] Build #${BUILD_NUMBER}" +
       '(${ROBOT_PASSED}/${ROBOT_TOTAL} ok)',
       body:    '<!DOCTYPE html><html><head><style>table,th,td{border: 1px solid black; border-collapse: collapse; width:300px} td{text-align:center; width:20%}</style></head><body>'+
       "Bonjour,<br/><br/>"+ 
       "<h2>Rapport d'exécution des tests automatisés du projet ICARE :</h2>"+
       "<u>Nom du Job :</u> ${JOB_NAME}<br/>"+
       "<u>Statut :</u> ${currentBuild.result}<br/><br/>"+
       "Date d'exécution : ${formatDate(currentBuild.timeInMillis)}<br/>"+
       "Durée totale du build : ${currentBuild.durationString}<br/>"+
       "URL du dernier build : ${BUILD_URL}<br/>"+
       "Logs disponibles ici : <a href='${BUILD_URL}artifact/log.html'>log.html</a><br/>"+
       "Rapport d'exécution : <a href='${BUILD_URL}artifact/report.html'>report.html</a><br/>"+
       "Métriques globales : <a href='${BUILD_URL}artifact/metrics.html'>metrics.html</a><br/>"+
       "<br/>"+
       "<h2>Détail des résultats de l'exécution sur l'environnement des tests automatisés :</h2>"+
       '<table><tr><td></td><th>Total</th><th>Passed</th><th>Failed</th><th>Pass %</th></tr><tr><th>Tests</th><td>${ROBOT_TOTAL}</td><td style="color:green">${ROBOT_PASSED}</td><td style="color:red">${ROBOT_FAILED}</td><td>${ROBOT_PASSPERCENTAGE}%</td></tr></table><br>' +
       '<h2>Tests en échec (le cas échéant) :</h2><div style="white-space:pre">${ROBOT_FAILEDCASES}</div><br>'+
       "Cordialement,<br/>"+
       "L'équipe de test",
       from: "noreply.contenulocal@dgh.ci",
       mimeType: "text/html"
 
      cleanWs()
    }
  }
}
