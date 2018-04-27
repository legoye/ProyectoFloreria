CREATE DATABASE `floreria`;

DROP TABLE IF EXISTS `floreria`.`Producto_has_Categoria_Flores` ;
DROP TABLE IF EXISTS `floreria`.`Producto` ;
DROP TABLE IF EXISTS `floreria`.`Categoria_Flores` ;

-- -----------------------------------------------------
-- Table `floreria`.`Producto`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `floreria`.`Producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `precio` VARCHAR(45) NULL,
  `imagen` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `disponibilidad` VARCHAR(45) NULL,
  `tamaño` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `floreria`.`Categoria_Flores`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `floreria`.`Categoria_Flores` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `floreria`.`Producto_has_Categoria_Flores`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `floreria`.`Producto_has_Categoria_Flores` (
  `Producto_id` INT NOT NULL,
  `Categoria_Flores_id` INT NOT NULL,
  PRIMARY KEY (`Producto_id`, `Categoria_Flores_id`),
  INDEX `fk_Producto_has_Categoria_Flores_Categoria_Flores1_idx` (`Categoria_Flores_id` ASC),
  INDEX `fk_Producto_has_Categoria_Flores_Producto_idx` (`Producto_id` ASC),
  CONSTRAINT `fk_Producto_has_Categoria_Flores_Producto`
    FOREIGN KEY (`Producto_id`)
    REFERENCES `floreria`.`Producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Categoria_Flores_Categoria_Flores1`
    FOREIGN KEY (`Categoria_Flores_id`)
    REFERENCES `floreria`.`Categoria_Flores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO `floreria`.`categoria_flores` (`id`, `nombre`) VALUES ('7', 'Rosas');
INSERT INTO `floreria`.`categoria_flores` (`id`, `nombre`) VALUES ('8', 'Girasoles');
INSERT INTO `floreria`.`categoria_flores` (`id`, `nombre`) VALUES ('1', 'Hortensias');
INSERT INTO `floreria`.`categoria_flores` (`id`, `nombre`) VALUES ('2', 'Tulipanes');
INSERT INTO `floreria`.`categoria_flores` (`id`, `nombre`) VALUES ('3', 'Dalias');
INSERT INTO `floreria`.`categoria_flores` (`id`, `nombre`) VALUES ('4', 'Lirios');
INSERT INTO `floreria`.`categoria_flores` (`id`, `nombre`) VALUES ('5', 'Claveles');
INSERT INTO `floreria`.`categoria_flores` (`id`, `nombre`) VALUES ('6', 'Cannas índicas');

INSERT INTO `floreria`.`producto` (`nombre`, `descripcion`, `precio`, `imagen`, `tipo`, `disponibilidad`, `tamaño`) VALUES ('Arreglo 1', 'el mejor arreglo para tus fiestas', '60', 'img/imagen1.png', 'Centro', 'Fiestas', 'mediano');

INSERT INTO `floreria`.`producto_has_categoria_flores` (`Producto_id`, `Categoria_Flores_id`) VALUES ('1', '1');
INSERT INTO `floreria`.`producto_has_categoria_flores` (`Producto_id`, `Categoria_Flores_id`) VALUES ('1', '4');
INSERT INTO `floreria`.`producto_has_categoria_flores` (`Producto_id`, `Categoria_Flores_id`) VALUES ('1', '6');
INSERT INTO `floreria`.`producto_has_categoria_flores` (`Producto_id`, `Categoria_Flores_id`) VALUES ('1', '7');




