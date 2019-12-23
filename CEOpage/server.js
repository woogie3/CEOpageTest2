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
      "select u.`name`, t.user_id, u.phone, s.show_title, sd.show_time, bs.`key`, t.ticketing_date from `ticketing` t left join `user` u on t.user_id = u.user_id left join `show` s on t.show_id = s.show_id left join `show_date` sd on s.show_id = sd.show_id left join `book_seat` bs on t.ticketing_id = bs.ticketing_id",
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
// 조회
app.get('/api/refunds',(req,res) => {
  connection.query(
    "select t.user_id, u.`name`, s.show_title, sd.show_time, t.ticketing_id, t.payment_type, r.reason_type, u.phone from `show` s left join ticketing t on s.show_id = t.show_id left join `user` u on t.user_id = u.user_id left join reason r on r.reason_id = t.reason_id left join show_date sd on sd.show_id = t.show_id where t.refund_flag='yes'",
    (err,rows,fields) => {
      res.send(rows);
    }
  );
});
// 환불 입력
app.post('/api/refunds/:id', (req, res) => {
  let sql = 'UPDATE ticketing t inner join book_seat bs on bs.ticketing_id = t.ticketing_id set t.refund_flag = \'yes\', t.refund_date = sysdate(), t.refund_apply_date = sysdate(), bs.row = null, bs.column = null where t.ticketing_id = ?';
  let params = [req.params.id];
  connection.query(sql, params,
  (err, rows, fields) => {
  res.send(rows);
  }
)
});


app.listen(port, () => console.log(`Listening on port ${port}`));