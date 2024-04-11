-- Creating the database
DROP DATABASE IF EXISTS megadados;
CREATE DATABASE megadados;
use megadados;

-- Creating the tables
-- Departamento
DROP TABLE IF EXISTS Departamento;
CREATE TABLE Departamento(
	idDepartamento INT NOT NULL,
    nome VARCHAR(80) NOT NULL,
    PRIMARY KEY (idDepartamento)
);

-- Funcionairo that depends on departamento
DROP TABLE IF EXISTS Funcionairo;
CREATE TABLE Funcionario(
	RG INT NOT NULL,
    orgao VARCHAR(10) NOT NULL,
    nome VARCHAR(80) NOT NULL UNIQUE,
    salario FLOAT NOT NULL DEFAULT 500.0,
    telefone VARCHAR(30),
    idDepartamento INT NOT NULL,
    PRIMARY KEY(RG, orgao),
    FOREIGN KEY(idDepartamento)
		REFERENCES Departamento(idDepartamento),
	CHECK (salario >= 0)
);

-- Altering Existing Table
ALTER TABLE Funcionario
	ADD COLUMN (
		RG_mentor INT,
        orgao_mentor INT
    );
ALTER TABLE Funcionario
	MODIFY COLUMN
		orgao_mentor VARCHAR(10);
ALTER TABLE Funcionario
	ADD FOREIGN KEY (RG_mentor, orgao_mentor)
		REFERENCES Funcionario(RG, orgao);
    
