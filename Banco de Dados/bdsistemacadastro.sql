-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Mar-2023 às 13:46
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdsistemacadastro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `CLI_ID` int(11) NOT NULL,
  `CLI_NOME` varchar(50) NOT NULL,
  `CLI_CPF` varchar(15) NOT NULL,
  `CLI_FONE` varchar(15) NOT NULL,
  `CLI_DTNASC` date NOT NULL,
  `CLI_CEP` varchar(10) NOT NULL,
  `CLI_LONGRADOURO` varchar(100) NOT NULL,
  `CLI_BAIRRO` varchar(30) NOT NULL,
  `CLI_CIDADE` varchar(30) NOT NULL,
  `CLI_ESTADO` varchar(30) NOT NULL,
  `CLI_COMPLEMENTO` varchar(50) NOT NULL,
  `CLI_SEXO` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`CLI_ID`, `CLI_NOME`, `CLI_CPF`, `CLI_FONE`, `CLI_DTNASC`, `CLI_CEP`, `CLI_LONGRADOURO`, `CLI_BAIRRO`, `CLI_CIDADE`, `CLI_ESTADO`, `CLI_COMPLEMENTO`, `CLI_SEXO`) VALUES
(2, 'Edina Gomes de Araujo Silva', '90053109104', '62991131504', '1978-10-20', '74303020', 'Rua C75', 'Setor Sudoeste', 'Goiânia', 'GO', '', 'F'),
(5, 'Matheus Henrique', '70392778165', '62993025332', '1999-09-06', '74303020', 'Rua C75 QD 181', 'Setor Sudoeste', 'Goiânia', 'GO', 'Casa 1', 'M'),
(6, 'Regina Carla Eloá da Rosa', '68132310063', '21983105041', '1947-03-16', '26171140', 'Rua Urucai', 'Pauline', 'Belford Roxo', 'RJ', '', 'F');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `USU_ID` int(11) NOT NULL,
  `USU_LOGIN` varchar(30) NOT NULL,
  `USU_SENHA` varchar(30) NOT NULL,
  `USU_STATUS` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`USU_ID`, `USU_LOGIN`, `USU_SENHA`, `USU_STATUS`) VALUES
(1, 'admin', 'admin', 'S'),
(7, 'matheus.haraujo', '123', 'S'),
(8, 'danilo', '1234', 'N');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CLI_ID`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USU_ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `CLI_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `USU_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
