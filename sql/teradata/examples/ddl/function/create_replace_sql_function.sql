-- Defining an SQL UDF With a LOB Parameter
CREATE FUNCTION test.myudf (a CLOB, b INTEGER, c INTEGER,
d CHARACTER (100))
RETURNS CHAR(50)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SPECIFIC test.myudf
CALLED ON NULL INPUT
SQL SECURITY DEFINER
COLLATION INVOKER
INLINE TYPE 1
RETURN d || (SUBSTRING(a FROM b FOR c));

-- Defining an SQL UDF With a Function in its RETURN Statement
CREATE FUNCTION test.myudf (a CHARACTER(100))
RETURNS CHARACTER(400)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SPECIFIC test.myudf
CALLED ON NULL INPUT
SQL SECURITY DEFINER
COLLATION INVOKER
INLINE TYPE 1
RETURN CHAR2HEXINT(a);

-- Defining an SQL UDF With a DateTime Expression in its RETURN Statement
CREATE FUNCTION test.myudf ()
RETURNS DATE
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SPECIFIC test.myudf
CALLED ON NULL INPUT
SQL SECURITY DEFINER
COLLATION INVOKER
INLINE TYPE 1
RETURN CURRENT_DATE + 1;

-- Defining an SQL UDF With a Period Function in its RETURN Statement
CREATE FUNCTION test.myudf (a PERIOD(TIME))
RETURNS TIME
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SPECIFIC test.myudf
CALLED ON NULL INPUT
SQL SECURITY DEFINER
COLLATION INVOKER
INLINE TYPE 1
RETURN PRIOR(END(a));

-- Defining an SQL UDF With a Method in its RETURN Statement
CREATE FUNCTION test.zipcode (a address)
RETURNS CHARACTER(5)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SPECIFIC test.zipcode
CALLED ON NULL INPUT
SQL SECURITY DEFINER
COLLATION INVOKER
INLINE TYPE 1
RETURN a.zip();

-- Defining an SQL UDF With an External UDF in its RETURN Statement
CREATE FUNCTION test.udf (a INTEGER)
RETURNS INTEGER
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SPECIFIC test.udf
CALLED ON NULL INPUT
SQL SECURITY DEFINER
COLLATION INVOKER
INLINE TYPE 1
RETURN a + SYSLIB.my_external_udf();

-- Defining an SQL UDF With a Geospatial Data Type in Its RETURNS Clause and RETURN Statement
CREATE FUNCTION test.geospatial_type_UDF()
RETURNS ST_GEOMETRY
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SPECIFIC test.geospatial_type_UDF
CALLED ON NULL INPUT
SQL SECURITY DEFINER
COLLATION INVOKER
INLINE TYPE 1
RETURN NEW ST_GEOMETRY('POINT (1,2)');

-- Creating a Function with Geospatial Input Arguments
CREATE FUNCTION test.geospatial_type_udf
(a ST_GEOMETRY, b ST_GEOMETRY)
RETURNS INTEGER
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SPECIFIC test.geospatial_type_UDF
CALLED ON NULL INPUT
SQL SECURITY DEFINER
COLLATION INVOKER
INLINE TYPE 1
RETURN a.st_within(b);
