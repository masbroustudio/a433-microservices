# Menggunakan Node.js versi 14 sebagai base image
FROM node:14

# Menetapkan direktori kerja di dalam kontainer menjadi /src
WORKDIR /src

# Menyalin package.json dan package-lock.json ke direktori kerja
COPY package*.json ./

# Menginstal dependensi menggunakan npm
RUN npm install

# Mengunduh skrip wait-for-it.sh dari repositori
RUN wget -O ./wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Membuat skrip wait-for-it.sh dapat dieksekusi
RUN chmod +x ./wait-for-it.sh

# Menyalin file index.js ke direktori kerja
COPY index.js ./

# Menetapkan variabel lingkungan PORT menjadi 3001
ENV PORT=3001

# Mengekspos port yang ditentukan
EXPOSE $PORT

# Mendefinisikan perintah untuk menjalankan aplikasi setelah menunggu RabbitMQ untuk memulai
CMD ["sh", "-c", "./wait-for-it.sh my-rabbitmq:5672 --timeout=30 -- node index.js"]
