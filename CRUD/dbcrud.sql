-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/02/2025 às 18:54
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `academia`
--
CREATE DATABASE IF NOT EXISTS `academia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `academia`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `altura` int(11) DEFAULT NULL,
  `peso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `educadorfisico`
--

CREATE TABLE `educadorfisico` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `data_contratacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exercicios`
--

CREATE TABLE `exercicios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `grupo_muscular_id` int(11) DEFAULT NULL,
  `maquina_solo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupomuscular`
--

CREATE TABLE `grupomuscular` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `maquinasolo`
--

CREATE TABLE `maquinasolo` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `grupo_muscular_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensalidade`
--

CREATE TABLE `mensalidade` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `status` enum('Paga','Pendente') DEFAULT 'Pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `treino`
--

CREATE TABLE `treino` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `educador_fisico_id` int(11) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `treinoexercicios`
--

CREATE TABLE `treinoexercicios` (
  `id` int(11) NOT NULL,
  `treino_id` int(11) DEFAULT NULL,
  `exercicio_id` int(11) DEFAULT NULL,
  `series` int(11) DEFAULT NULL,
  `repeticoes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `educadorfisico`
--
ALTER TABLE `educadorfisico`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `exercicios`
--
ALTER TABLE `exercicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_muscular_id` (`grupo_muscular_id`),
  ADD KEY `maquina_solo_id` (`maquina_solo_id`);

--
-- Índices de tabela `grupomuscular`
--
ALTER TABLE `grupomuscular`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `maquinasolo`
--
ALTER TABLE `maquinasolo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_muscular_id` (`grupo_muscular_id`);

--
-- Índices de tabela `mensalidade`
--
ALTER TABLE `mensalidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices de tabela `treino`
--
ALTER TABLE `treino`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `educador_fisico_id` (`educador_fisico_id`);

--
-- Índices de tabela `treinoexercicios`
--
ALTER TABLE `treinoexercicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `treino_id` (`treino_id`),
  ADD KEY `exercicio_id` (`exercicio_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `educadorfisico`
--
ALTER TABLE `educadorfisico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `exercicios`
--
ALTER TABLE `exercicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `grupomuscular`
--
ALTER TABLE `grupomuscular`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `maquinasolo`
--
ALTER TABLE `maquinasolo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mensalidade`
--
ALTER TABLE `mensalidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `treino`
--
ALTER TABLE `treino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `treinoexercicios`
--
ALTER TABLE `treinoexercicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `exercicios`
--
ALTER TABLE `exercicios`
  ADD CONSTRAINT `exercicios_ibfk_1` FOREIGN KEY (`grupo_muscular_id`) REFERENCES `grupomuscular` (`id`),
  ADD CONSTRAINT `exercicios_ibfk_2` FOREIGN KEY (`maquina_solo_id`) REFERENCES `maquinasolo` (`id`);

--
-- Restrições para tabelas `maquinasolo`
--
ALTER TABLE `maquinasolo`
  ADD CONSTRAINT `maquinasolo_ibfk_1` FOREIGN KEY (`grupo_muscular_id`) REFERENCES `grupomuscular` (`id`);

--
-- Restrições para tabelas `mensalidade`
--
ALTER TABLE `mensalidade`
  ADD CONSTRAINT `mensalidade_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Restrições para tabelas `treino`
--
ALTER TABLE `treino`
  ADD CONSTRAINT `treino_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `treino_ibfk_2` FOREIGN KEY (`educador_fisico_id`) REFERENCES `educadorfisico` (`id`);

--
-- Restrições para tabelas `treinoexercicios`
--
ALTER TABLE `treinoexercicios`
  ADD CONSTRAINT `treinoexercicios_ibfk_1` FOREIGN KEY (`treino_id`) REFERENCES `treino` (`id`),
  ADD CONSTRAINT `treinoexercicios_ibfk_2` FOREIGN KEY (`exercicio_id`) REFERENCES `exercicios` (`id`);
--
-- Banco de dados: `dbbiblioteca`
--
CREATE DATABASE IF NOT EXISTS `dbbiblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbbiblioteca`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbaluno`
--

CREATE TABLE `tbaluno` (
  `NuMatricula` int(11) NOT NULL,
  `NoAluno` varchar(50) DEFAULT NULL,
  `TxIngresso` varchar(6) DEFAULT NULL,
  `IdCurso` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbaluno`
--

INSERT INTO `tbaluno` (`NuMatricula`, `NoAluno`, `TxIngresso`, `IdCurso`) VALUES
(1, 'Jose Maria', '2018.1', 2),
(2, 'Lukas Pol', '2018.1', 2),
(3, 'Camila Silva', '2018.1', 2),
(4, 'Elaine Sheyla', '2018.1', 2),
(5, 'Estevão Henrique', '2018.1', 2),
(6, 'Josenildo', '2019.1', 2),
(7, 'Luiz França', '2019.1', 2),
(8, 'Renata Chagas', '2019.1', 2),
(9, 'Rickson Pessoa', '2019.1', 2),
(10, 'Vinícus Nascimento', '2019.1', 2),
(11, 'Ana Gabriela', '2020.1', 1),
(12, 'Guilherme Simão', '2020.1', 1),
(13, 'João Ricardo', '2020.1', 1),
(14, 'JV Batista', '2020.1', 1),
(15, 'JV Dantas', '2020.1', 1),
(16, 'JV Faustino', '2020.1', 1),
(17, 'Larissa Macedo', '2020.1', 1),
(18, 'Maria Vitória', '2020.1', 1),
(19, 'Camile Nascimento', '2020.1', 1),
(20, 'Roberta Medeiros', '2020.1', 1),
(21, 'Renata Oliveira', '2020.1', 1),
(22, 'Pedro Kauê', '2019.1', 1),
(23, 'Kauanny Oliveira', '2020.1', 1),
(24, 'Jasmini dos Santos', '2017.1', 3),
(25, 'Pedro Renato', '2019.1', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbautor`
--

CREATE TABLE `tbautor` (
  `IdAutor` int(11) NOT NULL,
  `NoAutor` varchar(50) DEFAULT NULL,
  `IdNacionalidade` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbautor`
--

INSERT INTO `tbautor` (`IdAutor`, `NoAutor`, `IdNacionalidade`) VALUES
(1, 'Turley, Paul', 2),
(2, 'Manzano, José', 1),
(3, 'Coronel, Carlos', 1),
(4, 'Sheldon, Sidney', 2),
(5, 'Netto, Vladimir', 1),
(6, 'Peter, Robert', 2),
(7, 'Harrington, Roger', 2),
(8, 'Ryan, James', 2),
(9, 'Brown, Dan', 2),
(10, 'Finlan, Christopher', 2),
(11, 'Sirin, Vladimir', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbautorobra`
--

CREATE TABLE `tbautorobra` (
  `IdAutorObra` int(11) NOT NULL,
  `IdAutor` int(11) DEFAULT NULL,
  `IdObra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbautorobra`
--

INSERT INTO `tbautorobra` (`IdAutorObra`, `IdAutor`, `IdObra`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 3),
(7, 7, 6),
(8, 4, 7),
(9, 8, 8),
(10, 9, 9),
(11, 9, 10),
(12, 10, 1),
(13, 4, 11);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbcurso`
--

CREATE TABLE `tbcurso` (
  `IdCurso` tinyint(4) NOT NULL,
  `NoCurso` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbcurso`
--

INSERT INTO `tbcurso` (`IdCurso`, `NoCurso`) VALUES
(1, 'Informática'),
(2, 'Sistemas para Internet'),
(3, 'Mecatrônica'),
(4, 'Redes de Computadores');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbeditora`
--

CREATE TABLE `tbeditora` (
  `IdEditora` tinyint(11) NOT NULL,
  `NoEditora` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbeditora`
--

INSERT INTO `tbeditora` (`IdEditora`, `NoEditora`) VALUES
(1, 'Erica'),
(2, 'Produção Independente'),
(3, 'Record'),
(4, 'HarperOne'),
(5, 'Ediciones Urano'),
(6, 'Sextante'),
(7, 'Pearson'),
(8, 'Primeira Pessoa'),
(9, 'Wrox');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbemail`
--

CREATE TABLE `tbemail` (
  `IdEmail` int(11) NOT NULL,
  `TxEmail` varchar(50) DEFAULT NULL,
  `NuMatricula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbemail`
--

INSERT INTO `tbemail` (`IdEmail`, `TxEmail`, `NuMatricula`) VALUES
(1, 'josemaria@gmail.com', 1),
(2, 'lukaspol@gmail.com', 2),
(3, 'diegoaraujo@gmail.com', 3),
(4, 'elaine.sheyla@gmail.com', 4),
(5, 'estevaohenrique@gmail.com', 5),
(6, 'josenildo@yahoo.com', 6),
(7, 'luiz_franca@gmail.com', 7),
(8, 'renata.chagas@gmail.com', 8),
(9, 'rickson.pessoa@gmail.com', 9),
(10, 'vinicus.nascimento@gmail.com', 10),
(11, 'ana.gabriela@gmail.com', 11),
(12, 'simao@gmail.com', 12),
(13, 'joao_ricardo@gmail.com', 13),
(14, 'jvbatista@gmail.com', 14),
(15, 'jvdantas@gmail.com', 15),
(16, 'jvfaustino@gmail.com', 16),
(17, 'larissa.macedo@gmail.com', 17),
(18, 'vitoria@gmail.com', 18),
(19, 'camile.nascimento@gmail.com', 19),
(20, 'roberta.abc@gmail.com', 20),
(21, 'renata.oliveira@gmail.com', 21),
(22, 'kaue@gmail.com', 22),
(23, 'kauanny@gmail.com', 23),
(24, 'jasminisantos@gmail.com', 24),
(25, 'pedro-renato@gmail.com', 25);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbemprestimo`
--

CREATE TABLE `tbemprestimo` (
  `IdEmprestimo` int(11) NOT NULL,
  `DaEmprestimo` date DEFAULT NULL,
  `DaPrevisaoDevolucao` date NOT NULL,
  `DaDevolucao` date DEFAULT NULL,
  `IdOperador` int(11) DEFAULT NULL,
  `NuMatricula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbemprestimo`
--

INSERT INTO `tbemprestimo` (`IdEmprestimo`, `DaEmprestimo`, `DaPrevisaoDevolucao`, `DaDevolucao`, `IdOperador`, `NuMatricula`) VALUES
(1, '2019-05-21', '2019-05-23', '2019-05-23', 2030, 1),
(2, '2019-05-21', '2019-05-24', '2019-05-24', 2030, 2),
(3, '2019-06-19', '2019-06-21', '2019-06-21', 2000, 3),
(4, '2019-06-17', '2019-06-20', NULL, 2000, 4),
(5, '2019-06-20', '2019-06-24', '2019-06-25', 2000, 10),
(6, '2019-06-24', '2019-06-26', '2019-06-26', 2030, 20),
(7, '2019-06-17', '2019-06-19', '2019-06-19', 2031, 21),
(8, '2019-06-11', '2019-06-13', '2019-06-13', 2031, 15),
(9, '2019-06-24', '2019-06-26', NULL, 2030, 14),
(10, '2019-06-18', '2019-06-21', '2019-06-24', 2000, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbemprestimoitem`
--

CREATE TABLE `tbemprestimoitem` (
  `IdEmprestimoItem` int(11) NOT NULL,
  `IdObra` int(11) DEFAULT NULL,
  `IdEmprestimo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbemprestimoitem`
--

INSERT INTO `tbemprestimoitem` (`IdEmprestimoItem`, `IdObra`, `IdEmprestimo`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(4, 10, 3),
(5, 5, 4),
(6, 6, 4),
(7, 9, 4),
(8, 8, 5),
(9, 3, 5),
(10, 1, 6),
(11, 7, 6),
(12, 10, 6),
(13, 4, 7),
(14, 7, 7),
(15, 1, 8),
(16, 1, 9),
(17, 10, 9),
(18, 1, 10),
(19, 2, 10),
(20, 3, 10),
(21, 4, 10),
(22, 5, 10),
(23, 6, 10),
(24, 7, 10),
(25, 8, 10),
(26, 9, 10),
(27, 10, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbidioma`
--

CREATE TABLE `tbidioma` (
  `IdIdioma` tinyint(4) NOT NULL,
  `NoIdioma` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbidioma`
--

INSERT INTO `tbidioma` (`IdIdioma`, `NoIdioma`) VALUES
(1, 'Portugês'),
(2, 'Inglês'),
(3, 'Espanhol');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbnacionalidade`
--

CREATE TABLE `tbnacionalidade` (
  `IdNacionalidade` tinyint(4) NOT NULL,
  `NoNacionalidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbnacionalidade`
--

INSERT INTO `tbnacionalidade` (`IdNacionalidade`, `NoNacionalidade`) VALUES
(1, 'Brasileiro'),
(2, 'Americano'),
(3, 'Suiço');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbobra`
--

CREATE TABLE `tbobra` (
  `IdObra` int(11) NOT NULL,
  `NoObra` varchar(150) DEFAULT NULL,
  `NuAno` smallint(6) DEFAULT NULL,
  `NuEdicao` tinyint(4) DEFAULT NULL,
  `VaPreco` decimal(5,2) DEFAULT NULL,
  `IdIdioma` tinyint(4) DEFAULT NULL,
  `IdEditora` tinyint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbobra`
--

INSERT INTO `tbobra` (`IdObra`, `NoObra`, `NuAno`, `NuEdicao`, `VaPreco`, `IdIdioma`, `IdEditora`) VALUES
(1, 'Professional Microsoft SQL Server 2016', 2017, 1, 179.57, 2, 9),
(2, 'Microsoft Essencial Windows 7 Professional', 2010, 2, 103.90, 1, 1),
(3, 'Sistemas de Banco de Dados', 2010, 8, 239.99, 1, 7),
(4, 'Manhã, Tarde e Noite', 2011, 23, 28.78, 1, 3),
(5, 'Lava Jato', 2016, 3, 49.90, 1, 8),
(6, 'How to get Away with Murder', 2017, 10, 44.00, 2, 2),
(7, 'Plano Perfeito', 2011, 1, 36.97, 1, 3),
(8, 'Wait, What?', 2017, 1, 41.00, 2, 4),
(9, 'La Fortaleza Digital', 2009, NULL, 130.00, 3, 5),
(10, 'Ponto de Impacto', 2005, 1, 62.00, 1, 6),
(11, 'Juízo Final', 2011, 1, 29.94, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tboperador`
--

CREATE TABLE `tboperador` (
  `IdOperador` int(11) NOT NULL,
  `NoOperador` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tboperador`
--

INSERT INTO `tboperador` (`IdOperador`, `NoOperador`) VALUES
(2000, 'Admin'),
(2030, 'Procopio'),
(2031, 'Paiva');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbaluno`
--
ALTER TABLE `tbaluno`
  ADD PRIMARY KEY (`NuMatricula`),
  ADD KEY `CoCurso` (`IdCurso`);

--
-- Índices de tabela `tbautor`
--
ALTER TABLE `tbautor`
  ADD PRIMARY KEY (`IdAutor`),
  ADD KEY `IdNacionalidade` (`IdNacionalidade`);

--
-- Índices de tabela `tbautorobra`
--
ALTER TABLE `tbautorobra`
  ADD PRIMARY KEY (`IdAutorObra`),
  ADD KEY `IdAutor` (`IdAutor`),
  ADD KEY `IdObra` (`IdObra`);

--
-- Índices de tabela `tbcurso`
--
ALTER TABLE `tbcurso`
  ADD PRIMARY KEY (`IdCurso`);

--
-- Índices de tabela `tbeditora`
--
ALTER TABLE `tbeditora`
  ADD PRIMARY KEY (`IdEditora`);

--
-- Índices de tabela `tbemail`
--
ALTER TABLE `tbemail`
  ADD PRIMARY KEY (`IdEmail`),
  ADD KEY `NuMatricula` (`NuMatricula`);

--
-- Índices de tabela `tbemprestimo`
--
ALTER TABLE `tbemprestimo`
  ADD PRIMARY KEY (`IdEmprestimo`),
  ADD KEY `fk_IdOperador` (`IdOperador`),
  ADD KEY `fk_NuMatricula` (`NuMatricula`);

--
-- Índices de tabela `tbemprestimoitem`
--
ALTER TABLE `tbemprestimoitem`
  ADD PRIMARY KEY (`IdEmprestimoItem`),
  ADD KEY `fk_IdObra` (`IdObra`),
  ADD KEY `fk_IdEmprestimo` (`IdEmprestimo`);

--
-- Índices de tabela `tbidioma`
--
ALTER TABLE `tbidioma`
  ADD PRIMARY KEY (`IdIdioma`);

--
-- Índices de tabela `tbnacionalidade`
--
ALTER TABLE `tbnacionalidade`
  ADD PRIMARY KEY (`IdNacionalidade`);

--
-- Índices de tabela `tbobra`
--
ALTER TABLE `tbobra`
  ADD PRIMARY KEY (`IdObra`),
  ADD KEY `IdIdioma` (`IdIdioma`),
  ADD KEY `IdEditora` (`IdEditora`);

--
-- Índices de tabela `tboperador`
--
ALTER TABLE `tboperador`
  ADD PRIMARY KEY (`IdOperador`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbautor`
--
ALTER TABLE `tbautor`
  MODIFY `IdAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbaluno`
--
ALTER TABLE `tbaluno`
  ADD CONSTRAINT `CoCurso` FOREIGN KEY (`IdCurso`) REFERENCES `tbcurso` (`IdCurso`);

--
-- Restrições para tabelas `tbautor`
--
ALTER TABLE `tbautor`
  ADD CONSTRAINT `IdNacionalidade` FOREIGN KEY (`IdNacionalidade`) REFERENCES `tbnacionalidade` (`IdNacionalidade`);

--
-- Restrições para tabelas `tbautorobra`
--
ALTER TABLE `tbautorobra`
  ADD CONSTRAINT `IdAutor` FOREIGN KEY (`IdAutor`) REFERENCES `tbautor` (`IdAutor`),
  ADD CONSTRAINT `IdObra` FOREIGN KEY (`IdObra`) REFERENCES `tbobra` (`IdObra`);

--
-- Restrições para tabelas `tbemail`
--
ALTER TABLE `tbemail`
  ADD CONSTRAINT `NuMatricula` FOREIGN KEY (`NuMatricula`) REFERENCES `tbaluno` (`NuMatricula`);

--
-- Restrições para tabelas `tbemprestimo`
--
ALTER TABLE `tbemprestimo`
  ADD CONSTRAINT `fk_IdOperador` FOREIGN KEY (`IdOperador`) REFERENCES `tboperador` (`IdOperador`),
  ADD CONSTRAINT `fk_NuMatricula` FOREIGN KEY (`NuMatricula`) REFERENCES `tbaluno` (`NuMatricula`);

--
-- Restrições para tabelas `tbemprestimoitem`
--
ALTER TABLE `tbemprestimoitem`
  ADD CONSTRAINT `fk_IdEmprestimo` FOREIGN KEY (`IdEmprestimo`) REFERENCES `tbemprestimo` (`IdEmprestimo`),
  ADD CONSTRAINT `fk_IdObra` FOREIGN KEY (`IdObra`) REFERENCES `tbobra` (`IdObra`);

--
-- Restrições para tabelas `tbobra`
--
ALTER TABLE `tbobra`
  ADD CONSTRAINT `FK_EditoraObra` FOREIGN KEY (`IdEditora`) REFERENCES `tbeditora` (`IdEditora`),
  ADD CONSTRAINT `IdIdioma` FOREIGN KEY (`IdIdioma`) REFERENCES `tbidioma` (`IdIdioma`);
--
-- Banco de dados: `dbcrud`
--
CREATE DATABASE IF NOT EXISTS `dbcrud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbcrud`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbusuarios`
--

CREATE TABLE `tbusuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `senha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbusuarios`
--
ALTER TABLE `tbusuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbusuarios`
--
ALTER TABLE `tbusuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `dbeleicao_rn`
--
CREATE DATABASE IF NOT EXISTS `dbeleicao_rn` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbeleicao_rn`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbcandidato`
--

CREATE TABLE `tbcandidato` (
  `NuCandidato` int(11) NOT NULL,
  `NoCandidato` varchar(50) NOT NULL,
  `CoCargo` tinyint(4) NOT NULL,
  `CoPartido` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbcandidato`
--

INSERT INTO `tbcandidato` (`NuCandidato`, `NoCandidato`, `CoCargo`, `CoPartido`) VALUES
(1, 'Antônio Bento', 1, 15),
(2, 'Capitão Styvenson', 1, 18),
(3, 'Clorisa Linhares', 1, 26),
(4, 'Danniel Morais', 1, 20),
(5, 'Fábio Dantas', 1, 23),
(6, 'Fátima Bezerra', 1, 3),
(7, 'Nazareno Neris', 1, 8),
(8, 'Rodrigo Vieira', 1, 16),
(9, 'Rosália Fernandes', 1, 13),
(10, 'Carlos Eduardo', 2, 2),
(11, 'Dário Barbosa', 2, 13),
(12, 'Freitas Jr.', 2, 20),
(13, 'Geraldo Pinho', 2, 18),
(14, 'Marcelo Guerreiro', 2, 15),
(15, 'Pastor Silvestre', 2, 8),
(16, 'Rafael Motta', 2, 5),
(17, 'Rogério Marinho', 2, 21),
(18, 'Shirlei Medeiros', 2, 16),
(19, 'Natália Bonavides', 3, 3),
(20, 'João Maia', 3, 21),
(21, 'Benes Leocádio', 3, 28),
(22, 'Robinson Faria', 3, 21),
(23, 'Mineiro', 3, 3),
(24, 'Paulinho Freire', 3, 28),
(25, 'General Girão', 3, 21),
(26, 'Sargento Gonçalves', 3, 21),
(27, 'Ezequiel Ferreira', 4, 6),
(28, 'Coronel Azevedo', 4, 21),
(29, 'Kleber Rodrigues', 4, 6),
(30, 'Adjuto Dias', 4, 1),
(31, 'Isolda Dantas', 4, 3),
(32, 'Bernardo Amorim', 4, 6),
(33, 'Divaneide', 4, 3),
(34, 'Francisco do PT', 4, 3),
(35, 'George Soares', 4, 10),
(36, 'José Dias', 4, 6),
(37, 'Dr. Keginaldo Jacome', 4, 6),
(38, 'Tomba Farias', 4, 6),
(39, 'Cristiane Dantas', 4, 23),
(40, 'Nelter Queiroz', 4, 6),
(41, 'Galeno Torquato', 4, 6),
(42, 'Eudiane Macedo', 4, 10),
(43, 'Ubaldo Fernandes', 4, 6),
(44, 'Luiz Eduardo', 4, 23),
(45, 'Terezinha Maia', 4, 21),
(46, 'Hermano Morais', 4, 10),
(47, 'Ivanilson Oliveira', 4, 28),
(48, 'Taveira Jr', 4, 28),
(49, 'Neilton', 4, 21),
(100, 'General Samuel', 1, 21),
(101, '100', 1, 21),
(102, '26', 1, 21);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbcargo`
--

CREATE TABLE `tbcargo` (
  `CoCargo` tinyint(4) NOT NULL,
  `NoCargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbcargo`
--

INSERT INTO `tbcargo` (`CoCargo`, `NoCargo`) VALUES
(1, 'Governador'),
(2, 'Senador'),
(3, 'Deputado federal'),
(4, 'Deputado estadual');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tborientacao`
--

CREATE TABLE `tborientacao` (
  `CoOrientacao` tinyint(4) NOT NULL,
  `NoOrientacao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tborientacao`
--

INSERT INTO `tborientacao` (`CoOrientacao`, `NoOrientacao`) VALUES
(1, 'Esquerda'),
(2, 'Centro'),
(3, 'Centro-esquerda'),
(4, 'Direita'),
(5, 'Centro-direita');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbpartido`
--

CREATE TABLE `tbpartido` (
  `CoPartido` tinyint(4) NOT NULL,
  `SgPartido` varchar(10) NOT NULL,
  `NoPartido` varchar(50) NOT NULL,
  `CoOrientacao` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbpartido`
--

INSERT INTO `tbpartido` (`CoPartido`, `SgPartido`, `NoPartido`, `CoOrientacao`) VALUES
(1, 'MDB', 'MOVIMENTO DEMOCRÁTICO BRASILEIRO', 2),
(2, 'PDT', 'PARTIDO DEMOCRÁTICO TRABALHISTA', 3),
(3, 'PT', 'PARTIDO DOS TRABALHADORES', 1),
(4, 'PCdoB', 'PARTIDO COMUNISTA DO BRASIL', 1),
(5, 'PSB', 'PARTIDO SOCIALISTA BRASILEIRO', 3),
(6, 'PSDB', 'PARTIDO DA SOCIAL DEMOCRACIA BRASILEIRA', 5),
(7, 'AGIR', 'AGIR', NULL),
(8, 'PMN', 'Partido da Mobilização Nacional', 2),
(9, 'CIDADANIA', 'CIDADANIA', 2),
(10, 'PV', 'PARTIDO VERDE', 2),
(11, 'AVANTE', 'AVANTE', 2),
(12, 'PP', 'PROGRESSISTAS', 5),
(13, 'PSTU', 'PARTIDO SOCIALISTA DOS TRABALHADORES UNIFICADO', 1),
(14, 'PCB', 'PARTIDO COMUNISTA BRASILEIRO', 1),
(15, 'PRTB', 'PARTIDO RENOVADOR TRABALHISTA BRASILEIRO', 2),
(16, 'DC', 'DEMOCRACIA CRISTÃ', 5),
(17, 'PCO', 'PARTIDO DA CAUSA OPERÁRIA', 1),
(18, 'PODE', 'PODEMOS', 2),
(19, 'REPUBLICAN', 'REPUBLICANOS', 5),
(20, 'PSOL', 'PARTIDO SOCIALISMO E LIBERDADE', 1),
(21, 'PL', 'PARTIDO LIBERAL', 5),
(22, 'PSD', 'PARTIDO SOCIAL DEMOCRÁTICO', 2),
(23, 'PSD', 'SOLIDARIEDADE', 2),
(24, 'NOVO', 'PARTIDO NOVO', 5),
(25, 'REDE', 'REDE SUSTENTABILIDADE', 2),
(26, 'PMB', 'PARTIDO DA MULHER BRASILEIRA', 1),
(27, 'UP', 'UNIDADE POPULAR', 1),
(28, 'UNIÃO', 'UNIÃO BRASIL', NULL),
(29, 'PRD', 'PARTIDO RENOVAÇÃO DEMOCRÁTICA', NULL),
(33, 'HKD', 'Partido Heck Doido', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbvotos`
--

CREATE TABLE `tbvotos` (
  `IdVoto` int(11) NOT NULL,
  `IdZona` int(11) NOT NULL,
  `NuCandidato` int(11) NOT NULL,
  `QtVotos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbvotos`
--

INSERT INTO `tbvotos` (`IdVoto`, `IdZona`, `NuCandidato`, `QtVotos`) VALUES
(1, 1, 1, 17705),
(2, 1, 2, 83925),
(3, 1, 3, 66711),
(4, 1, 4, 81682),
(5, 1, 5, 8374),
(6, 1, 6, 96427),
(7, 1, 7, 57310),
(8, 1, 8, 97070),
(9, 1, 9, 13620),
(10, 1, 10, 76492),
(11, 1, 11, 41798),
(12, 1, 12, 79315),
(13, 1, 13, 71282),
(14, 1, 14, 18465),
(15, 1, 15, 78178),
(16, 1, 16, 35697),
(17, 1, 17, 43749),
(18, 1, 18, 11656),
(19, 1, 19, 26834),
(20, 1, 20, 99101),
(21, 1, 21, 15301),
(22, 1, 22, 78804),
(23, 1, 23, 48318),
(24, 1, 24, 5075),
(25, 1, 25, 80124),
(26, 1, 26, 85595),
(27, 1, 27, 87603),
(28, 1, 28, 81231),
(29, 1, 29, 43346),
(30, 1, 30, 72837),
(31, 1, 31, 34246),
(32, 1, 32, 52518),
(33, 1, 33, 59852),
(34, 1, 34, 41708),
(35, 1, 35, 28881),
(36, 1, 36, 19182),
(37, 1, 37, 9169),
(38, 1, 38, 88096),
(39, 1, 39, 13274),
(40, 1, 40, 1781),
(41, 1, 41, 68884),
(42, 1, 42, 39279),
(43, 1, 43, 89541),
(44, 1, 44, 30068),
(45, 1, 45, 81419),
(46, 1, 46, 17089),
(47, 1, 47, 40889),
(48, 1, 48, 53179),
(49, 1, 49, 43228),
(50, 2, 1, 56501),
(51, 2, 2, 52821),
(52, 2, 3, 94502),
(53, 2, 4, 14249),
(54, 2, 5, 87339),
(55, 2, 6, 94148),
(56, 2, 7, 8821),
(57, 2, 8, 61264),
(58, 2, 9, 79956),
(59, 2, 10, 16089),
(60, 2, 11, 40278),
(61, 2, 12, 53120),
(62, 2, 13, 44766),
(63, 2, 14, 64372),
(64, 2, 15, 87562),
(65, 2, 16, 44794),
(66, 2, 17, 61082),
(67, 2, 18, 71028),
(68, 2, 19, 71895),
(69, 2, 20, 46391),
(70, 2, 21, 16169),
(71, 2, 22, 41473),
(72, 2, 23, 58856),
(73, 2, 24, 69862),
(74, 2, 25, 72743),
(75, 2, 26, 54127),
(76, 2, 27, 52308),
(77, 2, 28, 99059),
(78, 2, 29, 38570),
(79, 2, 30, 95375),
(80, 2, 31, 61363),
(81, 2, 32, 20589),
(82, 2, 33, 18659),
(83, 2, 34, 31427),
(84, 2, 35, 1158),
(85, 2, 36, 11307),
(86, 2, 37, 52964),
(87, 2, 38, 30999),
(88, 2, 39, 95901),
(89, 2, 40, 86710),
(90, 2, 41, 45847),
(91, 2, 42, 68903),
(92, 2, 43, 7076),
(93, 2, 44, 28369),
(94, 2, 45, 20617),
(95, 2, 46, 17877),
(96, 2, 47, 27435),
(97, 2, 48, 83444),
(98, 2, 49, 35115),
(99, 3, 1, 25045),
(100, 3, 2, 19777),
(101, 3, 3, 23650),
(102, 3, 4, 58820),
(103, 3, 5, 23251),
(104, 3, 6, 39595),
(105, 3, 7, 28223),
(106, 3, 8, 22229),
(107, 3, 9, 26375),
(108, 3, 10, 65089),
(109, 3, 11, 46419),
(110, 3, 12, 36730),
(111, 3, 13, 44294),
(112, 3, 14, 11277),
(113, 3, 15, 23306),
(114, 3, 16, 82598),
(115, 3, 17, 43272),
(116, 3, 18, 68368),
(117, 3, 19, 12121),
(118, 3, 20, 55201),
(119, 3, 21, 39743),
(120, 3, 22, 33010),
(121, 3, 23, 45721),
(122, 3, 24, 29576),
(123, 3, 25, 10618),
(124, 3, 26, 64162),
(125, 3, 27, 89058),
(126, 3, 28, 52900),
(127, 3, 29, 97129),
(128, 3, 30, 27143),
(129, 3, 31, 44029),
(130, 3, 32, 38716),
(131, 3, 33, 61394),
(132, 3, 34, 90820),
(133, 3, 35, 70019),
(134, 3, 36, 77533),
(135, 3, 37, 77608),
(136, 3, 38, 55443),
(137, 3, 39, 44292),
(138, 3, 40, 55031),
(139, 3, 41, 42277),
(140, 3, 42, 46194),
(141, 3, 43, 4138),
(142, 3, 44, 81809),
(143, 3, 45, 96830),
(144, 3, 46, 38822),
(145, 3, 47, 3422),
(146, 3, 48, 442),
(147, 3, 49, 91745),
(148, 4, 1, 57697),
(149, 4, 2, 13151),
(150, 4, 3, 92366),
(151, 4, 4, 22676),
(152, 4, 5, 35982),
(153, 4, 6, 11881),
(154, 4, 7, 51260),
(155, 4, 8, 20756),
(156, 4, 9, 49801),
(157, 4, 10, 86739),
(158, 4, 11, 84389),
(159, 4, 12, 61728),
(160, 4, 13, 55375),
(161, 4, 14, 91590),
(162, 4, 15, 91927),
(163, 4, 16, 84864),
(164, 4, 17, 48539),
(165, 4, 18, 87902),
(166, 4, 19, 93994),
(167, 4, 20, 6366),
(168, 4, 21, 49445),
(169, 4, 22, 28227),
(170, 4, 23, 92599),
(171, 4, 24, 78515),
(172, 4, 25, 14778),
(173, 4, 26, 38045),
(174, 4, 27, 45891),
(175, 4, 28, 15321),
(176, 4, 29, 38733),
(177, 4, 30, 47699),
(178, 4, 31, 22296),
(179, 4, 32, 68184),
(180, 4, 33, 74134),
(181, 4, 34, 66115),
(182, 4, 35, 8175),
(183, 4, 36, 42227),
(184, 4, 37, 86613),
(185, 4, 38, 6585),
(186, 4, 39, 72685),
(187, 4, 40, 43870),
(188, 4, 41, 1197),
(189, 4, 42, 74071),
(190, 4, 43, 66968),
(191, 4, 44, 12624),
(192, 4, 45, 61919),
(193, 4, 46, 71821),
(194, 4, 47, 73348),
(195, 4, 48, 51278),
(196, 4, 49, 36245);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbzona`
--

CREATE TABLE `tbzona` (
  `IdZona` int(11) NOT NULL,
  `NoZona` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbzona`
--

INSERT INTO `tbzona` (`IdZona`, `NoZona`) VALUES
(1, 'Região Oeste Potiguar'),
(2, 'Central Potiguar'),
(3, 'Agreste Potiguar'),
(4, 'Leste Potiguar');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbcandidato`
--
ALTER TABLE `tbcandidato`
  ADD PRIMARY KEY (`NuCandidato`),
  ADD KEY `TbCandidato_fk0` (`CoCargo`),
  ADD KEY `TbCandidato_fk1` (`CoPartido`);

--
-- Índices de tabela `tbcargo`
--
ALTER TABLE `tbcargo`
  ADD PRIMARY KEY (`CoCargo`);

--
-- Índices de tabela `tborientacao`
--
ALTER TABLE `tborientacao`
  ADD PRIMARY KEY (`CoOrientacao`);

--
-- Índices de tabela `tbpartido`
--
ALTER TABLE `tbpartido`
  ADD PRIMARY KEY (`CoPartido`),
  ADD KEY `TbPartido_fk0` (`CoOrientacao`);

--
-- Índices de tabela `tbvotos`
--
ALTER TABLE `tbvotos`
  ADD PRIMARY KEY (`IdVoto`),
  ADD KEY `TbVotos_fk0` (`IdZona`),
  ADD KEY `TbVotos_fk1` (`NuCandidato`);

--
-- Índices de tabela `tbzona`
--
ALTER TABLE `tbzona`
  ADD PRIMARY KEY (`IdZona`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbcandidato`
--
ALTER TABLE `tbcandidato`
  MODIFY `NuCandidato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de tabela `tbcargo`
--
ALTER TABLE `tbcargo`
  MODIFY `CoCargo` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tborientacao`
--
ALTER TABLE `tborientacao`
  MODIFY `CoOrientacao` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbpartido`
--
ALTER TABLE `tbpartido`
  MODIFY `CoPartido` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `tbvotos`
--
ALTER TABLE `tbvotos`
  MODIFY `IdVoto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT de tabela `tbzona`
--
ALTER TABLE `tbzona`
  MODIFY `IdZona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbcandidato`
--
ALTER TABLE `tbcandidato`
  ADD CONSTRAINT `TbCandidato_fk0` FOREIGN KEY (`CoCargo`) REFERENCES `tbcargo` (`CoCargo`),
  ADD CONSTRAINT `TbCandidato_fk1` FOREIGN KEY (`CoPartido`) REFERENCES `tbpartido` (`CoPartido`);

--
-- Restrições para tabelas `tbpartido`
--
ALTER TABLE `tbpartido`
  ADD CONSTRAINT `TbPartido_fk0` FOREIGN KEY (`CoOrientacao`) REFERENCES `tborientacao` (`CoOrientacao`);

--
-- Restrições para tabelas `tbvotos`
--
ALTER TABLE `tbvotos`
  ADD CONSTRAINT `TbVotos_fk0` FOREIGN KEY (`IdZona`) REFERENCES `tbzona` (`IdZona`),
  ADD CONSTRAINT `TbVotos_fk1` FOREIGN KEY (`NuCandidato`) REFERENCES `tbcandidato` (`NuCandidato`);
--
-- Banco de dados: `dbescola`
--
CREATE DATABASE IF NOT EXISTS `dbescola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbescola`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbalunos`
--

CREATE TABLE `tbalunos` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `altura` float DEFAULT NULL,
  `bolsa` float DEFAULT 0,
  `matricula_professor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbalunos`
--

INSERT INTO `tbalunos` (`matricula`, `nome`, `idade`, `altura`, `bolsa`, `matricula_professor`) VALUES
(1, 'Samuel Augusto', 17, 1.65, 0, 666),
(2, 'Chad', 20, 2.02, 1000, 666);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbprofessores`
--

CREATE TABLE `tbprofessores` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `altura` float DEFAULT NULL,
  `salário` float DEFAULT NULL,
  `matéria` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbprofessores`
--

INSERT INTO `tbprofessores` (`matricula`, `nome`, `idade`, `altura`, `salário`, `matéria`) VALUES
(666, 'Seu Barriga', 70, 1.5, 10000, 'Portugays');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbalunos`
--
ALTER TABLE `tbalunos`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `fk_matricula_professor` (`matricula_professor`);

--
-- Índices de tabela `tbprofessores`
--
ALTER TABLE `tbprofessores`
  ADD PRIMARY KEY (`matricula`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbalunos`
--
ALTER TABLE `tbalunos`
  ADD CONSTRAINT `fk_matricula_professor` FOREIGN KEY (`matricula_professor`) REFERENCES `tbprofessores` (`matricula`);
--
-- Banco de dados: `dbestante`
--
CREATE DATABASE IF NOT EXISTS `dbestante` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbestante`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbautor`
--

CREATE TABLE `tbautor` (
  `CoAutor` smallint(6) NOT NULL,
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbautor`
--

INSERT INTO `tbautor` (`CoAutor`, `Nome`) VALUES
(1, 'Stephen King'),
(2, 'Sidney Sheldon'),
(3, 'Mark Manson'),
(4, 'Fábio Procópio'),
(5, 'Dan Brown');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbcategoria`
--

CREATE TABLE `tbcategoria` (
  `CoCategoria` tinyint(4) NOT NULL,
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbcategoria`
--

INSERT INTO `tbcategoria` (`CoCategoria`, `Nome`) VALUES
(1, 'Ficção científica'),
(2, 'Terror'),
(3, 'Suspense'),
(4, 'Romance'),
(5, 'Policial'),
(6, 'Autoajuda'),
(7, 'Documentário');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbeditora`
--

CREATE TABLE `tbeditora` (
  `CoEditora` smallint(6) NOT NULL,
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbeditora`
--

INSERT INTO `tbeditora` (`CoEditora`, `Nome`) VALUES
(1, 'Record'),
(2, 'Suma'),
(3, 'Intrínseca'),
(4, 'Editora Arqueiro');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbidioma`
--

CREATE TABLE `tbidioma` (
  `CoIdioma` tinyint(4) NOT NULL,
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbidioma`
--

INSERT INTO `tbidioma` (`CoIdioma`, `Nome`) VALUES
(1, 'Português'),
(2, 'Inglês'),
(3, 'Espanhol');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tblivro`
--

CREATE TABLE `tblivro` (
  `CoLivro` bigint(20) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Ano` smallint(6) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Estado` tinyint(4) NOT NULL,
  `Preco` decimal(7,2) NOT NULL,
  `Descricao` varchar(100) NOT NULL,
  `Sinopse` text NOT NULL,
  `CoIdioma` tinyint(4) NOT NULL,
  `CoEditora` smallint(6) NOT NULL,
  `CoCategoria` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tblivro`
--

INSERT INTO `tblivro` (`CoLivro`, `ISBN`, `Ano`, `Titulo`, `Estado`, `Preco`, `Descricao`, `Sinopse`, `CoIdioma`, `CoEditora`, `CoCategoria`) VALUES
(1, '9788560280940', 2014, 'It: A coisa', 1, 46.00, 'Livro em excelente estado, sem grifos ou amassados.', 'Nesse clássico que inspirou os filmes da Warner, um grupo de amigos conhecido como Clube dos Otários aprende o real sentido da amizade, do amor, da confiança... e do medo. O mais profundo e tenebroso medo. Durante as férias de 1958, em uma pacata cidadezinha chamada Derry, um grupo de sete amigos começa a ver coisas estranhas. Um conta que viu um palhaço, outro que viu uma múmia. Finalmente, acabam descobrindo que estavam todos vendo a mesma coisa: um ser sobrenatural e maligno que pode assumir várias formas. É assim que Bill, Beverly, Eddie, Ben, Richie, Mike e Stan enfrentam a Coisa pela primeira vez. Quase trinta anos depois, o grupo volta a se encontrar. Mike, o único que permaneceu em Derry, dá o sinal — uma nova onda de terror tomou a pequena cidade. É preciso unir forças novamente. Só eles têm a chave do enigma. Só eles sabem o que se esconde nas entranhas de Derry. Só eles podem vencer a Coisa. “Mesmo depois de tantos anos, o público continua obcecado por IT. Ficamos obcecados porque todos temos medos. Todos temos algo que nos assusta, sejam palhaços e aranhas ou coisas que se escondem em um lugar muito mais profundo de nossa mente. Este livro fala com todo mundo. É o romance mais assustador de King, e duvido que isso vá mudar” — The Guardian', 1, 2, 2),
(2, '9788551002490', 2017, 'A sutil arte de ligar o f*da-se', 1, 12.00, 'Livro em ótimo estado de conservação.Anotações, dedicatoria, sublinhados e marcações a caneta / lapi', 'Chega de tentar buscar um sucesso que só existe na sua cabeça. Chega de se torturar para pensar positivo enquanto sua vida vai ladeira abaixo. Chega de se sentir inferior por não ver o lado bom de estar no fundo do poço.Coaching, autoajuda, desenvolvimento pessoal, mentalização positiva - sem querer desprezar o valor de nada disso, a grande verdade é que às vezes nos sentimos quase sufocados diante da pressão infinita por parecermos otimistas o tempo todo. É um pecado social se deixar abater quando as coisas não vão bem. Ninguém pode fracassar simplesmente, sem aprender nada com isso. Não dá mais. É insuportável. E é aí que entra a revolucionária e sutil arte de ligar o foda-se.Mark Manson usa toda a sua sagacidade de escritor e seu olhar crítico para propor um novo caminho rumo a uma vida melhor, mais coerente com a realidade e consciente dos nossos limites. E ele faz isso da melhor maneira. Como um verdadeiro amigo, Mark se senta ao seu lado e diz, olhando nos seus olhos: você não é tão especial. Ele conta umas piadas aqui, dá uns exemplos inusitados ali, joga umas verdades na sua cara e pronto, você já se sente muito mais alerta e capaz de enfrentar esse mundo cão.Para os céticos e os descrentes, mas também para os amantes do gênero, enfim uma abordagem franca e inteligente que vai ajudar você a descobrir o que é realmente importante na sua vida, e f*da-se o resto. Livre-se agora da felicidade maquiada e superficial e abrace esta arte verdadeiramente transformadora.', 1, 3, 6),
(3, '9788501044464', 1996, 'Manhã, Tarde e Noite', 2, 12.99, '14x21cms. 353pgs. Nome de ex dona na capa por dentro, ótimo estado de conservação, paginas levemente', '4x21cms. 353pgs. Nome de ex dona na capa por dentro, ótimo estado de conservação, paginas levemente amareladas do tempo sem grifos ou rasgos, miolo e lombar firmes e sem detalhes, capa ilustrativa,', 1, 1, 3),
(10, '6.0', 2005, 'O Código Da Vinci', 127, 0.00, 'Livro com poucas manchas amarelas pela ação do tempo. Conteúdo sem anotações. 428 páginas. Estoque M', '1', 1, 4, 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tblivroautor`
--

CREATE TABLE `tblivroautor` (
  `IdLivroAutor` int(11) NOT NULL,
  `CoAutor` smallint(6) NOT NULL,
  `CoLivro` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tblivroautor`
--

INSERT INTO `tblivroautor` (`IdLivroAutor`, `CoAutor`, `CoLivro`) VALUES
(1, 1, 1),
(3, 3, 2),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tblivrovendedor`
--

CREATE TABLE `tblivrovendedor` (
  `IdLivroVendedor` bigint(20) NOT NULL,
  `CoVendedor` smallint(6) NOT NULL,
  `CoLivro` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tblivrovendedor`
--

INSERT INTO `tblivrovendedor` (`IdLivroVendedor`, `CoVendedor`, `CoLivro`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbvendedor`
--

CREATE TABLE `tbvendedor` (
  `CoVendedor` smallint(6) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Avaliacao` tinyint(4) NOT NULL,
  `Filiacao` date NOT NULL,
  `Descricao` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbvendedor`
--

INSERT INTO `tbvendedor` (`CoVendedor`, `Nome`, `Avaliacao`, `Filiacao`, `Descricao`) VALUES
(1, 'Livraria Diálogo e Cultura 1', 80, '2017-09-29', '(Não informada)'),
(2, 'Sebo Nova Esperança', 95, '2020-02-21', '(Não informada)'),
(3, 'Sebo do Faria', 96, '2008-12-05', 'Venda de Livros,vinis, cds e fitas VHS usadas e semi-novas.');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbautor`
--
ALTER TABLE `tbautor`
  ADD PRIMARY KEY (`CoAutor`),
  ADD UNIQUE KEY `CoAutor` (`CoAutor`);

--
-- Índices de tabela `tbcategoria`
--
ALTER TABLE `tbcategoria`
  ADD PRIMARY KEY (`CoCategoria`),
  ADD UNIQUE KEY `CoCategoria` (`CoCategoria`);

--
-- Índices de tabela `tbeditora`
--
ALTER TABLE `tbeditora`
  ADD PRIMARY KEY (`CoEditora`),
  ADD UNIQUE KEY `CoEditora` (`CoEditora`);

--
-- Índices de tabela `tbidioma`
--
ALTER TABLE `tbidioma`
  ADD PRIMARY KEY (`CoIdioma`),
  ADD UNIQUE KEY `CoIdioma` (`CoIdioma`);

--
-- Índices de tabela `tblivro`
--
ALTER TABLE `tblivro`
  ADD PRIMARY KEY (`CoLivro`),
  ADD UNIQUE KEY `CoLivro` (`CoLivro`),
  ADD KEY `TbLivro_fk8` (`CoIdioma`),
  ADD KEY `TbLivro_fk9` (`CoEditora`),
  ADD KEY `TbLivro_fk10` (`CoCategoria`);

--
-- Índices de tabela `tblivroautor`
--
ALTER TABLE `tblivroautor`
  ADD PRIMARY KEY (`IdLivroAutor`),
  ADD UNIQUE KEY `IdLivroAutor` (`IdLivroAutor`),
  ADD KEY `TbLivroAutor_fk1` (`CoAutor`),
  ADD KEY `TbLivroAutor_fk2` (`CoLivro`);

--
-- Índices de tabela `tblivrovendedor`
--
ALTER TABLE `tblivrovendedor`
  ADD PRIMARY KEY (`IdLivroVendedor`),
  ADD UNIQUE KEY `IdLivroVendedor` (`IdLivroVendedor`),
  ADD KEY `TbLivroVendedor_fk1` (`CoVendedor`),
  ADD KEY `TbLivroVendedor_fk2` (`CoLivro`);

--
-- Índices de tabela `tbvendedor`
--
ALTER TABLE `tbvendedor`
  ADD PRIMARY KEY (`CoVendedor`),
  ADD UNIQUE KEY `CoVendedor` (`CoVendedor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbautor`
--
ALTER TABLE `tbautor`
  MODIFY `CoAutor` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbcategoria`
--
ALTER TABLE `tbcategoria`
  MODIFY `CoCategoria` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tbeditora`
--
ALTER TABLE `tbeditora`
  MODIFY `CoEditora` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tbidioma`
--
ALTER TABLE `tbidioma`
  MODIFY `CoIdioma` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tblivro`
--
ALTER TABLE `tblivro`
  MODIFY `CoLivro` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tblivroautor`
--
ALTER TABLE `tblivroautor`
  MODIFY `IdLivroAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tblivrovendedor`
--
ALTER TABLE `tblivrovendedor`
  MODIFY `IdLivroVendedor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbvendedor`
--
ALTER TABLE `tbvendedor`
  MODIFY `CoVendedor` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tblivro`
--
ALTER TABLE `tblivro`
  ADD CONSTRAINT `TbLivro_fk10` FOREIGN KEY (`CoCategoria`) REFERENCES `tbcategoria` (`CoCategoria`),
  ADD CONSTRAINT `TbLivro_fk8` FOREIGN KEY (`CoIdioma`) REFERENCES `tbidioma` (`CoIdioma`),
  ADD CONSTRAINT `TbLivro_fk9` FOREIGN KEY (`CoEditora`) REFERENCES `tbeditora` (`CoEditora`);

--
-- Restrições para tabelas `tblivroautor`
--
ALTER TABLE `tblivroautor`
  ADD CONSTRAINT `TbLivroAutor_fk1` FOREIGN KEY (`CoAutor`) REFERENCES `tbautor` (`CoAutor`),
  ADD CONSTRAINT `TbLivroAutor_fk2` FOREIGN KEY (`CoLivro`) REFERENCES `tblivro` (`CoLivro`);

--
-- Restrições para tabelas `tblivrovendedor`
--
ALTER TABLE `tblivrovendedor`
  ADD CONSTRAINT `TbLivroVendedor_fk1` FOREIGN KEY (`CoVendedor`) REFERENCES `tbvendedor` (`CoVendedor`),
  ADD CONSTRAINT `TbLivroVendedor_fk2` FOREIGN KEY (`CoLivro`) REFERENCES `tblivro` (`CoLivro`);
--
-- Banco de dados: `dbgerenciador_tarefas`
--
CREATE DATABASE IF NOT EXISTS `dbgerenciador_tarefas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbgerenciador_tarefas`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tarefas`
--

CREATE TABLE `tarefas` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `prazo` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tarefas`
--
ALTER TABLE `tarefas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tarefas`
--
ALTER TABLE `tarefas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Banco de dados: `db_test`
--
CREATE DATABASE IF NOT EXISTS `db_test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_test`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_computador`
--

CREATE TABLE `tb_computador` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_distribuidora`
--

CREATE TABLE `tb_distribuidora` (
  `nome` varchar(10) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_gostosa`
--

CREATE TABLE `tb_gostosa` (
  `nome` varchar(40) NOT NULL,
  `tamanho` varchar(10) DEFAULT NULL,
  `cpf` int(11) NOT NULL,
  `id_livro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_livro`
--

CREATE TABLE `tb_livro` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pessoa`
--

CREATE TABLE `tb_pessoa` (
  `cpf` int(11) DEFAULT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `salário` float DEFAULT NULL,
  `descrição` text DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_computador`
--
ALTER TABLE `tb_computador`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_distribuidora`
--
ALTER TABLE `tb_distribuidora`
  ADD KEY `id` (`id`);

--
-- Índices de tabela `tb_gostosa`
--
ALTER TABLE `tb_gostosa`
  ADD PRIMARY KEY (`cpf`),
  ADD UNIQUE KEY `tamanho` (`tamanho`),
  ADD KEY `id_livro` (`id_livro`);

--
-- Índices de tabela `tb_livro`
--
ALTER TABLE `tb_livro`
  ADD UNIQUE KEY `id` (`id`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_distribuidora`
--
ALTER TABLE `tb_distribuidora`
  ADD CONSTRAINT `tb_distribuidora_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tb_computador` (`id`);

--
-- Restrições para tabelas `tb_gostosa`
--
ALTER TABLE `tb_gostosa`
  ADD CONSTRAINT `tb_gostosa_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `tb_livro` (`id`);
--
-- Banco de dados: `express_db`
--
CREATE DATABASE IF NOT EXISTS `express_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `express_db`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `data_table`
--

CREATE TABLE `data_table` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2b$10$abcdefghijklmnopqrstuv');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `data_table`
--
ALTER TABLE `data_table`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `data_table`
--
ALTER TABLE `data_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Despejando dados para a tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"academia\",\"table\":\"treinoexercicios\"},{\"db\":\"academia\",\"table\":\"treino\"},{\"db\":\"academia\",\"table\":\"mensalidade\"},{\"db\":\"academia\",\"table\":\"maquinasolo\"},{\"db\":\"academia\",\"table\":\"grupomuscular\"},{\"db\":\"academia\",\"table\":\"exercicios\"},{\"db\":\"academia\",\"table\":\"educadorfisico\"},{\"db\":\"academia\",\"table\":\"cliente\"},{\"db\":\"express_db\",\"table\":\"users\"},{\"db\":\"express_db\",\"table\":\"data_table\"}]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Despejando dados para a tabela `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'dbestante', 'tblivro', '{\"CREATE_TIME\":\"2024-12-08 15:58:39\"}', '2024-12-08 19:13:06');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Despejando dados para a tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-02-16 17:36:19', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pt_BR\",\"NavigationWidth\":224}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices de tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices de tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices de tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices de tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices de tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices de tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices de tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices de tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices de tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
