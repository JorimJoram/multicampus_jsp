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
	
insert into student (id, name, gender)
values ('20162173', '장효림', '남');
insert into student (id, name, gender)
values ('20080152', '정혜화', '여');
insert into student (id, name, gender)
values ('20009241', '주형준', '남');
insert into student (id, name, gender)
values ('20074175', '이효림', '여');
insert into student (id, name, gender)
values ('19822145', '김효남', '남');
insert into score (id, s_id, korean, math, english, science)
values(score_seq.nextval, '20162173', 93, 97.21, 100, 50.64);
insert into score (id, s_id, korean, math, english, science)
values(score_seq.nextval, '20080152', 100, 100, 100, 100);
insert into score (id, s_id, korean, math, english, science)
values(score_seq.nextval, '20009241', 10, 16.12, 2.6, 56);
insert into score (id, s_id, korean, math, english, science)
values(score_seq.nextval, '20074175', 70, 70, 70, 70);
insert into score (id, s_id, korean, math, english, science)
values(score_seq.nextval, '19822145', 100, 97.21, 100, 100);

commit;


