--EMPREGADO(cod_empregado, nome_empregado, rua, cidade, salario)
--TRABALHA(cod_empregado, cod_companhia)
--COMPANHIA(cod_companhia, CNPJ, nome_companhia, cidade_companhia)
--GERENTE(cod_empregado, cod_companhia)
--Para cada uma das seguintes consultas dê a expressão em álgebra relacional:
--1) Encontre os nomes de todos os empregados que trabalham para a Companhia Soft Sell.
--2) Encontre todos os nomes das cidades dos empregados que trabalham na Soft Sell.
--3) Encontre os nomes, endereço e cidade da residência de todos os empregados da Soft Sell que ganham mais de dez  mil reais.
--4) Encontre os nomes de todos os empregados, no banco de dados, que moram na mesma cidade da companhia em que trabalham.
--5) Encontre os nomes de todos os empregados que moram na mesma cidade e rua de seu gerente.
--6) Encontre os nomes de todos os empregados, no banco de dados, que não trabalham para a Soft Sell.
--7) Crie um script de criação SQL DDL para criar o esquema relacional e insira alguns linhas nas tabelas.
8) Após escrever as consultas em Álgebra Relacional, reescreva em SQL DML e execute no PostgreSQL.
Envie um arquivo pdf com as respostas das questões de 1 a 6. Para as questões 7 e 8, faça scripts .sql, coloque no seu github e mande o link no pdf de resposta.

 
select e.nome_empregado
from empregado e
inner join trabalha t on t.cod_empregado = e.codigo_empregado
inner join companhia c on c.cod_companhia = t.cod_companhia
where companhia.nome_companhia = 'Soft Sell'


select e.cidade
from empregado e
inner join trabalha t on t.cod_empregado = e.codigo_empregado
inner join companhia c on c.cod_companhia = t.cod_companhia
where companhia.nome_companhia = 'Soft Sell'

select e.nome, e.cidade, e.rua
from empregado e
inner join trabalha t on t.cod_empregado = e.codigo_empregado
inner join companhia c on c.cod_companhia = t.cod_companhia
where companhia.nome_companhia = 'Soft Sell' and empregado.salario > 10000

select e.nome_empregado
from empregado e
inner join trabalha t on t.cod_empregado = e.codigo_empregado
inner join companhia c on c.cod_companhia = t.cod_companhia
where e.cidade = c.cidade_companhia

select e.nome_empregado
from empregado e
inner join trabalha t on t.cod_empregado = e.codigo_empregado
inner join companhia c on c.cod_companhia = g.cod_companhia and t.cod_companhia = c.cod_companhia
inner join gerente g on g.cod_companhia = t.cod_companhia and g.cod_empregado = e.cod_empregado

select e.nome_empregado
from empregado e
inner join trabalha t on t.cod_empregado = e.codigo_empregado
inner join companhia c on c.cod_companhia = t.cod_companhia
where companhia.nome_companhia <> 'Soft Sell'



insert into EMPREGADO(cod_empregado, nome_empregado, rua, cidade, salario) values (1,'oi', 'rua', 'cidade', 10000)
insert into TRABALHA(cod_empregado, cod_companhia) values(1, 1)
insert into COMPANHIA(cod_companhia, CNPJ, nome_companhia, cidade_companhia) values (1,11111111,'nome_companhia','cidade_companhia')
insert into GERENTE(cod_empregado, cod_companhia) values (1,1)
