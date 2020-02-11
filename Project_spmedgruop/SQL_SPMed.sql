CREATE DATABASE SPMedicalGruopManha;

USE SPMedicalGruopManha;

CREATE TABLE TipoUsuario(
	IDTipoUsuario      INT PRIMARY KEY IDENTITY,
	TituloTipoUsuario  VARCHAR (50) NOT NULL UNIQUE
);

CREATE TABLE Situcao(
	IDSituacao       INT PRIMARY KEY IDENTITY,
	TituloSituacao   VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Especialidade(
	IDEspecialidade      INT PRIMARY KEY IDENTITY,
	TituloEspecialidade  VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Clinica(
	IDClinica INT PRIMARY KEY IDENTITY,
	NomeFantasia VARCHAR (100),
	CNPJ CHAR
);