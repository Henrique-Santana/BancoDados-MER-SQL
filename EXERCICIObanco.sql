CREATE DATABASE TipoMusical;

USE TipoMusical; 

CREATE TABLE EstilosMusicais (
 IDEstiloMsuical  INT PRIMARY KEY IDENTITY,
 Nome VARCHAR (200) NOT NULL 
 );

 CREATE TABLE Artistas(
 IDArtista INT PRIMARY KEY IDENTITY,
 NomeArtista VARCHAR (200) NOT NULL,
 IDEstiloMsuical int FOREIGN  KEY REFERENCES  EstilosMusicais(IDEstiloMsuical) -- REFERENCES ELE É A PONTE ENTRE UMA TABELA,, OUTRA Generos (IDGenero) NOME TABELA depois ATRIBUTO
 );



 --ALTERACAO ADICIONAL COLUNA
 -- add coluna
ALTER TABLE Artistas
ADD DataNascimento DATE;
SELECT * FROM Artistas;

--
 ALTER TABLE Atistas
 MODIFY Nome CHAR;

 --apagar coluna e banco
 ALTER TABLE Artista
 DROP COLUMN Nome;
 SELECT * FROM 


 --APAGAR TABELA  
 DROP TABLE Atistas;

 SELECT * FROM Atistas;

 