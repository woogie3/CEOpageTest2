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
{/* 예매내역 */}
//조회
app.get('/api/ticketings',(req,res) => {
    connection.query(
      "select u.`name`, t.user_id, s.show_title, sd.show_time, bs.`key`, t.ticketing_date from `ticketing` t join `user` u on t.user_id = u.user_id join `show` s on t.show_id = s.show_id join `show_date` sd on s.show_id = sd.show_id join `book_seat` bs on t.ticketing_id = bs.ticketing_id",
      (err,rows,fields) => {
        res.send(rows);
      }
    );
});

//검색
app.post(`/api/ticketings/:phone`,(req,res) => {
  let sql = 'SELECT * FROM showdb.ticketing where user_id = (select user_id FROM showdb.user WHERE phone = ?)'
  let params =[req.params.phone];
  connection.query(sql, params,
    (err, rows, fields) => {
    res.send(rows);
    }
  )});

  // id삭제버튼 클릭시
  app.delete('/api/ticketings/:id', (req, res) => {
    let sql = 'UPDATE user SET isDeleted = 1 WHERE id = ?';
    let params = [req.params.id];
    connection.query(sql, params,
    (err, rows, fields) => {
    res.send(rows);
    }
  )
  });
// 계정생성 
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

{/* 환불내역 */}
//조회

app.listen(port, () => console.log(`Listening on port ${port}`));