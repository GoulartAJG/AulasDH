CREATE TABLE IF NOT EXISTS `DHTUBE`
DEFAULT CHARSET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_general_ci' 
;

USE `DHTUBE`;
 
 CREATE TABLE IF NOT EXISTS Playlist
 (
nPlaylistID INT UNSIGNED AUTO_INCREMENT,
strNomeUsuario VARCHAR(45) NULL,
dtCriacao DATE NULL,
nPrivado SMALLINT(6),
CONSTRAINT PK_Playlist_nPlaylistID PRIMARY KEY (nPlaylistId)
);

CREATE TABLE Usuario 
(
nUsuarioID INT UNSIGNED AUTO_INCREMENT,
strNome VARCHAR(45),
strEmail VARCHAR(45),
strSenha VARCHAR(45),
dtNascimento DATETIME,
strCep VARCHAR(45),
CONSTRAINT PK_Usuario_nUsuario PRIMARY KEY (nUsuarioId)
);

INSERT INTO Usuario
VALUES(DEFAULT, '','','','','','');

INSERT INTO Usuario
VALUES(DEFAULT, '','','','','','');

INSERT INTO Usuario
VALUES(DEFAULT, '','','','','','');

INSERT INTO Usuario
VALUES(DEFAULT, '','','','','','');

CREATE TABLE Avatar
(
NAvatarID INT UNSIGNED AUTO_INCREMENT,
strNome varchar(45),
strUrlImagem VARCHAR(100),
CONSTRAINT PK_Avatar_nAvatar PRIMARY KEY (nAvatarId)
);

CREATE TABLE Canal
(
nCanalID INT UNSIGNED AUTO_INCREMENT,
strNome VARCHAR(45),
strDescricao TEXT,
DTCriacao DATETIME,
CONSTRAINT PK_Avatar_nAvatar PRIMARY KEY (nAvatarId)
);

CREATE TABLE Video
(
nVideoID INT(11),
Usuario_idUsuario INT(11),
titulo VARCHAR(100),
descricao TEXT,
tamanho DOUBLE, 
nomeArquivo Varchar(100),
duracao DOUBLE, 
imagem VARCHAR(100),
qtdReproducoes INT(11),
qtdLikes INT(11),
qtdDislikes INT(11),
Nprivado SMALLINT(6),
dataPublicado DATETIME
); 

CREATE TABLE pais (
idPais INT(11),
nome VARCHAR(100)
);

CREATE TABLE playlist_video (
Video_idVideo INT(11),
Playlist_idPlaylist INT(11)
);
