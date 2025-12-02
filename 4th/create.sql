DROP TABLE zaiko PURGE;
DROP TABLE seihin PURGE;

CREATE TABLE seihin
	(seihin_id_seihingawa		VARCHAR2(5) CONSTRAINT pk_seihin PRIMARY KEY,
	seihin_mei		VARCHAR2(60),
    kata		VARCHAR2(60),
	tanka		NUMBER(20)
);

CREATE TABLE zaiko
	(zaikokanri_id		VARCHAR2(5) CONSTRAINT pk_zaikokanri PRIMARY KEY,
	seihin_id_zaikogawa		VARCHAR2(5),
	zaikoryo		NUMBER(4),
    CONSTRAINT fk_zaiko_seihin FOREIGN KEY (seihin_id_zaikogawa) REFERENCES seihin(seihin_id_seihingawa)
);

INSERT INTO seihin VALUES ('P0001', 'iPhone 17', 'iPhone', 152900);
INSERT INTO seihin VALUES ('P0002', 'Xiaomi 15T', 'Android', 64800);
INSERT INTO seihin VALUES ('P0003', 'Google Pixel 10', 'Android', 119800);
INSERT INTO seihin VALUES ('P0004', 'Xperia 10 Ⅶ', 'Android', 73500);
INSERT INTO seihin VALUES ('P0005', 'Galaxy A25 5G', 'Android', 20980);
INSERT INTO seihin VALUES ('P0006', 'AQUOS sense10(紐づけなし)', 'Android', 59900);

INSERT INTO zaiko VALUES ('S0001', 'P0001', 20);
INSERT INTO zaiko VALUES ('S0002', 'P0002', 10);
INSERT INTO zaiko VALUES ('S0003', 'P0003', 30);
INSERT INTO zaiko VALUES ('S0004', 'P0004', 15);
INSERT INTO zaiko VALUES ('S0005', 'P0005', 50);