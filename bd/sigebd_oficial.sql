
-- Estrutura para tabela usuario
CREATE TABLE usuario (
  id_usuario INT(11) NOT NULL,
  usuario VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL, 
  dta_cadastro DATE DEFAULT NULL,
  dta_alteracao DATE DEFAULT NULL,
  STATUS VARCHAR(1) DEFAULT NULL
);

INSERT INTO usuario (id_usuario, usuario, email, senha, dta_cadastro, dta_alteracao, STATUS) VALUES
(1, 'Anderson Siqueira', 'contato@andersonls.com.br', '$2y$10$LWKdAqh7cx2/FWC.V76RTeB1nbNc.U7j2r8BvuuWSxwrGHmimMvMq', '2024-07-27', '2024-07-27', 'A');

-- Estrutura para tabela categoria
CREATE TABLE categoria (
  id_categoria INT(11) NOT NULL,
  categoria VARCHAR(100) NOT NULL,
  STATUS VARCHAR(1) NOT NULL
);

INSERT INTO categoria (id_categoria, categoria, STATUS) VALUES
(1, 'Café da Manhã', 'A'),
(3, 'Leite', 'A'),
(5, 'Oferta ', 'A');

-- Estrutura para tabela faixa_etaria
CREATE TABLE faixa_etaria (
  id_faixa_etaria INT(11) NOT NULL,
  faixa_etaria VARCHAR(150) NOT NULL,
  STATUS VARCHAR(1) NOT NULL
) ;

INSERT INTO faixa_etaria (id_faixa_etaria, faixa_etaria, STATUS) VALUES
(1, 'Berçário', 'A'),
(2, 'Maternal', 'A'),
(3, 'Jardim de Infância', 'A'),
(4, 'Primários', 'A'),
(5, 'Juniores', 'A'),
(6, 'Pré Adolescentes', 'A'),
(7, 'Adolescentes', 'A'),
(8, 'Jovenis', 'A'),
(9, 'Jovens', 'A'),
(10, 'Adultos', 'A'),
(11, 'Coordenação(Sec./Superintendentes)', 'A'),
(12, 'Discipulados', 'A');

-- Estrutura para tabela funcao
CREATE TABLE funcao (
  id_funcao INT(11) NOT NULL,
  funcao VARCHAR(150) NOT NULL,
  STATUS VARCHAR(1) DEFAULT NULL
);

INSERT INTO funcao (id_funcao, funcao, STATUS) VALUES
(1, 'Membro', 'A'),
(2, 'Presbítero', 'A'),
(3, 'Diácono', 'A'),
(4, 'Pastor', 'A'),
(5, 'Cooperador', 'A'),
(6, 'Evangelista', 'A');

-- Estrutura para tabela entrada
CREATE TABLE entrada (
  id_entrada INT(11) NOT NULL,
  id_aula INT(11) DEFAULT NULL,
  id_classe INT(11) DEFAULT NULL,
  titulo VARCHAR(255) DEFAULT NULL,
  categoria VARCHAR(100) DEFAULT NULL,
  dta_entrada DATE NOT NULL,
  valor DECIMAL(10,2) DEFAULT NULL
) ;

-- Estrutura para tabela saida
CREATE TABLE saida (
  id_saida INT(11) NOT NULL,
  id_aula INT(11) DEFAULT NULL,
  id_classe INT(11) DEFAULT NULL,
  titulo VARCHAR(255) DEFAULT NULL,
  categoria VARCHAR(100) DEFAULT NULL,
  dta_saida DATE NOT NULL,
  valor DECIMAL(10,2) NOT NULL
);

-- Estrutura para tabela perfil
CREATE TABLE perfil (
  id_perfil INT(11) NOT NULL,
  perfil VARCHAR(50) NOT NULL,
  descricao TEXT DEFAULT NULL
);

INSERT INTO perfil (id_perfil, perfil, descricao) VALUES
(1, 'Super Admin', 'Acesso Irrestrito ao sistema.');


-- Estrutura para tabela perfil_permissao
CREATE TABLE perfil_permissao (
  id INT(11) NOT NULL,
  id_perfil INT(11) NOT NULL,
  id_permissao INT(11) NOT NULL
) ;

-- Estrutura para tabela perfil_usuario
CREATE TABLE perfil_usuario (
  id INT(11) NOT NULL,
  id_perfil INT(11) NOT NULL,
  id_usuario INT(11) NOT NULL
);

-- Estrutura para tabela permissao
CREATE TABLE permissao (
  id_permissao INT(11) NOT NULL,
  permissao VARCHAR(50) NOT NULL,
  descricao TEXT DEFAULT NULL
);

INSERT INTO permissao (id_permissao, permissao, descricao) VALUES
(1, 'Cadastro-Aula-View', 'Permissão para visualizar tela de aulas');

-- Estrutura para tabela classe
CREATE TABLE classe (
  id_classe INT(11) NOT NULL,
  id_faixa_etaria INT(11) DEFAULT NULL,
  classe VARCHAR(150) NOT NULL,
  descricao TEXT DEFAULT NULL,
  STATUS VARCHAR(1) DEFAULT NULL,
  dta_cadastro DATE DEFAULT NULL
);

INSERT INTO classe (id_classe, id_faixa_etaria, classe, descricao, STATUS, dta_cadastro) VALUES
(1, 3, 'Cordeirinhos de Cristo', 'Crianças de 1 a 9 anos', 'A', '2024-06-28'),
(2, 5, 'Juniores', '', 'A', '2024-06-28'),
(3, 9, 'Jovens', '', 'A', '2024-06-28'),
(4, 10, 'Valentes de Davi', '', 'A', '2024-06-28');


-- Estrutura para tabela aluno
CREATE TABLE aluno (
  id_aluno INT(11) NOT NULL,
  id_classe INT(11) NOT NULL,
  id_funcao INT(11) NOT NULL,
  nome VARCHAR(150) NOT NULL,
  dta_nascimento DATE DEFAULT NULL,
  email VARCHAR(45) DEFAULT NULL,
  cel VARCHAR(20) DEFAULT NULL,
  sexo VARCHAR(1) DEFAULT NULL,
  estado_civil VARCHAR(10) DEFAULT NULL,
  endereco VARCHAR(45) DEFAULT NULL,
  numero VARCHAR(10) DEFAULT NULL,
  estado VARCHAR(2) DEFAULT NULL,
  cidade VARCHAR(60) DEFAULT NULL,
  bairro VARCHAR(50) DEFAULT NULL,
  cep VARCHAR(10) DEFAULT NULL,
  responsavel VARCHAR(150) DEFAULT NULL,
  cel_resp VARCHAR(20) DEFAULT NULL,
  observacao TEXT DEFAULT NULL,
  STATUS VARCHAR(1) DEFAULT 'A',
  dta_cadastro DATE DEFAULT NULL
) ;

INSERT INTO aluno (id_aluno, id_classe, id_funcao, nome, dta_nascimento, email, cel, sexo, estado_civil, endereco, numero, estado, cidade, bairro, cep, responsavel, cel_resp, observacao, STATUS, dta_cadastro) VALUES
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
(87, 2, 1, 'Stefany', '0000-00-00', '', '', 'F', 'Solteiro(a', '', NULL, '', '', '', '', '', '', '', 'A', '2024-07-07'),
(88, 1, 1, 'teste', '0000-00-00', '', '', 'M', 'Solteiro(a', 'Rua Edwirges de Carvalho Chaim', NULL, 'SP', 'Ribeirão Preto', 'Planalto Verde', '14056-130', '', '', '', 'A', '2024-07-21');


-- Estrutura para tabela aula
CREATE TABLE aula (
  id_aula INT(11) NOT NULL,
  dta_aula DATE DEFAULT NULL,
  numero INT(11) NOT NULL,
  observacao TEXT DEFAULT NULL
);

-- Estrutura para tabela aula_detalhe
CREATE TABLE aula_detalhe (
  id_aula_detalhe INT(11) NOT NULL,
  id_aula INT(11) DEFAULT NULL,
  id_classe INT(11) DEFAULT NULL,
  qtde_matriculado INT(11) DEFAULT NULL,
  qtde_presenca INT(11) DEFAULT 0,
  qtde_falta INT(11) DEFAULT 0,
  qtde_biblia INT(11) DEFAULT NULL,
  qtde_revista INT(11) DEFAULT NULL,
  qtde_visitante INT(11) DEFAULT NULL,
  valor_oferta DECIMAL(10,2) DEFAULT NULL,
  observacao TEXT DEFAULT NULL
);

-- Estrutura para tabela aula_geral
CREATE TABLE aula_geral (
  id_aula INT(11) NOT NULL,
  dta_aula DATE DEFAULT NULL,
  total_matriculado INT(11) DEFAULT 0,
  total_presenca INT(11) DEFAULT 0,
  total_falta INT(11) DEFAULT 0,
  total_visitante INT(11) DEFAULT 0,
  total_biblia INT(11) DEFAULT 0,
  total_revista INT(11) DEFAULT 0,
  total_oferta DECIMAL(10,2) DEFAULT 0.00,
  saida_aula INT(11) DEFAULT 0,
  observacao TEXT DEFAULT NULL
) ;

-- Estrutura para tabela presenca
CREATE TABLE presenca (
  id_aula INT(11) DEFAULT NULL,
  id_classe INT(11) DEFAULT NULL,
  id_aluno INT(11) DEFAULT NULL,
  nome_aluno VARCHAR(150) DEFAULT NULL,
  presente VARCHAR(1) DEFAULT NULL
);


-- Índices de tabela aluno
ALTER TABLE aluno
  ADD PRIMARY KEY (id_aluno),
  ADD KEY fk_aluno_classe1_idx (id_classe),
  ADD KEY fk_aluno_funcao2_idx (id_funcao);

-- Índices de tabela aula
ALTER TABLE aula
  ADD PRIMARY KEY (id_aula);

-- Índices de tabela aula_detalhe
ALTER TABLE aula_detalhe
  ADD PRIMARY KEY (id_aula_detalhe);

-- Índices de tabela aula_geral
ALTER TABLE aula_geral
  ADD PRIMARY KEY (id_aula);

-- Índices de tabela categoria
ALTER TABLE categoria
  ADD PRIMARY KEY (id_categoria);

-- Índices de tabela classe
ALTER TABLE classe
  ADD PRIMARY KEY (id_classe),
  ADD KEY fk_id_faixa_etaria (id_faixa_etaria);

-- Índices de tabela entrada
ALTER TABLE entrada
  ADD PRIMARY KEY (id_entrada);

-- Índices de tabela faixa_etaria
ALTER TABLE faixa_etaria
  ADD PRIMARY KEY (id_faixa_etaria),
  ADD UNIQUE KEY faixa_etaria (faixa_etaria);

-- Índices de tabela funcao
ALTER TABLE funcao
  ADD PRIMARY KEY (id_funcao);

-- Índices de tabela perfil
ALTER TABLE perfil
  ADD PRIMARY KEY (id_perfil);


-- Índices de tabela perfil_permissao
ALTER TABLE perfil_permissao
  ADD PRIMARY KEY (id),
  ADD KEY id_perfil (id_perfil),
  ADD KEY id_permissao (id_permissao);


-- Índices de tabela perfil_usuario
ALTER TABLE perfil_usuario
  ADD PRIMARY KEY (id),
  ADD KEY id_perfil (id_perfil),
  ADD KEY id_usuario (id_usuario);

-- Índices de tabela permissao
ALTER TABLE permissao
  ADD PRIMARY KEY (id_permissao);

-- Índices de tabela saida
ALTER TABLE saida
  ADD PRIMARY KEY (id_saida);


-- Índices de tabela usuario
ALTER TABLE usuario
  ADD PRIMARY KEY (id_usuario),
  ADD UNIQUE KEY email (email);


-- AUTO_INCREMENT para tabelas despejadas

-- AUTO_INCREMENT de tabela aluno
ALTER TABLE aluno
  MODIFY id_aluno INT(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT de tabela aula
ALTER TABLE aula
  MODIFY id_aula INT(11) NOT NULL AUTO_INCREMENT;


-- AUTO_INCREMENT de tabela aula_detalhe
ALTER TABLE aula_detalhe
  MODIFY id_aula_detalhe INT(11) NOT NULL AUTO_INCREMENT;


-- AUTO_INCREMENT de tabela categoria
ALTER TABLE categoria
  MODIFY id_categoria INT(11) NOT NULL AUTO_INCREMENT;


-- AUTO_INCREMENT de tabela classe
ALTER TABLE classe
  MODIFY id_classe INT(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT de tabela entrada
ALTER TABLE entrada
  MODIFY id_entrada INT(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela faixa_etaria
--
ALTER TABLE faixa_etaria
  MODIFY id_faixa_etaria INT(11) NOT NULL AUTO_INCREMENT;


-- AUTO_INCREMENT de tabela funcao
ALTER TABLE funcao
  MODIFY id_funcao INT(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela perfil
--
ALTER TABLE perfil
  MODIFY id_perfil INT(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela perfil_permissao
--
ALTER TABLE perfil_permissao
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela perfil_usuario
--
ALTER TABLE perfil_usuario
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela permissao
--
ALTER TABLE permissao
  MODIFY id_permissao INT(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela saida
--
ALTER TABLE saida
  MODIFY id_saida INT(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela usuario
--
ALTER TABLE usuario
  MODIFY id_usuario INT(11) NOT NULL AUTO_INCREMENT;


-- Restrições para tabelas despejadas

-- Restrições para tabelas aluno
ALTER TABLE aluno
  ADD CONSTRAINT fk_aluno_classe1 FOREIGN KEY (id_classe) REFERENCES classe (id_classe) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_aluno_funcao2 FOREIGN KEY (id_funcao) REFERENCES funcao (id_funcao) ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Restrições para tabelas classe
ALTER TABLE classe
  ADD CONSTRAINT fk_id_faixa_etaria FOREIGN KEY (id_faixa_etaria) REFERENCES faixa_etaria (id_faixa_etaria);


-- Restrições para tabelas perfil_permissao
ALTER TABLE perfil_permissao
  ADD CONSTRAINT perfil_permissao_ibfk_1 FOREIGN KEY (id_perfil) REFERENCES perfil (id_perfil),
  ADD CONSTRAINT perfil_permissao_ibfk_2 FOREIGN KEY (id_permissao) REFERENCES permissao (id_permissao);


-- Restrições para tabelas perfil_usuario
ALTER TABLE perfil_usuario
  ADD CONSTRAINT perfil_usuario_ibfk_1 FOREIGN KEY (id_perfil) REFERENCES perfil (id_perfil),
  ADD CONSTRAINT perfil_usuario_ibfk_2 FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
  
 -- VIEWS

CREATE VIEW view_aula_geral AS 
SELECT
  ad.id_aula             AS id_aula,
  a.dta_aula             AS dta_aula,
  SUM(ad.qtde_presenca)  AS total_presenca,
  SUM(ad.qtde_falta)     AS total_falta,
  SUM(ad.qtde_biblia)    AS total_biblia,
  SUM(ad.qtde_revista)   AS total_revista,
  SUM(ad.valor_oferta)   AS total_oferta,
  SUM(ad.qtde_visitante) AS total_visitante,
  (SELECT
     COUNT(0)
   FROM aluno
   WHERE (aluno.status = 'A')) AS total_matriculado,
  a.observacao AS observacao
FROM (aula_detalhe ad
   JOIN aula a
     ON ((ad.id_aula = a.id_aula)))
GROUP BY ad.id_aula,a.dta_aula;

------------------------------------------------------------------------------------------

CREATE VIEW vw_aluno AS 
SELECT
  a.id_aluno         AS id_aluno,
  a.nome             AS nome,
  DATE_FORMAT(a.dta_nascimento,'%d/%m/%Y') AS dta_nascimento,
  a.email            AS email,
  a.cel              AS cel,
  a.sexo             AS sexo,
  a.estado_civil     AS estado_civil,
  a.endereco         AS endereco,
  a.numero           AS numero,
  a.estado           AS estado,
  a.cidade           AS cidade,
  a.bairro           AS bairro,
  a.cep              AS cep,
  a.responsavel      AS responsavel,
  a.cel_resp         AS cel_resp,
  a.observacao       AS observacao,
  a.status           AS status_aluno,
  DATE_FORMAT(a.dta_cadastro,'%d/%m/%Y') AS dta_matricula,
  c.id_classe        AS id_classe,
  c.classe           AS classe,
  c.descricao        AS descricao,
  c.status           AS status_classe,
  f.id_funcao        AS id_funcao,
  f.funcao           AS funcao,
  f.status           AS status_funcao,
  fe.id_faixa_etaria AS id_faixa_etaria,
  fe.faixa_etaria    AS faixa_etaria,
  fe.status          AS status_faixa_etaria
FROM (((aluno a
     JOIN classe c
       ON ((a.id_classe = c.id_classe)))
    JOIN funcao f
      ON ((a.id_funcao = f.id_funcao)))
   JOIN faixa_etaria fe
     ON ((c.id_faixa_etaria = fe.id_faixa_etaria)))
ORDER BY a.nome;

------------------------------------------------------------------------------------------

CREATE VIEW vw_aula AS 
SELECT
  a.id_aula          AS id_aula,
  c.id_classe        AS id_classe,
  a.dta_aula         AS dta_aula,
  a.numero           AS numero,
  c.classe           AS classe,
  b.qtde_biblia      AS qtde_biblia,
  b.qtde_falta       AS qtde_falta,
  b.qtde_matriculado AS qtde_matriculado,
  b.qtde_presenca    AS qtde_presenca,
  b.qtde_revista     AS qtde_revista,
  b.qtde_visitante   AS qtde_visitante,
  b.valor_oferta     AS valor_oferta,
  b.observacao       AS observacao
FROM ((aula a
    JOIN aula_detalhe b)
   JOIN classe c)
WHERE ((a.id_aula = b.id_aula)
       AND (b.id_classe = c.id_classe)
       AND (c.status = 'A'))
ORDER BY a.dta_aula DESC;

------------------------------------------------------------------------------------------

CREATE VIEW vw_auladetalhe AS 
SELECT
  b.id_aula_detalhe  AS id_aula_detalhe,
  c.id_classe        AS id_classe,
  a.id_aula          AS id_aula,
  c.classe           AS classe,
  a.dta_aula         AS dta_aula,
  a.numero           AS numero,
  b.qtde_biblia      AS qtde_biblia,
  b.qtde_falta       AS qtde_falta,
  b.qtde_matriculado AS qtde_matriculado,
  b.qtde_presenca    AS qtde_presenca,
  b.qtde_revista     AS qtde_revista,
  b.qtde_visitante   AS qtde_visitante,
  b.valor_oferta     AS valor_oferta,
  b.observacao       AS observacao
FROM ((aula a
    JOIN aula_detalhe b)
   JOIN classe c)
WHERE ((a.id_aula = b.id_aula)
       AND (b.id_classe = c.id_classe)
       AND (c.status = 'A'))
ORDER BY a.dta_aula DESC;

------------------------------------------------------------------------------------------

DELIMITER $$

CREATE 
  FUNCTION update_presenca_falta (id_aula INT, id_classe INT) RETURNS INT(11)  BEGIN
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

------------------------------------------------------------------------------------------

DELIMITER $$

CREATE 
   
    TRIGGER TR_UPDATE_AULA_GERAL AFTER UPDATE ON aula_detalhe 
    FOR EACH ROW BEGIN
    
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
    
END;
$$

DELIMITER ;

------------------------------------------------------------------------------------------

DELIMITER $$

CREATE 
   
    TRIGGER TR_PRESENCA_UPDATE AFTER UPDATE ON presenca 
    FOR EACH ROW BEGIN
    DECLARE dummy INT;
    SELECT update_presenca_falta(NEW.id_aula, NEW.id_classe) INTO dummy;
END;
$$

DELIMITER ;

DELIMITER $$

CREATE
    
    TRIGGER TR_PRESENCA_INSERT AFTER INSERT ON presenca 
    FOR EACH ROW BEGIN
    DECLARE dummy INT;
    SELECT update_presenca_falta(NEW.id_aula, NEW.id_classe) INTO dummy;
END;
$$

DELIMITER ;

------------------------------------------------------------------------------------------

DELIMITER $$

CREATE 
  
    TRIGGER TR_INSERT_AULA_GERAL AFTER INSERT ON aula_detalhe 
    FOR EACH ROW BEGIN
    
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
    WHERE STATUS = 'A';
    
    -- Inserir na tabela aula_geral
    INSERT INTO aula_geral (id_aula, dta_aula, total_presenca, total_falta, total_biblia, total_revista, total_oferta, total_visitante, total_matriculado, saida_aula, observacao)
    VALUES (NEW.id_aula, (SELECT dta_aula FROM aula WHERE id_aula = NEW.id_aula), total_presenca_atual, total_falta_atual, total_biblia_atual, total_revista_atual, total_oferta_atual, total_visitante_atual, total_matriculado, 0, NULL)
    ON DUPLICATE KEY UPDATE
    total_presenca = total_presenca_atual,
    total_falta = total_falta_atual,
    total_biblia = total_biblia_atual,
    total_revista = total_revista_atual,
    total_oferta = total_oferta_atual,
    total_visitante = total_visitante_atual,
    total_matriculado = total_matriculado;
    
END;
$$

DELIMITER ;

------------------------------------------------------------------------------------------

DELIMITER $$

CREATE
  
    TRIGGER TR_AULA_INSERE AFTER INSERT ON aula 
    FOR EACH ROW BEGIN
    
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
END;
$$

DELIMITER ;

------------------------------------------------------------------------------------------

DELIMITER $$

CREATE
    
    TRIGGER TR_AULA_DETALHE_UPDATE AFTER UPDATE ON aula_detalhe 
    FOR EACH ROW BEGIN
  -- Verifica se o novo valor de valor_oferta não é nulo ou 0.00
  IF NEW.valor_oferta IS NOT NULL AND NEW.valor_oferta != 0.00 THEN
    -- Verifica se já existe um registro na tabela entrada para o mesmo id_aula e id_classe
    IF EXISTS (SELECT 1 FROM entrada WHERE id_aula = NEW.id_aula AND id_classe = NEW.id_classe AND categoria = 'Oferta Por Classe') THEN
      -- Atualiza o registro existente na tabela entrada
      UPDATE entrada
      SET valor = NEW.valor_oferta, dta_entrada = (SELECT dta_aula FROM aula WHERE id_aula = NEW.id_aula)
      WHERE id_aula = NEW.id_aula AND id_classe = NEW.id_classe AND categoria = 'Oferta Por Classe';
    ELSE
      -- Insere um novo registro na tabela entrada
      INSERT INTO entrada (id_aula, id_classe, titulo, categoria, dta_entrada, valor)
      VALUES (NEW.id_aula, NEW.id_classe, 'Oferta EBD', 'Oferta Por Classe', (SELECT dta_aula FROM aula WHERE id_aula = NEW.id_aula), NEW.valor_oferta);
    END IF;
  END IF;
END;
$$

DELIMITER ;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE
    
    TRIGGER TR_AULA_DETALHE_INSERT AFTER INSERT ON aula_detalhe 
    FOR EACH ROW BEGIN
  -- Verifica se o novo valor de valor_oferta não é nulo ou 0.00
  IF NEW.valor_oferta IS NOT NULL AND NEW.valor_oferta != 0.00 THEN
    -- Insere um novo registro na tabela entrada
    INSERT INTO entrada (id_aula, id_classe, titulo, categoria, dta_entrada, valor)
    VALUES (NEW.id_aula, NEW.id_classe, 'Oferta EBD', 'Oferta Por Classe', (SELECT dta_aula FROM aula WHERE id_aula = NEW.id_aula), NEW.valor_oferta);
  END IF;
END;
$$

DELIMITER ;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE
    
    TRIGGER TR_AULA_DELETE AFTER DELETE ON aula 
    FOR EACH ROW BEGIN
    
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
  
END;
$$

DELIMITER ;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE
    
    TRIGGER TB_USUARIO_UPDATE BEFORE UPDATE ON usuario 
    FOR EACH ROW BEGIN 
    SET NEW.dta_alteracao = CURRENT_TIMESTAMP;    
  END;
$$

DELIMITER ;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE
   
    TRIGGER TB_USUARIO_INSERT BEFORE INSERT ON usuario 
    FOR EACH ROW BEGIN 
    SET NEW.dta_alteracao = CURRENT_TIMESTAMP;    
  END;
$$

DELIMITER ;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE
    
    TRIGGER TB_ALUNO_INSERT BEFORE INSERT ON aluno 
    FOR EACH ROW BEGIN
  SET NEW.dta_cadastro = CURDATE();
END;
$$

DELIMITER ;

COMMIT;

