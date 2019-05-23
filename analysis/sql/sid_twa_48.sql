  -- we use 15 subqueries since the maximum amount of labresults we have found in the first 24 hours is 15.
WITH
  all_data AS (
  SELECT
    patientunitstayid,
    labresultoffset,
    CASE
      WHEN LOWER(labname) = 'sodium' THEN labresult
  END
    AS sodium,
    CASE
      WHEN LOWER(labname) = 'chloride' THEN labresult
  END
    AS chloride
  FROM
    `physionet-data.eicu_crd.lab`
  WHERE
    LOWER(labname) IN ('sodium',
      'chloride')
    AND labresultoffset BETWEEN -6*60
    AND 24*60 ),
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
    labresultoffset),
  max_per_unitid AS(
  SELECT
    patientunitstayid,
    MAX(rn) max_per_unitid_rn
  FROM
    aggregated_data
  GROUP BY
    patientunitstayid ),
  sq01 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset01,
    sodium_n AS sodium_1,
    chloride_n AS chloride_1
  FROM
    aggregated_data
  WHERE
    rn=1),
  sq02 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset02,
    sodium_n AS sodium_2,
    chloride_n AS chloride_2
  FROM
    aggregated_data
  WHERE
    rn=2),
  sq03 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset03,
    sodium_n AS sodium_3,
    chloride_n AS chloride_3
  FROM
    aggregated_data
  WHERE
    rn=3),
  sq04 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset04,
    sodium_n AS sodium_4,
    chloride_n AS chloride_4
  FROM
    aggregated_data
  WHERE
    rn=4),
  sq05 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset05,
    sodium_n AS sodium_5,
    chloride_n AS chloride_5
  FROM
    aggregated_data
  WHERE
    rn=5),
  sq06 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset06,
    sodium_n AS sodium_6,
    chloride_n AS chloride_6
  FROM
    aggregated_data
  WHERE
    rn=6),
  sq07 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset07,
    sodium_n AS sodium_7,
    chloride_n AS chloride_7
  FROM
    aggregated_data
  WHERE
    rn=7),
  sq08 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset08,
    sodium_n AS sodium_8,
    chloride_n AS chloride_8
  FROM
    aggregated_data
  WHERE
    rn=8),
  sq09 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset09,
    sodium_n AS sodium_9,
    chloride_n AS chloride_9
  FROM
    aggregated_data
  WHERE
    rn=9),
  sq10 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset10,
    sodium_n AS sodium_10,
    chloride_n AS chloride_10
  FROM
    aggregated_data
  WHERE
    rn=10),
  sq11 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset11,
    sodium_n AS sodium_11,
    chloride_n AS chloride_11
  FROM
    aggregated_data
  WHERE
    rn=10),
  sq12 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset12,
    sodium_n AS sodium_12,
    chloride_n AS chloride_12
  FROM
    aggregated_data
  WHERE
    rn=12),
  sq13 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset13,
    sodium_n AS sodium_13,
    chloride_n AS chloride_13
  FROM
    aggregated_data
  WHERE
    rn=13),
  sq14 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset14,
    sodium_n AS sodium_14,
    chloride_n AS chloride_14
  FROM
    aggregated_data
  WHERE
    rn=14),
  sq15 AS(
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
  sq47 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset47,
    sodium_n AS sodium_47,
    chloride_n AS chloride_47
  FROM
    aggregated_data
  WHERE
    rn=47),
  sq48 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset48,
    sodium_n AS sodium_48,
    chloride_n AS chloride_48
  FROM
    aggregated_data
  WHERE
    rn=48),
  sq49 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset49,
    sodium_n AS sodium_49,
    chloride_n AS chloride_49
  FROM
    aggregated_data
  WHERE
    rn=49),
  sq50 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset50,
    sodium_n AS sodium_50,
    chloride_n AS chloride_50
  FROM
    aggregated_data
  WHERE
    rn=50),
  sq51 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset51,
    sodium_n AS sodium_51,
    chloride_n AS chloride_51
  FROM
    aggregated_data
  WHERE
    rn=51),
  sq52 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset52,
    sodium_n AS sodium_52,
    chloride_n AS chloride_52
  FROM
    aggregated_data
  WHERE
    rn=52),
  sq53 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset53,
    sodium_n AS sodium_53,
    chloride_n AS chloride_53
  FROM
    aggregated_data
  WHERE
    rn=53),
  sq54 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset54,
    sodium_n AS sodium_54,
    chloride_n AS chloride_54
  FROM
    aggregated_data
  WHERE
    rn=54),
  sq55 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset55,
    sodium_n AS sodium_55,
    chloride_n AS chloride_55
  FROM
    aggregated_data
  WHERE
    rn=55),
  sq56 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset56,
    sodium_n AS sodium_56,
    chloride_n AS chloride_56
  FROM
    aggregated_data
  WHERE
    rn=56),
  sq57 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset57,
    sodium_n AS sodium_57,
    chloride_n AS chloride_57
  FROM
    aggregated_data
  WHERE
    rn=57),
  sq58 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset58,
    sodium_n AS sodium_58,
    chloride_n AS chloride_58
  FROM
    aggregated_data
  WHERE
    rn=58),
  sq59 AS(
  SELECT
    patientunitstayid,
    labresultoffset AS offset59,
    sodium_n AS sodium_59,
    chloride_n AS chloride_59
  FROM
    aggregated_data
  WHERE
    rn=59),
  twa_sq AS(
  SELECT
    patientunitstayid,
    CASE
      WHEN max_per_unitid_rn = 1 THEN sodium_1
      WHEN max_per_unitid_rn = 2 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01))/(offset02-offset01)
      WHEN max_per_unitid_rn = 3 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02))/(offset03-offset01)
      WHEN max_per_unitid_rn = 4 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03))/(offset04-offset01)
      WHEN max_per_unitid_rn = 5 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03)+((sodium_4+sodium_5)/2)*(offset05-offset04))/(offset05-offset01)
      WHEN max_per_unitid_rn = 6 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03)+((sodium_4+sodium_5)/2)*(offset05-offset04)+((sodium_5+sodium_6)/2)*(offset06-offset05))/(offset06-offset01)
      WHEN max_per_unitid_rn = 7 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03)+((sodium_4+sodium_5)/2)*(offset05-offset04)+((sodium_5+sodium_6)/2)*(offset06-offset05)+((sodium_6+sodium_7)/2)*(offset07-offset06))/(offset07-offset01)
      WHEN max_per_unitid_rn = 8 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03)+((sodium_4+sodium_5)/2)*(offset05-offset04)+((sodium_5+sodium_6)/2)*(offset06-offset05)+((sodium_6+sodium_7)/2)*(offset07-offset06)+((sodium_7+sodium_8)/2)*(offset08-offset07))/(offset08-offset01)
      WHEN max_per_unitid_rn = 9 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03)+((sodium_4+sodium_5)/2)*(offset05-offset04)+((sodium_5+sodium_6)/2)*(offset06-offset05)+((sodium_6+sodium_7)/2)*(offset07-offset06)+((sodium_7+sodium_8)/2)*(offset08-offset07)+((sodium_8+sodium_9)/2)*(offset09-offset08))/(offset09-offset01)
      WHEN max_per_unitid_rn = 10 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03)+((sodium_4+sodium_5)/2)*(offset05-offset04)+((sodium_5+sodium_6)/2)*(offset06-offset05)+((sodium_6+sodium_7)/2)*(offset07-offset06)+((sodium_7+sodium_8)/2)*(offset08-offset07)+((sodium_8+sodium_9)/2)*(offset09-offset08)+((sodium_9+sodium_10)/2)*(offset10-offset09))/(offset10-offset01)
      WHEN max_per_unitid_rn = 11 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03)+((sodium_4+sodium_5)/2)*(offset05-offset04)+((sodium_5+sodium_6)/2)*(offset06-offset05)+((sodium_6+sodium_7)/2)*(offset07-offset06)+((sodium_7+sodium_8)/2)*(offset08-offset07)+((sodium_8+sodium_9)/2)*(offset09-offset08)+((sodium_9+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10))/(offset11-offset01)
      WHEN max_per_unitid_rn = 12 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03)+((sodium_4+sodium_5)/2)*(offset05-offset04)+((sodium_5+sodium_6)/2)*(offset06-offset05)+((sodium_6+sodium_7)/2)*(offset07-offset06)+((sodium_7+sodium_8)/2)*(offset08-offset07)+((sodium_8+sodium_9)/2)*(offset09-offset08)+((sodium_9+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11))/(offset12-offset01)
      WHEN max_per_unitid_rn = 13 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03)+((sodium_4+sodium_5)/2)*(offset05-offset04)+((sodium_5+sodium_6)/2)*(offset06-offset05)+((sodium_6+sodium_7)/2)*(offset07-offset06)+((sodium_7+sodium_8)/2)*(offset08-offset07)+((sodium_8+sodium_9)/2)*(offset09-offset08)+((sodium_9+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12))/(offset13-offset01)
      WHEN max_per_unitid_rn = 14 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03)+((sodium_4+sodium_5)/2)*(offset05-offset04)+((sodium_5+sodium_6)/2)*(offset06-offset05)+((sodium_6+sodium_7)/2)*(offset07-offset06)+((sodium_7+sodium_8)/2)*(offset08-offset07)+((sodium_8+sodium_9)/2)*(offset09-offset08)+((sodium_9+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13))/(offset14-offset01)
      WHEN max_per_unitid_rn = 15 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01)+((sodium_2+sodium_3)/2)*(offset03-offset02)+((sodium_3+sodium_4)/2)*(offset04-offset03)+((sodium_4+sodium_5)/2)*(offset05-offset04)+((sodium_5+sodium_6)/2)*(offset06-offset05)+((sodium_6+sodium_7)/2)*(offset07-offset06)+((sodium_7+sodium_8)/2)*(offset08-offset07)+((sodium_8+sodium_9)/2)*(offset09-offset08)+((sodium_9+sodium_10)/2)*(offset10-offset09)+((sodium_10+sodium_11)/2)*(offset11-offset10)+((sodium_11+sodium_12)/2)*(offset12-offset11)+((sodium_12+sodium_13)/2)*(offset13-offset12)+((sodium_13+sodium_14)/2)*(offset14-offset13)+((sodium_14+sodium_15)/2)*(offset15-offset14))/(offset15-offset01)
  END
    AS sodium_twa_day1
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
  LEFT JOIN
    sq47
  USING
    (patientunitstayid)
  LEFT JOIN
    sq48
  USING
    (patientunitstayid)
  LEFT JOIN
    sq49
  USING
    (patientunitstayid)
  LEFT JOIN
    sq50
  USING
    (patientunitstayid)
  LEFT JOIN
    sq51
  USING
    (patientunitstayid)
  LEFT JOIN
    sq52
  USING
    (patientunitstayid)
  LEFT JOIN
    sq53
  USING
    (patientunitstayid)
  LEFT JOIN
    sq54
  USING
    (patientunitstayid)
  LEFT JOIN
    sq55
  USING
    (patientunitstayid)
  LEFT JOIN
    sq56
  USING
    (patientunitstayid)
  LEFT JOIN
    sq57
  USING
    (patientunitstayid)
  LEFT JOIN
    sq58
  USING
    (patientunitstayid)
  LEFT JOIN
    sq59
  USING
    (patientunitstayid) )
SELECT
  patientunitstayid,
  ROUND(sodium_twa_day1,2) AS sodium_twa_day1,
  ROUND(chloride_twa_day1,2) AS chloride_twa_day1,
  ROUND(sodium_twa_day1 - chloride_twa_day1,2) AS SID_twa_day1
FROM
  twa_sq