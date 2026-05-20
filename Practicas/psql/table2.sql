CREATE TABLE IF NOT EXISTS table2 (
	a VARCHAR(1),
	c VARCHAR(1),
	d INT,
	CONSTRAINT pk_table2 PRIMARY KEY (a, c, d),
	CONSTRAINT fk_a_t2 FOREIGN key (a) REFERENCES table1 (a),
	CONSTRAINT fk_c_t2 FOREIGN key (c, d) REFERENCES table3 (c, d)
	-- constraint fk_D_t2 foreign key (D) references table3(D)
);


INSERT INTO
	table2 (a, c, d)
VALUES
	('a', 'x', 1),
	('a', 'x', 2);