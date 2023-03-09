drop table score;
drop table student;

create table student(
id varchar2(8) constraint student_id_pk primary key,
name varchar2(50) constraint student_name_nn not null,
gender varchar2(10) constraint student_gender_nn not null,
createDate date default sysdate,
modifiedDate date default sysdate,
constraint student_gender_ck check(gender in ('남', '여'))
);

create table score(
id varchar2(8) constraint score_id_pk primary key,
s_id varchar2(50) constraint score_sid_nn not null,
korean number(5, 2) constraint score_korean_ck check(korean between 0 and 100),
math number(5, 2) constraint score_math_ck check(math between 0 and 100),
english number(5, 2) constraint english check(english between 0 and 100),
science number(5, 2) constraint score_science_ck check(science between 0 and 100),
constraint score_sid_fk foreign key(s_id) references student(id)
);

create sequence score_seq
	start with 1
	increment by 1
	maxvalue 99999999
	nocycle;

create table search(
seq number(8) constraint search_seq_pk primary key,
views number constraint search_views_ck check(views > 0), 
id varchar(20)
);
create sequence search_seq
	start with 1
	increment by 1
	maxvalue 99999999
	nocycle;

