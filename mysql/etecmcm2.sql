-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Jun-2025 às 03:44
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `etecmcm2`
--
CREATE DATABASE IF NOT EXISTS `etecmcm2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `etecmcm2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome_cat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_cat`) VALUES
(1, 'Limpeza'),
(2, 'Enlatados'),
(3, 'Frios'),
(4, 'Higiene'),
(5, 'Açougue'),
(6, 'Laticínios'),
(7, 'Bebidas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `quant` int(11) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `unidade_medida` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome`, `preco`, `quant`, `marca`, `id_categoria`, `unidade_medida`) VALUES
(1, 'Sabão em pó', 30.50, 50, 'OMO', 1, 'un'),
(2, 'Detergente', 3.50, 10, 'Ypê', 1, 'un'),
(4, 'Desinfetante', 10.80, 30, 'Búfalo', 1, 'un'),
(5, 'Pasta de dente', 2.50, 120, 'Colgate', 4, NULL),
(6, 'Sabonete líquido', 7.50, 50, 'Lux', 4, NULL),
(7, 'Linguiça temperada', 22.90, 30, 'Sadia', 5, 'kg'),
(8, 'Costela bovina', 36.90, 30, 'Friboi', 5, 'kg'),
(9, 'Leite fermentado', 7.90, 40, 'Chamyto', 6, 'ml'),
(10, 'Iogurte', 12.90, 40, 'Chamyto', 6, 'ml'),
(11, 'Refrigerante', 10.50, 50, 'Fanta', 7, 'ml'),
(12, 'Sardinha', 5.90, 49, 'Coqueiro', 2, 'gr'),
(13, 'Seleta de legumes', 4.90, 60, 'Vitarela', 2, 'gr'),
(14, 'Milho', 4.90, 30, 'Bonara', 2, 'gr'),
(15, 'Mussarela', 21.90, 20, 'Presidente', 3, 'gr'),
(16, 'Presunto', 18.98, 19, 'Sadia', 3, 'gr'),
(17, 'Queijo fresco', 15.65, 4, 'Quatá', 3, 'gr'),
(18, 'Escova de dente', 7.50, 20, 'Condor', 4, 'uni'),
(19, 'Peixe salmão', 89.90, 22, 'Swift', 5, 'kl'),
(20, 'Suco de uva', 15.90, 35, 'Aurora', 7, 'ml'),
(21, 'Chá gelado sabir lichia', 5.90, 39, 'Yai', 7, 'ml');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
