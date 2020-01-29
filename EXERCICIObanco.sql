--CREATE DATABASE Criar o banco de daddos.
CREATE DATABASE TipoMusical;

USE para poder usar o banco.
USE TipoMusical; 

--Sempre comecar pela tabela que tem menos chaves extrangeiras.

-- CREATE TABLE para criar a tabela
CREATE TABLE EstilosMusicais (
-- CHAVE PRIMARIA primeiro coloca o nome da coluna, tipo "int", tipo da chave (PRIMARY KEY- chave primaria), IDENTITY para ser sequencial os dados da tabela.
 IDEstiloMsuical  INT PRIMARY KEY IDENTITY,
-- nome da coluna, VARCHAR vc usa quando quer estipular um maximo de caracteres, NOT NULL serve para não aceitar esse campo vazio.
 Nome VARCHAR (200) NOT NULL 
 );

 CREATE TABLE Artistas(
 IDArtista INT PRIMARY KEY IDENTITY,
 NomeArtista VARCHAR (200) NOT NULL,
--Chave estrangeira, nome da chave que vc quer usar, tipo, REFERENCES nome da coluna, nome da chave.
 IDEstiloMsuical int FOREIGN  KEY REFERENCES  EstilosMusicais(IDEstiloMsuical) -- REFERENCES ELE É A PONTE ENTRE UMA TABELA,, OUTRA Generos (IDGenero) NOME TABELA depois ATRIBUTO
 );



 --ALTERACAO ADICIONAL COLUNA

 -- add coluna
--ALTER TABLE alerar alguma coluna 
ALTER TABLE Artistas
ADD adicionar
ADD DataNascimento DATE;
SELECT * FROM Artistas;

--
 ALTER TABLE Atistas
 MODIFY Nome CHAR;

 
 ALTER TABLE Artista
 DROP COLUMN Nome;
 SELECT * FROM 


 --APAGAR TABELA  
 DROP TABLE Atistas;

 SELECT * FROM Atistas;

-- excluir banco de dados... não da para apagalo se vc estiver usando o banco. 
DROP DATABASE nome do banco;

USE MASTER; --SAIR DO BANCO E IR PARA O PRINCIPAL



 