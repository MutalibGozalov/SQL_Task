				-- TASK --
-- 1) Adının ilk iki harfi LA, LN, AA veya AN olanlar
SELECT FirstName, Lastname FROM Employees
WHERE FirstName LIKE 'L[AN]%' OR  FirstName LIKE 'A[AN]%'

-- 2) Adının içerisinde _ geçen isimleri listeleyiniz ( içeride kayıt yok diye yazmamazlık yapmayınız, bi zahmet 2 satır datayı güncelleyin :))
SELECT FirstName, Lastname FROM Employees
WHERE FirstName LIKE '%[_]%'

-- 3) Customers tablosundan CustomerID'sinin 2. harfi A, 4. harfi T olanların %10'luk kısmını getiren sorguyu yazınız.
SELECT TOP 10 PERCENT CustomerID FROM Customers
WHERE SUBSTRING(CustomerID, 2, 1) = 'A' AND SUBSTRING(CustomerID, 4, 1) = 'T'

-- 4) Adının 2. harfi A veya T olmayanlar
SELECT FirstName, Lastname FROM Employees
WHERE SUBSTRING(FirstName, 2, 1) LIKE '[^_AT]%'

SELECT FirstName, Lastname FROM Employees
WHERE SUBSTRING(FirstName, 2, 1) NOT LIKE '[_AT]%'

-- 5) Adının ilk harfi A ile I aralığında bulunmayanlar
SELECT FirstName, Lastname FROM Employees
WHERE LEFT(FirstName, 1) LIKE '[^A-I]%' 
ORDER BY FirstName

SELECT FirstName, Lastname FROM Employees
WHERE LEFT(FirstName, 1) NOT LIKE '[A-I]%'
ORDER BY FirstName
--A, B, C, D, E, F, G, H, I ------ J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z.


-- 6) Adı T ile bitmeyenler
SELECT FirstName, Lastname FROM Employees
WHERE FirstName NOT LIKE '%T'

SELECT FirstName, Lastname FROM Employees
WHERE RIGHT(FirstName, 1) != 'T'

-- Function Odev :) -> Yaş hesaplama :) verdiğiniz tarihe göre, kişinin parametrede gönderdiğiniz yaşı doldurup doldurmadığı geriye dönünüz
DECLARE @birthdate DATE = '1997-04-18';  -- Replace with the person's birthdate
DECLARE @has_reached_birthday NVARCHAR(250);

SET @has_reached_birthday = dbo.HasReachedBirthday(@birthdate, 25);

PRINT @has_reached_birthday;



-- 25.09.1988 , 35 -> Yıl ve ay olarak doldurmuştur, gün olarak eksiktir. | Yıl olarak doldurmuştur, ay ve gün olarak eksik, Yıl, ay ve gün olarak eksik
--[Database].[Northwind].[Programmability].[Functions].[Scalar-valued-Functions].

-- '[AL]%'  --> begins with A or L
-- '%[RT]%' --> R or T inside it
-- '[J-R]%' --> begins with Alphabetically between J and R
-- '%A_E%'  --> tAmEr, yAsEmin, tAnEr
-- '[^M]%'  --> NOT LIKE M%
-- '_r%'	--> r in the second position
-- 'a_%'	--> start with "a" and are at least 2 characters in length
-- 'a%o'	--> start with "a" and ends with "o"


-- [ % ] – Represents zero, one, or multiple characters.
-- [ _ ] – Represents one single character.