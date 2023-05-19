--SELECT *
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = N'Products' AND TABLE_SCHEMA = 'dbo'

DECLARE @tableName NVARCHAR(128) = 'Products'; -- Replace with your table name

DECLARE @sql NVARCHAR(MAX) = 'public class ' + @tableName +  CHAR(13) + CHAR(10) +'{' ;

SELECT @sql = @sql +  
    CHAR(13) + CHAR(10) +
    '    ' + 'public ' +
    CASE 
        WHEN DATA_TYPE IN ('char', 'varchar', 'nchar', 'nvarchar', 'text', 'ntext') THEN 'string?' + ' ' +
    '' + COLUMN_NAME + '' + ' { get; set; }'
        ELSE 
            CASE 
                WHEN IS_NULLABLE = 'NO' THEN 
                    CASE 
                        WHEN DATA_TYPE IN ('bigint', 'int', 'smallint', 'tinyint') THEN 'int'
                        WHEN DATA_TYPE IN ('decimal', 'numeric', 'money', 'smallmoney') THEN 'decimal'
                        WHEN DATA_TYPE IN ('float', 'real') THEN 'float'
                        WHEN DATA_TYPE = 'date' THEN 'DateTime'
                        WHEN DATA_TYPE = 'datetime' THEN 'DateTime'
                        WHEN DATA_TYPE = 'datetime2' THEN 'DateTime'
                        WHEN DATA_TYPE = 'smalldatetime' THEN 'DateTime'
                        WHEN DATA_TYPE IN ('time', 'datetimeoffset') THEN 'TimeSpan'
                        WHEN DATA_TYPE = 'uniqueidentifier' THEN 'Guid'
                        ELSE DATA_TYPE
                    END + ' ' +
    '' + COLUMN_NAME + '' + ' { get; set; } = null!;'
                ELSE '' +
                    CASE 
                        WHEN DATA_TYPE IN ('bigint', 'int', 'smallint', 'tinyint') THEN 'int?'
                        WHEN DATA_TYPE IN ('decimal', 'numeric', 'money', 'smallmoney') THEN 'decimal?'
                        WHEN DATA_TYPE IN ('float', 'real') THEN 'float?'
                        WHEN DATA_TYPE = 'date' THEN 'DateTime?'
                        WHEN DATA_TYPE = 'datetime' THEN 'DateTime?'
                        WHEN DATA_TYPE = 'datetime2' THEN 'DateTime?'
                        WHEN DATA_TYPE = 'smalldatetime' THEN 'DateTime?'
                        WHEN DATA_TYPE IN ('time', 'datetimeoffset') THEN 'TimeSpan?'
                        WHEN DATA_TYPE = 'uniqueidentifier' THEN 'Guid?'
                        WHEN DATA_TYPE = 'image' THEN 'bytearray?'
                        ELSE DATA_TYPE
                    END + '' + ' ' +
    '' + COLUMN_NAME + '' + ' { get; set; }'
            END
    END +  CHAR(13) + CHAR(10)

FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @tableName;

set @sql = @sql + '}';
PRINT(@sql)