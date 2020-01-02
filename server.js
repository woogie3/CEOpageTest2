const fs = require('fs');
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = process.env.PORT || 5000;

const parser = bodyParser.json();
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


app.post(`/api/ticketings/:phone`,(req,res) => {
  let sql = 'SELECT * FROM showdb.ticketing where user_id = (select user_id FROM showdb.user WHERE phone = ?)'
  let params =[req.params.phone];
  connection.query(sql, params,
    (err, rows, fields) => {
    res.send(rows);
    }
  )});

  

app.use('/show_thumbnail', express.static('./upload'));

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



//리뷰 조회
app.get('/api/reviewManagement',(req,res) => {
  connection.query(
    "select s.show_title, t.user_id, r.review_content, r.review_report_yn from ticketing t, review r, `show` s where t.ticketing_id = r.ticketing_id and s.show_id = t.show_id and review_report_yn = 0",
    (err,rows,fields) => {
      res.send(rows);
    }
  );
});


//리뷰 신고
app.delete('/api/reviewManagement/:review_content',(req, res) => {
  let sql = 'UPDATE review SET review_report_yn = 1 WHERE review_content = ?';
  let params = [req.params.review_content];
  connection.query(sql, params,
    (err, rows, fields) => {
      res.send(rows);
    })
});


//극단 조회
app.get('/api/troupManagement',(req,res) => {
  connection.query(
    "select t.user_id, t.troup_name, t.troup_phone, t.bank_name, t.bank_account, t.kakao_account, t.seat_yn, th.troup_id, th.theater_name, th.theater_location, th.latitude, th.longtitude, th.entire_row, th.entire_column from troup t, theater th where t.troup_id = th.troup_id and user_id= 'test02'",
    (err,rows,fields) => {
      res.send(rows);
    }
  );
});



//극단테이블 등록
app.post('/api/troupManagementAdd1',parser,(req,res)=>{
  let sql ='INSERT INTO `troup` VALUES ((select max(troup_id) from troup alias_for_subquery where troup_id = troup_id) +1 , ?, ?, ?, ?, ?, ?, ?)';

  let user_id = req.body.user_id;
  let troup_name = req.body.troup_name;
  let troup_phone = req.body.troup_phone;
  let bank_name = req.body.bank_name;
  let bank_account = req.body.bank_account;
  let kakao_account = req.body.kakao_account;
  let seat_yn = req.body.seat_yn;

  
  let params=[user_id, troup_name, troup_phone, bank_name, bank_account, kakao_account, seat_yn];
  
  connection.query(sql,params,(err,rows,fields) => {
    res.send(rows);
    console.log(err);
  }
  )  
  });

  //극장테이블 등록
  app.post('/api/troupManagementAdd2',parser,(req,res)=>{
    let sql ='INSERT INTO `theater` VALUES ((select max(theater_id) from theater alias_for_subquery where theater_id = theater_id) +1 , ?,  ?,  ?,  ?,  ?,  ?, ?)';
  
    let troup_id = req.body.troup_id;
    let theater_name = req.body.theater_name;
    let theater_location = req.body.theater_location;
    let latitude = req.body.latitude;
    let longittude = req.body.longittude;
    let entire_row = req.body.entire_row;
    let entire_column = req.body.entire_column;
  
    let params=[troup_id, theater_name, theater_location, latitude, longittude, entire_row, entire_column];
    
    connection.query(sql,params,(err,rows,fields) => {
      res.send(rows);
      console.log(err);
    }
    )
    });

    //극단 수정
    app.post('/api/troupManagementUpdate1',(req, res) => {
      let sql = 'update troup set troup_name=  ?, troup_phone= ?, bank_name= ?, bank_account= ?, kakao_account= ?, seat_yn= ? where user_id= "test07"';
      //let params = [req.params.user_id];

      let troup_name = req.body.troup_name;
      let troup_phone = req.body.troup_phone;
      let bank_name = req.body.bank_name;
      let bank_account = req.body.bank_account;
      let kakao_account = req.body.kakao_account;
      let seat_yn = req.body.seat_yn;
      

      let params=[troup_name, troup_phone, bank_name, bank_account, kakao_account, seat_yn];
      connection.query(sql,params,(err,rows,fields) => {
        res.send(rows);
        console.log(err);
      }
      )
      });



    //극장 수정
    app.post('/api/troupManagementUpdate2',(req, res) => {
      let sql = 'update theater set theater_name= ?, theater_location= ?, latitude= ?, longtitude= ?, entire_row= ?, entire_column= ? where theater_name = "별난극단"';
      
      let theater_name = req.body.theater_name;
      let theater_location = req.body.theater_location;
      let latitude = req.body.latitude;
      let longtitude = req.body.longtitude;
      let entire_row = req.body.entire_row;
      let entire_column = req.body.entire_column;
      
      
      
      let params=[theater_name, theater_location, latitude, longtitude, entire_row, entire_column];
      connection.query(sql,params,(err,rows,fields) => {
        res.send(rows);
        console.log(err);
      }
      )
      });


    //상영작 조회
    app.get('/api/showManagement',(req,res) => {
      connection.query(
        "select s.show_title, s.start_date, s.end_date, s.show_preview, s.show_content, s.show_thumbnail, g.genre_name, g.genre_content, sd.show_time, sd.show_length, ap.audience1_price, ap.audience2_price, ap.audience3_price, ap.audience4_price, ap.audience5_price, ap.audience6_price from `show` s, genre g, show_date sd, audience_price ap where s.genre_id = g.genre_id and s.show_id = sd.show_id and s.show_id = ap.show_id and troup_id = '5'",
        (err,rows,fields) => {
          res.send(rows);
        }
      );
    });




    //상영작테이블 등록
    app.post('/api/showManagementAddShow',upload.single('show_thumbnail'),parser,(req,res)=>{
      console.log(req.file);
      let sql ='INSERT INTO `show` VALUES ((select max(show_id) from `show` alias_for_subquery where show_id = show_id) +1 , ?, ?, ?, ?, ?, ?, ?,null)';
    
      let troup_id = req.body.troup_id;
      let genre_id = req.body.genre_id;
      let show_title = req.body.show_title;
      let start_date = req.body.start_date;
      let end_date = req.body.end_date;
      let show_preview = req.body.show_preview;
      let show_content = req.body.show_content;
      let show_thumbnail = '/show_thumbnail/' + req.file.filename;
    
      let params=[troup_id, genre_id, show_title, start_date, end_date, show_preview, show_content, show_thumbnail];
      
      connection.query(sql,params,(err,rows,fields) => {
        res.send(rows);
        console.log(err);
      }
      )
      });

      //장르테이블 등록
      app.post('/api/showManagementAddGenre',parser,(req,res)=>{
        let sql ='INSERT INTO `genre` VALUES ((select max(genre_id) from `genre` alias_for_subquery where genre_id = genre_id) +1 , ?, ?)';
      
        let genre_name = req.body.genre_name;
        let genre_content = req.body.genre_content;
      
        let params=[genre_name, genre_content];
        
        connection.query(sql,params,(err,rows,fields) => {
          res.send(rows);
          console.log(err);
        }
        )
        });

       //공연시간테이블 등록
       app.post('/api/showManagementAddShowDate',parser,(req,res)=>{
        let sql ='INSERT INTO `show_date` VALUES ((select max(show_date_id) from `show_date` alias_for_subquery where show_date_id = show_date_id) +1 ,?,?,?)';
      
        let show_id = req.body.show_id;
        let show_time = req.body.show_time;
        let show_length = req.body.show_length;
      
        let params=[show_id, show_time, show_length];
        
        connection.query(sql,params,(err,rows,fields) => {
          res.send(rows);
          console.log(err);
        }
        )
        });

        //관객유형별공연가격테이블 등록
        app.post('/api/showManagementAddAudiencePrice',parser,(req,res)=>{
          let sql ='INSERT INTO `audience_price` VALUES ((select max(audience_price_id) from `audience_price` alias_for_subquery where audience_price_id = audience_price_id) +1, ?, ?, ?, ?, ?, ?, ?)';
        
          let show_id = req.body.show_id
          let audience1_price = req.body.audience1_price;
          let audience2_price = req.body.audience2_price;
          let audience3_price = req.body.audience3_price;
          let audience4_price = req.body.audience4_price;
          let audience5_price = req.body.audience5_price;
          let audience6_price = req.body.audience6_price;
        
          let params=[show_id, audience1_price, audience2_price, audience3_price, audience4_price, audience5_price, audience6_price];
          
          connection.query(sql,params,(err,rows,fields) => {
            res.send(rows);
            console.log(err);
          }
          )
          });

          //상영작테이블 수정
         app.post('/api/showManagementUpdateShow',(req, res) => {
         let sql = 'update `show` set show_title=  ?, start_date= ?, end_date= ?, show_preview= ?, show_content= ?, thumbnail= ? where show_title= "미녀와야수"';
         //let params = [req.params.user_id];

         let show_title = req.body.show_title;
         let start_date = req.body.start_date;
         let end_date = req.body.end_date;
         let show_preview = req.body.show_preview;
         let show_content = req.body.show_content;
         let thumbnail = req.body.thumbnail;
      

        let params=[show_title, start_date, end_date, show_preview, show_content, thumbnail];
        connection.query(sql,params,(err,rows,fields) => {
        res.send(rows);
        console.log(err);
       }
       )
       });

       //장르테이블 수정
       app.post('/api/showManagementUpdateGenre',(req, res) => {
        let sql = 'update `genre` set genre_name=  ?, genre_content= ? where genre_name= "액션코믹"';
        //let params = [req.params.user_id];

        let genre_name = req.body.genre_name;
        let genre_content = req.body.genre_content;
     

       let params=[genre_name, genre_content];
       connection.query(sql,params,(err,rows,fields) => {
       res.send(rows);
       console.log(err);
      }
      )
      });

      //공연시간테이블 수정
      app.post('/api/showManagementUpdateShowDate',(req, res) => {
        let sql = 'update `show_date` set show_time=  ?, show_length= ? where show_id= "5"';
        //let params = [req.params.user_id];

        let show_time = req.body.show_time;
        let show_length = req.body.show_length;
        
     

       let params=[show_time, show_length];
       connection.query(sql,params,(err,rows,fields) => {
       res.send(rows);
       console.log(err);
      }
      )
      });



      //관객유형별 공연가격테이블 수정
      app.post('/api/showManagementUpdateAudiencePrice',(req, res) => {
        let sql = 'update `audience_price` set audience1_price=  ?, audience2_price= ?, audience3_price= ?, audience4_price= ?, audience5_price= ?, audience6_price= ? where show_id= "5"';
        //let params = [req.params.user_id];

        let audience1_price = req.body.audience1_price;
        let audience2_price = req.body.audience2_price;
        let audience3_price = req.body.audience3_price;
        let audience4_price = req.body.audience4_price;
        let audience5_price = req.body.audience5_price;
        let audience6_price = req.body.audience6_price;
     

       let params=[audience1_price, audience2_price, audience3_price, audience4_price, audience5_price, audience6_price];
       connection.query(sql,params,(err,rows,fields) => {
       res.send(rows);
       console.log(err);
      }
      )
      });

          
          //상영작 삭제
          app.delete('/api/showManagement/:show_title',(req, res) => {
            let sql = 'delete from `show` where show_title = ?';
            let params = [req.params.show_title];
            connection.query(sql, params,
              (err, rows, fields) => {
                res.send(rows);
              })
            });




app.listen(port, () => console.log(`Listening on port ${port}`));