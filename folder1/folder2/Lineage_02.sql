INSERT OVERWRITE TABLE test_lineage_db_copy.table_5
SELECT
a.col1, b.col1 AS col2, c.col3_sum AS col3, col4, d.*
FROM
test_lineage_db.table_1 a JOIN test_lineage_db_copy.table_3 b ON a.id = b.table_1_id
LEFT JOIN
(SELECT table_1_id, sum(col3) AS col3_sum FROM test_lineage_db.table_4 GROUP BY table_1_id) c ON a.id = sq.table_1_id
CROSS JOIN
test_lineage_db.table_2 d;
INSERT OVERWRITE TABLE test_lineage_db_copy.table_7
SELECT a.col1, a.col2 + b.col2 AS col2
FROM
test_lineage_db_copy.table_5 a
LEFT JOIN
test_lineage_db.table_6 b
ON
a.col1 = b.col1;
