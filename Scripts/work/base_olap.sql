create or replace view work.base as
select
	toDate(floor(inserted_date / 1000, 0)) date
	,path(referer) original_url 
	,count(distinct inserted_id) total_hit
	, countIf(url like '%tracker') total_loads
	, countIf(x_track_type  like 'DOMContentLoaded') total_page_views
from extracted.web_log_hit wlh 
group by date, original_url