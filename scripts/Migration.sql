DROP DATABASE IF EXISTS Little;
CREATE DATABASE Little;
USE Little;

CREATE TABLE Usuario (
  usuarioId int NOT NULL AUTO_INCREMENT,
  nome varchar(30) NOT NULL,
  sobrenome varchar(60) NOT NULL,
  apelido varchar(15) NOT NULL,
  dataNascimento date NOT NULL,
  ativo tinyint(1) DEFAULT NULL,
  dataUltAlt datetime NOT NULL,
  dataCadastro datetime NOT NULL,
  PRIMARY KEY (usuarioId)
);

CREATE TABLE Conta (
  contaId int NOT NULL AUTO_INCREMENT,
  usuarioId int NOT NULL,
  saldo decimal(7,2) NOT NULL,
  observacao varchar(120),
  ativo tinyint(1) DEFAULT NULL,
  dataUltAlt datetime NOT NULL,
  dataCadastro datetime NOT NULL,
  PRIMARY KEY (contaId),
  KEY usuarioId (usuarioId),
  CONSTRAINT Conta_ibfk_1 FOREIGN KEY (usuarioId) REFERENCES Usuario (usuarioId)
 );

CREATE TRIGGER after_usuario_insert
AFTER INSERT ON Usuario
FOR EACH ROW
BEGIN
  INSERT INTO Conta (usuarioId, saldo, ativo, dataUltAlt, dataCadastro)
  VALUES (NEW.usuarioId, 0, 1, NOW(), NOW());
END;

CREATE TABLE Tarefa (
  tarefaId int NOT NULL AUTO_INCREMENT,
  usuarioId int NOT NULL,
  titulo varchar(30) NOT NULL,
  descricao varchar(120) NOT NULL,
  horaInicio datetime NOT NULL,
  horaFim datetime DEFAULT NULL,
  diaTodo tinyint(1) NOT NULL,
  valorAcrescimo decimal(5,2) NOT NULL,
  valorDesconto decimal(5,2) NOT NULL,
  frequencia varchar(1) NOT NULL,
  obrigatoria tinyint(1) DEFAULT NULL,
  ativo tinyint(1) DEFAULT NULL,
  dataUltAlt datetime NOT NULL,
  dataCadastro datetime NOT NULL,
  PRIMARY KEY (tarefaId),
  UNIQUE KEY titulo (titulo),
  KEY usuarioId (usuarioId),
  CONSTRAINT Tarefa_ibfk_1 FOREIGN KEY (usuarioId) REFERENCES Usuario (usuarioId)
);


CREATE TABLE TarefaItem (
  tarefaId int NOT NULL,
  usuarioId int NOT NULL,
  dataItem date NOT NULL,
  dataFinalizacao datetime DEFAULT NULL,
  finalizado tinyint(1) NOT NULL,
  pago tinyint(1) NOT NULL,
  ativo tinyint(1) NOT NULL,
  dataUltAlt datetime NOT NULL,
  dataCadastro datetime NOT NULL,
  PRIMARY KEY (tarefaId,usuarioId,dataItem)
 );



/* Inclusão de valores teste */
INSERT INTO Usuario (nome,sobrenome,apelido,dataNascimento,ativo,dataUltAlt,dataCadastro) VALUES
	 ('Rafael','Gonçalves','Rafinha','2016-04-20',1,'2024-08-18 16:01:49','2024-08-18 16:01:49'),
	 ('Israel','Alves','IsraelDev','1991-01-25',1,'2024-08-18 16:02:14','2024-08-18 16:02:14'),
	 ('Ágatha','da Cruz Alves Lucena','Agatinha','2024-05-16',1,'2024-08-18 16:02:54','2024-08-18 16:02:54'),
	 ('Letícia','Lindo da Cruz','A mina','1993-02-06',1,'2024-08-29 00:34:17','2024-08-29 00:33:22'),
	 ('Mano','Deyvin','Mano','1990-01-01',1,'2024-08-29 11:47:39','2024-08-29 11:47:39'),
	 ('Lucas','Montano','Lucas','1990-01-01',1,'2024-08-29 11:52:30','2024-08-29 11:52:30'),
	 ('Gustavo','Guanabara','Guanabara','1985-01-01',1,'2024-08-29 11:53:13','2024-08-29 11:53:13');


INSERT INTO Tarefa (usuarioId,titulo,descricao,horaInicio,horaFim,diaTodo,valorAcrescimo,valorDesconto,frequencia,obrigatoria,ativo,dataUltAlt,dataCadastro) VALUES
	 (1,'Ir à escola','Ir ao Blanca estudar para ficar inteligente e ser bom no que quiser.','2024-08-19 07:00:00','2024-08-19 12:00:00',0,5.00,6.00,'D',1,1,'2024-08-18 18:56:38','2024-08-18 18:56:38'),
	 (2,'Lavar o carro','Lavar o carro porque ele foi mijado','2024-08-20 07:00:00','2024-08-20 12:00:00',1,5.00,6.00,'M',1,0,'2024-08-18 18:58:24','2024-08-18 18:58:24'),
	 (1,'Tomar um bom café da manhã','O desjejum é uma das refeições mais importantes do dia','2024-08-20 07:00:00','2024-08-20 12:00:00',0,1.00,0.00,'D',1,0,'2024-08-18 19:03:23','2024-08-18 19:03:23'),
	 (1,'Almoçar bem','O almoço é importante, já que ele te energiza depois da escola','2024-08-20 13:00:00','2024-08-20 14:00:00',0,2.00,1.00,'D',1,0,'2024-08-18 19:06:42','2024-08-18 19:06:42'),
	 (1,'Lição de casa','Fazer toda a lição que a professora enviou','2024-08-20 14:30:00','2024-08-20 15:30:00',0,1.00,1.50,'D',1,0,'2024-08-18 19:08:08','2024-08-18 19:08:08'),
	 (1,'Hora do Matific','Fazer as lições obrigatórias do Matific','2024-08-20 15:30:00','2024-08-20 16:00:00',0,1.00,1.50,'D',1,0,'2024-08-18 19:09:38','2024-08-18 19:09:38'),
	 (1,'Hora do Elefante Letrado','Fazer as lições obrigatórias do Elefante Letrado','2024-08-20 15:30:00','2024-08-20 16:00:00',0,1.00,1.50,'D',1,0,'2024-08-18 19:10:41','2024-08-18 19:10:41'),
	 (1,'Café da tarde','Tomar café com a família é a parte mais importante para contar o que aconteceu no dia e fofocas','2024-08-20 18:00:00','2024-08-20 19:00:00',0,0.50,0.00,'D',1,0,'2024-08-18 19:12:12','2024-08-18 19:12:12');


INSERT INTO TarefaItem (
    tarefaId,
    usuarioId,
    dataItem,
    dataFinalizacao,
    finalizado,
    pago,
    ativo,
    dataUltAlt,
    dataCadastro
) VALUES
(1, 1, '2024-09-08', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(2, 1, '2024-09-09', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(3, 1, '2024-09-10', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(4, 1, '2024-09-11', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(5, 1, '2024-09-12', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(6, 1, '2024-09-13', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(7, 1, '2024-09-14', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(8, 1, '2024-09-15', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(1, 1, '2024-09-16', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(2, 1, '2024-09-17', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(3, 1, '2024-09-18', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(4, 1, '2024-09-19', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(5, 1, '2024-09-20', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(6, 1, '2024-09-21', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(7, 1, '2024-09-22', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(8, 1, '2024-09-23', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(1, 1, '2024-09-24', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(2, 1, '2024-09-25', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(3, 1, '2024-09-26', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(4, 1, '2024-09-27', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(5, 1, '2024-09-28', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(6, 1, '2024-09-29', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(7, 1, '2024-09-30', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(8, 1, '2024-10-01', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(1, 1, '2024-10-02', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(2, 1, '2024-10-03', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(3, 1, '2024-10-04', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(4, 1, '2024-10-05', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(5, 1, '2024-10-06', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(6, 1, '2024-10-07', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(7, 1, '2024-10-08', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(8, 1, '2024-10-09', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(1, 1, '2024-10-10', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(2, 1, '2024-10-11', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(3, 1, '2024-10-12', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(4, 1, '2024-10-13', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(5, 1, '2024-10-14', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00'),
(6, 1, '2024-10-15', NULL, false, false, true, '2023-10-01 12:00:00', '2023-10-01 12:00:00');





