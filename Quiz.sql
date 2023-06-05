--declare @date1 datetime 
--declare @date2 date = getdate()

--if @date1 = @date2
--	print N'Tarixlər eynidir üüü'
--else
--	print N'Tarixlər fərqlidir ƏƏƏƏƏƏ'

--PRINT @date1
--PRINT @date2

--declare @binary BIT= 0

--PRINT CHOOSE(@binary+1, 'A', 'B')
--PRINT @binary
--PRINT @binary

--DECLARE @param nchar(4) = 'Code Academy'

--SELECT @param [Deyer], LEN(@param) Uzunluq, DATALENGTH(@param) Legth


--DECLARE @param2 nchar(6) = 'Code Academy'

--SELECT @param2 [Deyer], LEN(@param2) Uzunluq


DECLARE @param1 char(20) = 'Code Academy'
DECLARE @param2 varchar(20) = 'Code Academy'
--DECLARE @param3 text = 'Code Academy'
DECLARE @param4 nchar(20) = 'Code Academy'
DECLARE @param5 nvarchar(20) = 'Code Academy'
--DECLARE @param6 ntext = 'Code Academy'

SELECT  LEN(@param1) [char(20)]
	, LEN(@param2)   [varchar(20)]
	--, LEN(@param3) 
	, LEN(@param4)   [nchar(20)]
	, LEN(@param5)   [nvarchar(20)]
	--, LEN(@param6)

SELECT  DATALENGTH(@param1) [char(20)]
	, DATALENGTH(@param2)	[varchar(20)]
	--, DATALENGTH(@param3)
	, DATALENGTH(@param4)	[nchar(20)]
	, DATALENGTH(@param5)	[nvarchar(20)]
	--, DATALENGTH(@param6)


/*
char(20) 
varchar(20)
nchar(20)
nvarchar(20)

value in paranthese show max char count;

varchar  datatype occupies storage as count of charatrer while datatypes without N
prefix occupies storage as value in paranthese

datatypes starts witn n sotres 2 bytes per character
*/



DECLARE @GenderId BIT = 1

DECLARE @Param varchar(10) = 
CASE  @GenderId
	WHEN  0 THEN N'Qadın'
	WHEN 1 THEN N'Kişi'
	ELSE N':)'
END

print @Param



SELECT E.EmployeeID
FROM EmployeeTerritories ET, Employees E
WHERE DATEDIFF(YEAR, E.HireDate, GETDATE()) > 2
GROUP BY  E.EmployeeID

SELECT ET.EmployeeID
FROM EmployeeTerritories ET, Employees E
WHERE DATEDIFF(YEAR, E.HireDate, GETDATE()) > 2
GROUP BY ET.EmployeeID

/*
DML

MERGE
UPDATE
SELECT
DELETE
INSERT

---------------------
DCL

GRANT
REVOKE
DENY
--------------

CONSTRAINTS

NOT NULL
UNIQUE
FOREIGN KEY
CHECK

------------------
SET(DATA SET)

UNION
UNION ALL
INTERSECT
EXCEPT

--------------
DDL

CREATE
DROP
ALTER
TRUNCATE

*/


