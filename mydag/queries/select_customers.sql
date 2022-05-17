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
[root@localhost queries]# cat select_customers.sql
select count(b.url)
  from customers a
  join pageviews b
    on b.user_id = a.user_id
 where 1=1
   and upper(a.job_title) like '%ENGINEER%'
   or b.operating_system = 'Windows'
;
