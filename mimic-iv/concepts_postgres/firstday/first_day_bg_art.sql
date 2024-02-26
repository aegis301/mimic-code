-- THIS SCRIPT IS AUTOMATICALLY GENERATED. DO NOT EDIT IT DIRECTLY.
DROP TABLE IF EXISTS mimiciv_derived.first_day_bg_art;
CREATE TABLE mimiciv_derived.first_day_bg_art AS
/* Highest/lowest blood gas values for arterial blood specimens */
SELECT
  ie.subject_id,
  ie.stay_id,
  MIN(lactate) AS lactate_min,
  AVG(lactate) AS lactate_mean,
  MAX(lactate) AS lactate_max,
  MIN(ph) AS ph_min,
  AVG(ph) AS ph_mean,
  MAX(ph) AS ph_max,
  MIN(so2) AS so2_min,
  AVG(so2) AS so2_mean,
  MAX(so2) AS so2_max,
  MIN(po2) AS po2_min,
  AVG(po2) AS po2_mean,
  MAX(po2) AS po2_max,
  MIN(pco2) AS pco2_min,
  AVG(pco2) AS pco2_mean,
  MAX(pco2) AS pco2_max,
  MIN(aado2) AS aado2_min,
  AVG(aado2) AS aado2_mean,
  MAX(aado2) AS aado2_max,
  MIN(aado2_calc) AS aado2_calc_min,
  AVG(aado2_calc) AS aado2_calc_mean,
  MAX(aado2_calc) AS aado2_calc_max,
  MIN(pao2fio2ratio) AS pao2fio2ratio_min,
  AVG(pao2fio2ratio) AS pao2fio2ratio_mean,
  MAX(pao2fio2ratio) AS pao2fio2ratio_max,
  MIN(baseexcess) AS baseexcess_min,
  AVG(baseexcess) AS baseexcess_mean,
  MAX(baseexcess) AS baseexcess_max,
  MIN(bicarbonate) AS bicarbonate_min,
  AVG(bicarbonate) AS bicarbonate_mean,
  MAX(bicarbonate) AS bicarbonate_max,
  MIN(totalco2) AS totalco2_min,
  AVG(totalco2) AS totalco2_mean,
  MAX(totalco2) AS totalco2_max,
  MIN(hematocrit) AS hematocrit_min,
  AVG(hematocrit) AS hematocrit_mean,
  MAX(hematocrit) AS hematocrit_max,
  MIN(hemoglobin) AS hemoglobin_min,
  AVG(hemoglobin) AS hemoglobin_mean,
  MAX(hemoglobin) AS hemoglobin_max,
  MIN(carboxyhemoglobin) AS carboxyhemoglobin_min,
  AVG(carboxyhemoglobin) AS carboxyhemoglobin_mean,
  MAX(carboxyhemoglobin) AS carboxyhemoglobin_max,
  MIN(methemoglobin) AS methemoglobin_min,
  AVG(methemoglobin) AS methemoglobin_mean,
  MAX(methemoglobin) AS methemoglobin_max,
  MIN(temperature) AS temperature_min,
  AVG(temperature) AS temperature_mean,
  MAX(temperature) AS temperature_max,
  MIN(chloride) AS chloride_min,
  AVG(chloride) AS chloride_mean,
  MAX(chloride) AS chloride_max,
  MIN(calcium) AS calcium_min,
  AVG(calcium) AS calcium_mean,
  MAX(calcium) AS calcium_max,
  MIN(glucose) AS glucose_min,
  AVG(glucose) AS glucose_mean,
  MAX(glucose) AS glucose_max,
  MIN(potassium) AS potassium_min,
  AVG(potassium) AS potassium_mean,
  MAX(potassium) AS potassium_max,
  MIN(sodium) AS sodium_min,
  AVG(sodium) AS sodium_mean,
  MAX(sodium) AS sodium_max
FROM mimiciv_icu.icustays AS ie
  LEFT JOIN mimiciv_derived.bg AS bg
  ON ie.subject_id = bg.subject_id
    AND bg.specimen = 'ART.'
    AND bg.charttime >= ie.intime - INTERVAL
'6 HOUR'
  AND bg.charttime <= ie.intime + INTERVAL '1 DAY'
GROUP BY
  ie.subject_id,
  ie.stay_id