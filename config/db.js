const mysql = require('mysql2/promise');

// Tạo pool kết nối
const pool = mysql.createPool({
    host: 'localhost',
    port:'3306',
    user: 'root', // Thay bằng username MySQL của bạn
    password: 'vien@2004', // Thay bằng password MySQL của bạn
    database: 'social_media_web', // Tên database của bạn
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

module.exports = pool;