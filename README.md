# 052-mcg-laravel12-lte3
<pre>



INSTALL FROM GITHUB-SAMPLE
==========================

run xampp
run phpmyadmin
Create
	Database: mcg_db
	Username: root
	Password: 
	
	
goto: https://github.com/yudhi-irawan/052-mcg-laravel12-lte3
click <> Code
click Download ZIP
unzip 052-mcg-laravel12-lte3-master.zip to folder c:\xampp\htdocs
rename folder from c:\xampp\htdocs\052-mcg-laravel12-lte3-master to c:\xampp\htdocs\052-mcg-laravel12-lte3

goto folder .\052-mcg-laravel12-lte3\MCG\sql
run phpmyadmin
click mcg_db

click tab SQL
copy paste script: 1_merge_table_all.sql
click Go

click tab SQL
copy paste script: 2_merge_sql_all.sql
click Go


mode CMD:
goto root folder .\052-mcg-laravel12-lte3

dir public
create link ke storage: 
php artisan storage:link
dir public

if ERROR:
rmdir /S /Q public\storage
php artisan storage:link
dir public

run: php artisan migrate
run server: php artisan serve
run in browser: http://127.0.0.1:8000/





INSTALL FROM SOURCE
===================

------------------------------------------
---> 1 <----------------------------------
------------------------------------------


-1-
run xampp
run phpmyadmin
Create
	Database: mcg_db
	Username: root
	Password: 


-2-
mode CMD:
goto folder c:\xampp\htdocs\
cd c:\xampp\htdocs\
composer global require laravel/installer


-3-
laravel new example-app
Which starter kit would you like to install? [none]:
[none    ] None
[react   ] React
[vue     ] Vue
[livewire] Livewire
> none

Which testing framework do you prefer? [Pest]
Pest     0
PHPUnit  1
> 1

Do you want to install Laravel Boost to improve AI assisted coding? (yes/no) [yes]:
> no

Which database will your application use? [SQLite]:
[sqlite ] SQLite
[mysql  ] MySQL
[mariadb] MariaDB
[pgsql  ] PostgreSQL (Missing PDO extension)
[sqlsrv ] SQL Server (Missing PDO extension)
> mysql

Default database updated. Would you like to run the default database migration? (yes/no) [yes]:
> yes 

Would you like to run npm install and npm run build? (yes/no) [yes]:
> no


-4-
cd example-app

run server:
php artisan serve
exit from server: Ctrl+C


------------------------------------------
---> 2 <----------------------------------
------------------------------------------

create folder: 052-mcg-laravel12-lte3

copy from folder: example-app
to folder: 052-mcg-laravel12-lte3

goto folder .\052-mcg-laravel12-lte3\storage\app\public
- create folder: .\storage\app\public\sources
- create folder: .\storage\app\public\uploads


goto folder: 052-mcg-laravel12-lte3

dir public
create link ke storage: 
php artisan storage:link
dir public

if ERROR:
rmdir /S /Q public\storage
php artisan storage:link
dir public

run server:
php artisan serve
run in browser: http://127.0.0.1:8000/storage/sources/sample_01.png
exit from server: Ctrl+C


run your favourite editor:
code .
open file .env
	edit	: DB_DATABASE=example_app
	to		: DB_DATABASE=mcg_db
	
In detail for MySQL:
	DB_CONNECTION=mysql
	DB_HOST=127.0.0.1
	DB_PORT=3306
	DB_DATABASE=mcg_db				
	DB_USERNAME=root				
	DB_PASSWORD=				
	DB_COLLATION=utf8mb4_unicode_ci 
	
for pgSQL:
	DB_CONNECTION=pgsql
	DB_HOST=127.0.0.1
	DB_PORT=5432
	DB_DATABASE=mcg_db
	DB_USERNAME=odoo
	DB_PASSWORD=odoo


goto folder .\052-mcg-laravel12-lte3\public
- copy folder .\public\assets from: https://github.com/yudhi-irawan/052-mcg-laravel12-lte3/tree/master/public


goto folder .\052-mcg-laravel12-lte3\resources\views
- copy folder .\resources\views from: https://github.com/yudhi-irawan/052-mcg-laravel12-lte3/tree/master/resources


goto rooot folder .\052-mcg-laravel12-lte3
- create folder .\052-mcg-laravel12-lte3\MCG
- copy folder .\052-mcg-laravel12-lte3\MCG from: https://github.com/yudhi-irawan/052-mcg-laravel12-lte3/tree/master


goto folder .\052-mcg-laravel12-lte3\MCG
run in mode CMD _016_laravel_lte3_mysql.exe then click Generate Code menu


goto folder .\052-mcg-laravel12-lte3\MCG\sql
run phpmyadmin
click mcg_db

click tab SQL
copy paste script: 1_merge_table_all.sql
click Go

click tab SQL
copy paste script: 2_merge_sql_all.sql
click Go


goto root folder .\052-mcg-laravel12-lte3
run: php artisan migrate

run server: php artisan serve
run in browser: http://127.0.0.1:8000/




</pre>