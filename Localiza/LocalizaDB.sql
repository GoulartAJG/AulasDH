CREATE DATABASE IF NOT EXISTS `LOCALIZA`
DEFAULT CHARSET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_general_ci'
;

USE `LOCALIZA`;

CREATE TABLE Marca
(
nMarcaID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
strDescricao VARCHAR(45)
);

 CREATE TABLE Modelo
 (
 nModeloID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
 strDescricao VARCHAR(45),
 nID_Marca INT UNSIGNED,
 CONSTRAINT FK_Modelo_Marca FOREIGN KEY (nID_Marca)
REFERENCES Marca (nMarcaID) 
 );
 
CREATE TABLE Veiculo
 ( 
 nVeiculoID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
 strPlaca VARCHAR(45), 
 strChassi VARCHAR(45), 
 strRenavan VARCHAR(45), 
 strCor VARCHAR(45),
 dtAno DATE
 );  
 
 CREATE TABLE Seguro
 ( 
 nSeguroID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 strApolice VARCHAR(45), 
 strValor DECIMAL(6,2), 
 dtVencimento DATE, 
 nIDVEICULO INT UNSIGNED, 
 CONSTRAINT FK_Seguro_Veiculo FOREIGN KEY (nIDVeiculo)
 references Veiculo (nVeiculoID)
 );

CREATE TABLE Manutencao
( 
nManuntencaoID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
strTipo ENUM('PREVENTIVA','CORRETIVA'), 
strKm INT, 
dtDATA DATE, 
strDescricao VARCHAR(100), 
nIDVeiculo INT UNSIGNED, 
CONSTRAINT FK_Manutencao_Veiculo FOREIGN KEY (nIDVeiculo) 
REFERENCES Veiculo (nVeiculoID)
);  

CREATE TABLE Realizado
( 
nRealizadoID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
strDescricao VARCHAR(45), 
strValor DECIMAL(6,2), 
nIDManutencao INT UNSIGNED, 
CONSTRAINT FK_Realizado_Manutencao FOREIGN KEY (nIDManutencao) 
REFERENCES Manutencao(nManuntencaoID)
);  

CREATE TABLE Locatario
(
nLocatarioID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
strNome VARCHAR(80),
strTipo ENUM('pj','pf'),
strCpf_Cnpj VARCHAR(45),
strRua VARCHAR(45),
strNumero VARCHAR(45),
strComplemento VARCHAR(45), 
strCep VARCHAR(45),
strBairro VARCHAR(45),
strCidade VARCHAR(45)
); 

CREATE TABLE Telefone
( 
nTelefoneID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
srtTipo VARCHAR(45),
srtDdd VARCHAR(3),
srtNumero VARCHAR(45),
nIDLocatario INT UNSIGNED,
CONSTRAINT FK_Telefone_Locatario FOREIGN KEY (nIDLocatario)
REFERENCES Locatario (nLocatarioID)
);  

CREATE TABLE Locacao
( 
nLocacaoID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
dtLocacao DATETIME,
dtDevolucao_prev DATETIME,
srtKmInicial INT,
srtKmFinal INT,
srtValor DOUBLE(6,2),
srtObservacoes LONGTEXT,
nIDLocatario INT UNSIGNED,
nIDVeiculo INT UNSIGNED,
CONSTRAINT FK_Locacao_Locatario FOREIGN KEY (nIDLocatario)
REFERENCES Locatario (nLocatarioID),
CONSTRAINT FK_Locacao_Veiculo FOREIGN KEY (nIDVeiculo)
REFERENCES veiculo (nVeiculoID)
);
