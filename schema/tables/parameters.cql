CREATE TABLE hydroview.parameters (
    bucket int,
    parameter_name text,
    parameter_type text,
    parameter_id uuid,
    parameter_description frozen<description>,
    parameter_unit text,
    PRIMARY KEY ((bucket), parameter_name, parameter_type, parameter_id)
) WITH CLUSTERING ORDER BY (parameter_name ASC, parameter_type ASC, parameter_id ASC);