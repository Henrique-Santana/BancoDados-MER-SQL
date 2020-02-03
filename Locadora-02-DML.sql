



INSERT INTO Empresa (Nome)
	VALUES ('Alameda'),
		   ('Gilhermina');

INSERT INTO Cliente (Nome, CPF)
	VALUES ('Isabella', 123132123),
		   ('Giovanna', 134134134);

DELETE FROM Cliente
	WHERE IDCliente = 2;
	DELETE FROM Marca
	WHERE IDMarca = 6;

INSERT INTO Marca (Nome)
	VALUES ('GM'),
		   ('Ford'),
		   ('fiat')
		   ;

INSERT INTO Modelo (Nome, IDMarca)
	VALUES ('Onix', 1),
		   ('Fiesta', 2),
		   ('Argo', 3)
		   ;

INSERT INTO Veiculo(Placa, IDModelo, IDEmpresa)
	VALUES ('AKJ-2345', 1, 1),
		   ('ABV-5678', 2, 1),
		   ('SDF-9877', 3, 1)
		   ;
INSERT INTO Aluguel(IDCliente,IDVeiculo,DataInicio,DataFim)
	VALUES  (3,1,'03-2-2020','10-2-2020'),
			(4,2,'04-2-2020','11-2-2020'),
			(5,3,'05-2-2020','12-2-2020'),
			(6,1,'06-2-2020','13-2-2020');

