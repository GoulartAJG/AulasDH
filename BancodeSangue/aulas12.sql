USE `projeto_spotify`;

SELECT * FROM  cancao;
SELECT titulo FROM cancao WHERE LOCATE('z', titulo );
SELECT titulo FROM cancao WHERE titulo LIKE '_a%' and titulo like '%s';
SELECT `titulo` AS `Playlists`, `qtdcancoes` AS `Quantidade de Canções` FROM `playlist`
 WHERE `qtdcancoes` = (SELECT MAX(`qtdcancoes`) FROM `playlist`);
SELECT data_nac FROM usuario LIMIT `0,10` AND  GROUP BY ;
SELECT ORDER BY DESC;

SELECT titulo 
FROM cancao 
WHERE titulo LIKE 'z_'; 



SELECT titulo
FROM cancao
WHERE titulo
LIKE "_a%"
AND titulo
NOT LIKE "%s";

SELECT titulo AS 'Músicas', qtdcancoes AS'Quantidade de Canções'
FROM playlist
ORDER BY 'Músicas','Quantidade de Canções' DESC;

SELECT Nomeusuario, Data_nac 
FROM USUARIO 
ORDER BY Data_nac DESC LIMIT 10;


SELECT titulo 
FROM album 
ORDER BY titulo ASC;

SELECT titulo, qtdreproducao
FROM cancao
ORDER BY qtdreproducao DESC LIMIT 5;

SELECT titulo
FROM album
ORDER BY titulo ASC;

SELECT titulo, imagemcapa
FROM album
ORDER BY imagemcapa ASC, titulo ASC;

ALTER TABLE usuario;
INSERT INTO Nomeusuario
VALUES (DEFAULT, 'novousuariodespotify@gmail.com');
INSERT INTO NomeCompleto
VALUES (DEFAULT, 'Elmer Santos');
INSERT INTO senha
VALUES (DEFAULT, '4321m');
INSERT INTO Data_nac
VALUES (DEFAULT, '15/11/1991');
INSERT INTO sexo
VALUES (DEFAULT, 'Masculino');
INSERT INTO Cod
VALUES (DEFAULT, 'B4129ATF');
INSERT INTO Pais_idPais
VALUES (DEFAULT, 'Brasil');

DELETE FROM GENEROXCANCAO WHERE idgenero = '9';


