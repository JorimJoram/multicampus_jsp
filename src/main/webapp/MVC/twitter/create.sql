drop sequence twitter_seq;
drop table twitter;
drop table twitter_login;


create table twitter_login(
	id 		varchar2(20) constraint twitterLogin_id_pk primary key,
	passwd 	varchar2(30) constraint twitterLogin_passwd_nn not null,
	name 	varchar2(15) constraint twitterLogin_name_nn not null
);

insert into twitter_login
values('test', '1234', 'Jorim');
insert into twitter_login
values('joram', '1234', 'hyorim');

commit;

select * from twitter_login;

create table twitter(
	seq			number(7)		constraint twitter_no_pk primary key,
	id			varchar2(20) 	constraint twitter_id_fk references twitter_login(id),
	message		varchar2(300)	constraint twitter_message_nn not null,
	create_date	date 			default sysdate
);

create sequence twitter_seq
	start with 1
	increment by 1
	maxvalue 9999999
	nocycle;

insert into twitter(seq, id, message)
values (twitter_seq.nextval, 'joram', '1st twit ^^ did you see it?');
insert into twitter(seq, id, message)
values (twitter_seq.nextval, 'test', 'everything all right?');

select twitter.id || '@' || name as id_name, message, to_char(create_date, 'YYYY/MM/DD HH24:MI:ss')as cdatetime from twitter inner join twitter_login on twitter.id = twitter_login.id;