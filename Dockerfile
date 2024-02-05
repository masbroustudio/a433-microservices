# Menggunakan Node.js versi 14.21-alpine sebagai base image untuk membangun aplikasi kita.
FROM node:14.21-alpine as builder

# Menetapkan /app sebagai direktori kerja di dalam image Docker. Semua perintah berikutnya akan dijalankan relatif terhadap direktori ini.
WORKDIR /app

# Menyalin file package.json dan package-lock.json ke direktori kerja saat ini (/app) di dalam image Docker.
COPY package*.json ./

# Mengonfigurasi npm untuk tidak memeriksa SSL. Ini diperlukan untuk mengakses registry npm jika Anda berada di belakang firewall yang membatasi lalu lintas HTTPS.
RUN npm config set strict-ssl false

# Menginstall dependencies aplikasi yang ditentukan dalam package.json.
RUN npm ci

# Menyalin semua file JavaScript (.js) dari host ke direktori kerja saat ini (/app) di dalam image Docker.
COPY ./*.js ./

# Mengekspos port 3000 dari container ke host, sehingga aplikasi dapat menerima lalu lintas pada port ini.
EXPOSE 3000

# Menentukan perintah yang akan dijalankan secara default saat container Docker dijalankan. Dalam hal ini, kita menjalankan aplikasi Node.js dengan perintah "node index.js".
CMD [ "node", "index.js" ]
