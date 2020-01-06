-- <create>
CREATE TABLE `user` (
	`user_id`	varchar(30)	NOT NULL,
	`funnel_id`	int(5)	NOT NULL,
	`name`	varchar(20)	NULL,
	`password`	varchar(200)	NULL,
	`identification_number`	varchar(13)	NULL,
	`email`	varchar(100)	NULL,
	`role`	varchar(20)	NULL,
	`phone`	char(11)	NULL,
	`message_yn`	tinyint(1)	NULL,
	`dislike_genre`	varchar(500)	NULL,
	`wishlist`	varchar(500)	NULL,
	`join_date`	date	NULL
);

CREATE TABLE `genre` (
	`genre_id`	int(5)	NOT NULL,
	`genre_name`	varchar(30)	NULL,
	`genre_content`	varchar(500)	NOT NULL
);

CREATE TABLE `review` (
	`review_id`	varchar(5)	NOT NULL,
	`ticketing_id`	varchar(5)	NOT NULL,
	`review_content`	varchar(10000)	NULL,
	`review_grade`	float(2,1)	NULL,
	`review_report_yn`	tinyint(1)	NULL,
	`review_date`	date	NULL
);

CREATE TABLE `exclude_show` (
	`user_id`	varchar(30)	NOT NULL,
	`show_id`	int(5)	NOT NULL
);

CREATE TABLE `funnel` (
	`funnel_id`	int(5)	NOT NULL,
	`funnel_name`	varchar(20)	NOT NULL
);

CREATE TABLE `blacklist` (
	`blacklist_id`	int(5)	NOT NULL,
	`user_id`	varchar(30)	NOT NULL,
	`reason_id`	int(5)	NOT NULL,
	`name`	varchar(20)	NULL,
	`email`	varchar(100)	NULL,
	`role`	varchar(20)	NULL,
	`phone`	char(11)	NULL,
	`delete_date`	date	NULL
);

CREATE TABLE `reason` (
	`reason_id`	int(5)	NOT NULL,
	`reason_type`	varchar(50)	NULL,
	`reason_content`	varchar(50)	NULL
);

CREATE TABLE `audience_price` (
	`audience_price_id`	int(5)	NOT NULL,
	`show_id`	int(5)	NOT NULL,
	`audience1_price`	int(5)	NOT NULL,
	`audience2_price`	int(5)	NOT NULL,
	`audience3_price`	int(5)	NOT NULL,
	`audience4_price`	int(5)	NOT NULL,
	`audience5_price`	int(5)	NOT NULL,
	`audience6_price`	int(5)	NOT NULL
);

CREATE TABLE `ticketing` (
	`ticketing_id`	varchar(5)	NOT NULL,
	`show_id`	int(5)	NOT NULL,
	`user_id`	varchar(30)	NOT NULL,
	`reason_id`	int(5)	NOT NULL,
	`show_date_id`	int(5)	NOT NULL,
	`price`	int(6)	NULL,
	`ticketing_date`	DATE	NULL,
	`refund_flag`	char(8)	NULL,
	`payment_type`	varchar(10)	NULL,
	`refund_date`	DATE	NULL,
	`refund_apply_date`	DATE	NULL
);

CREATE TABLE `troup` (
	`troup_id`	int(5)	NOT NULL,
	`user_id`	varchar(30)	NOT NULL,
	`troup_name`	varchar(30)	NULL,
	`troup_phone`	char(11)	NULL	COMMENT 'unique',
	`bank_name`	varchar(20)	NULL,
	`bank_account`	char(12)	NULL,
	`kakao_account`	varchar(30)	NULL,
	`seat_yn`	tinyint(1)	NULL
);

CREATE TABLE `QNA` (
	`QnA_id`	int(5)	NOT NULL,
	`user_id`	varchar(30)	NOT NULL,
	`QnA_title`	varchar(100)	NULL,
	`QnA_content`	varchar(10000)	NULL,
	`QnA_date`	DATE	NULL,
	`QnA_views`	int(5)	NULL,
	`group_number`	int(5)	NULL,
	`order`	int(2)	NULL,
	`depth`	int(2)	NULL
);

CREATE TABLE `show` (
	`show_id`	int(5)	NOT NULL,
	`troup_id`	int(5)	NOT NULL,
	`genre_id`	int(5)	NOT NULL,
	`show_title`	varchar(100)	NULL,
	`start_date`	DATE	NULL,
	`end_date`	DATE	NULL,
	`show_preview`	varchar(500)	NULL,
	`show_content`	varchar(500)	NULL
);

CREATE TABLE `show_date` (
	`show_date_id`	int(5)	NOT NULL,
	`show_id`	int(5)	NOT NULL,
	`show_time`	datetime	NULL,
	`show_length`	time	NULL
);

CREATE TABLE `audience_count` (
	`audience_count_id`	int(5)	NOT NULL,
	`ticketing_id`	varchar(5)	NOT NULL,
	`audience1_count`	int(6)	NULL,
	`audience1_amount`	int(6)	NULL,
	`audience2_count`	int(6)	NULL,
	`audience2_amount`	int(6)	NULL,
	`audience3_count`	int(6)	NULL,
	`audience3_amount`	int(6)	NULL,
	`audience4_count`	int(6)	NULL,
	`audience4_amount`	int(6)	NULL,
	`audience5_count`	int(6)	NULL,
	`audience5_amount`	int(6)	NULL,
	`audience6_acount`	int(6)	NULL,
	`audience6_amount`	int(6)	NULL
);

CREATE TABLE `theater` (
	`theater_id`	int(5)	NOT NULL,
	`troup_id`	int(5)	NOT NULL,
	`theater_name`	varchar(50)	NULL,
	`theater_location`	varchar(200)	NULL,
	`latitude`	float(9.6)	NULL,
	`longtitude`	float(9,7)	NULL,
	`entire_row`	int(2)	NULL,
	`entire_column`	int(2)	NULL
);

CREATE TABLE `book_seat` (
	`Key`	varchar(9) NULL,
	`ticketing_id`	varchar(5) NULL,
	`row`	int(2)	NULL,
	`column`	int(2)	NULL
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `genre` ADD CONSTRAINT `PK_GENRE` PRIMARY KEY (
	`genre_id`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`review_id`
);

ALTER TABLE `exclude_show` ADD CONSTRAINT `PK_EXCLUDE_SHOW` PRIMARY KEY (
	`user_id`,
	`show_id`
);

ALTER TABLE `funnel` ADD CONSTRAINT `PK_FUNNEL` PRIMARY KEY (
	`funnel_id`
);

ALTER TABLE `blacklist` ADD CONSTRAINT `PK_BLACKLIST` PRIMARY KEY (
	`blacklist_id`
);

ALTER TABLE `reason` ADD CONSTRAINT `PK_REASON` PRIMARY KEY (
	`reason_id`
);

ALTER TABLE `audience_price` ADD CONSTRAINT `PK_AUDIENCE_PRICE` PRIMARY KEY (
	`audience_price_id`
);

ALTER TABLE `ticketing` ADD CONSTRAINT `PK_TICKETING` PRIMARY KEY (
	`ticketing_id`
);

ALTER TABLE `troup` ADD CONSTRAINT `PK_TROUP` PRIMARY KEY (
	`troup_id`
);

ALTER TABLE `QNA` ADD CONSTRAINT `PK_QNA` PRIMARY KEY (
	`QnA_id`
);

ALTER TABLE `show` ADD CONSTRAINT `PK_SHOW` PRIMARY KEY (
	`show_id`
);

ALTER TABLE `show_date` ADD CONSTRAINT `PK_SHOW_DATE` PRIMARY KEY (
	`show_date_id`
);

ALTER TABLE `audience_count` ADD CONSTRAINT `PK_AUDIENCE_COUNT` PRIMARY KEY (
	`audience_count_id`
);

ALTER TABLE `theater` ADD CONSTRAINT `PK_THEATER` PRIMARY KEY (
	`theater_id`
);


ALTER TABLE `exclude_show` ADD CONSTRAINT `FK_user_TO_exclude_show_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `exclude_show` ADD CONSTRAINT `FK_show_TO_exclude_show_1` FOREIGN KEY (
	`show_id`
)
REFERENCES `show` (
	`show_id`
);

 ALTER TABLE user ADD `noshow_count` int(5) AFTER `wishlist`;






-- <insert>

INSERT INTO `showdb`.`funnel` (`funnel_id`, `funnel_name`) VALUES (0, '없음');
INSERT INTO `showdb`.`funnel` (`funnel_id`, `funnel_name`) VALUES (1, 'SNS');
INSERT INTO `showdb`.`funnel` (`funnel_id`, `funnel_name`) VALUES (2, '지인');
INSERT INTO `showdb`.`funnel` (`funnel_id`, `funnel_name`) VALUES (3, '광고');
INSERT INTO `showdb`.`funnel` (`funnel_id`, `funnel_name`) VALUES (4, '소셜커머스');
INSERT INTO `showdb`.`funnel` (`funnel_id`, `funnel_name`) VALUES (5, '타연극관람');
INSERT INTO `showdb`.`funnel` (`funnel_id`, `funnel_name`) VALUES (6, '초대석');
INSERT INTO `showdb`.`funnel` (`funnel_id`, `funnel_name`) VALUES (7, '기타');




INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test01', '0', '강민희', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '2048434987', 'kmh@gmail.com', 'admin', '01066950327', '0', '액션', '수상한흥신소', '2019-12-13','1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test02', '1', '성지혜', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '1230495867', 'sjh@gmail.com', 'ceo', '01099998765', '1', '액션', '행오버', '2018-12-13','1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test03', '2', '김성현', '$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '6054485844', 'ksh@naver.com', 'ceo', '01088889283', '1', '로맨스', '행오버', '2019-11-13','1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test04', '3', '고민석', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '2349293931', 'kms@gmail.com', 'ceo', '01029292929', '1', '호러', '극적인하룻밤', '2019-12-10','1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test05', '4', '김지욱', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '1230981239', 'kjo@naver.com', 'ceo', '01099998787', '0', '가족', '작업의정석', '2019-12-01','0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test06', '5', '두원재', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '4894561515', 'dwj@naver.com', 'ceo', '01026598888', '0', '휴머니티', '라이어', '2019-12-20','0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test07', '6', '이지영', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '1018034569', 'ejy@naver.com', 'ceo', '01099998888', '1', '유아', '작업의정석', '2019-11-28','3');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test08', '7', '김민서', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '1258934832', 'kms@naver.com', 'ceo', '01041561515', '0', '액션', '라이어', '2019-12-13','1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test09', '0', '주금만', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '5026432843', 'goldman@duaum.net', 'ceo', '01087951236', '1', '블랙 + 코미디', '2호선세입자', '2019-11-23','0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test10', '1', '임상민', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '4045635487', 'ism@gmail.com', 'ceo', '01015887777', '0', '코믹', '한뼘사이', '2019-12-01','0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test11', '2', '김주현', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '9404042067118', 'kjh@naver.com', 'ceo', '01099998822', '0', '뮤지컬', '2호선세입자', '2019-12-08','1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test12', '3', '신은석', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '8803031029883', 'sos@naver.com', 'ceo', '01074515441', '0', '호러', '나의PS파트너', '2019-12-28','2');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test13', '4', '서묘음', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '9209012876188', 'smo@naver.com', 'client', '01099995555', '1', '액션', '2호선세입자', '2019-12-13','2');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test15', '5', '김상희', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '9508122467811', 'ksh@naver.com', 'client', '01054615555', '0', '드라마', '환상동화', '2020-01-05','5');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test16', '6', '김덕현', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '9401121348299', 'kdh@naver.com', 'client', '01025638956', '1', '휴머니티', '엘리펀트 송', '2020-01-03','1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test17', '7', '김은혜', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '9304062684839', 'koh@gmail.com', 'client', '01054824565', '1', '멜로', '맘마미아', '2019-12-14','0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test18', '0', '신재훈', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '8002271284922', 'sjh@naver.com', 'client', '01022222222', '0', '유아', '도둑배우', '2019-11-30','0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test19', '1', '길용성', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '0103213675824', 'kys@gmail.com\'', 'client', '01015154444', '0', '드라마', '창문 넘어 도망친 100세 노인', '2019-11-23','0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test20', '2', '성윤주', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '6515612515611', 'syj@naver.com', 'client', '01012349874', '1', '호러', '창문 넘어 도망친 100세 노인', '2019-12-14','1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test21', '3', '안도희', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '9406142437112', 'ydh@naver.com', 'client', '01094545445', '0', '뮤지컬', '조각 : 사라진기억', '2019-12-28','0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test22', '4', '박보검', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '9306161458341', 'pbg@naver.com', 'client', '01056151515', '1', '드라마', '방탄개그단', '2019-11-25','1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test23', '5', '서강준', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '0512083218544', 'sgj@naver.com', 'client', '01051657856', '0', '액션', '룸넘버13', '2019-12-15','2');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test24', '6', '남주혁', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '0813843871922', 'njh@naver.com', 'client', '01054825635', '1', '블랙 + 코미디', '룸넘버13', '2019-11-28','1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test25', '7', '김수현', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '1001233245366', 'ksh@naver.com', 'client', '01078451234', '1', '휴머니티', '룸넘버13', '2019-11-18','1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test26 ', '2', '배수지', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '1169083124', 'beasuhi@naver.com', 'ceo', '01088543492', '0', '액션', '뷰티풀라이프', '2019-11-13', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test27', '4', '이민정', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '24507081234', 'minjung@gmail.com', 'ceo', '01087654432', '0',  '로맨스', '위대한 개츠비', '2019-11-10', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test28', '2', '이병헌', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '1153051394', 'beahun11@naver.com', 'ceo', '01099742212', '1', '드라마', '연애플레이리스트', '2020-01-02', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test29', '3', '정준희', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '3774031934', 'jungea11@gmail.com', 'ceo', '01077434485', '1',  '19금', '경종수정실록', '2020-01-05', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test30', '4', '김태리', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '2335062938', 'teari44@gmail.com', 'ceo', '01087432345', '1',  '휴머니티', '경종수정실록', '2019-12-25', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test31', '5', '서일선', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '3234031394', 'ilseon24@gmail.com', 'ceo', '01011234432', '0',  '블랙코메디', '앤ANNE', '2019-11-13', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test32', '0', '손현준', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '4855231586', 'heanjun98@naver.com', 'ceo', '01076432347', '0',  '유아', '운빨로맨스', '2019-11-25', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test33', '0', '하정우', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '5459121394', 'jungu21@naver.com', 'ceo', '01055432394', '0','액션', '아이언 마스크', '2020-01-08', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test34', '0', '손예진', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '6993052384', 'seoogf@naver.com', 'ceo', '01058432931', '1', '유아', '브라더스 까라마조프', '2019-12-23', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test35', '3', '현빈', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '8876111349', 'dongwon@', 'ceo', '01088234754', '1',  '유아', '영웅본색', '2019-08-07', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test36', '4', '김동균', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '6904131394533', 'donggun11@naver.com', 'client', '01099832342', '1', '로맨스', '영웅본색', '2019-11-21', '1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test37', '1', '민경훈', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '8707161293852', 'heachel1144@gmail.com', 'client', '01088344457', '1', '휴머니티', '그림자를 판 사나이', '2019-12-09', '2');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test38', '2', '김희철', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '0409223949534', 'heandkw11@naver.com', 'client', '01023499843', '0', '호러', '연애플레이리스트', '2020-01-01', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test39', '3', '이상민', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '7604231939459', 'sangmin@daum.com', 'client', '01023494342', '0', '코믹', '꽃의 비밀', '2019-11-17', '2');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test40', '4', '박성로', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '9408131039424', 'sunngro557@naver.com', 'client', '01099438232', '0', '유아', '김종욱찾기', '2019-12-14', '1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test41', '5', '김예리', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '0501024394593', 'yerai444@gmail.com', 'client', '01094584321', '1', '드라마', '스토리오브마이라이프', '2019-11-17', '2');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test42', '6', '아이린', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '0201134394544', 'ierin123@naver.com', 'client', '01088234323', '0', '호러', '내일은 미스트롯 전국투어 콘서트', '2019-12-23', '1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test43', '6', '손민아', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '9205152394343', 'mina65@naver.com', 'client', '01029348543', '1', '호러', '발렌티나 리시차 피아노 리사이틀 - 격정과 환희', '2019-11-13', '3');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test44', '7', '김현정', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '0005234345342', 'ddekw11@naver.com', 'client', '01092344854', '1', '멜로', '김종욱찾기', '2019-12-05', '1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test45', '3', '박민수', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '9006221394523', 'minsu1102@naver.com', 'client', '01023384492', '1', '19금', '여명의 눈동자', '2019-12-16', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test46', '7', '김경수', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '9309111394534', 'geuosk212@gmail.com', 'client', '01023994853', '1', '유아', '도둑배우', '2020-01-03', '4');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test47', '6', '옹성우', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '0507193384933', 'gangnag22@naver.com', 'client', '01093432043', '1', '드라마', '드라큘라', '2020-01-05', '0');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test48', '2', '이종석', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '8505031293422', 'jongsuk223@naver.com', 'client', '01094853223', '0', '휴머니티', '우리집에 왜 왔니', '2020-01-07', '2');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test49', '3', '김태희', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '5904112394502', 'theahe823@gmail.com', 'client', '01088432459', '0', '액션', '귀환', '2019-01-09', '1');
INSERT INTO `showdb`.`user` (`user_id`, `funnel_id`, `name`, `password`, `identification_number`, `email`, `role`, `phone`, `message_yn`, `dislike_genre`, `wishlist`, `join_date`,`noshow_count`) VALUES ('test50', '3', '한가인', '$2b$10$YVKsjF9GC/dU0aWCER3YTeNU9KvHXOryXFArkKqEhFk5OW26IXAwq', '7406022838534', 'songsong11@naver.com', 'client', '01098342458', '1', '호러', '줄리 앤 폴', '2019-11-28', '4');





INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('1', 'test02', 'A극단', '033345348', '국민은행', '110293169873', 'sjh@naver.com', '1');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('2', 'test03', 'B극단', '0418493483', '신한은행', '212312311215', 'ksh@naver.com', '1');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('3', 'test04', 'C극단', '0433879740', '농협', '416516151515', 'kms@naver.com', '1');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('4', 'test05', 'D극단', '0425679876', '하나은행', '615165165151', 'kjw@naver.com', '0');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('5', 'test06', 'E극단', '1951515151', '제일은행', '516516155165', 'dwj@naver.com', '1');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('6', 'test07', 'F극단', '0513453453', '우리은행', '191516515151', 'ejy@naver.com', '0');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('7', 'test08', 'G극단', '0612349340','국민은행', '156161561651', 'kms@naver.com', '0');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('8', 'test09', 'H극단', '0316435435', '신한은행', '451561615151', 'goldman@duaum.net', '1');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('9', 'test10', 'I극단', '0526985463', '농협', '516515151515', 'ism@gmail.com', '0');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('10', 'test11', 'J극단', '0559385493', '하나은행', '516156151515', 'kjh@naver.com', '1');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('11', 'test26', '국립극단', '022845948', '국민은행', '110366485943', 'eke33@naver.com', '0');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('12', 'test27', '시립극단', '0324856574', '하나은행', '110943823493', 'fkrjee345@naver.com', '0');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('13', 'test28', '세종극단', '0434958432', '제일은행', '803229342942', 'sejong111@naver.com', '0');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('14', 'test29', '충청극단', '0432988009', '농협', '327894930231', 'chungchung33@gmail.com', '1');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('15', 'test30', '서울시극단', '024583921', '신한은행', '213049593822', 'seoul42@naver.com', '1');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('16', 'test31', '제주극단', '0504934823', '농협', '394939485822', 'jeju88@gmail.com', '0');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('17', 'test32', '문화극단', '029348342', '신한은행', '110394958233', 'monha11@naver.com', '1');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('18', 'test33', '예술극단', '0314954853', '우리은행', '228394992933', 'esulll333@gmail.com', '0');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('19', 'test34', '장터극단', '0319342394', '제일은행', '345883838299', 'market22@naver.com', '0');
INSERT INTO `showdb`.`troup` (`troup_id`, `user_id`, `troup_name`, `troup_phone`, `bank_name`, `bank_account`, `kakao_account`, `seat_yn`) VALUES ('20', 'test35', '판타지극단', '029453442', '신한은행', '110939494922', 'fantasy82@gmail.com', '1');









INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (1, '로멘스', '사랑 또는 연애사건');

INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (2, '멜로', '허구가 많은 파란만장한 줄거리를 드라마틱하게 연출하여 희비가 엇갈리는 장면 속에 전개되는 통속극');

INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (3, '호러(스릴러)', ' 공포, 혐오, 무서운것, 열등품, 소름끼치게하는');

INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (4, '액션', '정의가 악을 무찔러 사건을 해결한다는 권선징악의 이야기를 다룬다');
INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (5, '코믹', '즐겁고 우스운 내용을 담은 연극');

INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (6, '19금', '19세 미만 관람금지 영화(성인연극)');

INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (7, '유아', '어린이 대상 연극');

INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (8, '드라마', '정서적인 주제를 다루는 현실적인 등장 인물의 성격 묘사를 바탕으로 하는 영화 장르');

INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (9, '휴머니티', '윤리에 대한 진단 내용을 담는 장르');

INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (10, '블랙코메디', '부조리한 현실에 기반을 두고 이를 웃음으로 풍자하는 코미디');

INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (11, '가족', '어른, 아이들이 함께 감상하고 즐길 수 있는 장르');

INSERT INTO `showdb`.`genre` (`genre_id`, `genre_name`, `genre_content`) VALUES (12, '뮤지컬', '노래,춤,연기가 어우러지는 공연 양식');





INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('1', '1', '1', '극적인하룻밤', '2019-12-01', '2019-12-30','/image/1.png' , '원나잇? 로맨스? 그와 그녀의 화끈하고 섹시한 아슬아슬 줄다리기!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('2', '2', '2', '행오버', '2020-01-03', '2020-01-18', '/image/2.PNG', '여긴어디? 4개의 호텔방에서 자던 수상한 그들이 한방에서 깨어난다?!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('3', '3', '3', '수상한흥신소', '2020-01-15', '2020-01-30', '/image/3.png', '영혼을 보는 백수 고시생의 기상천외한 비즈니스가 시작된다?! 영혼들의 소원을 들어드립니다!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('4', '4', '4', '옥탑방고양이', '2019-12-30', '2020-01-15', '/image/4.png', '꿈을 이루기 위해 상경했다! 오늘부터 죽도록 글만 쓰기다! VS 옥탑방으로 이사하는 날! 근데 웬 이상한 여자가 내 집에 먼저 들어와 살고 있다?');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('5', '5', '5', '작업의정석', '2020-01-05', '2020-01-15', '/image/5.jpg', '선수들의 밀당 승부가 시작된다! 낭만적이면서도 카리스마 있게!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('6', '6', '6', '라이어', '2019-10-13', '2020-12-05', '/image/6.jpg', '마음약한 한 남자의 엉뚱한 거짓말로 인해 벌어지는 하루 동안의 기막힌 헤프닝!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('7', '7', '7', '쉬어매드니스', '2019-10-22', '2019-12-29', '/image/7.jpg', '사건이 벌어진 바로 그날, 그날의 관객과 함께 살인사건을 해결하는 코믹 추리 수사극!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('8', '8', '8', ' 사과하기 좋은 날', '2019-12-01', '2020-01-01', '/image/8.jpg', '연이어 취업에 실패하는 철수는 매일 미안하단 말을 입에 달고 사는 쏘리맨!!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('9', '9', '9', '한뼘사이', '2019-11-02', '2019-11-21', '/image/9.jpg', '한 뼘 남짓한 사이를 둔 4명의 오피스텔 이웃들 닿을 듯 말듯한 한뼘사이에서 이들의 아슬아슬 알콩달콩한 이야기가 시작된다!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('10', '10', '10', '그대를 사랑합니다.', '2019-11-15', '2019-11-30', '/image/10.png', '우유배달을 하는 \'김만석\'과 파지 줍는 \'송이뿐\', 주차관리소에서 일하는 \'장군봉\'과 기억을 잃어버린 \'조순이\'가 새로 인연을 맺고 진한 우정과 사랑을 나누게 되는 이야기로, 긴 세월을 지내...');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('11', '1', '11', '2호선세입자', '2019-12-25', '2020-01-15', '/image/11.jpg', '아버지의 뒤를 이어 기관사가 되겠다는 청년, 이호선 하지만 취업도 실패, 사랑도 실패, 무엇 하나 되는 일이 없다. 간신히 2호선 역무원으로 취직하게 되지만 그마저도 불안한 계약직이다. 애...');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('12', '2', '12', '나의PS파트너', '2019-12-08', '2019-12-24', '/image/12.jpg', '수화기 너머로 각자의 연애와 일상 등 속 깊~은 대화를 나누며 점점 가까워지는 두 사람... 첫 감정 이상의 무언가를 서로에게 느끼게 되고, 어느 날 나잘를 다시 찾아온 전 여자친구... 이들은 ...');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('13', '3', '1', '환상동화', '2019-12-05', '2020-01-05', '/image/13.jpg', '지난 2013년 공연 이후로 멈춰있던 광대들의 동화 <환상동화>가 6년 만에 다시 막을 올린다! 매 시즌 앵콜 연장을 거듭하여, 환상과 현실 사이에서 펼처지는 한 편의 동화로 많은 관객의 마음에 ...');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('14', '4', '2', '2019<톡톡>', '2019-11-02', '2019-12-30', '/image/14.png', '하루하루 전쟁 같은 일상을 살고 있는 당신에게, 웃음과 위로가 필요한 당신에게! 함께라면 뭐든 할 수 있다는 웃음과 치유의 메시지를 전한다!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('15', '5', '3', '국희이야기', '2019-11-05', '2019-12-30', '/image/15.jpg', '이곳에는 동네 양아치들이 운영하는 퇴폐 이발소가 있다. 십년 전 코리안 드림을 안고, 연변에서 온 국자가 미미라는 이름으로 일하는 곳이기도 하다. 국자는 연변에 있는 어린 동생 국희를 위해 온갖 서러운 일을 참아가며 살아간다.');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('16', '6', '4', '마당놀이 춘풍이 온다', '2020-01-02', '2020-01-20', '/image/16.jpg', '평양에 도착한 춘풍은 기생 추월에게 빠져 가진 돈을 몽땅 날리고 추월의 종노릇을 하며 구박을 받는 처량한 신세가 되고 만다. 이 소식을 들은 오목이는 비장으로 남장을 하여 평양으로 춘풍...');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('17', '7', '5', '엘리펀트 송', '2020-01-01', '2019-01-30', '/image/17.jpg', '캐나다 브로크빌의 한 병원. 크리스마스 이브를 하루 앞두고 의사 로렌스가 돌연 사라져버린다. 유일한 단서는 그가 마지막으로 만난 환자 마이클의 증언 뿐 병원장 그린버그는 행방의 단서를...');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('18', '8', '6', '도둑배우', '2020-01-02', '2019-01-15', '/image/18.jpg', '과거는 비밀! 여자친구와 행복한 미래를 꿈꾸고 있는 도둑. 예전에 함께 일했던 선배도둑의 협박에 마지못해 동화작가의 2층 집을 털기로 한다! 일단 몰래 잠입하는 데는 수월하게 성!공! 하지...');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('19', '9', '7', '창문 넘어 도망친 100세 노인', '2019-12-30', '2020-01-15', '/image/19.jpg', '스페인 내전, 미국 핵폭탄 개발, 중국 국공내전, 미국과 러시아의 냉전 등 굵직한 세계사 곳곳을 주름잡는 알란, 이번엔 100번째 생일에 창문 넘어 도망치다! 양로원 창문을 넘어 도망친 것도 모...');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('20', '10', '8', '조각 : 사라진기억', '2020-01-05', '2020-01-25', '/image/20.PNG', '비 내리는 어느 여름날, 한적한 시골마을에 은행 강도 사건이 일어난다 용의자 희태와 순철은 경찰을 피해 가까스로 도주에 성공하고 사람들의 발길이 끊긴 허름한 페가에 잠시 머물기로 하는...');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('21', '1', '9', '돌아와요미자씨', '2019-10-27', '2019-11-15', '/image/21.PNG', '전 세대를 아우르는 감성 폭발 코믹 드르ㅏ마 레트로 감성의 두 할배가 펼치는 천상(?)여자 첫사랑 미자씨 쟁탈전!! 그럼, 미자씨의 첫사랑은 누구일까?');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('22', '2', '10', '방탄개그단', '2019-10-15', '2020-11-17', '/image/22.PNG', '웃음보따리 들고 청도로 출격한 BTS? 아니죠~ BTG 방탄개그단의 피땀눈물 흘리는 노력의 코미디공연!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('23', '3', '11', '택시안에서', '2019-10-01', '2020-01-17', '/image/23.jpg', '쾌활하고 유쾌한 택시 운전사 민수 그리고 하영과 소희 두 남녀의 운명적인 만남!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('24', '4', '12', '룸넘버13', '2019-11-01', '2019-11-29', '/image/24.jpg', '호텔체크인을 하고 들어선 리차드와 제인. 두남녀가 어렵게 성사된 만남의 기쁨을 나누려는 순간! 난데없이 발코니 창문에 엎드려 시체를 발견하게 된다.');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_preview`, `show_content`) VALUES ('25', '25', '1', 'Memory in dream', '2019-11-21', '2020-02-14', '/image/25.jpg', '앨리스는 이든의 죽으로 죄책감과 그리움, 거대한 슬픔에 빠진 채 살아갈 용기를 잃고 앨런과 유진은 그런 앨리스를 걱정하고 함께 슬퍼한다.');


INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('26', '11', '4', '발렌티나 리시차 피아노 리사이틀 - 격정과 환희', '2019-12-29', '2020-03-22', '그녀가 하는 모든 것에는 자신감 있는 기교와 진정한 감성 그리고  커뮤니케이션이 특별하게 혼합되어있다. 리시차의 음악은 진정으로 들을 가치가 있다.');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('27', '13', '5', '스토리오브마이라이프', '2019-12-03', '2020-02-28', '가슴따뜻한 이야기로 매년 겨울 관객들 사이에서 회자되며 사랑받아온 뮤지컬! 순수했던 어린 시절부터 세월의 흐름속에 변해가는 두 주인공의 모습을 그린다.');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('28', '13', '7', '내일은 미스트롯 전국투어 콘서트', '2019-12-20', '2020-01-09', '제2의 트롯 전성기를 이끌고 있는 트롯걸의 두번째 막이 시작된다. 남녀노소 모두가 즐길 수 있는 잊지 못할 추억의 현장으로 여러분을 초대합니다.');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('29', '11', '12', '김종욱찾기', '2016-06-17', '2020-01-31', '대학로 no.1 로맨틱 코미디 뮤지컬 썸은 이제 그만! 폴링 인 럽~ 사랑에 빠지고 싶은 솔로라면! 좀더 가까워 지고 싶어! 두근두근 아직 연애가 서툰 초보커플이라면! 데이트 공식 뮤지컬 김종욱 찾기가 답이다! ');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('30', '15', '5', '오백에 삼십', '2019-04-05', '2020-02-28', '\'밀당이란 이것이다! 남녀 심리 절대불변의 연애 공식을 파헤치는 로맨틱 코미디의 절대강자!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('31', '16', '9', '당신의 비밀', '2019-12-21', '2020-03-01', '모두가 열광한 코미디천재 장진의 화제작! 묘하게 끌리는 수상한 그(?)들의 등장! 20만 유료 보험금을 위한 발칙한 작전');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('32', '12', '8', '뷰티풀라이프', '2019-11-14', '2020-01-12', '과거를 회상하는 2인극의 다색적 묘미! 배우들의 연기력, 폭 넓은 연령대를 아우르는 스토리로 매순간 색다른 웃음과 재미, 감동이 다합쳐진 볼.매.연.극!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('33', '14', '11', '여명의 눈동자', '2020-01-23', '2020-02-27', '그저 함께 있고 싶었을 뿐인데... 그게 왜 그렇게 어려웠을까요, 우린... 일제의 지배가 막바지에 이르고 있던 1944년, 조선인 학도병 대치와 일본군 위안부 여옥은 민족의 아플음 공유하며 사랑을 키워 나가지만 행복도 잠시, 전쟁은 두 사람을 갈라 놓는다.');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('34', '17', '2', '수상한 흥신소2', '2019-05-02', '2020-01-31', '영혼을 보는 청년 오상우. 그는 영혼들의 이루지 못한 소원을 들어주는 서비스센터를 운영하고 있다. 여느 날과 마찬가지로 영혼들의 의뢰를 해결하던 상우 서비스 센터 앞 쓰레기 무단 투기의 범인을 찾기위해 쓰레기 봉투를 뒤지던 중 의문의 버킷리스트를 발견하고...');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('35', '18', '3', '위대한 개츠비', '2019-12-18', '2020-02-28', '대한민국 공연계 새로운 바람이 분다! 재즈음악, 샴페인, 화려함이 절정에 달한 1920년대의 재즈시대의 개츠비의 성대한 파티에 당신을 초대합니다!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('36', '19', '4', '도둑배우', '2019-11-09', '2020-01-27', '전 세대의, 전 세대에 의한, 전 세대를 위한 new 코미디 연극!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('37', '20', '7', '여신님이 보고 계셔', '2019-11-16', '2020-03-01', '창작 뮤지컬의 살아있는 흥행 신화! 당신의 마음을 위로해 줄 최고의 \'힐링 뮤지컬\'이 돌아왔다! 믿고 듣는 배우들이 전하는 따뜻하고 아름다운 희망의 메시지! 또 한 번의 \'여보셔 신드롬\'을 일으키다!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('38', '18', '9', '연애플레이리스트', '2019-11-27', '2020-01-12', '청춘들의 연애 고민을 솔직하게 담은 스토리 재기발랄한 로맨틱 감성과 트렌디한 유머코드의 조화 풋풋하고 서툰 청춘남녀의 연애 성장담!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('39', '17', '12', '영웅본색', '2019-12-17', '2020-03-22', '장국영의 노래로 빚은 홍콩 느와르의 제왕, 뮤지컬 영웅본색 최고의 무대를 선사할 단 하나의 뮤지컬! 의리와 배신이 충돌하는 홍콩의 뒷골목, 그 낭만으로의 초대 느와르의 전설이 무대 위에 화려하게 펼쳐진다! ');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('40', '15', '10', '경종수정실록', '2019-10-27', '2020-01-12', '당쟁의 대립 속에서 서로 다른 세상을 꿈꾸었던 자들의 이야기 숙종과 생모 장희빈에 대한 트라우마를 안고 성장한 조선의 20대 왕, 경종. 그의 병환이 노출되면서 왕권은 흔들리기 시작한다. ');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('41', '15', '6', '드라큘라', '2020-02-11', '2020-06-07', '브로드웨이 역사상 가장 매혹적인 입맞춤 2020년 오디컴퍼니가 선사하는 또 하나의 대작 죽음을 초월한 세기의 러브스토리를 입체적인 무대 예술과 웅장하고 아름다운 음악으로 표현하며 깊은 인상을 남긴 뮤지컬 드라큘라의 새로운 역사가 시작된다.');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('42', '19', '5', '앤ANNE', '2019-11-30', '2020-01-05', '앤은 참 특별해, 그렇지? 어린이들을 비롯한 어른들에게 유년 시절의 꿈과 사랑을 일깨워주는 작품으로 현재까지 전 세계의 독자들을 매료시킨 루시 모드 몽고메리의 소설 <빨강 머리 앤> 2019년 겨울, 특별하고 사랑스러운 앤과 함께 상상보다 멋진 만남이 우리를 기다린다! ');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('43', '20', '2', '메리제인', '2019-12-07', '2020-01-19', '메리제인은 Herzog의 가장 훌륭한 희곡이다. 인물들의 내면으로부터 발산되는 연극의 빛 \'어머니\'라는 일상의 영웅에 대한 가슴 찢어지는 이야기는 그 신파성의 결여로 인해 더욱 감동적이다!!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('44', '14', '8', '그림자를 판 사나이', '2019-11-16', '2020-02-02', '환상 문학 특징을 반영한 판타지적 무대와 환상적 미장센 그림자를 팔고 부를 얻게 된 \'페터 슐레밀\'과 그림자를 산 정체불명의 남자 \'그레이맨\' 두 남자가 그림자를 사이에 두고 펼쳐지는 개성 있고 긴장감 넘치는 스토리!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('45', '11', '1', '우리집에 왜 왔니', '2019-09-06', '2020-02-02', '뻔한 로맨스? NO NO~! 이제 대세는 NEW로맨스~! 집안일도 요리도 만능인 존잘 연하남 류연! 당당하고 독립심 강한 매력철철 차도녀 서재희! 요즘 우리들의 이야기! 최신형 뉴맨스~');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('46', '12', '3', '운빨로맨스', '2019-10-03', '2020-01-05', '정해진 운명을 믿는 여자! vs 개인의 의지로 운명을 개척하는 남자! 이 둘 사이에서 펼쳐지는 달콤하고 짠맛나는 사랑 이야기!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('47', '15', '9', '귀환', '2020-01-03', '2020-01-05', '지금을 살고 있는 우리가 잊어서는 안 될, 가슴 뭉클한 이야기가 시작된다! 6.25전쟁 당시 나라를 위해 하나밖에 없는 목숨을 바쳤으나 미쳐 수습되지 못한 채 아직도 이름모를 산야에 홀로 남겨진 호국용사들. 그분들의 유해를 찾아 조국의 폼으로 모시는 이야기를 다룬 \'귀환\'');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('48', '17', '5', '아이언 마스크', '2019-11-23', '2020-01-26', '신이 정한 왕 불꽃 같은 혁명 아이언 마스크 프랑스 왕실에 태어난 쌍둥이, 루이 14세 한 명은 왕이 되고 또 다른 한 명은 철가면을 쓴 채 지하감옥에 같혀야하는 운명의 주인공!');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('49', '13', '7', '브라더스 까라마조프', '2020-02-07', '2020-05-03', '인간의 모순과, 내면의 혼돈, 영혼의 갈증으로부터 완벽하게 자유로운 이가 있는가. 뮤지컬 <브라더스 까라마조프>는 다양한 인물 군상과 크고 작은 사건들, 무수한 에피소드를 담은 방대한 규모의 원작을 4명의 형제들을 중심으로 영리하게 집약했다.');
INSERT INTO `showdb`.`show` (`show_id`, `troup_id`, `genre_id`, `show_title`, `start_date`, `end_date`, `show_content`) VALUES ('50', '12', '4', '줄리 앤 폴', '2020-01-10', '2020-03-22', '1889년 파리. 줄리는 자석공장에 다니는 여공이다. 그런데 어느 날 생산량을 늘려야 한다며 작업과 점심식사를 동시에 해결하라는 지시가 떨어지고, 양손이 헷갈린 줄리가 그만 자석을 삼키는 소동이 벌어진다. 다행히 목숨은 구했으나, 심장이 자석으로 변하게 된 줄리. 그런 그녀가 사랑에 빠진다. 상대는 바로 고소공포증에 걸려 은퇴를 결심한 공중곡예사 폴!');




INSERT INTO `reason` VALUES (1, 1, '잦은 no-show');
INSERT INTO `reason` VALUES (2, 1, '진상고객');
INSERT INTO `reason` VALUES (3, 1, '질 낮은 공연');
INSERT INTO `reason` VALUES (4, 1, '잦은 공연 예정 변경');
INSERT INTO `reason` VALUES (5, 1, '잦은 악성 댓글');
INSERT INTO `reason` VALUES (6, 0, '없음');




INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('1', '1', '2019-12-15 17:30:00', '03:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('2', '2', '2019-12-15 17:30:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('3', '3', '2020-01-20 11:00:00', '02:30:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('4', '4', '2020-01-05 12:00', '01:30:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('5', '5', '2020-01-07 03:00:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('6', '6', '2019-12-15 12:00:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('7', '7', '2019-12-01 13:00:00', '01:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('8', '8', '2019-12-19 13:00:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('9', '9', '2019-11-30 13:00:00', '01:30:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('10', '10', '2019-11-25 13:00:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('11', '11', '2019-12-26 13:30:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('12', '12', '2019-12-15', '03:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('13', '13', '2019-12-18 13:30:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('14', '14', '2019-11-05 12:00:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('15', '15', '2019-11-15 12:00:00', '01:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('16', '16', '2020-01-05 13:00:00', '01:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('17', '17', '2020-01-02 13:00:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('18', '18', '2020-01-14 13:00:00', '03:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('19', '19', '2020-01-08', '03:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('20', '20', '2020-01-05 12:30:00', '03:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('21', '21', '2020-01-15 13:30:00', '03:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('22', '22', '2020-01-17 13:30:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('23', '23', '2020-01-26 12:00:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('24', '24', '2019-11-20 12:00:00', '01:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('25', '25', '2020-01-10 12:00:00', '01:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('26', '26', '2020-01-03 09:30:00', '01:10:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('27', '27', '2020-01-07 14:20:00', '02:30:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('28', '28', '2020-01-23 17:10:00', '02:10:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('29', '29', '2020-01-08 15:50:00', '03:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('30', '30', '2020-01-03 09:30:00', '01:40:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('31', '31', '2020-01-13 18:20:00', '01:50:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('32', '32', '2019-12-30 19:45:00', '02:30:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('33', '33', '2020-01-23 20:00:00', '02:40:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('34', '34', '2020-01-11 14:20:00', '01:10:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('35', '35', '2020-02-13 19:30:00', '01:30:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('36', '36', '2019-11-03 17:30:00', '03:30:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('37', '37', '2020-01-23 19:00:00', '02:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('38', '38', '2020-01-17 21:30:00', '01:00:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('39', '39', '2019-12-23 17:10:00', '00:50:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('40', '40', '2019-01-11 13:20:00', '02:35:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('41', '41', '2020-01-17 22:10:00', '01:25:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('42', '42', '2020-01-13 14:00:00', '01:45:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('43', '43', '2020-01-25 16:10:00', '02:15:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('44', '44', '2019-12-27 15:10:00', '02:24:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('45', '45', '2020-01-25 11:15:00', '03:15:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('46', '46', '2020-01-13 17:20:00', '02:35:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('47', '47', '2019-12-29 19:00:00', '02:20:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('48', '48', '2020-01-05 13:10:00', '01:55:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('49', '49', '2020-01-25 15:00:00', '02:45:00');
INSERT INTO `showdb`.`show_date` (`show_date_id`, `show_id`, `show_time`, `show_length`) VALUES ('50', '50', '2019-12-29 08:30:00', '01:25:00');




INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('1', '1', '드림아트센터', '서울특별시 종로구 동숭동 1-42', '126.973', '37.493145', '5', '5');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('2', '2', '휴먼컴퍼니', '명륜4가 188-24번지 4층 종로구 서울특별시 KR', '126.97', '37.542469', '6', '5');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('3', '3', '수상한흥신소전용관', '서울특별시 종로구 동숭동 1-74', '126.941', '37.5326271', '6', '6');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('4', '4', '순위아트홀', '서울특별시 종로구 동숭동 대학로10길 11', '126.972', '37.5375366', '7', '6');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('5', '5', '틴틴홀', '서울특별시 종로구 동숭동 1-97', '126.937', '37.532238', '5', '5');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('6', '6', '민송아트홀', '민송 아트홀 서울특별시 종로구 혜화동 164-4', '126.941', '37.5337029', '5', '5');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('7', '7', '콘텐츠박스', '서울특별시 종로구 동숭길 55 대학빌딩 B', '126.94', '37.5324516', '5', '6');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('8', '8', '달오름극장', '서울특별시 중구 장충동2가 산14-67', '126.982', '37.5183067', '5', '5');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('9', '9', '여우별아트홀', '대구광역시 중구 삼덕동1가 동성로3길 35, 4F', '131.199', '35.8703003', '5', '5');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('10', '10', '송죽씨어터', '대구광역시 중구 화전동 11', '126.709', '36.6820526', '5', '5');

INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`) VALUES ('11', '11', '대학로자유극장', '서울 종로구 대학로12길 31', '127.0292881', '37.4923615');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`) VALUES ('12', '12', '울산문화예술회관', '울산 남구 번영로 200 울산광역시문화예술회관', '126.9845085', '36.5404087');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`) VALUES ('13', '13', '블루스퀘어 아이마켓홀', '서울 용산구 이태원로 294', '126.9987464', '37.5165972');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('14', '14', '드림아트센터', '서울 종로구 동숭길 123 드림아트센터', '126.971162', '37.5379699', '11', '4');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('15', '15', '여우별아트홀', '대구 중구 동성로3길 35 자이유 4층', '128.5625949', '35.8659679', '7', '5');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`) VALUES ('16', '16', '경기도문화의전당 대극장', '경기 수원시 팔달구 효원로307번길 20 경기도문화의전당', '127.0025496', '37.2615783');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('17', '17', '강릉 올림픽파크강릉아이스아레나', '강원 강릉시 교동 2-4', '128.8614855', '37.7769887', '9', '4');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`) VALUES ('18', '18', '대학로 단막극장', '서울 종로구 동숭4길 16-3', '126.9693636', '37.5833183');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`) VALUES ('19', '19', '라이프씨어터', '서울 종로구 창경궁로34길 26', '126.9660028', '37.5839292');
INSERT INTO `showdb`.`theater` (`theater_id`, `troup_id`, `theater_name`, `theater_location`, `latitude`, `longtitude`, `entire_row`, `entire_column`) VALUES ('20', '20', '메리홀 소극장', '서울 마포구 백범로 35', '126.904482', '37.5521821', '7', '10');



INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test01', '1');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test02', '2');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test03', '3');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test04', '4');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test05', '5');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test06', '6');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test07', '7');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test08', '8');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test09', '9');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test10', '10');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test26', '28');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test27', '30');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test28', '32');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test29', '33');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test30', '35');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test31', '39');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test32', '40');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test33', '41');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test34', '41');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test35', '43');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test36', '39');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test37', '32');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test38', '33');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test39', '36');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test40', '38');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test41', '31');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test42', '29');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test43', '28');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test44', '27');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test45', '46');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test46', '45');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test47', '41');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test48', '43');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test49', '45');
INSERT INTO `showdb`.`exclude_show` (`user_id`, `show_id`) VALUES ('test50', '49');



INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('1', '1', '200000', '150000', '125000', '170000', '100000', '170000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('2', '2', '30000', '29000', '29500', '24000', '21000', '20000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('3', '3', '250000', '155000', '175000', '100000', '197000', '186000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('4', '4', '300000', '150000', '170000', '179000', '500000', '130000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('5', '5', '80000', '75000', '75000', '69000', '69000', '70000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('6', '6', '250000', '178000', '179000', '178000', '150000', '110000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('7', '7', '300000', '199000', '198000', '150000', '155000', '199000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('8', '8', '240000', '180000', '198000', '170000', '155000', '112000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('9', '9', '66000', '60000', '50000', '50000', '54000', '53500');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('10', '10', '230000', '167000', '168000', '168000', '165700', '110000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('11', '11', '235000', '230000', '155000', '180000', '179000', '700000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('12', '12', '55000', '50000', '50000', '50000', '50000', '50000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('13', '13', '150000', '170000', '175000', '188000', '186000', '110000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('14', '14', '210000', '150000', '150000', '145000', '130000', '150000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('15', '15', '40000', '35000', '35200', '30000', '31000', '39000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('16', '16', '230000', '245000', '150000', '155000', '135000', '178000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('17', '17', '180000', '175000', '170000', '170000', '168000', '176000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('18', '18', '30000', '23000', '22000', '22300', '26800', '29000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('19', '19', '200000', '180000', '190000', '199900', '190000', '145000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('20', '20', '210000', '170000', '179000', '156000', '200000', '178000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('21', '21', '25000', '19000', '18000', '16700', '18000', '18000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('22', '22', '270000', '200000', '190000', '178000', '190000', '189000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('23', '23', '156000', '139000', '120000', '140000', '160000', '150000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('24', '24', '20000', '10000', '10000', '10000', '9900', '9900');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('25', '25', '18000', '15000', '15000', '14000', '10000', '10000');

INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('26', '26', '87300', '72300', '73600', '74700', '76900', '71000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('27', '27', '31000', '24300', '25700', '27900', '28900', '21800');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('28', '28', '67800', '52000', '54600', '57800', '59300', '51000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('29', '29', '77500', '68400', '69700', '72300', '73500', '63200');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('30', '30', '98700', '72600', '78900', '79300', '73700', '71000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('31', '31', '130700', '110800', '115700', '118300', '121300', '100000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('32', '32', '98500', '78400', '80200', '82100', '83400', '72000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('33', '33', '43000', '38500', '39200', '39700', '40100', '34500');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('34', '34', '46000', '38700', '39200', '40100', '41200', '41000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('35', '35', '79500', '69300', '71300', '72700', '77000', '62700');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('36', '36', '117000', '108000', '103200', '105400', '112000', '98000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('37', '37', '83000', '76000', '77600', '78700', '81300', '72300');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('38', '38', '127000', '108000', '113000', '115400', '110000', '100300');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('39', '39', '139000', '108000', '118000', '129800', '100000', '103000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('40', '40', '56300', '37300', '42300', '48800', '30000', '35400');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('41', '41', '76400', '62300', '65800', '69700', '58000', '51200');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('42', '42', '27000', '23000', '24500', '25000', '20500', '21500');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('43', '43', '127000', '109000', '112000', '117500', '108000', '102000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('44', '44', '82300', '73400', '77800', '78900', '71000', '69000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('45', '45', '56300', '42500', '46500', '45900', '40100', '41500');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('46', '46', '79500', '75400', '76800', '77300', '77600', '74200');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('47', '47', '113800', '98700', '100700', '101300', '92000', '103700');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('48', '48', '129800', '112000', '118700', '121300', '125300', '115600');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('49', '49', '149000', '127000', '129500', '137200', '139500', '118000');
INSERT INTO `showdb`.`audience_price` (`audience_price_id`, `show_id`, `audience1_price`, `audience2_price`, `audience3_price`, `audience4_price`, `audience5_price`, `audience6_price`) VALUES ('50', '50', '131500', '118000', '121300', '123700', '128900', '100800');



INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('2', '2', 'test12', '2', '2', '108500', '2018-02-15', '환불완료', '현금', '2018-02-16', '2018-02-13');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('1', '1', 'test11', '1', '1', '600000', '2018-01-05', '환불가능', '카드');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('3', '3', 'test09', '3', '3', '662000', '2018-01-26', '환불가능', '카카오페이');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('4', '4', 'test09', '4', '4', '120000', '2018-03-05', '환불가능', '카카오페이');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('5', '5', 'test10', '5', '5', '150000', '2018-04-27', '환불완료', '현금', '2018-04-29', '2018-04-28');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('6', '6', 'test11', '6', '6', '1250000', '2018-05-17', '환불완료', '카카오페이', '2018-05-20', '2018-05-18');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('7', '7', 'test13', '1', '7', '627000', '2018-06-23', '환불가능', '카드');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('8', '8', 'test16', '2', '8', '480000', '2018-08-21', '환불완료', '현금', '2018-09-02', '2018-08-25');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('9', '8', 'test15', '3', '9', '157500', '2018-10-13', '환불가능', '카카오페이');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('10', '9', 'test15', '4', '10', '198000', '2018-12-29', '환불완료', '카드', '2018-12-30', '2019-12-20');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('11', '9', 'test10', '5', '11', '230000', '2019-02-13', '환불완료', '현금', '2019-02-17', '2019-12-15');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('12', '13', 'test07', '6', '12', '313000', '2019-04-01', '환불가능', '카카오페이');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('13', '19', 'test05', '1', '13', '4000000', '2019-05-23', '환불완료', '현금', '2019-05-24', '2019-05-23');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('14', '6', 'test07', '2', '14', '250000', '2019-06-10', '환불완료', '현금', '2019-06-13', '2019-06-11');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('15', '6', 'test09', '3', '15', '607000', '2019-07-20', '환불가능', '카드');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('16', '7', 'test20', '4', '16', '799000', '2019-11-05', '환불완료', '카드', '2019-11-06', '2019-11-01');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('17', '7', 'test22', '5', '17', '30000', '2019-11-15', '환불완료', '카카오페이', '2019-11-18', '2019-11-16');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('18', '14', 'test20', '6', '18', '210000', '2019-11-25', '환불가능', '카카오페이');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('19', '12', 'test16', '1', '19', '55000', '2019-12-05', '환불가능', '현금');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('20', '10', 'test12', '2', '20', '397000', '2019-12-13', '환불가능', '카드');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('21', '9', 'test11', '3', '21', '66000', '2019-12-25', '환불완료', '카카오페이', '2019-12-27', '2019-12-25');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('22', '15', 'test10', '4', '22', '40000', '2020-01-07', '환불가능', '현금');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('23', '16', 'test21', '5', '23', '23000', '2020-01-08', '환불완료', '카드', '2020-01-09', '2020-01-08');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('24', '25', 'test09', '6', '24', '18000', '2020-01-09', '환불가능', '카카오페이');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('25', '24', 'test16', '6', '25', '40000', '2020-01-10', '환불가능', '현금');

INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('26', '26', 'test36', '6', '26', '233200', '2019-11-12', '환불가능', '현금');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('27', '29', 'test50', '6', '29', '298700', '2019-11-15', '환불완료', '카드', '2019-11-24', '2019-11-21');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('28', '33', 'test39', '6', '33', '178500', '2019-11-17', '환불완료', '현금', '2019-11-27', '2019-11-25');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('29', '37', 'test41', '6', '37', '158700', '2019-11-19', '환불가능', '카드');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('30', '32', 'test37', '5', '32', '83000', '2019-12-21', '환불완료', '카카오페이', '2019-12-25', '2019-12-22');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('31', '44', 'test42', '6', '44', '323400', '2019-12-24', '환불가능', '현금');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('32', '36', 'test45', '6', '36', '171000', '2018-07-04', '환불완료', '카카오페이', '2019-11-21', '2019-11-18');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('33', '49', 'test38', '3', '49', '201500', '2019-09-19', '환불가능', '카드');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('34', '50', 'test49', '6', '50', '161400', '2019-02-07', '환불완료', '카카오페이', '2019-12-23', '2019-12-18');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('35', '29', 'test43', '2', '29', '243500', '2019-12-28', '환불가능', '카카오페이');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('36', '42', 'test48', '6', '42', '448400', '2019-02-13', '환불완료', '현금', '2019-11-20', '2019-11-14');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('37', '33', 'test38', '3', '33', '325000', '2018-07-07', '환불완료', '카카오페이', '2019-12-14', '2019-12-09');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('38', '39', 'test32', '6', '39', '368400', '2019-09-22', '환불완료', '카카오페이', '2019-11-17', '2019-11-15');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_apply_date`) VALUES ('39', '45', 'test35', '4', '45', '215300', '2020-01-02', '환불가능', '현금', '2020-01-02');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('40', '42', 'test40', '6', '42', '258400', '2019-09-25', '환불완료', '카카오페이', '2019-11-29', '2019-11-26');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('41', '29', 'test43', '2', '29', '288400', '2019-02-10', '환불완료', '카드', '2019-12-13', '2019-12-11');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('42', '31', 'test50', '6', '31', '84300', '2020-01-05', '환불완료', '카카오페이', '2020-01-08', '2020-01-05');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('43', '39', 'test37', '5', '39', '378400', '2018-07-10', '환불가능', '현금');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('44', '37', 'test33', '6', '37', '449300', '2018-05-17', '환불완료', '카카오페이', '2019-12-20', '2019-12-17');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('45', '45', 'test38', '3', '45', '162300', '2019-01-08', '환불완료', '카카오페이', '2019-11-17', '2019-11-15');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('46', '29', 'test43', '2', '29', '347500', '2018-05-11', '환불가능', '카드');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('47', '35', 'test47', '6', '35', '359200', '2019-01-09', '환불완료', '카카오페이', '2019-11-20', '2019-11-18');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('48', '38', 'test38', '3', '38', '568400', '2019-02-14', '환불완료', '카카오페이', '2019-12-19', '2019-12-17');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`) VALUES ('49', '37', 'test41', '6', '37', '264500', '2018-05-14', '환불가능', '현금');
INSERT INTO `showdb`.`ticketing` (`ticketing_id`, `show_id`, `user_id`, `reason_id`, `show_date_id`, `price`, `ticketing_date`, `refund_flag`, `payment_type`, `refund_date`, `refund_apply_date`) VALUES ('50', '50', 'test43', '2', '50', '384300', '2019-01-10', '환불완료', '카드', '2019-11-24', '2019-11-22');



INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('1', 'test01', '환불 신청에 대해 문의합니다.', '이번 환불 신청건 어떻게 되었나요? 아직도 환불이 안되서 연락드립니다!', '2019-11-23', '5', '5', '4', '3');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('2', 'test02', '수험표 할인', '이번에 수능 본 학생들 수험표를 가져오면 할인 한다고 들었는데 맞나요?', '2019-12-30', '7', '5', '4', '4');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('3', 'test03', '관람시간', '관람시간이 변경되었다는데 문자가 없어서 직접 가서 알았습니다. 환불해주세요.', '2019-11-25', '5', '5', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('4', 'test04', '새해 맞이', '새해를 맞이해서 쥐띠는 할인한다고 들었는데 민증만 보여드리면 되는건가요?', '2019-10-15', '5', '3', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('5', 'test05', '공연장소', '공연 장소에 주차장은 있나요? 주차비는 추가되나요?', '2020-01-13', '4', '4', '6', '6');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('6', 'test06', '청소년할인', '청소년 할인 된 가격이 맞나요? 결제페이지를 들어가면 할인된 가격이 뜨지 않는데요?', '2019-11-10', '5', '5', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('7', 'test07', '극장위치', '드림아트센터로 가려면 몇번 출구로 나가야 하나요?', '2019-11-11', '5', '4', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('8', 'test08', '연극 종류', '연극 종류가 많이 있는데 연극 순위별로는 볼수 없나요?', '2020-01-02', '5', '5', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('9', 'test09', '연극 배우', '연극 배우들 엄청 연기 잘하셔서 많이 놀랐습니다! 그래서 편지를 보내고 싶은데 어디로 보내면 될까요?', '2019-02-03', '5', '5', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('10', 'test10', '환불관련', '환불 얼릉 부탁 드립니다 다른 연극 예매하고 싶어요ㅜㅜ', '2019-06-15', '5', '5', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('11', 'test11', '음식 들고 들어갈수 있나요?', '극장안에 음식 들고 갈수 있나요?', '2019-07-01', '5', '5', '5', '6');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('12', 'test12', '극장안에 매점', '극장안에 매점은 있나요? 혹시 있다면 음식 들고 들어가도 되나요?', '2020-01-05', '5', '5', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('13', 'test13', '길찾기', '길을 찾는중인데 사당역에서 5번출구로 나가는거 맞나요?', '2019-11-10', '5', '4', '4', '4');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('14', 'test14', '배우관련', '배우가 바뀌었다는데 사실인가요? 사실이면 어떤배우분으로 바뀌였나요?', '2019-12-12', '5', '5', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('15', 'test15', '공연시간', '공연시간이 이렇게 바뀌었는데! 공연 시간 바뀐거 확실한가요?', '2019-11-10', '5', '5', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('16', 'test16', '환불관련 질문합니다!!', '환불 진행은 잘되어가고 있는건가요? 아직 환불완료가 되지 않아서요ㅜㅜ', '2019-11-08', '5', '5', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('17', 'test17', 'B극단에서 이벤트', 'B극단에서 이벤트 한다고 들었는데 그거 미리 신청해야하나요? 아님 당일날도 가능한가요?', '2019-05-06', '5', '7', '6', '6');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('18', 'test18', '김우석배우', '이번에 옥탑방고양이에 김우석 배우가 캐스팅 되었다고 들었는데 사실인가요?', '2019-07-08', '4', '5', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('19', 'test19', '늙은도둑이야기 전단지', '전단지를 받았은데 이걸 들고 가면 50% 할인이라고 들었는데 맞나요?', '2019-08-08', '5', '5', '6', '6');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('20', 'test20', '환불관련 질문 ', '환불 신청을 했는데 환불이 되지 않았네요ㅜㅜ', '2019-09-09', '5', '5', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('21', 'test21', '배우 스케줄', '이번에 꽃의비밀 배우들 너무너무 팬이되었어요.. 배우들 다음 스케줄 알수있을까요?', '2019-09-15', '5', '5', '6', '6');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('22', 'test22', '예매관련', '예매할때 예매창으로 넘어가지질 않네요ㅜㅜ 컴퓨터 문제는 아닌거 같은데 혹시 알수있을까요?', '2019-10-14', '4', '5', '4', '4');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('23', 'test23', '위치관련', '위치를 찾아가려고 하는데 ㅜㅜ 좀 어렵네요ㅜㅜ 혹시 위치를 상세히 정확히 알려주실수 있나요?', '2019-12-31', '4', '4', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('24', 'test24', '관객유형', '관객유형 확실한 기준이 뭔가요?', '2019-11-29', '5', '5', '6', '6');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('25', 'test25', '다른 연극', '혹시 다른연극으로 변경도 가능한가요?', '2019-12-01', '5', '5', '5', '5');

INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('26', 'test36', '크리스마스할인', '이번주 주말도 할인 가능한거 맞나요?', '2019-12-20', '7', '1', '1', '2');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('27', 'test38', '학생증', '대학교 학생증 모바일학생증으로도 되나요?', '2019-07-11', '5', '3', '1', '4');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('28', 'test39', '배우', '캐스트 스케쥴표에 나온 배우분들은 시간 상관 없이 그 날짜에 나오는 거죠?', '2019-05-03', '3', '1', '3', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('29', 'test40', '10주년 주말 파티로 할인예매 했는데', '이건 별도의 증빙서류 필요 없는거죠?\n이것만으로 예매 되는거죠??', '2019-12-28', '1', '4', '3', '3');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('30', 'test38', '좌석문의', '4시 10분 공연 4인 예매를 하려고 하는데\n친구끼리는 연인석을 지정 예매할수 없는건가요??', '2018-07-19', '1', '5', '4', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('31', 'test44', '캐스팅', '3월 아직 끝나지도 않았는데\n\n캐스팅 4월로 바꿔버리면 남음 3월에 관람할땐 캐스팅 참고하지 말라는 건가요?\n\n3월 캐스팅을 외우는 것도 아니고....근데 18일에 타임세일해버리면\n\n캐스팅안보고 예매하라는 건가요??\n\n3월 캐스팅알고싶은데 어디에도 없네요....', '2019-03-24', '1', '1', '8', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('32', 'test42', '할인 문의드립니다~', '이번주 공연을 볼 예정인데요~\n시간은 오후 5시40분이요~\n할인적용중에 \'\'봄맞이할인_평일\'\'\n이거는 누구나 다 할인 받을 수 있는 건가요?\n아니면 조건이 있나요?', '2019-01-17', '8', '3', '5', '6');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('33', 'test49', '2020 할인', '2020할인은 적용가능한 대상이 뭔가요?', '2020-01-03', '5', '3', '4', '8');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('34', 'test45', '굿바이 2019 할인 문의', '굿바이 2019 할인 선택해서 결제했는데,\n예매완료내용을 sns 에 올려서 입장할때 인증하면 되는건가요?!', '2019-12-30', '6', '4', '9', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('35', 'test47', '학생할인 문의', '사이버대학교도 되나요?', '2018-07-16', '7', '2', '2', '2');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('36', 'test45', '할인문의', '1111할인은 1인2매라고 되어있는데.그럼 5명이 보려면 여러 아이디로 구매를 해야하나요?\n한아이디로 5명 구매해서 봐도 되는건가요??\n5명을 예매했는데 되서..그렇게 했는데 나중에 추가로 더 내라고 하는건 아니겠죠?', '2018-11-08', '9', '5', '3', '3');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('37', 'test38', '할인쿠폰문의입니다.', '다른 공연 관람 후 작업의 정석 5000원 관람권을 받았어요\n쿠폰 관람하고 예매하려니 8월 예매 페이지가 뜨고 관람 종료라고 나오네요\n할인권에는 9월 30일까지 라고 되어있고\n9월 예매 페이지에서는 할인권 사용이 안되도록 되어있어요\n해결 부탁합니다.', '2019-07-23', '6', '5', '3', '4');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('38', 'test39', '영어자막을 보여주시는지 질문드립니다.', '영어자막을 보여주시는지 질문드립니다.', '2019-09-11', '5', '1', '5', '8');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('39', 'test46', '직장인 할인 받았어요', '50프로 직장인 할인 받아서 티켓2장 예매했는데\n한명만 사원증 가지고 있어도 되나요?\n\n그리고 사원증 가지고 있는 사람이 예매자가 아닌 그냥 같이\n관람하는 사람이여도 되나요?', '2018-04-21', '4', '3', '7', '4');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('40', 'test45', '관람시간', '관람시간이 몇시간정도되나요?', '2018-11-28', '3', '1', '5', '5');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('41', 'test41', '12월에 공연 하시나요?', '12월에 공연하시나요?\n크리스마스 즈음 공연 보려고 예약하려고 헀더니\n예매가 안되서요 공연은 11월 까지 인가요?', '2018-11-29', '2', '2', '8', '6');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('42', 'test42', '1월 초 공연 예매', '1월 4일 공연은 언제쯤 티켓오픈하나요?', '2020-01-01', '3', '3', '9', '6');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('43', 'test37', '영수증 관련', '단체 예약했는데요(22표/나눠서)\n결제에 따른 증빙자료 제출을 해야해서\n영수증 등 관련 서류를 받고 싶은데,\n따로 요청하는 곳이 있나요?', '2019-03-05', '6', '1', '2', '6');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('44', 'test47', 'A열 좌석 관련', '남은 좌석이 얼마 없어서 A열에선 10좌석 정도 예매를 했는데요\n설명에 불편할수 있다고 기재하셨는데 어떤 점이 불편한지 먼저 알수 있을까요?\n남은 좌석이 얼마 없어서 A열에선 10좌석 정도 예매를 했는데요\n설명에 불편할수 있다고 기재하셨는데 어떤 점이 불편한지 먼저 알수 있을까요?\n남은 좌석이 얼마 없어서 A열에선 10좌석 정도 예매를 했는데요\n설명에 불편할수 있다고 기재하셨는데 어떤 점이 불편한지 먼저 알수 있을까요?', '2018-05-03', '2', '5', '4', '7');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('45', 'test43', '현장수령 문의', '부모님이 보실 연극을 제 계정으로 예약했습니다.\n\n현장수령 시 제 신분증이 필요한가요??\n아니면 예약자 정보만 있으면 현장수령이 가능한가요??\n\nex) 인터파크/예매자명/휴대폰번호\n\n확인 부탁드립니다.\n부모님이 보실 연극을 제 계정으로 예약했습니다.\n\n현장수령 시 제 신분증이 필요한가요??\n아니면 예약자 정보만 있으면 현장수령이 가능한가요??\n\nex) 인터파크/예매자명/휴대폰번호\n\n확인 부탁드립니다.\n부모님이 보실 연극을 제 계정으로 예약했습니다.\n\n현장수령 시 제 신분증이 필요한가요??\n아니면 예약자 정보만 있으면 현장수령이 가능한가요??\n\nex) 인터파크/예매자명/휴대폰번호\n\n확인 부탁드립니다.', '2018-11-13', '13', '4', '5', '8');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('46', 'test50', '멀티녀..', '멀티녀 오다운씨 공연은 없는건가요?', '2018-09-17', '1', '5', '3', '9');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('47', 'test39', '질문', '스테이지와 관객석 높이 차이는 얼마나 되나요 ?\n몇 열에서 봐야 올려다 보지 않을지 궁금해요 !', '2019-03-22', '2', '1', '7', '2');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('48', 'test43', '제한연령문의드립니다', '안녕하세요 초등학교5학년아들과 관람하고 싶은데 안되는걸까요?ㅠ', '2018-08-13', '4', '2', '4', '3');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('49', 'test42', '화장실', '공연 중 화장실 갔다올수있나요?\n공연 중 화장실 갔다올수있나요?\n공연 중 화장실 갔다올수있나요?', '2018-01-23', '3', '3', '5', '1');
INSERT INTO `showdb`.`QNA` (`QnA_id`, `user_id`, `QnA_title`, `QnA_content`, `QnA_date`, `QnA_views`, `group_number`, `order`, `depth`) VALUES ('50', 'test49', '혜화역 몇번 출구로 가는지요?', '지하철로 갈려고 하는데 어떻게 가야하는지요? 4호선 혜화역 몇번 출구인지...', '2018-02-11', '5', '3', '3', '6');



INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('1', 'test09', '1', '주금만', 'goldman@duaum.net', 'ceo', '1087951236', '2019-11-30');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('2', 'test10', '2', '임상민', 'ism@gmail.com', 'ceo', '1015887777', '2019-12-01');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('3', 'test11', '2', '김주현', 'kjh@naver.com', 'ceo', '1099998822', '2019-12-08');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('4', 'test12', '2', '신은석', 'sos@naver.com', 'ceo', '1074515441', '2019-12-28');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('5', 'test13', '2', '서묘음', 'smo@naver.com', 'client', '1099995555', '2019-12-13');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('6', 'test15', '2', '김상희', 'ksh@naver.com', 'client', '1054615555', '2020-01-05');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('7', 'test16', '2', '김덕현', 'kdh@naver.com', 'client', '1025638956', '2020-01-03');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('8', 'test17', '2', '김은혜', 'koh@gmail.com', 'client', '1054824565', '2019-12-14');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('9', 'test18', '2', '신재훈', 'sjh@naver.com', 'client', '1022222222', '2019-11-30');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('10', 'test19', '2', '길용성', 'kys@gmail.com', 'client', '1015154444', '2019-11-23');

INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('11', 'test36', '2', '김동균', 'donggun11@naver.com', 'client', '01099832342', '2020-01-07');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('12 ', 'test39', '3', '이상민', 'sangmin@daum.com', 'client', '01023494342', '2019-11-23');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('13', 'test44', '5', '김현정', 'ddekw11@naver.com', 'client', '01092344854', '2019-11-11');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('14', 'test47', '5', '서강준', 'gangnag22@naver.com', 'client', '01093432043', '2019-12-07');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('15', 'test50', '1', '한가인', 'songsong11@naver.com', 'client', '01098342458', '2019-12-11');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('16', 'test46', '1', '김경수', 'geuosk212@gmail.com', 'client', '01023994853', '2020-01-02');
INSERT INTO `showdb`.`blacklist` (`blacklist_id`, `user_id`, `reason_id`, `name`, `email`, `role`, `phone`, `delete_date`) VALUES ('17', 'test43', '1', '손민아', 'mina65@naver.com', 'client', '01029348543', '2020-01-05');





INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('1', '1', '친구도 저도 둘 다 인생 첫 연극 관람이었는데 정말 지루함 하나도 없이 즐겁게 관람했습니다. 관객들과 소통하는 부분도 너무 좋았고, 배우분들끼리의 호흡도 굉장히 잘 맞았던 것 같아서 보...', '4.0', '0', '2018-01-06');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('10', '10', '괜찮아요 안 봤을 수 있죠. 근데 꼭 보세요 ㅇㅡㅇ 정말 보셔야해요. 이거 보고 나오면서 면봉부터 챙겼어요. 너무 웃어서 눈물 나와서 판다 됬을까봐요 흡 음 몇몇군데에 불편할 수 있는 대사...', '4.0', '1', '2019-12-12');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('11', '11', '급하게 보기로 결정하고 10분전 예약하고 바로 입장했던 긴박한 시작ㅋㅋ', '3.0', '0', '2019-12-11');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('12', '12', '연극을 보러갔는데 자리도 다 정리가 안되어있고.. 심지어 의자에 뭘 누가 쏟았는지 의자도 젖어있어서... 정말 놀랐습니다... 그냥 연극 안보고 나갈뻔 했어요..', '2.0', '0', '2019-11-20');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('13', '13', '시간가는줄 모르며 맘껏 웃고 즐기며 재밌었던 공연', '3.5', '1', '2019-12-12');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('14', '14', '쉴틈없이 웃었어요', '4.0', '1', '2019-07-05');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('15', '15', '친구랑 봤는데 너무너무 재미있었어요! 배우님들 연기도 굳bbbb 다음엔 다른 결말로 또 보고싶어요!', '3.5', '1', '2019-08-07');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('16', '16', '너무 웃고 소리 질러서 광대랑 목이 아파요 눈물찔끔한 부분도 있어 혼자 웃다울다 바빴어요 처음에 두분이 오래하는건 밑밥이었어요 뒤에 계속 웃겨서 혼났어요 살아있는 연기 감사드려요', '4.0', '0', '2019-12-11');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('17', '17', '11월 17일 일요일 저녁 공연을 보러 갔습니다.', '3.5', '0', '2019-11-17');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('18', '18', '생각지도 않은 타이밍과 등장인물의 멘트로 숨어있던 웃음이 터지며 시간이 가는줄 몰랐네요~ 관객마다 개인차는 있을 수 있지만 저는 잼있게 봤고 추천드립니다.', '3.5', '1', '2019-12-06');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('19', '19', '부모님과 함께 본 공연이었는데, 딱 좋았어요.', '4.0', '0', '2019-11-09');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('2', '2', '대학로 연극을 한 달에 한두번은 본 사람으로써, 억지웃음 쥐어짜기 등에 막 식상했었는데, 이 연극은 처음부터 끝까지 호탕하게 웃을 수 있었습니다. 두 부부의 알콩달콩 신혼 모습도 보기 좋...', '3.5', '1', '2018-01-19');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('20', '20', '조용히 바라만 보는 공연 아닙니다', '3.5', '1', '2019-11-15');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('21', '21', '덕분에 즐거운 데이트 했습니다!', '4.0', '0', '2019-12-22');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('22', '22', '연극보는데 너무 내용자체가 부실했던거 같아요.. 재미와 감동을 위해 봤는데 재미와 감동은 커녕... 남는게 없는거 같네요.', '2.0', '1', '2019-12-22');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('23', '23', '꼭 봐요... 제발..', '4.0', '0', '2020-01-03');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('24', '24', '정말 재미있네요 배우 3분들의 연기력도 대단합니다 100분동안 시간이 지나는걸 못 느낄 정도 입니다^_^ 2020년 웃으면서 시작하네요~ㅋ', '4.0', '0', '2020-01-01');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('25', '25', '제발 꼭 보세요! 두번보세요! 세번보세요ㅜㅜ 장난아닙니다..', '4.0', '0', '2020-01-07');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('3', '3', '그럭저럭', '3.0', '0', '2018-06-30');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('4', '4', '좀 많이 비추 입니다.. 시설도 그렇고 .. 연극이 엄청 오래 있다가 시작했어요... 다시는 안보게 될것 같습니다.', '2.0', '0', '2019-02-17');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('5', '5', '긴장감을 줘서 너무 좋았어요! 잘 짜여진 연극 같았어요!!', '4.0', '1', '2019-05-06');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('6', '6', '너무 재밌었서 배꼽 빠질뻔 했어요!', '4.0', '0', '2019-09-09');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('7', '7', '인생 첫 연극을 회사 단체로 보게 되었는데 기대했던 것 이상으로 정말 너무너무 대박공연이었습니다!!', '4.0', '0', '2019-11-11');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('8', '8', '진짜 만족 만족 대 만족입니다.', '3.5', '1', '2019-12-25');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('9', '9', '조금 후기가 늦었네용 ㅠㅠ 어제 연극 봤는데 연극도 너무 잘하시구 중간중간 애드립도 정말 재밌었습니다!! 남친이랑 첫 새해 첫 연극으로 정말 보길 잘 한것 같아요!! 앞으로도 좋은 연기 보...', '3.5', '0', '2019-11-21');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('26', '34', '대학로 연극 엄청 오랜만에 갔는데 완전 만족했어요~ 극장 좌석도 넓은편이고 의자도 다른데보다 편했어요 스토리도 참신하고 조명을 극적인 상황에 굉장히 잘 쓰신게 보였어요', '4.0', '0', '2019-12-11');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('27', '28', '대학로 연극을 한 달에 한두번은 본 사람으로써, 억지웃음 쥐어짜기 등에 막 식상했었는데, 이 연극은 처음부터 끝까지 호탕하게 웃을 수 있었습니다. 두 부부의 알콩달콩 신혼 모습도 보기 좋았고, 시작전에 주는 떢볶이도 좋았어요, 관객호응을 끌어내는 것도 자연스러웠습니다. 배우들 케미와 연기력도 짱, 말미에 훌쩍이는 소리가 여기저기서 들리더군요, 혹시 볼까말까 망설이신다면 꼭 보세요~!!', '4.5', '0', '2019-08-13');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('28', '33', '정말 1시간 40분에 가까운 시간동안 울리다 웃기다....웃기다 지치게 만드는 연극 최곱니다.\n반전에 반전을 거듭하는 유머와 서스펜스(?) 정말 대박입니다.', '4.0', '0', '2019-09-11');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('29', '27', '오래전부터 재밌는 연극, 익히 들어왔는데 이제야 봤네요^^', '3.5', '0', '2018-05-06');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('30', '29', '사춘기 아들과 관람하기에도 어색하지 않은 공연을 찾던중 가족끼니 봐도 좋다고 평이나 선택한 연극이었는데 처음부터 어찌나 재밌던지 쌓인 스트레스를 날려버린 느낌이네요^^상의도 없이 마음대로 예매했다고 투덜거린 아들이 다음에 또 오자고 합니다^^주인집아주머니 연기 정말 통쾌하고 희노애락이 모두 있는 최고의 공연이었어요^^', '4.0', '0', '2018-09-04');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('31', '30', '저를 비롯해 친구들 모두 너무 재미있게 봤어요. 베트남 여자 역할했던 분은 청소년 연극 내일은 내일에게에서 연두 역할을 하셨던 분 맞죠? 그때 초등학생 딸아이와 연극을 봤었는데 연기를 정말 잘하셔서 눈에 익었어요. 얼마후 드라마 도깨비에서 잠깐 나오셨길래 저희 딸이 너무 반가워했답니다. 오백에삼십 보고와서 딸아이에게 사진을 보여줬더니 엄마, 이 여자분 연두 아니야?하면서 또 반가워하더라구요. 청소년 역할도, 임신한 외국인 역할도 모두 찰떡같이 소화하시네요.', '3.0', '0', '2018-03-23');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('32', '31', '2019년 마지막 남편과 데이트하러 타지에서 여행왔는데 대학로 연극을 처음봤어요. 멀리서 온 사람에게 선물을 주시는데 차마 텍사스님을 이기진 못했지만 1분1초 지루함도 없이 재밌게 관람했습니다. 배우분들 너무 이쁘고 잘생기시고 특히 멀티남님 재치와 연기에 감탄을! 관객과 호흡하며 극을 이끌어가는 재미에 이래서 연극을 보는구나 싶었어요. 정말 즐거운 시간 보냈습니다^^', '4.5', '0', '2019-12-29');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('33', '38', '사람이 많지않았는데도 너무 재밌게 잘봤습니다', '3.5', '0', '2019-03-15');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('34', '47', '친구 추천으로 같이 왔는데 배우분들 연기에 감탄하고 가요 ㅎㅎ 정말 너무 재밌었고 대학로 연극 보러 자주 와야겠어요 ㅠ ㅠ 진짜 너무 재밌어서 표현을...어떻게 해야 완벽할지 모르겠는 ㅠ ㅠ 배우분들 너무 수고하셨고 좋은 공연 보여주셔서 감사합니다', '5.0', '0', '2018-11-28');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('35', '26', '좋은 추억 만들고 갑니다. 배우 네분모두 너무 예쁘고 멋지고 개성 넘치고.. 부자되세요^^*', '3.5', '0', '2018-09-22');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('36', '39', '이전 극장때보다 시설이 쾌적해져서 편안하게 볼 수 있을 뿐더러 배우분들의 호흡이 좋아 정말 재미있게봤습니다!!!! 연인과 보기에 이보다 좋은 연극은 없는것 같아요. 강추강추입니다!!!!!!', '3.0', '0', '2019-06-05');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('37', '50', '\n배우들도 너무 잘생기고 귀엽고 ㅠㅠ 연기도 잘하셔서 몰입도 장난아니였구요!\n돈하나도 안아까운 연극이였어요!!마지막에 배우분들이랑 사진도 찍고 알찬 데이트하다가 갑니당!', '4.0', '0', '2019-12-08');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('38', '43', ' 주말에 남자친구랑 오랜만에 대학로 데이트했어요. 오랫동안 사랑받는 작품이라해서 더 기대가 많았었습니다. 들어본거와 같이 연기자님들 연기도 노래도 모두 알차고 재미있었어요. 한시간 반이란 시간이 전혀 길게 느껴지지 않을 정도로 재미있고 유쾌하게 시간보내고 왔습니다.', '3.0', '0', '2020-01-04');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('39', '40', '즐겁게 잘 봤습니다.최강추위라는 날이었는데 의외로 빈자리가 없을 정도로 많은 관객들이 있어서 놀랬고, 가벼운 맘으로 즐겁게 볼 수있어 좋았습니다.', '3.5', '0', '2018-06-23');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('40', '32', '대학로에서 이렇게 재밌는연극 진짜 처음인것같아여ㅋㅋㅋ주위친구들한테 추천중!!! 다들 한번씩 꼭 보세요\n', '4.0', '0', '2018-12-23');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('41', '44', '새해 첫날 맞이해서 가족이랑 보고왔어요 :) 보는 내내 빵터지고 배우님들 열연에 감동받고 왔어요! 부모님께서도 너무 즐거웠다고 또 보고싶다고 하시네요 ㅎㅎ 좋은 연기 감사드립니다', '3.5', '0', '2020-01-01');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('42', '46', '완전 별로... \n입장할때도 무슨 때지어 들어가고... 좌석에 앉아있지도 못하고 사람들 다 착석할때까지 문앞에 서있어야했고.(건물주는 다른사람들 입장할때까지 서있어야 하는거였나봐요).. 건물주좌석에 선물을 준다던데 뭘주셨죠?! 받은게 없어서 궁금해서 적어봅니다~', '1.0', '1', '2019-08-22');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('43', '48', '\n소극장 공연 추천한다는 지인의 얘기에 믿고 봤습니다.ㅎㅎ 다른 배우들 버전으로 또 보고 싶네요. 재밌고 즐거운 공연이에요. 그 안에서 깨달음도 있던. 덕분에 약2시간이 즐거웠습니다. 이런 소극장의 좋은 공연이 더 많아지기를 빕니다.', '3.0', '0', '2018-04-25');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('44', '36', '대전에서 지인들과 출발이후 머피의.법칙처럼 시간등 모든게 꼬여 지친상태에서 연극관람을 시작했습니다. 아..혹시 잼없으면 어쩌나 걱정하였으나 정말 쓸데없는 걱정이였네요. 오전에 꼬인 일정도 모두 잊고 웃게 만들어준 연극였습니다 그야말로 웃음과 감동이 함께한 최고의 연극 덕분에 지인분들과 웃으며 내려왔네요^^ 좋은.연극 선사해주셔서 감사합니다♡♡♡♡', '4.0', '0', '2019-06-27');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('45', '42', '여친과 휴가를 알차게 보낼수 있도록 너무 재미있고 감동적으로 관람했습니다. 후회없는 선택이었습니다. 함께한 첫 연극관람이었는데 좋은추억을 만들어주셔서 감사합니다. 배우님들 쵝오^^', '5.0', '0', '2019-02-28');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('46', '49', '\n기대한만큼 실망이 좀 컸던 연극... 좋은 평 많이 보고 보러 갔었는데, 보는 내내 실망했습니다. 전반적으로 어수선한 느낌의 연극이었어요. 내용 자체도 크게 재밌진 않았고요.. 현재 웬만한 사회문제를 하나씩 화두로 던져놓고 현실적으로 얘기를 풀어나가려는 점은 그래도 괜찮았어요~\n평점\n', '2.5', '1', '2019-03-17');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('47', '37', '무대와 관객석이 가까워 배우들의 감정선이 더욱 잘 보였던 공연이었습니다. 슬픔과 절망만 있을꺼 같은데 꼭 그렇지도 않은건 음악 때문이었을까요?', '5.0', '0', '2019-04-07');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('48', '41', '너무 좋은데 보는 내내 너무 마음이 힘들었어요 정말 일상의 한부분처럼 담담하고 잔잔하게 담아내서 더 눈물난거 같아요', '3.0', '1', '2019-08-03');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('49', '45', '창작진들이 이 이야기를 풀어가기위해 얼마나 고민했을지 느껴지는 공연이었습니다.\n따뜻하면서도 생각할것이 많았던 공연이었습니다.', '5.0', '0', '2019-04-23');
INSERT INTO `showdb`.`review` (`review_id`, `ticketing_id`, `review_content`, `review_grade`, `review_report_yn`, `review_date`) VALUES ('50', '35', '처음부터 마음이 따뜻해지고\n곱씹을수록 더 좋아지는 연극', '4.5', '0', '2019-05-07');



INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('1', '7', '5', '5');
INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('2', '10', '5', '6');
INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('3', '15', '6', '6');
INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('4', '14', '4', '6');
INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('5', '17', '5', '6');
INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('6', '16', '3', '7');

INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('26', '44', '7', '9');
INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('30', '49', '5', '11');
INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('36', '31', '5', '20');
INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('43', '28', '8', '9');
INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('46', '29', '7', '13');
INSERT INTO `showdb`.`book_seat` (`Key`, `ticketing_id`, `row`, `column`) VALUES ('48', '37', '2', '20');






INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('1', '1', '5', '60000', '3', '30000', '8', '24000', '5', '25000', '7', '35000', '5', '300000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('2', '2', '15', '750000', '6', '300000', '18', '240000', '5', '250000', '17', '350000', '5', '3000000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('3', '3', '18', '4000000', '13', '6500000', '19', '1330000', '5', '300000', '12', '60000', '30', '3000000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('4', '4', '14', '268000', '10', '300000', '18', '240000', '6', '300000', '7', '35000', '8', '400000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('5', '5', '16', '80000', '17', '510000', '10', '400000', '15', '45000', '8', '40000', '5', '16500');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('6', '6', '15', '60000', '10', '30000', '8', '24000', '5', '25000', '7', '35000', '5', '30000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('7', '7', '4', '60000', '9', '27000', '8', '32000', '5', '35000', '5', '40000', '3', '33000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('8', '8', '5', '120000', '9', '45000', '5', '42000', '5', '25000', '5', '35000', '8', '40000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('9', '9', '7', '35000', '5', '30000', '3', '24000', '7', '35000', '7', '49000', '4', '28000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('10', '10', '9', '480000', '6', '420000', '5', '240000', '4', '160000', '4', '16000', '5', '30000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('11', '11', '7', '49000', '6', '30000', '2', '24000', '6', '25000', '3', '35000', '5', '300000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('12', '12', '5', '160000', '7', '350000', '3', '240000', '7', '350000', '4', '400000', '7', '350000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('13', '13', '4', '60000', '9', '45000', '5', '24000', '6', '36000', '4', '40000', '8', '40000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('14', '14', '3', '66000', '7', '35000', '6', '12000', '8', '40000', '6', '36000', '5', '30000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('15', '15', '2', '60000', '8', '30000', '8', '24000', '9', '25000', '7', '35000', '6', '300000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('16', '16', '5', '10000', '3', '30000', '9', '36000', '6', '30000', '5', '35000', '8', '40000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('17', '17', '4', '600000', '2', '300000', '6', '240000', '9', '450000', '8', '400000', '4', '160000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('18', '18', '9', '450000', '4', '44000', '6', '24000', '4', '25000', '7', '35000', '4', '300000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('19', '19', '8', '40000', '6', '30000', '5', '24000', '5', '25000', '5', '35000', '4', '300000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('20', '20', '6', '60000', '9', '54000', '4', '40000', '6', '25000', '7', '35000', '4', '300000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('21', '21', '7', '350000', '5', '35000', '7', '21000', '3', '25000', '4', '35000', '6', '300000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('22', '22', '5', '60000', '5', '30000', '6', '24000', '5', '25000', '6', '36000', '2', '30000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('23', '23', '9', '54000', '4', '16000', '4', '24000', '6', '18000', '7', '35000', '2', '30000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('24', '24', '5', '60000', '4', '40000', '5', '40000', '5', '35000', '8', '48000', '3', '30000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('25', '25', '4', '16000', '3', '30000', '5', '24000', '5', '25000', '5', '35000', '4', '16000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('26', '26', '30', '2447800', '15', '1820000', '17', '2020000', '2', '144000', '1', '48000', '1', '52400');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('27', '27', '25', '3564000', '13', '1930000', '31', '4750000', '3', '182000', '1', '43000', '3', '145000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('28', '28', '35', '5476500', '9', '4790000', '23', '4938400', '2', '80900', '2', '24000', '4', '138000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('29', '29', '25', '4569500', '14', '3563000', '22', '3504000', '5', '364000', '5', '289000', '2', '128900');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('30', '30', '15', '1843000', '9', '7650000', '15', '1503000', '7', '385000', '7', '226000', '5', '189400');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('31', '31', '40', '6785000', '19', '5670000', '18', '5780000', '8', '484000', '4', '152000', '6', '278500');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('32', '32', '54', '7859300', '11', '6378000', '21', '4569000', '4', '128000', '6', '428000', '3', '145000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('33', '33', '23', '2459000', '12', '1985000', '23', '2785000', '3', '80900', '3', '138000', '2', '139400');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('34', '34', '27', '2845000', '7', '1840000', '18', '2658000', '2', '123000', '2', '154000', '5', '218500');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('35', '35', '33', '3560000', '8', '850000', '21', '2194000', '3', '132000', '3', '189000', '6', '198500');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('36', '36', '38', '6750000', '12', '1350000', '19', '4867000', '5', '328000', '3', '218000', '3', '223500');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('37', '37', '42', '7689000', '20', '3240000', '17', '4560000', '7', '413000', '4', '195000', '2', '156800');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('38', '38', '45', '6784000', '18', '3678000', '16', '3959000', '1', '28000', '2', '19800', '6', '98700');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('39', '39', '48', '6950000', '15', '3250000', '18', '5456900', '9', '508000', '5', '548000', '7', '587000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('40', '40', '29', '3456000', '14', '1805000', '15', '1940500', '6', '389000', '3', '148000', '8', '448000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('41', '41', '18', '1940000', '5', '560000', '13', '1569000', '4', '178000', '2', '148000', '6', '376000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('42', '42', '31', '5689000', '9', '876000', '19', '1456000', '7', '580700', '6', '348000', '5', '328000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('43', '43', '33', '6230000', '6', '680000', '20', '1568000', '5', '320000', '7', '384200', '8', '518000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('44', '44', '28', '4235000', '8', '879000', '21', '1387000', '3', '189000', '3', '186000', '3', '215400');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('45', '45', '13', '1895000', '5', '560000', '9', '780000', '2', '36800', '2', '86000', '4', '139800');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('46', '46', '39', '6543000', '12', '1203000', '18', '1560000', '1', '54800', '5', '275000', '8', '389600');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('47', '47', '52', '9856000', '23', '2478000', '31', '3486000', '7', '247000', '6', '125200', '11', '237800');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('48', '48', '48', '7859000', '17', '4560000', '28', '5270000', '5', '248000', '3', '58000', '3', '78900');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('49', '49', '54', '10053000', '21', '4740000', '29', '5600000', '15', '678000', '2', '56000', '9', '548000');
INSERT INTO `showdb`.`audience_count` (`audience_count_id`, `ticketing_id`, `audience1_count`, `audience1_amount`, `audience2_count`, `audience2_amount`, `audience3_count`, `audience3_amount`, `audience4_count`, `audience4_amount`, `audience5_count`, `audience5_amount`, `audience6_acount`, `audience6_amount`) VALUES ('50', '50', '33', '7895000', '9', '1203000', '17', '2387000', '11', '389000', '1', '38700', '4', '218400');















