const express = require('express');
const router = express.Router();
const pool = require('../config/db'); // Đảm bảo bạn yêu cầu pool đúng cách từ file cấu hình DB

// Route tìm kiếm người dùng
router.get('/search', async (req, res) => {
    const username = req.query.username;

    if (!username) {
        return res.render('search-result', { users: [], error: 'Vui lòng nhập tên người dùng' });
    }

    try {
        const [rows] = await pool.query('SELECT * FROM users WHERE username LIKE ?', [`%${username}%`]);

        if (rows.length > 0) {
            res.render('search-result', { users: rows, error: null });
        } else {
            res.render('search-result', { users: [], error: 'Không tìm thấy người dùng' });
        }
    } catch (err) {
        console.error('Lỗi tìm kiếm người dùng:', err);
        res.status(500).send('Lỗi server');
    }
});

module.exports = router;
