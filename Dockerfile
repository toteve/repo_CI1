# Imagen base de Node.js
FROM node:18
# Establecer directorio de trabajo en el contenedor
WORKDIR /app1
# Copiar archivos del proyecto
COPY package.json package-lock.json ./
RUN npm install
# Copiar el resto del código
COPY . .
# Exponer el puerto 3000
EXPOSE 3000
# Comando para iniciar la aplicación
CMD ["npm", "start"] 