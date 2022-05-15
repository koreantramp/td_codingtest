# td_codingtest
TreasureData Coding test instruction!

1. Install Digdag
2. Install Embulk
3. Install MySql & Create a local database called "td_coding_challenge"
 - Create two tables: custombers_tmp, pageviews_tmp
4. Data Ingestion
 - customers_x.csv: custombers_tmp
 - pageviews_x.csv: pageviews_tmp
5. Data Preparation
 - Insert custombers_x.csv data to customers_tmp table except job_title 'Sales'
 - Insert pageviews_x.csv data to pageviews_tmp table and parse the 'user_agent' column to 'operating_system' column that contain one of the foloowing values("Windows", "Macintosh", "Linux", or "Other").
6. Digdag Worklfow Scrip
 - Write a script excute above step 5 automatically.
7. Data Analysis
 - Write query 1: Returns the totla number of pageviews from users who are browsing with a Windows OS or have "Engineer" in their job title
 - Write query 2: Returns top 3 user_id's(ranked by total pageviews) who have viewed a web page with a ".gov" domain extension. And then show last page viewd by each of these user_id's.
 - Excute above 2 queries by Digdag workflow and echo out the results.

<END>
