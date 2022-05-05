create table superheroe(
	id_superheroe numeric(2,0) constraint pk_superheroe primary key,
	nombre varchar(50) not null,
	apellido varchar(50) ,
	email varchar (80) not null
);
--
create sequence superheroe_id_superheroe_seq start 1 increment 1;
alter table superheroe alter column id_superheroe set default nextval('superheroe_id_superheroe_seq');
--
insert into superheroe 
(nombre, apellido, email)
values
('Wanda', 'Maximoff', 'wanda.maximoff@avengers.org'),
('Pietro', 'Maximoff', 'pietro@mail.sokovia.ru'),
('Erik', 'Lensherr','fuck_you_charles@brotherhood.of.evil.mutants.space'),
('Charles Xavier', '', 'i.am.secretely.filled.with.hubris@xavier-school-4-gifted-youngste.'),
('Anthony Edward', 'Stark', 'iamironman@avengers.gov'),
('Steve', 'Rogers', 'americas_ass@anti_avengers'),
('The Vision', '', 'vis@westview.sword.gov'),
('Clint', 'Barton', 'bul@lse.ye'),
('Natasha', 'Romanov', 'blackwidow@kgb.ru'),
('Thor', '','god_of_thunder-^_^@royalty.asgard.gov'),
('Logan', '', 'wolverine@cyclops_is_a_jerk.com'),
('Ororo', 'Monroe', 'ororo@weather.co'),
('Scott', 'Summers', 'o@x'),
('Nathan', 'Summers', 'cable@xfact.or'),
('Groot','', 'iamgroot@asgardiansofthegalaxyledbythor.quillsux'),
('Nebula','', 'idonthaveelektras@complex.thanos'),
('Gamora','', 'thefiercestwomaninthegalaxy@thanos.'),
('Rocket','', 'shhhhhhhh@darknet.ru');
--
select s.email 
from superheroe s 
where s.email not like '%@%.org' and s.email not like '%@%.com';
--
select s.email 
from superheroe s 
where s.email like '%@%.' or s.email not like '%@%.%' or s.email  like '%^%@%';
--
create table superheroes_anios_servicio (
	id_superheroe_anios_servicio numeric(2,0) constraint pk_superheroe_anios_servicio primary key,
	nombre varchar(50) not null,
	equipo varchar (50) not null,
	anios_servicio numeric(4) not null
);
--
create sequence superheroes_anios_servicio_id_superheroe_anios_servicio_seq start 1 increment 1;
alter table superheroes_anios_servicio alter column id_superheroe_anios_servicio set default nextval('superheroes_anios_servicio_id_superheroe_anios_servicio_seq');
--
alter table superheroes_anios_servicio add column apellido varchar(50) not null;
--
insert into superheroes_anios_servicio
(nombre, apellido , equipo, anios_servicio)
values 
('Tony', 'Stark', 'Avengers',10 ),
('Wanda', 'Maximoff', 'Avengers', 5),
('Wanda', 'Maximoff', 'X Men', 3),
('Erik', 'Lensherr', 'Acolytes', 10),
('Erik', 'Lensherr', 'Brotherhood of Evil Mutants',12 ),
('Natasja', 'Romanov', 'KGB', 8),
('Natasja', 'Romanov', 'Avengers', 10);
--
select  sas.nombre, sas.equipo , sas.anios_servicio 
from superheroes_anios_servicio sas ;
--
select  sas.nombre , string_agg(sas.equipo , ','), sum(sas.anios_servicio)
from superheroes_anios_servicio sas
group by sas.nombre  ;
--



