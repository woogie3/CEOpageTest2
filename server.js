const fs = require('fs');
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = process.env.PORT || 5000;
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended:true }));

const data = fs.readFileSync('./database.json');
const conf = JSON.parse(data);
const mysql = require('mysql');

const multer = require('multer');
const upload = multer({dest: './upload'})

const connection = mysql.createConnection({
  host: conf.host,
  user: conf.user,
  password:conf.password,
  port:conf.port,
  database: conf.database
});
connection.connect();
//조회

app.get('/api/ticketings',(req,res) => {
    connection.query(
      "SELECT * FROM Ticketing",
      (err,rows,fields) => {
        res.send(rows);
      }
    );
});

app.get('/api/reviewManagement',(req,res) => {
  connection.query(
    "select s.show_title, t.user_id, r.review_content, r.review_report_yn from ticketing t, review r, `show` s where t.ticketing_id = r.ticketing_id and s.show_id = t.show_id and review_report_yn = 0",
    (err,rows,fields) => {
      res.send(rows);
    }
  );
});


app.post(`/api/ticketings/:phone`,(req,res) => {
  let sql = 'SELECT * FROM showdb.ticketing where user_id = (select user_id FROM showdb.user WHERE phone = ?)'
  let params =[req.params.phone];
  connection.query(sql, params,
    (err, rows, fields) => {
    res.send(rows);
    }
  )});

  

app.use('/image',express.static('./upload'));

app.post('/api/ticketings', upload.single('image'),(req,res) => {
  let sql = 'INSERT INTO user VALUES (null,?,?,?,?,?,now(),0)';
  let image = '/image/' + req.file.filename;
  let name = req.body.name;
  let birthday = req.body.birthday;
  let gender = req.body.gender;
  let job = req.body.job;
  let params = [image,name,birthday,gender,job];
  connection.query(sql,params,
      (err,rows,fields) => {
        res.send(rows);
      }
    );
});



app.delete('/api/reviewManagement/:review_content',(req, res) => {
  let sql = 'UPDATE review SET review_report_yn = 1 WHERE review_content = ?';
  let params = [req.params.review_content];
  connection.query(sql, params,
    (err, rows, fields) => {
      res.send(rows);
    })
});

app.listen(port, () => console.log(`Listening on port ${port}`));