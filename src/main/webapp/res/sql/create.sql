create table student(
	id varchar2(8) constraint student_id_pk primary key,
	name varchar2(30) constraint student_name_nn not null,
	gender number(1) constraint sutdent_gender_nn not null, -- 0 -> 여성, 1 -> 남성
)

create table score(
	id varchar2(8) constraint score_id_pk primary key,
	s_id varchar2()
)