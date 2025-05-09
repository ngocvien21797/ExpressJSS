const express = require('express');
const router = express.Router();
const Post = require('../models/Post');
const User = require('../models/User');

// Trang chủ: Hiển thị tất cả bài đăng
router.get('/', async (req, res) => {
    try {
        const posts = await Post.findAll();
        res.render('index', { posts });
    } catch (error) {
        console.error(error);
        res.status(500).send('Server Error');
    }
});
// Trang đăng nhập
router.get('/login', (req, res) => {
    res.render('login');
});

// Trang đăng ký
router.get('/register', (req, res) => {
    res.render('register');
});

// Tìm kiếm user theo username
router.get('/search', async (req, res) => {
    const username = req.query.username;

    if (!username) {
        return res.status(400).send('Vui lòng nhập tên người dùng');
    }

    try {
        const user = await User.findOne({ username });
        if (user) {
            res.render('search-result', { user });
        } else {
            res.render('search-result', { user: null });
        }
    } catch (err) {
        console.error(err);
        res.status(500).send("Lỗi server");
    }
});
module.exports = router;