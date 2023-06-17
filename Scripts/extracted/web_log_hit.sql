--extract data drom web_log raw data

create or replace table extracted.web_log_hit engine=MergeTree() order by (inserted_id, inserted_date) as 
select isValidJSON(json_log) valid 
	,JSON_VALUE(json_log, '$.date' ) date
	,JSON_VALUE(json_log, '$.url' ) url
	,JSON_VALUE(json_log, '$.headers.host' ) host
	,JSON_VALUE(json_log, '$.headers.`x-real-ip`' )  x_real_ip
	,JSON_VALUE(json_log, '$.headers.`x-track-id`' )  x_track_id
	,JSON_VALUE(json_log, '$.headers.`x-track-type`' )  x_track_type
	,JSON_VALUE(json_log, '$.headers.`x-track-winfo`' )  x_track_winfo
	,JSON_VALUE(json_log, '$.headers.`user-agent`' )  user_agent
	,JSON_VALUE(json_log, '$.headers.referer' ) referer
	,JSON_VALUE(json_log, '$.headers.origin' ) origin
	,inserted_id
	,inserted_date
from `default`.web_log


