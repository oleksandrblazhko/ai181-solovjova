
create function get_data(university_name character varying, v_user_name character varying, v_token character varying)
    returns TABLE(u_id integer, name character varying, year integer)
    language plpgsql
as
$$
DECLARE
 str VARCHAR;
BEGIN
    CALL sso_control(v_user_name,v_token);
 str := 'SELECT u_id, name, year FROM university WHERE name = ''' || university_name || '''';
 RAISE NOTICE 'Query=%', str;
 RETURN QUERY EXECUTE str;
END;
$$;
