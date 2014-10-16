/*
 * Solution: .NET-transact-sql-database (assig3.doc)
 * Project: canzalon_assig3
 * File/Module: problem1.sql
 * Author: Christopher Anzalone 
 * 
 * A number of SQL statements on the database. See assig3.doc for details of each.
 */

use canzalon_spjdatabase;

--go 

/* 1.a */
SELECT sname 
FROM S, P, J, SPJ
WHERE P.pname = 'Bolt' /*'Nut'*/ and J.city = 'London' /*'Paris'*/ and SPJ.s# = S.s# and SPJ.p# = P.p# and SPJ.j# = J.j#;  

/* 1.b */
SELECT S.sname
FROM J INNER JOIN
 SPJ ON J.j# = SPJ.j# INNER JOIN
 P ON SPJ.p# = P.p# INNER JOIN
 S ON SPJ.s# = S.s#
WHERE (P.pname = 'Bolt') AND (J.city = 'London');

/* 1.c */
SELECT s# 
FROM SPJ
WHERE p# IN (SELECT pname FROM p WHERE p.pname = 'Bolt') and 
	  j# IN (SELECT city FROM j WHERE city = 'London'); 

/* 1.d */
(SELECT SPJ.j#
 FROM SPJ, S
 WHERE S.status > 20 AND SPJ.s# = S.s#)
INTERSECT
(SELECT SPJ,j#
 FROM SPJ, S
 WHERE S.city = 'London' AND SPJ.s# = S.s#);
 
 /* 1.e */
(SELECT SPJ.j#
 FROM SPJ, S
 WHERE S.status > 20 AND SPJ.s# = S.s#)
EXCEPT
(SELECT SPJ,j#
 FROM SPJ, S
 WHERE S.city = 'London' AND SPJ.s# = S.s#);

 /* 1.f */
 SELECT s#, avg(qty)
 FROM SPJ
 GROUP BY s#
 HAVING avg(qty) > (SELECT avg(qty) FROM SPJ WHERE s# = 'S2' AND p# = 'P3');