CREATE TABLE cliente (
  id_cliente INT(11) NOT NULL AUTO_INCREMENT,
  nome_cliente VARCHAR(255) NOT NULL,
  STATUS VARCHAR(1) NOT NULL,
  dta_cadastro DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY (id_cliente)
);

CREATE TABLE faixa_etaria (
  id_faixa_etaria int(11) NOT NULL AUTO_INCREMENT,
  faixa_etaria varchar(150) NOT NULL,
  status varchar(1) NOT NULL,
  dta_cadastro date DEFAULT CURRENT_DATE,
  PRIMARY KEY (id_faixa_etaria),
  UNIQUE KEY faixa_etaria (faixa_etaria)
) ;

CREATE TABLE funcao (
  id_funcao int(11) NOT NULL AUTO_INCREMENT,
  funcao varchar(150) NOT NULL,
  status varchar(1) DEFAULT NULL,
  dta_cadastro date DEFAULT CURRENT_DATE,
  PRIMARY KEY (id_funcao)
);

CREATE TABLE classe (
  id_classe int(11) NOT NULL AUTO_INCREMENT,
  id_faixa_etaria int(11) DEFAULT NULL,
  classe varchar(150) NOT NULL,
  descricao text DEFAULT NULL,
  status varchar(1) DEFAULT NULL,
  dta_cadastro date DEFAULT CURRENT_DATE,
  PRIMARY KEY (id_classe),
  KEY fk_id_faixa_etaria (id_faixa_etaria),
  CONSTRAINT fk_id_faixa_etaria FOREIGN KEY (id_faixa_etaria) REFERENCES faixa_etaria (id_faixa_etaria)
) ;

CREATE TABLE aluno (
  id_aluno int(11) NOT NULL AUTO_INCREMENT,
  id_classe int(11) NOT NULL,
  id_funcao int(11) NOT NULL,
  nome varchar(150) NOT NULL,
  dta_nascimento date DEFAULT NULL,
  email varchar(45) DEFAULT NULL,
  cel varchar(20) DEFAULT NULL,
  sexo varchar(1) DEFAULT NULL,
  estado_civil varchar(10) DEFAULT NULL,
  endereco varchar(45) DEFAULT NULL,
  numero varchar(10) DEFAULT NULL,
  estado varchar(2) DEFAULT NULL,
  cidade varchar(60) DEFAULT NULL,
  bairro varchar(50) DEFAULT NULL,
  cep varchar(10) DEFAULT NULL,
  responsavel varchar(150) DEFAULT NULL,
  cel_resp varchar(20) DEFAULT NULL,
  observacao text DEFAULT NULL,
  status varchar(1) DEFAULT 'A',  
  imagem varchar(255)  DEFAULT NULL,
  professor varchar(1) DEFAULT 'N',
  classe int(11) DEFAULT NULL,  
  dta_cadastro date DEFAULT CURRENT_DATE,
  PRIMARY KEY (id_aluno),
  KEY fk_aluno_classe1_idx (id_classe),
  KEY fk_aluno_funcao2_idx (id_funcao),
  CONSTRAINT fk_aluno_classe1 FOREIGN KEY (id_classe) REFERENCES classe (id_classe) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_aluno_funcao2 FOREIGN KEY (id_funcao) REFERENCES funcao (id_funcao) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE aula (
  id_aula int(11) NOT NULL AUTO_INCREMENT,
  dta_aula date DEFAULT NULL,
  numero int(11) NOT NULL,
  observacao text DEFAULT NULL,
  dta_cadastro date DEFAULT CURRENT_DATE,
  PRIMARY KEY (id_aula)
);

CREATE TABLE aula_detalhe (
  id_aula_detalhe int(11) NOT NULL AUTO_INCREMENT,
  id_aula int(11) DEFAULT NULL,
  id_classe int(11) DEFAULT NULL,
  qtde_matriculado int(11) DEFAULT NULL,
  qtde_presenca int(11) DEFAULT 0,
  qtde_falta int(11) DEFAULT 0,
  qtde_biblia int(11) DEFAULT NULL,
  qtde_revista int(11) DEFAULT NULL,
  qtde_visitante int(11) DEFAULT NULL,
  valor_oferta decimal(10,2) DEFAULT NULL,
  observacao text DEFAULT NULL,
  PRIMARY KEY (id_aula_detalhe)
);

CREATE TABLE aula_geral (
  id_aula int(11) NOT NULL,
  dta_aula date DEFAULT NULL,
  total_matriculado int(11) DEFAULT 0,
  total_presenca int(11) DEFAULT 0,
  total_falta int(11) DEFAULT 0,
  total_visitante int(11) DEFAULT 0,
  total_biblia int(11) DEFAULT 0,
  total_revista int(11) DEFAULT 0,
  total_oferta decimal(10,2) DEFAULT 0.00,
  saida_aula int(11) DEFAULT 0,
  observacao text DEFAULT NULL,
  PRIMARY KEY (id_aula)
) ;

CREATE TABLE categoria (
  id_categoria int(11) NOT NULL AUTO_INCREMENT,
  categoria varchar(100) NOT NULL,
  status varchar(1) NOT NULL,
  dta_cadastro date DEFAULT CURRENT_DATE,
  PRIMARY KEY (id_categoria)
) ;

CREATE TABLE entrada (
  id_entrada int(11) NOT NULL AUTO_INCREMENT,
  id_aula int(11) DEFAULT NULL,
  id_classe int(11) DEFAULT NULL,
  titulo varchar(255) DEFAULT NULL,
  categoria varchar(100) DEFAULT NULL,
  dta_entrada date NOT NULL,
  valor decimal(10,2) DEFAULT NULL,
  dta_cadastro date DEFAULT CURRENT_DATE,
  PRIMARY KEY (id_entrada)
) ;

CREATE TABLE permissao (
  id_permissao int(11) NOT NULL AUTO_INCREMENT,
  permissao varchar(50) NOT NULL,
  descricao text DEFAULT NULL,
  dta_cadastro date DEFAULT CURRENT_DATE,
  PRIMARY KEY (id_permissao)
) ;

CREATE TABLE perfil (
  id_perfil int(11) NOT NULL AUTO_INCREMENT,
  perfil varchar(50) NOT NULL,
  descricao text DEFAULT NULL,
  dta_cadastro date DEFAULT CURRENT_DATE,
  PRIMARY KEY (id_perfil)
) ;

CREATE TABLE perfil_permissao (
  id int(11) NOT NULL AUTO_INCREMENT,
  id_perfil int(11) NOT NULL,
  id_permissao int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY id_perfil (id_perfil),
  KEY id_permissao (id_permissao),
  CONSTRAINT perfil_permissao_ibfk_1 FOREIGN KEY (id_perfil) REFERENCES perfil (id_perfil),
  CONSTRAINT perfil_permissao_ibfk_2 FOREIGN KEY (id_permissao) REFERENCES permissao (id_permissao)
) ;

CREATE TABLE perfil_usuario (
  id int(11) NOT NULL AUTO_INCREMENT,
  id_perfil int(11) NOT NULL,
  id_usuario int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY id_perfil (id_perfil),
  KEY id_usuario (id_usuario)
);

CREATE TABLE presenca (
  id_aula int(11) DEFAULT NULL,
  id_classe int(11) DEFAULT NULL,
  id_aluno int(11) DEFAULT NULL,
  nome_aluno varchar(150) DEFAULT NULL,
  presente varchar(1) DEFAULT NULL,
  dta_cadastro date DEFAULT CURRENT_DATE
) ;

CREATE TABLE saida (
  id_saida int(11) NOT NULL AUTO_INCREMENT,
  id_aula int(11) DEFAULT NULL,
  id_classe int(11) DEFAULT NULL,
  id_categoria int(11) DEFAULT NULL,
  titulo varchar(255) DEFAULT NULL,
  dta_saida date NOT NULL,  
  valor decimal(10,2) NOT NULL,
  dta_cadastro date DEFAULT CURRENT_DATE,
  PRIMARY KEY (id_saida)
) ;

CREATE TABLE usuario (
  id_usuario int(11) NOT NULL,
  usuario varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  senha varchar(255) NOT NULL,
  dta_cadastro date DEFAULT CURRENT_DATE,
  dta_alteracao date DEFAULT NULL,
  status varchar(1) DEFAULT NULL
);

insert  into usuario(id_usuario,usuario,email,senha,dta_cadastro,dta_alteracao,status) values (1,'Anderson Siqueira','contato@andersonls.com.br','$2y$10$LWKdAqh7cx2/FWC.V76RTeB1nbNc.U7j2r8BvuuWSxwrGHmimMvMq','2024-07-27','2024-07-27','A');


/* Trigger structure for table aluno */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 TB_ALUNO_INSERT */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER TB_ALUNO_INSERT BEFORE INSERT ON aluno FOR EACH ROW BEGIN
  SET NEW.dta_cadastro = CURDATE();
END */$$


DELIMITER ;

/* Trigger structure for table aula */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 TR_AULA_INSERE */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER TR_AULA_INSERE AFTER INSERT ON aula FOR EACH ROW BEGIN
    
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
END */$$


DELIMITER ;

/* Trigger structure for table aula */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 TR_AULA_DELETE */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER TR_AULA_DELETE AFTER DELETE ON aula FOR EACH ROW BEGIN
    
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
  
END */$$


DELIMITER ;

/* Trigger structure for table aula_detalhe */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 TR_INSERT_AULA_GERAL */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER TR_INSERT_AULA_GERAL AFTER INSERT ON aula_detalhe FOR EACH ROW BEGIN
    
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
    
END */$$


DELIMITER ;

/* Trigger structure for table aula_detalhe */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 TR_AULA_DETALHE_INSERT */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER TR_AULA_DETALHE_INSERT AFTER INSERT ON aula_detalhe FOR EACH ROW BEGIN
  -- Verifica se o novo valor de valor_oferta não é nulo ou 0.00
  IF NEW.valor_oferta IS NOT NULL AND NEW.valor_oferta != 0.00 THEN
    -- Insere um novo registro na tabela entrada
    INSERT INTO entrada (id_aula, id_classe, titulo, categoria, dta_entrada, valor)
    VALUES (NEW.id_aula, NEW.id_classe, 'Oferta EBD', 'Oferta Por Classe', (SELECT dta_aula FROM aula WHERE id_aula = NEW.id_aula), NEW.valor_oferta);
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table aula_detalhe */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 TR_UPDATE_AULA_GERAL */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER TR_UPDATE_AULA_GERAL AFTER UPDATE ON aula_detalhe FOR EACH ROW BEGIN
    
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
    
END */$$


DELIMITER ;

/* Trigger structure for table aula_detalhe */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 TR_AULA_DETALHE_UPDATE */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER TR_AULA_DETALHE_UPDATE AFTER UPDATE ON aula_detalhe FOR EACH ROW BEGIN
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
END */$$


DELIMITER ;

/* Trigger structure for table presenca */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 TR_PRESENCA_INSERT */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER TR_PRESENCA_INSERT AFTER INSERT ON presenca FOR EACH ROW BEGIN
    DECLARE dummy INT;
    SELECT update_presenca_falta(NEW.id_aula, NEW.id_classe) INTO dummy;
END */$$


DELIMITER ;

/* Trigger structure for table presenca */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 TR_PRESENCA_UPDATE */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER TR_PRESENCA_UPDATE AFTER UPDATE ON presenca FOR EACH ROW BEGIN
    DECLARE dummy INT;
    SELECT update_presenca_falta(NEW.id_aula, NEW.id_classe) INTO dummy;
END */$$


DELIMITER ;

/* Trigger structure for table usuario */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 TB_USUARIO_INSERT */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER TB_USUARIO_INSERT BEFORE INSERT ON usuario FOR EACH ROW BEGIN 
    SET NEW.dta_alteracao = CURRENT_TIMESTAMP;    
  END */$$


DELIMITER ;

/* Trigger structure for table usuario */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 TB_USUARIO_UPDATE */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER TB_USUARIO_UPDATE BEFORE UPDATE ON usuario FOR EACH ROW BEGIN 
    SET NEW.dta_alteracao = CURRENT_TIMESTAMP;    
  END */$$


DELIMITER ;

/* Function  structure for function  update_presenca_falta */

/*!50003 DROP FUNCTION IF EXISTS update_presenca_falta */;
DELIMITER $$

/*!50003 CREATE DEFINER=root@localhost FUNCTION update_presenca_falta(id_aula INT, id_classe INT) RETURNS int(11)
BEGIN
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
END */$$
DELIMITER ;

/*Table structure for table view_aula_geral */

DROP TABLE IF EXISTS view_aula_geral;

/*!50001 DROP VIEW IF EXISTS view_aula_geral */;
/*!50001 DROP TABLE IF EXISTS view_aula_geral */;

/*!50001 CREATE TABLE  view_aula_geral(
 id_aula int(11) ,
 dta_aula date ,
 total_presenca decimal(32,0) ,
 total_falta decimal(32,0) ,
 total_biblia decimal(32,0) ,
 total_revista decimal(32,0) ,
 total_oferta decimal(32,2) ,
 total_visitante decimal(32,0) ,
 total_matriculado bigint(21) ,
 observacao text ,
 total_saida decimal(32,2) ,
 total_final decimal(33,2) 
)*/;

/*Table structure for table vw_aluno */

DROP TABLE IF EXISTS vw_aluno;

/*!50001 DROP VIEW IF EXISTS vw_aluno */;
/*!50001 DROP TABLE IF EXISTS vw_aluno */;

/*!50001 CREATE TABLE  vw_aluno(
 id_aluno int(11) ,
 nome varchar(150) ,
 dta_nascimento varchar(10) ,
 email varchar(45) ,
 cel varchar(20) ,
 sexo varchar(1) ,
 estado_civil varchar(10) ,
 endereco varchar(45) ,
 numero varchar(10) ,
 estado varchar(2) ,
 cidade varchar(60) ,
 bairro varchar(50) ,
 cep varchar(10) ,
 responsavel varchar(150) ,
 cel_resp varchar(20) ,
 observacao text ,
 status_aluno varchar(1) ,
 dta_matricula varchar(10) ,
 id_classe int(11) ,
 classe varchar(150) ,
 descricao text ,
 status_classe varchar(1) ,
 id_funcao int(11) ,
 funcao varchar(150) ,
 status_funcao varchar(1) ,
 id_faixa_etaria int(11) ,
 faixa_etaria varchar(150) ,
 status_faixa_etaria varchar(1) 
)*/;

/*Table structure for table vw_aula */

DROP TABLE IF EXISTS vw_aula;

/*!50001 DROP VIEW IF EXISTS vw_aula */;
/*!50001 DROP TABLE IF EXISTS vw_aula */;

/*!50001 CREATE TABLE  vw_aula(
 id_aula int(11) ,
 id_classe int(11) ,
 dta_aula date ,
 numero int(11) ,
 classe varchar(150) ,
 qtde_biblia int(11) ,
 qtde_falta int(11) ,
 qtde_matriculado int(11) ,
 qtde_presenca int(11) ,
 qtde_revista int(11) ,
 qtde_visitante int(11) ,
 valor_oferta decimal(10,2) ,
 observacao text 
)*/;

/*Table structure for table vw_auladetalhe */

DROP TABLE IF EXISTS vw_auladetalhe;

/*!50001 DROP VIEW IF EXISTS vw_auladetalhe */;
/*!50001 DROP TABLE IF EXISTS vw_auladetalhe */;

/*!50001 CREATE TABLE  vw_auladetalhe(
 id_aula_detalhe int(11) ,
 id_classe int(11) ,
 id_aula int(11) ,
 classe varchar(150) ,
 dta_aula date ,
 numero int(11) ,
 qtde_biblia int(11) ,
 qtde_falta int(11) ,
 qtde_matriculado int(11) ,
 qtde_presenca int(11) ,
 qtde_revista int(11) ,
 qtde_visitante int(11) ,
 valor_oferta decimal(10,2) ,
 observacao text 
)*/;

/*View structure for view view_aula_geral */

/*!50001 DROP TABLE IF EXISTS view_aula_geral */;
/*!50001 DROP VIEW IF EXISTS view_aula_geral */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW view_aula_geral AS select ad.id_aula AS id_aula,a.dta_aula AS dta_aula,sum(ad.qtde_presenca) AS total_presenca,sum(ad.qtde_falta) AS total_falta,sum(ad.qtde_biblia) AS total_biblia,sum(ad.qtde_revista) AS total_revista,sum(ad.valor_oferta) AS total_oferta,sum(ad.qtde_visitante) AS total_visitante,(select count(0) from aluno where aluno.status = 'A') AS total_matriculado,a.observacao AS observacao,coalesce(saida_totals.total_saida,0) AS total_saida,sum(ad.valor_oferta) - coalesce(saida_totals.total_saida,0) AS total_final from ((aula_detalhe ad join aula a on(ad.id_aula = a.id_aula)) left join (select saida.id_aula AS id_aula,sum(saida.valor) AS total_saida from saida group by saida.id_aula) saida_totals on(ad.id_aula = saida_totals.id_aula)) group by ad.id_aula,a.dta_aula */;

/*View structure for view vw_aluno */

/*!50001 DROP TABLE IF EXISTS vw_aluno */;
/*!50001 DROP VIEW IF EXISTS vw_aluno */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW vw_aluno AS select a.id_aluno AS id_aluno,a.nome AS nome,date_format(a.dta_nascimento,'%d/%m/%Y') AS dta_nascimento,a.email AS email,a.cel AS cel,a.sexo AS sexo,a.estado_civil AS estado_civil,a.endereco AS endereco,a.numero AS numero,a.estado AS estado,a.cidade AS cidade,a.bairro AS bairro,a.cep AS cep,a.responsavel AS responsavel,a.cel_resp AS cel_resp,a.observacao AS observacao,a.status AS status_aluno,date_format(a.dta_cadastro,'%d/%m/%Y') AS dta_matricula,c.id_classe AS id_classe,c.classe AS classe,c.descricao AS descricao,c.status AS status_classe,f.id_funcao AS id_funcao,f.funcao AS funcao,f.status AS status_funcao,fe.id_faixa_etaria AS id_faixa_etaria,fe.faixa_etaria AS faixa_etaria,fe.status AS status_faixa_etaria from (((aluno a join classe c on(a.id_classe = c.id_classe)) join funcao f on(a.id_funcao = f.id_funcao)) join faixa_etaria fe on(c.id_faixa_etaria = fe.id_faixa_etaria)) order by a.nome */;

/*View structure for view vw_aula */

/*!50001 DROP TABLE IF EXISTS vw_aula */;
/*!50001 DROP VIEW IF EXISTS vw_aula */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW vw_aula AS select a.id_aula AS id_aula,c.id_classe AS id_classe,a.dta_aula AS dta_aula,a.numero AS numero,c.classe AS classe,b.qtde_biblia AS qtde_biblia,b.qtde_falta AS qtde_falta,b.qtde_matriculado AS qtde_matriculado,b.qtde_presenca AS qtde_presenca,b.qtde_revista AS qtde_revista,b.qtde_visitante AS qtde_visitante,b.valor_oferta AS valor_oferta,b.observacao AS observacao from ((aula a join aula_detalhe b) join classe c) where a.id_aula = b.id_aula and b.id_classe = c.id_classe and c.status = 'A' order by a.dta_aula desc */;

/*View structure for view vw_auladetalhe */

/*!50001 DROP TABLE IF EXISTS vw_auladetalhe */;
/*!50001 DROP VIEW IF EXISTS vw_auladetalhe */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW vw_auladetalhe AS select b.id_aula_detalhe AS id_aula_detalhe,c.id_classe AS id_classe,a.id_aula AS id_aula,c.classe AS classe,a.dta_aula AS dta_aula,a.numero AS numero,b.qtde_biblia AS qtde_biblia,b.qtde_falta AS qtde_falta,b.qtde_matriculado AS qtde_matriculado,b.qtde_presenca AS qtde_presenca,b.qtde_revista AS qtde_revista,b.qtde_visitante AS qtde_visitante,b.valor_oferta AS valor_oferta,b.observacao AS observacao from ((aula a join aula_detalhe b) join classe c) where a.id_aula = b.id_aula and b.id_classe = c.id_classe and c.status = 'A' order by a.dta_aula desc */;


