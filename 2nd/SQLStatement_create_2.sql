/* 「SQLStatement_create_1.sql」を実行後に実行する
   実行するとエラーになる理由を考えてみよう
*/

DROP TABLE members_sub PURGE;

CREATE TABLE members_sub
	(member_id		NUMBER(4) CONSTRAINT pk_mem PRIMARY KEY,
	member_name		VARCHAR2(60),
	qualification_id		NUMBER(4));