--
-- Banco de dados: `sigebd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `id_aluno` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_funcao` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `data_nasc` date NOT NULL,
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
) ;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`id_aluno`, `id_classe`, `id_funcao`, `nome`, `data_nasc`, `email`, `cel`, `sexo`, `estado_civil`, `endereco`, `numero`, `estado`, `cidade`, `bairro`, `cep`, `responsavel`, `cel_resp`, `observacao`, `status`, `data_cad`) VALUES
(1, 4, 1, 'Anderson Lopes de Siqueira', '1988-07-30', 'contato@andersonls.com.br', '(16) 99291-1729', 'M', 'Casado(a)', 'Rua Edwirges de Carvalho Chain', '145', 'SP', 'Ribeirão Preto', 'Planalto Verde', '14056-130', '', '', 'Secretário da Escola Dominical.', 'A', '2024-06-28'),
(2, 4, 1, 'Angelica da Costa Moraes Siqueira', '1990-07-10', 'angelicamoraes@live.com', '(16) 99246-5337', 'F', 'Casado(a)', 'Rua Edwirges de Carvalho Chaim', NULL, 'SP', 'Ribeirão Preto', 'Planalto Verde', '14056-130', '', '', '', 'A', '2024-06-29'),
(3, 1, 1, 'Livia Moraes de Siqueira', '2017-07-02', '', '', 'F', 'Solteiro(a', 'Rua Edwirges de Carvalho Chaim', NULL, 'SP', 'Ribeirão Preto', 'Planalto Verde', '14056-130', '', '', '', 'A', '2024-07-03'),
(4, 1, 1, 'Eduardo Moraes de Siqueira', '2021-02-02', '', '', 'M', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-03');

--
-- Acionadores `aluno`
--
DELIMITER $$
CREATE TRIGGER `TR_ALUNO_INSERT` BEFORE INSERT ON `aluno` FOR EACH ROW BEGIN
  SET NEW.data_cad = CURDATE();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aula`
--

CREATE TABLE `aula` (
  `id_aula` int(11) NOT NULL,
  `data` date NOT NULL DEFAULT curdate(),
  `numero` int(11) NOT NULL
) ;

--
-- Extraindo dados da tabela `aula`
--

INSERT INTO `aula` (`id_aula`, `data`, `numero`) VALUES
(1, '2024-07-03', 1);

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
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_AULA_INSERE` AFTER INSERT ON `aula` FOR EACH ROW BEGIN
  -- Insere na tabela presenca para todos os alunos
  INSERT INTO presenca (id_aluno, id_aula, presente)
  SELECT id_aluno, NEW.id_aula, 'F' 
  FROM aluno;
  -- Insere na tabela aula_detalhe
  INSERT INTO aula_detalhe (id_aula)
  VALUES (NEW.id_aula);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aula_detalhe`
--

CREATE TABLE `aula_detalhe` (
  `id_aula` int(11) NOT NULL,
  `qtde_biblia` int(11) DEFAULT NULL,
  `qtde_revista` int(11) DEFAULT NULL,
  `qtd_visitante` int(11) DEFAULT NULL,
  `valor_oferta` decimal(10,2) DEFAULT NULL,
  `observacao` text DEFAULT NULL
) ;

--
-- Extraindo dados da tabela `aula_detalhe`
--

INSERT INTO `aula_detalhe` (`id_aula`, `qtde_biblia`, `qtde_revista`, `qtd_visitante`, `valor_oferta`, `observacao`) VALUES
(1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `data_cad` date DEFAULT NULL COMMENT 'Data do cadastro',
  `dtahralteracao` datetime DEFAULT NULL COMMENT 'Data da ultima alteração',
  `usualteracao` int(11) DEFAULT NULL
) ;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`, `data_cad`, `dtahralteracao`, `usualteracao`) VALUES
(1, 'Café da Manhã', NULL, NULL, NULL),
(3, 'Leite', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL,
  `id_faixa_etaria` int(11) DEFAULT NULL,
  `classe` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `data_cad` date DEFAULT curdate(),
  `dtahralteracao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Extraindo dados da tabela `classe`
--

INSERT INTO `classe` (`id_classe`, `id_faixa_etaria`, `classe`, `descricao`, `status`, `data_cad`, `dtahralteracao`) VALUES
(1, 3, 'Cordeirinhos de Cristo', '', 'A', '2024-06-28', '2024-06-28 22:53:11'),
(2, 5, 'Juniores', '', 'A', '2024-06-28', '2024-06-28 22:53:19'),
(3, 9, 'Jovens', '', 'A', '2024-06-28', '2024-06-28 22:53:30'),
(4, 10, 'Valentes de Davi', '', 'A', '2024-06-28', '2024-07-03 15:56:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrada`
--

CREATE TABLE `entrada` (
  `id_entrada` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `data_entrada` date NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `faixa_etaria`
--

CREATE TABLE `faixa_etaria` (
  `id_faixa_etaria` int(11) NOT NULL,
  `faixa_etaria` varchar(150) NOT NULL,
  `status` varchar(1) NOT NULL,
  `data_cad` date DEFAULT curdate(),
  `dtahralteracao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usualteracao` int(11) DEFAULT NULL
) ;

--
-- Extraindo dados da tabela `faixa_etaria`
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
-- Estrutura da tabela `funcao`
--

CREATE TABLE `funcao` (
  `id_funcao` int(11) NOT NULL,
  `funcao` varchar(150) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `data_cad` date DEFAULT curdate(),
  `dtahralteracao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usualteracao` int(11) DEFAULT NULL
) ;

--
-- Extraindo dados da tabela `funcao`
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
-- Estrutura da tabela `presenca`
--

CREATE TABLE `presenca` (
  `id_lancamento` int(11) NOT NULL,
  `id_aluno` int(11) DEFAULT NULL,
  `id_aula` int(11) DEFAULT NULL,
  `presente` varchar(1) DEFAULT NULL
) ;

--
-- Extraindo dados da tabela `presenca`
--

INSERT INTO `presenca` (`id_lancamento`, `id_aluno`, `id_aula`, `presente`) VALUES
(1, 3, 1, 'F'),
(2, 4, 1, 'F'),
(3, 1, 1, 'F'),
(4, 2, 1, 'F');

-- --------------------------------------------------------

--
-- Estrutura da tabela `saida`
--

CREATE TABLE `saida` (
  `id_saida` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `data_saida` date NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nivel` varchar(10) DEFAULT NULL,
  `data_alteracao` varchar(255) DEFAULT NULL
) ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `senha`, `nivel`, `data_alteracao`) VALUES
(1, 'Anderson Siqueira', 'contato@andersonls.com.br', '41526389', '1', '2022-03-29 09:58:15');

--
-- Acionadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `TR_USUARIO_INSERT` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN 
    SET NEW.data_alteracao = CURRENT_TIMESTAMP;    
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_USUARIO_UPDATE` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN 
    SET NEW.data_alteracao = CURRENT_TIMESTAMP;    
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_aluno`
-- (Veja abaixo para a view atual)
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
-- Estrutura para vista `vw_aluno`
--
DROP TABLE IF EXISTS `vw_aluno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_aluno`  AS SELECT `a`.`id_aluno` AS `id_aluno`, `a`.`nome` AS `nome`, date_format(`a`.`data_nasc`,'%d/%m/%Y') AS `data_nasc`, `a`.`email` AS `email`, `a`.`cel` AS `cel`, `a`.`sexo` AS `sexo`, `a`.`estado_civil` AS `estado_civil`, `a`.`endereco` AS `endereco`, `a`.`numero` AS `numero`, `a`.`estado` AS `estado`, `a`.`cidade` AS `cidade`, `a`.`bairro` AS `bairro`, `a`.`cep` AS `cep`, `a`.`responsavel` AS `responsavel`, `a`.`cel_resp` AS `cel_resp`, `a`.`observacao` AS `observacao`, `a`.`status` AS `status_aluno`, date_format(`a`.`data_cad`,'%d/%m/%Y') AS `data_matricula`, `c`.`id_classe` AS `id_classe`, `c`.`classe` AS `classe`, `c`.`descricao` AS `descricao`, `c`.`status` AS `status_classe`, `f`.`id_funcao` AS `id_funcao`, `f`.`funcao` AS `funcao`, `f`.`status` AS `status_funcao`, `fe`.`id_faixa_etaria` AS `id_faixa_etaria`, `fe`.`faixa_etaria` AS `faixa_etaria`, `fe`.`status` AS `status_faixa_etaria` FROM (((`aluno` `a` join `classe` `c` on(`a`.`id_classe` = `c`.`id_classe`)) join `funcao` `f` on(`a`.`id_funcao` = `f`.`id_funcao`)) join `faixa_etaria` `fe` on(`c`.`id_faixa_etaria` = `fe`.`id_faixa_etaria`)) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id_aluno`),
  ADD KEY `fk_aluno_classe1_idx` (`id_classe`),
  ADD KEY `fk_aluno_funcao2_idx` (`id_funcao`);

--
-- Índices para tabela `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`id_aula`);

--
-- Índices para tabela `aula_detalhe`
--
ALTER TABLE `aula_detalhe`
  ADD KEY `aula_detalhe_fk_1` (`id_aula`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`),
  ADD KEY `fk_id_faixa_etaria` (`id_faixa_etaria`);

--
-- Índices para tabela `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`id_entrada`);

--
-- Índices para tabela `faixa_etaria`
--
ALTER TABLE `faixa_etaria`
  ADD PRIMARY KEY (`id_faixa_etaria`),
  ADD UNIQUE KEY `faixa_etaria` (`faixa_etaria`);

--
-- Índices para tabela `funcao`
--
ALTER TABLE `funcao`
  ADD PRIMARY KEY (`id_funcao`);

--
-- Índices para tabela `presenca`
--
ALTER TABLE `presenca`
  ADD PRIMARY KEY (`id_lancamento`),
  ADD KEY `id_aluno` (`id_aluno`),
  ADD KEY `id_aula` (`id_aula`);

--
-- Índices para tabela `saida`
--
ALTER TABLE `saida`
  ADD PRIMARY KEY (`id_saida`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `aula`
--
ALTER TABLE `aula`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT de tabela `presenca`
--
ALTER TABLE `presenca`
  MODIFY `id_lancamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_aluno_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aluno_funcao2` FOREIGN KEY (`id_funcao`) REFERENCES `funcao` (`id_funcao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `aula_detalhe`
--
ALTER TABLE `aula_detalhe`
  ADD CONSTRAINT `aula_detalhe_fk_1` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id_aula`);

--
-- Limitadores para a tabela `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `fk_id_faixa_etaria` FOREIGN KEY (`id_faixa_etaria`) REFERENCES `faixa_etaria` (`id_faixa_etaria`);

--
-- Limitadores para a tabela `presenca`
--
ALTER TABLE `presenca`
  ADD CONSTRAINT `presenca_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
  ADD CONSTRAINT `presenca_ibfk_2` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id_aula`);
COMMIT;

