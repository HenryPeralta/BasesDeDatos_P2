create database proyecto2_db1;
use proyecto2_db1;

#### Tablas ####

create table Carrera(
	id_carrera int primary key auto_increment,
    nombre_carrera varchar(100)
);

create table Estudiante(
	carnet bigint primary key,
    nombres_estudiante varchar(100),
    apellidos_estudiante varchar(100),
    fecha_nacimiento date,
    correo varchar(100),
    telefono int,
    direccion varchar(100),
    dpi bigint,
	id_carrera int,
    creditos int,
    fecha_exacta timestamp,
    foreign key (id_carrera) references Carrera(id_carrera)
);

create table Docente(
	nombres_docente varchar(100),
    apellidos_docente varchar(100),
    fecha_nacimiento date,
    correo varchar(100),
    telefono int,
    direccion varchar(100),
    dpi bigint,
    siif_docente int primary key,
    fecha_exacta timestamp
);

create table Curso(
	codigo_curso int primary key,
    nombre_curso varchar(100),
    creditos_necesarios int,
    creditos_otorga int,
    id_carrera int,
    obligatorio boolean,
    foreign key (id_carrera) references Carrera(id_carrera)
);

create table CursoHabilitado(
	id_habilitado int primary key auto_increment,
    codigo_curso int,
    ciclo varchar(2),
    siif_docente int,
    cupo int,
    seccion varchar(1),
    año year,
    asignados int,
    foreign key (codigo_curso) references Curso(codigo_curso),
    foreign key (siif_docente) references Docente(siif_docente)
);

create table Horario(
	id_horario int primary key auto_increment,
    id_habilitado int,
    dia int,
    horario varchar(100),
    foreign key (id_habilitado) references CursoHabilitado(id_habilitado)
);

create table AsignarCurso(
	id_asignarcurso int primary key auto_increment,
    id_habilitado int,
    carnet bigint,
    foreign key (id_habilitado) references CursoHabilitado(id_habilitado),
    foreign key (carnet) references Estudiante(carnet)
);

create table DesasignarCurso(
	id_desasignarcurso int primary key auto_increment,
    id_habilitado int,
    carnet bigint,
    foreign key (id_habilitado) references CursoHabilitado(id_habilitado),
    foreign key (carnet) references Estudiante(carnet)
);

create table IngresarNotas(
	id_notas int primary key auto_increment,
    id_habilitado int,
    carnet bigint,
    nota float,
    foreign key (id_habilitado) references CursoHabilitado(id_habilitado),
    foreign key (carnet) references Estudiante(carnet)
);

create table GenerarActa(
	id_acta int primary key auto_increment,
    id_habilitado int,
    fecha_exacta timestamp,
    foreign key (id_habilitado) references CursoHabilitado(id_habilitado)
);

create table Bitacora(
	fecha_hora datetime,
    descripcion varchar(100),
    tipo varchar(25)
);

#### Triggers ####
/* Trigger Estudiante */
delimiter $$
create trigger bitacora_insert_estudiante
after insert on Estudiante
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Estudiante", "INSERT");
end;
$$

delimiter $$
create trigger bitacora_update_estudiante
after update on Estudiante
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Estudiante", "UPDATE");
end;
$$

delimiter $$
create trigger bitacora_delete_estudiante
after delete on Estudiante
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Estudiante", "DELETE");
end;
$$

delimiter $$
create trigger bitacora_insert_carrera
after insert on Carrera
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Carrera", "INSERT");
end;
$$

delimiter $$
create trigger bitacora_update_carrera
after update on Carrera
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Carrera", "UPDATE");
end;
$$

delimiter $$
create trigger bitacora_delete_carrera
after delete on Carrera
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Carrera", "DELETE");
end;
$$

delimiter $$
create trigger bitacora_insert_docente
after insert on Docente
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Docente", "INSERT");
end;
$$

delimiter $$
create trigger bitacora_update_docente
after update on Docente
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Docente", "UPDATE");
end;
$$

delimiter $$
create trigger bitacora_delete_docente
after delete on Docente
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Docente", "DELETE");
end;
$$

delimiter $$
create trigger bitacora_insert_curso
after insert on Curso
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Curso", "INSERT");
end;
$$

delimiter $$
create trigger bitacora_update_curso
after update on Curso
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Curso", "UPDATE");
end;
$$

delimiter $$
create trigger bitacora_delete_curso
after delete on Curso
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Curso", "DELETE");
end;
$$

delimiter $$
create trigger bitacora_insert_cursohabilitado
after insert on CursoHabilitado
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Habilitar Curso", "INSERT");
end;
$$

delimiter $$
create trigger bitacora_update_cursohabilitado
after update on CursoHabilitado
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Habilitar Curso", "UPDATE");
end;
$$

delimiter $$
create trigger bitacora_delete_cursohabilitado
after delete on CursoHabilitado
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Habilitar Curso", "DELETE");
end;
$$

delimiter $$
create trigger bitacora_insert_horario
after insert on Horario
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Horario", "INSERT");
end;
$$

delimiter $$
create trigger bitacora_update_horario
after update on Horario
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Horario", "UPDATE");
end;
$$

delimiter $$
create trigger bitacora_delete_horario
after delete on Horario
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Horario", "DELETE");
end;
$$

delimiter $$
create trigger bitacora_insert_asignarcurso
after insert on AsignarCurso
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Asignar Curso", "INSERT");
end;
$$

delimiter $$
create trigger bitacora_update_asignarcurso
after update on AsignarCurso
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Asignar Curso", "UPDATE");
end;
$$

delimiter $$
create trigger bitacora_delete_asignarcurso
after delete on AsignarCurso
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Asignar Curso", "DELETE");
end;
$$

delimiter $$
create trigger bitacora_insert_desasignarcurso
after insert on DesasignarCurso
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Desasignar Curso", "INSERT");
end;
$$

delimiter $$
create trigger bitacora_update_desasignarcurso
after update on DesasignarCurso
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Desasignar Curso", "UPDATE");
end;
$$

delimiter $$
create trigger bitacora_delete_desasignarcurso
after delete on DesasignarCurso
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Desasignar Curso", "DELETE");
end;
$$

delimiter $$
create trigger bitacora_insert_ingresarnotas
after insert on IngresarNotas
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Ingresar Notas", "INSERT");
end;
$$

delimiter $$
create trigger bitacora_update_ingresarNotas
after update on IngresarNotas
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Ingresar Notas", "UPDATE");
end;
$$

delimiter $$
create trigger bitacora_delete_ingresarnotas
after delete on IngresarNotas
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Ingresar Notas", "DELETE");
end;
$$

delimiter $$
create trigger bitacora_insert_generaracta
after insert on GenerarActa
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Generar Acta", "INSERT");
end;
$$

delimiter $$
create trigger bitacora_update_generaracta
after update on GenerarActa
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Generar Acta", "UPDATE");
end;
$$

delimiter $$
create trigger bitacora_delete_generaracta
after delete on GenerarActa
for each row
begin
	insert into Bitacora values (sysdate(), "Se ha realizado una accion en la tabla Generar Acta", "DELETE");
end;
$$

#### Funciones ####
delimiter $$
create function ValidarLetras(
	cadena varchar(100)
)
returns boolean
deterministic
begin
	declare valido boolean;
    if(select regexp_instr(cadena, '[^a-zA-Z ]')) then
		select false into valido;
    else
		select true into valido;
	end if;
    return valido;
end; 
$$

delimiter $$
create function ValidarCorreo(
	cadena varchar(100)
)
returns boolean
deterministic
begin
	declare valido boolean;
    if(select regexp_instr(cadena,  '^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,4}$')) then
		select true into valido;
    else
		select false into valido;
	end if;
    return valido;
end; 
$$

delimiter $$
create function ExisteEstudiante(
	usercarnet int
)
returns boolean
deterministic
begin
	declare existe boolean;
    select exists(select 1 from Estudiante es where es.carnet = usercarnet) into existe;
    return existe;
end;
$$

delimiter $$
create function ExisteCarrera(
	carreraname varchar(100)
)
returns boolean
deterministic
begin
	declare existe boolean;
    select exists(select 1 from Carrera ca where ca.nombre_carrera = carreraname) into existe;
    return existe;
end;
$$

delimiter $$
create function ExisteDocente(
	SiifDocente int
)
returns boolean
deterministic
begin
	declare existe boolean;
    select exists(select 1 from Docente doc where doc.siif_docente = SiifDocente) into existe;
    return existe;
end;
$$

delimiter $$
create function ExisteCurso(
	cod_curso int
)
returns boolean
deterministic
begin
	declare existe boolean;
    select exists(select 1 from Curso cu where cu.codigo_curso = cod_curso) into existe;
    return existe;
end;
$$

delimiter $$
create function ValidarNumPositivo(
	cadena int
)
returns boolean
deterministic
begin
	declare valido boolean;
    if(select regexp_instr(cadena,  '^[0-9]+$')) then
		select true into valido;
    else
		select false into valido;
	end if;
    return valido;
end; 
$$

delimiter $$
create function ValidarCiclo(
	cadena varchar(2)
)
returns boolean
deterministic
begin
	declare valido boolean;
    if(cadena = '1S' or cadena = '2S' or cadena = 'VJ' or cadena = 'VD') then
		select true into valido;
    else
		select false into valido;
	end if;
    return valido;
end; 
$$

delimiter $$
create function ExisteHabilitacion(
	ValCurso int,
	ValSeccion varchar(1),
    ValCiclo varchar(2)
)
returns boolean
deterministic
begin
	declare existe boolean;
    select exists(select 1 from CursoHabilitado ch where ch.codigo_curso = ValCurso and ch.seccion = ValSeccion and ch.ciclo = ValCiclo) into existe;
    return existe;
end;
$$

delimiter $$
create function ExisteCursoHabilitado(
	CursoHabil int
)
returns boolean
deterministic
begin
	declare existe boolean;
    select exists(select 1 from CursoHabilitado ch where ch.id_habilitado = CursoHabil) into existe;
    return existe;
end;
$$

delimiter $$
create function Validardia(
	cadena int
)
returns boolean
deterministic
begin
	declare valido boolean;
    if(cadena > 0 and cadena < 8) then
		select true into valido;
    else
		select false into valido;
	end if;
    return valido;
end; 
$$

delimiter $$
create function ExisteAsignacionEstudiante(
	ValCarnet bigint,
    ValIdHabilitado int
)
returns boolean
deterministic
begin
	declare existe boolean;
    select exists(select 1 from AsignarCurso ac where ac.id_habilitado = ValIdHabilitado and ac.carnet = ValCarnet) into existe;
    return existe;
end;
$$

delimiter $$
create function MismaSeccion(
	ValCarnet bigint,
    ValIdHabilitado int
)
returns boolean
deterministic
begin
	declare existe boolean;
	declare cursoasignado varchar(100);
    declare cicloasignado varchar(2);
    declare seccionasignado varchar(1);
    
	declare cursonuevo varchar(100);
    declare ciclonuevo varchar(2);
    declare seccionnuevo varchar(1);    

    select cu.nombre_curso, ch.ciclo, ch.seccion from AsignarCurso ac
	inner join CursoHabilitado ch on ch.id_habilitado = ac.id_habilitado
	inner join Curso cu on cu.codigo_curso = ch.codigo_curso
    where ac.carnet = ValCarnet and cu.nombre_curso = (select cur.nombre_curso from CursoHabilitado cha
    inner join Curso cur on cur.codigo_curso = cha.codigo_curso
    where cha.id_habilitado = ValIdHabilitado)
    into cursoasignado, cicloasignado, seccionasignado;
    
    select cu.nombre_curso, ch.ciclo, ch.seccion from CursoHabilitado ch
    inner join Curso cu on cu.codigo_curso = ch.codigo_curso
    where ch.id_habilitado = ValIdHabilitado
    into cursonuevo, ciclonuevo, seccionnuevo;
    
    if(cicloasignado = ciclonuevo) then
		if(cursoasignado = cursonuevo) then
			select true into existe;
		else
			select false into existe;
        end if;
	else
		select false into existe;
    end if;
    return existe;
end;
$$

delimiter $$
create function ValidarCreditos(
	ValCarnet bigint,
    ValIdHabilitado int
)
returns boolean
deterministic
begin
	declare existe boolean;
	declare creditosestudiante int;
    declare creditosnecesarios int;
    
    select es.creditos from Estudiante es
    where es.carnet = ValCarnet
    into creditosestudiante;
    
    select cu.creditos_necesarios from CursoHabilitado ch
    inner join Curso cu on cu.codigo_curso = ch.codigo_curso
    where ch.id_habilitado = ValIdHabilitado
    into creditosnecesarios;
    
    if(creditosestudiante >= creditosnecesarios) then
		select true into existe;
	else
		select false into existe;
	end if;
    return existe;
end;
$$

delimiter $$
create function ValidarCarrera(
	ValCarnet bigint,
    ValIdHabilitado int
)
returns boolean
deterministic
begin
	declare existe boolean;
	declare valcarreracurso int;
    declare valcarreraestudiante int;
    
    select es.id_carrera from Estudiante es
    where es.carnet = ValCarnet
    into valcarreraestudiante;
    
    select cu.id_carrera from CursoHabilitado ch
    inner join Curso cu on cu.codigo_curso = ch.codigo_curso
    where ch.id_habilitado = ValIdHabilitado
    into valcarreracurso;
    
    if(valcarreraestudiante = valcarreracurso or valcarreracurso = 0) then
		select true into existe;
	else
		select false into existe;
	end if;
    return existe;
end;
$$

delimiter $$
create function ValidarCupo(
    ValIdHabilitado int
)
returns boolean
deterministic
begin
	declare existe boolean;
	declare cupo_p int;
    
    select ch.cupo from CursoHabilitado ch
    where ch.id_habilitado = ValIdHabilitado
    into cupo_p;
    
    if(cupo_p > 0) then
		update CursoHabilitado set cupo = (cupo_p - 1) where id_habilitado = ValIdHabilitado;
		select true into existe;
	else
		select false into existe;
	end if;
    return existe;
end;
$$

delimiter $$
create function EstudianteEnCurso(
	ValCarnet bigint,
    ValIdHabilitado int
)
returns boolean
deterministic
begin
	declare existe boolean;
    select exists(select 1 from AsignarCurso ac where ac.id_habilitado = ValIdHabilitado and ac.carnet = ValCarnet) into existe;
    return existe;
end;
$$

delimiter $$
create function EliminarAsignacion(
	ValCarnet bigint,
    ValIdHabilitado int
)
returns boolean
deterministic
begin
	declare existe boolean;
    declare idcurso_p int;
    
    select ac.id_asignarcurso from AsignarCurso ac
	inner join CursoHabilitado ch on ch.id_habilitado = ac.id_habilitado
	inner join Curso cu on cu.codigo_curso = ch.codigo_curso
    where ac.carnet = ValCarnet and ch.id_habilitado = ValIdHabilitado
    into idcurso_p;
    
    delete from AsignarCurso where id_asignarcurso = idcurso_p;
    
    select true into existe;
    return existe;
end;
$$

delimiter $$
create function AgregarCupo(
    ValIdHabilitado int
)
returns boolean
deterministic
begin
	declare existe boolean;
	declare cupo_p int;
    
    select ch.cupo from CursoHabilitado ch
    where ch.id_habilitado = ValIdHabilitado
    into cupo_p;
    
	update CursoHabilitado set cupo = (cupo_p + 1) where id_habilitado = ValIdHabilitado;
	select true into existe;
    return existe;
end;
$$

delimiter $$
create function AgregarCreditos(
    ValIdHabilitado int,
    ValCarnet bigint,
    Nota_p int
)
returns boolean
deterministic
begin
	declare existe boolean;
	declare creditosdan_p int;
    declare creditos_actuales int;
    
	select cu.creditos_otorga from AsignarCurso ac
	inner join CursoHabilitado ch on ch.id_habilitado = ac.id_habilitado
	inner join Curso cu on cu.codigo_curso = ch.codigo_curso
    where ac.carnet = ValCarnet and ch.id_habilitado = ValIdHabilitado
    into creditosdan_p;
    
    select creditos from Estudiante where carnet = ValCarnet
    into creditos_actuales;
    
    if(Nota_p >= 61) then
		update Estudiante set creditos = (creditos_actuales + creditosdan_p) where carnet = ValCarnet;
		SELECT TRUE INTO existe;
	else
		select false into existe;
	end if;
    return existe;
end;
$$

delimiter $$
create function ValidarNotas(
    ValIdHabilitado int
)
returns boolean
deterministic
begin
	declare existe boolean;
	declare cantidadEstudiantes int;
    declare cantidadNotas int;
    
	select count(ch.id_habilitado) from AsignarCurso ac
	inner join CursoHabilitado ch on ch.id_habilitado = ac.id_habilitado
	inner join Curso cu on cu.codigo_curso = ch.codigo_curso
    where ch.id_habilitado = ValIdHabilitado
    into cantidadEstudiantes;
    
    select count(id_habilitado) from IngresarNotas where id_habilitado = ValIdHabilitado
    into cantidadNotas;
    
    if(cantidadEstudiantes = cantidadNotas) then
		SELECT true into existe;
	else
		select false into existe;
	end if;
    return existe;
end;
$$

delimiter $$
create function ValidarCodCarrera(
    codcarrera int
)
returns boolean
deterministic
begin
	declare existe boolean;
    select exists(select 1 from Carrera ca where ca.id_carrera = codcarrera) into existe;
    return existe;
end;
$$

delimiter $$
create function AgregarAsignado(
    ValIdHabilitado int
)
returns boolean
deterministic
begin
	declare existe boolean;
	declare asignado_p int;
    
    select ch.asignados from CursoHabilitado ch
    where ch.id_habilitado = ValIdHabilitado
    into asignado_p;
    
    update CursoHabilitado set asignados = (asignado_p + 1) where id_habilitado = ValIdHabilitado;
    select true into existe;
    return existe;
end;
$$

delimiter $$
create function QuitarAsignado(
    ValIdHabilitado int
)
returns boolean
deterministic
begin
	declare existe boolean;
	declare asignado_p int;
    
    select ch.asignados from CursoHabilitado ch
    where ch.id_habilitado = ValIdHabilitado
    into asignado_p;
    
    update CursoHabilitado set asignados = (asignado_p - 1) where id_habilitado = ValIdHabilitado;
    select true into existe;
    return existe;
end;
$$

#### Procedimientos de almacenado ####

#### Insertar Carrera ####
delimiter $$
create procedure CrearCarrera(
	carrera_name varchar(100)
)
CrearCarrera: begin

if(ExisteCarrera(carrera_name)) then
	select 'Carrera ya existente.' as error;
    leave CrearCarrera;
end if;

insert into Carrera(nombre_carrera) values (carrera_name);
select concat("Carrera '", carrera_name, "' registrada.") as Mensaje;
end; $$

#### Insertar Estudiante ####
delimiter $$
create procedure RegistrarEstudiante(
	carnet_p int,
    nombres_p varchar(100),
    apellidos_p varchar(100),
    fechanac_p date,
    correo_p varchar(100),
    telefono_p int,
    direccion_p varchar(100),
    dpi_p bigint,
    idcarrera_p int
)
RegistrarEstudiante: begin

if(ExisteEstudiante(carnet_p)) then
	select 'El carnet ya existe.' as error;
    leave RegistrarEstudiante;
end if;

if(not ValidarCorreo(correo_p)) then
	select 'El formato del correo es incorrecto.' as error;
    leave RegistrarEstudiante;
end if;

insert into Estudiante values(carnet_p, nombres_p, apellidos_p, fechanac_p, correo_p, telefono_p, direccion_p, dpi_p, idcarrera_p, 0, sysdate());
select concat("Estudiante con carnet '", carnet_p, "' registrado.") as Mensaje;
end; $$

#### Insertar Docente ####
delimiter $$
create procedure RegistrarDocente(
    nombres_p varchar(100),
    apellidos_p varchar(100),
    fechanac_p date,
    correo_p varchar(100),
    telefono_p int,
    direccion_p varchar(100),
    dpi_p bigint,
    siif_p int
)
RegistrarDocente: begin

if(ExisteDocente(siif_p)) then
	select 'El Docente con numero de siif ya existe.' as error;
    leave RegistrarDocente;
end if;

if(not ValidarCorreo(correo_p)) then
	select 'El formato del correo es incorrecto.' as error;
    leave RegistrarDocente;
end if;

insert into Docente values(nombres_p, apellidos_p, fechanac_p, correo_p, telefono_p, direccion_p, dpi_p, siif_p, sysdate());
select concat("Docente con siif '", siif_p, "' registrado.") as Mensaje;
end; $$

#### Insertar curso ####
delimiter $$
create procedure CrearCurso(
	codigocurso_p int,
    nombrecurso_p varchar(100),
    cnecesarios_p int,
    cotorga_p int,
    idcarrera_p int,
    obligatorio_p boolean
)
CrearCurso: begin

if(ExisteCurso(codigocurso_p)) then
	select 'El curso ya existe.' as error;
    leave CrearCurso;
end if;

if(not ValidarNumPositivo(cnecesarios_p)) then
	select 'El valor de los creditos necesarios debe ser positivo.' as error;
    leave CrearCurso;
end if;

if(not ValidarNumPositivo(cotorga_p)) then
	select 'El valor de los creditos que otorga debe ser positivo.' as error;
    leave CrearCurso;
end if;

insert into Curso values(codigocurso_p, nombrecurso_p, cnecesarios_p, cotorga_p, idcarrera_p, obligatorio_p);
select concat("Curso '", nombrecurso_p, "' registrado.") as Mensaje;
end; $$

#### Insertar habilitar curso ####
delimiter $$
create procedure HabilitarCurso(
	codigocurso_p int,
    ciclo_p varchar(2),
    siif_p int,
    cupo_p int,
    seccion_p varchar(1)
)
HabilitarCurso: begin

if(not ExisteCurso(codigocurso_p)) then
	select 'El curso no existe.' as error;
    leave HabilitarCurso;
end if;

if(not ValidarCiclo(ciclo_p)) then
	select 'El valor del ciclo es incorrecto.' as error;
    leave HabilitarCurso;
end if;

if(not ExisteDocente(siif_p)) then
	select 'El docente no existe.' as error;
    leave HabilitarCurso;
end if;

if(not ValidarNumPositivo(cupo_p)) then
	select 'El valor del cupo debe ser positivo.' as error;
    leave HabilitarCurso;
end if;

if(ExisteHabilitacion(codigocurso_p, seccion_p, ciclo_p)) then
	select 'La curso con esa seccion y en ese ciclo ya existen.' as error;
    leave HabilitarCurso;
end if;

insert into CursoHabilitado(codigo_curso, ciclo, siif_docente, cupo, seccion, año, asignados) values(codigocurso_p, ciclo_p, siif_p, cupo_p, upper(seccion_p), sysdate(), 0);
select concat("Curso habilitado'", codigocurso_p, "' con seccion '", seccion_p, "' registrado.") as Mensaje;
end; $$

#### Insertar horario ####
delimiter $$
create procedure AgregarHorario(
	idccursohab_p int,
    dia_p int,
    horario_p varchar(100)
)
AgregarHorario: begin

if(not ExisteCursoHabilitado(idccursohab_p)) then
	select 'El curso habilitado no existe.' as error;
    leave AgregarHorario;
end if;

if(not Validardia(dia_p)) then
	select 'El valor del dia es incorrecto.' as error;
    leave AgregarHorario;
end if;

insert into Horario(id_habilitado, dia, horario) values(idccursohab_p, dia_p, horario_p);
select concat("Horario del id curso '", idccursohab_p, "' registrado.") as Mensaje;
end; $$

#### Insertar Asignaciones ####
delimiter $$
create procedure AsignarCurso(
    idch_p int,
    carnet_p bigint
)
AsignarCurso: begin

if(not ExisteCursoHabilitado(idch_p)) then
	select 'El curso habilitado no existe.' as error;
    leave AsignarCurso;
end if;

if(not ExisteEstudiante(carnet_p)) then
	select 'El carnet del estudiante no existe.' as error;
    leave AsignarCurso;
end if;

if(MismaSeccion(carnet_p, idch_p)) then
	select 'El estudiante ya esta asignado a este curso.' as error;
    leave AsignarCurso;
end if;

if(not ValidarCreditos(carnet_p, idch_p)) then
	select 'El estudiante no tiene los creditos necesarios para llevar el curso.' as error;
    leave AsignarCurso;
end if;

if(not ValidarCarrera(carnet_p, idch_p)) then
	select 'El estudiante no puede asignar un curso que no es de su carrera.' as error;
    leave AsignarCurso;
end if;

if(not ValidarCupo(idch_p)) then
	select 'ya no hay cupo en la seccion.' as error;
    leave AsignarCurso;
end if;

if(not AgregarAsignado(idch_p)) then
	select 'Error al asignar estudiante.' as error;
    leave AsignarCurso;
end if;

insert into AsignarCurso(id_habilitado, carnet) values(idch_p, carnet_p);
select concat("El estudiante con carnet '", carnet_p, "' se ha asignacion al curso con id '", idch_p, "' correctamente.") as Mensaje;
end; $$

#### Insertar Desasignacion ####
delimiter $$
create procedure DesasignarCurso(
    idch_p int,
    carnet_p bigint
)
DesasignarCurso: begin

if(not ExisteCursoHabilitado(idch_p)) then
	select 'El curso habilitado no existe.' as error;
    leave DesasignarCurso;
end if;

if(not ExisteEstudiante(carnet_p)) then
	select 'El carnet del estudiante no existe.' as error;
    leave DesasignarCurso;
end if;

if(not EstudianteEnCurso(carnet_p, idch_p)) then
	select 'El Estudiante no esta en este curso o esta en otra seccion' as error;
    leave DesasignarCurso;
end if;

if(not EliminarAsignacion(carnet_p, idch_p)) then
	select 'Error al eliminar en la tabla asignacion' as error;
    leave DesasignarCurso;
end if;

if(not AgregarCupo(idch_p)) then
	select 'Error al agregar cupo' as error;
    leave DesasignarCurso;
end if;

if(not QuitarAsignado(idch_p)) then
	select 'Error al eliminar una asignacion' as error;
    leave DesasignarCurso;
end if;

insert into DesasignarCurso(id_habilitado, carnet) values(idch_p, carnet_p);
select concat("El estudiante con carnet '", carnet_p, "' se ha desasignado del curso con id '", idch_p, "' correctamente.") as Mensaje;
end; $$

#### Insertar Notas ####
delimiter $$
create procedure IngresarNota(
    idch_p int,
    carnet_p bigint,
    nota_p float
)
IngresarNota: begin

if(not ExisteCursoHabilitado(idch_p)) then
	select 'El curso habilitado no existe.' as error;
    leave IngresarNota;
end if;

if(not ExisteEstudiante(carnet_p)) then
	select 'El carnet del estudiante no existe.' as error;
    leave IngresarNota;
end if;

if(not EstudianteEnCurso(carnet_p, idch_p)) then
	select 'El Estudiante no esta en este curso o esta en otra seccion' as error;
    leave IngresarNota;
end if;

if(AgregarCreditos(idch_p, carnet_p, round(nota_p, 0))) then
	select 'Aprobado' as Mensaje;
else
	select 'Reprobado' as Mensaje;
end if;

insert into IngresarNotas(id_habilitado, carnet, nota) values(idch_p, carnet_p, round(nota_p, 0));
select concat("Se ingreso la nota del estudiante con carnet '", carnet_p, "' correctamente.") as Mensaje;
end; $$

#### Generar Acta ####
delimiter $$
create procedure GenerarActa(
    idch_p int
)
GenerarActa: begin

if(not ExisteCursoHabilitado(idch_p)) then
	select 'El curso habilitado no existe.' as error;
    leave GenerarActa;
end if;

if(not ValidarNotas(idch_p)) then
	select 'Todavia hay alumnos sin notas.' as error;
    leave GenerarActa;
end if;

insert into GenerarActa(id_habilitado, fecha_exacta) values(idch_p, sysdate());
select concat("La acta del curso con identificador '", idch_p, "' se ha generado correctamente.") as Mensaje;
end; $$

#### Consultas ####

#### 1. Consultar Pensum ####
delimiter $$
create procedure ConsultarPensum(
    codcarrera_p int
)
ConsultarPensum: begin

if(not ValidarCodCarrera(codcarrera_p)) then
	select 'El codigo de la carrera no existe.' as error;
    leave ConsultarPensum;
end if;

select cu.codigo_curso as "Codigo del curso", cu.nombre_curso as "Nombre del curso", if(cu.obligatorio = 1, "si", "no") as Obligatorio, cu.creditos_necesarios as "Creditos necesarios" from Curso cu
inner join Carrera ca on ca.id_carrera = cu.id_carrera
where ca.id_carrera = 0
union
select cu.codigo_curso as "Codigo del curso", cu.nombre_curso as "Nombre del curso", if(cu.obligatorio = 1, "si", "no") as Obligatorio, cu.creditos_necesarios as "Creditos necesarios" from Curso cu
inner join Carrera ca on ca.id_carrera = cu.id_carrera
where ca.id_carrera = codcarrera_p;

end; $$

#### 2. Consultar estudiante ####
delimiter $$
create procedure ConsultarEstudiante(
    carnet_p int
)
ConsultarEstudiante: begin

if(not ExisteEstudiante(carnet_p)) then
	select 'El carnet no existe.' as error;
    leave ConsultarEstudiante;
end if;

select es.carnet as Carnet, concat(nombres_estudiante, ' ', apellidos_estudiante) as "Nombre completo", es.fecha_nacimiento as "Fecha de nacimiento", es.correo as Correo, es.telefono as Telefono, es.direccion as Direccion, es.dpi as Dpi, ca.nombre_carrera as Carrera, es.creditos as Creditos from Estudiante es
inner join Carrera ca on ca.id_carrera = es.id_carrera
where es.carnet = carnet_p;

end; $$

#### 3. Consultar docente ####
delimiter $$
create procedure ConsultarDocente(
    siif_p int
)
ConsultarDocente: begin

if(not ExisteDocente(siif_p)) then
	select 'El Docente no existe.' as error;
    leave ConsultarDocente;
end if;

select doc.siif_docente as "Registro SIIF", concat(doc.nombres_docente, ' ', doc.apellidos_docente) as "Nombre completo", doc.fecha_nacimiento as "Fecha de nacimiento", doc.correo as Correo, doc.telefono as Telefono, doc.direccion as Direccion, doc.dpi as Dpi from Docente doc
where doc.siif_docente = siif_p;

end; $$

#### 4. Consultar estudiantes asignados ####
delimiter $$
create procedure ConsultarAsignados(
    idcursohab_p int
)
ConsultarAsignados: begin

if(not ExisteCursoHabilitado(idcursohab_p)) then
	select 'El curso no existe o no esta habilitado.' as error;
    leave ConsultarAsignados;
end if;

select ac.carnet as Carnet, concat(es.nombres_estudiante, ' ', es.apellidos_estudiante) as "Nombre completo", es.creditos as "Creditos que posee" from AsignarCurso ac
inner join CursoHabilitado ch on ch.id_habilitado = ac.id_habilitado
inner join Estudiante es on es.carnet = ac.carnet
inner join Curso cu on cu.codigo_curso = ch.codigo_curso
where ch.id_habilitado = idcursohab_p;

end; $$

#### 5. Consultar aprobaciones ####
delimiter $$
create procedure ConsultarAprobacion(
    idcursohab_p int
)
ConsultarAprobacion: begin

if(not ExisteCursoHabilitado(idcursohab_p)) then
	select 'El curso no existe o no esta habilitado.' as error;
    leave ConsultarAprobacion;
end if;

select cu.codigo_curso as "Codigo de curso", ac.carnet as Carnet, concat(es.nombres_estudiante, ' ', es.apellidos_estudiante) as "Nombre Completo", if(ingn.nota >= 61, "Aprobado", "Deseaprobado") as Informe from AsignarCurso ac
inner join CursoHabilitado ch on ch.id_habilitado = ac.id_habilitado
inner join Estudiante es on es.carnet = ac.carnet
inner join Curso cu on cu.codigo_curso = ch.codigo_curso
inner join IngresarNotas ingn on ingn.carnet = es.carnet
where ingn.id_habilitado = idcursohab_p and ac.id_habilitado = idcursohab_p;

end; $$

#### 6. Consultar Actas ####
delimiter $$
create procedure ConsultarActas(
    codcurso_p int
)
ConsultarActas: begin

if(not ExisteCurso(codcurso_p)) then
	select 'El curso no existe.' as error;
    leave ConsultarActas;
end if;

select cu.codigo_curso as "Codigo de curso", ch.seccion as Seccion, if(ch.ciclo = '1S', 'PRIMER SEMESTRE', if(ch.ciclo = '2S', 'SEGUNDO SEMESTRE', if(ch.ciclo = 'VJ', 'VACACIONES DE JUNIO', 'VACACIONES DE DICIEMBRE'))) as Ciclo, ch.año as Año, ch.asignados as "Cantidad de estudiantes", ga.fecha_exacta as "Fecha Exacta" from CursoHabilitado ch
inner join Curso cu on cu.codigo_curso = ch.codigo_curso
inner join GenerarActa ga on ga.id_habilitado = ch.id_habilitado
where cu.codigo_curso = codcurso_p;

end; $$

#### 7. Consultar tasa de desasignacion ####
delimiter $$
create procedure ConsultarDesasignacion(
    idcursohab_p int
)
ConsultarDesasignacion: begin

if(not ExisteCursoHabilitado(idcursohab_p)) then
	select 'El curso no existe o no esta habilitado.' as error;
    leave ConsultarDesasignacion;
end if;

select cu.codigo_curso as "Codigo de curso", ch.seccion as Seccion, if(ch.ciclo = '1S', 'PRIMER SEMESTRE', if(ch.ciclo = '2S', 'SEGUNDO SEMESTRE', if(ch.ciclo = 'VJ', 'VACACIONES DE JUNIO', 'VACACIONES DE DICIEMBRE'))) as Ciclo, ch.año as Año, ch.asignados as "Estudiantes que llevaron el curso", count(dc.id_habilitado) as "Estudiantes que se desasignaron", ((count(dc.id_habilitado)/(count(dc.id_habilitado) + ch.asignados))*100) as "Porcentaje de desasignacion" from CursoHabilitado ch
inner join Curso cu on cu.codigo_curso = ch.codigo_curso
inner join DesasignarCurso dc on dc.id_habilitado = ch.id_habilitado
where ch.id_habilitado = idcursohab_p;

end; $$

#### Datos guardados ####

call CrearCarrera('Sistemas');
call CrearCarrera('Civil');
call CrearCarrera('Quimica');
call CrearCarrera('Industrial');
call CrearCarrera('Electrica');
call CrearCarrera('Area Comun');

call RegistrarDocente("Julio Cesar", "Perez Mux", '1970-10-20', "JulioPerez123@gmail.com", 99874653, "Guatemala", 3846192104882, 10890);
call RegistrarDocente("Marco Antonio", "Solis Aguilar", '1985-07-14', "MarcoSolis@gmail.com", 55436283, "Villa Nueva", 5486932340553, 27392);
call RegistrarDocente("Maria Andrea", "Rodriguez Hernandez", '1990-01-11', "Maria1990@gmail.com", 87354627, "Peten", 4783920421237, 87432);
call RegistrarDocente("Diana Alejandra", "Nave Herrera", '1992-12-18', "DianaN@gmail.com", 99273241, "Escuintla", 8732193433212, 11223);
call RegistrarDocente("Kevin Eduardo", "Lopez Velasquez", '1975-04-02', "Kevs@gmail.com", 23467953, "Guatemala", 4465830957484, 38472);

call RegistrarEstudiante(201620124, "Luis Roberto", "Garcia Lopez", '1995-01-06', "luisro@gmail.com", 39581257, "Escuintla", 1314151617189, 2);
call RegistrarEstudiante(201829345, "Walter Alfredo", "Zacarias Escobar", '1999-05-27', "walterzacarias@gmail.com", 81347983, "Coban", 4930264893218, 1);
call RegistrarEstudiante(201790323, "Laura Fernanda", "Guzman Perez", '1997-02-24', "guzmanperez97@gmail.com", 75633424, "Amatitlan", 3476482349453, 1);
call RegistrarEstudiante(201712289, "Henry Gabriel", "Peralta Martinez", '1998-08-24', "henrygabrielperalta@gmail.com", 58801437, "Amatitlan", 3044290820114, 1);
call RegistrarEstudiante(201543823, "Cesia Abigail", "Quiroa Arriola", '1997-04-19', "cesiaquiroa@gmail.com", 34752692, "Guatemala", 5637563324432, 3);
call RegistrarEstudiante(201705932, "Luz Elena", "Franco Aguilar", '1998-08-24', "luzfranco@gmail.com", 64835745, "Guatemala", 2647675676327, 4);
call RegistrarEstudiante(201890235, "Jose Pablo", "Martinez Hernandez", '1999-11-05', "chepe30@gmail.com", 43293411, "Izabal", 4343575848932, 5);
call RegistrarEstudiante(201600237, "Marcela Alecio", "Ramos Garcia", '1998-07-11', "marcela_alecio@gmail.com", 98432424, "Xela", 8437584578943, 2);
call RegistrarEstudiante(201700382, "Oscar Roberto", "Velasquez Leon", '1998-07-13', "oscarr1234@gmail.com", 64242452, "Guatemala", 6756375673652, 1);
call RegistrarEstudiante(201700732, "Byron Adrian", "Alvarado Mendez", '1999-06-21', "adrianalvarado@gmail.com", 23456735, "Coban", 4823748274854, 2);

call CrearCurso(0101, "Matematica basica 1", 0, 5, 0, 1);
call CrearCurso(0103, "Matematica basica 2", 5, 5, 0, 1);
call CrearCurso(0017, "Social humanistica 1", 0, 4, 0, 1);
call CrearCurso(0039, "Deportes 1", 0, 3, 0, 0);
call CrearCurso(0147, "Fisica general", 5, 5, 0, 1);

call CrearCurso(0770, "IPC 1", 0, 5, 1, 1);
call CrearCurso(0795, "Logica de sistemas", 0, 4, 1, 0);
call CrearCurso(0777, "Compiladores 1", 5, 6, 1, 1);
call CrearCurso(0772, "Estructura de datos", 5, 5, 1, 1);
call CrearCurso(0774, "Bases de datos 1", 0, 5, 1, 1);

call CrearCurso(0069, "Dibujo constructivo", 0, 4, 2, 1);
call CrearCurso(0080, "Topografia 1", 0, 4, 2, 0);
call CrearCurso(0450, "Geologia", 5, 5, 2, 1);
call CrearCurso(0453, "Materiales de construccion 1", 5, 6, 2, 1);
call CrearCurso(0170, "Mecanica analitica 1", 5, 5, 2, 1);

call CrearCurso(0354, "Quimica 3", 0, 5, 3, 1);
call CrearCurso(0358, "Quimica organica", 0, 5, 3, 1);
call CrearCurso(0380, "Fisicoquimica", 5, 4, 3, 0);
call CrearCurso(0440, "Microbiologia", 5, 5, 3, 1);
call CrearCurso(0394, "Termodinamica 3", 5, 6, 3, 1);

call CrearCurso(0022, "Psicologia industrial", 0, 3, 4, 0);
call CrearCurso(0452, "Ciencia de los materiales", 0, 5, 4, 1);
call CrearCurso(0662, "Legislacion 1", 5, 3, 4, 0);
call CrearCurso(0653, "Ingenieria de costos", 5, 5, 4, 1);
call CrearCurso(0116, "Investigacion de operaciones 1", 5, 5, 4, 1);

call CrearCurso(0204, "Circuitos electricos 1", 0, 5, 5, 1);
call CrearCurso(0210, "Teoria electromagnetica 1", 0, 4, 5, 0);
call CrearCurso(0218, "Lineas de transmision", 5, 5, 5, 1);
call CrearCurso(0214, "Maquinas electricas", 5, 6, 5, 1);
call CrearCurso(0232, "Electronica 1", 0, 5, 5, 1);

