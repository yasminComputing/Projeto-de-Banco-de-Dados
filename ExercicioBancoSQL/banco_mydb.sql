show databases;
use mydb;
show tables;


-- atribuindo valores para tabela atleta

insert atleta values (1,"Pedro");
insert atleta values (2,"Maria");
insert atleta values (3,"Yasmin");
insert atleta values (4,"Rafael");
insert atleta values (5,"Daniel");

select *
from atleta;

-- atribuindo valores para tabela modalidade
insert modalidade values (500,"Beach Tennis");
insert modalidade values(501,"Padel");
insert modalidade values(502,"Volei de Areia");

select *
from modalidade;

-- atribuindo valores para tabela clube
insert clube values(100,"Star Padel");
insert clube values (101,"Fair Play");
insert clube values (102,"Elite");
insert clube values (103,"8000 Sports");
insert clube values (104,"Pier Beach Tennis");
-- inseri o nome errado : correcao
-- UPDATE clube 
-- SET nome = REPLACE(nome, '800', '8000') 
-- WHERE idClube = 103; 

select *
from clube;

-- atribuindo valores para tabela TREINADOR
insert treinador values (1000,"Lucas",100);
insert treinador values (1001,"Pato",102);
insert treinador values (1002,"Jader",103);
insert treinador values (1003,"Enrico",104);

select *
from treinador;

-- atribuindo valores para tabela MODALIDADETREINADOR
insert modalidadetreinador values(500,1002);
insert modalidadetreinador values (500,1003);
insert modalidadetreinador values(501,1000);
insert modalidadetreinador values(501,1001);

select *
from modalidadetreinador;

-- atribuindo valores para tabela atletamodalidade
insert atletamodalidade values(1,500);
insert atletamodalidade values(1,501);
insert atletamodalidade values(2,500);
insert atletamodalidade values(3,502);
insert atletamodalidade values(4,502);

select *
from atletamodalidade;

-- atribuindo valores para tabela modalidadeclube
insert modalidadeclube values(500,100);
insert modalidadeclube values(500,101);
insert modalidadeclube values(500,103);
insert modalidadeclube values(500,104);
insert modalidadeclube values(501,100);
insert modalidadeclube values(501,101);
insert modalidadeclube values(501,102);

select *
from modalidadeclube;

-- quais os atletas que não praticam nenhuma modalidade?
select atleta.idAtleta, atleta.nome
from atleta
where atleta.idAtleta  not in (select atletamodalidade.atleta from atletamodalidade);

-- qual o clube que está sem treinador?
select clube.idClube, clube.nome
from clube
where clube.idClube not in (select treinador.clube from treinador);


-- quais as modalidades que a Maria pratica?
select modalidade.idModalidade,modalidade.descricao
from modalidade
where modalidade.idModalidade in (
	select atletamodalidade.modalidade
	from atletamodalidade 
	where atletamodalidade.atleta = (
    select atleta.idAtleta
    from atleta
    where atleta.nome = "Maria"
    )
 );

-- Mostre todos os atletas (nomes) e suas modalidaes praticadas
SELECT atleta.nome, modalidade.descricao
from atleta, modalidade,atletamodalidade
where atleta.idAtleta = atletamodalidade.atleta and modalidade.idModalidade = atletamodalidade.modalidade;


