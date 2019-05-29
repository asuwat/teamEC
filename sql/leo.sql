set names utf8;
set foreign_key_checks=0;

drop database if exists leo;
create database if not exists leo;
use leo;

create table user_info(
id int not null primary key auto_increment,
user_id varchar(16) not null unique,
password varchar(16) not null,
family_name varchar(32) not null,
first_name varchar(32) not null,
family_name_kana varchar(32) not null,
first_name_kana varchar(32) not null,
sex tinyint default 0,
email varchar(32),
status tinyint default 0,
logined tinyint default 0 not null,
regist_date datetime,
update_date datetime
);

insert into user_info values
(1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",0,0,now(),now()),
(2,"guest2","guest2","インターノウス","ゲストユーザー2","いんたーのうす","げすとゆーざー2",0,"guest2@gmail.com",0,0,now(),now()),
(3,"guest3","guest3","インターノウス","ゲストユーザー3","いんたーのうす","げすとゆーざー3",0,"guest3@gmail.com",0,0,now(),now()),
(4,"guest4","guest4","インターノウス","ゲストユーザー4","いんたーのうす","げすとゆーざー4",0,"guest4@gmail.com",0,0,now(),now()),
(5,"guest5","guest5","インターノウス","ゲストユーザー5","いんたーのうす","げすとゆーざー5",0,"guest5@gmail.com",0,0,now(),now()),
(6,"guest6","guest6","インターノウス","ゲストユーザー6","いんたーのうす","げすとゆーざー6",0,"guest6@gmail.com",0,0,now(),now()),
(7,"guest7","guest7","インターノウス","ゲストユーザー7","いんたーのうす","げすとゆーざー7",0,"guest7@gmail.com",0,0,now(),now()),
(8,"guest8","guest8","インターノウス","ゲストユーザー8","いんたーのうす","げすとゆーざー8",0,"guest8@gmail.com",0,0,now(),now()),
(9,"guest9","guest9","インターノウス","ゲストユーザー9","いんたーのうす","げすとゆーざー9",0,"guest9@gmail.com",0,0,now(),now()),
(10,"guest10","guest10","インターノウス","ゲストユーザー10","いんたーのうす","げすとゆーざー10",0,"guest10@gmail.com",0,0,now(),now()),
(11,"guest11","guest11","インターノウス","ゲストユーザー11","いんたーのうす","げすとゆーざー11",0,"guest11@gmail.com",0,0,now(),now()),
(12,"guest12","guest12","インターノウス","ゲストユーザー12","いんたーのうす","げすとゆーざー12",0,"guest12@gmail.com",0,0,now(),now());

create table product_info(
id int primary key not null auto_increment,
product_id int not null unique,
product_name varchar(100) not null unique,
product_name_kana varchar(100) not null unique,
product_description varchar(255),
category_id int not null,
price int not null,
image_file_path varchar(100) not null,
image_file_name varchar(50) not null,
release_date datetime,
release_company varchar(50),
status tinyint default 1,
regist_date datetime,
update_date datetime,
foreign key(category_id) references m_category(category_id)
);

insert into product_info values
(1,1,"五輪書","ごりんしょ","武蔵の代表的な著作であり、剣術の奥義をまとめたといわれる",2,9999999,"./images","book1.png",now(),"宮本武蔵",1,now(),now()),
(2,2,"ホノリウスの誓いの書","ほのりうすのちかいのしょ","中世の天使魔術書である",2,100000000,"./images","book2.png",now(),"John Dee",1,now(),now()),
(3,3,"児童書","じどうしょ","商品の詳細",2,2860,"./images","book3.png",now(),"幼稚園協会",1,now(),now()),
(4,4,"孫子の兵法書","そんしのひょうほうしょ","商品の詳細",2,3630,"./images","book4.png",now(),"孫子",1,now(),now()),
(5,5,"ノットラダムスの預言書","のっとらだむすのよげんしょ","商品の詳細",2,666,"./images","book5.png",now(),"ノットラダムス",1,now(),now()),
(6,6,"電気ケトル","でんきけとる","商品の詳細",3,770,"./images","kaden1.png",now(),"あ",1,now(),now()),
(7,7,"エアコン","えあこん","商品の詳細",3,220000,"./images","kaden2.png",now(),"あ",1,now(),now()),
(8,8,"冷蔵庫","れいぞうこ","商品の詳細",3,110000,"./images","kaden3.png",now(),"あ",1,now(),now()),
(9,9,"掃除機","そうじき","商品の詳細",3,3300,"./images","kaden4.png",now(),"あ",1,now(),now()),
(10,10,"30インチテレビジョン","30いんちてれびじょん","商品の詳細",3,33000,"./images","kaden5.png",now(),"あ",1,now(),now()),
(11,11,"ボードゲーム","ぼーどげーむ","ボードゲームを楽しもう",4,660,"./images","game1.png",now(),"サークル：ボードゲーム製作所",1,now(),now()),
(12,12,"トランプ","とらんぷ","ヴィンテージトランプカード",4,11000,"./images","game2.png",now(),"トランプ製作所",1,now(),now()),
(13,13,"Nippondo Swift","にっぽんどーすうぃふと","ニッポン堂が制作したプログラミングゲーム",4,5500,"./images","game3.png",now(),"ニッポン堂",1,now(),now()),
(14,14,"TAGAWA NO DAIBOUKEN","たがわのだいぼうけん","超演歌歌手・TAGAWAが海外に置き去りにされてしまった・・・。通じない歌、絶望的な資金・・・。彼は無事に日本に戻ってこられるのか？",4,5500,"./images","game4.png",now(),"TAGAWA CO., LTD.",1,now(),now()),
(15,15,"でんしゃ","でんしゃ","コインをいれてね",4,100,"./images","game5.png",now(),"株式会社",1,now(),now()),
(16,16,"TAGAWA 1stLive CD","たがわふぁーすとらいぶしーでぃー","超演歌歌手・TAGAWAのファーストライブを収録したCD",5,880,"./images","cd1.png",now(),"TAGAWA CO., LTD.",1,now(),now()),
(17,17,"2枚購入","2まいこうにゅう","2枚購入で大幅割引！超演歌歌手・TAGAWAのファーストライブを収録したCD",5,1650,"./images","cd2.png",now(),"TAGAWA CO., LTD.",1,now(),now()),
(18,18,"5枚購入","5まいこうにゅう","大特価！超演歌歌手・TAGAWAのファーストライブを収録したCD",5,3960,"./images","cd3.png",now(),"TAGAWA CO., LTD.",1,now(),now()),
(19,19,"握手券付CD","あくしゅけんつきしーでぃー","超演歌歌手・TAGAWAとの握手券を収録した新作CD予約権",5,1100,"./images","cd4.png",now(),"TAGAWA CO., LTD.",1,now(),now()),
(20,20,"TAGAWA Premium CD","たがわぷれみあむしーでぃー","超演歌歌手・TAGAWAのプレミアムCD、彼の黄金の輝きを表現したパッケージに購入特典7種付のお得なCD",5,1100000,"./images","cd5.png",now(),"TAGAWA CO., LTD.",1,now(),now());

create table cart_info(
id int primary key not null auto_increment,
user_id varchar(16) not null,
product_id int not null,
product_count int not null,
price int,
regist_date datetime,
update_date datetime,
foreign key(product_id) references product_info(product_id)
);

create table purchase_history_info(
id int primary key not null auto_increment,
user_id varchar(16) not null,
product_id int not null,
product_count int,
price int,
destination_id int not null,
regist_date datetime,
update_date datetime,
foreign key(user_id) references user_info(user_id),
foreign key(product_id) references product_info(product_id)
);

create table destination_info(
id int primary key not null auto_increment,
user_id varchar(16) not null,
family_name varchar(32) not null,
first_name varchar(32) not null,
family_name_kana varchar(32) not null,
first_name_kana varchar(32) not null,
email varchar(32),
tel_number varchar(13),
user_address varchar(50) not null,
regist_date datetime,
update_date datetime,
foreign key(user_id) references user_info(user_id)
);

create table m_category(
id int primary key not null auto_increment,
category_id int not null unique,
category_name varchar(20) not null unique,
category_description varchar(100),
insert_date datetime not null,
update_date datetime
);

insert into m_category values
(1,1,"全てのカテゴリ","全てのカテゴリが対象",now(),now()),
(2,2,"本","全ての本が対象",now(),now()),
(3,3,"家電･パソコン","全ての家電とパソコンが対象",now(),now()),
(4,4,"おもちゃ･ゲーム","全てのおもちゃとゲームが対象",now(),now()),
(5,5,"CD","全てのCDが対象",now(),now());
