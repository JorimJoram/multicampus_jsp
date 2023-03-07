drop table score;
drop table student;

create table student(
id varchar2(8) constraint student_id_pk primary key,
name varchar2(50) constraint student_name_nn not null,
gender varchar2(10) constraint student_gender_nn not null,
createDate date default sysdate,
constraint student_gender_ck check(gender in ('남', '여'))
);

create table score(
id varchar2(8) constraint score_id_pk primary key,
s_id varchar2(50) constraint score_sid_nn not null,
korean number(5, 2) constraint score_korean_ck check(korean > 0),
math number(5, 2) constraint score_math_ck check(math > 0),
english number(5, 2) constraint english check(english > 0),
science number(5, 2) constraint score_science_ck check(science > 0),
constraint score_sid_fk foreign key(s_id) references student(id)
);

create sequence score_seq
	start with 1
	increment by 1
	maxvalue 99999999
	nocycle;
