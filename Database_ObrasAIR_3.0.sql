drop database obrasair;

create database obrasair;
use obrasair;

create table rol (
    id_rol int auto_increment,
    tipo_rol enum ("Administrador", "Aspirante", "Representante De Empresa") not null,
    estado_rol tinyint not null default 1,

    primary key (id_rol)
);

create table usuario (
    id_usuario bigint not null,
    tipo_documento enum (   '(CC) Cedula de Ciudadania',
                            '(CE) Cedula de Extranjeria',
                            '(PA) Pasaporte',
                            '(PPT) Permiso de Proteccion Temporal',
                            '(PEP) Permiso Especial de Permanencia') not null,
    numero_documento bigint not null,
    usuario_id_rol int not null,
    primer_nombre varchar(20) not null,
    segundo_nombre varchar(20) null,
    primer_apellido varchar(20) not null,
    segundo_apellido varchar(20) null,
    email_usuario varchar(120) not null,
    telefono_usuario bigint not null,
    direccion_usuario varchar(120) not null,
    password_usuario varchar(10) not null,
    confirmacion_password varchar(10) not null,
    estado_usuario tinyint not null default 1, 

    primary key (numero_documento, usuario_id_rol),

    constraint usuario_fk_rol foreign key (usuario_id_rol) references rol (id_rol)
);

create table empresa (
    id_empresa bigint not null,
    nit_empresa bigint,
    nombre_comercial varchar(50) not null,
    razon_social varchar(150) not null,
    telefono_empresa bigint not null,
    email_empresa varchar(120) not null,
    direccion_empresa varchar(120) not null,
    estado_empresa tinyint not null default 1,

    primary key (nit_empresa)
);

create table representante_empresa (
    id_representante_empresa bigint auto_increment,
    representante_numero_documento bigint not null,
    representante_nit_empresa bigint not null,
    estado_representante_empresa tinyint not null default 1,
    cargo_representante varchar(50) not null,
    estado_representante tinyint not null default 1,

    primary key (id_representante_empresa, representante_nit_empresa),

    constraint representante_fk_empresa foreign key (representante_nit_empresa) references empresa (nit_empresa),
    constraint representante_fk_usuario foreign key (representante_numero_documento) references usuario (numero_docuemnto)
);

create table oferta_empleo (
    id_oferta_empleo bigint auto_increment,
    nit_empresa bigint not null,
    nombre_oferta varchar(120) not null,
    descripcion_oferta varchar(400) not null,
    requisitos_oferta varchar(200) not null,
    jornada_laboral enum (  "Tiempo Completo",
                            "Medio Tiempo",
                            "Por Horas") not null,
    tiempo_horas int null,
    tipo_contrato enum ("Termino Fijo",
                        "Termino Indefinido",
                        "Prestacion De Servicios",
                        "Obra O Labor",
                        "Aprendizaje") not null,
    fecha_oferta_creacion timestamp default current_timestamp, 
    fecha_oferta_cierre datetime not null,
    salario_oferta bigint not null,
    direccion_oferta varchar(125) not null,
    estado_oferta tinyint not null default 1,

    primary key (id_oferta_empleo, nit_empresa),

    constraint oferta_fk_empresa foreign key (nit_empresa) references empresa (nit_empresa)
);

create table postulacion (
    id_postulacion bigint auto_increment,
    postulacion_numero_documento bigint not null,
    postulacion_id_oferta bigint not null,
    fecha_postulacion timestamp default current_timestamp, 
    estado_postulacion tinyint not null default 1,

    primary key (id_postulacion),

    constraint postulacion_fk_usuario foreign key (postulacion_numero_documento) references usuario (numero_documento),
    constraint postulacion_fk_oferta foreign key (postulacion_id_oferta) references oferta_empleo (id_oferta_empleo)
);

create table hoja_vida (
	id_hoja_vida bigint auto_increment,
    hoja_vida_numero_documento bigint,
    archivo_hoja_vida longblob not null,
    certificado longblob not null,
    estado_hoja_vida tinyint not null default 1,
    
    primary key (id_hoja_vida, hoja_vida_numero_documento),
    
    constraint hoja_vida_fk_usuario foreign key (hoja_vida_numero_documento) references usuario (numero_documento)
);

