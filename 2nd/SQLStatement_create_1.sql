DROP TABLE members PURGE;
DROP TABLE qualifications PURGE;

CREATE TABLE members
	(member_id		NUMBER(4) CONSTRAINT pk_mem PRIMARY KEY,
	member_name		VARCHAR2(60),
	qualification_id		NUMBER(4));

INSERT INTO members VALUES (1, 'ほいけんた', 1);
INSERT INTO members VALUES (2, 'たむたむ', 2);
INSERT INTO members VALUES (3, 'キンタロー。', 3);
INSERT INTO members VALUES (4, '富田鈴花', NULL);
INSERT INTO members VALUES (5, '遅咲駿', 5);

CREATE TABLE qualifications
	(qualification_id		NUMBER(4) CONSTRAINT pk_qualifi PRIMARY KEY,
	qualification_name		VARCHAR2(60));

INSERT INTO qualifications VALUES (1, '応用情報技術者試験');
INSERT INTO qualifications VALUES (2, '情報処理安全確保支援士');
INSERT INTO qualifications VALUES (3, 'データベーススペシャリスト');
INSERT INTO qualifications VALUES (4, 'ネットワークスペシャリスト');
INSERT INTO qualifications VALUES (5, '日本ビール検定1級');
INSERT INTO qualifications VALUES (6, 'カッパ捕獲許可証');