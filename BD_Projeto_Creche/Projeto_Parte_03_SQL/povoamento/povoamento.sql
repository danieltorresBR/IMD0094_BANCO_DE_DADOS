use bdcreche;

DELETE FROM aluno WHERE true;
INSERT INTO aluno VALUES ('MAT001', 'M' , NULL, '2020-05-22' , NULL, NULL, 'JOAO');
INSERT INTO aluno VALUES ('MAT002', 'T' , NULL, '2021-01-01' , NULL, NULL, 'MARIA');
INSERT INTO aluno VALUES ('MAT003', 'M' , NULL, '2019-06-19' , NULL, NULL, 'JOSE');
INSERT INTO aluno VALUES ('MAT004', 'T' , NULL, '2020-05-15' , NULL, NULL, 'DANIEL');
INSERT INTO aluno VALUES ('MAT005', 'M' , NULL, '2021-05-15' , NULL, NULL, 'ISABELLA');

DELETE FROM aluno_alergias WHERE true;
INSERT INTO aluno_alergias VALUES (NULL, 'MAT001');
INSERT INTO aluno_alergias VALUES (NULL, 'MAT002');
INSERT INTO aluno_alergias VALUES (NULL, 'MAT003');
INSERT INTO aluno_alergias VALUES (NULL, 'MAT004');
INSERT INTO aluno_alergias VALUES (NULL, 'MAT005');

DELETE FROM pessoa WHERE true;
INSERT INTO pessoa VALUES ('DANIEL TORRES', '00100200334');
INSERT INTO pessoa VALUES ('DANIEL CABRAL', '00988765423');
INSERT INTO pessoa VALUES ('MILIENE BARBOSA', '98745634311');
INSERT INTO pessoa VALUES ('NEYMAR JR', '87623465412');
INSERT INTO pessoa VALUES ('BRUNA SOUZA', '98787634512');
INSERT INTO pessoa VALUES ('CASSIA SILVA', '98734576590');
INSERT INTO pessoa VALUES ('BRUNO DANTAS', '11122299900');
INSERT INTO pessoa VALUES ('LILIANE', '34565412333');
INSERT INTO pessoa VALUES ('GREGORIO', '99988855534');

DELETE FROM pessoa_autorizada WHERE true;
INSERT INTO pessoa_autorizada VALUES ('TIO', '87623465412');
INSERT INTO pessoa_autorizada VALUES ('IRMAO', '11122299900');
INSERT INTO pessoa_autorizada VALUES ('AVO', '99988855534');
INSERT INTO pessoa_autorizada VALUES ('PAI', '00100200334');
INSERT INTO pessoa_autorizada VALUES ('MAE', '98745634311');

DELETE FROM pessoa_autorizada_has_aluno WHERE true;
INSERT INTO pessoa_autorizada_has_aluno VALUES ('87623465412', 'MAT001');
INSERT INTO pessoa_autorizada_has_aluno VALUES ('11122299900', 'MAT001');
INSERT INTO pessoa_autorizada_has_aluno VALUES ('99988855534', 'MAT001');
INSERT INTO pessoa_autorizada_has_aluno VALUES ('00100200334', 'MAT003');
INSERT INTO pessoa_autorizada_has_aluno VALUES ('98745634311', 'MAT005');

DELETE FROM responsavel WHERE true;
INSERT INTO responsavel VALUES ('danielteodolino@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '00100200334');
INSERT INTO responsavel VALUES ('milienebarbosa@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '98745634311');
INSERT INTO responsavel VALUES ('brunodantas@bol.com', NULL, NULL, NULL, NULL, NULL, NULL, '98787634512');
INSERT INTO responsavel VALUES ('cassiasilva@altavista.com', NULL, NULL, NULL, NULL, NULL, NULL, '98734576590');

DELETE FROM professor WHERE true;
INSERT INTO professor VALUES ('00988765423');
INSERT INTO professor VALUES ('34565412333');

DELETE FROM telefone_responsavel WHERE true;
INSERT INTO telefone_responsavel VALUES  ('(84)98877-6655', 'danielteodolino@gmail.com');
INSERT INTO telefone_responsavel VALUES ('(85)98888-4478', 'brunodantas@bol.com');
INSERT INTO telefone_responsavel VALUES  ('(84)99944-6750', 'milienebarbosa@gmail.com');
INSERT INTO telefone_responsavel VALUES ('(84)98786-5534', 'cassiasilva@altavista.com');

DELETE FROM folha_diaria WHERE true;
INSERT INTO folha_diaria VALUES  ('2021-11-27', '101112', '170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '00988765423', 'danielteodolino@gmail.com', '00100200334');
INSERT INTO folha_diaria VALUES  ('2021-11-27', '101112', '170000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '34565412333', 'brunodantas@bol.com', '98787634512');
INSERT INTO folha_diaria VALUES  ('2021-11-28', '070010', '151000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '34565412333', 'brunodantas@bol.com', '98787634512');

DELETE FROM folha_diaria_atividade_realizada WHERE true;
INSERT INTO folha_diaria_atividade_realizada VALUES  ('piscina de bolinhas', '2021-11-27');
INSERT INTO folha_diaria_atividade_realizada VALUES  ('pintura', '2021-11-28');

DELETE FROM folha_diaria_itens_reposicao WHERE true;
INSERT INTO folha_diaria_itens_reposicao VALUES  ('sabonete', '2021-11-27');
INSERT INTO folha_diaria_itens_reposicao VALUES  ('fraldas', '2021-11-28');
