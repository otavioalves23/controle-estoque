/**
* Projeto de um sistema para gestão de estoque
* @author Otavio Alves
* @version 1.3
*/

create database dbestoque;

use dbestoque;

create table usuarios (
	id int primary key auto_increment,
    usuario varchar(50) not null,
    login varchar(20) not null,
    senha varchar(250) not null,
    perfil varchar(50) not null
    );

    describe usuarios;
    
    /************** CRUD **************/
    
    -- CREATE (inserir 5 usuários)
    
    insert into usuarios (usuario, login, senha, perfil)
    values ('Matheus','matheus',md5('123@matheus'), 'user');
    
    insert into usuarios (usuario, login, senha, perfil)
    values ('Pedro','pedro',md5('123@pedro'), 'user');
    
    insert into usuarios (usuario, login, senha, perfil)
    values ('Lucas','lucas',md5('123@lucas'), 'user');
    
    insert into usuarios (usuario, login, senha, perfil)
    values ('Guilherme','guilherme',md5('123@guilherme'), 'user');
    
    insert into usuarios (usuario, login, senha, perfil)
    values ('Otavio','otavio',md5('123@otavio'), 'admin');
    
    -- READ1 (selecionar todos os usuários)
    
    select * from usuarios;
    
    -- READ2 (selecionar um usuário específico por id)
    
    select * from usuarios where id = 1;
    
    -- UPDATE (alterar todos os dados de um  usuário específico)
    
    update usuarios set usuario = '', login = '', senha = '' where id = 1 ;
    
    -- DELETE (excluir um usuário específico)
    
    delete from usuarios where id = 1;
    
    -- Gerar a documentação - Modelo ER (engenharia reversa) 
    
    -- CRUD Read
    select * from usuarios;
    select * from usuarios where login = 'admin';
    
    -- CRUD Update
    update usuarios set usuario = 'Otavio Alves', login = 'otha', senha = md5('123@senac'), perfil = 'admin' where id = 1; 
    
    create table fornecedores (
    idFor int primary key auto_increment,
    razaoSocial varchar(50) not null,
    fantasia varchar(50) not null,
    cnpj varchar(20) unique,
    ie varchar(20) unique,
    cep varchar(10) not null,
    endereco varchar(50) not null,
    numero varchar(60) not null,
    complemento varchar(20),
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    uf char(2) not null, 
    nomeContato varchar(30) not null,
    fone varchar(15) not null,
    whatsapp varchar(15),
    email varchar(50) not null,
    site varchar(50),
    obs varchar(250)
    
    );
    
    describe fornecedores;
    
     insert into fornecedores (razaoSocial, fantasia, cnpj, ie, cep, endereco, numero, complemento, bairro,
     cidade, uf, nomeContato, fone, whatsapp, email, site, obs)
     values ('NaoSei','Batman','10.100.100/0001-10','NaoSei','08100-100','Rua Nao Sei','10','NaoSei','Vila Senac','São Senac','SP','NaoSei','1010-1010','91010-1010','naosei@gmail.com','www.naosei.com','Nao sei');
     
          insert into fornecedores (razaoSocial, fantasia, cnpj, ie, cep, endereco, numero, complemento, bairro,
     cidade, uf, nomeContato, fone, whatsapp, email, site, obs)
     values ('NaoSei','Superman','11.111.111/0001-11','NaoNao','08100-111','Rua Nao Sei','11','NaoSei','Vila Senac','São Senac','SP','NaoSei','1110-1110','91110-1110','sei@gmail.com','www.sei.com','Sei');
     
          insert into fornecedores (razaoSocial, fantasia, cnpj, ie, cep, endereco, numero, complemento, bairro,
     cidade, uf, nomeContato, fone, whatsapp, email, site, obs)
     values ('NaoSei','LanternaVerde','12.122.122/0001-12','NaoSeiSei','08133-133','Rua Nao Sei','12','NaoSei','Vila Senac','São Senac','SP','NaoSei','1210-1210','91210-1210','naoseisei@gmail.com','www.sei.com','É isso aí');
     
     
     
     select * from fornecedores;
     
     delete from fornecedores where idFor = 3;
     
     
     -- pesquisa avançada filtrando letras
     select idFor as ID, fantasia as Fornecedor, fone, nomecontato as contato from fornecedores where fantasia like ('B%');
     
     
     
     
     
     
     
     
     
     
     
-- Tabela de Clientes
create table clientes (
idCli int primary key auto_increment,
nomeCliente varchar(60) not null,
cnpjCpf varchar(20) unique,
ieRG varchar(20) not null,
cep varchar(10) not null,
endereco varchar(50) not null,
numero varchar(6) not null,
complemento varchar(20),
bairro varchar(50) not null,
cidade varchar(50) not null,
uf char(2) not null,
fone1 varchar(15) not null,
fone2 varchar(15),
email varchar(50) not null,
nascimento varchar(11) not null,
atividadeProfissao varchar(50) not null
);

-- CREATE
-- insert into clientes (nomeCliente, cnpjCpf, ieRg, cep, endereco, numero, complemento, bairro, cidade, uf, fone1, fone2, email, nascimento, atividadeProfissao) values ();

insert into clientes (nomeCliente, cnpjCpf, ieRg, cep, endereco, numero, complemento, bairro, cidade, uf, fone1, fone2, email, nascimento, atividadeProfissao) values ('Lucas Marcelino', '87249594800', '262533844', '17523300', 'Rua Hermano José da Silva', '238', '', 'Jardim Nacional', 'Marília', 'SP', '1435446618', '14984626029', 'isabella_alves@depotit.com.br', '18/09/1982', 'Esteticista');

insert into clientes (nomeCliente, cnpjCpf, ieRg, cep, endereco, numero, complemento, bairro, cidade, uf, fone1, fone2, email, nascimento, atividadeProfissao) values ('Otavio Alves', '25543526822', '367447678', '04821300','Rua João Francisco de Abreu', '619', '', 'Jardim Colonial', 'São Paulo', 'SP', '1137392769', '11983812484', 'kaique_darosa@ppe.ufrj.br', '01/01/1982', 'Engenheiro');

insert into clientes (nomeCliente, cnpjCpf, ieRg, cep, endereco, numero, complemento, bairro, cidade, uf, fone1, fone2, email, nascimento, atividadeProfissao) values ('Pedro Henrique', '54015398866', '158530378', '08472780', 'Travessa Barão Ferraz de Uruguaiana', '353', '', 'Conjunto Habitacional Inácio Monteiro', 'São Paulo', 'SP', '1128218735', '11981574691', 'tomas.benicio.daluz@multieventos.art.br', '27/03/1982', 'Marceneiro');

insert into clientes (nomeCliente, cnpjCpf, ieRg, cep, endereco, numero, complemento, bairro, cidade, uf, fone1, fone2, email, nascimento, atividadeProfissao) values ('Matheus Apolinario', '95668753808', '459645444', '13457078', 'Rua Adolphino Camargo', '234', '', 'Jardim Santa Rita de Cássia', 'Santa Bárbara D´Oeste', 'SP', '1935215349', '19998524581', 'mateuszin@rabelloadvogados.com.br', '26/03/1982', 'Advogado');

insert into clientes (nomeCliente, cnpjCpf, ieRg, cep, endereco, numero, complemento, bairro, cidade, uf, fone1, fone2, email, nascimento, atividadeProfissao) values ('Leticia Cardozo', '93374329861', '206189990', '12235501', 'Rua Nova Guine', '467', '', 'Jardim América', 'São José dos Campos', 'SP', '1225631809', '12984967928', 'benjaminmanoelsouza@baltico.com.br', '04/07/1982', 'Padeiro');
     
     drop table clientes;
     
     
     
     
     
/*
Relacionamento de tabelas 1 - N (um para muitos)
Chave estrangeira (FK) - (PK)
idFor (chave estrangeira) usar mesmo nome e tipos de dados da chave primaria (PK) da tabela pai 
*/


-- timestamp default current_timestamp (obtém automaticamente a data e hora)
-- date (tipo de dados relacionados a data)
-- decimal (10,2) (tipo de dados relacionados a números não inteiros)
-- decimal (10,2) (10 digítos com 2 casas decimais)

create table produtos (
	codigo int primary key auto_increment,
    barcode varchar(255) unique,
    produto varchar(50) not null,
    descricao varchar(255),
    fabricante varchar(50) not null,
    datacad timestamp default current_timestamp,
    dataval date,
    estoque int not null,
    estoquemin int not null,
    unidade char(2) not null,
    localizacao varchar(50),
    custo decimal(10,2) not null,
    lucro decimal(10,2), 
    idFor int not null,
    foreign key(idFor) references fornecedores(idFor)
    );
    
    describe produtos;
    
    insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,idFor)
    values ('11111111','Caneta BIC azul','Caneta BIC cor azul, ponta fina CX 50','BIC',20231122,20,5,'CX','Prateleira 2',38.50,20,1);
    
        insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,idFor)
    values ('33333333','Caneta BIC vermelha','Caneta BIC cor vermelho, ponta fina CX 25','BIC',20231122,3,5,'CX','Prateleira 3',18,20,1);
    
            insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,idFor)
    values ('44444444','Cola bastão','Cola bastão pritt','Pritt',20221002,10,2,'UN','Prateleira 3',1.25,50,3);
    
            insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,idFor)
    values ('55555555','Mouse logitech','Mouse usb logitech 2 botões','Logitech',20271122,10,15,'UN','Prateleira 4',18,30,3);
    
            insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,idFor)
    values ('66666666','Régua 30cm','Régua de acrílico 30 cm','Faber Castel',20251122,30,5,'UN','Prateleira 5',2.50,25,1);
    
                insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,idFor)
    values ('7896572022785','Caneta Faber Castel azul','Caneta Faber Castel azul, embalagem com duas unidades','Faber Castel',20291122,50,10,'PC','Prateleira 5',4.50,50,1);
    
    delete from produtos where codigo = 1;
    
    select * from produtos;
    
    select * from produtos where codigo = 2;
    
    /*
    Relatório (select especial)
    */
    
    -- relatório 1 (unificar produtos com fornecedores)
    -- produtos.idFor (FK) fornecedores.idFor (PK)
    select * from produtos inner join fornecedores
    on produtos.idFor = fornecedores.idFor;

   -- relatório 2 (fornecedor relacionado ao produto)
   select 
   produtos.codigo as Código, produtos.produto,
   fornecedores.fantasia as Fornecedor
   from produtos
   inner join fornecedores on produtos.idFor = fornecedores.idFor;
   
   -- relatório 2.1 (fornecedor relacionado ao produto)
select 
   produtos.codigo, produtos.produto,
   fornecedores.fantasia
   from produtos
   inner join fornecedores on produtos.idFor = fornecedores.idFor;
   
   -- relatórios 3 (inventário de estoque)
   select sum(estoque * custo) from produtos;
   
   -- relatório 4 (calcular o preço de venda)
   select codigo as código,produto,custo,
   (custo  + (custo * lucro)/100) as venda
   from produtos;
   
   -- relatório 4.1 (calcular o preço de venda)
    select codigo,produto,custo,
   (custo  + (custo * lucro)/100)
   from produtos;
   
   -- relatório 5 (reposição de estoque)
   -- %d/%m/%Y (dd/mm/aaaa) %d/%m/%y (dd/mm/aa)
   select codigo as código,produto,
   date_format(dataval,'%d/%m/%Y') as data_validade,
   estoque, estoquemin as estoque_mínimo
   from produtos where estoque < estoquemin;
   
   -- relatório 5.1 (versão de impressão)
   select codigo, produto,
   date_format(dataval,'%d/%m/%Y'),
   estoque, estoquemin
   from produtos where estoque < estoquemin;
   
   -- relatório 6 (produtos vencidos)
   select codigo as código, produto, localizacao as localização,
   date_format(dataval,'%d/%m/%Y') as data_validade,
   datediff(dataval,curdate()) as dias_vencidos
   from produtos where datediff(dataval,curdate()) < 0;
   
   -- relatório 6.1 (produtos vencidos)
   select codigo, produto, localizacao, date_format(dataval,'%d/%m/%Y'), datediff(dataval,curdate()) from produtos where datediff(dataval,curdate()) < 0;
     
    delete from produtos where codigo = 4; 
    
select produto, localizacao from produtos;
    
    
    
     
     
     
     