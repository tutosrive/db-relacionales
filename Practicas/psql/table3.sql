CREATE TABLE IF NOT EXISTS table3 (
	c VARCHAR(1),
	d INT,
	e VARCHAR(1),
	CONSTRAINT pk_table3 PRIMARY KEY (c, d)
);


-- alter table table3 add constraint uq_C unique (C);
-- alter table table3 add  constraint uq_D unique (D);
INSERT INTO
	table3 (c, d, e)
VALUES
	('x', 1, 'w'),
	('x', 2, 'z');