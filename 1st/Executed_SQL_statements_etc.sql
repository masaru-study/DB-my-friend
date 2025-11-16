/* https://cosol.jp/techdb/2021/06/oracle_master_sql_study_with_live_sql/
* Oracle Live SQLの使い方は上記のURLを参照
* セッションが切れてログインできなくなったら、ブラウザを全部とじてから再度開き直す
*/

/* 1. まず最初にsetup.sqlをSQL WorksheetにコピペしてRunをクリックする */

/* 2. SELECT文 */
/* 列の値全てを取ってくる
* SELECT * FROM テーブル名;
*/
SELECT * FROM employees;

/* アスタリスクは全ての列名を表すが、以下のようにテーブルの定義にある列名を指定して必要な列の値だけ取ってくることもできる
*  SELECT カラム名1,カラム名2,カラム名3,…… FROM テーブル名;
*/
SELECT employee_id, salary, department_id FROM employees;

/* 3. Oracle SQLではテーブル名を小文字で入力しても大文字扱いになる
*     ダブルクォーテーションで囲うと区別できるが、それは次回以降に解説
*/
/* 入力値 */
SELECT * FROM employees;
/* 内部の処理は以下のように大文字扱いになる */
SELECT * FROM EMPLOYEES;

/* また、select句などは大文字で入力しても小文字で入力しても良い
*  ただし、現場では実行したSQL文を保存しておくので、小文字で書くか大文字で書くかはシステムの構文ルールに従うことが多い
*/
/* 以下2つは同じ処理 */
select * from employees
SELECT * FROM employees;

/* 4. INSERT文 
* INSERT INTO テーブル名 (列名1, 列名2, ...) VALUES (値1, 値2, ...);s
*/
INSERT INTO employees (employee_id, employee_name, hiredate, department_id)
 VALUES (2001, 'まさる', '2012-04-01', 1);

/* ※カラム名は省略可能。
* 　その場合、値を記述する順序がテーブルのカラムと一致している必要がある。
*/
INSERT INTO employees VALUES (2002, 'まさこ', NULL, 1004, 1001, '2012-04-01', 200000, NULL, 1);


/* 5. 文字列の囲み方 */

/* OK
*  文字列を囲むときにシングルクォーテーションを使う */
SELECT 'まさるの勉強部屋' FROM dual;

/* エラーになる
*  Oracle DBではダブルクォーテーションは下のように文字列を囲うと別の意味になってしまう
*  詳しくは次回以降で解説するが、大文字と小文字を区別するために使う
*  今回は PHP, Java みたいに文字列を囲うのにダブルクォーテーションは使えないと考えれば良い
*/
SELECT "まさるの勉強部屋" FROM dual;


/* 6. 文字列の結合をしたいとき */

/* 求める出力値 */
'まさるの勉強部屋'

/* OK
*  文字列結合には||を使う
*/
SELECT 'まさる' || 'の' || '勉強部屋' FROM dual;

/* エラーになる
*  Oracle DBでは「+」は文字列結合として使えない
*/
SELECT 'まさる' + 'の' + '勉強部屋' FROM dual;


/* 7. UPDATE文
*  値の更新をする
*/

/* UPDATE文実行前に employee_id = 2002の hiredate を確認する*/
SELECT * FROM employees;

/* employee_id = 2002の hiredate 「2025-11-15」にする処理を実行する */
UPDATE employees SET hiredate = '2025-11-15' WHERE employee_id = 2002;

/* employee_id = 2002の hiredate が「2025-11-15」になっていることを確認する */
SELECT * FROM employees;


/* 8. DELETE文
*  登録されている行の削除をする
*/

/* DELETE文実行前に employee_name = 'まさる'の行が存在することを確認する */
SELECT * FROM employees;

/* employee_name = 'まさる'の行の削除を実行する */
DELETE FROM employees WHERE employee_name = 'まさる';

/* employee_name = 'まさる'の行がなくなっていることを確認する */
SELECT * FROM employees;