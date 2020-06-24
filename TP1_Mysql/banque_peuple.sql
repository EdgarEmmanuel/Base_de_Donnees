-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 25 Juin 2020 à 00:44
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `banque_peuple`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `idEmp` int(11) NOT NULL,
  `password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `idEmp` (`idEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `agences`
--

CREATE TABLE IF NOT EXISTS `agences` (
  `id_agence` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(25) NOT NULL,
  `numero_agence` varchar(25) NOT NULL,
  `id_employe_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_agence`),
  KEY `id_employe_admin` (`id_employe_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `agios`
--

CREATE TABLE IF NOT EXISTS `agios` (
  `id_agios` int(11) NOT NULL,
  `montant` double DEFAULT NULL,
  `taux` int(11) NOT NULL,
  PRIMARY KEY (`id_agios`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `caissiere`
--

CREATE TABLE IF NOT EXISTS `caissiere` (
  `id_caissiere` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `idEmp` int(11) NOT NULL,
  `password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_caissiere`),
  KEY `idEmp` (`idEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `adresse` varchar(25) NOT NULL,
  `telephone` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `client_moral`
--

CREATE TABLE IF NOT EXISTS `client_moral` (
  `id_entreprise` int(11) NOT NULL AUTO_INCREMENT,
  `type_entreprise` varchar(25) NOT NULL,
  `activite_entreprise` varchar(25) NOT NULL,
  `idClient` int(11) NOT NULL,
  `nom_entreprise` varchar(25) DEFAULT NULL,
  `raison_social` varchar(25) DEFAULT NULL,
  `addresse_entreprise` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_entreprise`),
  KEY `idClient` (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `client_non_salarie`
--

CREATE TABLE IF NOT EXISTS `client_non_salarie` (
  `id_non_salarie` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(25) NOT NULL,
  `activite_client` varchar(20) DEFAULT NULL,
  `idClient` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `cni` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_non_salarie`),
  KEY `idClient` (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `client_salarie`
--

CREATE TABLE IF NOT EXISTS `client_salarie` (
  `id_salarie` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(45) DEFAULT NULL,
  `profession` varchar(25) DEFAULT NULL,
  `salaire` double NOT NULL,
  `nom_entreprise` varchar(25) NOT NULL,
  `adresse_entreprise` varchar(25) NOT NULL,
  `idClient` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `cni` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_salarie`),
  KEY `idClient` (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `comptes`
--

CREATE TABLE IF NOT EXISTS `comptes` (
  `id_compte` int(11) NOT NULL AUTO_INCREMENT,
  `num_compte` varchar(25) NOT NULL,
  `cle_rib` int(11) NOT NULL,
  `num_agence` varchar(25) NOT NULL,
  `idClient` int(11) NOT NULL,
  `idRespoCompte` int(11) NOT NULL,
  `dateOuverture` date DEFAULT NULL,
  `idAgence` int(11) NOT NULL,
  PRIMARY KEY (`id_compte`),
  KEY `idClient` (`idClient`),
  KEY `idRespoCompte` (`idRespoCompte`),
  KEY `idAgence` (`idAgence`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `compte_bloque`
--

CREATE TABLE IF NOT EXISTS `compte_bloque` (
  `frais_compte` double NOT NULL,
  `delai_deblocage` date DEFAULT NULL,
  `id_compte_bloque` int(11) NOT NULL AUTO_INCREMENT,
  `id_compte` int(11) NOT NULL,
  PRIMARY KEY (`id_compte_bloque`),
  KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `compte_courant`
--

CREATE TABLE IF NOT EXISTS `compte_courant` (
  `id_compte_courant` int(11) NOT NULL AUTO_INCREMENT,
  `adresse_employeur` varchar(25) DEFAULT NULL,
  `nom_entreprise` varchar(25) DEFAULT NULL,
  `raison_social` varchar(25) DEFAULT NULL,
  `id_compte` int(11) NOT NULL,
  PRIMARY KEY (`id_compte_courant`),
  KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `compte_epargne`
--

CREATE TABLE IF NOT EXISTS `compte_epargne` (
  `id_compte_epargne` int(11) NOT NULL AUTO_INCREMENT,
  `frais_ouverture` double NOT NULL,
  `id_compte` int(11) NOT NULL,
  PRIMARY KEY (`id_compte_epargne`),
  KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

CREATE TABLE IF NOT EXISTS `employes` (
  `idEmploye` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `adresse` varchar(25) NOT NULL,
  `telephone` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `idagencEmploye` int(11) NOT NULL,
  PRIMARY KEY (`idEmploye`),
  KEY `idagencEmploye` (`idagencEmploye`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `etat_compte`
--

CREATE TABLE IF NOT EXISTS `etat_compte` (
  `id_etat` int(11) NOT NULL AUTO_INCREMENT,
  `etat_compte` varchar(25) NOT NULL,
  `date_changement_etat` date DEFAULT NULL,
  `id_compte` int(11) NOT NULL,
  PRIMARY KEY (`id_etat`),
  KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `operation_comptes`
--

CREATE TABLE IF NOT EXISTS `operation_comptes` (
  `id_op_compte` int(11) NOT NULL AUTO_INCREMENT,
  `id_employe` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `type_operation` varchar(25) NOT NULL,
  `montant_operation` int(11) NOT NULL,
  `date_operation` date DEFAULT NULL,
  `id_compte_desti` int(11) NOT NULL,
  `id_agios` int(11) NOT NULL,
  PRIMARY KEY (`id_op_compte`),
  KEY `id_compte` (`id_compte`),
  KEY `id_caissiere` (`id_employe`),
  KEY `id_compte_desti` (`id_compte_desti`),
  KEY `fk_k` (`id_agios`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `profil_employes`
--

CREATE TABLE IF NOT EXISTS `profil_employes` (
  `id_profil_employe` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fonction` varchar(25) NOT NULL,
  `date_debut_emploi` date DEFAULT NULL,
  `idEmp` int(11) NOT NULL,
  PRIMARY KEY (`id_profil_employe`),
  KEY `idEmp` (`idEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `responsable_compte`
--

CREATE TABLE IF NOT EXISTS `responsable_compte` (
  `id_responsable` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `idEmp` int(11) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`id_responsable`),
  KEY `idEmp` (`idEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `administrateur_ibfk_1` FOREIGN KEY (`idEmp`) REFERENCES `employes` (`idEmploye`);

--
-- Contraintes pour la table `agences`
--
ALTER TABLE `agences`
  ADD CONSTRAINT `agences_ibfk_1` FOREIGN KEY (`id_employe_admin`) REFERENCES `employes` (`idEmploye`);

--
-- Contraintes pour la table `caissiere`
--
ALTER TABLE `caissiere`
  ADD CONSTRAINT `caissiere_ibfk_1` FOREIGN KEY (`idEmp`) REFERENCES `employes` (`idEmploye`);

--
-- Contraintes pour la table `client_moral`
--
ALTER TABLE `client_moral`
  ADD CONSTRAINT `client_moral_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`);

--
-- Contraintes pour la table `client_non_salarie`
--
ALTER TABLE `client_non_salarie`
  ADD CONSTRAINT `client_non_salarie_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`);

--
-- Contraintes pour la table `client_salarie`
--
ALTER TABLE `client_salarie`
  ADD CONSTRAINT `client_salarie_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`);

--
-- Contraintes pour la table `comptes`
--
ALTER TABLE `comptes`
  ADD CONSTRAINT `comptes_ibfk_3` FOREIGN KEY (`idAgence`) REFERENCES `agences` (`id_agence`),
  ADD CONSTRAINT `comptes_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`),
  ADD CONSTRAINT `comptes_ibfk_2` FOREIGN KEY (`idRespoCompte`) REFERENCES `responsable_compte` (`id_responsable`);

--
-- Contraintes pour la table `compte_bloque`
--
ALTER TABLE `compte_bloque`
  ADD CONSTRAINT `compte_bloque_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id_compte`);

--
-- Contraintes pour la table `compte_courant`
--
ALTER TABLE `compte_courant`
  ADD CONSTRAINT `compte_courant_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id_compte`);

--
-- Contraintes pour la table `compte_epargne`
--
ALTER TABLE `compte_epargne`
  ADD CONSTRAINT `compte_epargne_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id_compte`);

--
-- Contraintes pour la table `employes`
--
ALTER TABLE `employes`
  ADD CONSTRAINT `employes_ibfk_1` FOREIGN KEY (`idagencEmploye`) REFERENCES `agences` (`id_agence`);

--
-- Contraintes pour la table `etat_compte`
--
ALTER TABLE `etat_compte`
  ADD CONSTRAINT `etat_compte_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id_compte`);

--
-- Contraintes pour la table `operation_comptes`
--
ALTER TABLE `operation_comptes`
  ADD CONSTRAINT `fk_k` FOREIGN KEY (`id_agios`) REFERENCES `agios` (`id_agios`),
  ADD CONSTRAINT `operation_comptes_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `caissiere` (`id_caissiere`),
  ADD CONSTRAINT `operation_comptes_ibfk_2` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id_compte`),
  ADD CONSTRAINT `operation_comptes_ibfk_3` FOREIGN KEY (`id_employe`) REFERENCES `employes` (`idEmploye`),
  ADD CONSTRAINT `operation_comptes_ibfk_4` FOREIGN KEY (`id_compte_desti`) REFERENCES `comptes` (`id_compte`);

--
-- Contraintes pour la table `profil_employes`
--
ALTER TABLE `profil_employes`
  ADD CONSTRAINT `profil_employes_ibfk_1` FOREIGN KEY (`idEmp`) REFERENCES `employes` (`idEmploye`);

--
-- Contraintes pour la table `responsable_compte`
--
ALTER TABLE `responsable_compte`
  ADD CONSTRAINT `responsable_compte_ibfk_1` FOREIGN KEY (`idEmp`) REFERENCES `employes` (`idEmploye`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
