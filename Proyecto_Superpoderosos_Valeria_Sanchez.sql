DROP DATABASE proyecto;
-- Creación de la base de datos nueva con el nombre de proyecto
CREATE DATABASE IF NOT EXISTS proyecto;

-- Uso la base de datos 
USE proyecto;

-- Creación de la tabla superpoderosos --
CREATE TABLE IF NOT EXISTS superpoderosos (
    id_superpoderosos INT PRIMARY KEY AUTO_INCREMENT, -- Este defino como el PK
    nombre VARCHAR(30) not null -- le agrego not null porque no quiero nulos aca
);

-- Creación de la tabla tipo -
CREATE TABLE IF NOT EXISTS tipo (
    id_tipo INT PRIMARY KEY AUTO_INCREMENT, -- PK
    descripcion VARCHAR(30) 
);

-- Creación de la tabla superpoder
CREATE TABLE IF NOT EXISTS superpoder (
    id_superpoder INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(30)
);


-- Creación de la tabla nivel_poder
CREATE TABLE IF NOT EXISTS nivel_poder (
    id_nivel_poder INT PRIMARY KEY AUTO_INCREMENT,
    nivel INT not null
);


-- Creación de la tabla actividad+_delictiva
CREATE TABLE IF NOT EXISTS actividad_delictiva (
    id_actividad INT PRIMARY KEY AUTO_INCREMENT,
    tipo_actividad VARCHAR(30),
    monto_recaudado decimal(12,2),
    id_superpoderosos INT,
    FOREIGN KEY (id_superpoderosos) REFERENCES superpoderosos(id_superpoderosos) -- Le digo que id_superopodersosos en esta tabla es un FK que hace referencia a el PK id_superpoderos de la tabla superpoderosos
); -- Puedo poner aca el FK porque la tabla superpodersos fue creada arriba, sino no podria


-- Creación de la tabla patrocinio
CREATE TABLE IF NOT EXISTS patrocinio (
    id_patrocinio INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30),
    monto decimal(12,2),
    fecha_inicio date,
    fecha_fin date,
    id_superpoderosos INT,
    FOREIGN KEY (id_superpoderosos) REFERENCES superpoderosos(id_superpoderosos)
);

-- Creación de la tabla misiones
CREATE TABLE IF NOT EXISTS misiones (
    id_misiones INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30),
	descripcion VARCHAR(60),
    estado VARCHAR(20),
	id_superpoderosos INT,
    FOREIGN KEY (id_superpoderosos) REFERENCES superpoderosos(id_superpoderosos)
);

-- Creación de la tabla enfrentamientos
CREATE TABLE IF NOT EXISTS enfrentamientos (
    id_enfrentamiento INT PRIMARY KEY AUTO_INCREMENT,
	fecha_enfrentamiento date,
	id_heroe INT,
    id_villano INT,
    id_ganador INT,
    FOREIGN KEY (id_heroe) REFERENCES superpoderosos(id_superpoderosos),
	FOREIGN KEY (id_villano) REFERENCES superpoderosos(id_superpoderosos),
	FOREIGN KEY (id_ganador) REFERENCES superpoderosos(id_superpoderosos)
);


-- Le agrego a la tabla superpoder el FK de id_nivel_poder que hace referencia a la tabla nivel_poder que cree luego
ALTER TABLE superpoder
ADD COLUMN id_nivel_poder INT,
ADD FOREIGN KEY (id_nivel_poder) REFERENCES nivel_poder(id_nivel_poder);

-- Le agrego a la tabla superpoder el FK de id_tipo que hace referencia a la tabla tipo que cree luego
ALTER TABLE superpoderosos
ADD COLUMN id_tipo INT,
ADD FOREIGN KEY (id_tipo) REFERENCES tipo(id_tipo),
ADD COLUMN id_superpoder INT,
ADD FOREIGN KEY (id_superpoder) REFERENCES superpoder(id_superpoder)

