WITH sq_potasium AS (
SELECT
 patientunitstayid
,AVG(labresult) AS potassium_mean_day1
FROM
`physionet-data.eicu_crd.lab`
WHERE lower(labname) = 'potassium'
AND
labresultoffset BETWEEN -6*60 AND 24*60 -- window where first values can be recorded.
GROUP BY patientunitstayid
), sq_bicarbonate AS (
SELECT
 patientunitstayid
,AVG(labresult) AS bicarbonate_mean_day1
FROM
`physionet-data.eicu_crd.lab`
WHERE lower(labname) = 'bicarbonate'
AND
labresultoffset BETWEEN -6*60 AND 24*60 -- window where first values can be recorded.
GROUP BY patientunitstayid
), sq_glucose AS (
SELECT
 patientunitstayid
,AVG(labresult) AS glucose_mean_day1
FROM
`physionet-data.eicu_crd.lab`
WHERE lower(labname) = 'glucose'
AND
labresultoffset BETWEEN -6*60 AND 24*60 -- window where first values can be recorded.
GROUP BY patientunitstayid
), sq_albumin AS (
SELECT
 patientunitstayid
,AVG(labresult) AS albumin_mean_day1
FROM
`physionet-data.eicu_crd.lab`
WHERE lower(labname) = 'albumin'
AND
labresultoffset BETWEEN -6*60 AND 24*60 -- window where first values can be recorded.
GROUP BY patientunitstayid
), sq_hemoglobin AS (
SELECT
 patientunitstayid
,AVG(hemoglobin) AS hemoglobin_mean_day1
FROM
`physionet-data.eicu_crd_derived.pivoted_lab`
WHERE
chartoffset BETWEEN -6*60 AND 24*60 -- window where first values can be recorded.
GROUP BY patientunitstayid
), sq_wbc AS (
SELECT
 patientunitstayid
,AVG(wbc) AS wbc_mean_day1
FROM
`physionet-data.eicu_crd_derived.pivoted_lab`
WHERE
chartoffset BETWEEN -6*60 AND 24*60 -- window where first values can be recorded.
GROUP BY patientunitstayid
), sq_platelets AS (
SELECT
 patientunitstayid
,AVG(platelets) AS platelets_mean_day1
FROM
`physionet-data.eicu_crd_derived.pivoted_lab`
WHERE
chartoffset BETWEEN -6*60 AND 24*60 -- window where first values can be recorded.
GROUP BY patientunitstayid
), sq_heartrate AS (
SELECT
 patientunitstayid
,AVG(heartrate) AS heartrate_mean_day1
FROM
`physionet-data.eicu_crd_derived.pivoted_vital`
WHERE
chartoffset BETWEEN -6*60 AND 24*60 -- window where first values can be recorded.
GROUP BY patientunitstayid
), sq_systolic AS (
SELECT
 patientunitstayid
,AVG(nibp_systolic) AS systolic_mean_day1 -- We want nibp
FROM
`physionet-data.eicu_crd_derived.pivoted_vital`
WHERE
chartoffset BETWEEN -6*60 AND 24*60 -- window where first values can be recorded.
GROUP BY patientunitstayid
), sq_temperature AS (
SELECT
 patientunitstayid
,AVG(temperature) AS temperature_mean_day1
FROM
`physionet-data.eicu_crd_derived.pivoted_vital`
WHERE
chartoffset BETWEEN -6*60 AND 24*60 -- window where first values can be recorded.
GROUP BY patientunitstayid
)
SELECT
 patient.patientunitstayid
,glucose_mean_day1 
,potassium_mean_day1
,bicarbonate_mean_day1
,albumin_mean_day1
,hemoglobin_mean_day1
,wbc_mean_day1
,platelets_mean_day1
,heartrate_mean_day1
,systolic_mean_day1
,temperature_mean_day1
FROM
`physionet-data.eicu_crd.patient` patient
LEFT JOIN
sq_potasium
ON 
(patient.patientunitstayid=sq_potasium.patientunitstayid )
LEFT JOIN
sq_bicarbonate
ON 
(patient.patientunitstayid=sq_bicarbonate.patientunitstayid )
LEFT JOIN
sq_glucose
ON 
(patient.patientunitstayid=sq_glucose.patientunitstayid )
LEFT JOIN
sq_albumin
ON 
(patient.patientunitstayid=sq_albumin.patientunitstayid )
LEFT JOIN
sq_hemoglobin
ON 
(patient.patientunitstayid=sq_hemoglobin.patientunitstayid )
LEFT JOIN
sq_wbc
ON 
(patient.patientunitstayid=sq_wbc.patientunitstayid )
LEFT JOIN
sq_platelets
ON 
(patient.patientunitstayid=sq_platelets.patientunitstayid )
LEFT JOIN
sq_heartrate
ON 
(patient.patientunitstayid=sq_heartrate.patientunitstayid )
LEFT JOIN
sq_systolic
ON 
(patient.patientunitstayid=sq_systolic.patientunitstayid )
LEFT JOIN
sq_temperature
ON 
(patient.patientunitstayid=sq_temperature.patientunitstayid )
