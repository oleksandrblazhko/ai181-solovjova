CREATE OR REPLACE FUNCTION get_data(university_name VARCHAR)
RETURNS TABLE (a_id INTEGER, name VARCHAR, year INTEGER) AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'SELECT u_id, name, year FROM university WHERE name = ''' || university_name || '''';
	RAISE NOTICE 'Query=%', str;
	RETURN QUERY EXECUTE str;
END;
$$ LANGUAGE plpgsql;
