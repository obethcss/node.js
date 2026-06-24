CREATE DATABASE IF NOT EXISTS control_escolar;

USE control_escolar;

CREATE TABLE CEstados (
    idEstado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Genero (
    idGenero INT AUTO_INCREMENT PRIMARY KEY,
    genero VARCHAR(100) NOT NULL
);

CREATE TABLE CCarreras (
    idCarrera INT AUTO_INCREMENT PRIMARY KEY,
    nombreCarreras VARCHAR(50),
    estatus BOOLEAN DEFAULT TRUE
);

CREATE TABLE CTipoPersonal (
    idTipo INT AUTO_INCREMENT PRIMARY KEY,
    personal VARCHAR(100)
);

CREATE TABLE CMunicipio (
    idMunicipio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    idEstado INT,

    FOREIGN KEY (idEstado)
    REFERENCES CEstados(idEstado)
);

CREATE TABLE CLocalidad (
    idLocalidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    idMunicipio INT,

    FOREIGN KEY (idMunicipio)
    REFERENCES CMunicipio(idMunicipio)
);

CREATE TABLE CDatosEscuela (
    cct VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(10),
    email VARCHAR(100),
    calle VARCHAR(80),
    numE INT,
    numI INT,
    cp INT
);

CREATE TABLE CDatosPersonales (
    idDatosP INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(50),
    apellidoP VARCHAR(50),
    apellidoM VARCHAR(50),

    fechaNacimiento DATE,
    telefono VARCHAR(20),
    email VARCHAR(100),
    curp VARCHAR(18),

    calle VARCHAR(80),
    numE INT,
    numI INT,
    cp INT,

    idLocalidad INT,
    idMunicipio INT,
    idEstado INT,
    idGenero INT,

    FOREIGN KEY (idEstado)
    REFERENCES CEstados(idEstado),

    FOREIGN KEY (idMunicipio)
    REFERENCES CMunicipio(idMunicipio),

    FOREIGN KEY (idLocalidad)
    REFERENCES CLocalidad(idLocalidad),

    FOREIGN KEY (idGenero)
    REFERENCES Genero(idGenero)
);

CREATE TABLE CAlumnos (
    matricula VARCHAR(20) PRIMARY KEY,

    idCarrera INT,
    idDatosP INT,

    status CHAR(1),

    FOREIGN KEY (idCarrera)
    REFERENCES CCarreras(idCarrera),

    FOREIGN KEY (idDatosP)
    REFERENCES CDatosPersonales(idDatosP)
);

CREATE TABLE CPersonal (
    idPersonal INT AUTO_INCREMENT PRIMARY KEY,

    idDatosP INT,
    idTipo INT,

    claveEmp VARCHAR(10),
    status BOOLEAN,

    FOREIGN KEY (idDatosP)
    REFERENCES CDatosPersonales(idDatosP),

    FOREIGN KEY (idTipo)
    REFERENCES CTipoPersonal(idTipo)
);

CREATE TABLE CIntendencia (
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(50),
    telefono VARCHAR(10),

    area VARCHAR(50),
    turno VARCHAR(30)
);

CREATE TABLE CHorarios (
    idHorario INT AUTO_INCREMENT PRIMARY KEY,

    dia VARCHAR(10),

    horaInicio TIME,
    horaFin TIME,

    aula VARCHAR(50)
);

CREATE TABLE CAsignaturas (
    idAsignatura INT AUTO_INCREMENT PRIMARY KEY,

    nombresMaterias VARCHAR(100),

    horasTotales INT
);

SHOW TABLES;