set path=C:\Program Files\MySQL\MySQL Server 5.6\bin;%path%
mysqldump -u root --port=3309 --password=cchengqiyi71 hplydb_new > "hplydb_new_%date:~0,10%,%time:~0,2%.sql"