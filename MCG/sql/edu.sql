-- Last Edited       : 2026-03-27
-- File name         : edu.sql

-- Modul Description : Table Education Level
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

-- Sample----------------------------------------------------------
-- call edu_one_add(0,'TK','TAMAN KANAK-KANAK');
-- call edu_one_add(0,'SD','SEKOLAH DASAR');
-- call edu_one_add(0,'SMP','SEKOLAH MENENGAH PERTAMA');
-- call edu_one_add(0,'SMU','SEKOLAH MENENGAH UMUM');
-- call edu_one_add(0,'SMK','SEKOLAH MENENGAH KEJURUAN');
-- call edu_one_add(0,'D1','DIPLOMA 1');
-- call edu_one_add(0,'D2','DIPLOMA 2');
-- call edu_one_add(0,'D3','DIPLOMA 3');
-- call edu_one_add(0,'D4','DIPLOMA 4');
-- call edu_one_add(0,'S1','STRATA 1');
-- call edu_one_add(0,'S2','STRATA 2');
-- call edu_one_add(0,'S3','STRATA 3');

-- select * from edu_one_view
-- select * from edu_one_view where id=1

-- call edu_one_add(0,'SMU','SEKOLAH MENENGAH UMUM');
-- Sample----------------------------------------------------------

DROP VIEW IF EXISTS edu_one_view;
CREATE VIEW edu_one_view AS
	-- empty(SELECT Script)

	-- two-109
	SELECT
		edu.id
		,edu.code
		,edu.description
	FROM edu
	ORDER BY 1 ASC
;

-- two-241
DROP PROCEDURE IF EXISTS edu_one_add;
DELIMITER $$
CREATE PROCEDURE edu_one_add(
	IN _id integer
	,IN _code varchar(255)
	,IN _description varchar(255)
	)
BEGIN
	DECLARE v_id INT DEFAULT 0;

	SELECT id INTO v_id
	FROM edu
	WHERE 1=1
		 and CONVERT(code USING utf8mb4)=CONVERT(_code USING utf8mb4)
    LIMIT 1;

	IF v_id IS NOT NULL AND v_id > 0 THEN
		SELECT "DOUBLE" AS status, v_id AS ret_id;	-- two-364
	ELSE
		-- two-407
		INSERT INTO edu(
			code
			,description
		) values(
			_code
			,_description
		);
		SELECT "OK" AS status, LAST_INSERT_ID() AS ret_id;	-- two-388
	END IF;
END;
$$
DELIMITER ;

-- two-514
DROP PROCEDURE IF EXISTS edu_one_edit;
DELIMITER $$
CREATE PROCEDURE edu_one_edit(
	IN _id integer
	,IN _code varchar(255)
	,IN _description varchar(255)
	)
BEGIN
	DECLARE v_id INT DEFAULT 0;

	SELECT id INTO v_id
	FROM edu
	WHERE 1=1
		 and CONVERT(code USING utf8mb4)=CONVERT(_code USING utf8mb4)
		 and id <> _id
    LIMIT 1;

	IF v_id IS NOT NULL AND v_id > 0 THEN
		SELECT "DOUBLE" AS status, v_id AS ret_id;	-- two-545
	ELSE
		UPDATE edu SET
		code=_code
		,description=_description
		WHERE 
		id=_id
		;
		SELECT "OK" AS status, _id AS ret_id;	-- two-616
	END IF;
END;
$$
DELIMITER ;

-- two-710
DROP PROCEDURE IF EXISTS edu_one_delete;
DELIMITER $$
CREATE PROCEDURE edu_one_delete(
	IN _id integer
	)
BEGIN
	DELETE FROM edu
	WHERE 
		id=_id
	;
	SELECT "OK" AS status;
END;
$$
DELIMITER ;




