/*
Esse BD foi criado para que todas as informações de quem deseja alugar veículos na localiza,
possam ser registradas e armazenadas de maneira segura, organizada e padronizada.
*/ 

/*Cria o DB Localiza se ele não existir e define o conjunto de caracteres válidos nesse DB*/ 
CREATE DATABASE IF NOT EXISTS `LOCALIZA`
 DEFAULT CHARSET = 'utf8mb4'
  DEFAULT COLLATE = 'utf8mb4_general_ci';

/*Irá utilizar o DB `Localiza`*/ 
USE `LOCALIZA`;

/*Cria a tabela `Locatario`*/ 
CREATE TABLE `Locatario` (
 nLocatarioID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  strNome VARCHAR(80) NOT NULL,
   strTipo ENUM('pj', 'pf') NOT NULL,
    strCpf_Cnpj VARCHAR(45) NOT NULL,
     strRua VARCHAR(45),
      strNumero VARCHAR(45),
       strComplemento VARCHAR(45),
        strCep VARCHAR(45),
         strBairro VARCHAR(45),
          strCidade VARCHAR(45)
  );

/*Cria a Tabela `Marca`*/ 
CREATE TABLE `Marca` (
 nMarcaID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  strDescricao VARCHAR(45)
);

/*Cria a Tabela `Modelo`*/ 
CREATE TABLE `Modelo` (
 nModeloID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  strDescricao VARCHAR(45),
   nIDMarca_Modelo INT UNSIGNED,
 CONSTRAINT fk_modelo_marca FOREIGN KEY (nIDMarca_Modelo)
REFERENCES marca (nMarcaID)
  );
  
/*Cria a Tabela `Veiculo`*/  
CREATE TABLE `Veiculo` (
 nVeiculoID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  strPlaca VARCHAR(45) NOT NULL,
   strChassi VARCHAR(45) NOT NULL,
    strRenavan VARCHAR(45) NOT NULL,
     strCor VARCHAR(45),
      dtAno DATE,
       nIDVeiculo_Modelo INT UNSIGNED,
  CONSTRAINT fk_veiculo_modelo FOREIGN KEY (nIDVeiculo_Modelo)
REFERENCES modelo (nModeloID)
  );

/*Cria a Tabela `Locacao`*/ 
CREATE TABLE `Locacao` (
 nLocacaoID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  dtLocacao DATETIME,
   dtDevolucao_prev DATETIME,
    srtKmInicial INT,
     srtKmFinal INT,
      srtValor DOUBLE(6,2),
       srtObservacoes LONGTEXT,
        nIDLocacao_Locatario INT UNSIGNED,
         nIDLocacao_Veiculo INT UNSIGNED,
  CONSTRAINT fk_locacao_locatario FOREIGN KEY (nIDLocacao_Locatario)
REFERENCES locatario (nLocatarioID),
  CONSTRAINT fk_locacao_veiculo FOREIGN KEY (nIDLocacao_Veiculo)
REFERENCES veiculo (nVeiculoID)
);

/*Cria a Tabela `Manutencao`*/ 
CREATE TABLE `Manutencao` (
 nManuntencaoID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  strTipo ENUM('PREVENTIVA', 'CORRETIVA'),
   strKm INT,
    dtDATA DATE,
     strDescricao VARCHAR(100),
      nIDVeiculo_Manutencao INT UNSIGNED,
  CONSTRAINT fk_manutencao_veiculo FOREIGN KEY (nIDVeiculo_Manutencao)
REFERENCES veiculo (nVeiculoID)
);

/*Cria a Tabela `Seguro`*/ 
CREATE TABLE `Seguro` (
 nSeguroID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  strApolice VARCHAR(45) NOT NULL,
   strValor DECIMAL(6,2),
    dtVencimento DATE,
     nIDVeiculo_Seguro INT UNSIGNED,
  CONSTRAINT fk_seguro_veiculo FOREIGN KEY (nIDVeiculo_Seguro)
REFERENCES veiculo (nVeiculoID)
  );

/*Cria a Tabela `Telefone`*/ 
CREATE TABLE `Telefone` (
 nTelefoneID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  srtTipo VARCHAR(45),
   srtDdd VARCHAR(3),
    srtNumero VARCHAR(45),
      nIDLocatario_Telefone INT UNSIGNED,
CONSTRAINT fk_telefone_locatario FOREIGN KEY (nIDLocatario_Telefone)
 REFERENCES locatario (nLocatarioID)
  );


  
 /*Irá Utilizar o BD `Localiza`*/  
USE `Localiza`;

/*Irá inserir os dados dentro da tabela `Locatario`*/ 
INSERT INTO `Locatario` (strNome, strTipo, strCpf_Cnpj, strRua, strNumero, strComplemento, strCep, strBairro, strCidade)
VALUES ('Alan José Goulart', 'pf', 37547898555, 'Itororó', '568', 'Fundos', 12228556, 'São Judas Tadeu', 'São José dos Campos');

/*Irá nos mostrar os dados inseridos dentro da tabela `Locatario`*/ 
SELECT * FROM Locatario;

/*Irá atualizar o dado strNome dentro da tabela onde o nLocatarioID for igual a 1*/ 
UPDATE Locatario SET strNome='Alan Goulart' WHERE nLocatarioID=1;

/*Irá nos mostrar os dados inseridos dentro da tabela `Locatario`*/ 
SELECT * FROM Locatario;

/*Irá exluir os dados dentro da tabela `Locatario` quando o nLocatarioID for igual a 1*/ 
DELETE FROM Locatario WHERE nLocatarioID=1;

/*Irá nos mostrar os dados inseridos dentro da tabela `Locatario`*/ 
SELECT * FROM Locatario;
