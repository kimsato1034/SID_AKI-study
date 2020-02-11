-- we use 46 subqueries since the maximum amount of labresults we have found in the first 24 hours is 46.

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
  aggregated_data AS (
  SELECT
    patientunitstayid,
    labresultoffset,
    MAX(sodium) AS sodium_n,
    MAX(chloride) AS chloride_n,
    ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY labresultoffset ASC) AS rn
  FROM
    alldata
  GROUP BY
    patientunitstayid,
    labresultoffset
  HAVING MAX(sodium) IS NOT NULL AND MAX(chloride) IS NOT NULL)
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
rn=15),
sq16 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset16,
   sodium_n AS sodium_16,
   chloride_n AS chloride_16
 FROM
   aggregated_data
 WHERE
   rn=16),
 sq17 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset17,
   sodium_n AS sodium_17,
   chloride_n AS chloride_17
 FROM
   aggregated_data
 WHERE
   rn=17),
 sq18 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset18,
   sodium_n AS sodium_18,
   chloride_n AS chloride_18
 FROM
   aggregated_data
 WHERE
   rn=18),
 sq19 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset19,
   sodium_n AS sodium_19,
   chloride_n AS chloride_19
 FROM
   aggregated_data
 WHERE
   rn=19),
 sq20 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset20,
   sodium_n AS sodium_20,
   chloride_n AS chloride_20
 FROM
   aggregated_data
 WHERE
   rn=20),
 sq21 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset21,
   sodium_n AS sodium_21,
   chloride_n AS chloride_21
 FROM
   aggregated_data
 WHERE
   rn=21),
 sq22 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset22,
   sodium_n AS sodium_22,
   chloride_n AS chloride_22
 FROM
   aggregated_data
 WHERE
   rn=22),
 sq23 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset23,
   sodium_n AS sodium_23,
   chloride_n AS chloride_23
 FROM
   aggregated_data
 WHERE
   rn=23),
 sq24 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset24,
   sodium_n AS sodium_24,
   chloride_n AS chloride_24
 FROM
   aggregated_data
 WHERE
   rn=24),
 sq25 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset25,
   sodium_n AS sodium_25,
   chloride_n AS chloride_25
 FROM
   aggregated_data
 WHERE
   rn=25),
 sq26 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset26,
   sodium_n AS sodium_26,
   chloride_n AS chloride_26
 FROM
   aggregated_data
 WHERE
   rn=26),
 sq27 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset27,
   sodium_n AS sodium_27,
   chloride_n AS chloride_27
 FROM
   aggregated_data
 WHERE
   rn=27),
 sq28 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset28,
   sodium_n AS sodium_28,
   chloride_n AS chloride_28
 FROM
   aggregated_data
 WHERE
   rn=28),
 sq29 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset29,
   sodium_n AS sodium_29,
   chloride_n AS chloride_29
 FROM
   aggregated_data
 WHERE
   rn=29),
 sq30 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset30,
   sodium_n AS sodium_30,
   chloride_n AS chloride_30
 FROM
   aggregated_data
 WHERE
   rn=30),
 sq31 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset31,
   sodium_n AS sodium_31,
   chloride_n AS chloride_31
 FROM
   aggregated_data
 WHERE
   rn=31),
 sq32 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset32,
   sodium_n AS sodium_32,
   chloride_n AS chloride_32
 FROM
   aggregated_data
 WHERE
   rn=32),
 sq33 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset33,
   sodium_n AS sodium_33,
   chloride_n AS chloride_33
 FROM
   aggregated_data
 WHERE
   rn=33),
 sq34 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset34,
   sodium_n AS sodium_34,
   chloride_n AS chloride_34
 FROM
   aggregated_data
 WHERE
   rn=34),
 sq35 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset35,
   sodium_n AS sodium_35,
   chloride_n AS chloride_35
 FROM
   aggregated_data
 WHERE
   rn=35),
 sq36 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset36,
   sodium_n AS sodium_36,
   chloride_n AS chloride_36
 FROM
   aggregated_data
 WHERE
   rn=36),
 sq37 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset37,
   sodium_n AS sodium_37,
   chloride_n AS chloride_37
 FROM
   aggregated_data
 WHERE
   rn=37),
 sq38 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset38,
   sodium_n AS sodium_38,
   chloride_n AS chloride_38
 FROM
   aggregated_data
 WHERE
   rn=38),
 sq39 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset39,
   sodium_n AS sodium_39,
   chloride_n AS chloride_39
 FROM
   aggregated_data
 WHERE
   rn=39),
 sq40 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset40,
   sodium_n AS sodium_40,
   chloride_n AS chloride_40
 FROM
   aggregated_data
 WHERE
   rn=40),
 sq41 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset41,
   sodium_n AS sodium_41,
   chloride_n AS chloride_41
 FROM
   aggregated_data
 WHERE
   rn=41),
 sq42 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset42,
   sodium_n AS sodium_42,
   chloride_n AS chloride_42
 FROM
   aggregated_data
 WHERE
   rn=42),
 sq43 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset43,
   sodium_n AS sodium_43,
   chloride_n AS chloride_43
 FROM
   aggregated_data
 WHERE
   rn=43),
 sq44 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset44,
   sodium_n AS sodium_44,
   chloride_n AS chloride_44
 FROM
   aggregated_data
 WHERE
   rn=44),
 sq45 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset45,
   sodium_n AS sodium_45,
   chloride_n AS chloride_45
 FROM
   aggregated_data
 WHERE
   rn=45),
 sq46 AS(
 SELECT
   patientunitstayid,
   labresultoffset AS offset46,
   sodium_n AS sodium_46,
   chloride_n AS chloride_46
 FROM
   aggregated_data
 WHERE
   rn=46),


   twa_sq AS(
  SELECT
    patientunitstayid,
    CASE
      WHEN max_per_unitid_rn = 1 THEN sodium_01
      WHEN max_per_unitid_rn = 2 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01))/(offset02-offset01)
      WHEN max_per_unitid_rn = 3 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02))/(offset03-offset01)
      WHEN max_per_unitid_rn = 4 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03))/(offset04-offset01)
      WHEN max_per_unitid_rn = 5 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04))/(offset05-offset01)
      WHEN max_per_unitid_rn = 6 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05))/(offset06-offset01)
      WHEN max_per_unitid_rn = 7 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06))/(offset07-offset01)
      WHEN max_per_unitid_rn = 8 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07))/(offset08-offset01)
      WHEN max_per_unitid_rn = 9 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08))/(offset09-offset01)
      WHEN max_per_unitid_rn = 10 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09))/(offset10-offset01)
      WHEN max_per_unitid_rn = 11 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10))/(offset11-offset01)
      WHEN max_per_unitid_rn = 12 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11))/(offset12-offset01)
      WHEN max_per_unitid_rn = 13 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12))/(offset13-offset01)
      WHEN max_per_unitid_rn = 14 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13))/(offset14-offset01)
      WHEN max_per_unitid_rn = 15 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14))/(offset15-offset01)
      WHEN max_per_unitid_rn = 16 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15))/(offset16-offset01)
      WHEN max_per_unitid_rn = 17 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16))/(offset17-offset01)
      WHEN max_per_unitid_rn = 18 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17))/(offset18-offset01)
      WHEN max_per_unitid_rn = 19 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18))/(offset19-offset01)
      WHEN max_per_unitid_rn = 20 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19))/(offset20-offset01)
      WHEN max_per_unitid_rn = 21 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20))/(offset21-offset01)
      WHEN max_per_unitid_rn = 22 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21))/(offset22-offset01)
      WHEN max_per_unitid_rn = 23 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22))/(offset23-offset01)
      WHEN max_per_unitid_rn = 24 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23))/(offset24-offset01)
      WHEN max_per_unitid_rn = 25 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24))/(offset25-offset01)
      WHEN max_per_unitid_rn = 26 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25))/(offset26-offset01)
      WHEN max_per_unitid_rn = 27 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26))/(offset27-offset01)
      WHEN max_per_unitid_rn = 28 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27))/(offset28-offset01)
      WHEN max_per_unitid_rn = 29 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28))/(offset29-offset01)
      WHEN max_per_unitid_rn = 30 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29))/(offset30-offset01)
      WHEN max_per_unitid_rn = 31 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30))/(offset31-offset01)
      WHEN max_per_unitid_rn = 32 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31))/(offset32-offset01)
      WHEN max_per_unitid_rn = 33 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32))/(offset33-offset01)
      WHEN max_per_unitid_rn = 34 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33))/(offset34-offset01)
      WHEN max_per_unitid_rn = 35 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34))/(offset35-offset01)
      WHEN max_per_unitid_rn = 36 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34)+((sodium_35+sodium_36)/2)*(offset36-offset35))/(offset36-offset01)
      WHEN max_per_unitid_rn = 37 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34)+((sodium_35+sodium_36)/2)*(offset36-offset35)+((sodium_36+sodium_37)/2)*(offset37-offset36))/(offset37-offset01)
      WHEN max_per_unitid_rn = 38 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34)+((sodium_35+sodium_36)/2)*(offset36-offset35)+((sodium_36+sodium_37)/2)*(offset37-offset36)+((sodium_37+sodium_38)/2)*(offset38-offset37))/(offset38-offset01)
      WHEN max_per_unitid_rn = 39 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34)+((sodium_35+sodium_36)/2)*(offset36-offset35)+((sodium_36+sodium_37)/2)*(offset37-offset36)+((sodium_37+sodium_38)/2)*(offset38-offset37)+((sodium_38+sodium_39)/2)*(offset39-offset38))/(offset39-offset01)
      WHEN max_per_unitid_rn = 40 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34)+((sodium_35+sodium_36)/2)*(offset36-offset35)+((sodium_36+sodium_37)/2)*(offset37-offset36)+((sodium_37+sodium_38)/2)*(offset38-offset37)+((sodium_38+sodium_39)/2)*(offset39-offset38)+((sodium_39+sodium_40)/2)*(offset40-offset39))/(offset40-offset01)
      WHEN max_per_unitid_rn = 41 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34)+((sodium_35+sodium_36)/2)*(offset36-offset35)+((sodium_36+sodium_37)/2)*(offset37-offset36)+((sodium_37+sodium_38)/2)*(offset38-offset37)+((sodium_38+sodium_39)/2)*(offset39-offset38)+((sodium_39+sodium_40)/2)*(offset40-offset39)+((sodium_40+sodium_41)/2)*(offset41-offset40))/(offset41-offset01)
      WHEN max_per_unitid_rn = 42 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34)+((sodium_35+sodium_36)/2)*(offset36-offset35)+((sodium_36+sodium_37)/2)*(offset37-offset36)+((sodium_37+sodium_38)/2)*(offset38-offset37)+((sodium_38+sodium_39)/2)*(offset39-offset38)+((sodium_39+sodium_40)/2)*(offset40-offset39)+((sodium_40+sodium_41)/2)*(offset41-offset40)+((sodium_41+sodium_42)/2)*(offset42-offset41))/(offset42-offset01)
      WHEN max_per_unitid_rn = 43 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34)+((sodium_35+sodium_36)/2)*(offset36-offset35)+((sodium_36+sodium_37)/2)*(offset37-offset36)+((sodium_37+sodium_38)/2)*(offset38-offset37)+((sodium_38+sodium_39)/2)*(offset39-offset38)+((sodium_39+sodium_40)/2)*(offset40-offset39)+((sodium_40+sodium_41)/2)*(offset41-offset40)+((sodium_41+sodium_42)/2)*(offset42-offset41)+((sodium_42+sodium_43)/2)*(offset43-offset42))/(offset43-offset01)
      WHEN max_per_unitid_rn = 44 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34)+((sodium_35+sodium_36)/2)*(offset36-offset35)+((sodium_36+sodium_37)/2)*(offset37-offset36)+((sodium_37+sodium_38)/2)*(offset38-offset37)+((sodium_38+sodium_39)/2)*(offset39-offset38)+((sodium_39+sodium_40)/2)*(offset40-offset39)+((sodium_40+sodium_41)/2)*(offset41-offset40)+((sodium_41+sodium_42)/2)*(offset42-offset41)+((sodium_42+sodium_43)/2)*(offset43-offset42)+((sodium_43+sodium_44)/2)*(offset44-offset43))/(offset44-offset01)
      WHEN max_per_unitid_rn = 45 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34)+((sodium_35+sodium_36)/2)*(offset36-offset35)+((sodium_36+sodium_37)/2)*(offset37-offset36)+((sodium_37+sodium_38)/2)*(offset38-offset37)+((sodium_38+sodium_39)/2)*(offset39-offset38)+((sodium_39+sodium_40)/2)*(offset40-offset39)+((sodium_40+sodium_41)/2)*(offset41-offset40)+((sodium_41+sodium_42)/2)*(offset42-offset41)+((sodium_42+sodium_43)/2)*(offset43-offset42)+((sodium_43+sodium_44)/2)*(offset44-offset43)+((sodium_44+sodium_45)/2)*(offset45-offset44))/(offset45-offset01)
      WHEN max_per_unitid_rn = 46 THEN (((sodium_01+sodium_02)/2)*(offset02-offset01)+((sodium_02+sodium_03)/2)*(offset03-offset02)+((sodium_03+sodium_04)/2)*(offset04-offset03)+((sodium_04+sodium_05)/2)*(offset05-offset04)+((sodium_05+sodium_06)/2)*(offset06-offset05)+((sodium_06+sodium_07)/2)*(offset07-offset06)+((sodium_07+sodium_08)/2)*(offset08-offset07)+((sodium_08+sodium_09)/2)*(offset09-offset08)+((sodium_09+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14)+((sodium_15+sodium_16)/2)*(offset16-offset15)+((sodium_16+sodium_17)/2)*(offset17-offset16)+((sodium_17+sodium_18)/2)*(offset18-offset17)+((sodium_18+sodium_19)/2)*(offset19-offset18)+((sodium_19+sodium_20)/2)*(offset20-offset19)+((sodium_20+sodium_21)/2)*(offset21-offset20)+((sodium_21+sodium_22)/2)*(offset22-offset21)+((sodium_22+sodium_23)/2)*(offset23-offset22)+((sodium_23+sodium_24)/2)*(offset24-offset23)+((sodium_24+sodium_25)/2)*(offset25-offset24)+((sodium_25+sodium_26)/2)*(offset26-offset25)+((sodium_26+sodium_27)/2)*(offset27-offset26)+((sodium_27+sodium_28)/2)*(offset28-offset27)+((sodium_28+sodium_29)/2)*(offset29-offset28)+((sodium_29+sodium_30)/2)*(offset30-offset29)+((sodium_30+sodium_31)/2)*(offset31-offset30)+((sodium_31+sodium_32)/2)*(offset32-offset31)+((sodium_32+sodium_33)/2)*(offset33-offset32)+((sodium_33+sodium_34)/2)*(offset34-offset33)+((sodium_34+sodium_35)/2)*(offset35-offset34)+((sodium_35+sodium_36)/2)*(offset36-offset35)+((sodium_36+sodium_37)/2)*(offset37-offset36)+((sodium_37+sodium_38)/2)*(offset38-offset37)+((sodium_38+sodium_39)/2)*(offset39-offset38)+((sodium_39+sodium_40)/2)*(offset40-offset39)+((sodium_40+sodium_41)/2)*(offset41-offset40)+((sodium_41+sodium_42)/2)*(offset42-offset41)+((sodium_42+sodium_43)/2)*(offset43-offset42)+((sodium_43+sodium_44)/2)*(offset44-offset43)+((sodium_44+sodium_45)/2)*(offset45-offset44)+((sodium_45+sodium_46)/2)*(offset46-offset45))/(offset46-offset01)
    END AS sodium_twa_24hr

    ,CASE WHEN max_per_unitid_rn = 1 THEN chloride_01
    WHEN max_per_unitid_rn = 2 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01))/(offset02-offset01)
    WHEN max_per_unitid_rn = 3 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02))/(offset03-offset01)
    WHEN max_per_unitid_rn = 4 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03))/(offset04-offset01)
    WHEN max_per_unitid_rn = 5 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04))/(offset05-offset01)
    WHEN max_per_unitid_rn = 6 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05))/(offset06-offset01)
    WHEN max_per_unitid_rn = 7 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06))/(offset07-offset01)
    WHEN max_per_unitid_rn = 8 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07))/(offset08-offset01)
    WHEN max_per_unitid_rn = 9 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08))/(offset09-offset01)
    WHEN max_per_unitid_rn = 10 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09))/(offset10-offset01)
    WHEN max_per_unitid_rn = 11 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10))/(offset11-offset01)
    WHEN max_per_unitid_rn = 12 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11))/(offset12-offset01)
    WHEN max_per_unitid_rn = 13 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12))/(offset13-offset01)
    WHEN max_per_unitid_rn = 14 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13))/(offset14-offset01)
    WHEN max_per_unitid_rn = 15 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14))/(offset15-offset01)
    WHEN max_per_unitid_rn = 16 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15))/(offset16-offset01)
    WHEN max_per_unitid_rn = 17 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16))/(offset17-offset01)
    WHEN max_per_unitid_rn = 18 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17))/(offset18-offset01)
    WHEN max_per_unitid_rn = 19 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18))/(offset19-offset01)
    WHEN max_per_unitid_rn = 20 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19))/(offset20-offset01)
    WHEN max_per_unitid_rn = 21 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20))/(offset21-offset01)
    WHEN max_per_unitid_rn = 22 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21))/(offset22-offset01)
    WHEN max_per_unitid_rn = 23 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22))/(offset23-offset01)
    WHEN max_per_unitid_rn = 24 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23))/(offset24-offset01)
    WHEN max_per_unitid_rn = 25 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24))/(offset25-offset01)
    WHEN max_per_unitid_rn = 26 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25))/(offset26-offset01)
    WHEN max_per_unitid_rn = 27 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26))/(offset27-offset01)
    WHEN max_per_unitid_rn = 28 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27))/(offset28-offset01)
    WHEN max_per_unitid_rn = 29 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28))/(offset29-offset01)
    WHEN max_per_unitid_rn = 30 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29))/(offset30-offset01)
    WHEN max_per_unitid_rn = 31 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30))/(offset31-offset01)
    WHEN max_per_unitid_rn = 32 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31))/(offset32-offset01)
    WHEN max_per_unitid_rn = 33 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32))/(offset33-offset01)
    WHEN max_per_unitid_rn = 34 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33))/(offset34-offset01)
    WHEN max_per_unitid_rn = 35 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34))/(offset35-offset01)
    WHEN max_per_unitid_rn = 36 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34)+((chloride_35+chloride_36)/2)*(offset36-offset35))/(offset36-offset01)
    WHEN max_per_unitid_rn = 37 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34)+((chloride_35+chloride_36)/2)*(offset36-offset35)+((chloride_36+chloride_37)/2)*(offset37-offset36))/(offset37-offset01)
    WHEN max_per_unitid_rn = 38 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34)+((chloride_35+chloride_36)/2)*(offset36-offset35)+((chloride_36+chloride_37)/2)*(offset37-offset36)+((chloride_37+chloride_38)/2)*(offset38-offset37))/(offset38-offset01)
    WHEN max_per_unitid_rn = 39 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34)+((chloride_35+chloride_36)/2)*(offset36-offset35)+((chloride_36+chloride_37)/2)*(offset37-offset36)+((chloride_37+chloride_38)/2)*(offset38-offset37)+((chloride_38+chloride_39)/2)*(offset39-offset38))/(offset39-offset01)
    WHEN max_per_unitid_rn = 40 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34)+((chloride_35+chloride_36)/2)*(offset36-offset35)+((chloride_36+chloride_37)/2)*(offset37-offset36)+((chloride_37+chloride_38)/2)*(offset38-offset37)+((chloride_38+chloride_39)/2)*(offset39-offset38)+((chloride_39+chloride_40)/2)*(offset40-offset39))/(offset40-offset01)
    WHEN max_per_unitid_rn = 41 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34)+((chloride_35+chloride_36)/2)*(offset36-offset35)+((chloride_36+chloride_37)/2)*(offset37-offset36)+((chloride_37+chloride_38)/2)*(offset38-offset37)+((chloride_38+chloride_39)/2)*(offset39-offset38)+((chloride_39+chloride_40)/2)*(offset40-offset39)+((chloride_40+chloride_41)/2)*(offset41-offset40))/(offset41-offset01)
    WHEN max_per_unitid_rn = 42 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34)+((chloride_35+chloride_36)/2)*(offset36-offset35)+((chloride_36+chloride_37)/2)*(offset37-offset36)+((chloride_37+chloride_38)/2)*(offset38-offset37)+((chloride_38+chloride_39)/2)*(offset39-offset38)+((chloride_39+chloride_40)/2)*(offset40-offset39)+((chloride_40+chloride_41)/2)*(offset41-offset40)+((chloride_41+chloride_42)/2)*(offset42-offset41))/(offset42-offset01)
    WHEN max_per_unitid_rn = 43 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34)+((chloride_35+chloride_36)/2)*(offset36-offset35)+((chloride_36+chloride_37)/2)*(offset37-offset36)+((chloride_37+chloride_38)/2)*(offset38-offset37)+((chloride_38+chloride_39)/2)*(offset39-offset38)+((chloride_39+chloride_40)/2)*(offset40-offset39)+((chloride_40+chloride_41)/2)*(offset41-offset40)+((chloride_41+chloride_42)/2)*(offset42-offset41)+((chloride_42+chloride_43)/2)*(offset43-offset42))/(offset43-offset01)
    WHEN max_per_unitid_rn = 44 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34)+((chloride_35+chloride_36)/2)*(offset36-offset35)+((chloride_36+chloride_37)/2)*(offset37-offset36)+((chloride_37+chloride_38)/2)*(offset38-offset37)+((chloride_38+chloride_39)/2)*(offset39-offset38)+((chloride_39+chloride_40)/2)*(offset40-offset39)+((chloride_40+chloride_41)/2)*(offset41-offset40)+((chloride_41+chloride_42)/2)*(offset42-offset41)+((chloride_42+chloride_43)/2)*(offset43-offset42)+((chloride_43+chloride_44)/2)*(offset44-offset43))/(offset44-offset01)
    WHEN max_per_unitid_rn = 45 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34)+((chloride_35+chloride_36)/2)*(offset36-offset35)+((chloride_36+chloride_37)/2)*(offset37-offset36)+((chloride_37+chloride_38)/2)*(offset38-offset37)+((chloride_38+chloride_39)/2)*(offset39-offset38)+((chloride_39+chloride_40)/2)*(offset40-offset39)+((chloride_40+chloride_41)/2)*(offset41-offset40)+((chloride_41+chloride_42)/2)*(offset42-offset41)+((chloride_42+chloride_43)/2)*(offset43-offset42)+((chloride_43+chloride_44)/2)*(offset44-offset43)+((chloride_44+chloride_45)/2)*(offset45-offset44))/(offset45-offset01)
    WHEN max_per_unitid_rn = 46 THEN (((chloride_01+chloride_02)/2)*(offset02-offset01)+((chloride_02+chloride_03)/2)*(offset03-offset02)+((chloride_03+chloride_04)/2)*(offset04-offset03)+((chloride_04+chloride_05)/2)*(offset05-offset04)+((chloride_05+chloride_06)/2)*(offset06-offset05)+((chloride_06+chloride_07)/2)*(offset07-offset06)+((chloride_07+chloride_08)/2)*(offset08-offset07)+((chloride_08+chloride_09)/2)*(offset09-offset08)+((chloride_09+chloride_10)/2)*(offset10-offset09)+((chloride_10+chloride_11)/2)*(offset11-offset10)+((chloride_11+chloride_12)/2)*(offset12-offset11)+((chloride_12+chloride_13)/2)*(offset13-offset12)+((chloride_13+chloride_14)/2)*(offset14-offset13)+((chloride_14+chloride_15)/2)*(offset15-offset14)+((chloride_15+chloride_16)/2)*(offset16-offset15)+((chloride_16+chloride_17)/2)*(offset17-offset16)+((chloride_17+chloride_18)/2)*(offset18-offset17)+((chloride_18+chloride_19)/2)*(offset19-offset18)+((chloride_19+chloride_20)/2)*(offset20-offset19)+((chloride_20+chloride_21)/2)*(offset21-offset20)+((chloride_21+chloride_22)/2)*(offset22-offset21)+((chloride_22+chloride_23)/2)*(offset23-offset22)+((chloride_23+chloride_24)/2)*(offset24-offset23)+((chloride_24+chloride_25)/2)*(offset25-offset24)+((chloride_25+chloride_26)/2)*(offset26-offset25)+((chloride_26+chloride_27)/2)*(offset27-offset26)+((chloride_27+chloride_28)/2)*(offset28-offset27)+((chloride_28+chloride_29)/2)*(offset29-offset28)+((chloride_29+chloride_30)/2)*(offset30-offset29)+((chloride_30+chloride_31)/2)*(offset31-offset30)+((chloride_31+chloride_32)/2)*(offset32-offset31)+((chloride_32+chloride_33)/2)*(offset33-offset32)+((chloride_33+chloride_34)/2)*(offset34-offset33)+((chloride_34+chloride_35)/2)*(offset35-offset34)+((chloride_35+chloride_36)/2)*(offset36-offset35)+((chloride_36+chloride_37)/2)*(offset37-offset36)+((chloride_37+chloride_38)/2)*(offset38-offset37)+((chloride_38+chloride_39)/2)*(offset39-offset38)+((chloride_39+chloride_40)/2)*(offset40-offset39)+((chloride_40+chloride_41)/2)*(offset41-offset40)+((chloride_41+chloride_42)/2)*(offset42-offset41)+((chloride_42+chloride_43)/2)*(offset43-offset42)+((chloride_43+chloride_44)/2)*(offset44-offset43)+((chloride_44+chloride_45)/2)*(offset45-offset44)+((chloride_45+chloride_46)/2)*(offset46-offset45))/(offset46-offset01)
    END AS chloride_twa_24hr


  FROM
    max_per_unitid
  LEFT JOIN
    sq01
  USING
    (patientunitstayid)
  LEFT JOIN
    sq02
  USING
    (patientunitstayid)
  LEFT JOIN
    sq03
  USING
    (patientunitstayid)
  LEFT JOIN
    sq04
  USING
    (patientunitstayid)
  LEFT JOIN
    sq05
  USING
    (patientunitstayid)
  LEFT JOIN
    sq06
  USING
    (patientunitstayid)
  LEFT JOIN
    sq07
  USING
    (patientunitstayid)
  LEFT JOIN
    sq08
  USING
    (patientunitstayid)
  LEFT JOIN
    sq09
  USING
    (patientunitstayid)
  LEFT JOIN
    sq10
  USING
    (patientunitstayid)
  LEFT JOIN
    sq11
  USING
    (patientunitstayid)
  LEFT JOIN
    sq12
  USING
    (patientunitstayid)
  LEFT JOIN
    sq13
  USING
    (patientunitstayid)
  LEFT JOIN
    sq14
  USING
    (patientunitstayid)
  LEFT JOIN
    sq15
  USING
    (patientunitstayid)
  LEFT JOIN
    sq16
  USING
    (patientunitstayid)
  LEFT JOIN
    sq17
  USING
    (patientunitstayid)
  LEFT JOIN
    sq18
  USING
    (patientunitstayid)
  LEFT JOIN
    sq19
  USING
    (patientunitstayid)
  LEFT JOIN
    sq20
  USING
    (patientunitstayid)
  LEFT JOIN
    sq21
  USING
    (patientunitstayid)
  LEFT JOIN
    sq22
  USING
    (patientunitstayid)
  LEFT JOIN
    sq23
  USING
    (patientunitstayid)
  LEFT JOIN
    sq24
  USING
    (patientunitstayid)
  LEFT JOIN
    sq25
  USING
    (patientunitstayid)
  LEFT JOIN
    sq26
  USING
    (patientunitstayid)
  LEFT JOIN
    sq27
  USING
    (patientunitstayid)
  LEFT JOIN
    sq28
  USING
    (patientunitstayid)
  LEFT JOIN
    sq29
  USING
    (patientunitstayid)
  LEFT JOIN
    sq30
  USING
    (patientunitstayid)
  LEFT JOIN
    sq31
  USING
    (patientunitstayid)
  LEFT JOIN
    sq32
  USING
    (patientunitstayid)
  LEFT JOIN
    sq33
  USING
    (patientunitstayid)
  LEFT JOIN
    sq34
  USING
    (patientunitstayid)
  LEFT JOIN
    sq35
  USING
    (patientunitstayid)
  LEFT JOIN
    sq36
  USING
    (patientunitstayid)
  LEFT JOIN
    sq37
  USING
    (patientunitstayid)
  LEFT JOIN
    sq38
  USING
    (patientunitstayid)
  LEFT JOIN
    sq39
  USING
    (patientunitstayid)
  LEFT JOIN
    sq40
  USING
    (patientunitstayid)
  LEFT JOIN
    sq41
  USING
    (patientunitstayid)
  LEFT JOIN
    sq42
  USING
    (patientunitstayid)
  LEFT JOIN
    sq43
  USING
    (patientunitstayid)
  LEFT JOIN
    sq44
  USING
    (patientunitstayid)
  LEFT JOIN
    sq45
  USING
    (patientunitstayid)
  LEFT JOIN
    sq46
  USING
    (patientunitstayid)
   )
SELECT
  patientunitstayid,
  ROUND(sodium_twa_24hr,2) AS sodium_twa_24hr,
  ROUND(chloride_twa_24hr,2) AS chloride_twa_24hr,
  ROUND(sodium_twa_24hr - chloride_twa_24hr,2) AS SID_twa_24hr
FROM
  twa_sq
