
{% if target.name == 'stage' %}
  {% set format_tmp = "csv"   %}
  {% else %}       
  {% set format_tmp = "parquet"   %}
{% endif %}

{{ config(materialized='external', format = format_tmp) }}
SELECT
  "KEY",
  AGE,
  DIED,
  RACE,
  HISPANIC,
  FEMALE,
  PAY1,
  ZIP,
  CONCAT_WS('', AYEAR, '-', AMONTH, '-01') AS admit_date,
  I10_DX_Visit_Reason1 IN ('J1000', 'J1001', 'J1008', 'J101', 'J102', 'J1081', 'J1082', 'J1083', 'J1089', 'J1100', 'J1108', 'J111', 'J112', 'J1181', 'J1182', 'J1183', 'J1189', 'J09X1', 'J09X2', 'J09X3', 'J09X9') OR I10_DX_Visit_Reason2 IN ('J1000', 'J1001', 'J1008', 'J101', 'J102', 'J1081', 'J1082', 'J1083', 'J1089', 'J1100', 'J1108', 'J111', 'J112', 'J1181', 'J1182', 'J1183', 'J1189', 'J09X1', 'J09X2', 'J09X3', 'J09X9') OR I10_DX1 IN ('J1000', 'J1001', 'J1008', 'J101', 'J102', 'J1081', 'J1082', 'J1083', 'J1089', 'J1100', 'J1108', 'J111', 'J112', 'J1181', 'J1182', 'J1183', 'J1189', 'J09X1', 'J09X2', 'J09X3', 'J09X9') OR I10_DX2 IN ('J1000', 'J1001', 'J1008', 'J101', 'J102', 'J1081', 'J1082', 'J1083', 'J1089', 'J1100', 'J1108', 'J111', 'J112', 'J1181', 'J1182', 'J1183', 'J1189', 'J09X1', 'J09X2', 'J09X3', 'J09X9') AS flu,
  I10_DX_Visit_Reason1 IN ('J069', 'J399', 'J200', 'J201', 'J202', 'J203', 'J204', 'J205', 'J206', 'J207', 'J208', 'J209', 'J210', 'J211', 'J218', 'J219', 'J40', 'B012', 'B052', 'B0681', 'B250', 'J120', 'J121', 'J122', 'J123', 'J1281', 'J1289', 'J129', 'J440', 'J441', 'J470', 'J471') OR I10_DX_Visit_Reason2 IN ('J069', 'J399', 'J200', 'J201', 'J202', 'J203', 'J204', 'J205', 'J206', 'J207', 'J208', 'J209', 'J210', 'J211', 'J218', 'J219', 'J40', 'B012', 'B052', 'B0681', 'B250', 'J120', 'J121', 'J122', 'J123', 'J1281', 'J1289', 'J129', 'J440', 'J441', 'J470', 'J471') OR I10_DX1 IN ('J069', 'J399', 'J200', 'J201', 'J202', 'J203', 'J204', 'J205', 'J206', 'J207', 'J208', 'J209', 'J210', 'J211', 'J218', 'J219', 'J40', 'B012', 'B052', 'B0681', 'B250', 'J120', 'J121', 'J122', 'J123', 'J1281', 'J1289', 'J129', 'J440', 'J441', 'J470', 'J471') OR I10_DX2 IN ('J069', 'J399', 'J200', 'J201', 'J202', 'J203', 'J204', 'J205', 'J206', 'J207', 'J208', 'J209', 'J210', 'J211', 'J218', 'J219', 'J40', 'B012', 'B052', 'B0681', 'B250', 'J120', 'J121', 'J122', 'J123', 'J1281', 'J1289', 'J129', 'J440', 'J441', 'J470', 'J471') AS flu_like
FROM {{ source('SEDD', 'NY_SEDD_2017_CORE') }}
limit 100