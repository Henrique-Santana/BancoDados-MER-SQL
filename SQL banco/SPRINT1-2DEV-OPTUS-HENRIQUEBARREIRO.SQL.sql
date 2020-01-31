CREATE DATABASE OPTUS_MANHA;
USE OPTUS_MANHA;

CREATE TABLE Artista(
	 IDArtista INT PRIMARY KEY IDENTITY,
	 Nome VARCHAR (100) NOT NULL
	 );

CREATE TABLE Estilo(
	IDEstilo INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100) NOT NULL
	);

CREATE TABLE TipoUsuario (
	IDTipoUsuario INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (100) NOT NULL
	);

CREATE TABLE USUARIO (
	IDUsuario INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100) NOT NULL,
	IDTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario (IDTipoUsuario)
);

CREATE TABLE Albuns (
	IDAlbum INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100) NOT NULL,
	DataLan�amento DATE NOT NULL,
	QtdMinutos BIGINT,
	Visualisacao INT,
	IDArtista INT FOREIGN KEY REFERENCES Artista (IDArtista),
	IDEstilo INT FOREIGN KEY REFERENCES Estilo (IDEstilo)
); 

	SELECT * FROM TipoUsuario;
	SELECT * FROM Artista;
	SELECT * FROM Estilo;
	SELECT * FROM USUARIO;
	SELECT * FROM Albuns;

INSERT INTO TipoUsuario (Titulo)
VALUES ('COMUM'),
	   ('ADM');

INSERT INTO Artista (Nome)
VALUES ('DRAKE'),
	   ('GUNNA'),
	   ('JOHN DEVENR'),
	   ('FRANK SINATRA'),
	   ('PERICLES');

INSERT INTO Artista (Nome)
VALUES ('JOHN DEVENR'),
	   ('FRANK SINATRA');

	DELETE FROM Artista
	WHERE IDArtista = 4;

INSERT INTO Estilo (Nome)
VALUES ('RAP'),
       ('COUNTRY'),
	   ('SAMBA'),
	   ('JAZZ');

INSERT INTO USUARIO (Nome, IDTipoUsuario)
VALUES ('VICTOR', 1),
	   ('ARMNADO',1),
	   ('FLAVIA',2),
	   ('MARIA',1),
	   ('BENEDITO',2);

INSERT INTO Albuns (Nome, DataLan�amento, QtdMinutos, Visualisacao, IDArtista, IDEstilo)
VALUES ('Thats Life', '15-10-2000', 30, 2000000, 7, 4),
	   ('Feito pra Durar', '15-1-2000', 40, 2000000, 5, 3),
	   ('Back Home Again', '15-1-2000', 40,20000, 6, 2),
	   ('Scorpion', '1-3-2019', 23,30000, 1, 1),
	   ('Drip or Drown 2', '8-1-2018',27,2000, 2, 1);

--Alterar Nome de um Artista.
UPDATE Artista
SET Nome = 'GUNNAAAA'
WHERE IDArtista = 2;

--Alterar um Tipo de Usu�rio.
UPDATE TipoUsuario
SET Titulo = 'VIP'
WHERE IDTipoUsuario = 2;

--Alterar a Quantidade de visualiza��o de um �lbum.
UPDATE Albuns
SET Visualisacao = 35000000
WHERE IDAlbum = 16;

--Apagar um �lbum
DELETE FROM Albuns
WHERE IDAlbum = 17;





--SELECIONAR OS ALBUNS DO MESMO ARTISTA.
SELECT * FROM Albuns WHERE IDArtista = 5;

--SELECIONAR OS ALBUNS LANCADOS NA MESMA DT.
SELECT * FROM Albuns WHERE DataLan�amento = '15-1-2000';

--SELECIOAR OS ARTISTAS DO MESMO ESTILO MUSICAL.
SELECT * FROM Albuns WHERE IDEstilo= 1;

--SELECIONAR ALBUNS E ARTISTAS E ORDENAR A DATA DE LAN�AMENTO DA MAIS RECENTES PARA O MAIS ANTIGO.
SELECT IDAlbum,Nome,DataLan�amento FROM Albuns
ORDER BY DataLan�amento DESC; -- DESC MAIOR PARA O MENOR 

-- LANCAMENTOS DO MAIS ANTIGO PARA O MAIS RECENTE.
SELECT IDAlbum,Nome,DataLan�amento FROM Albuns
ORDER BY DataLan�amento;
	   



		
