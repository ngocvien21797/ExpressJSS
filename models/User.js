const pool = require('../config/db');

class User {
    static async findAll() {
        const [rows] = await pool.query('SELECT id, username, role, created_at, avatar_url FROM users');
        return rows;
    }

    static async findById(id) {
        const [rows] = await pool.query('SELECT id, username, role, created_at, avatar_url FROM users WHERE id = ?', [id]);
        return rows[0];
    }

    static async findByUsername(username) {
        const [rows] = await pool.query('SELECT * FROM users WHERE username LIKE ?', [`%${username}%`]);
        return rows;
    }
}

module.exports = User;