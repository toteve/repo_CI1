pipeline {
    agent any
    environment {
        NODE_VERSION = '18' // Cambia si usas otra versión de Node.js
    }

    stages {

        stage('Checkout') {
            steps {
                echo "*** Stage Checkout: Clonando el repositorio..."
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    try {
                        echo "*** Stage Build: Instalando dependencias y Build..."
                        bat 'npm install'
	                    bat 'npm run build'
                    } catch (Exception e) {
                        error("❌ Error en la etapa de Build")
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    try {
                        echo "*** Stage Test: Ejecutando pruebas..."
                        bat 'npm run test'
                    } catch (Exception e) {
                        error("❌ Error en la etapa de Test")
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    try {
                        echo "*** Stage Deploy: Desplegando aplicación..."
                        bat 'timeout 60s npm start'  // Ejecuta npm start durante 60 segundos y luego lo termina
                        //bat 'npm start &'
                    } catch (Exception e) {
                        error("❌ Error en la etapa de Deploy")
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completado con éxito"
        }
        failure {
            echo "❌ El pipeline ha fallado"
        }
    }
}
