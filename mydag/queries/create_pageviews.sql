select user_id
     , url
     , user_agent
     , case when upper(user_agent) like '%WINDOWS%' then 'Windows'
            when upper(user_agent) like '%MACINTOSH%' then 'Macintosh'
            when upper(user_agent) like '%LINUX%' then 'Linux'
            else 'Other'
             end as operating_system
     , timestamp
  from pageviews_tmp
;
