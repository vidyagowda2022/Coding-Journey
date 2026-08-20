# Write your MySQL query statement below
SELECT machine_id, ROUND(AVG(end - st),3) AS processing_time FROM
(
    SELECT machine_id, `timestamp` AS st, LEAD(`timestamp`) OVER (
        PARTITION BY machine_id, process_id 
        ORDER BY `timestamp`
    ) AS end
    FROM Activity
) t
WHERE end IS NOT NULL
GROUP BY machine_id;