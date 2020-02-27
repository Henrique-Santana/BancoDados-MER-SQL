CREATE DATABASE SPMedicalGruopManha;

USE SPMedicalGruopManha;

CREATE TABLE TipoUsuario(
	IDTipoUsuario      INT PRIMARY KEY IDENTITY,
	TituloTipoUsuario  VARCHAR (50) NOT NULL UNIQUE
);

CREATE TABLE Situacao(
	IDSituacao       INT PRIMARY KEY IDENTITY,
	TituloSituacao   VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Especialidade(
	IDEspecialidade      INT PRIMARY KEY IDENTITY,
	TituloEspecialidade  VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Clinica(
	IDClinica            INT PRIMARY KEY IDENTITY,
	NomeFantasia         VARCHAR (100),
	CNPJ                 CHAR(14) NOT NULL UNIQUE,
	RazaoSocial          VARCHAR (50) NOT NULL,
	EnderecoClinica      VARCHAR (50) NOT NULL UNIQUE,
	HorarioFuncionamento VARCHAR (10)
);

CREATE TABLE Usuario(
	IDUsuario     INT PRIMARY KEY IDENTITY,
	Nome          VARCHAR (50),
	Email         VARCHAR (50),
	Senha         VARCHAR (50),
	IDTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario (IDTipoUsuario),
	IDClinica     INT FOREIGN KEY REFERENCES Clinica (IDClinica)
);

CREATE TABLE Paciente (
	IDPaciente       INT PRIMARY KEY IDENTITY,
	RG               VARCHAR (50) NOT NULL UNIQUE,
	CPF              VARCHAR (50) NOT NULL UNIQUE,
	DataNascimento   DATETIME2 NOT NULL,
	EnderecoPaciente VARCHAR (255) NOT NULL,
	Telefone         VARCHAR (50), 
	IDUsuario        INT FOREIGN KEY REFERENCES Usuario (IDUsuario)
);

CREATE TABLE Medico (
	IDMedico        INT PRIMARY KEY IDENTITY,
	CRM             VARCHAR(50) NOT NULL,
	IDUsuario       INT FOREIGN KEY REFERENCES Usuario (IDUsuario),
	IDEspecialidade INT FOREIGN KEY REFERENCES Especialidade (IDEspecialidade)
);

CREATE TABLE Consulta (
	IDConsulta   INT PRIMARY KEY IDENTITY,
	DataConsulta VARCHAR (30) NOT NULL,
	Descricao    VARCHAR (255),
	IDMedico     INT FOREIGN KEY REFERENCES Medico (IDMedico),
	IDPaciente   INT FOREIGN KEY REFERENCES Paciente (IDPaciente),
	IDSituacao   INT FOREIGN KEY REFERENCES Situacao (IDSituacao)
);
CREATE TABLE Endereco(
	IDEndereco  INT PRIMARY KEY IDENTITY,
	IDCidade INT FOREIGN KEY REFERENCES Cidade (IDCidade),
	IDBairro INT FOREIGN KEY REFERENCES Bairro (IDBairro),
	IDEstado INT FOREIGN KEY REFERENCES Estado (IDEstado),
	Logradouro VARCHAR (50),
	CEP VARCHAR (15)
);

CREATE TABLE Cidade(
	IDCidade  INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (50)
);

CREATE TABLE Bairro(
	IDBairro  INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (50)
);
CREATE TABLE Estado(
	IDEstado  INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (50)
);

INSERT INTO Especialidade (TituloEspecialidade)
VALUES  ('Acupuntura'),
		('Anestesiologia'),
		('Angiologia'),
		('Cardiologia'),
		('Cirurgia Cardiovascular'),
		('Cirurgia da Mão'),
		('Cirurgia do Aparelho Digestivo'),
		('Cirurgia Geral'),
		('Cirurgia Pediátrica'),
		('Cirurgia Plástica'),
		('Cirurgia Torácica'),
		('Cirurgia Vascular'),
		('Dermatologia'),
		('Radioterapia'),
		('Urologia'),
		('Pediatria'),
		('Psiquiatria');

INSERT INTO Situacao (TituloSituacao)
VALUES  ('Cancelada'),
		('Realizada'),
		('Agendada');

INSERT INTO TipoUsuario (TituloTipoUsuario)
VALUES  ('ADM'),
		('Paciente'),
		('Medico');
		SELECT * FROM TipoUsuario;
INSERT INTO Usuario (Nome,Email,Senha,IDTipoUsuario,IDClinica)
VALUES 
		('Adiministrador', 'Adm@adm.com','adm123',2,1),
		('Ligia',	'ligia@gmail.com' ,	'ligia123',1,1),
		('Alexandre',	'alexandre@gmail.com',  'ale1231',1,1),
		('Fernando'	,'fernando@gmail.com' ,  'fer1223',1,1),
		('Henrique',	'henrique@gmail.com ','hen123',1,1),
		('João'	,'joao@hotmail.com ', 'jo123',1,1	),
		('Bruno'	,'bruno@gmail.com' , 'bru123',1,1	),
		('Mariana'	,'mariana@outlook.com',  'mar123',1,1	),
		('Ricardo Lemos','ricardo.lemos@spmedicalgroup.com.br ' ,'ri1232',3,1	),
		('Roberto Possarle',	'roberto.possarle@spmedicalgroup.com.br', ' ro123',3,1),
		('Helena Strada','helena.souza@spmedicalgroup.com.br', ' hel123',3,1);

INSERT INTO Clinica (NomeFantasia,CNPJ,RazaoSocial ,EnderecoClinica ,HorarioFuncionamento)
VALUES 
		('Clinica Possarle' ,'1231322233',	'SP Medical Group',	'Av. Barão Limeira ,532, São Paulo,','	12h');

INSERT INTO Paciente (RG ,CPF ,DataNascimento ,EnderecoPaciente ,Telefone,IDUsuario)
VALUES  ('43522543-5','94839859000','13/10/1983','Rua Estado de Israel 240, São Paulo, Estado de São Paulo, 04022-000', '113456-7654',1),
		('32654345-7','73556944057','23/07/2001','Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200','1198765-6543',2),
		('54636525-3','16839338002','10/10/1978' ,'Av. Ibirapuera - Indianópolis, 2927,  São Paulo - SP, 04029-200','1197208-4453',3),
		('54366362-5'	,'14332654765','13/10/1985' ,'R. Vitória, 120 - Vila Sao Jorge, Barueri - SP, 06402-030','113456-6543',4),
		('332544444-1', '91305348010','27/08/1975' ,'R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeirão Pires - SP, 09405-380','117656-6377',5),
		('54566266-7'	,'79799299004','21/03/1972','Alameda dos Arapanés, 945 - Indianópolis, São Paulo - SP, 04524-001','1195436-8769',6),
		('54566266-8', '13771913039', '05/03/2018' ,'R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407-140', '0',7);

INSERT INTO Medico(CRM,IDUsuario,IDEspecialidade)
VALUES  ('54356-SP', 8, 2),
		('53452-SP', 9, 17),
		('65463-SP', 10, 16);


INSERT INTO Consulta (DataConsulta,Descricao,IDMedico,IDPaciente,IDSituacao)
VALUES  ('20/01/2020 15:00', 'DES',3, 1, 2),
		('06/01/2020 10:00', 'DES',2, 2, 1),
		('07/02/2020 11:00', 'DES',2, 3, 2),
		('06/02/2018 10:00', 'DES',2, 4, 2),
		('07/02/2019 11:00', 'DES',1, 5, 1),
		('08/03/2020 15:00', 'DES',3, 6, 3),
		('09/03/2020 11:00', 'DES',1, 7, 3);

INSERT INTO Bairro (Titulo)
VALUES ('');

INSERT INTO Cidade(Titulo)
VALUES	('São Paulo'),
		('Bela Vista'),
		('Indianópoles'),
		('Barueri'),
		('Santa Luiza');
;
INSERT INTO Estado(Titulo)
VALUES ('São Paulo');


--Quantidade de usuários após realizar a importação do banco de dados.
SELECT COUNT(*) AS TotalUsuarios FROM Usuario

--Alterar data de nascimento para mes dia e ano.
SELECT CONVERT (VARCHAR(10),DataNascimento,110) AS [MM-DD-YYYY]
FROM Paciente;

--MOSTRAR OS NOMES DOS MEDICOS NAS CONSULTAS
SELECT Nome AS Médico, Descricao, DataConsulta, TituloSituacao, IdPaciente FROM Usuario
INNER JOIN Medico ON Usuario.IdUsuario = Medico.IdUsuario
INNER JOIN Consulta ON Consulta.IdMedico = Medico.IdMedico
INNER JOIN Situacao ON Situacao.IdSituacao = Consulta.IdSituacao
--MOSTRAR OS NOMES DOS PACIENTES NAS CONSULTAS
SELECT Nome AS Paciente, Descricao, DataConsulta, TituloSituacao,IdMedico FROM Usuario
INNER JOIN Paciente ON Usuario.IdUsuario = Paciente.IdUsuario
INNER JOIN Consulta ON Consulta.IdMedico = Paciente.IdPaciente
INNER JOIN Situacao ON Situacao.IdSituacao = Consulta.IdSituacao


SELECT * FROM Usuario;
SELECT * FROM Consulta;

--Implementação de dados
--Apagar coluna Nome de USUARIO e Colocala em medico e Paciente
ALTER TABLE Usuario
DROP COLUMN Nome;

ALTER TABLE Clinica
DROP COLUMN EnderecoClinica;

ALTER TABLE Paciente
DROP COLUMN EnderecoPaciente;

 -- add coluna
--ALTER TABLE alerar alguma coluna 
ALTER TABLE Usuario
ADD Nome VARCHAR (50);

ALTER TABLE Medico
ADD Nome VARCHAR (50);

ALTER TABLE Clinica 
ADD IDEndereco INT FOREIGN KEY REFERENCES Endereco (IDEndereco);

ALTER TABLE Usuario
ADD IDEndereco INT FOREIGN KEY REFERENCES Endereco (ODEndereco);
