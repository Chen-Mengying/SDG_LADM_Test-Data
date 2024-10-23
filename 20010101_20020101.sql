\\changes in Party/PartyGroup/PartyMember
INSERT INTO LA_Party (pid, extPID, name, humanSex, p_type, beginLifespanVersion, endLifespanVersion, beginRealWorldLifespanVersion, endRealWorldLifespanVersion) VALUES
(10010, 110010, 'M5', 1, 1, '2001-01-01 08:35:03', NULL, '2001-01-01 00:00:00', NULL),
(10011, 110011, 'M6', 1, 1, '2001-01-01 08:35:03', NULL, '2001-01-01 00:00:00', NULL),
(10012, 110012, 'M7', 1, 1, '2001-01-01 08:35:03', NULL, '2001-01-01 00:00:00', NULL),
(10013, 110013, 'F5', 2, 1, '2002-01-01 09:25:13', NULL, '2001-01-01 00:00:00', NULL),
(10019, NULL, 'FC1', 9, 4, '2002-01-01 08:35:03', NULL, '2001-01-01 00:00:00', NULL);

INSERT INTO la_partygroup (pgid, pid, pg_type, beginLifespanVersion, endLifespanVersion, beginRealWorldLifespanVersion, endRealWorldLifespanVersion)
VALUES
(70001, 10019, 7, '2001-01-01 08:35:03', NULL, '2001-01-01 00:00:00', NULL);

CREATE TEMP TABLE temp_partymember AS 
SELECT * 
FROM la_partymember 
LIMIT 0; 

INSERT INTO temp_partymember (pmid, pgid, pid, share, beginLifespanVersion, endLifespanVersion, beginRealWorldLifespanVersion, endRealWorldLifespanVersion)
VALUES
(80001, 70001, 10010, '(1,3)', '2001-01-01 08:35:03', NULL, '2001-01-01 00:00:00', NULL),
(80002, 70001, 10011, '(1,3)', '2001-01-01 08:35:03', NULL, '2001-01-01 00:00:00', NULL),
(80003, 70001, 10012, '(1,3)', '2001-01-01 08:35:03', NULL, '2001-01-01 00:00:00', NULL);

select check_share_sum_partymember();
DROP TABLE IF EXISTS temp_partymember;

\\changes in la_right_1
UPDATE LA_Right
SET 
    endLifespanVersion = '2001-01-01 09:25:13', 
    endRealWorldLifespanVersion = '2001-01-01 00:00:00'
WHERE rID = 20004

\\changes in la_administrativesource_1
UPDATE LA_ADMINISTRATIVESOURCE
SET 
    lifeSpanStamp  = '2001-01-01 09:25:13'
WHERE asID = 40004;

\\changes in la_right_2
CREATE TEMP TABLE temp_laright AS 
SELECT * 
FROM LA_Right 
LIMIT 0; 

INSERT INTO temp_laright (rID, r_type,  suID, pID, share, shareCheck, timeSpec,
						  beginLifespanVersion, endLifespanVersion, 
						  beginRealWorldLifespanVersion, endRealWorldLifespanVersion)
VALUES (20014, 11, 30004, 10013, '(1,1)', TRUE, NULL,
		'2001-01-01 09:25:13', NULL, '2001-01-01 00:00:00', NULL);
		
SELECT check_share_sum_laright();
DROP TABLE IF EXISTS temp_laright ;

\\changes in la_administrativesource_2
INSERT INTO la_administrativesource (
    asid, text, as_type, rid, suid, pid, acceptance, lifeSpanStamp
) VALUES (
    40014, 'Ownership Title Document', 5, 20014, 30004, 10013, '2001-01-01 00:00:00', '2001-01-01 09:25:13'
);