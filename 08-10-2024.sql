#create database prova;
use prova;

create table if not exists autores (
	ID_autor int primary key,
    nome varchar(50) not null,
    nacionalidade varchar(30) not null
);

create table if not exists editoras (
	id_editora int primary key,
    nome_editora varchar(30) not null,
    local_editora varchar(30) not null
);

create table if not exists clientes (
	cpf_cliente varchar(15) primary key,
    nome_cliente varchar(50) not null
);

create table if not exists livros (
	isbn_livro varchar(15) primary key,
    titulo_livro varchar(50) not null,
    ano_livro year not null,
    editora_livro int not null,
    constraint fk_editora
    foreign key (editora_livro) references
    editoras(id_editora)
);

create table if not exists emprestimos (
	id_emprestimo int primary key,
    data_emprestimo date not null,
    data_devolução date not null,
    cliente_emprestimo varchar(15) not null,
    constraint fk_cliente_empr foreign key (cliente_emprestimo)
    references clientes(cpf_cliente)
);

create table if not exists livros_emprestimos (
	emprestimo int,
    livro varchar(15),
    primary key (emprestimo, livro),
    constraint fk_empr_livro foreign key (emprestimo)
    references emprestimos(id_emprestimo),
    constraint fk_livro foreign key (livro)
    references livros(isbn_livro)
);




