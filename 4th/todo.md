1. create.sqlを実行する。

2. select文を実行する。
```
SELECT * FROM seihin;
SELECT * FROM zaiko;
```

3. 親テーブルseihinのseihin_idを変更し、変更内容を子テーブルのzaikoのseihin_idに反映させたい状況を想像してみる。
- 以下を実行すると外部キー制約によりエラーになる
```
UPDATE seihin set seihin_id_seihingawa = 'P1001' where seihin_id_seihingawa = 'P0001';
```

4. 生成AIに以下の質問を投げる。
```
Oracle DB でupdate cascadeは設定できますか？
```

5. 以下のトリガー定義を作成する
```
CREATE OR REPLACE TRIGGER seihin_update_cascade
AFTER UPDATE OF seihin_id_seihingawa ON seihin
FOR EACH ROW
BEGIN
  UPDATE zaiko
  SET zaiko.seihin_id_zaikogawa = :NEW.seihin_id_seihingawa
  WHERE zaiko.seihin_id_zaikogawa = :OLD.seihin_id_seihingawa;
END;
```

6. 生成AIに以下の質問を投げる。
```
CREATE OR REPLACE TRIGGER seihin_update_cascade
AFTER UPDATE OF seihin_id_seihingawa ON seihin
FOR EACH ROW
BEGIN
  UPDATE zaiko
  SET zaiko.seihin_id_zaikogawa = :NEW.seihin_id_seihingawa
  WHERE zaiko.seihin_id_zaikogawa = :OLD.seihin_id_seihingawa;
END;
このトリガー定義をコード内で詳しく説明して
```

7. 再度3のupdate文を実行して正常に実行できることを確認する
```
UPDATE seihin set seihin_id_seihingawa = 'P1001' where seihin_id_seihingawa = 'P0001';
```
```
SELECT * FROM seihin;
SELECT * FROM zaiko;
```

8. トリガーを一時的に無効にしてみる。
```
ALTER TRIGGER seihin_update_cascade DISABLE;
```

- 無効化した後に以下のupdate文を実行するとエラーになる
```
UPDATE seihin set seihin_id_seihingawa = 'P2001' where seihin_id_seihingawa = 'P0002';
```

9. トリガーを再度有効化する。
```
ALTER TRIGGER seihin_update_cascade ENABLE;
```

- 有効化後に再度以下のupdate文を実行すると正常に実行できることが分かる
```
UPDATE seihin set seihin_id_seihingawa = 'P2001' where seihin_id_seihingawa = 'P0002';
```
```
SELECT * FROM seihin;
SELECT * FROM zaiko;
```

10. 生成AIに以下の質問を順番に投げる。
* 1つ目
```
update cascadeを使用する場面の具体例をいくつか挙げて教えてください
```

* 2つ目
```
ID以外の例もいくつか教えてください
```

11. Ping -tの「Select文」か「DDL文」の単元をみんなで解きながら解説する
