-- Last Edited       : 2026-01-25
-- File name         : sex.sql

-- Modul Description : Tabel Sex
-- Date              : 2022-01-20
-- Created by.       : yudhi irawan
-- Contact person    : IG: @iam.yudhi_irawan


-- MCG - Massive CRUD Generator Laravel-AdminLTE3-MySQL for Laravel 10 Up ver. Jan 2026-Free Version

-- Private message at Telegram        : @yudhi_irawan
-- Private activity feeds at Instagram: @iam.yudhi_irawan

-- Download Massive CRUD Generator on telegram and github link
-- MCG Application: https://t.me/MCGFreeVersion
-- Documentation  : https://yudhi-irawan.github.io/200-mcg-documentation/tutorial.html
-- Testing        : https://github.com/yudhi-irawan/051-mcg-laravel11-lte3
-- Template       : 

-- Donation and Support link
-- Ko-fi   : https://ko-fi.com/MassiveCrudGenerator
-- Trakteer: https://trakteer.id/MassiveCrudGenerator

-- Please follow us for information about new releases

-- Sample----------------------------------------------------------
-- call sex_one_add(0,'LAKI-LAKI');
-- call sex_one_add(0,'PEREMPUAN');

-- select * from sex_one_view
-- select * from sex_one_view where id=1

-- call sex_one_add(0,'PEREMPUAN');
-- Sample----------------------------------------------------------

DROP VIEW IF EXISTS sex_one_view;
CREATE VIEW sex_one_view AS
	-- empty(SELECT Script)

	-- two-109
	SELECT
		sex.id
		,sex.description
	FROM sex
	ORDER BY 1 ASC
;

-- two-241
DROP PROCEDURE IF EXISTS sex_one_add;
DELIMITER $$
CREATE PROCEDURE sex_one_add(
	IN _id integer
	,IN _description varchar(255)
	)
BEGIN
	DECLARE v_id INT DEFAULT 0;

	SELECT id INTO v_id
	FROM sex
	WHERE 1=1
		 and CONVERT(description USING utf8mb4)=CONVERT(_description USING utf8mb4)
    LIMIT 1;

	IF v_id IS NOT NULL AND v_id > 0 THEN
		SELECT "DOUBLE" AS status, v_id AS ret_id;	-- two-364
	ELSE
		-- two-407
		INSERT INTO sex(
			description
		) values(
			_description
		);
		SELECT "OK" AS status, LAST_INSERT_ID() AS ret_id;	-- two-388
	END IF;
END;
$$
DELIMITER ;

-- two-514
DROP PROCEDURE IF EXISTS sex_one_edit;
DELIMITER $$
CREATE PROCEDURE sex_one_edit(
	IN _id integer
	,IN _description varchar(255)
	)
BEGIN
	DECLARE v_id INT DEFAULT 0;

	SELECT id INTO v_id
	FROM sex
	WHERE 1=1
		 and CONVERT(description USING utf8mb4)=CONVERT(_description USING utf8mb4)
		 and id <> _id
    LIMIT 1;

	IF v_id IS NOT NULL AND v_id > 0 THEN
		SELECT "DOUBLE" AS status, v_id AS ret_id;	-- two-545
	ELSE
		UPDATE sex SET
		description=_description
		WHERE 
		id=_id
		;
		SELECT "OK" AS status, _id AS ret_id;	-- two-616
	END IF;
END;
$$
DELIMITER ;

-- two-710
DROP PROCEDURE IF EXISTS sex_one_delete;
DELIMITER $$
CREATE PROCEDURE sex_one_delete(
	IN _id integer
	)
BEGIN
	DELETE FROM sex
	WHERE 
		id=_id
	;
	SELECT "OK" AS status;
END;
$$
DELIMITER ;




