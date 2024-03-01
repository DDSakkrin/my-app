# เลือก image ของ PHP พร้อม Apache
FROM php:7.4-apache

# สร้างโฟลเดอร์เพื่อเก็บโค้ดของเราใน container
WORKDIR /var/www/html

# คัดลอกไฟล์โค้ดของเราไปยัง container
COPY ./html/ .

# เปิด mod_rewrite สำหรับการใช้งาน RewriteEngine ใน .htaccess
RUN a2enmod rewrite

# เปิดพอร์ต 8080 สำหรับ Apache
EXPOSE 8080

# ตั้งค่า timezone ให้เป็น Asia/Bangkok หรือใส่ timezone ที่ต้องการ
RUN ln -snf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime && echo Asia/Bangkok > /etc/timezone

# คำสั่งเริ่มต้น Apache เมื่อ container เริ่มทำงาน
CMD ["apache2-foreground"]
