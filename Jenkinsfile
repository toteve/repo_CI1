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
                        echo "*** Stage Deploy: Generar y Ejecutar imagen Docker..."
                        // bat 'npm start &'
                        bat 'docker build -t myapp .'
                        bat 'docker run -d -p 3000:3000 myapp'
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
            echo "🚀 Aplicación desplegada en http://localhost:3000"
        }
        failure {
            echo "❌ El pipeline ha fallado"
        }
    }
}
