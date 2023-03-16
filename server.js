// Require packages
const express = require('express');
const mysql = require('mysql');
// const bodyParser = require('body-parser');
// const cors = require('cors');
// Initialize express
const app = express();
app.use(express.json());

// Middleware
// app.use(cors());
// app.use(bodyParser.json());

// Create connection to database
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'member_database',
  port: '3306',
});

// Connect to database
db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('MySQL Connected...');
});


// Create routes
app.post('/create', async (req, res) => {
    const {email, username, password} = req.body;
    try{
      connection.query("INSERT INTO user(email, username, password) VALUES(?, ?, ?)", [email, username, password], function (err, result, fields) {
        if (err) {
          console.log("Error while inserting a user into the database", err);
          return res.status(400).send();
        }
        return res.status(201).json({message: "New user successfully created"});
      }
      )
    } catch (err) {
      console.log(err);
      return res.status(500).send();
    }})

app.get('/read', async (req, res) => {
    try{
      connection.query("SELECT * FROM user", (err, results, fields) => {
        if (err) {
          console.log(err);
          return res.status(400).send();
        }
        return res.status(200).json(results)
      }
      )
    } catch (err) {
      console.log(err);
      return res.status(500).send();
    }}

)

app.get('/read/single/:email', async (req, res) => {
  const {email} = req.params.email;
  try{
    connection.query("SELECT * FROM user WHERE email = ?", (err, results, fields) => {
      if (err) {
        console.log(err);
        return res.status(400).send();
      }
      return res.status(200).json(results)
    }
    )
  } catch (err) {
    console.log(err);
    return res.status(500).send();
  }}

)

app.patch('/update/:email', async (req, res) => {
    const {email} = req.params.email;
    const newPassword = req.body.newPassword;
    const newPhone = req.body.newPhone;
    const firstname = req.body.firstname;
    const lastname = req.body.lastname;

    try{ 
      connection.query("UPDATE user SET password = ?, phone = ?, firstname = ?, lastname = ? WHERE email = ?", [newPassword, newPhone, firstname, lastname, email], (err, results, fields) => {
        if (err) {
          console.log(err);
          return res.status(400).send();
        }
        return res.status(200).json({message: "User successfully updated"})
      }
      )
    } catch (err) {
      console.log(err);
      return res.status(500).send();
    }
})

app.delete('/delete/:email', async (req, res) => {
      const email = req.body.email;

      try{
        connection.query("DELETE FROM user WHERE email = ?", [email], (err, results, fields) => {
          if (err) {
            console.log(err);
            return res.status(400).send();
          }
          return res.status(200).json({message: "User successfully deleted"})
        }
        )
      } catch (err) {
        console.log(err);
        return res.status(500).send();
      }
}
)

// Start server 
app.listen('3000', () => {
  console.log('Server started on port 3000');
});