-- 1.「SQLStatement_create_1.sql」を実行し、create文の説明をした。

-- 2.「SQLStatement_create_2.sql」を実行してなぜエラーになるか考えてもらった。(意外と嵌りやすい罠)

-- 2-1.生成AIに以下の内容を投げた。
```
CREATE TABLE members
	(member_id		NUMBER(4) CONSTRAINT pk_mem PRIMARY KEY,
	member_name		VARCHAR2(60),
	qualification_id		NUMBER(4));
CREATE TABLE qualifications
	(qualification_id		NUMBER(4) CONSTRAINT pk_qualifi PRIMARY KEY,
	qualification_name		VARCHAR2(60));
CREATE TABLE members_sub
	(member_id		NUMBER(4) CONSTRAINT pk_mem PRIMARY KEY,
	member_name		VARCHAR2(60),
	qualification_id		NUMBER(4));
Oracle DBで上記を実行したらエラーになったんだけど原因を教えて
```
-- 2-2.member_subのCONSTRAINTを削除した以下のSQL文を実行した。
CREATE TABLE members_sub
	(member_id		NUMBER(4) PRIMARY KEY,
	member_name		VARCHAR2(60),
	qualification_id		NUMBER(4));

-- 2-3.Schemaから作成したmembers_subテーブルのConstraintを確認する。(スキーマから確認できる)
/* 自動的に変な名前が付けられていることを確認する
   DBを運用する上では分かりやすい名前を付けることが大切！
 */

-- 3.「SQLStatement_left_join_etc.sql」を実行し、結合について確認した。
/* inner joinは紐づける列の値がNULLのものは除外
   left joinはFROMの後(左側)のテーブルを基準にして、右側のテーブルに紐づく列の値がないときはNULLが結合される
   right joinはleft joinに左右を逆にする
   full joinはleft join + right joinという感じの両方を基準に考える
*/

-- 4.Ping -tで「リレーショナル・データベース」の問題をみんなで解いて解説した。