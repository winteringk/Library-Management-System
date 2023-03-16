// Require packages
const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

// Create connection to database
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'example_db'
});

// Connect to database
db.connect((err) => {
  if (err) throw err;
  console.log('Connected to database');
});

// Create express app
const app = express();

// Use middleware
app.use(bodyParser.json());
app.use(cors());

// Fetch data
app.get('/data', (req, res) => {
  const sql = 'SELECT * FROM example_table';

  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// Post data
app.post('/data', (req, res) => {
  const { name, email } = req.body;
  const sql = `INSERT INTO example_table (name, email) VALUES ('${name}', '${email}')`;

  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// Start server
app.listen(3000, () => {
  console.log('Server started on port 3000');
});