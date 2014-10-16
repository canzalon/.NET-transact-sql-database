/*
 * Solution: .NET-transact-sql-database-project (assig3.doc)
 * Project: canzalon_assig3
 * File/Module: prob2invoke.sql
 * Author: Christopher Anzalone 
 * 
 * These Transact-SQL invoke the routines created in problem2a.sql
 */

use canzalon_spjdatabase
go

begin transaction 

SELECT * FROM J;
go

/* insertj SUCCESS case*/
declare @ecode integer;
execute @ecode = insertj 'J0', 'Stuff', 'Washington';
if @ecode = -1 
 print 'Insert failed.';
else 
 print 'Insert successful.';


SELECT * FROM J;
go

/* insertj FAILURE case */
declare @ecode integer;
execute @ecode = insertj 'J2', 'Punch', 'London';
if @ecode = -1 
 print 'Insert failed.';
else 
 print 'Insert successful.';

SELECT * FROM J;
go

/* deletej FAILURE case*/
declare @ecode integer;
execute @ecode = deletej 'J999';
if @ecode = -1 
 print 'Delete failed.';
else 
 print 'Delete successful.';

SELECT * FROM J;
go

/* deletej SUCCESS case */
declare @ecode integer;
execute @ecode = deletej 'J0';
if @ecode = -1 
 print 'Delete failed.' 
else 
 print 'Delete successful.';

SELECT * FROM J;
go

/* updatej FAILURE case */
declare @ecode integer;
execute @ecode = updatej 'J999', 'Paris';
if @ecode = -1 
 print 'Update failed.'; 
else 
 print 'Update successful.';

SELECT * FROM J;
go

/* updatej SUCCESS case */
declare @ecode integer;
execute @ecode = updatej 'J2', 'Paris';
if @ecode = -1 
 print 'Update failed.'; 
else 
 print 'Update successful.';

SELECT * FROM J;
go

SELECT * FROM jsp('S1','P1');

go

rollback