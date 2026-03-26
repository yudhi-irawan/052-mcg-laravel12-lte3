-- Last Edited       : 2026-03-26
-- File name         : emp.sql

-- Modul Description : Employee
-- Date              : 2022-01-20
-- Created by.       : yudhi irawan
-- Contact person    : IG: @iam.yudhi_irawan


-- MCG - Massive CRUD Generator Laravel-AdminLTE3-MySQL for Laravel 10 Up ver. Jan 2026-Free Version

-- Private message at Telegram        : @yudhi_irawan
-- Private activity feeds at Instagram: @iam.yudhi_irawan

-- Download Massive CRUD Generator on telegram and github link
-- MCG Application: https://t.me/MCGFreeVersion
-- Documentation  : https://yudhi-irawan.github.io/200-mcg-documentation/tutorial.html
-- Testing        : https://github.com/yudhi-irawan/052-mcg-laravel12-lte3
-- Template       : 

-- Donation and Support link
-- Ko-fi   : https://ko-fi.com/MassiveCrudGenerator
-- Trakteer: https://trakteer.id/MassiveCrudGenerator

-- Please follow us for information about new releases

DROP VIEW IF EXISTS emp_one_view;
CREATE VIEW emp_one_view AS
	-- empty(SELECT Script)

	-- two-109
	SELECT
		emp.id
		,emp.name
		,emp.bday
		,emp.sex_id
		,sex.description AS sex_description -- three-1454
		,emp.edu_code
		,edu.description AS edu_description -- three-1454
		,emp.alamat
		,emp.kota
		,emp.provinsi
		,emp.goldarah
		,emp.insertnew
	FROM emp
	LEFT JOIN sex AS sex ON emp.sex_id = sex.id
	LEFT JOIN edu AS edu ON emp.edu_code = edu.code
	ORDER BY 1 ASC
;

-- two-241
DROP PROCEDURE IF EXISTS emp_one_add;
DELIMITER $$
CREATE PROCEDURE emp_one_add(
	IN _id integer
	,IN _name varchar(255)
	,IN _bday date
	,IN _sex_id integer
	,IN _edu_code varchar(255)
	,IN _alamat varchar(255)
	,IN _kota varchar(255)
	,IN _provinsi varchar(255)
	,IN _goldarah varchar(255)
	,IN _insertnew varchar(255)
	)
BEGIN
	-- two-407
	INSERT INTO emp(
			name
			,bday
			,sex_id
			,edu_code
			,alamat
			,kota
			,provinsi
			,goldarah
			,insertnew
	) values(
			_name
			,_bday
			,_sex_id
			,_edu_code
			,_alamat
			,_kota
			,_provinsi
			,_goldarah
			,_insertnew
	);
	SELECT "OK" AS status, LAST_INSERT_ID() AS ret_id;	-- two-388

END;
$$
DELIMITER ;

-- two-514
DROP PROCEDURE IF EXISTS emp_one_edit;
DELIMITER $$
CREATE PROCEDURE emp_one_edit(
	IN _id integer
	,IN _name varchar(255)
	,IN _bday date
	,IN _sex_id integer
	,IN _edu_code varchar(255)
	,IN _alamat varchar(255)
	,IN _kota varchar(255)
	,IN _provinsi varchar(255)
	,IN _goldarah varchar(255)
	,IN _insertnew varchar(255)
	)
BEGIN
		UPDATE emp SET
		name=_name
		,bday=_bday
		,sex_id=_sex_id
		,edu_code=_edu_code
		,alamat=_alamat
		,kota=_kota
		,provinsi=_provinsi
		,goldarah=_goldarah
		,insertnew=_insertnew
		WHERE 
		id=_id
		;
		SELECT "OK" AS status, _id AS ret_id;	-- two-616
END;
$$
DELIMITER ;

-- two-710
DROP PROCEDURE IF EXISTS emp_one_delete;
DELIMITER $$
CREATE PROCEDURE emp_one_delete(
	IN _id integer
	)
BEGIN
	DELETE FROM emp
	WHERE 
		id=_id
	;
	SELECT "OK" AS status;
END;
$$
DELIMITER ;




