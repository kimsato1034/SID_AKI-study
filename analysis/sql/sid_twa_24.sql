-- we use 15 subqueries since the maximum amount of labresults we have found in the first 24 hours is 15.

WITH
  alldata AS (
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
  aggregateddata AS (
  SELECT
    patientunitstayid,
    labresultoffset,
    MAX(sodium) AS sodiumn,
    MAX(chloride) AS chloriden,
    ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY labresultoffset ASC) AS rn
  FROM
    alldata
  GROUP BY
    patientunitstayid,
    labresultoffset)
,maxperunitid AS(
 SELECT
 patientunitstayid
,MAX(rn) maxperunitidrn
FROM
aggregateddata
GROUP BY patientunitstayid
)
,sq01 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset01,
sodiumn AS sodium01,
chloriden AS chloride01
FROM
aggregateddata
WHERE
rn=1),sq02 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset02,
sodiumn AS sodium02,
chloriden AS chloride02
FROM
aggregateddata
WHERE
rn=2),sq03 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset03,
sodiumn AS sodium03,
chloriden AS chloride03
FROM
aggregateddata
WHERE
rn=3),sq04 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset04,
sodiumn AS sodium04,
chloriden AS chloride04
FROM
aggregateddata
WHERE
rn=4),sq05 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset05,
sodiumn AS sodium05,
chloriden AS chloride05
FROM
aggregateddata
WHERE
rn=5),sq06 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset06,
sodiumn AS sodium06,
chloriden AS chloride06
FROM
aggregateddata
WHERE
rn=6),sq07 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset07,
sodiumn AS sodium07,
chloriden AS chloride07
FROM
aggregateddata
WHERE
rn=7),sq08 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset08,
sodiumn AS sodium08,
chloriden AS chloride08
FROM
aggregateddata
WHERE
rn=8),sq09 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset09,
sodiumn AS sodium09,
chloriden AS chloride09
FROM
aggregateddata
WHERE
rn=9),sq10 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset10,
sodiumn AS sodium10,
chloriden AS chloride10
FROM
aggregateddata
WHERE
rn=10),sq11 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset11,
sodiumn AS sodium11,
chloriden AS chloride11
FROM
aggregateddata
WHERE
rn=10),sq12 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset12,
sodiumn AS sodium12,
chloriden AS chloride12
FROM
aggregateddata
WHERE
rn=12),sq13 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset13,
sodiumn AS sodium13,
chloriden AS chloride13
FROM
aggregateddata
WHERE
rn=13),sq14 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset14,
sodiumn AS sodium14,
chloriden AS chloride14
FROM
aggregateddata
WHERE
rn=14),sq15 AS(    
SELECT
patientunitstayid,
labresultoffset AS offset15,
sodiumn AS sodium15,
chloriden AS chloride15
FROM
aggregateddata
WHERE
rn=15),twasq AS(
SELECT
patientunitstayid 
,CASE WHEN maxperunitidrn = 1   THEN sodium01
	    WHEN maxperunitidrn = 2   THEN (((sodium01+sodium02)/2)*(offset02-offset01))/(offset02-offset01)
      WHEN maxperunitidrn = 3   THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02))/(offset03-offset01)
      WHEN maxperunitidrn = 4   THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03))/(offset04-offset01)
      WHEN maxperunitidrn = 5   THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03)+((sodium04+sodium05)/2)*(offset05-offset04))/(offset05-offset01)
      WHEN maxperunitidrn = 6   THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03)+((sodium04+sodium05)/2)*(offset05-offset04)+((sodium05+sodium06)/2)*(offset06-offset05))/(offset06-offset01)
      WHEN maxperunitidrn = 7   THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03)+((sodium04+sodium05)/2)*(offset05-offset04)+((sodium05+sodium06)/2)*(offset06-offset05)+((sodium06+sodium07)/2)*(offset07-offset06))/(offset07-offset01)
      WHEN maxperunitidrn = 8   THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03)+((sodium04+sodium05)/2)*(offset05-offset04)+((sodium05+sodium06)/2)*(offset06-offset05)+((sodium06+sodium07)/2)*(offset07-offset06)+((sodium07+sodium08)/2)*(offset08-offset07))/(offset08-offset01)
      WHEN maxperunitidrn = 9   THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03)+((sodium04+sodium05)/2)*(offset05-offset04)+((sodium05+sodium06)/2)*(offset06-offset05)+((sodium06+sodium07)/2)*(offset07-offset06)+((sodium07+sodium08)/2)*(offset08-offset07)+((sodium08+sodium09)/2)*(offset09-offset08))/(offset09-offset01)
      WHEN maxperunitidrn = 10  THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03)+((sodium04+sodium05)/2)*(offset05-offset04)+((sodium05+sodium06)/2)*(offset06-offset05)+((sodium06+sodium07)/2)*(offset07-offset06)+((sodium07+sodium08)/2)*(offset08-offset07)+((sodium08+sodium09)/2)*(offset09-offset08)+((sodium09+sodium10)/2)*(offset10-offset09))/(offset10-offset01)
      WHEN maxperunitidrn = 11  THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03)+((sodium04+sodium05)/2)*(offset05-offset04)+((sodium05+sodium06)/2)*(offset06-offset05)+((sodium06+sodium07)/2)*(offset07-offset06)+((sodium07+sodium08)/2)*(offset08-offset07)+((sodium08+sodium09)/2)*(offset09-offset08)+((sodium09+sodium10)/2)*(offset10-offset09)+((sodium10+sodium11)/2)*(offset11-offset10))/(offset11-offset01)
      WHEN maxperunitidrn = 12  THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03)+((sodium04+sodium05)/2)*(offset05-offset04)+((sodium05+sodium06)/2)*(offset06-offset05)+((sodium06+sodium07)/2)*(offset07-offset06)+((sodium07+sodium08)/2)*(offset08-offset07)+((sodium08+sodium09)/2)*(offset09-offset08)+((sodium09+sodium10)/2)*(offset10-offset09)+((sodium10+sodium11)/2)*(offset11-offset10)+((sodium11+sodium12)/2)*(offset12-offset11))/(offset12-offset01)
      WHEN maxperunitidrn = 13  THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03)+((sodium04+sodium05)/2)*(offset05-offset04)+((sodium05+sodium06)/2)*(offset06-offset05)+((sodium06+sodium07)/2)*(offset07-offset06)+((sodium07+sodium08)/2)*(offset08-offset07)+((sodium08+sodium09)/2)*(offset09-offset08)+((sodium09+sodium10)/2)*(offset10-offset09)+((sodium10+sodium11)/2)*(offset11-offset10)+((sodium11+sodium12)/2)*(offset12-offset11)+((sodium12+sodium13)/2)*(offset13-offset12))/(offset13-offset01)
      WHEN maxperunitidrn = 14  THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03)+((sodium04+sodium05)/2)*(offset05-offset04)+((sodium05+sodium06)/2)*(offset06-offset05)+((sodium06+sodium07)/2)*(offset07-offset06)+((sodium07+sodium08)/2)*(offset08-offset07)+((sodium08+sodium09)/2)*(offset09-offset08)+((sodium09+sodium10)/2)*(offset10-offset09)+((sodium10+sodium11)/2)*(offset11-offset10)+((sodium11+sodium12)/2)*(offset12-offset11)+((sodium12+sodium13)/2)*(offset13-offset12)+((sodium13+sodium14)/2)*(offset14-offset13))/(offset14-offset01)
      WHEN maxperunitidrn = 15  THEN (((sodium01+sodium02)/2)*(offset02-offset01)+((sodium02+sodium03)/2)*(offset03-offset02)+((sodium03+sodium04)/2)*(offset04-offset03)+((sodium04+sodium05)/2)*(offset05-offset04)+((sodium05+sodium06)/2)*(offset06-offset05)+((sodium06+sodium07)/2)*(offset07-offset06)+((sodium07+sodium08)/2)*(offset08-offset07)+((sodium08+sodium09)/2)*(offset09-offset08)+((sodium09+sodium10)/2)*(offset10-offset09)+((sodium10+sodium11)/2)*(offset11-offset10)+((sodium11+sodium12)/2)*(offset12-offset11)+((sodium12+sodium13)/2)*(offset13-offset12)+((sodium13+sodium14)/2)*(offset14-offset13)+((sodium14+sodium15)/2)*(offset15-offset14))/(offset15-offset01)
END AS sodiumtwaday1     
,CASE WHEN maxperunitidrn = 1   THEN chloride01
	    WHEN maxperunitidrn = 2   THEN (((chloride01+chloride02)/2)*(offset02-offset01))/(offset02-offset01)
      WHEN maxperunitidrn = 3   THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02))/(offset03-offset01)
      WHEN maxperunitidrn = 4   THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03))/(offset04-offset01)
      WHEN maxperunitidrn = 5   THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03)+((chloride04+chloride05)/2)*(offset05-offset04))/(offset05-offset01)
      WHEN maxperunitidrn = 6   THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03)+((chloride04+chloride05)/2)*(offset05-offset04)+((chloride05+chloride06)/2)*(offset06-offset05))/(offset06-offset01)
      WHEN maxperunitidrn = 7   THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03)+((chloride04+chloride05)/2)*(offset05-offset04)+((chloride05+chloride06)/2)*(offset06-offset05)+((chloride06+chloride07)/2)*(offset07-offset06))/(offset07-offset01)
      WHEN maxperunitidrn = 8   THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03)+((chloride04+chloride05)/2)*(offset05-offset04)+((chloride05+chloride06)/2)*(offset06-offset05)+((chloride06+chloride07)/2)*(offset07-offset06)+((chloride07+chloride08)/2)*(offset08-offset07))/(offset08-offset01)
      WHEN maxperunitidrn = 9   THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03)+((chloride04+chloride05)/2)*(offset05-offset04)+((chloride05+chloride06)/2)*(offset06-offset05)+((chloride06+chloride07)/2)*(offset07-offset06)+((chloride07+chloride08)/2)*(offset08-offset07)+((chloride08+chloride09)/2)*(offset09-offset08))/(offset09-offset01)
      WHEN maxperunitidrn = 10  THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03)+((chloride04+chloride05)/2)*(offset05-offset04)+((chloride05+chloride06)/2)*(offset06-offset05)+((chloride06+chloride07)/2)*(offset07-offset06)+((chloride07+chloride08)/2)*(offset08-offset07)+((chloride08+chloride09)/2)*(offset09-offset08)+((chloride09+chloride10)/2)*(offset10-offset09))/(offset10-offset01)
      WHEN maxperunitidrn = 11  THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03)+((chloride04+chloride05)/2)*(offset05-offset04)+((chloride05+chloride06)/2)*(offset06-offset05)+((chloride06+chloride07)/2)*(offset07-offset06)+((chloride07+chloride08)/2)*(offset08-offset07)+((chloride08+chloride09)/2)*(offset09-offset08)+((chloride09+chloride10)/2)*(offset10-offset09)+((chloride10+chloride11)/2)*(offset11-offset10))/(offset11-offset01)
      WHEN maxperunitidrn = 12  THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03)+((chloride04+chloride05)/2)*(offset05-offset04)+((chloride05+chloride06)/2)*(offset06-offset05)+((chloride06+chloride07)/2)*(offset07-offset06)+((chloride07+chloride08)/2)*(offset08-offset07)+((chloride08+chloride09)/2)*(offset09-offset08)+((chloride09+chloride10)/2)*(offset10-offset09)+((chloride10+chloride11)/2)*(offset11-offset10)+((chloride11+chloride12)/2)*(offset12-offset11))/(offset12-offset01)
      WHEN maxperunitidrn = 13  THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03)+((chloride04+chloride05)/2)*(offset05-offset04)+((chloride05+chloride06)/2)*(offset06-offset05)+((chloride06+chloride07)/2)*(offset07-offset06)+((chloride07+chloride08)/2)*(offset08-offset07)+((chloride08+chloride09)/2)*(offset09-offset08)+((chloride09+chloride10)/2)*(offset10-offset09)+((chloride10+chloride11)/2)*(offset11-offset10)+((chloride11+chloride12)/2)*(offset12-offset11)+((chloride12+chloride13)/2)*(offset13-offset12))/(offset13-offset01)
      WHEN maxperunitidrn = 14  THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03)+((chloride04+chloride05)/2)*(offset05-offset04)+((chloride05+chloride06)/2)*(offset06-offset05)+((chloride06+chloride07)/2)*(offset07-offset06)+((chloride07+chloride08)/2)*(offset08-offset07)+((chloride08+chloride09)/2)*(offset09-offset08)+((chloride09+chloride10)/2)*(offset10-offset09)+((chloride10+chloride11)/2)*(offset11-offset10)+((chloride11+chloride12)/2)*(offset12-offset11)+((chloride12+chloride13)/2)*(offset13-offset12)+((chloride13+chloride14)/2)*(offset14-offset13))/(offset14-offset01)
      WHEN maxperunitidrn = 15  THEN (((chloride01+chloride02)/2)*(offset02-offset01)+((chloride02+chloride03)/2)*(offset03-offset02)+((chloride03+chloride04)/2)*(offset04-offset03)+((chloride04+chloride05)/2)*(offset05-offset04)+((chloride05+chloride06)/2)*(offset06-offset05)+((chloride06+chloride07)/2)*(offset07-offset06)+((chloride07+chloride08)/2)*(offset08-offset07)+((chloride08+chloride09)/2)*(offset09-offset08)+((chloride09+chloride10)/2)*(offset10-offset09)+((chloride10+chloride11)/2)*(offset11-offset10)+((chloride11+chloride12)/2)*(offset12-offset11)+((chloride12+chloride13)/2)*(offset13-offset12)+((chloride13+chloride14)/2)*(offset14-offset13)+((chloride14+chloride15)/2)*(offset15-offset14))/(offset15-offset01)
END AS chloridetwaday1      
FROM
maxperunitid
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
 ,ROUND(sodiumtwaday1,2) AS sodium_twa_24
 ,ROUND(chloridetwaday1,2) AS chloride_twa_24
 ,ROUND(sodiumtwaday1 - chloridetwaday1,2) AS SID_twa_24
FROM
twasq