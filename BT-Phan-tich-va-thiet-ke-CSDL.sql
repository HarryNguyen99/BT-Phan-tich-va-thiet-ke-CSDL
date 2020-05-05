CREATE SCHEMA IF NOT EXISTS `Ban oto` DEFAULT CHARACTER SET utf8 ;
USE `Ban oto` ;

CREATE TABLE IF NOT EXISTS `Ban oto`.`Khách hàng` (
  `maKH` INT NOT NULL,
  `tenKH` VARCHAR(50) NOT NULL,
  `sdt` INT NOT NULL,
  `diachi` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`maKH`));


CREATE TABLE IF NOT EXISTS `Ban oto`.`Loại sản phẩm` (
  `maLSP` INT NOT NULL,
  `mota` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`maLSP`));


CREATE TABLE IF NOT EXISTS `Ban oto`.`Sản phẩm` (
  `maSP` INT NOT NULL,
  `tenSP` VARCHAR(255) NOT NULL,
  `nhacungcap` VARCHAR(45) NOT NULL,
  `soluongkho` INT NOT NULL,
  `gianhap` INT NOT NULL,
  `giaban` INT NOT NULL,
  `Loại sản phẩm_maLSP` INT NOT NULL,
  PRIMARY KEY (`maSP`),
  INDEX `fk_Sản phẩm_Loại sản phẩm1_idx` (`Loại sản phẩm_maLSP` ASC),
  CONSTRAINT `fk_Sản phẩm_Loại sản phẩm1`
    FOREIGN KEY (`Loại sản phẩm_maLSP`)
    REFERENCES `Ban oto`.`Loại sản phẩm` (`maLSP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `Ban oto`.`Đơn hàng` (
  `maDH` INT NOT NULL,
  `ngaymua` DATE NOT NULL,
  `ngayyeucauGH` DATE NOT NULL,
  `ngayGHthucte` DATE NOT NULL,
  `soluongDH` INT NOT NULL,
  `dongia` INT NOT NULL,
  `Khách hàng_maKH` INT NOT NULL,
  PRIMARY KEY (`maDH`),
  INDEX `fk_Đơn hàng_Khách hàng_idx` (`Khách hàng_maKH` ASC),
  CONSTRAINT `fk_Đơn hàng_Khách hàng`
    FOREIGN KEY (`Khách hàng_maKH`)
    REFERENCES `Ban oto`.`Khách hàng` (`maKH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `Ban oto`.`Thanh toán` (
  `maTT` INT NOT NULL,
  `ngayTT` DATE NOT NULL,
  `sotien` INT NOT NULL,
  `Khách hàng_maKH` INT NOT NULL,
  PRIMARY KEY (`maTT`),
  INDEX `fk_Thanh toán_Khách hàng1_idx` (`Khách hàng_maKH` ASC),
  CONSTRAINT `fk_Thanh toán_Khách hàng1`
    FOREIGN KEY (`Khách hàng_maKH`)
    REFERENCES `Ban oto`.`Khách hàng` (`maKH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `Ban oto`.`Văn phòng` (
  `maVP` INT NOT NULL,
  `diachi` VARCHAR(255) NOT NULL,
  `sdt` INT NOT NULL,
  `quocgia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`maVP`));


CREATE TABLE IF NOT EXISTS `Ban oto`.`Nhân viên` (
  `maNV` INT NOT NULL,
  `tenNV` VARCHAR(255) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `tenCV` VARCHAR(45) NOT NULL,
  `Khách hàng_maKH` INT NOT NULL,
  `maNVQL` VARCHAR(45) NOT NULL,
  `Nhân viên_maNV` INT NOT NULL,
  `Văn phòng_maVP` INT NOT NULL,
  PRIMARY KEY (`maNV`),
  INDEX `fk_Nhân viên_Khách hàng1_idx` (`Khách hàng_maKH` ASC),
  INDEX `fk_Nhân viên_Nhân viên1_idx` (`Nhân viên_maNV` ASC),
  INDEX `fk_Nhân viên_Văn phòng1_idx` (`Văn phòng_maVP` ASC),
  CONSTRAINT `fk_Nhân viên_Khách hàng1`
    FOREIGN KEY (`Khách hàng_maKH`)
    REFERENCES `Ban oto`.`Khách hàng` (`maKH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nhân viên_Nhân viên1`
    FOREIGN KEY (`Nhân viên_maNV`)
    REFERENCES `Ban oto`.`Nhân viên` (`maNV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nhân viên_Văn phòng1`
    FOREIGN KEY (`Văn phòng_maVP`)
    REFERENCES `Ban oto`.`Văn phòng` (`maVP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `Ban oto`.`chi tiet don hang` (
  `maDH` INT NOT NULL,
  `mSP` INT NOT NULL,
  `dongia` INT NOT NULL,
  `soluong` INT NOT NULL,
  PRIMARY KEY (`maDH`, `mSP`),
  INDEX `maSP_idx` (`mSP` ASC),
  CONSTRAINT `maDH`
    FOREIGN KEY (`maDH`)
    REFERENCES `Ban oto`.`Đơn hàng` (`maDH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `maSP`
    FOREIGN KEY (`mSP`)
    REFERENCES `Ban oto`.`Sản phẩm` (`maSP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);