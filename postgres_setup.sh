pg_ctl start -D /var/lib/pgsql/data

DO
$body$
BEGIN
	IF NOT EXISTS (
		SELECT *
		FROM pg_catalog.pg_user
		WHERE usename = 'zac') THEN

		CREATE ROLE zac LOGIN PASSWORD '';
	END IF;
END
$body$;
