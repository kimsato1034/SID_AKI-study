WITH
  all_data AS (
  SELECT
    patientunitstayid,
    labresultoffset,
    CASE
      WHEN LOWER(labname) = 'sodium' THEN labresult END AS sodium,
    CASE
      WHEN LOWER(labname) = 'chloride' THEN labresult END AS chloride
  FROM
    `physionet-data.eicu_crd.lab`
  WHERE
    LOWER(labname) IN ('sodium','chloride')
    AND labresultoffset BETWEEN -6*60 AND 24*60 ),
  aggregated_data AS (
  SELECT
    patientunitstayid,
    labresultoffset,
    MAX(sodium) AS sodium_n,
    MAX(chloride) AS chloride_n,
    ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY labresultoffset ASC) AS rn
  FROM
    all_data
  GROUP BY
    patientunitstayid,
    labresultoffset)
,max_per_unitid AS(
 SELECT
 patientunitstayid
,MAX(rn) max_per_unitid_rn
FROM
aggregated_data
GROUP BY patientunitstayid
)
,sq01 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset01,
sodium_n AS sodium_01,
chloride_n AS chloride_01
FROM
aggregated_data
WHERE
rn=1),sq02 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset02,
sodium_n AS sodium_02,
chloride_n AS chloride_02
FROM
aggregated_data
WHERE
rn=2),sq03 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset03,
sodium_n AS sodium_03,
chloride_n AS chloride_03
FROM
aggregated_data
WHERE
rn=3),sq04 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset04,
sodium_n AS sodium_04,
chloride_n AS chloride_04
FROM
aggregated_data
WHERE
rn=4),sq05 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset05,
sodium_n AS sodium_05,
chloride_n AS chloride_05
FROM
aggregated_data
WHERE
rn=5),sq06 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset06,
sodium_n AS sodium_06,
chloride_n AS chloride_06
FROM
aggregated_data
WHERE
rn=6),sq07 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset07,
sodium_n AS sodium_07,
chloride_n AS chloride_07
FROM
aggregated_data
WHERE
rn=7),sq08 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset08,
sodium_n AS sodium_08,
chloride_n AS chloride_08
FROM
aggregated_data
WHERE
rn=8),sq09 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset09,
sodium_n AS sodium_09,
chloride_n AS chloride_09
FROM
aggregated_data
WHERE
rn=9),sq10 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset10,
sodium_n AS sodium_10,
chloride_n AS chloride_10
FROM
aggregated_data
WHERE
rn=10),sq11 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset11,
sodium_n AS sodium_11,
chloride_n AS chloride_11
FROM
aggregated_data
WHERE
rn=10),sq12 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset12,
sodium_n AS sodium_12,
chloride_n AS chloride_12
FROM
aggregated_data
WHERE
rn=12),sq13 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset13,
sodium_n AS sodium_13,
chloride_n AS chloride_13
FROM
aggregated_data
WHERE
rn=13),sq14 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset14,
sodium_n AS sodium_14,
chloride_n AS chloride_14
FROM
aggregated_data
WHERE
rn=14),sq15 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset15,
sodium_n AS sodium_15,
chloride_n AS chloride_15
FROM
aggregated_data
WHERE
rn=15),twa_sq AS(
SELECT
patientunitstayid 
,CASE WHEN max_per_unitid_rn = 1   THEN sodium_01
	    WHEN max_per_unitid_rn = 2   THEN (((sodium_01+sodium_02)/2)*(offset02-offset01))/(offset02-offset01)
      WHEN max_per_unitid_rn = 3   THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02))/(offset03-offset01)
      WHEN max_per_unitid_rn = 4   THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03))/(offset04-offset01)
      WHEN max_per_unitid_rn = 5   THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04))/(offset05-offset01)
      WHEN max_per_unitid_rn = 6   THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05))/(offset06-offset01)
      WHEN max_per_unitid_rn = 7   THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06))/(offset07-offset01)
      WHEN max_per_unitid_rn = 8   THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07))/(offset08-offset01)
      WHEN max_per_unitid_rn = 9   THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08))/(offset09-offset01)
      WHEN max_per_unitid_rn = 10  THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09))/(offset10-offset01)
      WHEN max_per_unitid_rn = 11  THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10))/(offset11-offset01)
      WHEN max_per_unitid_rn = 12  THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11))/(offset12-offset01)
      WHEN max_per_unitid_rn = 13  THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12))/(offset13-offset01)
      WHEN max_per_unitid_rn = 14  THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13))/(offset14-offset01)
      WHEN max_per_unitid_rn = 15  THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13))+((sodium_14+sodium_15)/2)*(offset15-offset14))/(offset15-offset01)
END AS sodium_twa_day1     
,CASE WHEN max_per_unitid_rn = 1   THEN chloride_01
	    WHEN max_per_unitid_rn = 2   THEN (((chloride_01+chloride_02)/2)*(offset02-offset01))/(offset02-offset01)
      WHEN max_per_unitid_rn = 3   THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02))/(offset03-offset01)
      WHEN max_per_unitid_rn = 4   THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03))/(offset04-offset01)
      WHEN max_per_unitid_rn = 5   THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04))/(offset05-offset01)
      WHEN max_per_unitid_rn = 6   THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05))/(offset06-offset01)
      WHEN max_per_unitid_rn = 7   THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06))/(offset07-offset01)
      WHEN max_per_unitid_rn = 8   THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07))/(offset08-offset01)
      WHEN max_per_unitid_rn = 9   THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08))/(offset09-offset01)
      WHEN max_per_unitid_rn = 10  THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09))/(offset10-offset01)
      WHEN max_per_unitid_rn = 11  THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10))/(offset11-offset01)
      WHEN max_per_unitid_rn = 12  THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11))/(offset12-offset01)
      WHEN max_per_unitid_rn = 13  THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12))/(offset13-offset01)
      WHEN max_per_unitid_rn = 14  THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13))/(offset14-offset01)
      WHEN max_per_unitid_rn = 15  THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14))/(offset15-offset01)
END AS chloride_twa_day1      
FROM
max_per_unitid
LEFT JOIN
sq01
USING(patientunitstayid)
LEFT JOIN
sq02
USING(patientunitstayid)
LEFT JOIN
sq03
USING(patientunitstayid)
LEFT JOIN
sq04
USING(patientunitstayid)
LEFT JOIN
sq05
USING(patientunitstayid)
LEFT JOIN
sq06
USING(patientunitstayid)
LEFT JOIN
sq07
USING(patientunitstayid)
LEFT JOIN
sq08
USING(patientunitstayid)
LEFT JOIN
sq09
USING(patientunitstayid)
LEFT JOIN
sq10
USING(patientunitstayid)
LEFT JOIN
sq11
USING(patientunitstayid)
LEFT JOIN
sq12
USING(patientunitstayid)
LEFT JOIN
sq13
USING(patientunitstayid)
LEFT JOIN
sq14
USING(patientunitstayid)
LEFT JOIN
sq15
USING(patientunitstayid)
)
SELECT
  patientunitstayid
 ,ROUND(sodium_twa_day1,2) AS sodium_twa_day1
 ,ROUND(chloride_twa_day1,2) AS chloride_twa_day1
 ,ROUND(sodium_twa_day1 - chloride_twa_day1,2) AS SID_twa_day1
FROM
twa_sq