-- Last Edited : 2026-03-26
-- File name   : ~merge_*.sql


-- Last Edited       : 2026-03-26
-- File name         : sex.sql

-- Modul Description : Tabel Sex
-- Date              : 2022-01-20
-- Created by.       : yudhi irawan
-- Contact person    : IG: @iam.yudhi_irawan


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




-- Last Edited       : 2026-03-26
-- File name         : edu.sql

-- Modul Description : Table Education Level
-- Date              : 2022-01-20
-- Created by.       : yudhi irawan
-- Contact person    : IG: @iam.yudhi_irawan


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




-- Last Edited       : 2026-03-26
-- File name         : emp.sql

-- Modul Description : Employee
-- Date              : 2022-01-20
-- Created by.       : yudhi irawan
-- Contact person    : IG: @iam.yudhi_irawan


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




