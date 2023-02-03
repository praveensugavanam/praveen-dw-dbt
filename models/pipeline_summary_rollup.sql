{{ config(materialized='table') }}

SELECT
    pipeline_execution_summary_cd.accountid  AS "pipeline_execution_summary_cd.accountid",
    pipeline_execution_summary_cd.orgidentifier  AS "pipeline_execution_summary_cd.orgidentifier",
        (TO_CHAR(DATE_TRUNC('month', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(TO_TIMESTAMP(pipeline_execution_summary_cd.startts /1000 ) AS TIMESTAMP_NTZ))), 'YYYY-MM')) AS "pipeline_execution_summary_cd.startts_month",
    COUNT(DISTINCT pipeline_execution_summary_cd.projectidentifier) AS total_projects
FROM public.pipeline_execution_summary_cd  AS pipeline_execution_summary_cd
WHERE (
    true
   )
GROUP BY
    (DATE_TRUNC('month', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(TO_TIMESTAMP(pipeline_execution_summary_cd.startts /1000 ) AS TIMESTAMP_NTZ)))),
    1,
    2
ORDER BY
    3 DESC