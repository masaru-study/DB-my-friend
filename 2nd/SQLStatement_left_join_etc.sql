SELECT * FROM members;
SELECT * FROM qualifications;

SELECT * FROM members INNER JOIN qualifications ON members.qualification_id = qualifications.qualification_id;
SELECT * FROM members LEFT JOIN qualifications ON members.qualification_id = qualifications.qualification_id;
SELECT * FROM members RIGHT JOIN qualifications ON members.qualification_id = qualifications.qualification_id;
SELECT * FROM members FULL JOIN qualifications ON members.qualification_id = qualifications.qualification_id;