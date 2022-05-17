# td_codingtest
TreasureData Coding test instruction!

## Below is simple guide.
1. Install Digdag
2. Install Embulk
3. Install PostgreSql & Create a local database called "td_coding_challenge"
 - Create two tables: custombers_tmp, pageviews_tmp
4. Data Ingestion
 - customers_x.csv: customers_tmp
 - pageviews_x.csv: pageviews_tmp
5. Data Preparation
 - Insert custombers_x.csv data to customers_tmp table except job_title 'Sales'
 - Insert pageviews_x.csv data to pageviews_tmp table and parse the 'user_agent' column to 'operating_system' column that contain one of the foloowing values("Windows", "Macintosh", "Linux", or "Other").
6. Digdag Worklfow Script
 - Write a script excute above step 5 automatically.
7. Data Analysis
 - Write query 1: Returns the totla number of pageviews from users who are browsing with a Windows OS or have "Engineer" in their job title
 - Write query 2: Returns top 3 user_id's(ranked by total pageviews) who have viewed a web page with a ".gov" domain extension. And then show last page viewd by each of these user_id's.
 - Excute above 2 queries by Digdag workflow and echo out the results.

## Below is command guide
### 1. Install digdag
Use 'sudo' to get root privileges

```bash
$ sudo -s
```

Install digdag
```bash
# curl -o ~/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-latest"
# chmod +x ~/bin/digdag
# echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
```

Check the digdag installed correctly
```bash
# digdag --help
```

### 2. Install Embulk
```bash
$ curl --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar"
$ chmod +x ~/.embulk/bin/embulk
$ echo 'export PATH="$HOME/.embulk/bin:$PATH"' >> ~/.bashrc
$ source ~/.bashrc
```

Install Plugins
```bash
$ embulk gem install embulk-input-postgresql
$ embulk gem install embulk-output-postgresql
```

### 3. Install PostgreSql & Create a local database called "td_coding_challenge"
```bash
# sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
# sudo yum install -y postgresql11-server postgresql11-contrib
# /usr/pgsql-11/bin/postgresql-11-setup initdb
# systemctl enable postgresql-11
# systemctl start postgresql-11
```
Create two tables: custombers_tmp, pageviews_tmp
```bash
# postgres psql
postgres=#\c td_coding_challenge
postgres=#CREATE TABLE customers_tmp (user_id varchar(36) PRIMARY KEY, first_name varchar(20) null, last_name varchar(20) null, job_title varchar(50) null);
postgres=#CREATE TABLE pageviews_tmp (user_id varchar(36) not null, url varchar(200) null, user_agent varchar(200) null, timestamp varchar(10) null);
```

### 4. Run the Digdag PostgreSql workflow
Command in terminal
```bash
#cd digdag
# digdag secrets --local --set pg.password=password
# digdag run load_csv_temp_tables.dig
```

# Check the server log with two sql results.
