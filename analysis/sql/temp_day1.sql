-- this query extracts worst (highest) Temperature within the first 24hrs of ICU admission:
-- in order to address missing data issues and since some data points were stored incorrectly, we broadened the window since -6 hour from admission.  
-- in case it doesn't find the worst temperature in the first hour either in pivoted_vital or vitalperiodic, it takes the worst temperature per day from apacheapsvar table
-- in those cases we won't be taking the worst temp in the first hour but the worst temp in the first day.

WITH
  pivoted_temp AS(
  SELECT
    patientunitstayid,
    MAX(temperature) hst_temp
  FROM
    `physionet-data.eicu_crd_derived.pivoted_vital`
-- Within the first 24 hrs of ICU admission    
  WHERE
    chartoffset BETWEEN -6*60 AND 24*60 
  GROUP BY
    patientunitstayid ),
  vitalperiodic_temp AS(
  SELECT
  patientunitstayid,
  MAX( temperature ) AS hst_temp
FROM
  `physionet-data.eicu_crd.vitalperiodic`
-- Within the first 24 hrs of ICU admission  
WHERE
  observationoffset BETWEEN -6*60 AND 24*60 
GROUP BY
  patientunitstayid
  ),apache_temp AS(
SELECT
  patientunitstayid,
  MAX(temperature) AS hst_temp
FROM
  `physionet-data.eicu_crd.apacheapsvar`
GROUP BY
  patientunitstayid )
SELECT
  pivoted_temp.patientunitstayid,
  ROUND(COALESCE(pivoted_temp.hst_temp, vitalperiodic_temp.hst_temp, apache_temp.hst_temp),2) AS hst_temp
FROM
  pivoted_temp
FULL JOIN
  vitalperiodic_temp
ON
  pivoted_temp.patientunitstayid = vitalperiodic_temp.patientunitstayid
FULL JOIN
  apache_temp
ON
  pivoted_temp.patientunitstayid = apache_temp.patientunitstayid  