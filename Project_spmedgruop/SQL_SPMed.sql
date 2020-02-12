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
	IDTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario (IDTipoUsuario),
	IDClinica     INT FOREIGN KEY REFERENCES Clinica (IDClinica),
	Nome          VARCHAR (50),
	Email         VARCHAR (50),
	Senha         VARCHAR (50)
);

CREATE TABLE Paciente (
	IDPaciente       INT PRIMARY KEY IDENTITY,
	IDUsuario        INT FOREIGN KEY REFERENCES Usuario (IDUsuario),
	RG               INT NOT NULL UNIQUE,
	CPF              VARCHAR (11) NOT NULL UNIQUE,
	DataNascimento   DATE NOT NULL,
	EnderecoPaciente VARCHAR (50) NOT NULL,
	Telefone         INT 
);

CREATE TABLE Medico (
	IDMedico        INT PRIMARY KEY IDENTITY,
	IDUsuario       INT FOREIGN KEY REFERENCES Usuario (IDUsuario),
	IDEspecialidade INT FOREIGN KEY REFERENCES Especialidade (IDEspecialidade),
	CRM             VARCHAR NOT NULL
);

CREATE TABLE Consulta (
	IDConsulta   INT PRIMARY KEY IDENTITY,
	IDMedico     INT FOREIGN KEY REFERENCES Medico (IDMedico),
	IDPaciente   INT FOREIGN KEY REFERENCES Paciente (IDPaciente),
	IDSituacao   INT FOREIGN KEY REFERENCES Situacao (IDSituacao),
	DataConsulta VARCHAR (11) NOT NULL,
	Descricao    CHAR (255)
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

INSERT INTO Usuario (IDTipoUsuario,IDClinica,Nome,Email,Senha)
VALUES 
		(1	,1	,'Ligia',	'ligia@gmail.com' ,	'ligia123'),
		(1	,1	,'Alexandre',	'alexandre@gmail.com',  'ale1231'),
		(1	,1	,'Fernando'	,'fernando@gmail.com' ,  'fer1223'),
		(1	,1	,'Henrique',	'henrique@gmail.com ','hen123'),
		(1	,1	,'João'	,'joao@hotmail.com ', 'jo123'	),
		(1	,1	,'Bruno'	,'bruno@gmail.com' , 'bru123'	),
		(1	,1	,'Mariana'	,'mariana@outlook.com',  'mar123'	),
		(3	,1	,'Ricardo Lemos','ricardo.lemos@spmedicalgroup.com.br ' ,'ri1232'	),
		(3	,1	,'Roberto Possarle',	'roberto.possarle@spmedicalgroup.com.br', ' ro123'),
		(3	,1	,'Helena Strada','helena.souza@spmedicalgroup.com.br', ' hel123');

INSERT INTO Clinica (NomeFantasia,CNPJ,RazaoSocial ,EnderecoClinica ,HorarioFuncionamento)
VALUES 
		('Clinica Possarle' ,'1231322233',	'SP Medical Group',	'Av. Barão Limeira ,532, São Paulo,','	12h');

INSERT INTO Paciente (IDUsuario,RG ,CPF ,DataNascimento ,EnderecoPaciente ,Telefone)
VALUES  (1	,43522543-5,94839859000,13/10/1983,'Rua Estado de Israel 240, São Paulo, Estado de São Paulo, 04022-000', 113456-7654),
		(2	,32654345-7,73556944057,23/07/2001,'Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200',1198765-6543),
		(3	,54636525-3,16839338002,10/10/1978 ,'Av. Ibirapuera - Indianópolis, 2927,  São Paulo - SP, 04029-200',1197208-4453),
		(4	,54366362-5	,14332654765,13/10/1985 ,'R. Vitória, 120 - Vila Sao Jorge, Barueri - SP, 06402-030',113456-6543),
		(5	,332544444-1, 91305348010,27/08/1975 ,'R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeirão Pires - SP, 09405-380',117656-6377),
		(6	,54566266-7	,79799299004,21/03/1972,'Alameda dos Arapanés, 945 - Indianópolis, São Paulo - SP, 04524-001',1195436-8769),
		(7	,54566266-8, 13771913039, 05/03/2018 ,'R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407-140', 0);

INSERT INTO Medico(IDUsuario,IDEspecialidade,CRM)
VALUES  (8	,2,	'54356-SP'),
		(9	,17, '53452-SP'),
		(10	,16, '65463-SP');

INSERT INTO Consulta (IDMedico,IDPaciente,IDSituacao,DataConsulta,Descricao)
VALUES  (3, 1, 2, '20/01/2020 15:00', 'DES'),
		(2, 2, 1, '06/01/2020 10:00', 'DES'),
		(2, 3, 2, '07/02/2020 11:00', 'DES'),
		(2, 4, 2, '06/02/2018 10:00', 'DES'),
		(1, 5, 1, '07/02/2019 11:00', 'DES'),
		(3, 6, 3, '08/03/2020 15:00', 'DES'),
		(1, 7, 3, '09/03/2020 11:00', 'DES');


