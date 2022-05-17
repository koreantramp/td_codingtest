select user_id, first_name, last_name, job_title from customers_tmp where 1=1 and upper(job_title) not like '%SALES%';
