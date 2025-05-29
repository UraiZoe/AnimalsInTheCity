const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
app.use(cors());
app.use(bodyParser.json());

//Adatbázis hozzá csatolása
const db = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: '',
  database: 'varosvilag',
  port:3306
});

db.connect((err) => {
  if (err) {
    console.error('Adatbázis csatlakozása sikertelen. Ez a hiba:', err.stack);
    return;
  }
  console.log('Csatlakozott az adatbázis!');
});

// Visszaadja minden faj adatait
app.get('/species', (req, res) => {
  const sql = 'SELECT species_id, latin_name, hungarian_name, family, state FROM species';
  db.query(sql, (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Adatbázis hiba' });
    }
    res.json(results);
  });
});

//Visszaadja a kontinensek listáját
app.get('/continents', (req, res) => {
  const sql = 'SELECT continent_id, name FROM Continents';
  db.query(sql, (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Adatbázis hiba' });
    }
    res.json(results);
  });
});

//Új faj hozzáadása
app.post('/newSpecies', (req, res) => {
  const { latin_name, hungarian_name, family, state } = req.body;
  const sql = 'INSERT INTO species (latin_name, hungarian_name, family, state) VALUES (?, ?, ?, ?)';
  db.query(sql, [latin_name, hungarian_name, family, state], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Adatbázis hiba' });
    }
    res.status(201).json({ species_id: result.insertId });
  });
});


const PORT = 3001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});