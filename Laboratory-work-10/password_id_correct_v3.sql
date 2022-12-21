CREATE OR REPLACE FUNCTION password_is_correct_v3(password varchar)
RETURNS BOOLEAN
AS $$
BEGIN
	RETURN password NOT SIMILAR TO '(\S{11,20}|[^0-9]{1,10}|[^a-z]{2,10}|[^A-Z]{4,10}|[^!@#$%^&*]{2,10})';
END;
$$ LANGUAGE plpgsql;
