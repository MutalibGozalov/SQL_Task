alter FUNCTION dbo.HasReachedBirthday
(
    @birthdate DATE,
	@myage INTEGER
)
RETURNS NVARCHAR(250)
AS
BEGIN
    DECLARE @today DATE = GETDATE();
    DECLARE @current_birthday DATE = DATEFROMPARTS(YEAR(@today), MONTH(@birthdate), DAY(@birthdate));
	DECLARE @age INTEGER = DATEDIFF(YEAR, @birthdate, @today);
    DECLARE @yearOK BIT = CASE WHEN @myage >= @age THEN 1 ELSE 0 END;
    DECLARE @monthOK BIT = CASE WHEN MONTH(@today) >= MONTH(@current_birthday) THEN 1 ELSE 0 END;
    DECLARE @dayOK BIT = CASE WHEN DAY(@today) >= DAY(@current_birthday) THEN 1 ELSE 0 END;


    RETURN 
	CASE 
		WHEN @yearOK = 1 AND @monthOK = 1 AND @dayOK = 1  THEN 'The person has reached their birthday this year.' 
		WHEN @yearOK = 1 AND @monthOK = 1 AND @dayOK = 0  THEN 'Day not reached'
		WHEN @yearOK = 1 AND @monthOK = 0				  THEN 'Month not reached'
		ELSE 'The person has NOT reached their birthday this year.' 
	END;
end;