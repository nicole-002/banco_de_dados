-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Set-2025 às 14:10
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estacionamento`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `andar`
--

CREATE TABLE `andar` (
  `cod_lugar` int(11) NOT NULL,
  `andar` varchar(20) DEFAULT NULL,
  `capacidade` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `andar`
--

INSERT INTO `andar` (`cod_lugar`, `andar`, `capacidade`) VALUES
(1, 'Térreo', 50),
(2, '1º Andar', 30),
(3, '2º Andar', 25);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` varchar(14) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `data_nasc` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `nome`, `data_nasc`) VALUES
('12345678900', 'Ana Paula', '1990-05-12 00:00:00'),
('23456789011', 'Carlos Silva', '1985-11-30 00:00:00'),
('34567890122', 'Marina Lopes', '1992-08-22 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estaciona`
--

CREATE TABLE `estaciona` (
  `cod_estaciona` int(11) NOT NULL,
  `data_entrada` datetime DEFAULT NULL,
  `hora_entrada` datetime DEFAULT NULL,
  `data_saida` datetime DEFAULT NULL,
  `hora_saida` datetime DEFAULT NULL,
  `cod_veiculo` int(11) DEFAULT NULL,
  `cod_lugar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `estaciona`
--

INSERT INTO `estaciona` (`cod_estaciona`, `data_entrada`, `hora_entrada`, `data_saida`, `hora_saida`, `cod_veiculo`, `cod_lugar`) VALUES
(1, '2025-09-01 00:00:00', '2025-09-01 08:00:00', '2025-09-01 00:00:00', '2025-09-01 12:00:00', 1, 1),
(2, '2025-09-01 00:00:00', '2025-09-01 09:30:00', '2025-09-01 00:00:00', '2025-09-01 11:45:00', 2, 2),
(3, '2025-09-02 00:00:00', '2025-09-02 07:15:00', '2025-09-02 00:00:00', '2025-09-02 10:00:00', 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo`
--

CREATE TABLE `modelo` (
  `cod_modelo` int(11) NOT NULL,
  `modelo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `modelo`
--

INSERT INTO `modelo` (`cod_modelo`, `modelo`) VALUES
(1, 'Civic'),
(2, 'Gol'),
(3, 'Corolla'),
(4, 'Uno'),
(5, 'Yaris');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `cod_veiculo` int(11) NOT NULL,
  `placa` varchar(8) DEFAULT NULL,
  `cor` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `cod_modelo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`cod_veiculo`, `placa`, `cor`, `cpf`, `cod_modelo`) VALUES
(1, 'ABC1234', 'Preto', '12345678900', 1),
(2, 'DEF5678', 'prata', '23456789011', 2),
(3, 'GHI9012', 'Vermelho', '34567890122', 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `andar`
--
ALTER TABLE `andar`
  ADD PRIMARY KEY (`cod_lugar`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices para tabela `estaciona`
--
ALTER TABLE `estaciona`
  ADD PRIMARY KEY (`cod_estaciona`),
  ADD KEY `cod_veiculo` (`cod_veiculo`),
  ADD KEY `cod_lugar` (`cod_lugar`);

--
-- Índices para tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`cod_modelo`);

--
-- Índices para tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`cod_veiculo`),
  ADD KEY `cpf` (`cpf`),
  ADD KEY `cod_modelo` (`cod_modelo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `andar`
--
ALTER TABLE `andar`
  MODIFY `cod_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `estaciona`
--
ALTER TABLE `estaciona`
  MODIFY `cod_estaciona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `cod_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `cod_veiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `estaciona`
--
ALTER TABLE `estaciona`
  ADD CONSTRAINT `estaciona_ibfk_1` FOREIGN KEY (`cod_veiculo`) REFERENCES `veiculo` (`cod_veiculo`),
  ADD CONSTRAINT `estaciona_ibfk_2` FOREIGN KEY (`cod_lugar`) REFERENCES `andar` (`cod_lugar`);

--
-- Limitadores para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `cliente` (`cpf`),
  ADD CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`cod_modelo`) REFERENCES `modelo` (`cod_modelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
