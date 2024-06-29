-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/06/2024 às 00:06
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sigebd`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `id_aluno` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_funcao` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `data_nasc` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cel` varchar(20) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `estado_civil` varchar(10) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cidade` varchar(60) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `responsavel` varchar(150) DEFAULT NULL,
  `cel_resp` varchar(20) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `status` varchar(1) DEFAULT 'A',
  `data_cad` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aula`
--

CREATE TABLE `aula` (
  `id_aula` int(11) NOT NULL,
  `data` date NOT NULL DEFAULT curdate(),
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `data_cad` date DEFAULT NULL COMMENT 'Data do cadastro',
  `dtahralteracao` datetime DEFAULT NULL COMMENT 'Data da ultima alteração',
  `usualteracao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`, `data_cad`, `dtahralteracao`, `usualteracao`) VALUES
(1, 'Café da Manhã', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL,
  `id_faixa_etaria` int(11) DEFAULT NULL,
  `classe` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `data_cad` date DEFAULT curdate(),
  `dtahralteracao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usualteracao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrada`
--

CREATE TABLE `entrada` (
  `id_entrada` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `data_entrada` date NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `faixa_etaria`
--

CREATE TABLE `faixa_etaria` (
  `id_faixa_etaria` int(11) NOT NULL,
  `faixa_etaria` varchar(150) NOT NULL,
  `status` varchar(1) NOT NULL,
  `data_cad` date DEFAULT curdate(),
  `dtahralteracao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usualteracao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `faixa_etaria`
--

INSERT INTO `faixa_etaria` (`id_faixa_etaria`, `faixa_etaria`, `status`, `data_cad`, `dtahralteracao`, `usualteracao`) VALUES
(1, 'Berçário', 'A', '2024-06-28', NULL, NULL),
(2, 'Maternal', 'A', '2024-06-28', NULL, NULL),
(3, 'Jardim de Infância', 'A', '2024-06-28', NULL, NULL),
(4, 'Primários', 'A', '2024-06-28', NULL, NULL),
(5, 'Juniores', 'A', '2024-06-28', NULL, NULL),
(6, 'Pré Adolescentes', 'A', '2024-06-28', NULL, NULL),
(7, 'Adolescentes', 'A', '2024-06-28', NULL, NULL),
(8, 'Jovenis', 'A', '2024-06-28', NULL, NULL),
(9, 'Jovens', 'A', '2024-06-28', NULL, NULL),
(10, 'Adultos', 'A', '2024-06-28', NULL, NULL),
(11, 'Coordenação(Sec./Superintendentes)', 'A', '2024-06-28', NULL, NULL),
(12, 'Discipulados', 'A', '2024-06-28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcao`
--

CREATE TABLE `funcao` (
  `id_funcao` int(11) NOT NULL,
  `funcao` varchar(150) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `data_cad` date DEFAULT curdate(),
  `dtahralteracao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usualteracao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcao`
--

INSERT INTO `funcao` (`id_funcao`, `funcao`, `status`, `data_cad`, `dtahralteracao`, `usualteracao`) VALUES
(1, 'Membro', 'A', '2024-06-28', NULL, NULL),
(2, 'Presbítero', 'A', '2024-06-28', NULL, NULL),
(3, 'Diácono', 'A', '2024-06-28', NULL, NULL),
(4, 'Pastor', 'A', '2024-06-28', NULL, NULL),
(5, 'Cooperador', 'A', '2024-06-28', NULL, NULL),
(6, 'Evangelista', 'A', '2024-06-28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `lancamento`
--

CREATE TABLE `lancamento` (
  `id_lancamento` int(11) NOT NULL,
  `id_aluno` int(11) DEFAULT NULL,
  `id_aula` int(11) DEFAULT NULL,
  `presente` char(1) DEFAULT NULL CHECK (`presente` in ('P','F')),
  `qtde_biblia` int(11) DEFAULT NULL,
  `qtde_revista` int(11) DEFAULT NULL,
  `qtd_visitante` int(11) DEFAULT NULL,
  `valor_oferta` decimal(10,2) DEFAULT NULL,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `saida`
--

CREATE TABLE `saida` (
  `id_saida` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `data_saida` date NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nivel` varchar(10) DEFAULT NULL,
  `data_alteracao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `senha`, `nivel`, `data_alteracao`) VALUES
(1, 'Anderson Siqueira', 'contato@andersonls.com.br', '41526389', '1', '2022-03-29 09:58:15');

--
-- Acionadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `TB_USUARIO_INSERT` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN 
    SET NEW.data_alteracao = CURRENT_TIMESTAMP;    
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TB_USUARIO_UPDATE` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN 
    SET NEW.data_alteracao = CURRENT_TIMESTAMP;    
  END
$$
DELIMITER ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id_aluno`),
  ADD KEY `fk_aluno_classe1_idx` (`id_classe`),
  ADD KEY `fk_aluno_funcao2_idx` (`id_funcao`);

--
-- Índices de tabela `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`id_aula`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`);

--
-- Índices de tabela `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`id_entrada`);

--
-- Índices de tabela `faixa_etaria`
--
ALTER TABLE `faixa_etaria`
  ADD PRIMARY KEY (`id_faixa_etaria`),
  ADD UNIQUE KEY `faixa_etaria` (`faixa_etaria`);

--
-- Índices de tabela `funcao`
--
ALTER TABLE `funcao`
  ADD PRIMARY KEY (`id_funcao`);

--
-- Índices de tabela `lancamento`
--
ALTER TABLE `lancamento`
  ADD PRIMARY KEY (`id_lancamento`),
  ADD KEY `id_aluno` (`id_aluno`),
  ADD KEY `id_aula` (`id_aula`);

--
-- Índices de tabela `saida`
--
ALTER TABLE `saida`
  ADD PRIMARY KEY (`id_saida`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `aula`
--
ALTER TABLE `aula`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `entrada`
--
ALTER TABLE `entrada`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `faixa_etaria`
--
ALTER TABLE `faixa_etaria`
  MODIFY `id_faixa_etaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `funcao`
--
ALTER TABLE `funcao`
  MODIFY `id_funcao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `lancamento`
--
ALTER TABLE `lancamento`
  MODIFY `id_lancamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `saida`
--
ALTER TABLE `saida`
  MODIFY `id_saida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_aluno_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aluno_funcao2` FOREIGN KEY (`id_funcao`) REFERENCES `funcao` (`id_funcao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `fk_id_faixa_etaria` FOREIGN KEY (`id_faixa_etaria`) REFERENCES `faixa_etaria` (`id_faixa_etaria`);

--
-- Restrições para tabelas `lancamento`
--
ALTER TABLE `lancamento`
  ADD CONSTRAINT `lancamento_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
  ADD CONSTRAINT `lancamento_ibfk_2` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id_aula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
