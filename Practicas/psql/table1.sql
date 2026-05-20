CREATE TABLE IF NOT EXISTS table1 (
	a VARCHAR(1),
	b VARCHAR(1),
	CONSTRAINT pk_table1 PRIMARY KEY (a)
);


INSERT INTO
	table1 (a, b)
VALUES
	('a', 'b');