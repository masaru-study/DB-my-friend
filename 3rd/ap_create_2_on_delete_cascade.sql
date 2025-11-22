DROP TABLE 在庫 PURGE;
DROP TABLE 製品 PURGE;

CREATE TABLE 製品
	(製品番号		VARCHAR2(5) CONSTRAINT pk_製品 PRIMARY KEY,
	製品名		VARCHAR2(60),
    型		VARCHAR2(60),
	単価		NUMBER(20)
);

-- 外部キー制約に「ON DELETE RESTRICT」を設定している
-- ON DELETE CASCADE 参照先をdeleteすると、対応する参照元もdeleteされる
CREATE TABLE 在庫
	(在庫管理番号		VARCHAR2(5) CONSTRAINT pk_在庫管理 PRIMARY KEY,
	製品番号		VARCHAR2(5),
	在庫量		NUMBER(4),
    CONSTRAINT fk_在庫_製品 FOREIGN KEY (製品番号)
		REFERENCES 製品(製品番号)
		ON DELETE CASCADE
);

INSERT INTO 製品 VALUES ('P0001', 'iPhone 17', 'iPhone', 152900);
INSERT INTO 製品 VALUES ('P0002', 'Xiaomi 15T', 'Android', 64800);
INSERT INTO 製品 VALUES ('P0003', 'Google Pixel 10', 'Android', 119800);
INSERT INTO 製品 VALUES ('P0004', 'Xperia 10 Ⅶ', 'Android', 73500);
INSERT INTO 製品 VALUES ('P0005', 'Galaxy A25 5G', 'Android', 20980);
INSERT INTO 製品 VALUES ('P0006', 'AQUOS sense10(紐づけなし)', 'Android', 59900);

INSERT INTO 在庫 VALUES ('S0001', 'P0001', 20);
INSERT INTO 在庫 VALUES ('S0002', 'P0002', 10);
INSERT INTO 在庫 VALUES ('S0003', 'P0003', 30);
INSERT INTO 在庫 VALUES ('S0004', 'P0004', 15);
INSERT INTO 在庫 VALUES ('S0005', 'P0005', 50);