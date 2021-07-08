select aluno.Nome_Aluno from aluno join responsavel_has_aluno on aluno.Matricula = responsavel_has_aluno.Aluno_Matricula;

SELECT aluno.Nome_Aluno as 'NOME ALUNO', pessoa.Nome as 'NOME PROFESSOR', aluno.Periodo as 'TURNO ALUNO'
FROM bdcreche.aluno, bdcreche.folha_diaria, bdcreche.pessoa
WHERE aluno.Periodo = 'M' and folha_diaria.Professor_Pessoa_CPF = '00988765423' and pessoa.Nome = 'Daniel Cabral';