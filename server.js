const fs = require('fs');
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const cors = require("cors");


const port = process.env.PORT || 5000;
const parser = bodyParser.json();
app.use(parser);
app.use(cors());
app.use(bodyParser.urlencoded({ extended:true }));

const Users = require("./routes/Users");
app.use("/users", Users);

const data = fs.readFileSync('./database.json');
const conf = JSON.parse(data);
const mysql = require('mysql');

const multer = require('multer');
const upload = multer({dest: './upload'})

const db = {
  host: conf.host,
  user: conf.user,
  password:conf.password,
  port:conf.port,
  database: conf.database
};

const connection = mysql.createConnection(db);
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

//회원가입, 로그인
// 세션 설정
// app.use(session({ 
//   secret: '!@#$%^&*',
//   store: new MySQLStore(db),
//   resave: false,
//   saveUninitialized: true  //초기화하지 않는걸 저장
// }));
// app.use(passport.initialize()); // 패스포트 모듈에서 초기화 사용
// app.use(passport.session());    // 패스포트 모듈에서 세션 사용

// passport.use(new LocalStrategy(
//   function(user_id, password, done){
//     let sql = 'SELECT * FROM user WHERE user_id=?';
//     connection.query(sql, [user_id], (err, results) => {
//       if(err) return done(err);
//       if(!results[0]) return done('아이디가 맞지 않습니다.');

//       let user = results[0];
//       crypto.pbkdf2(password, user.salt, 100000, 64, 'sha512', (err, derivedKey) => {
//         if(err) return done(err);
//         if(derivedKey.toString('hex') === user.password){
//           return done(null, user);
//         } else {
//           return done('비밀번호를 확인하세요.');
//         }
//       }); //pbkdf2
//     });   //query
//   }
// ));

// passport.serializeUser((user, done) => {
//   done(null, user.id);
// });
// passport.deserializeUser((id, done) => {
//   let sql = 'SELECT * FROM user WHERE id=?';
//   connection.query(sql, [id], (err, results) => {
//     if(err) return done(err, false);
//     if(!results[0]) return done(err, false);
//     return done(null, results[0]);
//   });
// });

// app.get('/register', (req,res) => {
//   res.render('register');
// });
// app.get('/', (req,res) => {
//   if(!req.user){
//     res.render('/login');
//   } else {
//     res.redirect('/welcome');
//   }
// });
// app.get('/welcome', (req,res) => {
//   if(!req.user){
//     return res.redirect('/login');
//   } else {
//     res.render('welcome', {name: req.user.name});
//   }
// });
// app.get('/logout', (req,res) => {
//   req.logout();
//   res.redirect('/');
// });

// app.get('/login', (req,res) => {
//   if(!req.user){
//     res.render('login', {message : '아이디와 비밀번호를 입력하세요.'});
//   } else {
//     res.redirect('/welcome');
//   }
// });
// app.post('/login', passport.authenticate('local', {
//   successRedirect: '/welcome',
//   failureRedirect: '/login',
//   failureFlash: false
//   })
// );

// router.post('/register', parser, (req, res) => {
//   let usernameRegex = /^[a-z0-9]+$/;

//   if(!usernameRegex.test(req.body.username)) {
//     return res.status(400).json({
//       error: "아이디 형식이 맞지 않습니다.",
//       code: 1
//     });
//   }

//   let userExist = () => {
//     let sql = "SELECT user_id FROM user";
//     connection.query(sql, (err, results) =>{
//       if(err) {
//         res.send(err);
//       } else {
//         return results;
//       }
//     });
//   }

//   if(req.body.password.length < 4 || typeof req.body.password !== "string") {
//     return res.status(400).json({
//       error: "비밀번호 형식이 맞지 않습니다."
//     });
//   }

//   if(userExist.find(req.body.user_id)) {
//     (err, exists) => {
//       if(err) throw err;
//       if(exists) {
//         return res.status(409).json({
//           error: "이미 사용중인 계정입니다.",
//           code: 3
//         });
//       }
//     }
//   } else {
//     hasher({password: req.body.password}, (err, pass, salt, hash) => {
//       let sql = "INSERT INTO user(user_id, funnel_id, password) VALUES(?,1,?)";
//       let user_id = req.body.user_id;
//       let password = hash;
//       let params = [user_id, password];
//       console.log(params);
//       connection.query(sql, params, (err, rows, fields) => {
//         if(err) {
//           res.send(err);
//           console.log(err);
//         } else {
//           res.send(rows);
//           console.log(rows);
//         }
//       });
//     });
//   }
  
// })





app.listen(port, () => console.log(`Listening on port ${port}`));
