/*crea una BD con DATABASE*/
CREATE DATABASE ventas_jugos;

/*crea una BD con SCHEMA*/
CREATE SCHEMA IF NOT EXISTS ventas_jugos2;

/*eliminar BD*/
DROP DATABASE ventas_jugos2;

/*crea una BD con SCHEMA definiendo el charset*/
CREATE SCHEMA IF NOT EXISTS ventas_jugos2 DEFAULT
CHARSET utf32;
