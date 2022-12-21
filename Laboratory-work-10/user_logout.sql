CREATE OR REPLACE FUNCTION user_logout(
    v_user_name varchar
)
	RETURNS INTEGER
AS $$
DECLARE
	v_user_id INTEGER;
BEGIN
	SELECT user_id INTO v_user_id 
	FROM users
	WHERE user_name = v_user_name;
	IF FOUND THEN 
		DELETE FROM sso_tokens WHERE user_id = v_user_id;
		RETURN 1;
	ELSE 
		RETURN -1;
	END IF;
END;
$$ LANGUAGE plpgsql;
