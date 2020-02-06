--Cria o banco de dados com nome do project
CREATE DATABASE Gufi_Manha;

--Define o banco de dados que ser� utilizado.
Use Gufi_Manha;

--Cria��o das tabelas.
CREATE TABLE TipoUsuario (
	IdTipoUsuario INT PRIMARY KEY IDENTITY,
	Titulo        VARCHAR (255) NOT NULL UNIQUE
);
CREATE TABLE TipoEvento(
	IdEvento         INT PRIMARY KEY IDENTITY,
	TituloTipoEvento VARCHAR (255) NOT NULL UNIQUE
);
CREATE TABLE Instituicao(
	IdInstitucao INT PRIMARY KEY IDENTITY,
	CNPJ         CHAR(14) NOT NULL UNIQUE,
	NomeFantasia VARCHAR (255) UNIQUE,
	Endereco     VARCHAR (255) NOT NULL UNIQUE
);
CREATE TABLE Usuario (
	IdUsuario     INT PRIMARY KEY IDENTITY,
	Nome          VARCHAR (255) NOT NULL,
	Email         VARCHAR (255) UNIQUE,
	Senha         VARCHAR (255) NOT NULL,
	DataCasdastro DateTime2,
	Genaro        VARCHAR (255),
	IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario)
);