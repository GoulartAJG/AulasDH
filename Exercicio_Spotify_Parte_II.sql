-- PARTE 1
-- Carlos Junior, Igor Henrique, Matheus Rayol

-- Item 2 - Liste as músicas que possuem a letra "z" no título.
SELECT * FROM `projeto_spotify`.`cancao` WHERE `titulo` LIKE '%Z%';


-- Item 3 - Liste as músicas que têm a letra "a" como segundo caractere e a letra "s" como último caractere.
SELECT * FROM `projeto_spotify`.`cancao` WHERE `titulo` LIKE '_a%s';


-- Item 4 Mostre a lista de reprodução que contém mais músicas, renomeando as colunas, colocando em maiúscula a primeira letra, os acentos correspondentes e adicionando os espaços entre as palavras.
SELECT idPlaylist AS 'ID Playlist', 
	   idusuario AS 'ID Usuário',
       titulo AS 'Título', 
       qtdcancoes AS 'Quantidade de canções',
       idestado AS 'ID Estado',
       Datacriacao AS 'Data de criação',
       Dataexclusao AS 'Data de exclusão'
FROM `projeto_spotify`.`playlist` 
ORDER BY qtdcancoes DESC LIMIT 1;


-- Item 5 Em outro momento, obtenha uma lista com os 5 usuários mais jovens, a partir dos próximos 10 registros.
SELECT * FROM `projeto_spotify`.`usuario` ORDER BY Data_nac DESC LIMIT 5 OFFSET 10;


-- Item 6 Liste as 5 músicas com mais reproduções, em ordem decrescente.
SELECT * FROM `projeto_spotify`.`cancao` ORDER BY qtdreproducao DESC LIMIT 5;


-- Item 7 Gere um relatório de todos os álbuns em ordem alfabética.
-- Opção 1 - Gerando relatorio com todos os itens da tabela
SELECT * FROM `projeto_spotify`.`album` ORDER BY titulo ASC;
-- Opção 2 - Gerando relatório apenas com o titulo dos albuns
SELECT titulo FROM `projeto_spotify`.`album` ORDER BY titulo ASC;


-- Item 8 Liste todos os álbuns que não possuem imagem, organizados em ordem alfabética.
SELECT * FROM `projeto_spotify`.`album` WHERE imagemcapa IS NULL ORDER BY titulo ASC;


-- Item 9 Insira um novo usuário com os seguintes dados (leve em consideração os relacionamentos):
-- nomeusuario: novousuariodespotify@gmail.com
-- Nome e sobrenome: Elmer Santos 
-- password: S4321m
-- Data de nacimiento: 15/11/1991
-- Sexo: Masculino
-- Código Postal: B4129ATF
-- País: Brasil
INSERT INTO usuario VALUES ('1', 'novousuariodespotify@gmail.com', 'Elmer Santos', '1991-11-15', 'M', 'B4129ATF', 'S4321m', '9', '1');


-- Item 10 Exclua todas as músicas do gênero "pop".
-- Descobrindo a ID do Genero Pop
SELECT * FROM genero WHERE Genero = 'Pop';
-- Excluindo as músicas do genero Pop
DELETE FROM generoxcancao WHERE IdGenero = '9';


-- Item 11 Edite todos os artistas que não possuem uma imagem carregada e carregue para eles o texto "Imagem em falta" na coluna de imagens.
UPDATE `projeto_spotify`.`artista`
SET imagem = 'Imagem em falta'
WHERE imagem IS NULL;
