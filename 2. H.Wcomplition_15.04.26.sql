
	-- roster_id must be unique and cannot be empty (main id)

	-- contact_email must contain value and cannot repeat

	-- display_name must contain value

	-- wants_certificate is BOOLEAN and if missing use FALSE by default

	-- start_date is DATE and must contain value

	-- last_activity is DATETIME and must contain value

	-- completion_score is REAL and must stay between 0 and 100

	-- group_label is TEXT and if missing use starter by default

CREATE TABLE IF NOT EXISTS workshop_roster (

	roster_id 			INTEGER PRIMARY KEY,

	contact_email 		TEXT NOT NULL UNIQUE,

	display_name 		TEXT NOT NULL,

	wants_certificate 	BOOLEAN DEFAULT FALSE,

	start_date 			DATE NOT NULL,

	last_activity 		DATETIME NOT NULL,

	completion_score 	REAL CHECK (completion_score BETWEEN 0 AND 100),

	group_label 		TEXT DEFAULT 'starter'

	);

	

--2. Insert exactly 5 rows from the sample table below

INSERT INTO workshop_roster (roster_id, contact_email, display_name, wants_certificate, start_date, last_activity, completion_score, group_label)

VALUES

	(1, 'mika@campus.com', 'Mika', TRUE, '2026-04-01', '2026-04-14 08:15:00', 94.5, 'advanced'),

	(2, 'matan@campus.com', 'Matan', TRUE, '2026-04-05', '2026-04-12 18:20:00', 82.0, 'advanced'),

	(3, 'nora@campus.com', 'Nora', FALSE, '2026-04-07', '2026-04-09 10:00:00', 74.0, 'starter'),

	(4, 'liam@campus.com', 'Liam', TRUE, '2026-04-10', '2026-04-15 07:45:00', 88.0, 'regular'),

	(5, 'dana@campus.com', 'Dana', FALSE, '2026-04-11', '2026-04-11 21:05:00', 69.5, 'starter')

	;



--3. Write these SELECT queries using only lesson 2 material:

	-- 1) show all rows and all columns

	SELECT *

	FROM workshop_roster

	;

	-- 2) show only display_name, contact_email, completion_score

	SELECT display_name, contact_email, completion_score

	FROM workshop_roster

	;

	-- 3) show rows where wants_certificate = FALSE and last_activity &lt; '2026-04-10'

	SELECT *

	FROM workshop_roster

	WHERE wants_certificate = FALSE and last_activity &lt; '2026-04-10'

	;

	-- 4) show rows where display_name and contact_email both start with m (use LIKE)

	SELECT *

	FROM workshop_roster

	WHERE display_name like 'm%' and contact_email like 'm%'

	;

	-- 5) show rows where completion_score &lt; 85

	SELECT *

	FROM workshop_roster

	WHERE completion_score &lt; 85

	;



--4. Try one insert with duplicate contact_email and explain which constraint blocks it

INSERT INTO workshop_roster (roster_id, contact_email, display_name, wants_certificate, start_date, last_activity, completion_score, group_label)

VALUES 	(6, 'mika@campus.com', 'Mija', TRUE, '2026-04-02', '2026-04-14 08:15:00', 94.5, 'starter')

;

--Result: ||UNIQUE|| constraint failed: workshop_roster.contact_email

	--unique prevents entering 2 identical values- no duplications/



--5. Try one insert with completion_score = 120 and explain which constraint blocks it

INSERT INTO workshop_roster (roster_id, contact_email, display_name, wants_certificate, start_date, last_activity, completion_score, group_label)

VALUES 	(6, 'mika@ctuusy.com', 'Mija', TRUE, '2026-04-02', '2026-04-14 08:15:00', 120, 'starter')

;

-- Result: CHECK constraint failed: completion_score BETWEEN 0 AND 100

	--CHECK prevents entering anything outside a rulle imbeded in to it like our's-

		-- CHECK contrain: completion_score BETWEEN 0 AND 100</sql><current_tab id="0"/></tab_sql></sqlb_project>
