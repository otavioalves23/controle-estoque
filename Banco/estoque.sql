/**
* Projeto de um sistema para gestão de estoque
* @author Otavio Alves
* @version 1.0
*/

create database dbestoque;
use dbestoque;

create table usuarios (
	id int primary key auto_increment,
    usuario varchar(50) not null,
    login varchar(20) not null,
    senha varchar(250) not null
    );
    
    describe usuarios;
    
    /************** CRUD **************/
    
    -- CREATE (inserir 5 usuários)
    
    insert into usuarios (usuario, login, senha)
    values ('Matheus','matheus','123@matheus');
    
        insert into usuarios (usuario, login, senha)
    values ('Pedro','pedro','123@pedro');
    
        insert into usuarios (usuario, login, senha)
    values ('Lucas','lucas','123@lucas');
    
        insert into usuarios (usuario, login, senha)
    values ('Guilherme','guilherme','123@guilherme');
    
        insert into usuarios (usuario, login, senha)
    values ('Otavio','otavio','123@otavio');
    
    -- READ1 (selecionar todos os usuários)
    
    select * from usuarios;
    
    -- READ2 (selecionar um usuário específico por id)
    
    select * from usuarios where id = 1;
    
    -- UPDATE (alterar todos os dados de um  usuário específico)
    
    update usuarios set usuario = '', login = '', senha = '' where id = 1 ;
    
    -- DELETE (excluir um usuário específico)
    
    delete from usuarios where id = 1;
    
    -- Gerar a documentação - Modelo ER (engenharia reversa) 