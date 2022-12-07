CREATE OR REPLACE FUNCTION change_data(role_name VARCHAR, access_level INTEGER)
RETURNS INTEGER AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'UPDATE role_access_level SET access_level = ' || access_level || ' WHERE role_name = ''' || role_name || '''';
	RAISE NOTICE 'Query=%', str;
	EXECUTE str;
    RETURN access_level;
END;
$$ LANGUAGE plpgsql;
