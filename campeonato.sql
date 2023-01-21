-- Criação de banco
create database campeonato;

create schema campeonato;

-- Tabela Estados e seus valores: 
create table campeonato.estados (
	idestado INTEGER,
	nome varchar(60) not null,
	uf char(2) not null,
	primary key (idestado)
);

insert into campeonato.estados (idestado, nome, uf)
values
(10001, 'Bahia', 'BA'),
(10002, 'Ceará', 'CE'),
(10003, 'Pernambuco', 'PE'),
(10004, 'Rio Grande do Norte', 'RN');

select * from campeonato.estados;

-- Tabela Cidades e seus valores:
create table campeonato.cidades (
	idcidade INTEGER,
	nome varchar(60) not null,
	idestado INTEGER,
	primary key (idcidade),
	foreign key (idestado) references campeonato.estados (idestado)
);

insert into campeonato.cidades (idcidade, nome, idestado)
values
(101, 'Salvador', 10001),
(102, 'Fortaleza', 10002),
(103, 'Recife', 10003),
(104, 'Natal', 10004);

select * from campeonato.cidades;

-- Tabela Times e seus valores:
create table campeonato.times (
	idtime INTEGER,
	nome varchar(60) not null,
	idcidade INTEGER,
	primary key (idtime),
	foreign key (idcidade) references campeonato.cidades (idcidade)
);

insert into campeonato.times(idtime, nome, idcidade)
values
(1001, 'Bahia', 101),
(1002, 'Fortaleza', 102),
(1003, 'Sport', 103),
(1004, 'ABC', 104),
(1005, 'Vitória', 101),
(1006, 'Ceará', 102),
(1007, 'Santa Cruz', 103),
(1008, 'América', 104);

select * from campeonato.times;


-- Tabela Jogadores e seus valores:
create table campeonato.jogadores (
	idjogador serial,
	nome varchar(60) not null,
	idade INTEGER,
	idtime INTEGER,
	primary key (idjogador),
	foreign key (idtime) references campeonato.times (idtime)
);

insert into campeonato.jogadores (nome, idade, idtime)
values
('Marcos Felipe', 26, 1001),
('Douglas Borel', 20, 1001),
('Kanu', 25, 1001),
('Raul Gustavo', 23, 1001),
('Matheus Bahia', 23, 1001),
('Júlio César de Rezende', 28, 1001),
('Lucas Mugni',	31,	1001),
('Daniel Sampaio', 27, 1001),
('Vítor Jacaré', 23, 1001),
('Gabriel Teixeira', 21, 1001),
('Ricardo Goulart',	31,	1001),
('Fernando Miguel',	37,	1002),
('Tinga', 29, 1002),
('Marcelo Benevenuto', 27, 1002),
('Dani Ceballos', 26, 1002),
('Yago Pikachu', 30, 1002),
('Hércules', 22, 1002),
('Caio Alexandre', 23, 1002),
('Lucas Crispim', 28, 1002),
('Romarinho', 28, 1002),
('Moisés', 26, 1002),
('Silvio Romero', 34, 1002),
('Renan', 33, 1003),
('Denis', 35, 1003),
('Denival',	22,	1003),
('Sabino', 26,	1003),
('Rafael Thyere', 29, 1003),
('Chico', 24, 1003),
('Renzo', 21, 1003),
('Igor Cariús',	29,	1003),
('Ewerthon', 22, 1003),
('Eduardo',	36,	1003),
('Ronaldo',	28,	1003),
('Matheus Nogueira', 25, 1004),
('Alemão', 32, 1004),
('Richardson', 30, 1004),
('Afonso', 29, 1004),
('Erick Varão',	26,	1004),
('Raphael Luz',	33,	1004),
('Fábio Lima',	24,	1004),
('Matheus Anjos', 32, 1004),
('Felipe Garcia', 26, 1004),
('Maycon Douglas', 30,	1004),
('Bruno Lima', 28, 1004),
('Dalton Alan', 36, 1005),
('Railan Reis', 22, 1005),
('Cleidson  Camutanga', 29, 1005),
('Marco Antônio', 21, 1005),
('João Lucas', 31, 1005),
('Joao Pedro', 23,  1005),
('Rodrigo Andrade', 25, 1005),
('Diego Torres', 32, 1005),
('Geirton  Gege', 28, 1005),
('Osvaldo ', 35, 1005),
('Trellez', 33, 1005),
('Cristian ', 20, 1006),
('Tiago Pagnussat', 32, 1006),
('Luiz Otávio', 34, 1006),
('Michel Macedo', 32, 1006),
('Willian Formiga', 27, 1006),
('Arthur Rezende', 28, 1006),
('Richardson', 31 , 1006),
('Jean Carlos', 30, 1006),
('Vina', 31, 1006),
('Luvannor', 32, 1006),
('Leandro Carvalho', 27, 1006),
('Jefferson', 36, 1007),
('Wescley', 31, 1007),
('Luan Bueno', 35, 1007),
('Alemão', 36, 1007),
('Dudu Mandai', 29, 1007),
('Elyeser', 32, 1007),
('Rodrigo Yuri', 27, 1007),
('Daniel Pereira', 33, 1007),
('Matheuzinho', 27, 1007),
('Fabrício', 21, 1007),
('Raphael Macena', 33, 1007),
('Bruno Pianissolla', 35, 1008),
('Jean Pierre', 29, 1008),
('Edson Silva', 36, 1008),
('Norberto', 32, 1008),
('Rafael Carioca', 30, 1008),
('Nikollas', 21, 1008),
('Juninho', 23, 1008),
('Beto', 21, 1008),
('Wermeson', 21, 1008),
('Frank', 28, 1008),
('Italo Carvalho', 26, 1008);

select * from campeonato.jogadores;

-- Tabela Jogos e seus valores:
create table campeonato.jogos (
	idjogo INTEGER,
	idtime1 INTEGER not null,
	idtime2 INTEGER not null,
	data_2 TIMESTAMP,
	golstime1 INTEGER not null,
	golstime2 INTEGER not null,
	vencedor INTEGER,
	primary key (idjogo),
	foreign key (idtime1) references campeonato.times (idtime),
	foreign key (idtime2) references campeonato.times (idtime)
);

insert into campeonato.jogos (idjogo, idtime1, idtime2, data_2, golstime1, golstime2, vencedor)
values 
(201, 1002, 1004, '2022-11-12 20:00:35', 1, 2, 1004),
(202, 1001, 1003, '2022-11-19 20:01:43', 3, 2, 1001),
(203, 1001, 1004, '2022-11-26 20:03:18', 1,0, 1001),
(204, 1005, 1008, '2022-11-12 16:05:20', 1,0, 1005),
(205, 1007, 1006, '2022-11-19 16:05:00', 4, 0, 1007),
(206, 1005, 1007, '2022-11-26 16:07:02', 2, 1, 1005),
(207, 1005, 1001, '2022-12-03 20:03:18', 0, 1, 1001);

select * from campeonato.jogos;


--------------------------Perguntas---------------------------------------

-- 1) Quantos jogos cada time jogou?
SELECT nome, COUNT(*) as jogos
FROM times
JOIN jogos ON idtime = idtime1 OR idtime = idtime2
group by idtime
order by jogos desc;


-- 2) Qual time mais venceu partidas?
select count(j.vencedor) as vitorias, t.nome as time_vencedor
from campeonato.jogos j
join campeonato.times t 
on t.idtime = j.vencedor
group by time_vencedor
order by vitorias desc limit 1;


-- 3) Quais times estão na lanterna?
SELECT nome, COUNT(*) as jogos
FROM times
JOIN jogos ON idtime = idtime1 OR idtime = idtime2
group by idtime
order by jogos asc limit 3;


-- 4) Média de idade de jogadores por time.
select t.nome, avg(jg.idade) as media_idade
from campeonato.jogadores jg
join campeonato.times t
on jg.idtime = t.idtime
group by t.nome;


-- 5) Quantidade de gols marcados no campeonato.
SELECT sum(golstime1 + golstime2) as total_gols
from campeonato.jogos;


-- 6) Listar, em ordem alfabética, os jogadores com mais de 30 anos e que jogam em times da cidade 'Fortaleza'. (102)
select jg.nome, jg.idade 
from jogadores jg
join times t on t.idtime = jg.idtime
join cidades c on t.idcidade = c.idcidade
where jg.idade > 30 and c.idcidade = 102
order by jg.nome; 
