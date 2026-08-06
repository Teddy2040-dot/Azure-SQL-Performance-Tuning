/*
==========================================================
Azure SQL Performance Tuning
Script: 01-MissingIndexes.sql

Purpose:
Shows missing index recommendations using
Dynamic Management Views (DMVs).

Works on:
- Azure SQL Database
- SQL Server
==========================================================
*/

SELECT
    migs.avg_total_user_cost,
    migs.avg_user_impact,
    migs.user_seeks,
    migs.user_scans,

    mid.statement AS TableName,

    mid.equality_columns,
    mid.inequality_columns,
    mid.included_columns,

    'CREATE INDEX IX_' +
    REPLACE(REPLACE(mid.statement,'[',''),']','') +
    ' ON ' + mid.statement +
    ' (' +
    ISNULL(mid.equality_columns,'') +

    CASE
        WHEN mid.equality_columns IS NOT NULL
         AND mid.inequality_columns IS NOT NULL
        THEN ','
        ELSE ''
    END +

    ISNULL(mid.inequality_columns,'') +
    ')' +

    CASE
        WHEN mid.included_columns IS NOT NULL
        THEN ' INCLUDE (' + mid.included_columns + ')'
        ELSE ''
    END
AS SuggestedIndex

FROM sys.dm_db_missing_index_groups mig
JOIN sys.dm_db_missing_index_group_stats migs
ON mig.index_group_handle = migs.group_handle

JOIN sys.dm_db_missing_index_details mid
ON mig.index_handle = mid.index_handle

ORDER BY
migs.avg_user_impact DESC;
GO
