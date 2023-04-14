DROP DATABASE IF EXISTS bdtrabalhofinal;

CREATE DATABASE IF NOT EXISTS bdtrabalhofinal;

create table bdtrabalhofinal.Artista(
    id_Artista BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    Nome_Artista varchar(50) not null,
    Ouvintes varchar(40),
    Sobre text,
    Verificado boolean not null
);

select * from bdtrabalhofinal.Artista;

Insert into bdtrabalhofinal.Artista(Nome_Artista,Ouvintes,Sobre,Verificado) values ("Paramore","18.657.202 ouvintes mensais","Over the last few years Paramore’s influence and popularity has snowballed, as the age of streaming organically propelled them into a position as one of the world’s biggest, most culturally compelling rock bands. For the band, who formed as teenagers in Tennessee, their 20 year trajectory.",true);
Insert into bdtrabalhofinal.Artista(Nome_Artista,Ouvintes,Sobre,Verificado) values ("BLACKPINK","22.641.883 ouvintes mensais","BLACKPINK, which took over the hearts of listeners around the world with their mega-hit songs such as ‘DDU-DU DDU-DU’, ‘Kill This Love’ and ‘How You Like That’ has made a comeback after a year and 10 months. ",true);
Insert into bdtrabalhofinal.Artista(Nome_Artista,Ouvintes,Sobre,Verificado) values ("Eminem","66.697.594 ouvintes mensais","Eminem is one of the best-selling artists in music history, and easily one of rap's biggest crossover successes.",true);
Insert into bdtrabalhofinal.Artista(Nome_Artista,Ouvintes,Sobre,Verificado) values ("100 gecs","3.045.005 ouvintes mensais","100 gecs is a duo between Laura Les and Dylan Brady. Scavenging scraps of musical influences and welding them into dangerous machines, they destroy the competition with their army of lethal bangers.",true);
Insert into bdtrabalhofinal.Artista(Nome_Artista,Ouvintes,Sobre,Verificado) values ("Taylor Swift","85.357.483 ouvintes mensais","Taylor Swift is that rarest of pop phenomena: a superstar who managed to completely cross over from country to the mainstream.",true);
Insert into bdtrabalhofinal.Artista(Nome_Artista,Ouvintes,Sobre,Verificado) values ("Balela - Podcast","...","Dois eternos alunos da quinta série falando balela.",true);
Insert into bdtrabalhofinal.Artista(Nome_Artista,Ouvintes,Sobre,Verificado) values ("Podpah - Podcast","...","O podcast mais zika da internet.",true);
Insert into bdtrabalhofinal.Artista(Nome_Artista,Ouvintes,Sobre,Verificado) values ("As Observadoras - Podcast","...","Esse aqui é o podcast das Garotas Mágicas! Aqui a gente vai falar sobre vários temas com foco nos Games. Além de responder diversas perguntas sobre o quadro vindas de vocês nas lives!",true);

create table bdtrabalhofinal.Playlist(
    id_Playlist BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    Nome_Playlist varchar(50) not null,
    Descricao_Playlist text not null,
    Duracao_Playlist time not null
);

select * from bdtrabalhofinal.Playlist;
Insert into bdtrabalhofinal.Playlist(Nome_Playlist,Descricao_Playlist,Duracao_Playlist) values ("Tudo","As do momento",'00:00:00');

create table bdtrabalhofinal.Podcast(
    id_Podcast BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    Nome_Podcast varchar(50) not null,
    Nome_Apresentador varchar(70) not null,
    Duracao_Podcast time not null,
    Descricao_Podcast text not null,
    fk_id_Artista BIGINT(20),
    
    foreign key (fk_id_Artista) references bdtrabalhofinal.Artista(id_Artista)
);

select * from bdtrabalhofinal.Podcast;
Insert into bdtrabalhofinal.Podcast(Nome_Podcast,Nome_Apresentador,Duracao_Podcast,Descricao_Podcast,fk_id_Artista) values ("Balela","Calango e Zero",'00:16:18',"Pra onde você iria?",6);
Insert into bdtrabalhofinal.Podcast(Nome_Podcast,Nome_Apresentador,Duracao_Podcast,Descricao_Podcast,fk_id_Artista) values ("Podpah","Mítico e Igão",'02:11:00',"PIXOTE - Podpah #595",7);
Insert into bdtrabalhofinal.Podcast(Nome_Podcast,Nome_Apresentador,Duracao_Podcast,Descricao_Podcast,fk_id_Artista) values ("As Observadoras","Riyuuka, Nerissa e Lyslys",'00:50:11',"#7 - Milio e The Finals",8);

create table bdtrabalhofinal.Album(
    Id_Album BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    Duracao_Album time,
    Dt_Lancamento date,
    Nome_Album varchar(50),
    fk_id_Artista BIGINT(20),
    
    foreign key (fk_id_Artista) references bdtrabalhofinal.Artista(id_Artista)
);


/*
INNER JOIN PARA MOSTRAR O ÁLBUM JUNTAMENTE DO ARTISTA E DA MUSICA
*/

SELECT
    bdtrabalhofinal.musica.nome_musica as musica,
    bdtrabalhofinal.album.Nome_Album as album,
    bdtrabalhofinal.artista.NOme_Artista as artista
FROM
    bdtrabalhofinal.musica
INNER JOIN bdtrabalhofinal.Artista 
ON bdtrabalhofinal.Artista.id_Artista = bdtrabalhofinal.musica.fk_id_Artista
INNER JOIN bdtrabalhofinal.album
ON bdtrabalhofinal.Artista.id_Artista = bdtrabalhofinal.album.fk_id_Artista

/*
INNER JOIN PARA MOSTRAR O ÁLBUM JUNTAMENTE DO ARTISTA
*/
SELECT
    bdtrabalhofinal.Album.Nome_Album AS Album,
    bdtrabalhofinal.Artista.Nome_Artista AS Artista,
    bdtrabalhofinal.Album.Dt_Lancamento AS Lancamento,
    bdtrabalhofinal.Album.Duracao_Album AS Duracao
FROM
    bdtrabalhofinal.Album
INNER JOIN
  bdtrabalhofinal.Artista 
ON bdtrabalhofinal.Artista.id_Artista = bdtrabalhofinal.Album.fk_id_Artista;

select * from bdtrabalhofinal.Album;

Insert into bdtrabalhofinal.Album(Duracao_Album,Dt_Lancamento,Nome_Album,fk_id_Artista) values ('00:36:16','2023-02-10',"This Is Why",1);
Insert into bdtrabalhofinal.Album(Duracao_Album,Dt_Lancamento,Nome_Album,fk_id_Artista) values ('00:24:34','2022-09-16',"Born Pink",2);
Insert into bdtrabalhofinal.Album(Duracao_Album,Dt_Lancamento,Nome_Album,fk_id_Artista) values ('01:28:00','2004-11-12',"Encore",3);
Insert into bdtrabalhofinal.Album(Duracao_Album,Dt_Lancamento,Nome_Album,fk_id_Artista) values ('00:26:53','2023-03-17',"10,000 gecs",4);
Insert into bdtrabalhofinal.Album(Duracao_Album,Dt_Lancamento,Nome_Album,fk_id_Artista) values ('01:01:00','2019-08-23',"Lover",5);

create table bdtrabalhofinal.Room(
    id_room BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    nome varchar(45) not null
);

select * from bdtrabalhofinal.Room;

Insert into bdtrabalhofinal.Room(nome) values ("Sala de festas do Alberto");
Insert into bdtrabalhofinal.Room(nome) values ("Domingão da Mikaella");


create table bdtrabalhofinal.Musica(
    id_musica BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    letra text,
    salvar_musica boolean not null,
    duracao_musica time not null,
    nome_musica varchar(45) not null,
    fk_id_Artista BIGINT(20),
    
    foreign key (fk_id_Artista) references bdtrabalhofinal.Artista(id_Artista)
);


/*
SALVAR A MUSICA (FALSE -> TRUE)
*/

select * from  bdtrabalhofinal.Musica; 

alter table bdtrabalhofinal.Musica
	alter column salvar_musica set default false;

Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:03:26',"This Is Why",1);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:04:05',"You First",1);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:03:07',"The News",1);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:03:06',"Pink Venom",2);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:02:55',"Shut Down",2);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:02:42',"Hard to Love",2);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:04:10',"Mockingbird",3);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:04:07',"Puke",3);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:04:08',"Just Lose It",3);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:02:46',"mememe",4);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:03:07',"Hollywood Baby",4);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:02:41',"Frog On The Floor",4);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:02:58',"Cruel Summer",5);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:03:54',"Miss Americana & the Heartbreak Prince",5);
Insert into bdtrabalhofinal.Musica(letra,duracao_musica, nome_musica,fk_id_Artista) values ("",'00:03:41',"All Of The Girls You Loved Before",5);

create table bdtrabalhofinal.Usuario(
    id_usuario BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    nome_usuario varchar(45) not null,
    senha varchar(45) not null,
    dt_nascimento date not null,
    email varchar(100) not null,
    fk_id_room BIGINT(20),
    
    foreign key (fk_id_room) references bdtrabalhofinal.Room(id_room)
);

select * from bdtrabalhofinal.Usuario;

Insert into bdtrabalhofinal.Usuario(nome_usuario,senha,dt_nascimento,email,fk_id_room) values ("Alberto","Aberto1234",'1982-09-05',"alberto.pereira@hotmail.com",1);
Insert into bdtrabalhofinal.Usuario(nome_usuario,senha,dt_nascimento,email,fk_id_room) values ("Sônia","LuigiGato",'1983-11-24',"soni4_armandes1@yahoo.com.br",1);
Insert into bdtrabalhofinal.Usuario(nome_usuario,senha,dt_nascimento,email,fk_id_room) values ("Mikaella","M1k@el!aLInd4",'2000-05-13',"mikaellinha@gmail.com",2);
Insert into bdtrabalhofinal.Usuario(nome_usuario,senha,dt_nascimento,email,fk_id_room) values ("Enzo","Fortinite666",'2002-07-02',"enzinhogameplaysferapro@gmail.com",2);
Insert into bdtrabalhofinal.Usuario(nome_usuario,senha,dt_nascimento,email,fk_id_room) values ("Beatriz","SwiftzinhaL0ver2",'2004-12-13',"beabearexaS2@gmail.com",2);


create table bdtrabalhofinal.Fila_Reproducao(
    Id_Fila_Reproducao BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    fk_Musica_Id_Musica BIGINT(20),
    fk_Room_Id_Room BIGINT(20),

    foreign key (fk_Musica_Id_Musica) references bdtrabalhofinal.Musica(Id_Musica),
    foreign key (fk_Room_Id_Room) references bdtrabalhofinal.Room(Id_Room)
);

select * from bdtrabalhofinal.Fila_Reproducao;

Insert into bdtrabalhofinal.Fila_Reproducao(fk_Musica_Id_Musica,fk_Room_Id_Room) values (8,1);
Insert into bdtrabalhofinal.Fila_Reproducao(fk_Musica_Id_Musica,fk_Room_Id_Room) values (14,2);

/*
ADICIONAR MAIS MÚSICAS NA FILA DE REPRODUÇÃO
*/
INSERT INTO bdtrabalhofinal.fila_reproducao(fk_Musica_Id_Musica, fk_Room_Id_Room) VALUES (1,1)


create table bdtrabalhofinal.Musica_Album(
    fk_Musica_Id_Musica BIGINT(20),
    fk_Album_Id_Album BIGINT(20),

    foreign key (fk_Musica_Id_Musica) references bdtrabalhofinal.Musica(Id_Musica),
    foreign key (fk_Album_Id_Album) references bdtrabalhofinal.Album(Id_Album)
);

select * from bdtrabalhofinal.Musica_Album;

Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (1,1);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (2,1);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (3,1);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (4,2);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (5,2);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (6,2);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (7,3);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (8,3);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (9,3);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (10,4);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (11,4);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (12,4);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (13,5);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (14,5);
Insert into bdtrabalhofinal.Musica_Album(fk_Musica_Id_Musica,fk_Album_Id_Album) values (15,5);

create table bdtrabalhofinal.Playlist_Musica(
    Id_Playlist_Musica BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    fk_Playlist_Id_Playlist BIGINT(20),
    fk_Musica_Tem_Id_Musica BIGINT(20),

    foreign key (fk_Playlist_Id_Playlist) references bdtrabalhofinal.Playlist(Id_Playlist),
    foreign key (fk_Musica_Tem_Id_Musica) references bdtrabalhofinal.Musica(Id_Musica)
);

/*
TRIGGER PARA CALCULAR O TEMPO DA PLAYLIST
*/

DELIMITER $
create trigger tempo_playlist after insert on playlist_musica
for each row 
begin 
	update playlist 
    set playlist.Duracao_Playlist = playlist.Duracao_Playlist + (SELECT musica.duracao_musica FROM musica WHERE musica.id_musica = NEW.fk_Musica_Tem_Id_Musica)
where playlist.id_Playlist = NEW.fk_Playlist_Id_Playlist;
end$
DELIMITER ;
