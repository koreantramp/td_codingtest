select user_id, url
from (
    select aa.user_id
        , bb.url
        , row_number() over(partition by aa.user_id order by bb.timestamp desc) as url_view_time
    from (
        select a.user_id
            , count(*) as page_cnt
        from customers a
        join pageviews b
        on b.user_id = a.user_id
        and upper(b.url) like '%GOV%'
        where 1=1
        group by a.user_id
        order by page_cnt desc
        limit 3
        ) aa
    join pageviews bb
      on bb.user_id = aa.user_id
   where 1=1
    ) x
where 1=1
  and url_view_time = 1
;
