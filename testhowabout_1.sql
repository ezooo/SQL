use howAbout;

create table aboutMember(
	userName varchar(10) ,
    userId varchar(20) primary key,
    userPw varchar(20),
    userTel char(12),
    userAddr varchar(100),
    userDate char(10)
);

create table schedule_db(
	schedule_id bigint,
    schedule_date char(11),
    schedule_record text,
    weather text
);

create table aboutReview(
	userId varchar(20),
    reviewText varchar(500),
    reviewDate char(10),
    millisId bigint primary key,
    foreign key (userId) references aboutMember(userId) on delete cascade
);

create table aboutPlace(
	juso text,
    jibun text,
    category varchar(20),
    title varchar(50),
    status varchar(10),
    foodCategory varchar(20),
    latitude double,
    longitude double,
    updateNum INT AUTO_INCREMENT PRIMARY KEY
);

create table IF NOT EXISTS course(
    course_id bigint primary key,
    course_name varchar(20),
    location_name varchar(20),
    userId varchar(20),
    creation_date datetime(3)
)DEFAULT CHARSET=utf8;

create table if not exists schedule(
    schedule_id bigint primary key,
    schedule_record varchar(50),
    schedule_date date,
    weather varchar(30)
);

create table if not exists festival(
    fesNo bigint auto_increment primary key,
    fstvlNm text,
    opar text,
    fstvlStartDate date,
    fstvlEndDate date,
    fstvlCo text,
    mnnstNm    text,
    auspcInsttNm text,
    suprtInsttNm text,
    phoneNumber text,
    homepageUrl text,
    relateInfo text,
    rdnmadr text,
    lnmadr text,
    latitude text,
    longitude text,     
    referenceDate date
)CHARACTER SET utf8mb4;

create table if not exists festival_db(
    fesNo bigint auto_increment primary key,
    fstvlNm text,
    opar text,
    fstvlStartDate date,
    fstvlEndDate date,
    fstvlCo text,
    mnnstNm    text,
    auspcInsttNm text,
    suprtInsttNm text,
    phoneNumber text,
    homepageUrl text,
    relateInfo text,
    rdnmadr text,
    lnmadr text,
    latitude text,
    longitude text,     
    referenceDate date
)CHARACTER SET utf8mb4;

insert into festival(fstvlNm,opar,fstvlStartDate,fstvlEndDate,fstvlCo,mnnstNm,auspcInsttNm,suprtInsttNm,phoneNumber,homepageUrl,relateInfo,rdnmadr,lnmadr,latitude,longitude,referenceDate)
select fstvlNm,opar,fstvlStartDate,fstvlEndDate,fstvlCo,mnnstNm,auspcInsttNm,suprtInsttNm,phoneNumber,homepageUrl,relateInfo,rdnmadr,lnmadr,latitude,longitude,referenceDate from festival_db
where rdnmadr like "경상남도%" or lnmadr like "경상남도%";

create table location
(
	 data_title varchar(20),
	 user_address varchar(50),
	 latitude varchar(50),
	 longitude varchar(50),
	 insttnm varchar(20),
	 category_name1 varchar(20),
	 category_name2 varchar(20),
	 data_content text,
	 telno varchar(20),
	 fileurl1 text,
	 fileurl2 text,
	 fileurl3 text,
	 fileurl4 text,
     num int primary key auto_increment
);

create table recommendation
(
	recommendId bigint primary key,
    userId varchar(20),
    recommendTitle varchar(40),
	recommendContent varchar(500),
	recommendDate varchar(20)
);

create table diary
(
	diaryId bigint primary key,
	userId varchar(20),
    visit_date varchar(20),
    visit_location text,
    address text,
    visit_diary text,
    filename0 varchar(50),
    filename1 varchar(50),
    filename2 varchar(50),
    filename3 varchar(50),
    isopen varchar(5),
    foreign key(userId) references aboutMember(userId)
);