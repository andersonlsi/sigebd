-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/07/2024 às 15:51
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
-- Banco de dados: `sigebd2`
--

DELIMITER $$
--
-- Funções
--
CREATE DEFINER=`root`@`localhost` FUNCTION `update_presenca_falta` (`id_aula` INT, `id_classe` INT) RETURNS INT(11)  BEGIN
    DECLARE presenca_count INT;
    DECLARE falta_count INT;
    
    SELECT COUNT(*) INTO presenca_count
    FROM presenca
    WHERE presenca.id_aula = id_aula AND presenca.id_classe = id_classe AND presente = 'P';
    
    SELECT COUNT(*) INTO falta_count
    FROM presenca
    WHERE presenca.id_aula = id_aula AND presenca.id_classe = id_classe AND presente = 'F';
    
    UPDATE aula_detalhe
    SET qtde_presenca = presenca_count, qtde_falta = falta_count
    WHERE aula_detalhe.id_aula = id_aula AND aula_detalhe.id_classe = id_classe;
    
    RETURN 0; -- Valor fictício de retorno
END$$

DELIMITER ;

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
  `numero` varchar(10) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cidade` varchar(60) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `responsavel` varchar(150) DEFAULT NULL,
  `cel_resp` varchar(20) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `status` varchar(1) DEFAULT 'A',
  `data_cad` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`id_aluno`, `id_classe`, `id_funcao`, `nome`, `data_nasc`, `email`, `cel`, `sexo`, `estado_civil`, `endereco`, `numero`, `estado`, `cidade`, `bairro`, `cep`, `responsavel`, `cel_resp`, `observacao`, `status`, `data_cad`) VALUES
(1, 4, 1, 'Anderson Lopes de Siqueira', '1988-07-30', 'contato@andersonls.com.br', '(16) 99291-1729', 'M', 'Casado(a)', 'Rua Edwirges de Carvalho Chain', '145', 'SP', 'Ribeirão Preto', 'Planalto Verde', '14056-130', '', '', 'Secretário da Escola Dominical.', 'A', '2024-06-28'),
(2, 4, 1, 'Angelica da Costa Moraes Siqueira', '1990-07-10', 'angelicamoraes@live.com', '(16) 99246-5337', 'F', 'Casado(a)', 'Rua Edwirges de Carvalho Chaim', NULL, 'SP', 'Ribeirão Preto', 'Planalto Verde', '14056-130', '', '', '', 'A', '2024-06-29'),
(3, 1, 1, 'Livia Moraes de Siqueira', '2017-07-02', '', '', 'F', 'Solteiro(a', 'Rua Edwirges de Carvalho Chaim', NULL, 'SP', 'Ribeirão Preto', 'Planalto Verde', '14056-130', '', '', '', 'A', '2024-07-03'),
(4, 1, 1, 'Eduardo Moraes de Siqueira', '2021-02-02', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-03'),
(5, 2, 1, 'Abigail', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(6, 4, 1, 'Adalberto', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(7, 4, 1, 'Adelma', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(8, 4, 1, 'Aldo', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(9, 2, 1, 'Ana', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(10, 4, 1, 'Ana(Esposa do Mauro)', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(11, 2, 1, 'Ana Clara', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(12, 1, 1, 'Asaf', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(13, 4, 1, 'André', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(14, 1, 1, 'Ayla', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(15, 1, 1, 'Bernard', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(16, 3, 1, 'Camila', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(17, 4, 1, 'Charla', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(18, 4, 1, 'Daiane', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(19, 4, 1, 'Danilo', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(20, 4, 1, 'Denis', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(21, 3, 1, 'Débora', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(22, 1, 1, 'Emanuely', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(23, 2, 1, 'Enzo', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(24, 2, 1, 'Esmael', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(25, 1, 1, 'Ester', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(26, 4, 2, 'Eudes Gomes', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(27, 4, 1, 'Fabiano Rodrigo', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(28, 3, 1, 'Fellipe', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(29, 4, 3, 'Genesis Cesar', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(30, 1, 1, 'Heitor', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(31, 3, 1, 'Ingrid', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(32, 2, 1, 'Isac', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(33, 4, 1, 'Jariane', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(34, 4, 1, 'Jessica', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(35, 4, 1, 'Joel', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(36, 4, 1, 'Josefa', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(37, 4, 4, 'José Gilson(Gil)', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(38, 3, 1, 'João Vitor', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(39, 4, 1, 'Jucelena', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(40, 3, 1, 'Junior', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(41, 2, 1, 'kalebe', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(42, 4, 1, 'Leiliane(Leila)', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(43, 4, 1, 'Lidiane', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(44, 1, 1, 'Lorena', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(45, 4, 1, 'Luzia', '0000-00-00', '', '', 'F', 'Víuvo(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(46, 4, 1, 'Luíza', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(47, 2, 1, 'Maria', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(48, 4, 1, 'Maria Antônia', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(49, 4, 1, 'Maria da Cruz(Cruizinha)', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(50, 4, 1, 'Maria do Rosário(Ruza)', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(51, 4, 1, 'Maria Francisca(Chiquinha)', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(52, 4, 1, 'Maria José', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(53, 4, 1, 'Marlene', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(54, 4, 1, 'Marlucia', '0000-00-00', '', '', 'F', 'Outros', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(55, 4, 1, 'Marta', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(56, 2, 1, 'Mateus', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(57, 4, 1, 'Mauro', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(58, 4, 1, 'Milton', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(59, 4, 1, 'Misael', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(60, 4, 1, 'Mizuta', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(61, 3, 1, 'Naseias', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(62, 2, 1, 'Nataly', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(63, 3, 1, 'Natam', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(64, 1, 1, 'Nicole', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(65, 3, 1, 'Noemy', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(66, 4, 2, 'Osmar', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(67, 4, 1, 'Patrícia', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(68, 2, 1, 'Pedro', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(69, 3, 1, 'Pedro', '0000-00-00', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(70, 4, 1, 'Rivonaldo', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(71, 4, 1, 'Ronaldo', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(72, 3, 1, 'Ruth', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(73, 2, 1, 'Sara', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(74, 3, 1, 'Sarah', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(75, 3, 1, 'Sofia', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(76, 2, 1, 'Sofia', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(77, 2, 1, 'Sophia', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(78, 4, 1, 'Tais', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(79, 4, 1, 'Telma', '0000-00-00', '', '', 'F', 'Outros', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(80, 4, 1, 'Valci', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(81, 4, 1, 'Vanuza', '0000-00-00', '', '', 'F', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(82, 4, 1, 'Vera Lúcia', '0000-00-00', '', '', 'F', 'Outros', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(83, 2, 1, 'Vitória', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(84, 4, 3, 'Wadley Kenniel', '0000-00-00', '', '', 'M', 'Casado(a)', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(85, 4, 1, 'Welida', '0000-00-00', '', '', 'F', 'Divorciado', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(86, 4, 1, 'Zenaide', '0000-00-00', '', '', 'F', 'Outros', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-05'),
(87, 2, 1, 'Stefany', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-07');

--
-- Acionadores `aluno`
--
DELIMITER $$
CREATE TRIGGER `TB_ALUNO_INSERT` BEFORE INSERT ON `aluno` FOR EACH ROW BEGIN
  SET NEW.data_cad = CURDATE();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aula`
--

CREATE TABLE `aula` (
  `id_aula` int(11) NOT NULL,
  `data_aula` date DEFAULT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aula`
--

INSERT INTO `aula` (`id_aula`, `data_aula`, `numero`) VALUES
(58, '2024-07-07', 1);

--
-- Acionadores `aula`
--
DELIMITER $$
CREATE TRIGGER `TR_AULA_DELETE` AFTER DELETE ON `aula` FOR EACH ROW BEGIN
    
  -- Deleta os registros da tabela presenca relacionados com a aula deletada
  DELETE FROM presenca
  WHERE id_aula = OLD.id_aula;
  
  -- Deleta os registros da tabela aula_detalhe relacionados com a aula deletada
  DELETE FROM aula_detalhe
  WHERE id_aula = OLD.id_aula;
  
  -- Deleta os registros da tabela entrada associados ao id_aula deletado
  DELETE FROM entrada WHERE id_aula = OLD.id_aula;
  
  -- Deleta o registro da tabela aula_geral associado ao id_aula deletado
    DELETE FROM aula_geral WHERE id_aula = OLD.id_aula;
  
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_AULA_INSERE` AFTER INSERT ON `aula` FOR EACH ROW BEGIN
    
  -- Insere na tabela presenca para todos os alunos
  INSERT INTO presenca (id_aula, id_classe, id_aluno, nome_aluno, presente)
  SELECT NEW.id_aula, id_classe, id_aluno, nome, 'F' 
  FROM aluno
  WHERE aluno.status = 'A'
  ORDER BY id_classe, nome;
  
  -- Insere na tabela aula_detalhe para cada classe associada à aula
  INSERT INTO aula_detalhe (id_aula, id_classe, qtde_matriculado, qtde_presenca, qtde_falta, qtde_biblia, qtde_revista, qtde_visitante, valor_oferta)
  SELECT NEW.id_aula, classe.id_classe, 
    (SELECT COUNT(*) FROM aluno WHERE aluno.id_classe = classe.id_classe AND aluno.status = 'A'), 
    0, 
    (SELECT COUNT(*) FROM aluno WHERE aluno.id_classe = classe.id_classe AND aluno.status = 'A'), 
    0, 0, 0, 0
  FROM classe
  WHERE classe.status = 'A'; -- Considerando apenas classes ativas
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aula_detalhe`
--

CREATE TABLE `aula_detalhe` (
  `id_aula` int(11) DEFAULT NULL,
  `id_classe` int(11) DEFAULT NULL,
  `qtde_matriculado` int(11) DEFAULT NULL,
  `qtde_presenca` int(11) DEFAULT 0,
  `qtde_falta` int(11) DEFAULT 0,
  `qtde_biblia` int(11) DEFAULT NULL,
  `qtde_revista` int(11) DEFAULT NULL,
  `qtde_visitante` int(11) DEFAULT NULL,
  `valor_oferta` decimal(10,2) DEFAULT NULL,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aula_detalhe`
--

INSERT INTO `aula_detalhe` (`id_aula`, `id_classe`, `qtde_matriculado`, `qtde_presenca`, `qtde_falta`, `qtde_biblia`, `qtde_revista`, `qtde_visitante`, `valor_oferta`, `observacao`) VALUES
(58, 1, 10, 0, 10, 0, 0, 0, 0.00, NULL),
(58, 2, 16, 0, 16, 0, 0, 0, 0.00, NULL),
(58, 3, 13, 0, 13, 0, 0, 0, 0.00, NULL),
(58, 4, 48, 0, 48, 0, 0, 0, 0.00, NULL);

--
-- Acionadores `aula_detalhe`
--
DELIMITER $$
CREATE TRIGGER `TR_AULA_DETALHE_INSERT` AFTER INSERT ON `aula_detalhe` FOR EACH ROW BEGIN
  -- Verifica se o novo valor de valor_oferta não é nulo ou 0.00
  IF NEW.valor_oferta IS NOT NULL AND NEW.valor_oferta != 0.00 THEN
    -- Insere um novo registro na tabela entrada
    INSERT INTO entrada (id_aula, id_classe, titulo, categoria, data_entrada, valor)
    VALUES (NEW.id_aula, NEW.id_classe, 'Oferta EBD', 'Oferta Por Classe', (SELECT data_aula FROM aula WHERE id_aula = NEW.id_aula), NEW.valor_oferta);
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_AULA_DETALHE_UPDATE` AFTER UPDATE ON `aula_detalhe` FOR EACH ROW BEGIN
  -- Verifica se o novo valor de valor_oferta não é nulo ou 0.00
  IF NEW.valor_oferta IS NOT NULL AND NEW.valor_oferta != 0.00 THEN
    -- Verifica se já existe um registro na tabela entrada para o mesmo id_aula e id_classe
    IF EXISTS (SELECT 1 FROM entrada WHERE id_aula = NEW.id_aula AND id_classe = NEW.id_classe AND categoria = 'Oferta Por Classe') THEN
      -- Atualiza o registro existente na tabela entrada
      UPDATE entrada
      SET valor = NEW.valor_oferta, data_entrada = (SELECT data_aula FROM aula WHERE id_aula = NEW.id_aula)
      WHERE id_aula = NEW.id_aula AND id_classe = NEW.id_classe AND categoria = 'Oferta Por Classe';
    ELSE
      -- Insere um novo registro na tabela entrada
      INSERT INTO entrada (id_aula, id_classe, titulo, categoria, data_entrada, valor)
      VALUES (NEW.id_aula, NEW.id_classe, 'Oferta EBD', 'Oferta Por Classe', (SELECT data_aula FROM aula WHERE id_aula = NEW.id_aula), NEW.valor_oferta);
    END IF;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_INSERT_AULA_GERAL` AFTER INSERT ON `aula_detalhe` FOR EACH ROW BEGIN
    
    DECLARE total_presenca_atual INT;
    DECLARE total_falta_atual INT;
    DECLARE total_biblia_atual INT;
    DECLARE total_revista_atual INT;
    DECLARE total_oferta_atual DECIMAL(10,2);
    DECLARE total_visitante_atual INT;
    DECLARE total_matriculado INT; -- Novo declaração para o total de alunos matriculados
    
    -- Obter os valores atuais de total_presenca, total_falta, total_biblia, total_revista, total_oferta, total_visitante
    SELECT SUM(qtde_presenca), SUM(qtde_falta), SUM(qtde_biblia), SUM(qtde_revista), SUM(valor_oferta), SUM(qtde_visitante)
    INTO total_presenca_atual, total_falta_atual, total_biblia_atual, total_revista_atual, total_oferta_atual, total_visitante_atual
    FROM aula_detalhe
    WHERE id_aula = NEW.id_aula;
    
    -- Obter o total de alunos matriculados com status 'S'
    SELECT COUNT(*)
    INTO total_matriculado
    FROM aluno
    WHERE status = 'A';
    
    -- Inserir na tabela aula_geral
    INSERT INTO aula_geral (id_aula, data_aula, total_presenca, total_falta, total_biblia, total_revista, total_oferta, total_visitante, total_matriculado, saida_aula, observacao)
    VALUES (NEW.id_aula, (SELECT data_aula FROM aula WHERE id_aula = NEW.id_aula), total_presenca_atual, total_falta_atual, total_biblia_atual, total_revista_atual, total_oferta_atual, total_visitante_atual, total_matriculado, 0, NULL)
    ON DUPLICATE KEY UPDATE
    total_presenca = total_presenca_atual,
    total_falta = total_falta_atual,
    total_biblia = total_biblia_atual,
    total_revista = total_revista_atual,
    total_oferta = total_oferta_atual,
    total_visitante = total_visitante_atual,
    total_matriculado = total_matriculado;
    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_UPDATE_AULA_GERAL` AFTER UPDATE ON `aula_detalhe` FOR EACH ROW BEGIN
    
    DECLARE total_presenca_atual INT;
    DECLARE total_falta_atual INT;
    DECLARE total_biblia_atual INT;
    DECLARE total_revista_atual INT;
    DECLARE total_oferta_atual DECIMAL(10,2);
    DECLARE total_visitante_atual INT;
    -- Obter os valores atualizados de total_presenca, total_falta, total_biblia, total_revista, total_oferta, total_visitante
    SELECT SUM(qtde_presenca), SUM(qtde_falta), SUM(qtde_biblia), SUM(qtde_revista), SUM(valor_oferta), SUM(qtde_visitante)
    INTO total_presenca_atual, total_falta_atual, total_biblia_atual, total_revista_atual, total_oferta_atual, total_visitante_atual
    FROM aula_detalhe
    WHERE id_aula = NEW.id_aula;
    -- Atualizar na tabela aula_geral
    UPDATE aula_geral
    SET total_presenca = total_presenca_atual,
        total_falta = total_falta_atual,
        total_biblia = total_biblia_atual,
        total_revista = total_revista_atual,
        total_oferta = total_oferta_atual,
        total_visitante = total_visitante_atual
    WHERE id_aula = NEW.id_aula;
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aula_geral`
--

CREATE TABLE `aula_geral` (
  `id_aula` int(11) NOT NULL,
  `data_aula` date DEFAULT NULL,
  `total_matriculado` int(11) DEFAULT 0,
  `total_presenca` int(11) DEFAULT 0,
  `total_falta` int(11) DEFAULT 0,
  `total_visitante` int(11) DEFAULT 0,
  `total_biblia` int(11) DEFAULT 0,
  `total_revista` int(11) DEFAULT 0,
  `total_oferta` decimal(10,2) DEFAULT 0.00,
  `saida_aula` int(11) DEFAULT 0,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `aula_geral`
--

INSERT INTO `aula_geral` (`id_aula`, `data_aula`, `total_matriculado`, `total_presenca`, `total_falta`, `total_visitante`, `total_biblia`, `total_revista`, `total_oferta`, `saida_aula`, `observacao`) VALUES
(58, '2024-07-07', 87, 0, 87, 0, 0, 0, 0.00, 0, NULL);

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
(1, 'Café da Manhã', NULL, NULL, NULL),
(3, 'Leite', NULL, NULL, NULL),
(5, 'Oferta ', NULL, NULL, NULL);

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
  `data_cad` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `classe`
--

INSERT INTO `classe` (`id_classe`, `id_faixa_etaria`, `classe`, `descricao`, `status`, `data_cad`) VALUES
(1, 3, 'Cordeirinhos de Cristo', 'Crianças de 1 a 9 anos', 'A', '2024-06-28'),
(2, 5, 'Juniores', '', 'A', '2024-06-28'),
(3, 9, 'Jovens', '', 'A', '2024-06-28'),
(4, 10, 'Valentes de Davi', '', 'A', '2024-06-28');

-- --------------------------------------------------------

--
-- Estrutura para tabela `configuracao`
--

CREATE TABLE `configuracao` (
  `id_configuracao` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `evento` varchar(50) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `tempo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `configuracao`
--

INSERT INTO `configuracao` (`id_configuracao`, `tipo`, `evento`, `valor`, `tempo`) VALUES
(1, 'Cadastro Aula', 'Delete', 'S', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrada`
--

CREATE TABLE `entrada` (
  `id_entrada` int(11) NOT NULL,
  `id_aula` int(11) DEFAULT NULL,
  `id_classe` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `data_entrada` date NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL
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
(1, 'Membro', 'A', '2024-06-28', '2024-06-28 19:26:56', NULL),
(2, 'Presbítero', 'A', '2024-06-28', NULL, NULL),
(3, 'Diácono', 'A', '2024-06-28', NULL, NULL),
(4, 'Pastor', 'A', '2024-06-28', NULL, NULL),
(5, 'Cooperador', 'A', '2024-06-28', NULL, NULL),
(6, 'Evangelista', 'A', '2024-06-28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `presenca`
--

CREATE TABLE `presenca` (
  `id_aula` int(11) DEFAULT NULL,
  `id_classe` int(11) DEFAULT NULL,
  `id_aluno` int(11) DEFAULT NULL,
  `nome_aluno` varchar(150) DEFAULT NULL,
  `presente` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `presenca`
--

INSERT INTO `presenca` (`id_aula`, `id_classe`, `id_aluno`, `nome_aluno`, `presente`) VALUES
(58, 1, 12, 'Asaf', 'F'),
(58, 1, 14, 'Ayla', 'F'),
(58, 1, 15, 'Bernard', 'F'),
(58, 1, 4, 'Eduardo Moraes de Siqueira', 'F'),
(58, 1, 22, 'Emanuely', 'F'),
(58, 1, 25, 'Ester', 'F'),
(58, 1, 30, 'Heitor', 'F'),
(58, 1, 3, 'Livia Moraes de Siqueira', 'F'),
(58, 1, 44, 'Lorena', 'F'),
(58, 1, 64, 'Nicole', 'F'),
(58, 2, 5, 'Abigail', 'F'),
(58, 2, 9, 'Ana', 'F'),
(58, 2, 11, 'Ana Clara', 'F'),
(58, 2, 23, 'Enzo', 'F'),
(58, 2, 24, 'Esmael', 'F'),
(58, 2, 32, 'Isac', 'F'),
(58, 2, 41, 'kalebe', 'F'),
(58, 2, 47, 'Maria', 'F'),
(58, 2, 56, 'Mateus', 'F'),
(58, 2, 62, 'Nataly', 'F'),
(58, 2, 68, 'Pedro', 'F'),
(58, 2, 73, 'Sara', 'F'),
(58, 2, 76, 'Sofia', 'F'),
(58, 2, 77, 'Sophia', 'F'),
(58, 2, 87, 'Stefany', 'F'),
(58, 2, 83, 'Vitória', 'F'),
(58, 3, 16, 'Camila', 'F'),
(58, 3, 21, 'Débora', 'F'),
(58, 3, 28, 'Fellipe', 'F'),
(58, 3, 31, 'Ingrid', 'F'),
(58, 3, 38, 'João Vitor', 'F'),
(58, 3, 40, 'Junior', 'F'),
(58, 3, 61, 'Naseias', 'F'),
(58, 3, 63, 'Natam', 'F'),
(58, 3, 65, 'Noemy', 'F'),
(58, 3, 69, 'Pedro', 'F'),
(58, 3, 72, 'Ruth', 'F'),
(58, 3, 74, 'Sarah', 'F'),
(58, 3, 75, 'Sofia', 'F'),
(58, 4, 6, 'Adalberto', 'F'),
(58, 4, 7, 'Adelma', 'F'),
(58, 4, 8, 'Aldo', 'F'),
(58, 4, 10, 'Ana(Esposa do Mauro)', 'F'),
(58, 4, 1, 'Anderson Lopes de Siqueira', 'F'),
(58, 4, 13, 'André', 'F'),
(58, 4, 2, 'Angelica da Costa Moraes Siqueira', 'F'),
(58, 4, 17, 'Charla', 'F'),
(58, 4, 18, 'Daiane', 'F'),
(58, 4, 19, 'Danilo', 'F'),
(58, 4, 20, 'Denis', 'F'),
(58, 4, 26, 'Eudes Gomes', 'F'),
(58, 4, 27, 'Fabiano Rodrigo', 'F'),
(58, 4, 29, 'Genesis Cesar', 'F'),
(58, 4, 33, 'Jariane', 'F'),
(58, 4, 34, 'Jessica', 'F'),
(58, 4, 35, 'Joel', 'F'),
(58, 4, 37, 'José Gilson(Gil)', 'F'),
(58, 4, 36, 'Josefa', 'F'),
(58, 4, 39, 'Jucelena', 'F'),
(58, 4, 42, 'Leiliane(Leila)', 'F'),
(58, 4, 43, 'Lidiane', 'F'),
(58, 4, 46, 'Luíza', 'F'),
(58, 4, 45, 'Luzia', 'F'),
(58, 4, 48, 'Maria Antônia', 'F'),
(58, 4, 49, 'Maria da Cruz(Cruizinha)', 'F'),
(58, 4, 50, 'Maria do Rosário(Ruza)', 'F'),
(58, 4, 51, 'Maria Francisca(Chiquinha)', 'F'),
(58, 4, 52, 'Maria José', 'F'),
(58, 4, 53, 'Marlene', 'F'),
(58, 4, 54, 'Marlucia', 'F'),
(58, 4, 55, 'Marta', 'F'),
(58, 4, 57, 'Mauro', 'F'),
(58, 4, 58, 'Milton', 'F'),
(58, 4, 59, 'Misael', 'F'),
(58, 4, 60, 'Mizuta', 'F'),
(58, 4, 66, 'Osmar', 'F'),
(58, 4, 67, 'Patrícia', 'F'),
(58, 4, 70, 'Rivonaldo', 'F'),
(58, 4, 71, 'Ronaldo', 'F'),
(58, 4, 78, 'Tais', 'F'),
(58, 4, 79, 'Telma', 'F'),
(58, 4, 80, 'Valci', 'F'),
(58, 4, 81, 'Vanuza', 'F'),
(58, 4, 82, 'Vera Lúcia', 'F'),
(58, 4, 84, 'Wadley Kenniel', 'F'),
(58, 4, 85, 'Welida', 'F'),
(58, 4, 86, 'Zenaide', 'F');

--
-- Acionadores `presenca`
--
DELIMITER $$
CREATE TRIGGER `TR_PRESENCA_INSERT` AFTER INSERT ON `presenca` FOR EACH ROW BEGIN
    DECLARE dummy INT;
    SELECT update_presenca_falta(NEW.id_aula, NEW.id_classe) INTO dummy;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_PRESENCA_UPDATE` AFTER UPDATE ON `presenca` FOR EACH ROW BEGIN
    DECLARE dummy INT;
    SELECT update_presenca_falta(NEW.id_aula, NEW.id_classe) INTO dummy;
END
$$
DELIMITER ;

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

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_aluno`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_aluno` (
`id_aluno` int(11)
,`nome` varchar(150)
,`data_nasc` varchar(10)
,`email` varchar(45)
,`cel` varchar(20)
,`sexo` varchar(1)
,`estado_civil` varchar(10)
,`endereco` varchar(45)
,`numero` varchar(10)
,`estado` varchar(2)
,`cidade` varchar(60)
,`bairro` varchar(50)
,`cep` varchar(10)
,`responsavel` varchar(150)
,`cel_resp` varchar(20)
,`observacao` text
,`status_aluno` varchar(1)
,`data_matricula` varchar(10)
,`id_classe` int(11)
,`classe` varchar(150)
,`descricao` text
,`status_classe` varchar(1)
,`id_funcao` int(11)
,`funcao` varchar(150)
,`status_funcao` varchar(1)
,`id_faixa_etaria` int(11)
,`faixa_etaria` varchar(150)
,`status_faixa_etaria` varchar(1)
);

-- --------------------------------------------------------

--
-- Estrutura para view `vw_aluno`
--
DROP TABLE IF EXISTS `vw_aluno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_aluno`  AS SELECT `a`.`id_aluno` AS `id_aluno`, `a`.`nome` AS `nome`, date_format(`a`.`data_nasc`,'%d/%m/%Y') AS `data_nasc`, `a`.`email` AS `email`, `a`.`cel` AS `cel`, `a`.`sexo` AS `sexo`, `a`.`estado_civil` AS `estado_civil`, `a`.`endereco` AS `endereco`, `a`.`numero` AS `numero`, `a`.`estado` AS `estado`, `a`.`cidade` AS `cidade`, `a`.`bairro` AS `bairro`, `a`.`cep` AS `cep`, `a`.`responsavel` AS `responsavel`, `a`.`cel_resp` AS `cel_resp`, `a`.`observacao` AS `observacao`, `a`.`status` AS `status_aluno`, date_format(`a`.`data_cad`,'%d/%m/%Y') AS `data_matricula`, `c`.`id_classe` AS `id_classe`, `c`.`classe` AS `classe`, `c`.`descricao` AS `descricao`, `c`.`status` AS `status_classe`, `f`.`id_funcao` AS `id_funcao`, `f`.`funcao` AS `funcao`, `f`.`status` AS `status_funcao`, `fe`.`id_faixa_etaria` AS `id_faixa_etaria`, `fe`.`faixa_etaria` AS `faixa_etaria`, `fe`.`status` AS `status_faixa_etaria` FROM (((`aluno` `a` join `classe` `c` on(`a`.`id_classe` = `c`.`id_classe`)) join `funcao` `f` on(`a`.`id_funcao` = `f`.`id_funcao`)) join `faixa_etaria` `fe` on(`c`.`id_faixa_etaria` = `fe`.`id_faixa_etaria`)) ORDER BY `a`.`nome` ASC ;

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
-- Índices de tabela `aula_geral`
--
ALTER TABLE `aula_geral`
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
  ADD PRIMARY KEY (`id_classe`),
  ADD KEY `fk_id_faixa_etaria` (`id_faixa_etaria`);

--
-- Índices de tabela `configuracao`
--
ALTER TABLE `configuracao`
  ADD PRIMARY KEY (`id_configuracao`);

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
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de tabela `aula`
--
ALTER TABLE `aula`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `configuracao`
--
ALTER TABLE `configuracao`
  MODIFY `id_configuracao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `entrada`
--
ALTER TABLE `entrada`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
