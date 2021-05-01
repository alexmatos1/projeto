-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Maio-2021 às 18:17
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_projeto`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `adicionar` (IN `sp_cod_departamento` INT, IN `sp_nome_responsavel` VARCHAR(100), IN `sp_login_responsavel` VARCHAR(100), IN `sp_email_responsavel` VARCHAR(100))  BEGIN
    IF EXISTS(SELECT * FROM departamento WHERE cod_departamento > 0) THEN
  UPDATE departamento SET nome_responsavel = sp_nome_responsavel, login_responsavel = sp_login_responsavel, email_responsavel = sp_email_responsavel;
 ELSE
  INSERT INTO departamento (cod_departamento, nome_responsavel, login_responsavel, email_responsavel) VALUES ( sp_cod_departamento, sp_nome_responsavel, sp_login_responsavel, sp_email_responsavel );
 END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `cod_departamento` int(10) NOT NULL,
  `nome_responsavel` varchar(100) NOT NULL,
  `login_responsavel` varchar(100) NOT NULL,
  `email_responsavel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`cod_departamento`, `nome_responsavel`, `login_responsavel`, `email_responsavel`) VALUES
(2, 'Alex Matos', 'alex.matos', 'alex@teste');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`cod_departamento`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `cod_departamento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
