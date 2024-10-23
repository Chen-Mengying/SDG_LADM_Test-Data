\\changes on la_partymember
UPDATE la_partymember
SET 
    endLifespanVersion = '2002-01-01 10:24:38',
	endRealWorldLifespanVersion = '2002-01-01 00:00:00'
WHERE pmID = 80001;


CREATE TEMP TABLE temp_partymember AS 
SELECT * 
FROM la_partymember 
LIMIT 0; 

INSERT INTO temp_partymember (pmid, pgid, pid, share, beginLifespanVersion, endLifespanVersion, beginRealWorldLifespanVersion, endRealWorldLifespanVersion)
VALUES (80004, 70001, 10002, '(1,3)', '2002-10-01 10:24:38', NULL, '2002-10-01 00:00:00', NULL);

select check_share_sum_partymember(); 
DROP TABLE IF EXISTS temp_partymember;

\\changes in la_party
INSERT INTO la_party (pid, extpid, name, p_type, humansex, beginLifespanVersion, endLifespanVersion, beginRealWorldLifespanVersion, endRealWorldLifespanVersion)
VALUES 
(10016, 110016, 'M9', 1, 1, '2002-02-01 12:12:16', NULL, '2002-02-01 00:00:00', NULL),
(10017, 110017, 'F7', 2, 1, '2002-02-01 12:12:16', NULL, '2002-02-01 00:00:00', NULL),
(10018, 110018, 'M10', 1, 1, '2002-02-01 12:12:16', NULL, '2002-02-01 00:00:00', NULL),
(10020, 110020, 'F8', 2, 1, '2002-02-01 12:12:16', NULL, '2002-02-01 00:00:00', NULL);

\\changes in la_right
CREATE TEMP TABLE temp_laright AS 
SELECT * 
FROM LA_Right 
LIMIT 0; 

INSERT INTO temp_laright (rID, r_Type, suID, pID, share, sharecheck, timespec, beginLifespanVersion, endLifespanVersion, beginRealWorldLifespanVersion, endRealWorldLifespanVersion)
VALUES 
(20015, 9, 30010, 10019, '(1,1)', TRUE, '10 years', '2002-01-01 17:09:25', NULL, '2002-01-01 00:00:00', NULL)

SELECT check_share_sum_laright();
DROP TABLE IF EXISTS temp_laright ;

CREATE TEMP TABLE temp_laright AS 
SELECT * 
FROM LA_Right 
LIMIT 0; 

INSERT INTO temp_laright (rID, r_Type, suID, pID, share, sharecheck, timespec, beginLifespanVersion, endLifespanVersion, beginRealWorldLifespanVersion, endRealWorldLifespanVersion)
VALUES 
(20016, 9, 30013, 10016, '(1,4)', TRUE, '10 years', '2002-02-01 12:12:16', NULL, '2002-02-01 00:00:00', NULL),
(20017, 9, 30013, 10017, '(1,4)', TRUE, '10 years', '2002-02-01 12:12:16', NULL, '2002-02-01 00:00:00', NULL),
(20018, 9, 30013, 10018, '(1,4)', TRUE, '10 years', '2002-02-01 12:12:16', NULL, '2002-02-01 00:00:00', NULL),
(20019, 9, 30013, 10020, '(1,4)', TRUE, '10 years', '2002-02-01 12:12:16', NULL, '2002-02-01 00:00:00', NULL);

SELECT check_share_sum_laright();
DROP TABLE IF EXISTS temp_laright ;

\\changes in la_administrativesource
INSERT INTO la_administrativesource (asid, text, as_type, rid, suid, pid, acceptance, lifeSpanStamp)
VALUES 
(40015, 'Lease Agreement', 1, 20015, 30010, 10019, '2002-01-01 00:00:00', '2002-01-01 17:09:25'),
(40016, 'Lease Agreement', 1, 20016, 30013, 10016, '2002-02-01 00:00:00', '2002-02-01 12:12:16'),
(40017, 'Lease Agreement', 1, 20017, 30013, 10017, '2002-02-01 00:00:00', '2002-02-01 12:12:16'),
(40018, 'Lease Agreement', 1, 20018, 30013, 10018, '2002-02-01 00:00:00', '2002-02-01 12:12:16'),
(40019, 'Lease Agreement', 1, 20019, 30013, 10020, '2002-02-01 00:00:00', '2002-02-01 12:12:16');

\\changes in extsecurelandrightsquestionnaire 
INSERT INTO extsecurelandrightsquestionnaire (eslrq_id, selfperception, name, extpid, begindate, enddate)
VALUES 
(60011, 1, 'M7', 110012, '2002-01-01', NULL),
(60012, 1, 'F5', 110013, '2002-01-01', NULL),
(60013, 0, 'M8', 110014, '2002-01-01', NULL);