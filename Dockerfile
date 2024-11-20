# Imagen base
FROM node:23.1-slim

# Especificar el directorio de trabajo en la imagen docker
WORKDIR /app

# Copiar los fichero del proyecto
# Empezamos por los que cargan las dependencias

COPY package*.json ./

# Ahora necesitamos obtener los módulos

RUN npm install \
&& npm cache clean --force \
&& rm -rf /tmp/* /root/.npm/_cacache

# Copiar el directorio de la aplicación

COPY . .

# Exponer el puerto que usa la aplicación
EXPOSE 8000

# Ejecuta la aplicación

CMD ["npm", "start"]

# Ja es pot executar amb
# docker build -t node-game .






