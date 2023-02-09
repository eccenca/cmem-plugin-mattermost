-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: mattermost_test
-- ------------------------------------------------------
-- Server version	5.7.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mattermost_test`
--

/*!40000 DROP DATABASE IF EXISTS `mattermost_test`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mattermost_test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mattermost_test`;

--
-- Table structure for table `Audits`
--

DROP TABLE IF EXISTS `Audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Audits` (
  `Id` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `Action` text,
  `ExtraInfo` text,
  `IpAddress` varchar(64) DEFAULT NULL,
  `SessionId` varchar(26) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_audits_user_id` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audits`
--

LOCK TABLES `Audits` WRITE;
/*!40000 ALTER TABLE `Audits` DISABLE KEYS */;
INSERT INTO `Audits` VALUES ('5sb414zqefnn7ghqwqgqinhgzy',1675957882860,'hruniqwds7gg5bcm5fmn931iih','/api/v4/config','updateConfig','172.19.0.1','5zytao477jf73y4d3zjhjds6co'),('6fmz5bd7o3bejjdk8w7qehai9r',1675958169584,'hruniqwds7gg5bcm5fmn931iih','/api/v4/teams/bomuda47qpf7pfbmacnioyhona/patch','','172.19.0.1','5zytao477jf73y4d3zjhjds6co'),('co3u1f5gzbdy3msop4bro8iswc',1675957798623,'hruniqwds7gg5bcm5fmn931iih','/api/v4/users/login','authenticated','172.19.0.1',''),('egqdoqkgejdptj3wrg1ho6g1yy',1675957798631,'hruniqwds7gg5bcm5fmn931iih','/api/v4/users/login','success session_user=hruniqwds7gg5bcm5fmn931iih','172.19.0.1','5zytao477jf73y4d3zjhjds6co'),('m7zbzh4c53y6xxbmumsub3onnc',1675958089148,'hruniqwds7gg5bcm5fmn931iih','/api/v4/users/1qzsypdm9t8hibuegnwymnyp3w/tokens','success - token_id=7zgpes5qai8tinsyceeuwabm9r','172.19.0.1','5zytao477jf73y4d3zjhjds6co'),('nbwymynq1fyzmc9fckngrtum6e',1675957798514,'hruniqwds7gg5bcm5fmn931iih','/api/v4/users/login','attempt - login_id=','172.19.0.1',''),('tjefhc6kz7dkzf6eeh571mqysr',1675958089113,'hruniqwds7gg5bcm5fmn931iih','/api/v4/users/1qzsypdm9t8hibuegnwymnyp3w/image','','172.19.0.1','5zytao477jf73y4d3zjhjds6co'),('wpmz9ey7r3dnjnk5h18wemwwgc',1675958089173,'hruniqwds7gg5bcm5fmn931iih','/api/v4/users/1qzsypdm9t8hibuegnwymnyp3w/roles','user=1qzsypdm9t8hibuegnwymnyp3w roles=system_user system_admin','172.19.0.1','5zytao477jf73y4d3zjhjds6co'),('zheoqjxfjj8cbcqyqc56x8gb4y',1675958089144,'hruniqwds7gg5bcm5fmn931iih','/api/v4/users/1qzsypdm9t8hibuegnwymnyp3w/tokens','','172.19.0.1','5zytao477jf73y4d3zjhjds6co');
/*!40000 ALTER TABLE `Audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bots`
--

DROP TABLE IF EXISTS `Bots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bots` (
  `UserId` varchar(26) NOT NULL,
  `Description` text,
  `OwnerId` varchar(190) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `LastIconUpdate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bots`
--

LOCK TABLES `Bots` WRITE;
/*!40000 ALTER TABLE `Bots` DISABLE KEYS */;
INSERT INTO `Bots` VALUES ('1qzsypdm9t8hibuegnwymnyp3w','Bot to test the plugin','hruniqwds7gg5bcm5fmn931iih',1675958089068,1675958089068,0,0),('5oc8fyy1c7ybzgrja71zhutmja','Mattermost Apps Registry and API proxy.','com.mattermost.apps',1675957119200,1675957119200,0,0),('6oa8wwzrytnr3q6w4hjoyhboha','Feedbackbot collects user feedback to improve Mattermost. [Learn more](https://mattermost.com/pl/default-nps).','com.mattermost.nps',1675957118981,1675957118981,0,0),('7ffqea1am3nbxnekkn5fga4ppr','Playbooks bot.','playbooks',1675957119521,1675957119521,0,0),('gthntg6dgpdkbnzkp39muoidhw','Created by Boards plugin.','focalboard',1675957121215,1675957121215,0,0),('ju6tyhjggtbifcgfyz3k5job7c','','hruniqwds7gg5bcm5fmn931iih',1675957799570,1675957799570,0,0);
/*!40000 ALTER TABLE `Bots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChannelMemberHistory`
--

DROP TABLE IF EXISTS `ChannelMemberHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChannelMemberHistory` (
  `ChannelId` varchar(26) NOT NULL,
  `UserId` varchar(26) NOT NULL,
  `JoinTime` bigint(20) NOT NULL,
  `LeaveTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ChannelId`,`UserId`,`JoinTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChannelMemberHistory`
--

LOCK TABLES `ChannelMemberHistory` WRITE;
/*!40000 ALTER TABLE `ChannelMemberHistory` DISABLE KEYS */;
INSERT INTO `ChannelMemberHistory` VALUES ('7mcz1rmkjpn8zxqk3m4c8axeor','1qzsypdm9t8hibuegnwymnyp3w',1675958089081,NULL),('7mcz1rmkjpn8zxqk3m4c8axeor','hruniqwds7gg5bcm5fmn931iih',1675958089083,NULL),('qzzdms4tyb8zzbo5e8b8r56mtc','1qzsypdm9t8hibuegnwymnyp3w',1675958169668,NULL),('qzzdms4tyb8zzbo5e8b8r56mtc','hruniqwds7gg5bcm5fmn931iih',1675957856684,NULL),('t4jmndx64iy7jdpes19zwxsqur','1qzsypdm9t8hibuegnwymnyp3w',1675958169694,NULL),('t4jmndx64iy7jdpes19zwxsqur','hruniqwds7gg5bcm5fmn931iih',1675957856719,NULL);
/*!40000 ALTER TABLE `ChannelMemberHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChannelMembers`
--

DROP TABLE IF EXISTS `ChannelMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChannelMembers` (
  `ChannelId` varchar(26) NOT NULL,
  `UserId` varchar(26) NOT NULL,
  `Roles` text,
  `LastViewedAt` bigint(20) DEFAULT NULL,
  `MsgCount` bigint(20) DEFAULT NULL,
  `MentionCount` bigint(20) DEFAULT NULL,
  `NotifyProps` json DEFAULT NULL,
  `LastUpdateAt` bigint(20) DEFAULT NULL,
  `SchemeUser` tinyint(4) DEFAULT NULL,
  `SchemeAdmin` tinyint(4) DEFAULT NULL,
  `SchemeGuest` tinyint(4) DEFAULT NULL,
  `MentionCountRoot` bigint(20) DEFAULT NULL,
  `MsgCountRoot` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ChannelId`,`UserId`),
  KEY `idx_channelmembers_user_id_channel_id_last_viewed_at` (`UserId`,`ChannelId`,`LastViewedAt`),
  KEY `idx_channelmembers_channel_id_scheme_guest_user_id` (`ChannelId`,`SchemeGuest`,`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChannelMembers`
--

LOCK TABLES `ChannelMembers` WRITE;
/*!40000 ALTER TABLE `ChannelMembers` DISABLE KEYS */;
INSERT INTO `ChannelMembers` VALUES ('7mcz1rmkjpn8zxqk3m4c8axeor','1qzsypdm9t8hibuegnwymnyp3w','',0,0,0,'{\"push\": \"default\", \"email\": \"default\", \"desktop\": \"default\", \"mark_unread\": \"all\", \"ignore_channel_mentions\": \"default\"}',1675958089073,1,0,0,0,0),('7mcz1rmkjpn8zxqk3m4c8axeor','hruniqwds7gg5bcm5fmn931iih','',1675958089087,1,0,'{\"push\": \"default\", \"email\": \"default\", \"desktop\": \"default\", \"mark_unread\": \"all\", \"ignore_channel_mentions\": \"default\"}',1675958089087,1,0,0,0,1),('qzzdms4tyb8zzbo5e8b8r56mtc','1qzsypdm9t8hibuegnwymnyp3w','',0,0,0,'{\"push\": \"default\", \"email\": \"default\", \"desktop\": \"default\", \"mark_unread\": \"all\", \"ignore_channel_mentions\": \"default\"}',1675958169663,1,0,0,0,0),('qzzdms4tyb8zzbo5e8b8r56mtc','hruniqwds7gg5bcm5fmn931iih','',1675958169671,1,0,'{\"push\": \"default\", \"email\": \"default\", \"desktop\": \"default\", \"mark_unread\": \"all\", \"ignore_channel_mentions\": \"default\"}',1675958169671,1,1,0,0,1),('t4jmndx64iy7jdpes19zwxsqur','1qzsypdm9t8hibuegnwymnyp3w','',0,0,0,'{\"push\": \"default\", \"email\": \"default\", \"desktop\": \"default\", \"mark_unread\": \"all\", \"ignore_channel_mentions\": \"default\"}',1675958169684,1,0,0,0,0),('t4jmndx64iy7jdpes19zwxsqur','hruniqwds7gg5bcm5fmn931iih','',0,0,0,'{\"push\": \"default\", \"email\": \"default\", \"desktop\": \"default\", \"mark_unread\": \"all\", \"ignore_channel_mentions\": \"default\"}',1675957856712,1,1,0,0,0);
/*!40000 ALTER TABLE `ChannelMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Channels`
--

DROP TABLE IF EXISTS `Channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Channels` (
  `Id` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `TeamId` varchar(26) DEFAULT NULL,
  `Type` enum('D','O','G','P') DEFAULT NULL,
  `DisplayName` varchar(64) DEFAULT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Header` text,
  `Purpose` varchar(250) DEFAULT NULL,
  `LastPostAt` bigint(20) DEFAULT NULL,
  `TotalMsgCount` bigint(20) DEFAULT NULL,
  `ExtraUpdateAt` bigint(20) DEFAULT NULL,
  `CreatorId` varchar(26) DEFAULT NULL,
  `SchemeId` varchar(26) DEFAULT NULL,
  `GroupConstrained` tinyint(1) DEFAULT NULL,
  `Shared` tinyint(1) DEFAULT NULL,
  `TotalMsgCountRoot` bigint(20) DEFAULT NULL,
  `LastRootPostAt` bigint(20) DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`,`TeamId`),
  KEY `idx_channels_update_at` (`UpdateAt`),
  KEY `idx_channels_create_at` (`CreateAt`),
  KEY `idx_channels_delete_at` (`DeleteAt`),
  KEY `idx_channels_scheme_id` (`SchemeId`),
  KEY `idx_channels_team_id_display_name` (`TeamId`,`DisplayName`),
  KEY `idx_channels_team_id_type` (`TeamId`,`Type`),
  FULLTEXT KEY `idx_channel_search_txt` (`Name`,`DisplayName`,`Purpose`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Channels`
--

LOCK TABLES `Channels` WRITE;
/*!40000 ALTER TABLE `Channels` DISABLE KEYS */;
INSERT INTO `Channels` VALUES ('7mcz1rmkjpn8zxqk3m4c8axeor',1675958089072,1675958089072,0,'','D','','1qzsypdm9t8hibuegnwymnyp3w__hruniqwds7gg5bcm5fmn931iih','','',1675958089087,1,0,'1qzsypdm9t8hibuegnwymnyp3w',NULL,NULL,0,1,1675958089087),('qzzdms4tyb8zzbo5e8b8r56mtc',1675957856645,1675957856645,0,'bomuda47qpf7pfbmacnioyhona','O','Town Square','town-square','','',1675958169671,1,0,'',NULL,NULL,NULL,1,1675958169671),('t4jmndx64iy7jdpes19zwxsqur',1675957856650,1675957856650,0,'bomuda47qpf7pfbmacnioyhona','O','Off-Topic','off-topic','','',1675958169696,0,0,'',NULL,NULL,NULL,0,1675958169696);
/*!40000 ALTER TABLE `Channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClusterDiscovery`
--

DROP TABLE IF EXISTS `ClusterDiscovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClusterDiscovery` (
  `Id` varchar(26) NOT NULL,
  `Type` varchar(64) DEFAULT NULL,
  `ClusterName` varchar(64) DEFAULT NULL,
  `Hostname` text,
  `GossipPort` int(11) DEFAULT NULL,
  `Port` int(11) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `LastPingAt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClusterDiscovery`
--

LOCK TABLES `ClusterDiscovery` WRITE;
/*!40000 ALTER TABLE `ClusterDiscovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClusterDiscovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CommandWebhooks`
--

DROP TABLE IF EXISTS `CommandWebhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CommandWebhooks` (
  `Id` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `CommandId` varchar(26) DEFAULT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `ChannelId` varchar(26) DEFAULT NULL,
  `RootId` varchar(26) DEFAULT NULL,
  `UseCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_command_webhook_create_at` (`CreateAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CommandWebhooks`
--

LOCK TABLES `CommandWebhooks` WRITE;
/*!40000 ALTER TABLE `CommandWebhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `CommandWebhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commands`
--

DROP TABLE IF EXISTS `Commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commands` (
  `Id` varchar(26) NOT NULL,
  `Token` varchar(26) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `CreatorId` varchar(26) DEFAULT NULL,
  `TeamId` varchar(26) DEFAULT NULL,
  `Trigger` varchar(128) DEFAULT NULL,
  `Method` varchar(1) DEFAULT NULL,
  `Username` varchar(64) DEFAULT NULL,
  `IconURL` text,
  `AutoComplete` tinyint(1) DEFAULT NULL,
  `AutoCompleteDesc` text,
  `AutoCompleteHint` text,
  `DisplayName` varchar(64) DEFAULT NULL,
  `Description` varchar(128) DEFAULT NULL,
  `URL` text,
  `PluginId` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_command_team_id` (`TeamId`),
  KEY `idx_command_update_at` (`UpdateAt`),
  KEY `idx_command_create_at` (`CreateAt`),
  KEY `idx_command_delete_at` (`DeleteAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commands`
--

LOCK TABLES `Commands` WRITE;
/*!40000 ALTER TABLE `Commands` DISABLE KEYS */;
/*!40000 ALTER TABLE `Commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compliances`
--

DROP TABLE IF EXISTS `Compliances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compliances` (
  `Id` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `Status` varchar(64) DEFAULT NULL,
  `Count` int(11) DEFAULT NULL,
  `Desc` text,
  `Type` varchar(64) DEFAULT NULL,
  `StartAt` bigint(20) DEFAULT NULL,
  `EndAt` bigint(20) DEFAULT NULL,
  `Keywords` text,
  `Emails` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compliances`
--

LOCK TABLES `Compliances` WRITE;
/*!40000 ALTER TABLE `Compliances` DISABLE KEYS */;
/*!40000 ALTER TABLE `Compliances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Emoji`
--

DROP TABLE IF EXISTS `Emoji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Emoji` (
  `Id` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `CreatorId` varchar(26) DEFAULT NULL,
  `Name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`,`DeleteAt`),
  KEY `idx_emoji_update_at` (`UpdateAt`),
  KEY `idx_emoji_create_at` (`CreateAt`),
  KEY `idx_emoji_delete_at` (`DeleteAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Emoji`
--

LOCK TABLES `Emoji` WRITE;
/*!40000 ALTER TABLE `Emoji` DISABLE KEYS */;
/*!40000 ALTER TABLE `Emoji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FileInfo`
--

DROP TABLE IF EXISTS `FileInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FileInfo` (
  `Id` varchar(26) NOT NULL,
  `CreatorId` varchar(26) DEFAULT NULL,
  `PostId` varchar(26) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `Path` text,
  `ThumbnailPath` text,
  `PreviewPath` text,
  `Name` text,
  `Extension` varchar(64) DEFAULT NULL,
  `Size` bigint(20) DEFAULT NULL,
  `MimeType` text,
  `Width` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `HasPreviewImage` tinyint(1) DEFAULT NULL,
  `MiniPreview` mediumblob,
  `Content` longtext,
  `RemoteId` varchar(26) DEFAULT NULL,
  `Archived` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `idx_fileinfo_update_at` (`UpdateAt`),
  KEY `idx_fileinfo_create_at` (`CreateAt`),
  KEY `idx_fileinfo_delete_at` (`DeleteAt`),
  KEY `idx_fileinfo_postid_at` (`PostId`),
  KEY `idx_fileinfo_extension_at` (`Extension`),
  FULLTEXT KEY `idx_fileinfo_name_txt` (`Name`),
  FULLTEXT KEY `idx_fileinfo_content_txt` (`Content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileInfo`
--

LOCK TABLES `FileInfo` WRITE;
/*!40000 ALTER TABLE `FileInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `FileInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupChannels`
--

DROP TABLE IF EXISTS `GroupChannels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupChannels` (
  `GroupId` varchar(26) NOT NULL,
  `AutoAdd` tinyint(1) DEFAULT NULL,
  `SchemeAdmin` tinyint(1) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `ChannelId` varchar(26) NOT NULL,
  PRIMARY KEY (`GroupId`,`ChannelId`),
  KEY `idx_groupchannels_schemeadmin` (`SchemeAdmin`),
  KEY `idx_groupchannels_channelid` (`ChannelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupChannels`
--

LOCK TABLES `GroupChannels` WRITE;
/*!40000 ALTER TABLE `GroupChannels` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroupChannels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupMembers`
--

DROP TABLE IF EXISTS `GroupMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupMembers` (
  `GroupId` varchar(26) NOT NULL,
  `UserId` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`GroupId`,`UserId`),
  KEY `idx_groupmembers_create_at` (`CreateAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupMembers`
--

LOCK TABLES `GroupMembers` WRITE;
/*!40000 ALTER TABLE `GroupMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroupMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupTeams`
--

DROP TABLE IF EXISTS `GroupTeams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupTeams` (
  `GroupId` varchar(26) NOT NULL,
  `AutoAdd` tinyint(1) DEFAULT NULL,
  `SchemeAdmin` tinyint(1) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `TeamId` varchar(26) NOT NULL,
  PRIMARY KEY (`GroupId`,`TeamId`),
  KEY `idx_groupteams_schemeadmin` (`SchemeAdmin`),
  KEY `idx_groupteams_teamid` (`TeamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupTeams`
--

LOCK TABLES `GroupTeams` WRITE;
/*!40000 ALTER TABLE `GroupTeams` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroupTeams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_Category`
--

DROP TABLE IF EXISTS `IR_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_Category` (
  `ID` varchar(26) NOT NULL,
  `Name` varchar(512) NOT NULL,
  `TeamID` varchar(26) NOT NULL,
  `UserID` varchar(26) NOT NULL,
  `Collapsed` tinyint(1) DEFAULT '0',
  `CreateAt` bigint(20) NOT NULL,
  `UpdateAt` bigint(20) NOT NULL DEFAULT '0',
  `DeleteAt` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IR_Category_TeamID_UserID` (`TeamID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_Category`
--

LOCK TABLES `IR_Category` WRITE;
/*!40000 ALTER TABLE `IR_Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_Category_Item`
--

DROP TABLE IF EXISTS `IR_Category_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_Category_Item` (
  `Type` varchar(1) NOT NULL,
  `CategoryID` varchar(26) NOT NULL,
  `ItemID` varchar(26) NOT NULL,
  PRIMARY KEY (`CategoryID`,`ItemID`,`Type`),
  KEY `IR_Category_Item_CategoryID` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_Category_Item`
--

LOCK TABLES `IR_Category_Item` WRITE;
/*!40000 ALTER TABLE `IR_Category_Item` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_Category_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_ChannelAction`
--

DROP TABLE IF EXISTS `IR_ChannelAction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_ChannelAction` (
  `ID` varchar(26) NOT NULL,
  `ChannelID` varchar(26) DEFAULT NULL,
  `Enabled` tinyint(1) DEFAULT '0',
  `DeleteAt` bigint(20) NOT NULL DEFAULT '0',
  `ActionType` text NOT NULL,
  `TriggerType` text NOT NULL,
  `Payload` json NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IR_ChannelAction_ChannelID` (`ChannelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_ChannelAction`
--

LOCK TABLES `IR_ChannelAction` WRITE;
/*!40000 ALTER TABLE `IR_ChannelAction` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_ChannelAction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_Incident`
--

DROP TABLE IF EXISTS `IR_Incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_Incident` (
  `ID` varchar(26) NOT NULL,
  `Name` varchar(1024) NOT NULL,
  `Description` varchar(4096) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CommanderUserID` varchar(26) NOT NULL,
  `TeamID` varchar(26) NOT NULL,
  `ChannelID` varchar(26) NOT NULL,
  `CreateAt` bigint(20) NOT NULL,
  `EndAt` bigint(20) NOT NULL DEFAULT '0',
  `DeleteAt` bigint(20) NOT NULL DEFAULT '0',
  `ActiveStage` bigint(20) NOT NULL,
  `PostID` varchar(26) NOT NULL DEFAULT '',
  `PlaybookID` varchar(26) NOT NULL DEFAULT '',
  `ChecklistsJSON` text NOT NULL,
  `ActiveStageTitle` varchar(1024) DEFAULT '',
  `ReminderPostID` varchar(26) DEFAULT NULL,
  `BroadcastChannelID` varchar(26) DEFAULT '',
  `PreviousReminder` bigint(20) NOT NULL DEFAULT '0',
  `ReminderMessageTemplate` text,
  `CurrentStatus` varchar(1024) NOT NULL DEFAULT 'Active',
  `ReporterUserID` varchar(26) NOT NULL DEFAULT '',
  `ConcatenatedInvitedUserIDs` text,
  `DefaultCommanderID` varchar(26) DEFAULT '',
  `AnnouncementChannelID` varchar(26) DEFAULT '',
  `ConcatenatedWebhookOnCreationURLs` text,
  `ConcatenatedInvitedGroupIDs` text,
  `Retrospective` text,
  `MessageOnJoin` text,
  `RetrospectivePublishedAt` bigint(20) NOT NULL DEFAULT '0',
  `RetrospectiveReminderIntervalSeconds` bigint(20) NOT NULL DEFAULT '0',
  `RetrospectiveWasCanceled` tinyint(1) DEFAULT '0',
  `ConcatenatedWebhookOnStatusUpdateURLs` text,
  `LastStatusUpdateAt` bigint(20) DEFAULT '0',
  `ExportChannelOnFinishedEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `CategorizeChannelEnabled` tinyint(1) DEFAULT '0',
  `CategoryName` text,
  `ConcatenatedBroadcastChannelIds` text,
  `ChannelIDToRootID` text,
  `ReminderTimerDefaultSeconds` bigint(20) NOT NULL DEFAULT '0',
  `StatusUpdateEnabled` tinyint(1) DEFAULT '1',
  `RetrospectiveEnabled` tinyint(1) DEFAULT '1',
  `StatusUpdateBroadcastChannelsEnabled` tinyint(1) DEFAULT '0',
  `StatusUpdateBroadcastWebhooksEnabled` tinyint(1) DEFAULT '0',
  `SummaryModifiedAt` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ChannelID` (`ChannelID`),
  KEY `IR_Incident_TeamID` (`TeamID`),
  KEY `IR_Incident_TeamID_CommanderUserID` (`TeamID`,`CommanderUserID`),
  KEY `IR_Incident_ChannelID` (`ChannelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_Incident`
--

LOCK TABLES `IR_Incident` WRITE;
/*!40000 ALTER TABLE `IR_Incident` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_Incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_Metric`
--

DROP TABLE IF EXISTS `IR_Metric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_Metric` (
  `IncidentID` varchar(26) NOT NULL,
  `MetricConfigID` varchar(26) NOT NULL,
  `Value` bigint(20) DEFAULT NULL,
  `Published` tinyint(1) NOT NULL,
  PRIMARY KEY (`IncidentID`,`MetricConfigID`),
  KEY `IR_Metric_IncidentID` (`IncidentID`),
  KEY `IR_Metric_MetricConfigID` (`MetricConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_Metric`
--

LOCK TABLES `IR_Metric` WRITE;
/*!40000 ALTER TABLE `IR_Metric` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_Metric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_MetricConfig`
--

DROP TABLE IF EXISTS `IR_MetricConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_MetricConfig` (
  `ID` varchar(26) NOT NULL,
  `PlaybookID` varchar(26) NOT NULL,
  `Title` varchar(512) NOT NULL,
  `Description` varchar(4096) NOT NULL,
  `Type` varchar(32) NOT NULL,
  `Target` bigint(20) DEFAULT NULL,
  `Ordering` tinyint(4) NOT NULL DEFAULT '0',
  `DeleteAt` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IR_MetricConfig_PlaybookID` (`PlaybookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_MetricConfig`
--

LOCK TABLES `IR_MetricConfig` WRITE;
/*!40000 ALTER TABLE `IR_MetricConfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_MetricConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_Playbook`
--

DROP TABLE IF EXISTS `IR_Playbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_Playbook` (
  `ID` varchar(26) NOT NULL,
  `Title` varchar(1024) NOT NULL,
  `Description` varchar(4096) NOT NULL,
  `TeamID` varchar(26) NOT NULL,
  `CreatePublicIncident` tinyint(1) NOT NULL,
  `CreateAt` bigint(20) NOT NULL,
  `DeleteAt` bigint(20) NOT NULL DEFAULT '0',
  `ChecklistsJSON` text NOT NULL,
  `NumStages` bigint(20) NOT NULL DEFAULT '0',
  `NumSteps` bigint(20) NOT NULL DEFAULT '0',
  `BroadcastChannelID` varchar(26) DEFAULT '',
  `ReminderMessageTemplate` text,
  `ReminderTimerDefaultSeconds` bigint(20) NOT NULL DEFAULT '0',
  `ConcatenatedInvitedUserIDs` text,
  `InviteUsersEnabled` tinyint(1) DEFAULT '0',
  `DefaultCommanderID` varchar(26) DEFAULT '',
  `DefaultCommanderEnabled` tinyint(1) DEFAULT '0',
  `AnnouncementChannelID` varchar(26) DEFAULT '',
  `AnnouncementChannelEnabled` tinyint(1) DEFAULT '0',
  `ConcatenatedWebhookOnCreationURLs` text,
  `WebhookOnCreationEnabled` tinyint(1) DEFAULT '0',
  `ConcatenatedInvitedGroupIDs` text,
  `MessageOnJoin` text,
  `MessageOnJoinEnabled` tinyint(1) DEFAULT '0',
  `RetrospectiveReminderIntervalSeconds` bigint(20) NOT NULL DEFAULT '0',
  `RetrospectiveTemplate` text,
  `ConcatenatedWebhookOnStatusUpdateURLs` text,
  `WebhookOnStatusUpdateEnabled` tinyint(1) DEFAULT '0',
  `ConcatenatedSignalAnyKeywords` text,
  `SignalAnyKeywordsEnabled` tinyint(1) DEFAULT '0',
  `UpdateAt` bigint(20) NOT NULL DEFAULT '0',
  `ExportChannelOnFinishedEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `CategorizeChannelEnabled` tinyint(1) DEFAULT '0',
  `CategoryName` text,
  `ConcatenatedBroadcastChannelIds` text,
  `BroadcastEnabled` tinyint(1) DEFAULT '0',
  `RunSummaryTemplate` text,
  `ChannelNameTemplate` text,
  `StatusUpdateEnabled` tinyint(1) DEFAULT '1',
  `RetrospectiveEnabled` tinyint(1) DEFAULT '1',
  `Public` tinyint(1) DEFAULT '0',
  `RunSummaryTemplateEnabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `IR_Playbook_TeamID` (`TeamID`),
  KEY `IR_PlaybookMember_PlaybookID` (`ID`),
  KEY `IR_Playbook_UpdateAt` (`UpdateAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_Playbook`
--

LOCK TABLES `IR_Playbook` WRITE;
/*!40000 ALTER TABLE `IR_Playbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_Playbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_PlaybookAutoFollow`
--

DROP TABLE IF EXISTS `IR_PlaybookAutoFollow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_PlaybookAutoFollow` (
  `PlaybookID` varchar(26) NOT NULL,
  `UserID` varchar(26) NOT NULL,
  PRIMARY KEY (`PlaybookID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_PlaybookAutoFollow`
--

LOCK TABLES `IR_PlaybookAutoFollow` WRITE;
/*!40000 ALTER TABLE `IR_PlaybookAutoFollow` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_PlaybookAutoFollow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_PlaybookMember`
--

DROP TABLE IF EXISTS `IR_PlaybookMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_PlaybookMember` (
  `PlaybookID` varchar(26) NOT NULL,
  `MemberID` varchar(26) NOT NULL,
  `Roles` text,
  PRIMARY KEY (`MemberID`,`PlaybookID`),
  KEY `IR_PlaybookMember_PlaybookID` (`PlaybookID`),
  KEY `IR_PlaybookMember_MemberID` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_PlaybookMember`
--

LOCK TABLES `IR_PlaybookMember` WRITE;
/*!40000 ALTER TABLE `IR_PlaybookMember` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_PlaybookMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_Run_Participants`
--

DROP TABLE IF EXISTS `IR_Run_Participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_Run_Participants` (
  `IncidentID` varchar(26) NOT NULL,
  `UserID` varchar(26) NOT NULL,
  `IsFollower` tinyint(1) NOT NULL,
  PRIMARY KEY (`IncidentID`,`UserID`),
  KEY `IR_Run_Participants_UserID` (`UserID`),
  KEY `IR_Run_Participants_IncidentID` (`IncidentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_Run_Participants`
--

LOCK TABLES `IR_Run_Participants` WRITE;
/*!40000 ALTER TABLE `IR_Run_Participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_Run_Participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_StatusPosts`
--

DROP TABLE IF EXISTS `IR_StatusPosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_StatusPosts` (
  `IncidentID` varchar(26) NOT NULL,
  `PostID` varchar(26) NOT NULL,
  PRIMARY KEY (`IncidentID`,`PostID`),
  KEY `IR_StatusPosts_IncidentID` (`IncidentID`),
  KEY `IR_StatusPosts_PostID` (`PostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_StatusPosts`
--

LOCK TABLES `IR_StatusPosts` WRITE;
/*!40000 ALTER TABLE `IR_StatusPosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_StatusPosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_System`
--

DROP TABLE IF EXISTS `IR_System`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_System` (
  `SKey` varchar(64) NOT NULL,
  `SValue` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`SKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_System`
--

LOCK TABLES `IR_System` WRITE;
/*!40000 ALTER TABLE `IR_System` DISABLE KEYS */;
INSERT INTO `IR_System` VALUES ('DatabaseVersion','0.56.0');
/*!40000 ALTER TABLE `IR_System` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_TimelineEvent`
--

DROP TABLE IF EXISTS `IR_TimelineEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_TimelineEvent` (
  `ID` varchar(26) NOT NULL,
  `IncidentID` varchar(26) NOT NULL,
  `CreateAt` bigint(20) NOT NULL,
  `DeleteAt` bigint(20) NOT NULL DEFAULT '0',
  `EventAt` bigint(20) NOT NULL,
  `EventType` varchar(32) NOT NULL DEFAULT '',
  `Summary` varchar(256) NOT NULL DEFAULT '',
  `Details` varchar(4096) NOT NULL DEFAULT '',
  `PostID` varchar(26) NOT NULL DEFAULT '',
  `SubjectUserID` varchar(26) NOT NULL DEFAULT '',
  `CreatorUserID` varchar(26) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `IR_TimelineEvent_ID` (`ID`),
  KEY `IR_TimelineEvent_IncidentID` (`IncidentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_TimelineEvent`
--

LOCK TABLES `IR_TimelineEvent` WRITE;
/*!40000 ALTER TABLE `IR_TimelineEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_TimelineEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_UserInfo`
--

DROP TABLE IF EXISTS `IR_UserInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_UserInfo` (
  `ID` varchar(26) NOT NULL,
  `LastDailyTodoDMAt` bigint(20) DEFAULT NULL,
  `DigestNotificationSettingsJSON` json DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_UserInfo`
--

LOCK TABLES `IR_UserInfo` WRITE;
/*!40000 ALTER TABLE `IR_UserInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_UserInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IR_ViewedChannel`
--

DROP TABLE IF EXISTS `IR_ViewedChannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IR_ViewedChannel` (
  `ChannelID` varchar(26) NOT NULL,
  `UserID` varchar(26) NOT NULL,
  PRIMARY KEY (`ChannelID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IR_ViewedChannel`
--

LOCK TABLES `IR_ViewedChannel` WRITE;
/*!40000 ALTER TABLE `IR_ViewedChannel` DISABLE KEYS */;
/*!40000 ALTER TABLE `IR_ViewedChannel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IncomingWebhooks`
--

DROP TABLE IF EXISTS `IncomingWebhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IncomingWebhooks` (
  `Id` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `ChannelId` varchar(26) DEFAULT NULL,
  `TeamId` varchar(26) DEFAULT NULL,
  `DisplayName` varchar(64) DEFAULT NULL,
  `Description` text,
  `Username` varchar(255) DEFAULT NULL,
  `IconURL` text,
  `ChannelLocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_incoming_webhook_user_id` (`UserId`),
  KEY `idx_incoming_webhook_team_id` (`TeamId`),
  KEY `idx_incoming_webhook_update_at` (`UpdateAt`),
  KEY `idx_incoming_webhook_create_at` (`CreateAt`),
  KEY `idx_incoming_webhook_delete_at` (`DeleteAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IncomingWebhooks`
--

LOCK TABLES `IncomingWebhooks` WRITE;
/*!40000 ALTER TABLE `IncomingWebhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `IncomingWebhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jobs`
--

DROP TABLE IF EXISTS `Jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Jobs` (
  `Id` varchar(26) NOT NULL,
  `Type` varchar(32) DEFAULT NULL,
  `Priority` bigint(20) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `StartAt` bigint(20) DEFAULT NULL,
  `LastActivityAt` bigint(20) DEFAULT NULL,
  `Status` varchar(32) DEFAULT NULL,
  `Progress` bigint(20) DEFAULT NULL,
  `Data` json DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_jobs_type` (`Type`),
  KEY `idx_jobs_status_type` (`Status`,`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jobs`
--

LOCK TABLES `Jobs` WRITE;
/*!40000 ALTER TABLE `Jobs` DISABLE KEYS */;
INSERT INTO `Jobs` VALUES ('dbm1s4ibrfgzfbcj88rcb6gruh','migrations',0,1675957179521,1675957191536,1675957191747,'success',0,'{\"last_done\": \"{\\\"current_table\\\":\\\"ChannelMembers\\\",\\\"last_team_id\\\":\\\"00000000000000000000000000\\\",\\\"last_channel_id\\\":\\\"00000000000000000000000000\\\",\\\"last_user\\\":\\\"00000000000000000000000000\\\"}\", \"migration_key\": \"migration_advanced_permissions_phase_2\"}');
/*!40000 ALTER TABLE `Jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Licenses`
--

DROP TABLE IF EXISTS `Licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Licenses` (
  `Id` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `Bytes` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Licenses`
--

LOCK TABLES `Licenses` WRITE;
/*!40000 ALTER TABLE `Licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LinkMetadata`
--

DROP TABLE IF EXISTS `LinkMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LinkMetadata` (
  `Hash` bigint(20) NOT NULL,
  `URL` text,
  `Timestamp` bigint(20) DEFAULT NULL,
  `Type` varchar(16) DEFAULT NULL,
  `Data` json DEFAULT NULL,
  PRIMARY KEY (`Hash`),
  KEY `idx_link_metadata_url_timestamp` (`URL`(512),`Timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LinkMetadata`
--

LOCK TABLES `LinkMetadata` WRITE;
/*!40000 ALTER TABLE `LinkMetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `LinkMetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NotifyAdmin`
--

DROP TABLE IF EXISTS `NotifyAdmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NotifyAdmin` (
  `UserId` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `RequiredPlan` varchar(26) NOT NULL,
  `RequiredFeature` varchar(100) NOT NULL,
  `Trial` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserId`,`RequiredFeature`,`RequiredPlan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NotifyAdmin`
--

LOCK TABLES `NotifyAdmin` WRITE;
/*!40000 ALTER TABLE `NotifyAdmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `NotifyAdmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OAuthAccessData`
--

DROP TABLE IF EXISTS `OAuthAccessData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OAuthAccessData` (
  `Token` varchar(26) NOT NULL,
  `RefreshToken` varchar(26) DEFAULT NULL,
  `RedirectUri` text,
  `ClientId` varchar(26) DEFAULT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `ExpiresAt` bigint(20) DEFAULT NULL,
  `Scope` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`Token`),
  UNIQUE KEY `ClientId` (`ClientId`,`UserId`),
  KEY `idx_oauthaccessdata_user_id` (`UserId`),
  KEY `idx_oauthaccessdata_refresh_token` (`RefreshToken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OAuthAccessData`
--

LOCK TABLES `OAuthAccessData` WRITE;
/*!40000 ALTER TABLE `OAuthAccessData` DISABLE KEYS */;
/*!40000 ALTER TABLE `OAuthAccessData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OAuthApps`
--

DROP TABLE IF EXISTS `OAuthApps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OAuthApps` (
  `Id` varchar(26) NOT NULL,
  `CreatorId` varchar(26) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `ClientSecret` varchar(128) DEFAULT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Description` text,
  `CallbackUrls` text,
  `Homepage` text,
  `IsTrusted` tinyint(1) DEFAULT NULL,
  `IconURL` text,
  `MattermostAppID` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  KEY `idx_oauthapps_creator_id` (`CreatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OAuthApps`
--

LOCK TABLES `OAuthApps` WRITE;
/*!40000 ALTER TABLE `OAuthApps` DISABLE KEYS */;
/*!40000 ALTER TABLE `OAuthApps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OAuthAuthData`
--

DROP TABLE IF EXISTS `OAuthAuthData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OAuthAuthData` (
  `ClientId` varchar(26) DEFAULT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `Code` varchar(128) NOT NULL,
  `ExpiresIn` int(11) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `RedirectUri` text,
  `State` text,
  `Scope` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OAuthAuthData`
--

LOCK TABLES `OAuthAuthData` WRITE;
/*!40000 ALTER TABLE `OAuthAuthData` DISABLE KEYS */;
/*!40000 ALTER TABLE `OAuthAuthData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OutgoingWebhooks`
--

DROP TABLE IF EXISTS `OutgoingWebhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OutgoingWebhooks` (
  `Id` varchar(26) NOT NULL,
  `Token` varchar(26) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `CreatorId` varchar(26) DEFAULT NULL,
  `ChannelId` varchar(26) DEFAULT NULL,
  `TeamId` varchar(26) DEFAULT NULL,
  `TriggerWords` text,
  `CallbackURLs` text,
  `DisplayName` varchar(64) DEFAULT NULL,
  `ContentType` varchar(128) DEFAULT NULL,
  `TriggerWhen` int(11) DEFAULT NULL,
  `Username` varchar(64) DEFAULT NULL,
  `IconURL` text,
  `Description` text,
  PRIMARY KEY (`Id`),
  KEY `idx_outgoing_webhook_team_id` (`TeamId`),
  KEY `idx_outgoing_webhook_update_at` (`UpdateAt`),
  KEY `idx_outgoing_webhook_create_at` (`CreateAt`),
  KEY `idx_outgoing_webhook_delete_at` (`DeleteAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OutgoingWebhooks`
--

LOCK TABLES `OutgoingWebhooks` WRITE;
/*!40000 ALTER TABLE `OutgoingWebhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `OutgoingWebhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PluginKeyValueStore`
--

DROP TABLE IF EXISTS `PluginKeyValueStore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PluginKeyValueStore` (
  `PluginId` varchar(190) NOT NULL,
  `PKey` varchar(150) NOT NULL,
  `PValue` mediumblob,
  `ExpireAt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PluginId`,`PKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PluginKeyValueStore`
--

LOCK TABLES `PluginKeyValueStore` WRITE;
/*!40000 ALTER TABLE `PluginKeyValueStore` DISABLE KEYS */;
INSERT INTO `PluginKeyValueStore` VALUES ('com.mattermost.apps','mmi_botid',_binary '5oc8fyy1c7ybzgrja71zhutmja',0),('com.mattermost.nps','ServerUpgrade-7.5.0',_binary '{\"server_version\":\"7.5.0\",\"upgrade_at\":\"2023-02-09T15:38:39.118601277Z\"}',0),('com.mattermost.nps','Survey-7.5.0',_binary '{\"server_version\":\"7.5.0\",\"create_at\":\"2023-02-09T15:38:39.118601277Z\",\"start_at\":\"2023-03-26T15:38:39.118601277Z\"}',0),('com.mattermost.nps','WelcomeFeedbackMigration',_binary '{\"CreateAt\":\"2023-02-09T15:38:39.118601277Z\"}',0),('focalboard','mmi_botid',_binary 'gthntg6dgpdkbnzkp39muoidhw',0),('playbooks','mmi_botid',_binary '7ffqea1am3nbxnekkn5fga4ppr',0);
/*!40000 ALTER TABLE `PluginKeyValueStore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PostReminders`
--

DROP TABLE IF EXISTS `PostReminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PostReminders` (
  `PostId` varchar(26) NOT NULL,
  `UserId` varchar(26) NOT NULL,
  `TargetTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PostId`,`UserId`),
  KEY `idx_postreminders_targettime` (`TargetTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostReminders`
--

LOCK TABLES `PostReminders` WRITE;
/*!40000 ALTER TABLE `PostReminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `PostReminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts`
--

DROP TABLE IF EXISTS `Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Posts` (
  `Id` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `ChannelId` varchar(26) DEFAULT NULL,
  `RootId` varchar(26) DEFAULT NULL,
  `OriginalId` varchar(26) DEFAULT NULL,
  `Message` text,
  `Type` varchar(26) DEFAULT NULL,
  `Props` json DEFAULT NULL,
  `Hashtags` text,
  `Filenames` text,
  `FileIds` text,
  `HasReactions` tinyint(1) DEFAULT NULL,
  `EditAt` bigint(20) DEFAULT NULL,
  `IsPinned` tinyint(1) DEFAULT NULL,
  `RemoteId` varchar(26) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_posts_update_at` (`UpdateAt`),
  KEY `idx_posts_create_at` (`CreateAt`),
  KEY `idx_posts_delete_at` (`DeleteAt`),
  KEY `idx_posts_user_id` (`UserId`),
  KEY `idx_posts_is_pinned` (`IsPinned`),
  KEY `idx_posts_channel_id_update_at` (`ChannelId`,`UpdateAt`),
  KEY `idx_posts_channel_id_delete_at_create_at` (`ChannelId`,`DeleteAt`,`CreateAt`),
  KEY `idx_posts_root_id_delete_at` (`RootId`,`DeleteAt`),
  KEY `idx_posts_create_at_id` (`CreateAt`,`Id`),
  FULLTEXT KEY `idx_posts_message_txt` (`Message`),
  FULLTEXT KEY `idx_posts_hashtags_txt` (`Hashtags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
INSERT INTO `Posts` VALUES ('4ondmn94s3g4f8nydax19i369c',1675957856702,1675957856702,0,'hruniqwds7gg5bcm5fmn931iih','qzzdms4tyb8zzbo5e8b8r56mtc','','','','system_welcome_post','{}','','[]','[]',0,0,0,NULL),('767ufw6nx7rtzmwpmjw956tsra',1675958169696,1675958169696,0,'1qzsypdm9t8hibuegnwymnyp3w','t4jmndx64iy7jdpes19zwxsqur','','','plugin-test joined the channel.','system_join_channel','{\"from_bot\": \"true\", \"username\": \"plugin-test\"}','','[]','[]',0,0,0,NULL),('dkdyprh4utr73qj9g186jgk3oo',1675958169671,1675958169671,0,'1qzsypdm9t8hibuegnwymnyp3w','qzzdms4tyb8zzbo5e8b8r56mtc','','','plugin-test joined the team.','system_join_team','{\"from_bot\": \"true\", \"username\": \"plugin-test\"}','','[]','[]',0,0,0,NULL),('jse3ot3pwjroufjy9so9xo6h8e',1675957856722,1675957856722,0,'hruniqwds7gg5bcm5fmn931iih','t4jmndx64iy7jdpes19zwxsqur','','','cmempy-developer joined the channel.','system_join_channel','{\"username\": \"cmempy-developer\"}','','[]','[]',0,0,0,NULL),('odc5gx1otprkzy1rw3aqu7t6cr',1675957856688,1675957856688,0,'hruniqwds7gg5bcm5fmn931iih','qzzdms4tyb8zzbo5e8b8r56mtc','','','cmempy-developer joined the team.','system_join_team','{\"username\": \"cmempy-developer\"}','','[]','[]',0,0,0,NULL),('p64kewpgifr8pcdrbym4gfdy5w',1675958089087,1675958089087,0,'1qzsypdm9t8hibuegnwymnyp3w','7mcz1rmkjpn8zxqk3m4c8axeor','','','Please add me to teams and channels you want me to interact in. To do this, use the browser or Mattermost Desktop App.','add_bot_teams_channels','{\"from_bot\": \"true\"}','','[]','[]',0,0,0,NULL);
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Preferences`
--

DROP TABLE IF EXISTS `Preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Preferences` (
  `UserId` varchar(26) NOT NULL,
  `Category` varchar(32) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Value` text,
  PRIMARY KEY (`UserId`,`Category`,`Name`),
  KEY `idx_preferences_category` (`Category`),
  KEY `idx_preferences_name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Preferences`
--

LOCK TABLES `Preferences` WRITE;
/*!40000 ALTER TABLE `Preferences` DISABLE KEYS */;
INSERT INTO `Preferences` VALUES ('hruniqwds7gg5bcm5fmn931iih','channel_approximate_view_time','','1675957908562'),('hruniqwds7gg5bcm5fmn931iih','channel_open_time','7mcz1rmkjpn8zxqk3m4c8axeor','1675958188895'),('hruniqwds7gg5bcm5fmn931iih','direct_channel_show','1qzsypdm9t8hibuegnwymnyp3w','true'),('hruniqwds7gg5bcm5fmn931iih','insights','insights_tutorial_state','{\"insights_modal_viewed\":true}'),('hruniqwds7gg5bcm5fmn931iih','onboarding_task_list','onboarding_task_list_open','false'),('hruniqwds7gg5bcm5fmn931iih','onboarding_task_list','onboarding_task_list_show','true'),('hruniqwds7gg5bcm5fmn931iih','recommended_next_steps','hide','true'),('hruniqwds7gg5bcm5fmn931iih','tutorial_step','hruniqwds7gg5bcm5fmn931iih','0');
/*!40000 ALTER TABLE `Preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductNoticeViewState`
--

DROP TABLE IF EXISTS `ProductNoticeViewState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductNoticeViewState` (
  `UserId` varchar(26) NOT NULL,
  `NoticeId` varchar(26) NOT NULL,
  `Viewed` int(11) DEFAULT NULL,
  `Timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`NoticeId`),
  KEY `idx_notice_views_timestamp` (`Timestamp`),
  KEY `idx_notice_views_notice_id` (`NoticeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductNoticeViewState`
--

LOCK TABLES `ProductNoticeViewState` WRITE;
/*!40000 ALTER TABLE `ProductNoticeViewState` DISABLE KEYS */;
INSERT INTO `ProductNoticeViewState` VALUES ('hruniqwds7gg5bcm5fmn931iih','crt-admin-default_off',1,1675957798),('hruniqwds7gg5bcm5fmn931iih','crt-admin-disabled',1,1675957798),('hruniqwds7gg5bcm5fmn931iih','crt-user-always-on',1,1675957798),('hruniqwds7gg5bcm5fmn931iih','crt-user-default-on',1,1675957798),('hruniqwds7gg5bcm5fmn931iih','desktop_upgrade_v5.2',1,1675957798),('hruniqwds7gg5bcm5fmn931iih','june15-cloud-freemium',1,1675957798),('hruniqwds7gg5bcm5fmn931iih','server_upgrade_v7.7',1,1675957798),('hruniqwds7gg5bcm5fmn931iih','unsupported-server-v5.37',1,1675957798),('hruniqwds7gg5bcm5fmn931iih','use_case_survey',1,1675957798),('hruniqwds7gg5bcm5fmn931iih','v6.0_user_introduction',1,1675957798),('hruniqwds7gg5bcm5fmn931iih','v6.2_boards',1,1675957798);
/*!40000 ALTER TABLE `ProductNoticeViewState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PublicChannels`
--

DROP TABLE IF EXISTS `PublicChannels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PublicChannels` (
  `Id` varchar(26) NOT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `TeamId` varchar(26) DEFAULT NULL,
  `DisplayName` varchar(64) DEFAULT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Header` text,
  `Purpose` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`,`TeamId`),
  KEY `idx_publicchannels_team_id` (`TeamId`),
  KEY `idx_publicchannels_delete_at` (`DeleteAt`),
  FULLTEXT KEY `idx_publicchannels_search_txt` (`Name`,`DisplayName`,`Purpose`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PublicChannels`
--

LOCK TABLES `PublicChannels` WRITE;
/*!40000 ALTER TABLE `PublicChannels` DISABLE KEYS */;
INSERT INTO `PublicChannels` VALUES ('qzzdms4tyb8zzbo5e8b8r56mtc',0,'bomuda47qpf7pfbmacnioyhona','Town Square','town-square','',''),('t4jmndx64iy7jdpes19zwxsqur',0,'bomuda47qpf7pfbmacnioyhona','Off-Topic','off-topic','','');
/*!40000 ALTER TABLE `PublicChannels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reactions`
--

DROP TABLE IF EXISTS `Reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reactions` (
  `UserId` varchar(26) NOT NULL,
  `PostId` varchar(26) NOT NULL,
  `EmojiName` varchar(64) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `RemoteId` varchar(26) DEFAULT NULL,
  `ChannelId` varchar(26) NOT NULL DEFAULT '',
  PRIMARY KEY (`PostId`,`UserId`,`EmojiName`),
  KEY `idx_reactions_channel_id` (`ChannelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reactions`
--

LOCK TABLES `Reactions` WRITE;
/*!40000 ALTER TABLE `Reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecentSearches`
--

DROP TABLE IF EXISTS `RecentSearches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecentSearches` (
  `UserId` char(26) NOT NULL,
  `SearchPointer` int(11) NOT NULL,
  `Query` json DEFAULT NULL,
  `CreateAt` bigint(20) NOT NULL,
  PRIMARY KEY (`UserId`,`SearchPointer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecentSearches`
--

LOCK TABLES `RecentSearches` WRITE;
/*!40000 ALTER TABLE `RecentSearches` DISABLE KEYS */;
/*!40000 ALTER TABLE `RecentSearches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RemoteClusters`
--

DROP TABLE IF EXISTS `RemoteClusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RemoteClusters` (
  `RemoteId` varchar(26) NOT NULL,
  `RemoteTeamId` varchar(26) DEFAULT NULL,
  `Name` varchar(64) NOT NULL,
  `DisplayName` varchar(64) DEFAULT NULL,
  `SiteURL` text,
  `CreateAt` bigint(20) DEFAULT NULL,
  `LastPingAt` bigint(20) DEFAULT NULL,
  `Token` varchar(26) DEFAULT NULL,
  `RemoteToken` varchar(26) DEFAULT NULL,
  `Topics` text,
  `CreatorId` varchar(26) DEFAULT NULL,
  PRIMARY KEY (`RemoteId`,`Name`),
  UNIQUE KEY `remote_clusters_site_url_unique` (`RemoteTeamId`,`SiteURL`(168))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RemoteClusters`
--

LOCK TABLES `RemoteClusters` WRITE;
/*!40000 ALTER TABLE `RemoteClusters` DISABLE KEYS */;
/*!40000 ALTER TABLE `RemoteClusters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RetentionPolicies`
--

DROP TABLE IF EXISTS `RetentionPolicies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RetentionPolicies` (
  `Id` varchar(26) NOT NULL,
  `DisplayName` varchar(64) DEFAULT NULL,
  `PostDuration` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IDX_RetentionPolicies_DisplayName` (`DisplayName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RetentionPolicies`
--

LOCK TABLES `RetentionPolicies` WRITE;
/*!40000 ALTER TABLE `RetentionPolicies` DISABLE KEYS */;
/*!40000 ALTER TABLE `RetentionPolicies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RetentionPoliciesChannels`
--

DROP TABLE IF EXISTS `RetentionPoliciesChannels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RetentionPoliciesChannels` (
  `PolicyId` varchar(26) DEFAULT NULL,
  `ChannelId` varchar(26) NOT NULL,
  PRIMARY KEY (`ChannelId`),
  KEY `IDX_RetentionPoliciesChannels_PolicyId` (`PolicyId`),
  CONSTRAINT `FK_RetentionPoliciesChannels_RetentionPolicies` FOREIGN KEY (`PolicyId`) REFERENCES `RetentionPolicies` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RetentionPoliciesChannels`
--

LOCK TABLES `RetentionPoliciesChannels` WRITE;
/*!40000 ALTER TABLE `RetentionPoliciesChannels` DISABLE KEYS */;
/*!40000 ALTER TABLE `RetentionPoliciesChannels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RetentionPoliciesTeams`
--

DROP TABLE IF EXISTS `RetentionPoliciesTeams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RetentionPoliciesTeams` (
  `PolicyId` varchar(26) DEFAULT NULL,
  `TeamId` varchar(26) NOT NULL,
  PRIMARY KEY (`TeamId`),
  KEY `IDX_RetentionPoliciesTeams_PolicyId` (`PolicyId`),
  CONSTRAINT `FK_RetentionPoliciesTeams_RetentionPolicies` FOREIGN KEY (`PolicyId`) REFERENCES `RetentionPolicies` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RetentionPoliciesTeams`
--

LOCK TABLES `RetentionPoliciesTeams` WRITE;
/*!40000 ALTER TABLE `RetentionPoliciesTeams` DISABLE KEYS */;
/*!40000 ALTER TABLE `RetentionPoliciesTeams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `Id` varchar(26) NOT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `DisplayName` varchar(128) DEFAULT NULL,
  `Description` text,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `Permissions` longtext,
  `SchemeManaged` tinyint(1) DEFAULT NULL,
  `BuiltIn` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES ('1uc5zqs54bbybj8x8b1gg33kca','system_post_all','authentication.roles.system_post_all.name','authentication.roles.system_post_all.description',1675957116492,1675957117799,0,' use_group_mentions use_channel_mentions create_post',0,1),('4gh4rm56dbgefkakj6aijruhmw','channel_admin','authentication.roles.channel_admin.name','authentication.roles.channel_admin.description',1675957116467,1675957117800,0,' manage_private_channel_members remove_reaction manage_channel_roles read_private_channel_groups manage_public_channel_members use_channel_mentions use_group_mentions create_post read_public_channel_groups add_reaction',1,1),('57b5joped7dzpg31435httu6ih','system_post_all_public','authentication.roles.system_post_all_public.name','authentication.roles.system_post_all_public.description',1675957116498,1675957117802,0,' use_group_mentions use_channel_mentions create_post_public',0,1),('6kenmj3i8fndbpth3hg7bhx8xr','playbook_member','authentication.roles.playbook_member.name','authentication.roles.playbook_member.description',1675957116508,1675957117803,0,' run_create playbook_public_view playbook_public_manage_members playbook_public_manage_properties playbook_private_view playbook_private_manage_members playbook_private_manage_properties',1,1),('7skrdhygdtfm3p6dsiqzf1xg9r','system_user','authentication.roles.global_user.name','authentication.roles.global_user.description',1675957116476,1675957117804,0,' manage_custom_group_members create_custom_group create_group_channel view_members edit_custom_group create_team delete_custom_group delete_emojis list_public_teams join_public_teams create_direct_channel create_emojis',1,1),('akg8fs8fm3ghiymr11gaprc4th','system_custom_group_admin','authentication.roles.system_custom_group_admin.name','authentication.roles.system_custom_group_admin.description',1675957116510,1675957117805,0,' create_custom_group edit_custom_group delete_custom_group manage_custom_group_members',0,1),('bedad3rmhtgufmsfj91nts7o5y','system_admin','authentication.roles.global_admin.name','authentication.roles.global_admin.description',1675957116482,1675957117806,0,' get_analytics sysconsole_write_site_notifications read_public_channel purge_bleve_indexes manage_others_slash_commands sysconsole_read_environment_rate_limiting sysconsole_read_environment_file_storage sysconsole_write_experimental_features promote_guest create_bot remove_reaction manage_custom_group_members sysconsole_write_reporting_team_statistics create_user_access_token sysconsole_read_environment_smtp delete_private_channel run_manage_members sysconsole_read_user_management_channels sysconsole_read_site_notices list_public_teams sysconsole_write_integrations_bot_accounts sysconsole_read_environment_database manage_incoming_webhooks sysconsole_read_site_posts use_channel_mentions playbook_public_make_private sysconsole_write_environment_file_storage playbook_private_manage_roles sysconsole_read_compliance_data_retention_policy read_bots sysconsole_write_site_public_links manage_system_wide_oauth create_group_channel sysconsole_read_environment_session_lengths sysconsole_read_experimental_feature_flags read_channel read_jobs run_view assign_system_admin_role get_saml_metadata_from_idp sysconsole_write_environment_smtp create_elasticsearch_post_indexing_job create_post_ephemeral sysconsole_write_environment_database test_elasticsearch join_public_channels read_ldap_sync_job sysconsole_read_user_management_system_roles sysconsole_write_user_management_groups sysconsole_write_authentication_guest_access manage_private_channel_members create_compliance_export_job sysconsole_read_about_edition_and_license sysconsole_read_environment_push_notification_server sysconsole_write_user_management_channels create_ldap_sync_job sysconsole_write_user_management_teams sysconsole_write_experimental_feature_flags sysconsole_read_authentication_password view_members create_elasticsearch_post_aggregation_job add_saml_private_cert sysconsole_read_plugins playbook_public_view manage_bots edit_custom_group invalidate_email_invite list_team_channels sysconsole_write_site_emoji edit_brand sysconsole_read_site_announcement_banner sysconsole_read_authentication_signup sysconsole_read_billing import_team playbook_private_manage_members sysconsole_read_authentication_openid sysconsole_read_environment_image_proxy manage_oauth sysconsole_read_experimental_bleve sysconsole_read_integrations_gif sysconsole_write_compliance_compliance_export manage_others_outgoing_webhooks manage_outgoing_webhooks remove_saml_idp_cert sysconsole_write_authentication_signup invite_guest playbook_public_manage_members remove_saml_public_cert read_deleted_posts create_data_retention_job playbook_private_create remove_saml_private_cert manage_others_incoming_webhooks manage_jobs sysconsole_write_environment_session_lengths sysconsole_read_site_customization convert_private_channel_to_public playbook_private_view view_team delete_emojis sysconsole_write_compliance_data_retention_policy manage_team_roles sysconsole_write_authentication_mfa create_public_channel sysconsole_write_integrations_gif sysconsole_read_reporting_team_statistics assign_bot delete_post sysconsole_read_site_notifications sysconsole_write_products_boards manage_team sysconsole_write_environment_elasticsearch sysconsole_write_site_posts sysconsole_write_plugins playbook_public_manage_roles join_private_teams use_group_mentions remove_user_from_team sysconsole_write_environment_web_server revoke_user_access_token purge_elasticsearch_indexes get_logs sysconsole_write_billing test_s3 list_users_without_team read_others_bots test_email delete_others_posts delete_public_channel manage_others_bots sysconsole_write_site_notices create_post_bleve_indexes_job add_ldap_public_cert sysconsole_read_compliance_custom_terms_of_service create_team sysconsole_read_site_emoji add_ldap_private_cert sysconsole_read_environment_high_availability sysconsole_read_site_file_sharing_and_downloads sysconsole_write_site_users_and_teams sysconsole_write_user_management_system_roles read_license_information join_public_teams test_site_url sysconsole_read_products_boards sysconsole_read_environment_elasticsearch sysconsole_write_user_management_users read_user_access_token sysconsole_read_integrations_bot_accounts add_reaction sysconsole_write_authentication_openid upload_file sysconsole_write_site_localization sysconsole_write_user_management_permissions sysconsole_read_user_management_permissions edit_other_users read_public_channel_groups sysconsole_read_environment_logging demote_to_guest sysconsole_read_reporting_site_statistics download_compliance_export_result manage_public_channel_properties run_manage_properties sysconsole_write_site_file_sharing_and_downloads use_slash_commands sysconsole_write_reporting_site_statistics manage_secure_connections sysconsole_read_environment_performance_monitoring sysconsole_read_reporting_server_logs sysconsole_read_compliance_compliance_monitoring add_saml_idp_cert remove_ldap_private_cert add_user_to_team read_compliance_export_job sysconsole_write_environment_image_proxy sysconsole_read_site_localization read_elasticsearch_post_aggregation_job edit_post manage_license_information sysconsole_read_environment_developer sysconsole_read_user_management_groups manage_channel_roles read_other_users_teams sysconsole_read_authentication_guest_access sysconsole_write_experimental_bleve invite_user list_private_teams create_custom_group sysconsole_read_authentication_email invalidate_caches manage_system sysconsole_write_environment_rate_limiting recycle_database_connections remove_ldap_public_cert manage_shared_channels sysconsole_write_environment_developer sysconsole_write_integrations_integration_management sysconsole_read_site_users_and_teams reload_config create_direct_channel create_post read_elasticsearch_post_indexing_job convert_public_channel_to_private sysconsole_read_authentication_mfa add_saml_public_cert sysconsole_read_authentication_ldap sysconsole_write_environment_high_availability manage_public_channel_members sysconsole_write_reporting_server_logs delete_custom_group delete_others_emojis playbook_public_create sysconsole_read_integrations_integration_management sysconsole_read_environment_web_server sysconsole_write_authentication_saml read_data_retention_job read_private_channel_groups sysconsole_write_about_edition_and_license get_saml_cert_status create_private_channel sysconsole_write_environment_performance_monitoring test_ldap sysconsole_read_compliance_compliance_export manage_slash_commands sysconsole_write_environment_push_notification_server playbook_private_make_public sysconsole_write_environment_logging sysconsole_write_integrations_cors sysconsole_read_user_management_users manage_roles run_create edit_others_posts create_emojis sysconsole_read_experimental_features sysconsole_write_authentication_ldap create_post_public read_audits sysconsole_write_site_announcement_banner manage_private_channel_properties sysconsole_read_integrations_cors playbook_private_manage_properties sysconsole_read_user_management_teams remove_others_reactions sysconsole_write_site_customization sysconsole_read_authentication_saml get_public_link sysconsole_read_site_public_links sysconsole_write_compliance_compliance_monitoring sysconsole_write_compliance_custom_terms_of_service playbook_public_manage_properties sysconsole_write_authentication_password sysconsole_write_authentication_email',1,1),('bnfg5xgecjg3in9cjz75takzya','team_post_all','authentication.roles.team_post_all.name','authentication.roles.team_post_all.description',1675957116494,1675957117807,0,' use_group_mentions create_post use_channel_mentions',0,1),('c98t5skb37fozpx16kozyy3d8r','run_admin','authentication.roles.run_admin.name','authentication.roles.run_admin.description',1675957116474,1675957117808,0,' run_manage_members run_manage_properties',1,1),('chfxidxr8t8e9emt51c8ocer4e','team_admin','authentication.roles.team_admin.name','authentication.roles.team_admin.description',1675957116487,1675957117809,0,' manage_others_incoming_webhooks manage_others_outgoing_webhooks use_channel_mentions remove_reaction use_group_mentions create_post convert_private_channel_to_public manage_team manage_outgoing_webhooks read_private_channel_groups import_team playbook_public_manage_roles playbook_private_manage_roles manage_private_channel_members convert_public_channel_to_private read_public_channel_groups manage_incoming_webhooks manage_others_slash_commands delete_post manage_channel_roles manage_public_channel_members delete_others_posts manage_slash_commands manage_team_roles add_reaction remove_user_from_team',1,1),('expcyx3ozbdkxmqxd4xo7kcfbr','system_read_only_admin','authentication.roles.system_read_only_admin.name','authentication.roles.system_read_only_admin.description',1675957116461,1675957117811,0,' sysconsole_read_environment_web_server sysconsole_read_experimental_feature_flags sysconsole_read_compliance_compliance_monitoring sysconsole_read_experimental_bleve sysconsole_read_user_management_channels sysconsole_read_environment_rate_limiting read_compliance_export_job sysconsole_read_authentication_guest_access sysconsole_read_plugins sysconsole_read_environment_file_storage sysconsole_read_environment_developer read_audits get_logs sysconsole_read_site_localization sysconsole_read_reporting_server_logs sysconsole_read_environment_elasticsearch sysconsole_read_site_notifications read_other_users_teams sysconsole_read_environment_session_lengths sysconsole_read_authentication_signup sysconsole_read_environment_image_proxy list_public_teams sysconsole_read_compliance_compliance_export sysconsole_read_authentication_ldap sysconsole_read_environment_performance_monitoring sysconsole_read_site_emoji read_elasticsearch_post_aggregation_job download_compliance_export_result sysconsole_read_site_file_sharing_and_downloads sysconsole_read_integrations_integration_management read_public_channel sysconsole_read_experimental_features sysconsole_read_authentication_email read_elasticsearch_post_indexing_job sysconsole_read_compliance_data_retention_policy sysconsole_read_environment_logging read_license_information sysconsole_read_authentication_openid sysconsole_read_authentication_mfa sysconsole_read_user_management_teams list_private_teams sysconsole_read_site_customization sysconsole_read_site_public_links read_public_channel_groups sysconsole_read_products_boards sysconsole_read_integrations_cors read_ldap_sync_job sysconsole_read_user_management_permissions sysconsole_read_site_posts sysconsole_read_site_users_and_teams sysconsole_read_reporting_site_statistics sysconsole_read_reporting_team_statistics sysconsole_read_environment_high_availability sysconsole_read_environment_database sysconsole_read_site_notices sysconsole_read_user_management_users test_ldap sysconsole_read_user_management_groups sysconsole_read_integrations_bot_accounts read_private_channel_groups sysconsole_read_site_announcement_banner get_analytics sysconsole_read_compliance_custom_terms_of_service sysconsole_read_environment_smtp sysconsole_read_authentication_saml sysconsole_read_integrations_gif view_team read_channel sysconsole_read_authentication_password sysconsole_read_about_edition_and_license read_data_retention_job sysconsole_read_environment_push_notification_server',0,1),('fsn6gskfc7gciepts48qdxgiiw','custom_group_user','authentication.roles.custom_group_user.name','authentication.roles.custom_group_user.description',1675957116465,1675957117812,0,'',0,0),('g8qs6rgqxfge7xmy6r8css3jac','team_user','authentication.roles.team_user.name','authentication.roles.team_user.description',1675957116484,1675957117813,0,' playbook_public_create add_user_to_team read_public_channel list_team_channels join_public_channels view_team playbook_private_create create_public_channel invite_user create_private_channel',1,1),('gd6drk73ci8hdqmooxa6q45ify','system_user_manager','authentication.roles.system_user_manager.name','authentication.roles.system_user_manager.description',1675957116456,1675957117814,0,' manage_channel_roles read_private_channel_groups convert_public_channel_to_private sysconsole_read_authentication_mfa read_ldap_sync_job sysconsole_write_user_management_channels sysconsole_read_authentication_password sysconsole_read_user_management_permissions sysconsole_read_user_management_teams sysconsole_read_authentication_openid list_private_teams list_public_teams delete_public_channel remove_user_from_team sysconsole_read_user_management_groups view_team sysconsole_write_user_management_groups convert_private_channel_to_public add_user_to_team test_ldap read_channel manage_public_channel_members read_public_channel manage_public_channel_properties join_private_teams sysconsole_read_authentication_email sysconsole_read_authentication_saml sysconsole_read_authentication_signup manage_team delete_private_channel join_public_teams manage_private_channel_properties sysconsole_read_user_management_channels read_public_channel_groups manage_private_channel_members sysconsole_read_authentication_guest_access sysconsole_write_user_management_teams sysconsole_read_authentication_ldap manage_team_roles',0,1),('hcajuna3njnhtx5hk69pfg498c','team_post_all_public','authentication.roles.team_post_all_public.name','authentication.roles.team_post_all_public.description',1675957116472,1675957117815,0,' create_post_public use_group_mentions use_channel_mentions',0,1),('j4mawcheiigi9mmxhc4decqs7o','team_guest','authentication.roles.team_guest.name','authentication.roles.team_guest.description',1675957116469,1675957117816,0,' view_team',1,1),('m5b9in5jkjn3xcrnhqkdw33zgw','run_member','authentication.roles.run_member.name','authentication.roles.run_member.description',1675957116490,1675957117817,0,' run_view',1,1),('npi6mqcmgifajmdjtdfb7omc8y','system_user_access_token','authentication.roles.system_user_access_token.name','authentication.roles.system_user_access_token.description',1675957116500,1675957117818,0,' read_user_access_token revoke_user_access_token create_user_access_token',0,1),('on1mtng3q7dwub6kp8d6o6d8po','channel_guest','authentication.roles.channel_guest.name','authentication.roles.channel_guest.description',1675957116502,1675957117819,0,' use_slash_commands read_channel add_reaction remove_reaction upload_file edit_post create_post use_channel_mentions',1,1),('qfpnku8rabyqbdaec6pi84whha','playbook_admin','authentication.roles.playbook_admin.name','authentication.roles.playbook_admin.description',1675957116506,1675957117820,0,' playbook_public_make_private playbook_public_manage_members playbook_public_manage_roles playbook_public_manage_properties playbook_private_manage_members playbook_private_manage_roles playbook_private_manage_properties',1,1),('rro8mb5kt3depbjfof687gq5oc','system_guest','authentication.roles.global_guest.name','authentication.roles.global_guest.description',1675957116496,1675957117821,0,' create_group_channel create_direct_channel',1,1),('sosxzifyfprhpeoxsqociapu6a','channel_user','authentication.roles.channel_user.name','authentication.roles.channel_user.description',1675957116504,1675957117823,0,' manage_public_channel_members delete_private_channel manage_private_channel_members manage_public_channel_properties create_post read_public_channel_groups delete_post use_group_mentions manage_private_channel_properties upload_file delete_public_channel read_private_channel_groups use_slash_commands get_public_link use_channel_mentions remove_reaction edit_post read_channel add_reaction',1,1),('thgns8jhipgzxrm3rw1h68ju6a','system_manager','authentication.roles.system_manager.name','authentication.roles.system_manager.description',1675957116479,1675957117824,0,' sysconsole_read_environment_high_availability sysconsole_write_environment_developer sysconsole_read_site_customization manage_team_roles reload_config sysconsole_read_products_boards sysconsole_read_environment_smtp sysconsole_read_authentication_guest_access read_elasticsearch_post_aggregation_job delete_private_channel recycle_database_connections sysconsole_write_integrations_bot_accounts create_elasticsearch_post_aggregation_job add_user_to_team sysconsole_write_site_emoji sysconsole_write_environment_push_notification_server sysconsole_write_site_localization read_ldap_sync_job sysconsole_read_reporting_team_statistics convert_private_channel_to_public sysconsole_read_site_notices invalidate_caches sysconsole_read_reporting_site_statistics sysconsole_write_environment_rate_limiting sysconsole_write_site_users_and_teams test_site_url read_public_channel sysconsole_read_about_edition_and_license view_team sysconsole_write_user_management_permissions remove_user_from_team sysconsole_write_site_public_links sysconsole_write_environment_database sysconsole_read_user_management_groups list_private_teams sysconsole_read_user_management_permissions manage_channel_roles sysconsole_read_environment_database sysconsole_read_integrations_bot_accounts sysconsole_read_site_emoji sysconsole_read_integrations_gif create_elasticsearch_post_indexing_job sysconsole_read_authentication_ldap manage_private_channel_properties sysconsole_write_products_boards get_logs sysconsole_write_environment_logging sysconsole_write_user_management_groups list_public_teams sysconsole_write_environment_high_availability sysconsole_write_site_customization sysconsole_write_site_notifications sysconsole_read_site_users_and_teams sysconsole_read_authentication_mfa read_license_information read_elasticsearch_post_indexing_job sysconsole_read_site_public_links manage_private_channel_members sysconsole_read_reporting_server_logs sysconsole_read_environment_performance_monitoring sysconsole_read_environment_file_storage test_ldap sysconsole_write_integrations_gif sysconsole_read_site_file_sharing_and_downloads sysconsole_read_environment_developer sysconsole_write_user_management_channels sysconsole_write_environment_smtp manage_team sysconsole_write_site_file_sharing_and_downloads sysconsole_write_integrations_cors read_private_channel_groups sysconsole_read_plugins get_analytics sysconsole_write_environment_session_lengths sysconsole_read_authentication_signup sysconsole_write_integrations_integration_management sysconsole_read_site_posts sysconsole_read_environment_push_notification_server sysconsole_read_authentication_password sysconsole_read_environment_image_proxy sysconsole_write_site_posts sysconsole_read_environment_elasticsearch sysconsole_read_integrations_integration_management sysconsole_write_environment_image_proxy sysconsole_write_user_management_teams test_s3 sysconsole_write_environment_performance_monitoring convert_public_channel_to_private sysconsole_read_site_notifications edit_brand sysconsole_read_authentication_email join_private_teams sysconsole_write_environment_elasticsearch sysconsole_read_environment_session_lengths sysconsole_read_user_management_channels sysconsole_read_environment_logging sysconsole_read_user_management_teams sysconsole_write_environment_web_server test_email manage_public_channel_properties sysconsole_read_environment_web_server sysconsole_write_environment_file_storage sysconsole_read_site_announcement_banner sysconsole_read_integrations_cors read_channel manage_public_channel_members sysconsole_read_environment_rate_limiting read_public_channel_groups sysconsole_write_site_announcement_banner test_elasticsearch purge_elasticsearch_indexes sysconsole_read_authentication_saml join_public_teams sysconsole_read_site_localization delete_public_channel sysconsole_write_site_notices sysconsole_read_authentication_openid',0,1);
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schemes`
--

DROP TABLE IF EXISTS `Schemes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schemes` (
  `Id` varchar(26) NOT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `DisplayName` varchar(128) DEFAULT NULL,
  `Description` text,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `Scope` varchar(32) DEFAULT NULL,
  `DefaultTeamAdminRole` varchar(64) DEFAULT NULL,
  `DefaultTeamUserRole` varchar(64) DEFAULT NULL,
  `DefaultChannelAdminRole` varchar(64) DEFAULT NULL,
  `DefaultChannelUserRole` varchar(64) DEFAULT NULL,
  `DefaultTeamGuestRole` varchar(64) DEFAULT NULL,
  `DefaultChannelGuestRole` varchar(64) DEFAULT NULL,
  `DefaultPlaybookAdminRole` varchar(64) DEFAULT '',
  `DefaultPlaybookMemberRole` varchar(64) DEFAULT '',
  `DefaultRunAdminRole` varchar(64) DEFAULT '',
  `DefaultRunMemberRole` varchar(64) DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`),
  KEY `idx_schemes_channel_guest_role` (`DefaultChannelGuestRole`),
  KEY `idx_schemes_channel_user_role` (`DefaultChannelUserRole`),
  KEY `idx_schemes_channel_admin_role` (`DefaultChannelAdminRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schemes`
--

LOCK TABLES `Schemes` WRITE;
/*!40000 ALTER TABLE `Schemes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schemes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sessions`
--

DROP TABLE IF EXISTS `Sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sessions` (
  `Id` varchar(26) NOT NULL,
  `Token` varchar(26) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `ExpiresAt` bigint(20) DEFAULT NULL,
  `LastActivityAt` bigint(20) DEFAULT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `DeviceId` text,
  `Roles` text,
  `IsOAuth` tinyint(1) DEFAULT NULL,
  `Props` json DEFAULT NULL,
  `ExpiredNotify` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_sessions_user_id` (`UserId`),
  KEY `idx_sessions_token` (`Token`),
  KEY `idx_sessions_expires_at` (`ExpiresAt`),
  KEY `idx_sessions_create_at` (`CreateAt`),
  KEY `idx_sessions_last_activity_at` (`LastActivityAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sessions`
--

LOCK TABLES `Sessions` WRITE;
/*!40000 ALTER TABLE `Sessions` DISABLE KEYS */;
INSERT INTO `Sessions` VALUES ('5zytao477jf73y4d3zjhjds6co','whyo1zgn1786zjqd9aq5qge88r',1675957798627,1678549798627,1675958125971,'hruniqwds7gg5bcm5fmn931iih','','system_admin system_user',0,'{\"os\": \"Mac OS\", \"csrf\": \"tr7kg8xrqigftm4wqn3a5cuhxr\", \"isSaml\": \"false\", \"browser\": \"Chrome/109.0\", \"isMobile\": \"false\", \"is_guest\": \"false\", \"platform\": \"Macintosh\", \"isOAuthUser\": \"false\"}',0);
/*!40000 ALTER TABLE `Sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SharedChannelAttachments`
--

DROP TABLE IF EXISTS `SharedChannelAttachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SharedChannelAttachments` (
  `Id` varchar(26) NOT NULL,
  `FileId` varchar(26) DEFAULT NULL,
  `RemoteId` varchar(26) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `LastSyncAt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `FileId` (`FileId`,`RemoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SharedChannelAttachments`
--

LOCK TABLES `SharedChannelAttachments` WRITE;
/*!40000 ALTER TABLE `SharedChannelAttachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `SharedChannelAttachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SharedChannelRemotes`
--

DROP TABLE IF EXISTS `SharedChannelRemotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SharedChannelRemotes` (
  `Id` varchar(26) NOT NULL,
  `ChannelId` varchar(26) NOT NULL,
  `CreatorId` varchar(26) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `IsInviteAccepted` tinyint(1) DEFAULT NULL,
  `IsInviteConfirmed` tinyint(1) DEFAULT NULL,
  `RemoteId` varchar(26) DEFAULT NULL,
  `LastPostUpdateAt` bigint(20) DEFAULT NULL,
  `LastPostId` varchar(26) DEFAULT NULL,
  PRIMARY KEY (`Id`,`ChannelId`),
  UNIQUE KEY `ChannelId` (`ChannelId`,`RemoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SharedChannelRemotes`
--

LOCK TABLES `SharedChannelRemotes` WRITE;
/*!40000 ALTER TABLE `SharedChannelRemotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `SharedChannelRemotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SharedChannelUsers`
--

DROP TABLE IF EXISTS `SharedChannelUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SharedChannelUsers` (
  `Id` varchar(26) NOT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `RemoteId` varchar(26) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `LastSyncAt` bigint(20) DEFAULT NULL,
  `ChannelId` varchar(26) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserId` (`UserId`,`ChannelId`,`RemoteId`),
  KEY `idx_sharedchannelusers_remote_id` (`RemoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SharedChannelUsers`
--

LOCK TABLES `SharedChannelUsers` WRITE;
/*!40000 ALTER TABLE `SharedChannelUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `SharedChannelUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SharedChannels`
--

DROP TABLE IF EXISTS `SharedChannels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SharedChannels` (
  `ChannelId` varchar(26) NOT NULL,
  `TeamId` varchar(26) DEFAULT NULL,
  `Home` tinyint(1) DEFAULT NULL,
  `ReadOnly` tinyint(1) DEFAULT NULL,
  `ShareName` varchar(64) DEFAULT NULL,
  `ShareDisplayName` varchar(64) DEFAULT NULL,
  `SharePurpose` varchar(250) DEFAULT NULL,
  `ShareHeader` text,
  `CreatorId` varchar(26) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `RemoteId` varchar(26) DEFAULT NULL,
  PRIMARY KEY (`ChannelId`),
  UNIQUE KEY `ShareName` (`ShareName`,`TeamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SharedChannels`
--

LOCK TABLES `SharedChannels` WRITE;
/*!40000 ALTER TABLE `SharedChannels` DISABLE KEYS */;
/*!40000 ALTER TABLE `SharedChannels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SidebarCategories`
--

DROP TABLE IF EXISTS `SidebarCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SidebarCategories` (
  `Id` varchar(128) NOT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `TeamId` varchar(26) DEFAULT NULL,
  `SortOrder` bigint(20) DEFAULT NULL,
  `Sorting` varchar(64) DEFAULT NULL,
  `Type` varchar(64) DEFAULT NULL,
  `DisplayName` varchar(64) DEFAULT NULL,
  `Muted` tinyint(1) DEFAULT NULL,
  `Collapsed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_sidebarcategories_userid_teamid` (`UserId`,`TeamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SidebarCategories`
--

LOCK TABLES `SidebarCategories` WRITE;
/*!40000 ALTER TABLE `SidebarCategories` DISABLE KEYS */;
INSERT INTO `SidebarCategories` VALUES ('channels_1qzsypdm9t8hibuegnwymnyp3w_bomuda47qpf7pfbmacnioyhona','1qzsypdm9t8hibuegnwymnyp3w','bomuda47qpf7pfbmacnioyhona',10,'','channels','Channels',0,0),('channels_hruniqwds7gg5bcm5fmn931iih_bomuda47qpf7pfbmacnioyhona','hruniqwds7gg5bcm5fmn931iih','bomuda47qpf7pfbmacnioyhona',10,'','channels','Channels',0,0),('direct_messages_1qzsypdm9t8hibuegnwymnyp3w_bomuda47qpf7pfbmacnioyhona','1qzsypdm9t8hibuegnwymnyp3w','bomuda47qpf7pfbmacnioyhona',20,'recent','direct_messages','Direct Messages',0,0),('direct_messages_hruniqwds7gg5bcm5fmn931iih_bomuda47qpf7pfbmacnioyhona','hruniqwds7gg5bcm5fmn931iih','bomuda47qpf7pfbmacnioyhona',20,'recent','direct_messages','Direct Messages',0,0),('favorites_1qzsypdm9t8hibuegnwymnyp3w_bomuda47qpf7pfbmacnioyhona','1qzsypdm9t8hibuegnwymnyp3w','bomuda47qpf7pfbmacnioyhona',0,'','favorites','Favorites',0,0),('favorites_hruniqwds7gg5bcm5fmn931iih_bomuda47qpf7pfbmacnioyhona','hruniqwds7gg5bcm5fmn931iih','bomuda47qpf7pfbmacnioyhona',0,'','favorites','Favorites',0,0);
/*!40000 ALTER TABLE `SidebarCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SidebarChannels`
--

DROP TABLE IF EXISTS `SidebarChannels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SidebarChannels` (
  `ChannelId` varchar(26) NOT NULL,
  `UserId` varchar(26) NOT NULL,
  `CategoryId` varchar(128) NOT NULL,
  `SortOrder` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ChannelId`,`UserId`,`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SidebarChannels`
--

LOCK TABLES `SidebarChannels` WRITE;
/*!40000 ALTER TABLE `SidebarChannels` DISABLE KEYS */;
/*!40000 ALTER TABLE `SidebarChannels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Status` (
  `UserId` varchar(26) NOT NULL,
  `Status` varchar(32) DEFAULT NULL,
  `Manual` tinyint(1) DEFAULT NULL,
  `LastActivityAt` bigint(20) DEFAULT NULL,
  `DNDEndTime` bigint(20) DEFAULT NULL,
  `PrevStatus` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  KEY `idx_status_status_dndendtime` (`Status`,`DNDEndTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status`
--

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
INSERT INTO `Status` VALUES ('hruniqwds7gg5bcm5fmn931iih','offline',0,1675958176305,0,'');
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Systems`
--

DROP TABLE IF EXISTS `Systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Systems` (
  `Name` varchar(64) NOT NULL,
  `Value` text,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Systems`
--

LOCK TABLES `Systems` WRITE;
/*!40000 ALTER TABLE `Systems` DISABLE KEYS */;
INSERT INTO `Systems` VALUES ('about_subsection_permissions','true'),('add_billing_permissions','true'),('add_bot_permissions','true'),('add_convert_channel_permissions','true'),('add_manage_guests_permissions','true'),('add_system_console_permissions','true'),('add_system_roles_permissions','true'),('add_use_group_mentions_permission','true'),('AdvancedPermissionsMigrationComplete','true'),('apply_channel_manage_delete_to_channel_user','true'),('AsymmetricSigningKey','{\"ecdsa_key\":{\"curve\":\"P-256\",\"x\":6491607361894260638304625346112490865318320913988994840295135891313556559852,\"y\":35140977714684989922169538267333095101806115682779754949984452775448937417802,\"d\":25338366921782779628871008288054495260940072774376497168740254791771001781463}}'),('authentication_subsection_permissions','true'),('channel_moderations_permissions','true'),('compliance_subsection_permissions','true'),('ContentExtractionConfigDefaultTrueMigrationComplete','true'),('CRTChannelMembershipCountsMigrationComplete','true'),('CRTThreadCountsAndUnreadsMigrationComplete','true'),('CustomGroupAdminRoleCreationMigrationComplete','true'),('custom_groups_permissions','true'),('DiagnosticId','kgzc81atibgpxd3ndmscr36epy'),('download_compliance_export_results','true'),('EmojisPermissionsMigrationComplete','true'),('emoji_permissions_split','true'),('environment_subsection_permissions','true'),('experimental_subsection_permissions','true'),('FirstServerRunTimestamp','1675957116461'),('GuestRolesCreationMigrationComplete','true'),('InstallationDate','1675957118969'),('integrations_subsection_permissions','true'),('LastSecurityTime','1675957116463'),('list_join_public_private_teams','true'),('manage_secure_connections_permissions','true'),('manage_shared_channel_permissions','true'),('migration_advanced_permissions_phase_2','true'),('PlaybookRolesCreationMigrationComplete','true'),('playbooks_manage_roles','true'),('playbooks_permissions','true'),('PostActionCookieSecret','{\"key\":\"RpG36+9A34D3rf/ilWKp2ot/eXILMpR+diXwNOVQtR8=\"}'),('products_boards','true'),('RemainingSchemaMigrations','true'),('remove_channel_manage_delete_from_team_user','true'),('remove_permanent_delete_user','true'),('reporting_subsection_permissions','true'),('site_subsection_permissions','true'),('SystemConsoleRolesCreationMigrationComplete','true'),('test_email_ancillary_permission','true'),('view_members_new_permission','true'),('webhook_permissions_split','true');
/*!40000 ALTER TABLE `Systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TeamMembers`
--

DROP TABLE IF EXISTS `TeamMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TeamMembers` (
  `TeamId` varchar(26) NOT NULL,
  `UserId` varchar(26) NOT NULL,
  `Roles` text,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `SchemeUser` tinyint(4) DEFAULT NULL,
  `SchemeAdmin` tinyint(4) DEFAULT NULL,
  `SchemeGuest` tinyint(4) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT '0',
  PRIMARY KEY (`TeamId`,`UserId`),
  KEY `idx_teammembers_user_id` (`UserId`),
  KEY `idx_teammembers_delete_at` (`DeleteAt`),
  KEY `idx_teammembers_createat` (`CreateAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TeamMembers`
--

LOCK TABLES `TeamMembers` WRITE;
/*!40000 ALTER TABLE `TeamMembers` DISABLE KEYS */;
INSERT INTO `TeamMembers` VALUES ('bomuda47qpf7pfbmacnioyhona','1qzsypdm9t8hibuegnwymnyp3w','',0,1,0,0,1675958169646),('bomuda47qpf7pfbmacnioyhona','hruniqwds7gg5bcm5fmn931iih','',0,1,1,0,1675957856655);
/*!40000 ALTER TABLE `TeamMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teams`
--

DROP TABLE IF EXISTS `Teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teams` (
  `Id` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `DisplayName` varchar(64) DEFAULT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Email` varchar(128) DEFAULT NULL,
  `Type` enum('I','O') DEFAULT NULL,
  `CompanyName` varchar(64) DEFAULT NULL,
  `AllowedDomains` text,
  `InviteId` varchar(32) DEFAULT NULL,
  `SchemeId` varchar(26) DEFAULT NULL,
  `AllowOpenInvite` tinyint(1) DEFAULT NULL,
  `LastTeamIconUpdate` bigint(20) DEFAULT NULL,
  `GroupConstrained` tinyint(1) DEFAULT NULL,
  `CloudLimitsArchived` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`),
  KEY `idx_teams_invite_id` (`InviteId`),
  KEY `idx_teams_update_at` (`UpdateAt`),
  KEY `idx_teams_create_at` (`CreateAt`),
  KEY `idx_teams_delete_at` (`DeleteAt`),
  KEY `idx_teams_scheme_id` (`SchemeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teams`
--

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;
INSERT INTO `Teams` VALUES ('bomuda47qpf7pfbmacnioyhona',1675957856643,1675958169578,0,'test','test','','cmempy-developer@eccenca.com','O','','','cjdfz4cs8bncbm1owd36m9g9mc',NULL,0,0,0,0);
/*!40000 ALTER TABLE `Teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TermsOfService`
--

DROP TABLE IF EXISTS `TermsOfService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TermsOfService` (
  `Id` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `Text` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TermsOfService`
--

LOCK TABLES `TermsOfService` WRITE;
/*!40000 ALTER TABLE `TermsOfService` DISABLE KEYS */;
/*!40000 ALTER TABLE `TermsOfService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThreadMemberships`
--

DROP TABLE IF EXISTS `ThreadMemberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ThreadMemberships` (
  `PostId` varchar(26) NOT NULL,
  `UserId` varchar(26) NOT NULL,
  `Following` tinyint(1) DEFAULT NULL,
  `LastViewed` bigint(20) DEFAULT NULL,
  `LastUpdated` bigint(20) DEFAULT NULL,
  `UnreadMentions` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PostId`,`UserId`),
  KEY `idx_thread_memberships_last_update_at` (`LastUpdated`),
  KEY `idx_thread_memberships_last_view_at` (`LastViewed`),
  KEY `idx_thread_memberships_user_id` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThreadMemberships`
--

LOCK TABLES `ThreadMemberships` WRITE;
/*!40000 ALTER TABLE `ThreadMemberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `ThreadMemberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Threads`
--

DROP TABLE IF EXISTS `Threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Threads` (
  `PostId` varchar(26) NOT NULL,
  `ReplyCount` bigint(20) DEFAULT NULL,
  `LastReplyAt` bigint(20) DEFAULT NULL,
  `Participants` json DEFAULT NULL,
  `ChannelId` varchar(26) DEFAULT NULL,
  `ThreadDeleteAt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PostId`),
  KEY `idx_threads_channel_id_last_reply_at` (`ChannelId`,`LastReplyAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Threads`
--

LOCK TABLES `Threads` WRITE;
/*!40000 ALTER TABLE `Threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `Threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tokens`
--

DROP TABLE IF EXISTS `Tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tokens` (
  `Token` varchar(64) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `Type` varchar(64) DEFAULT NULL,
  `Extra` text,
  PRIMARY KEY (`Token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tokens`
--

LOCK TABLES `Tokens` WRITE;
/*!40000 ALTER TABLE `Tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UploadSessions`
--

DROP TABLE IF EXISTS `UploadSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UploadSessions` (
  `Id` varchar(26) NOT NULL,
  `Type` enum('attachment','import') DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `ChannelId` varchar(26) DEFAULT NULL,
  `Filename` text,
  `Path` text,
  `FileSize` bigint(20) DEFAULT NULL,
  `FileOffset` bigint(20) DEFAULT NULL,
  `RemoteId` varchar(26) DEFAULT NULL,
  `ReqFileId` varchar(26) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_uploadsessions_user_id` (`UserId`),
  KEY `idx_uploadsessions_create_at` (`CreateAt`),
  KEY `idx_uploadsessions_type` (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UploadSessions`
--

LOCK TABLES `UploadSessions` WRITE;
/*!40000 ALTER TABLE `UploadSessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `UploadSessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserAccessTokens`
--

DROP TABLE IF EXISTS `UserAccessTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserAccessTokens` (
  `Id` varchar(26) NOT NULL,
  `Token` varchar(26) DEFAULT NULL,
  `UserId` varchar(26) DEFAULT NULL,
  `Description` text,
  `IsActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Token` (`Token`),
  KEY `idx_user_access_tokens_user_id` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserAccessTokens`
--

LOCK TABLES `UserAccessTokens` WRITE;
/*!40000 ALTER TABLE `UserAccessTokens` DISABLE KEYS */;
INSERT INTO `UserAccessTokens` VALUES ('7zgpes5qai8tinsyceeuwabm9r','ah85ckhk6ib6zqqjh7i7j16hra','1qzsypdm9t8hibuegnwymnyp3w','Default Token',1);
/*!40000 ALTER TABLE `UserAccessTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroups`
--

DROP TABLE IF EXISTS `UserGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserGroups` (
  `Id` varchar(26) NOT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `DisplayName` varchar(128) DEFAULT NULL,
  `Description` text,
  `Source` varchar(64) DEFAULT NULL,
  `RemoteId` varchar(48) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `AllowReference` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `Source` (`Source`,`RemoteId`),
  KEY `idx_usergroups_remote_id` (`RemoteId`),
  KEY `idx_usergroups_delete_at` (`DeleteAt`),
  KEY `idx_usergroups_displayname` (`DisplayName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroups`
--

LOCK TABLES `UserGroups` WRITE;
/*!40000 ALTER TABLE `UserGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserTermsOfService`
--

DROP TABLE IF EXISTS `UserTermsOfService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserTermsOfService` (
  `UserId` varchar(26) NOT NULL,
  `TermsOfServiceId` varchar(26) DEFAULT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserTermsOfService`
--

LOCK TABLES `UserTermsOfService` WRITE;
/*!40000 ALTER TABLE `UserTermsOfService` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserTermsOfService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `Id` varchar(26) NOT NULL,
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `Username` varchar(64) DEFAULT NULL,
  `Password` varchar(128) DEFAULT NULL,
  `AuthData` varchar(128) DEFAULT NULL,
  `AuthService` varchar(32) DEFAULT NULL,
  `Email` varchar(128) DEFAULT NULL,
  `EmailVerified` tinyint(1) DEFAULT NULL,
  `Nickname` varchar(64) DEFAULT NULL,
  `FirstName` varchar(64) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Roles` text,
  `AllowMarketing` tinyint(1) DEFAULT NULL,
  `Props` json DEFAULT NULL,
  `NotifyProps` json DEFAULT NULL,
  `LastPasswordUpdate` bigint(20) DEFAULT NULL,
  `LastPictureUpdate` bigint(20) DEFAULT NULL,
  `FailedAttempts` int(11) DEFAULT NULL,
  `Locale` varchar(5) DEFAULT NULL,
  `MfaActive` tinyint(1) DEFAULT NULL,
  `MfaSecret` varchar(128) DEFAULT NULL,
  `Position` varchar(128) DEFAULT NULL,
  `Timezone` json DEFAULT NULL,
  `RemoteId` varchar(26) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `AuthData` (`AuthData`),
  UNIQUE KEY `Email` (`Email`),
  KEY `idx_users_update_at` (`UpdateAt`),
  KEY `idx_users_create_at` (`CreateAt`),
  KEY `idx_users_delete_at` (`DeleteAt`),
  FULLTEXT KEY `idx_users_all_txt` (`Username`,`FirstName`,`LastName`,`Nickname`,`Email`),
  FULLTEXT KEY `idx_users_all_no_full_name_txt` (`Username`,`Nickname`,`Email`),
  FULLTEXT KEY `idx_users_names_txt` (`Username`,`FirstName`,`LastName`,`Nickname`),
  FULLTEXT KEY `idx_users_names_no_full_name_txt` (`Username`,`Nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('1qzsypdm9t8hibuegnwymnyp3w',1675958089066,1675958169652,0,'plugin-test','',NULL,'','plugin-test@localhost',0,'','plugin-test-bot','','system_user system_admin',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675958089066,0,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL),('5oc8fyy1c7ybzgrja71zhutmja',1675957119197,1675957119246,0,'appsbot','',NULL,'','appsbot@localhost',0,'','Mattermost Apps','','system_user',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675957119197,1675957119246,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL),('6oa8wwzrytnr3q6w4hjoyhboha',1675957118969,1675957119001,0,'feedbackbot','',NULL,'','feedbackbot@localhost',0,'','Feedbackbot','','system_user',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675957118969,1675957119001,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL),('7ffqea1am3nbxnekkn5fga4ppr',1675957119518,1675957119535,0,'playbooks','',NULL,'','playbooks@localhost',0,'','Playbooks','','system_user',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675957119518,1675957119535,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL),('gthntg6dgpdkbnzkp39muoidhw',1675957121213,1675957121213,0,'boards','',NULL,'','boards@localhost',0,'','Boards','','system_user',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675957121213,0,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL),('hruniqwds7gg5bcm5fmn931iih',1675957798412,1675957856661,0,'cmempy-developer','$2a$10$/MIuvwHgkL6p5nYGkNZ.oO3hKxdJ7ZGm0BkYLGCOCN7ifvdQC0u6q',NULL,'','cmempy-developer@eccenca.com',0,'','','','system_admin system_user',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675957798412,0,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL),('ju6tyhjggtbifcgfyz3k5job7c',1675957799567,1675957799567,0,'system-bot','',NULL,'','system-bot@localhost',0,'','System','','system_user',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675957799567,0,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_lock`
--

DROP TABLE IF EXISTS `db_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_lock` (
  `Id` varchar(64) NOT NULL,
  `ExpireAt` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_lock`
--

LOCK TABLES `db_lock` WRITE;
/*!40000 ALTER TABLE `db_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_migrations`
--

DROP TABLE IF EXISTS `db_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_migrations` (
  `Version` bigint(20) NOT NULL,
  `Name` varchar(64) NOT NULL,
  PRIMARY KEY (`Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_migrations`
--

LOCK TABLES `db_migrations` WRITE;
/*!40000 ALTER TABLE `db_migrations` DISABLE KEYS */;
INSERT INTO `db_migrations` VALUES (1,'create_teams'),(2,'create_team_members'),(3,'create_cluster_discovery'),(4,'create_command_webhooks'),(5,'create_compliances'),(6,'create_emojis'),(7,'create_user_groups'),(8,'create_group_members'),(9,'create_group_teams'),(10,'create_group_channels'),(11,'create_link_metadata'),(12,'create_commands'),(13,'create_incoming_webhooks'),(14,'create_outgoing_webhooks'),(15,'create_systems'),(16,'create_reactions'),(17,'create_roles'),(18,'create_schemes'),(19,'create_licenses'),(20,'create_posts'),(21,'create_product_notice_view_state'),(22,'create_sessions'),(23,'create_terms_of_service'),(24,'create_audits'),(25,'create_oauth_access_data'),(26,'create_preferences'),(27,'create_status'),(28,'create_tokens'),(29,'create_bots'),(30,'create_user_access_tokens'),(31,'create_remote_clusters'),(32,'create_sharedchannels'),(33,'create_sidebar_channels'),(34,'create_oauthauthdata'),(35,'create_sharedchannelattachments'),(36,'create_sharedchannelusers'),(37,'create_sharedchannelremotes'),(38,'create_jobs'),(39,'create_channel_member_history'),(40,'create_sidebar_categories'),(41,'create_upload_sessions'),(42,'create_threads'),(43,'thread_memberships'),(44,'create_user_terms_of_service'),(45,'create_plugin_key_value_store'),(46,'create_users'),(47,'create_file_info'),(48,'create_oauth_apps'),(49,'create_channels'),(50,'create_channelmembers'),(51,'create_msg_root_count'),(52,'create_public_channels'),(53,'create_retention_policies'),(54,'create_crt_channelmembership_count'),(55,'create_crt_thread_count_and_unreads'),(56,'upgrade_channels_v6.0'),(57,'upgrade_command_webhooks_v6.0'),(58,'upgrade_channelmembers_v6.0'),(59,'upgrade_users_v6.0'),(60,'upgrade_jobs_v6.0'),(61,'upgrade_link_metadata_v6.0'),(62,'upgrade_sessions_v6.0'),(63,'upgrade_threads_v6.0'),(64,'upgrade_status_v6.0'),(65,'upgrade_groupchannels_v6.0'),(66,'upgrade_posts_v6.0'),(67,'upgrade_channelmembers_v6.1'),(68,'upgrade_teammembers_v6.1'),(69,'upgrade_jobs_v6.1'),(70,'upgrade_cte_v6.1'),(71,'upgrade_sessions_v6.1'),(72,'upgrade_schemes_v6.3'),(73,'upgrade_plugin_key_value_store_v6.3'),(74,'upgrade_users_v6.3'),(75,'alter_upload_sessions_index'),(76,'upgrade_lastrootpostat'),(77,'upgrade_users_v6.5'),(78,'create_oauth_mattermost_app_id'),(79,'usergroups_displayname_index'),(80,'posts_createat_id'),(81,'threads_deleteat'),(82,'upgrade_oauth_mattermost_app_id'),(83,'threads_threaddeleteat'),(84,'recent_searches'),(85,'fileinfo_add_archived_column'),(86,'add_cloud_limits_archived'),(87,'sidebar_categories_index'),(88,'remaining_migrations'),(89,'add-channelid-to-reaction'),(90,'create_enums'),(91,'create_post_reminder'),(92,'add_createat_to_teammembers'),(93,'notify_admin'),(95,'remove_posts_parentid');
/*!40000 ALTER TABLE `db_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_blocks`
--

DROP TABLE IF EXISTS `focalboard_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_blocks` (
  `id` varchar(36) NOT NULL,
  `insert_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `parent_id` varchar(36) DEFAULT NULL,
  `schema` bigint(20) DEFAULT NULL,
  `type` text,
  `title` text,
  `fields` text,
  `create_at` bigint(20) DEFAULT NULL,
  `update_at` bigint(20) DEFAULT NULL,
  `delete_at` bigint(20) DEFAULT NULL,
  `root_id` varchar(36) DEFAULT NULL,
  `modified_by` varchar(36) NOT NULL,
  `channel_id` varchar(36) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `board_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_blocks_board_id_parent_id` (`board_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_blocks`
--

LOCK TABLES `focalboard_blocks` WRITE;
/*!40000 ALTER TABLE `focalboard_blocks` DISABLE KEYS */;
INSERT INTO `focalboard_blocks` VALUES ('716dwrk9k1byr9mfs5ym8swr1tr','2023-02-09 15:38:47.504647','cbmrscrph3tymfkbr9dba5asgnr',1,'image','','{\"fileId\":\"74nt9eqzea3ydjjpgjtsxcjgrxc.gif\"}',1675957127503,1675957127503,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('71ddc8fzu9p8x8f8xucmjqcddye','2023-02-09 15:38:42.174935','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Post-sales follow up','{}',1675957122173,1675957122173,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('71xatgq9j1pr4tdo7meq6r56ypo','2023-02-09 15:38:41.554991','cbfwysn4hytfzjrkrz4rwsxoypy',1,'divider','','{}',1675957121553,1675957121553,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7353agjgjnbgqie6xoaafn1ufqa','2023-02-09 15:38:42.200334','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Send initial email','{\"value\":true}',1675957122198,1675957122198,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7355dznz4gbynipfj7hw7xgtf6h','2023-02-09 15:38:41.548006','cbfwysn4hytfzjrkrz4rwsxoypy',1,'checkbox','','{\"value\":false}',1675957121546,1675957121546,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('73dk9foche3rn7gq6shxi81dcoy','2023-02-09 15:38:47.355068','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','@mention teammates so they can follow, and collaborate on, comments and descriptions','{\"value\":false}',1675957127353,1675957127353,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('73eh34rr4m7biibwb73k4fmeg5o','2023-02-09 15:38:42.265860','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Schedule demo','{\"value\":true}',1675957122264,1675957122264,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('73htx759e1jbbzdzyze6j6psjxy','2023-02-09 15:38:42.117717','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Send proposal','{\"value\":true}',1675957122116,1675957122116,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('73qroj7qdtpb49jcqoicjw65y9r','2023-02-09 15:38:44.153737','crydizwwgwfrtjemgykge11ifmy',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957124152,1675957124152,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('73xmo3qsoy3yauju46fh69udcar','2023-02-09 15:38:47.361082','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Manage deadlines and milestones','{\"value\":false}',1675957127359,1675957127359,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('73xt4fmtc3jgc9y3he5xzwpiefa','2023-02-09 15:38:46.320945','csdmaxaygtbbdpecywm73rureor',1,'image','','{\"fileId\":\"7y5kr8x8ybpnwdykjfuz57rggrh.png\"}',1675957126319,1675957126319,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('74dnu3h6j87yzfxcj958sjiuhsc','2023-02-09 15:38:41.419021','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675957121417,1675957121417,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('74kak7ugwwtgg7jc8a8du3wpqow','2023-02-09 15:38:42.553703','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Post-sales follow up','{}',1675957122552,1675957122552,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('74qzhfq1hbp8z7qawbiepbzcawr','2023-02-09 15:38:42.743549','c49nb54ueeprz589qo735319hqo',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675957122742,1675957122742,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('74rnrembncbdjfgkzss1tjm846o','2023-02-09 15:38:44.113106','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'divider','','{}',1675957124111,1675957124111,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('74w314tfrffy78jyjzan1637yoe','2023-02-09 15:38:45.411093','cb5rd3k6997nezrcdak599yur7e',1,'image','','{\"fileId\":\"7tmfu5iqju3n1mdfwi5gru89qmw.png\"}',1675957125409,1675957125409,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('75tjroxsot3r5mpyasrccd1tnqw','2023-02-09 15:38:42.316657','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Send initial email','{\"value\":true}',1675957122315,1675957122315,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('765539ahrb7fqf8upba1zj1waqr','2023-02-09 15:38:42.664221','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675957122662,1675957122662,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('76616kunmejdu5qosasw9wmo4ee','2023-02-09 15:38:44.161323','crydizwwgwfrtjemgykge11ifmy',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124159,1675957124159,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('767hrhq4irtf9unxnh1mozpdp7y','2023-02-09 15:38:41.491944','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'checkbox','','{\"value\":false}',1675957121490,1675957121490,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('76fxqzgf6oby4xe3xzdezhdjasr','2023-02-09 15:38:43.605362','cnqf1zimzjbbjpjxpf31ciaotgc',1,'checkbox','Internet','{\"value\":true}',1675957123604,1675957123604,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('76g3iyjhxdpymuygf4gsf9j79pa','2023-02-09 15:38:42.370771','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Schedule demo','{\"value\":true}',1675957122369,1675957122369,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('76jpxhzk7u3rziessrp4pf6oocy','2023-02-09 15:38:42.641900','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675957122640,1675957122640,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('76k47w8b1i784tf9j9o99uh4yyr','2023-02-09 15:38:42.537807','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Send proposal','{}',1675957122536,1675957122536,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('76n3qjd33gigb7rm6b5nq8qjpba','2023-02-09 15:38:42.471335','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Send follow-up email','{\"value\":true}',1675957122470,1675957122470,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('76prpfjt7ktfrixguqmfr9ttnhc','2023-02-09 15:38:46.870788','cjd9omd3z8tgh3yc8g94zqiukrr',1,'image','','{\"fileId\":\"7pbp4qg415pbstc6enzeicnu3qh.png\"}',1675957126869,1675957126869,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('76uruixptajffzndrfqfznqqixr','2023-02-09 15:38:41.482768','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'divider','','{}',1675957121480,1675957121480,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('76z73gkejojr3xjruhnezkiauoy','2023-02-09 15:38:41.613490','cnuqebsb6ubgmmpbpsuun5rs11o',1,'checkbox','','{\"value\":false}',1675957121610,1675957121610,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('773ffxtiimbretrcmdd4m9cu98y','2023-02-09 15:38:41.449960','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675957121448,1675957121448,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('77fc5jnmscpfd7xoyerwysfboeo','2023-02-09 15:38:43.623085','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Bread','{\"value\":false}',1675957123622,1675957123622,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('77p1rh34rxb8etcpzs495tpp3qy','2023-02-09 15:38:47.477483','cgscdkccnbfgzbeptndqxomibhc',1,'image','','{\"fileId\":\"78jws5m1myf8pufewzkaa6i11sc.gif\"}',1675957127476,1675957127476,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('77swm19jjybfrddzyyx3uq9fdrr','2023-02-09 15:38:42.728665','c49nb54ueeprz589qo735319hqo',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675957122727,1675957122727,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('77xcztkfy1iy43fhet3q8wgf6dr','2023-02-09 15:38:43.639678','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Eggs','{\"value\":false}',1675957123638,1675957123638,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('77xoe4cfio3bzm84rwi6c487fxr','2023-02-09 15:38:42.464239','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675957122462,1675957122462,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('787juff6143nmppbjgr3qqiyz3c','2023-02-09 15:38:42.352556','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675957122350,1675957122350,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('787mcbtsteideuro4yme46gugze','2023-02-09 15:38:42.108562','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Send follow-up email','{\"value\":true}',1675957122107,1675957122107,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('78iy7q6b8r7r79b9f8f6yg67ore','2023-02-09 15:38:42.377998','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Hand-off to customer success','{\"value\":true}',1675957122376,1675957122376,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('78zqqipq9iifzdgxym93fzomq1c','2023-02-09 15:38:42.256370','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Post-sales follow up','{}',1675957122250,1675957122250,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('791sjce7anpbb8gx7gipzhw4kba','2023-02-09 15:38:42.126321','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Finalize contract','{}',1675957122124,1675957122124,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('794s61rfxcfbcuj1ed1c9dzgwhh','2023-02-09 15:38:42.456543','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Send initial email','{\"value\":true}',1675957122454,1675957122454,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('797aty5ck67b3mdqyhhnpip185h','2023-02-09 15:38:42.440609','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Follow up after demo','{}',1675957122439,1675957122439,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('79r9kss8uh7fx8x1doebumg6r6r','2023-02-09 15:38:42.342621','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Finalize contract','{\"value\":true}',1675957122341,1675957122341,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('79uda7c3u3fnt5czo8yzgwbmy3r','2023-02-09 15:38:42.334274','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Send proposal','{\"value\":true}',1675957122332,1675957122332,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7agfjix7uajrtmqb4m9zwa73mcc','2023-02-09 15:38:42.324672','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Send follow-up email','{\"value\":true}',1675957122323,1675957122323,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7azq9mxjretg65qmcguo9j5txjh','2023-02-09 15:38:47.314515','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Assign tasks to teammates','{\"value\":false}',1675957127312,1675957127312,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7b3uernjsz3g5uf8ui9rfhfcnto','2023-02-09 15:38:42.613114','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send initial email','{\"value\":false}',1675957122611,1675957122611,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7b5cy899pyigw5etbuknprr9u3e','2023-02-09 15:38:43.627045','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Milk','{\"value\":false}',1675957123625,1675957123625,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7b5swk943htypjmpaeipjmxhyka','2023-02-09 15:38:44.266303','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957124265,1675957124265,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7bmioqxgtuifux89c5xw3m1cb1w','2023-02-09 15:38:42.386729','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Post-sales follow up','{\"value\":true}',1675957122385,1675957122384,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7bx1dfx6dh7r6zndnmkj4x939ow','2023-02-09 15:38:41.361199','cao6e3zedf7fofqb3rqgypczpdy',1,'checkbox','','{\"value\":false}',1675957121358,1675957121358,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7c5y73xmnkjf5d84yg9n4bpkugo','2023-02-09 15:38:41.375823','cao6e3zedf7fofqb3rqgypczpdy',1,'checkbox','','{\"value\":false}',1675957121374,1675957121374,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7c9hhfm9yx7gzjkmj3weym49bqc','2023-02-09 15:38:44.217053','crnc89prmbtg98ms9i97rtm8x6o',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957124215,1675957124215,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7cab1f41eqfb6ip61p3wa31h5sa','2023-02-09 15:38:41.595277','cnuqebsb6ubgmmpbpsuun5rs11o',1,'divider','','{}',1675957121593,1675957121593,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7cmxsungmdin5fb6q4awj316axw','2023-02-09 15:38:44.168265','crydizwwgwfrtjemgykge11ifmy',1,'checkbox','...','{\"value\":false}',1675957124167,1675957124167,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7crjr47bh67bhzefirck7dcx4ke','2023-02-09 15:38:42.478283','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675957122476,1675957122476,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7cyatjjky87d7tbz5ni44mr5hhe','2023-02-09 15:38:42.242818','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Finalize contract','{}',1675957122241,1675957122241,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7cyd3zidtzpdpmnx8bemdbay6wy','2023-02-09 15:38:47.464360','ctatxjxc1c7nqxnstzewk5nzawh',1,'image','','{\"fileId\":\"7dybb6t8fj3nrdft7nerhuf784y.png\"}',1675957127463,1675957127463,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7dd4pazxmzbn4ijh487immy9tto','2023-02-09 15:38:42.167355','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675957122165,1675957122165,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7ddrofny3s7rc7xhujw5zg4cudh','2023-02-09 15:38:44.126960','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957124125,1675957124125,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7dganye7ax7rzin9f8cm3sdhtsy','2023-02-09 15:38:42.424464','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Send proposal','{}',1675957122422,1675957122422,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7dwg3qzc9epgx8yke5qsyq8c7py','2023-02-09 15:38:44.245517','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124244,1675957124244,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7e6834n16q7fupngwqx7t937aro','2023-02-09 15:38:44.209017','crnc89prmbtg98ms9i97rtm8x6o',1,'divider','','{}',1675957124207,1675957124207,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7eg55detouidh9rkezb83ibmg6o','2023-02-09 15:38:43.590436','cnqf1zimzjbbjpjxpf31ciaotgc',1,'checkbox','Utilities','{\"value\":true}',1675957123589,1675957123589,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7ernxp8enw3dy8jufuchq3kdjxh','2023-02-09 15:38:44.253117','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957124251,1675957124251,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7fnwzuaqyztfuic3cn49sc4cine','2023-02-09 15:38:47.491230','cmbff37bue7yrbg691t35b65c7r',1,'image','','{\"fileId\":\"7d6hrtig3zt8f9cnbo1um5oxx3y.gif\"}',1675957127489,1675957127489,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7frni9nmqujb79dn3cdf4zrcppy','2023-02-09 15:38:45.309406','cekput58kh3n4jf5cf9neytx4hc',1,'image','','{\"fileId\":\"7tmfu5iqju3n1mdfwi5gru89qmw.png\"}',1675957125307,1675957125307,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('7ftgmxj1ur3ydfqkgtie48cpfky','2023-02-09 15:38:42.511340','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Send initial email','{\"value\":false}',1675957122509,1675957122509,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7fxt891ntqtf98gkawcad1s1irc','2023-02-09 15:38:44.147910','crydizwwgwfrtjemgykge11ifmy',1,'divider','','{}',1675957124146,1675957124146,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7gczt6rkibbnguytsqeudbjafoc','2023-02-09 15:38:42.721194','c49nb54ueeprz589qo735319hqo',1,'checkbox','Finalize contract','{}',1675957122719,1675957122719,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7gkcjyzw3jtfspez7nusudm985w','2023-02-09 15:38:42.673734','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule demo','{\"value\":false}',1675957122672,1675957122672,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7gu9x9zr4jbgazq6pemig96qh3c','2023-02-09 15:38:42.159386','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Follow up after demo','{\"value\":true}',1675957122157,1675957122157,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7gzcf7gxw3innjqjm97zz8inuky','2023-02-09 15:38:44.075380','c1bmjmuj9d7dqbp6q683fbwhioo',1,'divider','','{}',1675957124073,1675957124073,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7h1scxz84h3bcdfrszhuti8es6r','2023-02-09 15:38:41.603497','cnuqebsb6ubgmmpbpsuun5rs11o',1,'checkbox','','{\"value\":false}',1675957121601,1675957121601,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7h3wrcjz5kfnhppkooho41tybnc','2023-02-09 15:38:41.500549','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'checkbox','','{\"value\":false}',1675957121498,1675957121498,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7h47gufr1ut8u7gw79xhioko83r','2023-02-09 15:38:42.568822','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Schedule demo','{\"value\":false}',1675957122567,1675957122567,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7h6gasqp4zjd5icoyphhae1hydr','2023-02-09 15:38:42.273777','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675957122272,1675957122272,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7h9x9r3kcgfbw9y6dmsiddbisca','2023-02-09 15:38:42.449216','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Schedule demo','{\"value\":true}',1675957122447,1675957122447,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7hc5arn1hwtb8bc7razzjauz3gr','2023-02-09 15:38:44.043330','c1bmjmuj9d7dqbp6q683fbwhioo',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957124041,1675957124041,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7hidha44ow7ns3e3731qd95k7aw','2023-02-09 15:38:43.653976','ctytybwsz4fybiyxo3hxu6skzpw',1,'image','','{\"fileId\":\"76fwrj36hptg6dywka4k5mt3sph.png\"}',1675957123652,1675957123652,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7hu5px3g37prcbpsxgtu1h8cazh','2023-02-09 15:38:42.697348','c49nb54ueeprz589qo735319hqo',1,'checkbox','Send proposal','{}',1675957122695,1675957122695,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7ie1ffsd3rjnt78hy7biwmq388a','2023-02-09 15:38:42.649618','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send proposal','{}',1675957122648,1675957122648,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7ifkkn1h9wj85up8kcqwbd6gqec','2023-02-09 15:38:47.439648','cdr1mhwde87n7zd64j74exwkchy',1,'image','','{\"fileId\":\"7ek6wbpp19jfoujs1goh6kttbby.gif\"}',1675957127438,1675957127438,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7igxh89mrdpryidtstp3rwnxhjo','2023-02-09 15:38:42.770881','c49nb54ueeprz589qo735319hqo',1,'checkbox','Send follow-up email','{\"value\":false}',1675957122769,1675957122769,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7ihw48cjrnbd1jgbeya43afmhfr','2023-02-09 15:38:42.225864','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Send proposal','{\"value\":true}',1675957122223,1675957122223,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7ij35dre9h38nux5k3kqefddhoo','2023-02-09 15:38:41.567613','cbfwysn4hytfzjrkrz4rwsxoypy',1,'checkbox','','{\"value\":false}',1675957121565,1675957121565,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7j4984i3j7jyg5pfdfp8o1ymzeh','2023-02-09 15:38:44.010288','cgmghb9uqnfyozy77qed7ctu8no',1,'checkbox','...','{\"value\":false}',1675957124008,1675957124008,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7jemzru7f1br4bbwm5k8bzfjkzy','2023-02-09 15:38:42.234504','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Hand-off to customer success','{}',1675957122232,1675957122232,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7jfofuyr1zpyx8yq9pjok6d77dc','2023-02-09 15:38:41.440028','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675957121436,1675957121436,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7jfqmks46utf8ixths7yehczj8w','2023-02-09 15:38:42.486188','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Finalize contract','{}',1675957122484,1675957122484,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7jno8da74x78zzj87pdoyckmy5y','2023-02-09 15:38:47.421405','cjtnba6s7f7gqdeedbh7wsi9wmy',1,'image','','{\"fileId\":\"7iw4rxx7jj7bypmdotd9z469cyh.png\"}',1675957127420,1675957127420,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7k7n85rq7rp8g78wtfh6s5ahhcc','2023-02-09 15:38:42.584095','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Follow up after demo','{}',1675957122582,1675957122582,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7kncbjtrbhbg99ci5kuxxhs9gko','2023-02-09 15:38:42.620165','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Post-sales follow up','{}',1675957122618,1675957122618,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7m1nb9juqij8stdt3fzton8i75y','2023-02-09 15:38:46.776374','cncdr6c56zpgh5xnxy1ws4syt8y',1,'image','','{\"fileId\":\"77pe9r4ckbin438ph3f18bpatua.png\"}',1675957126774,1675957126774,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('7m9iqg1tpr7grur8z6f7fye9nah','2023-02-09 15:38:42.216893','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Follow up after demo','{\"value\":true}',1675957122215,1675957122215,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7mcmz64jnejf98886sz1849qnsa','2023-02-09 15:38:42.704947','c49nb54ueeprz589qo735319hqo',1,'checkbox','Send initial email','{\"value\":true}',1675957122703,1675957122703,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7mgkwc7u9wpgq38c5hksj94dhzc','2023-02-09 15:38:43.598595','cnqf1zimzjbbjpjxpf31ciaotgc',1,'checkbox','Mobile phone','{\"value\":true}',1675957123597,1675957123597,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7mhbw7ea83jrd7bqp3meatdejnr','2023-02-09 15:38:42.546396','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Finalize contract','{}',1675957122544,1675957122544,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7mjsnjpr6tj81bkx4fjwdsgusuc','2023-02-09 15:38:47.398052','cxpohc37ix7yndjjyqj4d777cwr',1,'image','','{\"fileId\":\"7knxbyuiedtdafcgmropgkrtybr.gif\"}',1675957127396,1675957127396,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7mut8wzz3tty33e7bi7yj65oycr','2023-02-09 15:38:44.195546','crnc89prmbtg98ms9i97rtm8x6o',1,'checkbox','...','{\"value\":false}',1675957124194,1675957124194,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7mwz89dswkprpmq39xbfmszqena','2023-02-09 15:38:47.342033','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Set priorities and update statuses','{\"value\":false}',1675957127340,1675957127340,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7mzxwwfmp8jfozbqk6rmy4b843c','2023-02-09 15:38:43.612634','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Cereal','{\"value\":false}',1675957123610,1675957123610,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7n4effoi9m3b89rey9bc8ia4uth','2023-02-09 15:38:47.336028','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Follow cards to get notified on the latest updates','{\"value\":false}',1675957127334,1675957127334,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7nbe7oiagq7drupnp9sa66z6xac','2023-02-09 15:38:42.561122','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Send follow-up email','{\"value\":false}',1675957122559,1675957122559,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7nhpmb1utzbynmrdit3dgbtwq4a','2023-02-09 15:38:42.282774','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Send follow-up email','{\"value\":true}',1675957122281,1675957122281,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7njde1qge6tryjqfjh6a5p5qbkh','2023-02-09 15:38:42.142973','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Schedule demo','{\"value\":true}',1675957122141,1675957122141,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7nycetygujb8cdra17idsx8rczo','2023-02-09 15:38:42.433348','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Hand-off to customer success','{}',1675957122431,1675957122431,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7o4psoq571jfhbysze5ggqjpg1h','2023-02-09 15:38:44.051748','c1bmjmuj9d7dqbp6q683fbwhioo',1,'checkbox','...','{\"value\":false}',1675957124050,1675957124050,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7oapg5e5gx7ghtpxfwjf4ssbesr','2023-02-09 15:38:45.338105','csbgswatyspdiuknhxrfx4muwxa',1,'image','','{\"fileId\":\"7b9xk9boj3fbqfm3umeaaizp8qr.png\"}',1675957125336,1675957125336,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('7ofqzfmmnqjycxdba55jmm1bdba','2023-02-09 15:38:43.989162','cgmghb9uqnfyozy77qed7ctu8no',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957123987,1675957123987,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7ojrstcxjr3f1fy3859xz6jubuy','2023-02-09 15:38:42.754980','c49nb54ueeprz589qo735319hqo',1,'checkbox','Post-sales follow up','{}',1675957122752,1675957122752,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7op5gkqpjjfnj9fw6bpxq63po3h','2023-02-09 15:38:44.003457','cgmghb9uqnfyozy77qed7ctu8no',1,'divider','','{}',1675957124002,1675957124002,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7pfjkm3y31p8mur9183h3zrk3yy','2023-02-09 15:38:44.099736','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'checkbox','...','{\"value\":false}',1675957124098,1675957124098,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7pq3x1i5rpbf6xnsb9qwtgwtqqr','2023-02-09 15:38:41.508828','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'checkbox','','{\"value\":false}',1675957121506,1675957121506,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7pqq8ojniepfgfmb3uzxfns169y','2023-02-09 15:38:42.529798','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675957122527,1675957122527,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7qbxdt9fgdfytxf1ijn7z63tzde','2023-02-09 15:38:43.633970','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Bananas','{\"value\":false}',1675957123632,1675957123632,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7qiscat6oqfn4zpx4yikq73ijjw','2023-02-09 15:38:42.308129','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Follow up after demo','{\"value\":true}',1675957122306,1675957122306,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7qkcmsne68py3dcytmi4mtejbga','2023-02-09 15:38:44.120770','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124119,1675957124119,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7qkq6qoazhpytpqgeg8yugbny9y','2023-02-09 15:38:42.362258','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675957122360,1675957122360,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7rbjqxns9x3n15qgf648kkyfhjc','2023-02-09 15:38:44.068200','c1bmjmuj9d7dqbp6q683fbwhioo',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124066,1675957124066,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7rmf45fake7gjddw4oqcmcjnema','2023-02-09 15:38:44.017407','cgmghb9uqnfyozy77qed7ctu8no',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124016,1675957124016,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7rngcpz3aktnxmd94s39kenne9a','2023-02-09 15:38:44.202706','crnc89prmbtg98ms9i97rtm8x6o',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124201,1675957124201,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7rwou19t1s7gwuezy73xo3iiiga','2023-02-09 15:38:47.375785','cq4c7epp1ubbetm438oi5qmafba',1,'image','','{\"fileId\":\"74uia99m9btr8peydw7oexn37tw.gif\"}',1675957127374,1675957127374,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7s9bhmsu9rfd6xfxjgpxhzczzmr','2023-02-09 15:38:41.621674','cnuqebsb6ubgmmpbpsuun5rs11o',1,'checkbox','','{\"value\":false}',1675957121619,1675957121619,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7sdcsqkw5dpdidgkmbqryct4tay','2023-02-09 15:38:47.322378','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Create and manage checklists, like this one... :)','{\"value\":false}',1675957127321,1675957127321,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7seu89dxmdbg78xn6ffctf8qg7h','2023-02-09 15:38:41.538687','cbfwysn4hytfzjrkrz4rwsxoypy',1,'checkbox','','{\"value\":false}',1675957121536,1675957121536,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7skjpoeecabng7kd65f37qxnnpw','2023-02-09 15:38:42.736605','c49nb54ueeprz589qo735319hqo',1,'checkbox','Schedule demo','{\"value\":false}',1675957122735,1675957122735,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7so4cnboump8mi8je7j4q1nphqh','2023-02-09 15:38:42.763866','c49nb54ueeprz589qo735319hqo',1,'checkbox','Hand-off to customer success','{}',1675957122761,1675957122761,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7t1y9zzch3j8pxdpnbmkq5gnzsc','2023-02-09 15:38:42.100882','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Send initial email','{\"value\":true}',1675957122099,1675957122099,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7t5wwm6xj5fnf9q1kno9jabhejw','2023-02-09 15:38:42.656211','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Follow up after demo','{}',1675957122655,1675957122654,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7t7rzegarxfy3ieputjoxe9adiw','2023-02-09 15:38:43.996291','cgmghb9uqnfyozy77qed7ctu8no',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957123994,1675957123994,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7tdi3eqoyqi85ujjpgfoku41b7c','2023-02-09 15:38:43.618652','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Butter','{\"value\":false}',1675957123617,1675957123617,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7tk1dfukn5jyuzft8nex1yrdofa','2023-02-09 15:38:42.135294','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675957122134,1675957122133,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7tspi4obsx7nijn9r3bk4bwqkuc','2023-02-09 15:38:44.224579','crnc89prmbtg98ms9i97rtm8x6o',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957124223,1675957124223,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7u5tfs9wxgfb77yuzfhdsg68rbo','2023-02-09 15:38:42.416280','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Post-sales follow up','{}',1675957122414,1675957122414,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7uytuwjw3rjns7m8m7ozyocdsxr','2023-02-09 15:38:41.369297','cao6e3zedf7fofqb3rqgypczpdy',1,'divider','','{}',1675957121367,1675957121367,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7w5kznf6a8irrbg59modk68i46y','2023-02-09 15:38:47.348211','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Provide feedback and ask questions via comments','{\"value\":false}',1675957127347,1675957127347,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7wdrzh9tqh3r8iy7qq1m176nfxo','2023-02-09 15:38:42.627523','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Finalize contract','{}',1675957122626,1675957122626,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7wg4zd7fo1jghzektezx4bcwy5c','2023-02-09 15:38:46.817179','cfefgwjke6bbxpjpig618g9bpte',1,'image','','{\"fileId\":\"7pbp4qg415pbstc6enzeicnu3qh.png\"}',1675957126815,1675957126815,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('7wntwictxn3gwijsazxdymc6tte','2023-02-09 15:38:44.106174','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957124105,1675957124105,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7x4z8qu4e878nffrxq8arjrqtsy','2023-02-09 15:38:42.207811','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675957122206,1675957122206,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7x6x5u9dhgin6jcbqhq8oz93hry','2023-02-09 15:38:42.713338','c49nb54ueeprz589qo735319hqo',1,'checkbox','Follow up after demo','{}',1675957122711,1675957122711,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7xf6p9qyaabgpzchrekipcdqncc','2023-02-09 15:38:42.635084','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send follow-up email','{\"value\":false}',1675957122633,1675957122633,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7xur9msnw13dndjyu6efjsnsp1a','2023-02-09 15:38:42.520697','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675957122519,1675957122519,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7xyrzt79gc3f7mnoqxebiecmzer','2023-02-09 15:38:41.350406','cao6e3zedf7fofqb3rqgypczpdy',1,'checkbox','','{\"value\":false}',1675957121348,1675957121348,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7y8kizaqnqpyxijaax4mfti1d6w','2023-02-09 15:38:44.174293','crydizwwgwfrtjemgykge11ifmy',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957124173,1675957124173,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7yacd3twc3pfjtmf9bxuo1sioew','2023-02-09 15:38:44.259432','czw9es1e89fdpjr7cqptr1xq7qh',1,'divider','','{}',1675957124258,1675957124258,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7yhm1icoq47b3tya4zz169wyodr','2023-02-09 15:38:42.151642','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Hand-off to customer success','{}',1675957122150,1675957122150,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7yqwufwrgptgqmn6hdod41gc5ye','2023-02-09 15:38:44.271697','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','...','{\"value\":false}',1675957124270,1675957124270,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7yuzb4f73mpg58ganappiick8mw','2023-02-09 15:38:47.328870','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Add and update descriptions with Markdown','{\"value\":false}',1675957127327,1675957127327,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7z3gpn7qt6fgamjpe8oh6j4ssba','2023-02-09 15:38:42.576012','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Hand-off to customer success','{}',1675957122574,1675957122574,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7zcakwyykhiy6pcx81fhk77us7o','2023-02-09 15:38:41.409020','ch798q5ucefyobf5bymgqjt4f3h',1,'divider','','{}',1675957121407,1675957121407,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7zhda56n3wbg1zygyotrefcj1xy','2023-02-09 15:38:42.605739','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Hand-off to customer success','{}',1675957122604,1675957122604,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7zs5jxwg49tb47p4tcuc3hzjjde','2023-02-09 15:38:44.060071','c1bmjmuj9d7dqbp6q683fbwhioo',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957124058,1675957124058,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('a1cqo496pgircbr6kw3r79arrse','2023-02-09 15:38:46.842702','c8ykbwa643fy6tk5btqmbzteiyh',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957126841,1675957126841,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('a1ojs13y56fnpuykuhh4q7ddpue','2023-02-09 15:38:42.494221','cuow7xsfr6jdzzpsz9q541d4sth',1,'text','## Checklist','{}',1675957122492,1675957122492,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('a1ynhznfjwiyctj35curz6757ah','2023-02-09 15:38:45.829555','cdyoz55rinbbm8y3u3zsqybxzsw',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675957125827,1675957125827,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('a34iyxqpgyigupm63iwjysydrqh','2023-02-09 15:38:41.630649','cnuqebsb6ubgmmpbpsuun5rs11o',1,'text','## Action Items','{}',1675957121628,1675957121628,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('a36i7x65b4ibs5etq8y5p7t9bwh','2023-02-09 15:38:46.791933','cncdr6c56zpgh5xnxy1ws4syt8y',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957126790,1675957126790,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('a3fgn3k3o1ff1mprakwekabmwkr','2023-02-09 15:38:44.232462','crnc89prmbtg98ms9i97rtm8x6o',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124231,1675957124231,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('a3hs8k9dhefnzjkoq1dy818r7dy','2023-02-09 15:38:47.511273','cbmrscrph3tymfkbr9dba5asgnr',1,'text','To mention a teammate use the **@ symbol with their username** in the comments or description section. They\'ll get a Direct Message notification via Channels and also be added as a [follower](https://docs.mattermost.com/boards/work-with-cards.html#receive-updates) to the card. \n\nWhenever any changes are made to the card, they\'ll automatically get notified on Channels.','{}',1675957127509,1675957127509,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('a3pcou8zsoigemmjcx8t5cnd3xa','2023-02-09 15:38:46.883030','cjd9omd3z8tgh3yc8g94zqiukrr',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957126881,1675957126881,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('a3rwrf9qi6tgetmp4m6m6bhy5rc','2023-02-09 15:38:45.855834','c4rgdu3x54tfcpy1z4wsatq7a7o',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675957125854,1675957125854,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('a4g3xkek31iygzr4xomnah9yf7y','2023-02-09 15:38:44.091521','c1bmjmuj9d7dqbp6q683fbwhioo',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124090,1675957124090,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('a4iau9riytb8hxgrrkid8f6xnac','2023-02-09 15:38:43.667023','ctytybwsz4fybiyxo3hxu6skzpw',1,'text','## Route','{}',1675957123665,1675957123665,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('a4tsbhyharffzzdcwyysgnnefrr','2023-02-09 15:38:44.134679','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124133,1675957124133,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('a4ugxsy1qfprc8nugxusiofemxe','2023-02-09 15:38:46.876527','cjd9omd3z8tgh3yc8g94zqiukrr',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957126875,1675957126875,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('a57zw9q969fgmtpd4kmkfzzitbh','2023-02-09 15:38:42.688664','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'text','## Notes\n[Enter notes here...]','{}',1675957122687,1675957122687,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('a5ii1xhdwj7g9iq77pibrxwssqa','2023-02-09 15:38:42.502777','cuow7xsfr6jdzzpsz9q541d4sth',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675957122500,1675957122500,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('a5kdt8sgcwf85ig5izbof7d74xh','2023-02-09 15:38:41.528021','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675957121524,1675957121524,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('a5makwszxp3gmin4b76mj7txmro','2023-02-09 15:38:45.863276','cmkaj68y4efrg9qa1wfxnpmg1sr',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675957125861,1675957125861,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('a5wia4hjzwfry7rqiyu9php8fhr','2023-02-09 15:38:45.838199','cdiyyn5idt7gg3rg5eqazep1nye',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675957125836,1675957125836,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('a5wjnpyt86fgx7fx3r1snh1eiww','2023-02-09 15:38:42.681991','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'text','## Checklist','{}',1675957122680,1675957122680,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('a6gjbdp8ud3nqpr9k3ao9ik4uoy','2023-02-09 15:38:43.660011','ctytybwsz4fybiyxo3hxu6skzpw',1,'text','## Goal\nWalk at least 10,000 steps every day.','{}',1675957123658,1675957123658,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('a6qbdm88dqpgmbp6i3s7epcr41a','2023-02-09 15:38:46.329532','csdmaxaygtbbdpecywm73rureor',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126327,1675957126327,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('a6rzpwykmyj8azgwfhhxdogmn7e','2023-02-09 15:38:47.307105','crk5mmf4zgtyix8khnfwsoje4ca',1,'text','Mattermost Boards makes it easy for you to update certain properties on cards through our drag and drop functionality. Simply drag this card from the **Later** column to the **Completed** column to automatically update the status and mark this task as complete.','{}',1675957127305,1675957127305,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('a6z8tfcfjijg5mj7rwgk7ko1bro','2023-02-09 15:38:46.851033','cidz4imnqhir48brz6e8hxhfrhy',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957126849,1675957126849,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('a7ed4q13ow3gj8ybikfwche9jda','2023-02-09 15:38:47.451989','cdr1mhwde87n7zd64j74exwkchy',1,'text','To share a card, you\'ll need to copy the card link first. You can:\n\n- Open a card and select the options menu button at the top right of the card.\n- Open the board view and hover your mouse over any card to access the options menu button.','{}',1675957127450,1675957127450,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('a9hijoe8xofrqie9r9uy1t8kp8o','2023-02-09 15:38:44.027326','cgmghb9uqnfyozy77qed7ctu8no',1,'text','## Checklist','{}',1675957124025,1675957124025,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('a9s6urkircigeurptty6sa6pege','2023-02-09 15:38:43.647285','cygpgny1h9td5ufxg45tbq88ujy',1,'text','## Grocery list','{}',1675957123645,1675957123645,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('aa4zg6ack43dgmqenna4jftqyxc','2023-02-09 15:38:45.848211','cax7uqt4jfbb8ue7j34yu1mpz1w',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675957125845,1675957125845,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('aagi9urk1cir17mbbmwahuf6ype','2023-02-09 15:38:46.073149','c4amsnwiypifnxdg7fduunean3e',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675957126071,1675957126071,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('ab9k4rceobjrwudtqkynz66zfpy','2023-02-09 15:38:47.458339','cdr1mhwde87n7zd64j74exwkchy',1,'text','Cards can be linked and shared with teammates directly on Channels. Card previews are displayed when shared on Channels, so your team can discuss work items and get the relevant context without having to switch over to Boards.','{}',1675957127457,1675957127457,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('abd3r8d6a1jf5xmwrhwowo77ssr','2023-02-09 15:38:47.518477','cbmrscrph3tymfkbr9dba5asgnr',1,'text','Collaborate with teammates directly on each card using @mentions and have all the relevant context in one place.','{}',1675957127517,1675957127517,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('abjhxhte5o3ru7m3earfrax3h1c','2023-02-09 15:38:46.082285','cc7oak87qyirgzdc8zdsz8qh1sh',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675957126079,1675957126079,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('abkhji1dcxbnf5py5hh89yn1aqc','2023-02-09 15:38:43.673381','c3f1ep3c97pfkzcijzknob4ukpe',1,'text','','{}',1675957123671,1675957123671,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('abr8coy5jpjr78khwn9ipuog8oa','2023-02-09 15:38:42.300545','c7sed4gkoe3bxif9ewg1yq36r8w',1,'text','## Checklist','{}',1675957122298,1675957122298,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('abs5kzwpo3tbejb4jytr59oqjoy','2023-02-09 15:38:41.517771','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'text','## Action Items','{}',1675957121516,1675957121516,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('ac3py631whbg1bqdpjo5ifgt9uy','2023-02-09 15:38:46.364584','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126362,1675957126362,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('acwunc6z56trsufy6oos4ss9ssr','2023-02-09 15:38:45.383486','cfmk7771httynm8r7rm8cbrmrya',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957125381,1675957125381,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('adudjr3mgwbyqmb1n818f1k8d8r','2023-02-09 15:38:44.181951','crydizwwgwfrtjemgykge11ifmy',1,'text','## Checklist','{}',1675957124180,1675957124180,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('ae18goftntprhxdnj6rqruid5de','2023-02-09 15:38:41.586720','cbfwysn4hytfzjrkrz4rwsxoypy',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675957121585,1675957121585,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('ae9fbaq8pebdbbfmkhcrqq84nph','2023-02-09 15:38:45.374840','cdwyteuoeajf6dnjozotzgrtoco',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957125373,1675957125373,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('aedojoppjspramkzqucy4wb3cyc','2023-02-09 15:38:45.453264','cyrh1tksy5bdsdgwejsf3uyrm8y',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957125451,1675957125451,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('aegx8f1meuj8sff8fh7hai7ke4c','2023-02-09 15:38:46.311957','chikrbt1ocfgafjh8q8p6u83yth',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126310,1675957126310,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('aewxhyi5iktgwtn13y5t7np8boc','2023-02-09 15:38:46.888578','cwrq9ag3p5pgzzy98nfd3wwra1w',1,'text','## Summary\n*[Brief description of what this epic is about]*\n## Motivation\n*[Brief description on why this is needed]*\n## Acceptance Criteria\n- *[Criteron 1]*\n- *[Criteron 2]*\n- ...\n## Personas\n- *[Persona A]*\n- *[Persona B]*\n- ...\n## Reference Materials\n- *[Links to other relevant documents as needed]*\n- ...','{}',1675957126887,1675957126887,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('af4hte1z7wjdjtqhjp9w9bsx3nc','2023-02-09 15:38:42.779567','c49nb54ueeprz589qo735319hqo',1,'text','## Checklist','{}',1675957122777,1675957122777,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('afgaieg68zby5iyry16mn4zbymc','2023-02-09 15:38:45.367209','csbgswatyspdiuknhxrfx4muwxa',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957125365,1675957125365,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('aft57dqjwy3d4xgjn3ooqmxqmro','2023-02-09 15:38:45.461325','c3yzqoxmrgtfiu81usdcufmtusc',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957125459,1675957125459,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('afudzuo8kqbyobp5ppjziicaqxy','2023-02-09 15:38:45.436511','cafmdcqpeupyd3rhzyigdz3mcmh',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957125435,1675957125435,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('agbyoid6xz7f7jr593hdw8stbdh','2023-02-09 15:38:46.338893','csdmaxaygtbbdpecywm73rureor',1,'text','## Media','{}',1675957126337,1675957126337,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('ah4dw5eqfcpdjuqgfayojg9s5xy','2023-02-09 15:38:45.419934','cb5rd3k6997nezrcdak599yur7e',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957125418,1675957125418,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ahd5gizdxw7rexyucrx4qsuhfgc','2023-02-09 15:38:41.638813','cnuqebsb6ubgmmpbpsuun5rs11o',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675957121636,1675957121636,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('ai4nfzfhucjnx5ktyecpp15946a','2023-02-09 15:38:46.895476','cwrq9ag3p5pgzzy98nfd3wwra1w',1,'text','## Summary\n[Brief description of what this epic is about]\n\n## Motivation\n[Brief description on why this is needed]\n\n## Acceptance Criteria\n - [Criteron 1]\n - [Criteron 2]\n - ...\n\n## Personas\n - [Persona A]\n - [Persona B]\n - ...\n\n## Reference Materials\n - [Links to other relevant documents as needed]\n - ...','{}',1675957126894,1675957126894,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('aieqknjamabd5b8jf6kcknjn1ae','2023-02-09 15:38:46.829491','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\nA clear and concise description of what you expected to happen.\n\n## Edition and Platform\n\n - Edition: Personal Desktop / Personal Server / Mattermost plugin\n - Version: [e.g. v0.9.0]\n - Browser and OS: [e.g. Chrome 91 on macOS, Edge 93 on Windows]\n\n## Additional context\n\nAdd any other context about the problem here.','{}',1675957126828,1675957126828,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('aj3jx4wyogpfkpjybzgdwxjakdy','2023-02-09 15:38:44.188663','crydizwwgwfrtjemgykge11ifmy',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124187,1675957124187,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('ajekopxcqcig9tqgrtepgfx6cjh','2023-02-09 15:38:45.403166','cbupk1g7hifncimcqp195orzqxo',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675957125400,1675957125400,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ajfzxqte7cfnejqt6w8u1yhefce','2023-02-09 15:38:45.427830','cb5rd3k6997nezrcdak599yur7e',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957125426,1675957125426,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ajrm94fczmfdiugdck7cz8g7dhw','2023-02-09 15:38:46.802220','cp6ireo8debnc7q9jpfbeu5gwth',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957126800,1675957126800,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('ajrwye5cxojrw7euzh9psmpnewe','2023-02-09 15:38:46.098946','ciqogkfndsp8gdn6jou7ctmadoh',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675957126096,1675957126096,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('ajxy8i7sbfjdbbbcqgu5u36wjbo','2023-02-09 15:38:41.461624','ch798q5ucefyobf5bymgqjt4f3h',1,'text','# Action Items','{}',1675957121458,1675957121457,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('ajzrs8mpz4pd5fpr7t794pc139w','2023-02-09 15:38:42.590987','cc4opygf357gg3gxwhrtg59r99y',1,'text','## Notes\n[Enter notes here...]','{}',1675957122589,1675957122589,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('ak5p6j9onjt8gme4ges8d9suqao','2023-02-09 15:38:42.598976','cc4opygf357gg3gxwhrtg59r99y',1,'text','## Checklist','{}',1675957122597,1675957122597,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('akyg4q9i53ifnjji1ren9rm1yro','2023-02-09 15:38:47.445235','cdr1mhwde87n7zd64j74exwkchy',1,'text','After you\'ve copied the link, paste it into any channel or Direct Message to share the card. A preview of the card will display within the channel with a link back to the card on Boards.','{}',1675957127444,1675957127444,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('akyjyou7e5by47kfxfs4c5eh57c','2023-02-09 15:38:46.349429','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126347,1675957126347,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('amgcmwxa7pfdw5mpwjxowcnzote','2023-02-09 15:38:42.788877','c49nb54ueeprz589qo735319hqo',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675957122787,1675957122787,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('anutui7cr5tb33r6iu3ybr4ep6o','2023-02-09 15:38:41.400572','cao6e3zedf7fofqb3rqgypczpdy',1,'text','## Action Items','{}',1675957121398,1675957121398,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('anxnwy5irztyuzfqaeyyosy5drr','2023-02-09 15:38:42.192136','ceq73enymxtfhzemaau1k75c3ko',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675957122190,1675957122190,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('aopyofuea9byh9q1ac6tc13tmor','2023-02-09 15:38:46.858386','cidz4imnqhir48brz6e8hxhfrhy',1,'text','## Requirements\n- [Requirement 1]\n- [Requirement 2]\n- ...','{}',1675957126856,1675957126856,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('aoqmbijk7nbn13r73xd5rbu49py','2023-02-09 15:38:46.372907','cawy4iq6n1j86bq6r5nr411qixa',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126371,1675957126371,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('aoun46k7itjdxmxgd47bwstropc','2023-02-09 15:38:47.406225','cxpohc37ix7yndjjyqj4d777cwr',1,'text','Keep stakeholders and customers up-to-date on project progress by sharing your board.','{}',1675957127404,1675957127404,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aozygt5i473go7etympxjrz7zqe','2023-02-09 15:38:46.064780','cdqwjs75oxjdpuk8ibqcugi3meo',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675957126062,1675957126062,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('apc5x91maefy4ic5jwxnsduc1qo','2023-02-09 15:38:41.470030','ch798q5ucefyobf5bymgqjt4f3h',1,'text','# Notes\n*[Add meeting notes here]*','{}',1675957121468,1675957121468,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('apsu75tdob7y8xmfccz1ze34u1a','2023-02-09 15:38:46.090033','c9jyoy49o9ifbxctj3rnsxcd5dr',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n\n## Weaknesses\n- ...\n- ...\n\n## Opportunities\n- ...\n- ...\n\n## Threats\n- ...\n- ...','{}',1675957126088,1675957126088,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('apyqz6d5zat8p3p75qbogh4tc9e','2023-02-09 15:38:41.390396','cao6e3zedf7fofqb3rqgypczpdy',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675957121388,1675957121388,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('aq4n3zxsui7natpurtsrn75jhkh','2023-02-09 15:38:45.300365','c9wgkprk3ipn18ky1qhq1m841gy',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957125297,1675957125297,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('aq7xd8ex8tbrpframi4htuxs9da','2023-02-09 15:38:47.426941','cjtnba6s7f7gqdeedbh7wsi9wmy',1,'text','To create a new card, simply do any of the following:\n- Select \"**New**\" on the top right header\n- Select \"**+ New**\" below any column\n- Select \"**+**\" to the right of any columnn header','{}',1675957127425,1675957127425,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aq9774er56byu7mn7m9g1877aoy','2023-02-09 15:38:47.433257','cjtnba6s7f7gqdeedbh7wsi9wmy',1,'text','Mattermost Boards helps you manage and track all your project tasks with **Cards**.','{}',1675957127431,1675957127431,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aqa1enkxgpirkjbaku5ha4u9xsr','2023-02-09 15:38:47.497650','cmbff37bue7yrbg691t35b65c7r',1,'text','Customize cards to fit your needs and track the information most important to you. Boards supports a wide range of fully customizable property types. For example, you can:\n- Use the **Date** property for things like deadlines or milestones.\n- Assign owners to tasks with the **Person** property.\n- Define statuses and priorities with the **Select** property.\n- Create tags with the **Multi Select** property.\n- Link cards to webpages with the **URL** property.','{}',1675957127496,1675957127496,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aqiqhuzk88b8c3n8nggbgwebtne','2023-02-09 15:38:47.368599','cj1km8t149jfb7dd9cr5dsfu6ge',1,'text','Cards allow your entire team to manage and collaborate on a task in one place. Within a card, your team can:','{}',1675957127367,1675957127367,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aqmofry5yqbyi3pk6oizc8m168w','2023-02-09 15:38:47.390814','cq4c7epp1ubbetm438oi5qmafba',1,'text','To create your own board, select the \"+\" on the top of the left hand sidebar. Choose from one of our standard templates and see how they can help you get started with your next project:\n\n- **Project Tasks**: Stay on top of your project tasks, track progress, and set priorities. \n- **Meeting Agenda**: Set your meeting agendas for recurring team meetings and 1:1s.\n- **Roadmap**: Plan your roadmap and manage your releases more efficiently.\n- **Personal Tasks**: Organize your life and track your personal tasks.\n- **Content Calendar**: Plan your editorial content, assign work, and track deadlines.\n- **Personal Goals**: Set and accomplish new personal goals and milestones.','{}',1675957127389,1675957127389,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aqrueepkznifmf8xczrxtoezdua','2023-02-09 15:38:46.380520','c7dtaxe38rjboubddzb8p7nxeso',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126379,1675957126379,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('ar84bfcatnf8q7fxgwsxmx6d35c','2023-02-09 15:38:44.279255','czw9es1e89fdpjr7cqptr1xq7qh',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124277,1675957124277,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('arzh4zmxdtt8mffsconizr3szpr','2023-02-09 15:38:44.286847','czw9es1e89fdpjr7cqptr1xq7qh',1,'text','## Checklist','{}',1675957124285,1675957124285,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('as4ec4494eff3ire9xxc8euqfir','2023-02-09 15:38:45.392201','cfmk7771httynm8r7rm8cbrmrya',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957125390,1675957125390,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ascyssjiewb86jfbfr5rpaf9khw','2023-02-09 15:38:42.403984','ce7totp851pn8fc16szcfdnthny',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675957122402,1675957122402,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('astcfbnhyhtnr5bs9n5yyn9pgoa','2023-02-09 15:38:42.395848','ce7totp851pn8fc16szcfdnthny',1,'text','## Checklist','{}',1675957122393,1675957122393,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('at38so4cpwif5xga7mgchdw5d8w','2023-02-09 15:38:46.810845','cpiw648g9s3dqiqs3sxup3n7qec',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957126809,1675957126809,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('at5cgtckizfgdiycxfxogxptpph','2023-02-09 15:38:45.325836','cekput58kh3n4jf5cf9neytx4hc',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957125324,1675957125324,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('at7wkmaa4dfgc7nuisymzsgjggy','2023-02-09 15:38:44.238621','crnc89prmbtg98ms9i97rtm8x6o',1,'text','## Checklist','{}',1675957124237,1675957124237,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('atans1en8kb8rurprh7jnubrc1r','2023-02-09 15:38:42.291742','c7sed4gkoe3bxif9ewg1yq36r8w',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675957122289,1675957122289,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('atbx14ts9hfnxzcruf165gqm9xa','2023-02-09 15:38:46.356759','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n- ...\n\n## Notes\n- ...\n- ...\n- ...','{}',1675957126355,1675957126355,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('ateb7q49pzfbfz881bntt94u9dr','2023-02-09 15:38:46.864978','c16iiiyo9xjyitrhaa4r7qwrcgh',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675957126863,1675957126863,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('athbwfmdjifdjxdao5h9cmcr6xr','2023-02-09 15:38:45.444259','cyhsz4iz5m7bjxp8xie3z8akxgw',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675957125442,1675957125442,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('au6zmhj8zi3nitdc47gep76qdao','2023-02-09 15:38:42.183606','ceq73enymxtfhzemaau1k75c3ko',1,'text','## Checklist','{}',1675957122181,1675957122181,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('au76uwhduw38a3cw7cm39p9p91h','2023-02-09 15:38:47.484595','cgscdkccnbfgzbeptndqxomibhc',1,'text','Views allow your team to visualize the same cards and data from different perspectives, so they can stay up-to-date in the way that works best for them. To add a new view, go to **Add a new view** from the view drop-down, then select from any of the following views:\n\n- **Board**: Adds a Kanban board, similar to this one, that allows your team to organize cards in swimlanes grouped by any property of your choosing. This view helps you visualize your project progress.\n- **Table**: Displays cards in a table format with rows and columns. Use this view to get an overview of all your project tasks. Easily view and compare the state of all properties across all cards without needing to open individual cards.\n- **Gallery**: Displays cards in a gallery format, so you can manage and organize cards with image attachments.\n- **Calendar**: Adds a calendar view to easily visualize your cards by dates and keep track of deadlines.','{}',1675957127482,1675957127482,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('awbmqrtbrhbdf3c1jbinsiju7je','2023-02-09 15:38:41.576431','cbfwysn4hytfzjrkrz4rwsxoypy',1,'text','## Action Items','{}',1675957121574,1675957121574,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('awhqdccbq678sfm3eiy4961cqqc','2023-02-09 15:38:47.414745','cxpohc37ix7yndjjyqj4d777cwr',1,'text','To share a board, select **Share** at the top right of the Board view. Copy the link to share the board internally with your team or generate public link that can be accessed by anyone externally.','{}',1675957127413,1675957127413,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('awjyu4pu76jykzm3t99sgcouzna','2023-02-09 15:38:45.355735','csbgswatyspdiuknhxrfx4muwxa',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957125354,1675957125354,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('awqyxdhfuhjgjbe1foei8sgkdpw','2023-02-09 15:38:46.836127','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\n*[A clear and concise description of what you expected to happen.]*\n\n## Screenshots\n\n*[If applicable, add screenshots to elaborate on the problem.]*\n\n## Edition and Platform\n\n - Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n - Version: *[e.g. v0.9.0]*\n - Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n\n*[Add any other context about the problem here.]*','{}',1675957126835,1675957126834,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('awro4hs7fppd1zx95b5yrweu38h','2023-02-09 15:38:45.318196','cekput58kh3n4jf5cf9neytx4hc',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957125316,1675957125316,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('awsm89qkiminfuddjwpzawx44pa','2023-02-09 15:38:46.823060','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Screenshots\nIf applicable, add screenshots to elaborate on the problem.','{}',1675957126821,1675957126821,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('awsqw6nxeebf75pgjfprwe135bc','2023-02-09 15:38:44.036028','cgmghb9uqnfyozy77qed7ctu8no',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124034,1675957124034,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('ax557iho483ytmgwty89w8doraw','2023-02-09 15:38:44.084581','c1bmjmuj9d7dqbp6q683fbwhioo',1,'text','## Checklist','{}',1675957124083,1675957124083,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('axb7xpfyqzpbomq3df7biqf1pja','2023-02-09 15:38:46.784678','cncdr6c56zpgh5xnxy1ws4syt8y',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957126783,1675957126783,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('ay1fowfzpkiyh8m3wa49zoii6ne','2023-02-09 15:38:47.384166','cq4c7epp1ubbetm438oi5qmafba',1,'text','A board helps you manage your project, organize tasks, and collaborate with your team all in one place.','{}',1675957127381,1675957127381,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('ayo673a5dwinb5ghrat43orq99a','2023-02-09 15:38:47.471598','ctatxjxc1c7nqxnstzewk5nzawh',1,'text','Organize and find the cards you\'re looking for with our filter, sort, and grouping options. From the Board header, you can quickly toggle on different properties, change the group display, set filters, and change how the cards are sorted.','{}',1675957127470,1675957127470,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('azkn9xoyupffjbbzemaktz5kaer','2023-02-09 15:38:44.141031','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'text','## Checklist','{}',1675957124139,1675957124139,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('c16iiiyo9xjyitrhaa4r7qwrcgh','2023-02-09 15:38:46.719709','bui5izho7dtn77xg3thkiqprc9r',1,'card','Review API design','{\"contentOrder\":[\"ateb7q49pzfbfz881bntt94u9dr\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675957126718,1675957126718,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('c1bmjmuj9d7dqbp6q683fbwhioo','2023-02-09 15:38:43.928658','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Define project scope','{\"contentOrder\":[\"a4g3xkek31iygzr4xomnah9yf7y\",\"7gzcf7gxw3innjqjm97zz8inuky\",\"ax557iho483ytmgwty89w8doraw\",\"7zs5jxwg49tb47p4tcuc3hzjjde\",\"7hc5arn1hwtb8bc7razzjauz3gr\",\"7rbjqxns9x3n15qgf648kkyfhjc\",\"7o4psoq571jfhbysze5ggqjpg1h\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"32\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"87f59784-b859-4c24-8ebe-17c766e081dd\"}}',1675957123926,1675957123926,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('c3abrf7x8htr8brqmuxzm15p5gy','2023-02-09 15:38:44.840312','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Increase customer retention','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"66%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"90% customer retention rate\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"60%\",\"azzbawji5bksj69sekcs4srm1ky\":\"afkxpcjqjypu7hhar7banxau91h\"}}',1675957124839,1675957124839,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('c3f1ep3c97pfkzcijzknob4ukpe','2023-02-09 15:38:43.559655','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Feed Fluffy','{\"contentOrder\":[\"abkhji1dcxbnf5py5hh89yn1aqc\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"an51dnkenmoog9cetapbc4uyt3y\"}}',1675957123558,1675957123558,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('c3yzqoxmrgtfiu81usdcufmtusc','2023-02-09 15:38:45.269110','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Feature','{\"contentOrder\":[\"aft57dqjwy3d4xgjn3ooqmxqmro\"],\"icon\":\"?️\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675957125267,1675957125267,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('c49nb54ueeprz589qo735319hqo','2023-02-09 15:38:42.083027','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Shelby Olson','{\"contentOrder\":[\"amgcmwxa7pfdw5mpwjxowcnzote\",\"af4hte1z7wjdjtqhjp9w9bsx3nc\",\"7mcmz64jnejf98886sz1849qnsa\",\"7igxh89mrdpryidtstp3rwnxhjo\",\"74qzhfq1hbp8z7qawbiepbzcawr\",\"77swm19jjybfrddzyyx3uq9fdrr\",\"7skjpoeecabng7kd65f37qxnnpw\",\"7x6x5u9dhgin6jcbqhq8oz93hry\",\"7hu5px3g37prcbpsxgtu1h8cazh\",\"7gczt6rkibbnguytsqeudbjafoc\",\"7so4cnboump8mi8je7j4q1nphqh\",\"7ojrstcxjr3f1fy3859xz6jubuy\"],\"icon\":\"?‍♀️\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(111) 321-5678\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"abru6tz8uebdxy4skheqidh7zxy\":\"shelby.olson@email.com\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$30,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Kadera Global\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"ar6t1ttcumgfuqugg5o4g4mzrza\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"auu9bfzqeuruyjwzzqgz7q8apuw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1669291200000}\"}}',1675957122081,1675957122081,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('c4amsnwiypifnxdg7fduunean3e','2023-02-09 15:38:46.028587','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Helx Industries','{\"contentOrder\":[\"aagi9urk1cir17mbbmwahuf6ype\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abt79uxg5edqojsrrefcnr4eruo\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"650\",\"ahzspe59iux8wigra8bg6cg18nc\":\"helxindustries.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$50,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2009\",\"aozntq4go4nkab688j1s7stqtfc\":\"New York, NY\"}}',1675957126026,1675957126026,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('c4rgdu3x54tfcpy1z4wsatq7a7o','2023-02-09 15:38:45.796099','bh4pkixqsjift58e1qy6htrgeay',1,'card','Olivia Alsop','{\"contentOrder\":[\"a3rwrf9qi6tgetmp4m6m6bhy5rc\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"a7yq89whddzob1futao4rxk3yzc\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"olivia.alsop@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1671192000000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"a1sxagjgaadym5yrjak6tcup1oa\"}}',1675957125794,1675957125794,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('c6tfecdrxkprfxkjd31jwn5bkjc','2023-02-09 15:38:46.591177','bsjd59qtpbf888mqez3ge77domw',1,'card','Positive user feedback','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aq1dwbf661yx337hjcd5q3sbxwa\"}}',1675957126589,1675957126589,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('c6xxci6pge7gm3d9cuiuyigp3ah','2023-02-09 15:38:45.026124','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Run 3 times a week','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"6e7139e4-5358-46bb-8c01-7b029a57b80a\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"ffb3f951-b47f-413b-8f1d-238666728008\"}}',1675957125024,1675957125024,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('c7dtaxe38rjboubddzb8p7nxeso','2023-02-09 15:38:46.268124','brs9cdimfw7fodyi7erqt747rhc',1,'card','Unblocking Workflows: The Guide to Developer Productivity','{\"contentOrder\":[\"77tz16jtz5x73ncs3dxc3fp1d7h\",\"aqrueepkznifmf8xczrxtoezdua\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1638532800000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a3pdzi53kpbd4okzdkz6khi87zo\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"apy9dcd7zmand615p3h53zjqxjh\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1639483200000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://mattermost.com/newsroom/press-releases/mattermost-unveils-definitive-report-on-the-state-of-developer-productivity-unblocking-workflows-the-guide-to-developer-productivity-2022-edition/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"a3xky7ygn14osr1mokerbfah5cy\"}}',1675957126266,1675957126266,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('c7sed4gkoe3bxif9ewg1yq36r8w','2023-02-09 15:38:42.050656','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Richard Guzman','{\"contentOrder\":[\"atans1en8kb8rurprh7jnubrc1r\",\"abr8coy5jpjr78khwn9ipuog8oa\",\"7353agjgjnbgqie6xoaafn1ufqa\",\"7nhpmb1utzbynmrdit3dgbtwq4a\",\"7h6gasqp4zjd5icoyphhae1hydr\",\"7x4z8qu4e878nffrxq8arjrqtsy\",\"73eh34rr4m7biibwb73k4fmeg5o\",\"7m9iqg1tpr7grur8z6f7fye9nah\",\"7ihw48cjrnbd1jgbeya43afmhfr\",\"7cyatjjky87d7tbz5ni44mr5hhe\",\"7jemzru7f1br4bbwm5k8bzfjkzy\",\"78zqqipq9iifzdgxym93fzomq1c\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(222) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"axesd74yuxtbmw1sbk8ufax7z3a\",\"abru6tz8uebdxy4skheqidh7zxy\":\"richard.guzman@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1681992000000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"80%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$3,200,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Afformance Ltd.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"ar6t1ttcumgfuqugg5o4g4mzrza\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apjnaggwixchfxwiatfh7ey7uno\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1667476800000}\"}}',1675957122049,1675957122049,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('c8ykbwa643fy6tk5btqmbzteiyh','2023-02-09 15:38:46.710891','bui5izho7dtn77xg3thkiqprc9r',1,'card','Import / Export','{\"contentOrder\":[\"a1cqo496pgircbr6kw3r79arrse\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957126709,1675957126709,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('c99mzxxezxbgcbgpxqscroy4r4h','2023-02-09 15:38:44.872202','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Launch 3 key features','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"apnt1f7na9rzgk1rt49keg7xbiy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"ao9b5pxyt7tkgdohzh9oaustdhr\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"33%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"3\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"anruuoyez51r3yjxuoc8zoqnwaw\",\"azqnyswk6s1boiwuthscm78qwuo\":\"1\",\"azzbawji5bksj69sekcs4srm1ky\":\"aw5i7hmpadn6mbwbz955ubarhme\"}}',1675957124870,1675957124870,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('c9jyoy49o9ifbxctj3rnsxcd5dr','2023-02-09 15:38:46.047947','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Ositions Inc.','{\"contentOrder\":[\"apsu75tdob7y8xmfccz1ze34u1a\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abajmr34b8g1916w495xjb35iko\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"2,700\",\"ahzspe59iux8wigra8bg6cg18nc\":\"ositionsinc.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$125,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2004\",\"aozntq4go4nkab688j1s7stqtfc\":\"Berlin, Germany\"}}',1675957126045,1675957126045,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('c9wgkprk3ipn18ky1qhq1m841gy','2023-02-09 15:38:45.184216','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','User Story','{\"contentOrder\":[\"aq4n3zxsui7natpurtsrn75jhkh\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"apht1nt5ryukdmxkh6fkfn6rgoy\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675957125182,1675957125182,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ca3t3g3ioojd93qse39zgu8579w','2023-02-09 15:38:44.855926','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Increase user signups by 30%','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a6robxx81diugpjq5jkezz3j1fo\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"ao9b5pxyt7tkgdohzh9oaustdhr\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"0%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"1,000\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"0\",\"azzbawji5bksj69sekcs4srm1ky\":\"afkxpcjqjypu7hhar7banxau91h\"}}',1675957124854,1675957124854,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('cafmdcqpeupyd3rhzyigdz3mcmh','2023-02-09 15:38:45.243832','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Standard properties','{\"contentOrder\":[\"afudzuo8kqbyobp5ppjziicaqxy\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957125242,1675957125242,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('cao6e3zedf7fofqb3rqgypczpdy','2023-02-09 15:38:41.256695','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Team Schedule','{\"contentOrder\":[\"apyqz6d5zat8p3p75qbogh4tc9e\",\"7uytuwjw3rjns7m8m7ozyocdsxr\",\"anutui7cr5tb33r6iu3ybr4ep6o\",\"7bx1dfx6dh7r6zndnmkj4x939ow\",\"7xyrzt79gc3f7mnoqxebiecmzer\",\"7c5y73xmnkjf5d84yg9n4bpkugo\"],\"icon\":\"⏰\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"8b05c83e-a44a-4d04-831e-97f01d8e2003\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\"}}',1675957121254,1675957121254,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('cawy4iq6n1j86bq6r5nr411qixa','2023-02-09 15:38:46.256339','brs9cdimfw7fodyi7erqt747rhc',1,'card','Top 10 Must-Have DevOps Tools in 2021','{\"contentOrder\":[\"7fo1utqc8x1z1z6hzg33hes1ktc\",\"aoqmbijk7nbn13r73xd5rbu49py\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1636113600000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a8xceonxiu4n3c43szhskqizicr\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"a9ana1e9w673o5cp8md4xjjwfto\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1637323200000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://www.toolbox.com/tech/devops/articles/best-devops-tools/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"a3xky7ygn14osr1mokerbfah5cy\"}}',1675957126254,1675957126254,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('cax7uqt4jfbb8ue7j34yu1mpz1w','2023-02-09 15:38:45.787600','bh4pkixqsjift58e1qy6htrgeay',1,'card','Claire Hart','{\"contentOrder\":[\"aa4zg6ack43dgmqenna4jftqyxc\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"aseqq9hrsua56r3s6nbuirj9eec\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"claire.hart@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1670500800000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"ahn89mqg9u4igk6pdm7333t8i5h\"}}',1675957125786,1675957125786,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('cb5rd3k6997nezrcdak599yur7e','2023-02-09 15:38:45.236278','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Bug','{\"contentOrder\":[\"ah4dw5eqfcpdjuqgfayojg9s5xy\",\"ajfzxqte7cfnejqt6w8u1yhefce\",\"74w314tfrffy78jyjzan1637yoe\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675957125234,1675957125234,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('cbfwysn4hytfzjrkrz4rwsxoypy','2023-02-09 15:38:41.278831','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Offsite plans','{\"contentOrder\":[\"ae18goftntprhxdnj6rqruid5de\",\"71xatgq9j1pr4tdo7meq6r56ypo\",\"awbmqrtbrhbdf3c1jbinsiju7je\",\"7seu89dxmdbg78xn6ffctf8qg7h\",\"7355dznz4gbynipfj7hw7xgtf6h\",\"7ij35dre9h38nux5k3kqefddhoo\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"8b05c83e-a44a-4d04-831e-97f01d8e2003\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"dabadd9b-adf1-4d9f-8702-805ac6cef602\"}}',1675957121275,1675957121275,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('cbmrscrph3tymfkbr9dba5asgnr','2023-02-09 15:38:47.265599','buixxjic3xjfkieees4iafdrznc',1,'card','@mention teammates','{\"contentOrder\":[\"abd3r8d6a1jf5xmwrhwowo77ssr\",\"a3hs8k9dhefnzjkoq1dy818r7dy\",\"7mbw9t71hjbrydgzgkqqaoh8usr\",\"716dwrk9k1byr9mfs5ym8swr1tr\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#mention-people\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675957127263,1675957127263,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cbngnxne8yfy3tf5kuu1sopqr7e','2023-02-09 15:38:44.848618','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Hit company global sales target','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a6robxx81diugpjq5jkezz3j1fo\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"15%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"50MM\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"awfu37js3fomfkkczm1zppac57a\",\"azqnyswk6s1boiwuthscm78qwuo\":\"7.5MM\",\"azzbawji5bksj69sekcs4srm1ky\":\"agrfeaoj7d8p5ianw5iaf3191ae\"}}',1675957124847,1675957124847,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('cbupk1g7hifncimcqp195orzqxo','2023-02-09 15:38:45.227254','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Cross-team collaboration','{\"contentOrder\":[\"ajekopxcqcig9tqgrtepgfx6cjh\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675957125225,1675957125225,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('cc4opygf357gg3gxwhrtg59r99y','2023-02-09 15:38:42.073128','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','New Prospect','{\"contentOrder\":[\"ajzrs8mpz4pd5fpr7t794pc139w\",\"ak5p6j9onjt8gme4ges8d9suqao\",\"7ftgmxj1ur3ydfqkgtie48cpfky\",\"7nbe7oiagq7drupnp9sa66z6xac\",\"7xur9msnw13dndjyu6efjsnsp1a\",\"7pqq8ojniepfgfmb3uzxfns169y\",\"7h47gufr1ut8u7gw79xhioko83r\",\"7k7n85rq7rp8g78wtfh6s5ahhcc\",\"76k47w8b1i784tf9j9o99uh4yyr\",\"7mhbw7ea83jrd7bqp3meatdejnr\",\"7z3gpn7qt6fgamjpe8oh6j4ssba\",\"74kak7ugwwtgg7jc8a8du3wpqow\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"akj61wc9yxdwyw3t6m8igyf9d5o\"}}',1675957122071,1675957122071,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('cc7oak87qyirgzdc8zdsz8qh1sh','2023-02-09 15:38:46.038272','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Kadera Global','{\"contentOrder\":[\"abjhxhte5o3ru7m3earfrax3h1c\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"aipf3qfgjtkheiayjuxrxbpk9wa\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"150\",\"ahzspe59iux8wigra8bg6cg18nc\":\"kaderaglobal.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$12,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2015\",\"aozntq4go4nkab688j1s7stqtfc\":\"Seattle, OR\"}}',1675957126036,1675957126036,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('cdiyyn5idt7gg3rg5eqazep1nye','2023-02-09 15:38:45.781768','bh4pkixqsjift58e1qy6htrgeay',1,'card','Richard Parsons','{\"contentOrder\":[\"a5wia4hjzwfry7rqiyu9php8fhr\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"a7yq89whddzob1futao4rxk3yzc\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"richard.parsons@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1671019200000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"a1sxagjgaadym5yrjak6tcup1oa\"}}',1675957125780,1675957125779,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('cdqwjs75oxjdpuk8ibqcugi3meo','2023-02-09 15:38:46.019976','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Liminary Corp.','{\"contentOrder\":[\"aozygt5i473go7etympxjrz7zqe\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abt79uxg5edqojsrrefcnr4eruo\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"300\",\"ahzspe59iux8wigra8bg6cg18nc\":\"liminarycorp.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$25,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2017\",\"aozntq4go4nkab688j1s7stqtfc\":\"Toronto, Canada\"}}',1675957126018,1675957126018,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('cdr1mhwde87n7zd64j74exwkchy','2023-02-09 15:38:47.228521','buixxjic3xjfkieees4iafdrznc',1,'card','Share cards on Channels','{\"contentOrder\":[\"ab9k4rceobjrwudtqkynz66zfpy\",\"a7ed4q13ow3gj8ybikfwche9jda\",\"akyg4q9i53ifnjji1ren9rm1yro\",\"7ifkkn1h9wj85up8kcqwbd6gqec\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#share-card-previews\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675957127227,1675957127227,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cdttwwj85djbyunditagubfp3ny','2023-02-09 15:38:45.032296','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Learn to paint','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"77c539af-309c-4db1-8329-d20ef7e9eacd\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"9a090e33-b110-4268-8909-132c5002c90e\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"3245a32d-f688-463b-87f4-8e7142c1b397\"}}',1675957125030,1675957125030,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('cdwyteuoeajf6dnjozotzgrtoco','2023-02-09 15:38:45.218676','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Move cards across boards','{\"contentOrder\":[\"ae9fbaq8pebdbbfmkhcrqq84nph\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"abrfos7e7eczk9rqw6y5abadm1y\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"2\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957125217,1675957125217,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('cdyoz55rinbbm8y3u3zsqybxzsw','2023-02-09 15:38:45.773089','bh4pkixqsjift58e1qy6htrgeay',1,'card','Frank Nash','{\"contentOrder\":[\"a1ynhznfjwiyctj35curz6757ah\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"ap93ysuzy1xa7z818r6myrn4h4y\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"frank.nash@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1669896000000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"aehc83ffays3gh8myz16a8j7k4e\"}}',1675957125771,1675957125771,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('ce7totp851pn8fc16szcfdnthny','2023-02-09 15:38:42.057612','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Byron Cole','{\"contentOrder\":[\"ascyssjiewb86jfbfr5rpaf9khw\",\"astcfbnhyhtnr5bs9n5yyn9pgoa\",\"75tjroxsot3r5mpyasrccd1tnqw\",\"7agfjix7uajrtmqb4m9zwa73mcc\",\"7qkq6qoazhpytpqgeg8yugbny9y\",\"787juff6143nmppbjgr3qqiyz3c\",\"76g3iyjhxdpymuygf4gsf9j79pa\",\"7qiscat6oqfn4zpx4yikq73ijjw\",\"79uda7c3u3fnt5czo8yzgwbmy3r\",\"79r9kss8uh7fx8x1doebumg6r6r\",\"78iy7q6b8r7r79b9f8f6yg67ore\",\"7bmioqxgtuifux89c5xw3m1cb1w\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(333) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"acm9q494bcthyoqzmfogxxy5czy\",\"abru6tz8uebdxy4skheqidh7zxy\":\"byron.cole@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1667563200000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"100%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$500,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Helx Industries\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"aafwyza5iwdcwcyfyj6bp7emufw\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apjnaggwixchfxwiatfh7ey7uno\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1667822400000}\"}}',1675957122056,1675957122056,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('cekput58kh3n4jf5cf9neytx4hc','2023-02-09 15:38:45.195815','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Horizontal scroll issue','{\"contentOrder\":[\"awro4hs7fppd1zx95b5yrweu38h\",\"at5cgtckizfgdiycxfxogxptpph\",\"7frni9nmqujb79dn3cdf4zrcppy\"],\"icon\":\"〰️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"1\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957125192,1675957125192,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ceq73enymxtfhzemaau1k75c3ko','2023-02-09 15:38:42.042279','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Jonathan Frazier','{\"contentOrder\":[\"anxnwy5irztyuzfqaeyyosy5drr\",\"au6zmhj8zi3nitdc47gep76qdao\",\"7t1y9zzch3j8pxdpnbmkq5gnzsc\",\"787mcbtsteideuro4yme46gugze\",\"7tk1dfukn5jyuzft8nex1yrdofa\",\"7dd4pazxmzbn4ijh487immy9tto\",\"7njde1qge6tryjqfjh6a5p5qbkh\",\"7gu9x9zr4jbgazq6pemig96qh3c\",\"73htx759e1jbbzdzyze6j6psjxy\",\"791sjce7anpbb8gx7gipzhw4kba\",\"7yhm1icoq47b3tya4zz169wyodr\",\"71ddc8fzu9p8x8f8xucmjqcddye\"],\"icon\":\"?‍♂️\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(999) 123-5678\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"a5txuiubumsmrs8gsd5jz5gc1oa\",\"abru6tz8uebdxy4skheqidh7zxy\":\"jonathan.frazier@email.com\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"0%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$800,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Ositions Inc.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"as5bk6afoaaa7caewe1zc391sce\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apiswzj7uiwbh87z8dw8c6mturw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1669118400000}\"}}',1675957122041,1675957122040,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('cgmghb9uqnfyozy77qed7ctu8no','2023-02-09 15:38:43.920485','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Identify dependencies','{\"contentOrder\":[\"awsqw6nxeebf75pgjfprwe135bc\",\"7op5gkqpjjfnj9fw6bpxq63po3h\",\"a9hijoe8xofrqie9r9uy1t8kp8o\",\"7ofqzfmmnqjycxdba55jmm1bdba\",\"7t7rzegarxfy3ieputjoxe9adiw\",\"7rmf45fake7gjddw4oqcmcjnema\",\"7j4984i3j7jyg5pfdfp8o1ymzeh\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"16\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"98a57627-0f76-471d-850d-91f3ed9fd213\"}}',1675957123919,1675957123919,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('cgscdkccnbfgzbeptndqxomibhc','2023-02-09 15:38:47.245588','buixxjic3xjfkieees4iafdrznc',1,'card','Create a new view','{\"contentOrder\":[\"aozbezukpgif3jpbsq7tahmmp5e\",\"au76uwhduw38a3cw7cm39p9p91h\",\"7owai1ux3h3gtf8byynfk6hyx1c\",\"7n8jq1dizyfgotby3o91arf1hxh\",\"77y4wffj1ctg7xmm9bx45qn6q6o\",\"77p1rh34rxb8etcpzs495tpp3qy\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-views\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675957127243,1675957127243,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('ch4rcgc3sbjnbfnsijhq6ir3joc','2023-02-09 15:38:45.020298','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Start a daily journal','{\"contentOrder\":[],\"icon\":\"✍️\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"3245a32d-f688-463b-87f4-8e7142c1b397\"}}',1675957125019,1675957125019,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('ch9h3ac8pctbn7pqwx97tgjdu5e','2023-02-09 15:38:46.576931','bsjd59qtpbf888mqez3ge77domw',1,'card','Reschedule planning meeting','{\"contentOrder\":[],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aok6pgecm85qe9k5kcphzoe63ma\"}}',1675957126575,1675957126575,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('chikrbt1ocfgafjh8q8p6u83yth','2023-02-09 15:38:46.240257','brs9cdimfw7fodyi7erqt747rhc',1,'card','New Project and Workflow Management Solutions for Developers','{\"contentOrder\":[\"71qhnzuec6esdi6fnynwpze4xya\",\"aegx8f1meuj8sff8fh7hai7ke4c\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1645790400000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a8xceonxiu4n3c43szhskqizicr\",\"a3pdzi53kpbd4okzdkz6khi87zo\",\"a3d9ux4fmi3anyd11kyipfbhwde\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"awna1nuarjca99m9s4uiy9kwj5h\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://mattermost.com/newsroom/press-releases/mattermost-launches-new-project-and-workflow-management-solutions-for-developers/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"aywiofmmtd3ofgzj95ysky4pjga\"}}',1675957126238,1675957126238,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('chpoprrty17rriggfj6y58op6mw','2023-02-09 15:38:46.584287','bsjd59qtpbf888mqez3ge77domw',1,'card','Schedule more time for testing','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"akj3fkmxq7idma55mdt8sqpumyw\"}}',1675957126582,1675957126582,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('chs33w9dkmt8w3naxz49antsaua','2023-02-09 15:38:44.864763','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Add 10 new customers in the EU','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"apnt1f7na9rzgk1rt49keg7xbiy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a1ts3ftyr8nocsicui98c89uxjy\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"30%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"10\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"3\",\"azzbawji5bksj69sekcs4srm1ky\":\"agrfeaoj7d8p5ianw5iaf3191ae\"}}',1675957124863,1675957124863,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('ciqogkfndsp8gdn6jou7ctmadoh','2023-02-09 15:38:46.055981','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Afformance Ltd.','{\"contentOrder\":[\"ajrwye5cxojrw7euzh9psmpnewe\"],\"icon\":\"⚡\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"arfjpz9by5car71tz3behba8yih\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"1,800\",\"ahzspe59iux8wigra8bg6cg18nc\":\"afformanceltd.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$200,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2002\",\"aozntq4go4nkab688j1s7stqtfc\":\"Palo Alto, CA\"}}',1675957126054,1675957126054,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('cj1km8t149jfb7dd9cr5dsfu6ge','2023-02-09 15:38:47.195723','buixxjic3xjfkieees4iafdrznc',1,'card','Manage tasks with cards','{\"contentOrder\":[\"aqiqhuzk88b8c3n8nggbgwebtne\",\"7mwz89dswkprpmq39xbfmszqena\",\"73xmo3qsoy3yauju46fh69udcar\",\"784uu3ufcgb878ky7hyugmf6xcw\",\"7azq9mxjretg65qmcguo9j5txjh\",\"7yuzb4f73mpg58ganappiick8mw\",\"7w5kznf6a8irrbg59modk68i46y\",\"7nb8y7jyoetro8cd36qcju53z8c\",\"7n4effoi9m3b89rey9bc8ia4uth\",\"73dk9foche3rn7gq6shxi81dcoy\",\"76nwb9tqfsid5jx46yw34itqima\",\"7dy3mcgzgybf1ifa3emgewkzj7e\",\"a5ca6tii33bfw8ba36y1rswq3he\",\"7876od6xhffr6fy69zeogag7eyw\",\"7x7bq9awkatbm5x4docbh5gaw4y\",\"7ghpx9qff43dgtke1rwidmge1ho\",\"7nb8y7jyoetro8cd36qcju53z8c\",\"7hdyxemhbytfm3m83g88djq9nhr\",\"7pgnejxokubbe9kdrxj6g9qa41e\",\"7hw9z6qtx8jyizkmm9g5yq3gxcy\",\"7gk6ooz6npbb8by5rgp9aig7tua\",\"7sdcsqkw5dpdidgkmbqryct4tay\"],\"icon\":\"☑️\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675957127194,1675957127194,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cjd9omd3z8tgh3yc8g94zqiukrr','2023-02-09 15:38:46.727398','bui5izho7dtn77xg3thkiqprc9r',1,'card','Icons don\'t display','{\"contentOrder\":[\"a3pcou8zsoigemmjcx8t5cnd3xa\",\"a4ugxsy1qfprc8nugxusiofemxe\",\"76prpfjt7ktfrixguqmfr9ttnhc\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"1fdbb515-edd2-4af5-80fc-437ed2211a49\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957126726,1675957126726,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('cjqpcrb5uw3bbbnywrho6u9c3hw','2023-02-09 15:38:44.881721','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Reduce bug backlog by 50%','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"abzfwnn6rmtfzyq5hg8uqmpsncy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a1ts3ftyr8nocsicui98c89uxjy\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"100%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"75\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"awfu37js3fomfkkczm1zppac57a\",\"azqnyswk6s1boiwuthscm78qwuo\":\"75\",\"azzbawji5bksj69sekcs4srm1ky\":\"aw5i7hmpadn6mbwbz955ubarhme\"}}',1675957124880,1675957124880,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('cjtnba6s7f7gqdeedbh7wsi9wmy','2023-02-09 15:38:47.221152','buixxjic3xjfkieees4iafdrznc',1,'card','Create a new card','{\"contentOrder\":[\"aq9774er56byu7mn7m9g1877aoy\",\"adhsx4h5ss7rqdcjt8xyam6xtqc\",\"aq7xd8ex8tbrpframi4htuxs9da\",\"7me9p46gbqiyfmfnapi7dyxb5br\",\"7jno8da74x78zzj87pdoyckmy5y\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-cards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675957127219,1675957127219,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('ckdxkx3wrzibsjfmyhgg114h6yc','2023-02-09 15:38:46.570536','bsjd59qtpbf888mqez3ge77domw',1,'card','Team communication','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aq1dwbf661yx337hjcd5q3sbxwa\"}}',1675957126569,1675957126569,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('cmbff37bue7yrbg691t35b65c7r','2023-02-09 15:38:47.257687','buixxjic3xjfkieees4iafdrznc',1,'card','Add new properties','{\"contentOrder\":[\"aqa1enkxgpirkjbaku5ha4u9xsr\",\"ayhk11qsuz789fk8bqae4oz8mro\",\"7gc3z8cf8rirgfyutwoke9nn6jy\",\"76cinqnb6k3dzmfbm9fnc8eofny\",\"7fnwzuaqyztfuic3cn49sc4cine\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#add-and-manage-properties\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675957127256,1675957127256,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cmkaj68y4efrg9qa1wfxnpmg1sr','2023-02-09 15:38:45.804752','bh4pkixqsjift58e1qy6htrgeay',1,'card','Bernadette Powell','{\"contentOrder\":[\"a5makwszxp3gmin4b76mj7txmro\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"af6hjb3ysuaxbwnfqpby4wwnkdr\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"bernadette.powell@email.com\"}}',1675957125803,1675957125803,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('cmq9ixgwbe7nsfqostixa5t8rje','2023-02-09 15:38:46.563680','bsjd59qtpbf888mqez3ge77domw',1,'card','Tight deadline','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"ar87yh5xmsswqkxmjq1ipfftfpc\"}}',1675957126562,1675957126562,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('cncdr6c56zpgh5xnxy1ws4syt8y','2023-02-09 15:38:46.683821','bui5izho7dtn77xg3thkiqprc9r',1,'card','App crashing','{\"contentOrder\":[\"79t7rkiuspeneqi9xurou9tqzwh\",\"axb7xpfyqzpbomq3df7biqf1pja\",\"a36i7x65b4ibs5etq8y5p7t9bwh\",\"7m1nb9juqij8stdt3fzton8i75y\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"1fdbb515-edd2-4af5-80fc-437ed2211a49\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\"}}',1675957126681,1675957126681,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('cnqf1zimzjbbjpjxpf31ciaotgc','2023-02-09 15:38:43.544446','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Pay bills','{\"contentOrder\":[\"7mgkwc7u9wpgq38c5hksj94dhzc\",\"76fxqzgf6oby4xe3xzdezhdjasr\",\"7eg55detouidh9rkezb83ibmg6o\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"aj4jyekqqssatjcq7r7chmy19ey\",\"abthng7baedhhtrwsdodeuincqy\":\"true\"}}',1675957123543,1675957123543,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('cnuqebsb6ubgmmpbpsuun5rs11o','2023-02-09 15:38:41.286729','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Social Media Strategy','{\"contentOrder\":[\"ahd5gizdxw7rexyucrx4qsuhfgc\",\"7cab1f41eqfb6ip61p3wa31h5sa\",\"a34iyxqpgyigupm63iwjysydrqh\",\"7s9bhmsu9rfd6xfxjgpxhzczzmr\",\"7h1scxz84h3bcdfrszhuti8es6r\",\"76z73gkejojr3xjruhnezkiauoy\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"b1abafbf-a038-4a19-8b68-56e0fd2319f7\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed\"}}',1675957121285,1675957121285,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('cp6ireo8debnc7q9jpfbeu5gwth','2023-02-09 15:38:46.691030','bui5izho7dtn77xg3thkiqprc9r',1,'card','Calendar view','{\"contentOrder\":[\"7df11783ny67mdnognqae31ax6y\",\"ajrm94fczmfdiugdck7cz8g7dhw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"849766ba-56a5-48d1-886f-21672f415395\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957126689,1675957126689,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('cpiw648g9s3dqiqs3sxup3n7qec','2023-02-09 15:38:46.698708','bui5izho7dtn77xg3thkiqprc9r',1,'card','Standard templates','{\"contentOrder\":[\"7uonmjk41nipnrsi6tz8wau5ssh\",\"at38so4cpwif5xga7mgchdw5d8w\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957126697,1675957126697,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('cq4c7epp1ubbetm438oi5qmafba','2023-02-09 15:38:47.204720','buixxjic3xjfkieees4iafdrznc',1,'card','Create your own board','{\"contentOrder\":[\"ay1fowfzpkiyh8m3wa49zoii6ne\",\"aqmofry5yqbyi3pk6oizc8m168w\",\"7r9my1yuddbn45dojrfht3neg8c\",\"7eir5gdjxgjbsxpbyp3df4npcze\",\"7rwou19t1s7gwuezy73xo3iiiga\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-boards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675957127203,1675957127203,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cqioq4yjo4p84bgkqxcn7egeqir','2023-02-09 15:38:44.823716','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Improve customer NPS score','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"82%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"8.5\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"anruuoyez51r3yjxuoc8zoqnwaw\",\"azqnyswk6s1boiwuthscm78qwuo\":\"7\",\"azzbawji5bksj69sekcs4srm1ky\":\"agm9p6gcq15ueuzqq3wd4be39wy\"}}',1675957124822,1675957124822,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('crk5mmf4zgtyix8khnfwsoje4ca','2023-02-09 15:38:47.187244','buixxjic3xjfkieees4iafdrznc',1,'card','Drag cards','{\"contentOrder\":[\"apktbgtee5jb8xrnqy3ibiujxew\",\"a6rzpwykmyj8azgwfhhxdogmn7e\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#dragging-cards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675957127185,1675957127185,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('crnc89prmbtg98ms9i97rtm8x6o','2023-02-09 15:38:43.950109','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Conduct market analysis','{\"contentOrder\":[\"a3fgn3k3o1ff1mprakwekabmwkr\",\"7e6834n16q7fupngwqx7t937aro\",\"at7wkmaa4dfgc7nuisymzsgjggy\",\"7tspi4obsx7nijn9r3bk4bwqkuc\",\"7c9hhfm9yx7gzjkmj3weym49bqc\",\"7rngcpz3aktnxmd94s39kenne9a\",\"7mut8wzz3tty33e7bi7yj65oycr\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"40\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"87f59784-b859-4c24-8ebe-17c766e081dd\"}}',1675957123948,1675957123948,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('crydizwwgwfrtjemgykge11ifmy','2023-02-09 15:38:43.942511','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Project budget approval','{\"contentOrder\":[\"aj3jx4wyogpfkpjybzgdwxjakdy\",\"7fxt891ntqtf98gkawcad1s1irc\",\"adudjr3mgwbyqmb1n818f1k8d8r\",\"73qroj7qdtpb49jcqoicjw65y9r\",\"7y8kizaqnqpyxijaax4mfti1d6w\",\"76616kunmejdu5qosasw9wmo4ee\",\"7cmxsungmdin5fb6q4awj316axw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"16\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\"}}',1675957123941,1675957123941,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('csbgswatyspdiuknhxrfx4muwxa','2023-02-09 15:38:45.208821','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Login screen not loading','{\"contentOrder\":[\"awjyu4pu76jykzm3t99sgcouzna\",\"afgaieg68zby5iyry16mn4zbymc\",\"7oapg5e5gx7ghtpxfwjf4ssbesr\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"abrfos7e7eczk9rqw6y5abadm1y\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"1\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\"}}',1675957125207,1675957125207,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('csdmaxaygtbbdpecywm73rureor','2023-02-09 15:38:46.247967','brs9cdimfw7fodyi7erqt747rhc',1,'card','[Tweet] Mattermost v6.1 includes card @-mention notifications in Boards','{\"contentOrder\":[\"7i96m7nbsdsex8n6hzuzrmdfjuy\",\"7ed5bwp3gr8yax3mhtuwiaa9gjy\",\"a6qbdm88dqpgmbp6i3s7epcr41a\",\"agbyoid6xz7f7jr593hdw8stbdh\",\"abdasiyq4k7ndtfrdadrias8sjy\",\"73xt4fmtc3jgc9y3he5xzwpiefa\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1639051200000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"az8o8pfe9hq6s7xaehoqyc3wpyc\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"a9ana1e9w673o5cp8md4xjjwfto\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1637668800000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://twitter.com/Mattermost/status/1463145633162969097?s=20\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"aj8y675weso8kpb6eceqbpj4ruw\"}}',1675957126246,1675957126246,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('ctatxjxc1c7nqxnstzewk5nzawh','2023-02-09 15:38:47.237474','buixxjic3xjfkieees4iafdrznc',1,'card','Filter and sort cards','{\"contentOrder\":[\"a4fz9kcfs9ibj8puk9mux7ac94c\",\"ayo673a5dwinb5ghrat43orq99a\",\"78i8aqjmqtibr7x4okhz6uqquqr\",\"7cyd3zidtzpdpmnx8bemdbay6wy\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675957127235,1675957127235,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('ctytybwsz4fybiyxo3hxu6skzpw','2023-02-09 15:38:43.554664','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Go for a walk','{\"contentOrder\":[\"a6gjbdp8ud3nqpr9k3ao9ik4uoy\",\"a4iau9riytb8hxgrrkid8f6xnac\",\"7hidha44ow7ns3e3731qd95k7aw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"an51dnkenmoog9cetapbc4uyt3y\"}}',1675957123553,1675957123553,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('ctzdmitubxby65qw7knhoef3gwh','2023-02-09 15:38:45.044447','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Open retirement account','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"80be816c-fc7a-4928-8489-8b02180f4954\"}}',1675957125042,1675957125042,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('cu8a79dtcx3fd7gfsgtwtu3igfr','2023-02-09 15:38:41.267147','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Video production','{\"contentOrder\":[\"a5kdt8sgcwf85ig5izbof7d74xh\",\"76uruixptajffzndrfqfznqqixr\",\"abs5kzwpo3tbejb4jytr59oqjoy\",\"7pq3x1i5rpbf6xnsb9qwtgwtqqr\",\"7h3wrcjz5kfnhppkooho41tybnc\",\"767hrhq4irtf9unxnh1mozpdp7y\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"b1abafbf-a038-4a19-8b68-56e0fd2319f7\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\"}}',1675957121264,1675957121264,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('cuow7xsfr6jdzzpsz9q541d4sth','2023-02-09 15:38:42.066260','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Caitlyn Russel','{\"contentOrder\":[\"a5ii1xhdwj7g9iq77pibrxwssqa\",\"a1ojs13y56fnpuykuhh4q7ddpue\",\"794s61rfxcfbcuj1ed1c9dzgwhh\",\"76n3qjd33gigb7rm6b5nq8qjpba\",\"7crjr47bh67bhzefirck7dcx4ke\",\"77xoe4cfio3bzm84rwi6c487fxr\",\"7h9x9r3kcgfbw9y6dmsiddbisca\",\"797aty5ck67b3mdqyhhnpip185h\",\"7dganye7ax7rzin9f8cm3sdhtsy\",\"7jfqmks46utf8ixths7yehczj8w\",\"7nycetygujb8cdra17idsx8rczo\",\"7u5tfs9wxgfb77yuzfhdsg68rbo\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(111) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"ah6ehh43rwj88jy4awensin8pcw\",\"abru6tz8uebdxy4skheqidh7zxy\":\"caitlyn.russel@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1689336000000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"20%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$250,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Liminary Corp.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"aafwyza5iwdcwcyfyj6bp7emufw\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apiswzj7uiwbh87z8dw8c6mturw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1668168000000}\"}}',1675957122065,1675957122065,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('cuygaok8sbbnbzpeen9mtreupoh','2023-02-09 15:38:43.567804','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Gardening','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"afpy8s7i45frggprmfsqngsocqh\"}}',1675957123566,1675957123566,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('cxpohc37ix7yndjjyqj4d777cwr','2023-02-09 15:38:47.212101','buixxjic3xjfkieees4iafdrznc',1,'card','Share a board','{\"contentOrder\":[\"aoun46k7itjdxmxgd47bwstropc\",\"awhqdccbq678sfm3eiy4961cqqc\",\"7r7asyew8d7fyunf4sow8e5iyoc\",\"ad8j3n8tp77bppee3ipjt6odgpe\",\"7w935usqt6pby8qz9x5pxaj7iow\",\"7ogbs8h6q4j8z7ngy1m7eag63nw\",\"7z1jau5qy3jfcxdp5cgq3duk6ne\",\"7mjsnjpr6tj81bkx4fjwdsgusuc\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/sharing-boards.html\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675957127210,1675957127210,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cygpgny1h9td5ufxg45tbq88ujy','2023-02-09 15:38:43.550580','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Buy groceries','{\"contentOrder\":[\"a9s6urkircigeurptty6sa6pege\",\"7b5cy899pyigw5etbuknprr9u3e\",\"77xcztkfy1iy43fhet3q8wgf6dr\",\"77fc5jnmscpfd7xoyerwysfboeo\",\"7tdi3eqoyqi85ujjpgfoku41b7c\",\"7mzxwwfmp8jfozbqk6rmy4b843c\",\"7qbxdt9fgdfytxf1ijn7z63tzde\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"afpy8s7i45frggprmfsqngsocqh\"}}',1675957123549,1675957123549,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('cyhsz4iz5m7bjxp8xie3z8akxgw','2023-02-09 15:38:45.253068','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Epic','{\"contentOrder\":[\"athbwfmdjifdjxdao5h9cmcr6xr\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675957125251,1675957125251,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('cyn1kss7yhpga8nsdma6rw1cbsa','2023-02-09 15:38:44.830875','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Generate more Marketing Qualified Leads (MQLs)','{\"contentOrder\":[],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"65%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"100\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"ahfbn1jsmhydym33ygxwg5jt3kh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"65\",\"azzbawji5bksj69sekcs4srm1ky\":\"aehoa17cz18rqnrf75g7dwhphpr\"}}',1675957124829,1675957124829,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('cyqg8cpi6d3bo8e4r1gxffn5tec','2023-02-09 15:38:43.936284','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Requirements sign-off','{\"contentOrder\":[\"a4tsbhyharffzzdcwyysgnnefrr\",\"74rnrembncbdjfgkzss1tjm846o\",\"azkn9xoyupffjbbzemaktz5kaer\",\"7ddrofny3s7rc7xhujw5zg4cudh\",\"7wntwictxn3gwijsazxdymc6tte\",\"7qkcmsne68py3dcytmi4mtejbga\",\"7pfjkm3y31p8mur9183h3zrk3yy\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"8\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\"}}',1675957123934,1675957123934,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('cyrh1tksy5bdsdgwejsf3uyrm8y','2023-02-09 15:38:45.260624','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Global templates','{\"contentOrder\":[\"aedojoppjspramkzqucy4wb3cyc\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"a6ghze4iy441qhsh3eijnc8hwze\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"2\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957125259,1675957125259,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('v1cwmbmhy93nzfqr33jy7cwb9ka','2023-02-09 15:38:46.003296','',1,'view','Competitor List','{\"cardOrder\":[\"cdqwjs75oxjdpuk8ibqcugi3meo\",\"c4amsnwiypifnxdg7fduunean3e\",\"cc7oak87qyirgzdc8zdsz8qh1sh\",\"ciqogkfndsp8gdn6jou7ctmadoh\",\"c9jyoy49o9ifbxctj3rnsxcd5dr\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":210,\"a1semdhszu1rq17d7et5ydrqqio\":121,\"aapogff3xoa8ym7xf56s87kysda\":194,\"ahzspe59iux8wigra8bg6cg18nc\":156,\"aiefo7nh9jwisn8b4cgakowithy\":155,\"aozntq4go4nkab688j1s7stqtfc\":151,\"az3jkw3ynd3mqmart7edypey15e\":145},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"ahzspe59iux8wigra8bg6cg18nc\",\"aozntq4go4nkab688j1s7stqtfc\",\"aiefo7nh9jwisn8b4cgakowithy\",\"a6cwaq79b1pdpb97wkanmeyy4er\",\"an1eerzscfxn6awdfajbg41uz3h\",\"a1semdhszu1rq17d7et5ydrqqio\",\"aapogff3xoa8ym7xf56s87kysda\",\"az3jkw3ynd3mqmart7edypey15e\"]}',1675957126002,1675957126002,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('v6quh5pqzn7fe9e9b5sq7bz7qbo','2023-02-09 15:38:42.018581','',1,'view','All Contacts','{\"cardOrder\":[\"c49nb54ueeprz589qo735319hqo\",\"cuow7xsfr6jdzzpsz9q541d4sth\",\"c7sed4gkoe3bxif9ewg1yq36r8w\",\"ceq73enymxtfhzemaau1k75c3ko\",\"ce7totp851pn8fc16szcfdnthny\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":240,\"a1438fbbhjeffkexmcfhnx99o1h\":151,\"a5hwxjsmkn6bak6r7uea5bx1kwc\":132,\"abru6tz8uebdxy4skheqidh7zxy\":247,\"adtf1151chornmihz4xbgbk9exa\":125,\"aejo5tcmq54bauuueem9wc4fw4y\":127,\"ahf43e44h3y8ftanqgzno9z7q7w\":129,\"ainpw47babwkpyj77ic4b9zq9xr\":157,\"amahgyn9n4twaapg3jyxb6y4jic\":224,\"amba7ot98fh7hwsx8jdcfst5g7h\":171,\"aoheuj1f3mu6eehygr45fxa144y\":130,\"auhf91pm85f73swwidi4wid8jqe\":157},\"defaultTemplateId\":\"cc4opygf357gg3gxwhrtg59r99y\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a5hwxjsmkn6bak6r7uea5bx1kwc\",\"aoheuj1f3mu6eehygr45fxa144y\",\"aro91wme9kfaie5ceu9qasmtcnw\",\"ainpw47babwkpyj77ic4b9zq9xr\",\"ahf43e44h3y8ftanqgzno9z7q7w\",\"amahgyn9n4twaapg3jyxb6y4jic\",\"abru6tz8uebdxy4skheqidh7zxy\",\"a1438fbbhjeffkexmcfhnx99o1h\",\"auhf91pm85f73swwidi4wid8jqe\",\"adtf1151chornmihz4xbgbk9exa\",\"aejo5tcmq54bauuueem9wc4fw4y\",\"amba7ot98fh7hwsx8jdcfst5g7h\"]}',1675957122015,1675957122015,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('v8jqpjxs1ojnkzjmf8bqk9xpzeo','2023-02-09 15:38:45.763620','',1,'view','All Users','{\"cardOrder\":[\"cdyoz55rinbbm8y3u3zsqybxzsw\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280,\"aaebj5fyx493eezx6ukxiwydgty\":146,\"acjq4t5ymytu8x1f68wkggm7ypc\":222,\"akrxgi7p7w14fym3gbynb98t9fh\":131,\"atg9qu6oe4bjm8jczzsn71ff5me\":131},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"akrxgi7p7w14fym3gbynb98t9fh\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"aaebj5fyx493eezx6ukxiwydgty\",\"akrxgi7p7w14fym3gbynb98t9fh\",\"atg9qu6oe4bjm8jczzsn71ff5me\",\"acjq4t5ymytu8x1f68wkggm7ypc\",\"aphio1s5gkmpdbwoxynim7acw3e\",\"aqafzdeekpyncwz7m7i54q3iqqy\",\"aify3r761b9w43bqjtskrzi68tr\"]}',1675957125762,1675957125762,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('v8wyenmx56ibw3brhiwixebqi3w','2023-02-09 15:38:43.584271','bbn1888mprfrm5fjw9f1je9x3xo',1,'view','Board View','{\"cardOrder\":[\"cygpgny1h9td5ufxg45tbq88ujy\",\"cnqf1zimzjbbjpjxpf31ciaotgc\",\"ctytybwsz4fybiyxo3hxu6skzpw\",\"c3f1ep3c97pfkzcijzknob4ukpe\",\"czowhma7rnpgb3eczbqo3t7fijo\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a9zf59u8x1rf4ywctpcqama7tio\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"an51dnkenmoog9cetapbc4uyt3y\",\"afpy8s7i45frggprmfsqngsocqh\",\"aj4jyekqqssatjcq7r7chmy19ey\",\"\"],\"visiblePropertyIds\":[\"a9zf59u8x1rf4ywctpcqama7tio\"]}',1675957123583,1675957123583,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('v98swgoxw9bgbfeuk33iympkita','2023-02-09 15:38:44.890222','bm4ubx56krp4zwyfcqh7nxiigbr',1,'view','Departments','{\"cardOrder\":[\"cpa534b5natgmunis8u1ixb55pw\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"azzbawji5bksj69sekcs4srm1ky\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aw5i7hmpadn6mbwbz955ubarhme\",\"afkxpcjqjypu7hhar7banxau91h\",\"aehoa17cz18rqnrf75g7dwhphpr\",\"agrfeaoj7d8p5ianw5iaf3191ae\",\"agm9p6gcq15ueuzqq3wd4be39wy\",\"aucop7kw6xwodcix6zzojhxih6r\",\"afust91f3g8ht368mkn5x9tgf1o\",\"acocxxwjurud1jixhp7nowdig7y\"],\"visiblePropertyIds\":[]}',1675957124888,1675957124888,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('vazascee4rin1mckqntttf3ykno','2023-02-09 15:38:45.069486','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','By Date','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d6b1249b-bc18-45fc-889e-bec48fce80ef\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"9a090e33-b110-4268-8909-132c5002c90e\",\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"6e7139e4-5358-46bb-8c01-7b029a57b80a\",\"d5371c63-66bf-4468-8738-c4dc4bea4843\",\"\"],\"visiblePropertyIds\":[\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\"]}',1675957125068,1675957125068,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('vcqpjbntc9in1dndi35yuwmmmcc','2023-02-09 15:38:47.299355','buixxjic3xjfkieees4iafdrznc',1,'view','Onboarding','{\"cardOrder\":[\"cjtnba6s7f7gqdeedbh7wsi9wmy\",\"cj1km8t149jfb7dd9cr5dsfu6ge\",\"cq4c7epp1ubbetm438oi5qmafba\",\"cdr1mhwde87n7zd64j74exwkchy\",\"cmbff37bue7yrbg691t35b65c7r\",\"cgscdkccnbfgzbeptndqxomibhc\",\"cbmrscrph3tymfkbr9dba5asgnr\",\"crk5mmf4zgtyix8khnfwsoje4ca\",\"cxpohc37ix7yndjjyqj4d777cwr\",\"ctatxjxc1c7nqxnstzewk5nzawh\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aqb5x3pt87dcc9stbk4ofodrpoy\",\"a1mtm777bkagq3iuu7xo9b13qfr\",\"auxbwzptiqzkii5r61uz3ndsy1r\",\"aj9386k1bx8qwmepeuxg3b7z4pw\"],\"visiblePropertyIds\":[]}',1675957127297,1675957127297,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('vdmngn77y9bbpmkb3x4sbd497nw','2023-02-09 15:38:46.276286','brs9cdimfw7fodyi7erqt747rhc',1,'view','By Status','{\"cardOrder\":[null,\"cdbfkd15d6iy18rgx1tskmfsr6c\",\"cn8yofg9rtkgmzgmb5xdi56p3ic\",\"csgsnnywpuqzs5jgq87snk9x17e\",\"cqwaytore5y487wdu8zffppqnea\",null],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"awna1nuarjca99m9s4uiy9kwj5h\",\"a9ana1e9w673o5cp8md4xjjwfto\",\"apy9dcd7zmand615p3h53zjqxjh\",\"acri4cm3bmay55f7ksztphmtnga\",\"amsowcd9a8e1kid317r7ttw6uzh\",\"\"],\"visiblePropertyIds\":[\"ab6mbock6styfe6htf815ph1mhw\"]}',1675957126274,1675957126274,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('ve5iu4a8iypyj8dc6npby3zmate','2023-02-09 15:38:46.760612','bui5izho7dtn77xg3thkiqprc9r',1,'view','Board: Status','{\"cardOrder\":[\"cncdr6c56zpgh5xnxy1ws4syt8y\",\"cm4w7cc3aac6s9jdcujbs4j8f4r\",\"c6egh6cpnj137ixdoitsoxq17oo\",\"cct9u78utsdyotmejbmwwg66ihr\",\"cmft87it1q7yebbd51ij9k65xbw\",\"c9fe77j9qcruxf4itzib7ag6f1c\",\"coup7afjknqnzbdwghiwbsq541w\",\"c5ex1hndz8qyc8gx6ofbfeksftc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"849766ba-56a5-48d1-886f-21672f415395\",\"\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957126759,1675957126759,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('vfoo31cqxijgomfgioq4xuqigpw','2023-02-09 15:38:44.816961','',1,'view','By Objectives','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":387,\"a17ryhi1jfsboxkwkztwawhmsxe\":134,\"a6amddgmrzakw66cidqzgk6p4ge\":183,\"aqxyzkdrs4egqf7yk866ixkaojc\":100},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a6amddgmrzakw66cidqzgk6p4ge\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a6amddgmrzakw66cidqzgk6p4ge\",\"a17ryhi1jfsboxkwkztwawhmsxe\",\"azzbawji5bksj69sekcs4srm1ky\",\"adp5ft3kgz7r5iqq3tnwg551der\",\"aqxyzkdrs4egqf7yk866ixkaojc\",\"adu6mebzpibq6mgcswk69xxmnqe\",\"asope3bddhm4gpsng5cfu4hf6rh\",\"ajwxp866f9obs1kutfwaa5ru7fe\",\"azqnyswk6s1boiwuthscm78qwuo\",\"ahz3fmjnaguec8hce7xq3h5cjdr\",\"a17bfcgnzmkwhziwa4tr38kiw5r\"]}',1675957124815,1675957124814,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('vfrebrigddprbjmdx3h633bb3tr','2023-02-09 15:38:47.274390','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Table View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280,\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":100,\"acypkejeb5yfujhj9te57p9kaxw\":169},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"aqh13jabwexjkzr3jqsz1i1syew\",\"acmg7mz1rr1eykfug4hcdpb1y1o\",\"acypkejeb5yfujhj9te57p9kaxw\"]}',1675957127272,1675957127272,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('vh7zwzax9m7ggzraf388x1sycmc','2023-02-09 15:38:43.573796','bbn1888mprfrm5fjw9f1je9x3xo',1,'view','List View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a9zf59u8x1rf4ywctpcqama7tio\",\"abthng7baedhhtrwsdodeuincqy\"]}',1675957123572,1675957123572,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('vismuja8y8bdmbpb1ofuytqjmcw','2023-02-09 15:38:46.303816','brs9cdimfw7fodyi7erqt747rhc',1,'view','Content List','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":322,\"ab6mbock6styfe6htf815ph1mhw\":229,\"aysx3atqexotgwp5kx6h5i5ancw\":208},\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"a39x5cybshwrbjpc3juaakcyj6e\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"ae9ar615xoknd8hw8py7mbyr7zo\",\"aysx3atqexotgwp5kx6h5i5ancw\",\"ab6mbock6styfe6htf815ph1mhw\",\"ao44fz8nf6z6tuj1x31t9yyehcc\",\"a39x5cybshwrbjpc3juaakcyj6e\",\"agqsoiipowmnu9rdwxm57zrehtr\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\"]}',1675957126302,1675957126302,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('vj15bp44ztbbjfcom3mb1e9fzjh','2023-02-09 15:38:47.282440','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"acmg7mz1rr1eykfug4hcdpb1y1o\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957127280,1675957127280,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('vjin4nxaxkbbcmcazmpnmn99azr','2023-02-09 15:38:43.956638','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Project Priorities','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{\"\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"87f59784-b859-4c24-8ebe-17c766e081dd\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"98a57627-0f76-471d-850d-91f3ed9fd213\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"}},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\",\"87f59784-b859-4c24-8ebe-17c766e081dd\",\"98a57627-0f76-471d-850d-91f3ed9fd213\",\"\"],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675957123955,1675957123955,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('vjtorbhhbxp8x7p47y3w41w7m1a','2023-02-09 15:38:46.736385','bui5izho7dtn77xg3thkiqprc9r',1,'view','Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a4378omyhmgj3bex13sj4wbpfiy\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957126734,1675957126734,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('vjy9b7qm8btf77cazpuaqar93cy','2023-02-09 15:38:43.964662','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Progress Tracker','{\"cardOrder\":[\"crydizwwgwfrtjemgykge11ifmy\",\"cyqg8cpi6d3bo8e4r1gxffn5tec\",\"cgmghb9uqnfyozy77qed7ctu8no\",\"crnc89prmbtg98ms9i97rtm8x6o\",\"c1bmjmuj9d7dqbp6q683fbwhioo\",\"coxnjt3ro1in19dd1e3awdt338r\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{\"\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"adeo5xuwne3qjue83fcozekz8ko\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"afi4o5nhnqc3smtzs1hs3ij34dh\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ahpyxfnnrzynsw3im1psxpkgtpe\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ar6b8m3jxr3asyxhr8iucdbo6yc\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ayz81h9f3dwp7rzzbdebesc7ute\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"}},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"ayz81h9f3dwp7rzzbdebesc7ute\",\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"afi4o5nhnqc3smtzs1hs3ij34dh\",\"adeo5xuwne3qjue83fcozekz8ko\",\"ahpyxfnnrzynsw3im1psxpkgtpe\",\"\"],\"visiblePropertyIds\":[\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675957123963,1675957123963,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('vkaec3ssdutrn9c9ydtnbf1graa','2023-02-09 15:38:45.175018','',1,'view','By Sprint','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{\"ai7ajsdk14w7x5s8up3dwir77te\":\"count\"},\"columnWidths\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":128,\"50117d52-bcc7-4750-82aa-831a351c44a0\":126,\"__title\":280,\"a1g6i613dpe9oryeo71ex3c86hy\":159,\"aeomttrbhhsi8bph31jn84sto6h\":141,\"ax9f8so418s6s65hi5ympd93i6a\":183,\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":100},\"defaultTemplateId\":\"c9wgkprk3ipn18ky1qhq1m841gy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"60985f46-3e41-486e-8213-2b987440ea1c\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"aphg37f7zbpuc3bhwhp19s1ribh\",\"a4378omyhmgj3bex13sj4wbpfiy\",\"ai7ajsdk14w7x5s8up3dwir77te\",\"a1g6i613dpe9oryeo71ex3c86hy\",\"aeomttrbhhsi8bph31jn84sto6h\",\"ax9f8so418s6s65hi5ympd93i6a\"]}',1675957125173,1675957125173,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('vkoz8sdnnaffc9ymppgm5bkc8ho','2023-02-09 15:38:43.982865','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Task Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a3zsw7xs8sxy7atj8b6totp3mby\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957123981,1675957123981,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('vksi9ioijkpgn9bf7g79kaea3qr','2023-02-09 15:38:43.973111','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Task Overview','{\"cardOrder\":[\"c1bmjmuj9d7dqbp6q683fbwhioo\",\"crnc89prmbtg98ms9i97rtm8x6o\",\"cgmghb9uqnfyozy77qed7ctu8no\",\"crydizwwgwfrtjemgykge11ifmy\",\"cyqg8cpi6d3bo8e4r1gxffn5tec\",\"cz8p8gofakfby8kzz83j97db8ph\",\"ce1jm5q5i54enhuu4h3kkay1hcc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"sum\"},\"columnWidths\":{\"2a5da320-735c-4093-8787-f56e15cdfeed\":196,\"__title\":280,\"a8daz81s4xjgke1ww6cwik5w7ye\":139,\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":141,\"d3d682bf-e074-49d9-8df5-7320921c2d23\":110},\"defaultTemplateId\":\"czw9es1e89fdpjr7cqptr1xq7qh\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"2a5da320-735c-4093-8787-f56e15cdfeed\",\"a3zsw7xs8sxy7atj8b6totp3mby\",\"axkhqa4jxr3jcqe4k87g8bhmary\",\"a7gdnz8ff8iyuqmzddjgmgo9ery\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675957123971,1675957123971,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('vmdwnoqhp5pb97845qkf8qhiqmw','2023-02-09 15:38:46.011025','',1,'view','Market Position','{\"cardOrder\":[\"cip8b4jcomfr7by9gtizebikfke\",\"cacs91js1hb887ds41r6dwnd88c\",\"ca3u8edwrof89i8obxffnz4xw3a\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"arfjpz9by5car71tz3behba8yih\",\"abajmr34b8g1916w495xjb35iko\",\"abt79uxg5edqojsrrefcnr4eruo\",\"aipf3qfgjtkheiayjuxrxbpk9wa\"],\"visiblePropertyIds\":[]}',1675957126009,1675957126009,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('voudpr9m9bjbrtrbune39izez1y','2023-02-09 15:38:44.809816','',1,'view','By Quarter','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":452,\"a17ryhi1jfsboxkwkztwawhmsxe\":148,\"a6amddgmrzakw66cidqzgk6p4ge\":230,\"azzbawji5bksj69sekcs4srm1ky\":142},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"aqxyzkdrs4egqf7yk866ixkaojc\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a6amddgmrzakw66cidqzgk6p4ge\",\"a17ryhi1jfsboxkwkztwawhmsxe\",\"azzbawji5bksj69sekcs4srm1ky\",\"adp5ft3kgz7r5iqq3tnwg551der\",\"aqxyzkdrs4egqf7yk866ixkaojc\",\"adu6mebzpibq6mgcswk69xxmnqe\",\"asope3bddhm4gpsng5cfu4hf6rh\",\"ajwxp866f9obs1kutfwaa5ru7fe\",\"azqnyswk6s1boiwuthscm78qwuo\",\"ahz3fmjnaguec8hce7xq3h5cjdr\",\"a17bfcgnzmkwhziwa4tr38kiw5r\"]}',1675957124808,1675957124808,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('voyno1sepd78jzxbu9zpq8tw4dy','2023-02-09 15:38:42.034647','',1,'view','Pipeline Tracker','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"aic89a5xox4wbppi6mbyx6ujsda\",\"ah6ehh43rwj88jy4awensin8pcw\",\"aprhd96zwi34o9cs4xyr3o9sf3c\",\"axesd74yuxtbmw1sbk8ufax7z3a\",\"a5txuiubumsmrs8gsd5jz5gc1oa\",\"acm9q494bcthyoqzmfogxxy5czy\"],\"visiblePropertyIds\":[\"aro91wme9kfaie5ceu9qasmtcnw\",\"amahgyn9n4twaapg3jyxb6y4jic\"]}',1675957122031,1675957122031,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('vp6mqnpff7fgcdg4g1i9jgqn3xo','2023-02-09 15:38:46.295175','brs9cdimfw7fodyi7erqt747rhc',1,'view','Publication Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"agqsoiipowmnu9rdwxm57zrehtr\",\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957126293,1675957126293,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('vp9yycccqz3dy3gfydi1kmnqtnw','2023-02-09 15:38:46.768840','bui5izho7dtn77xg3thkiqprc9r',1,'view','List: Bugs ?','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"50117d52-bcc7-4750-82aa-831a351c44a0\":145,\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"values\":[\"1fdbb515-edd2-4af5-80fc-437ed2211a49\"]}],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957126767,1675957126767,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('vqhw65ie4niyw5xsn84do5oapaa','2023-02-09 15:38:41.333906','b7wnw9awd4pnefryhq51apbzb4c',1,'view','Discussion Items','{\"cardOrder\":[\"cjpkiya33qsagr4f9hrdwhgiajc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"4cf1568d-530f-4028-8ffd-bdc65249187e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"4cf1568d-530f-4028-8ffd-bdc65249187e\"]}',1675957121332,1675957121332,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('vs9fpcw9uwfb4zxrnyb5bu7hqmc','2023-02-09 15:38:45.821554','bixohg18tt11in4qbtinimk974y',1,'view','By Status','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"af6hjb3ysuaxbwnfqpby4wwnkdr\",\"aotxum1p5bw3xuzqz3ctjw66yww\",\"a7yq89whddzob1futao4rxk3yzc\",\"aseqq9hrsua56r3s6nbuirj9eec\",\"ap93ysuzy1xa7z818r6myrn4h4y\"],\"visiblePropertyIds\":[]}',1675957125820,1675957125820,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('vsduwy3mq3bgkpqtanncct5ab3e','2023-02-09 15:38:46.744279','bui5izho7dtn77xg3thkiqprc9r',1,'view','Board: Sprints','{\"cardOrder\":[\"cncdr6c56zpgh5xnxy1ws4syt8y\",\"cp6ireo8debnc7q9jpfbeu5gwth\",\"cpiw648g9s3dqiqs3sxup3n7qec\",\"cjd9omd3z8tgh3yc8g94zqiukrr\",\"c8ykbwa643fy6tk5btqmbzteiyh\",\"c16iiiyo9xjyitrhaa4r7qwrcgh\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"60985f46-3e41-486e-8213-2b987440ea1c\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957126742,1675957126742,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('vt7kwb3cbsty1jrqji7fiyoos5r','2023-02-09 15:38:46.753194','bui5izho7dtn77xg3thkiqprc9r',1,'view','List: Tasks ?','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"50117d52-bcc7-4750-82aa-831a351c44a0\":139,\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"values\":[\"6eea96c9-4c61-4968-8554-4b7537e8f748\"]}],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"reversed\":true}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957126751,1675957126751,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('vu88p6t3xk3ri7duubym9jxd3zy','2023-02-09 15:38:45.053121','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','By Status','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"77c539af-309c-4db1-8329-d20ef7e9eacd\",\"98bdea27-0cce-4cde-8dc6-212add36e63a\",\"\"],\"visiblePropertyIds\":[\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\"]}',1675957125051,1675957125051,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('vu9twba3supdh3f5m5m4gk5dqrc','2023-02-09 15:38:45.812879','bh4pkixqsjift58e1qy6htrgeay',1,'view','By Date','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"akrxgi7p7w14fym3gbynb98t9fh\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957125811,1675957125811,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('vunuks7tjatyjz8j9n5b4xxajja','2023-02-09 15:38:47.290869','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Gallery View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"gallery\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957127289,1675957127289,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('vuqgft1upw7y9myqydgbm81tonr','2023-02-09 15:38:46.287422','brs9cdimfw7fodyi7erqt747rhc',1,'view','Due Date Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a39x5cybshwrbjpc3juaakcyj6e\",\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957126285,1675957126285,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('vwt4ikwyo3br3tn7wptnzabyske','2023-02-09 15:38:45.060980','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"ajy6xbebzopojaenbnmfpgtdwso\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957125059,1675957125059,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('vxrjb64ap4pb5br9ukco4g36rjy','2023-02-09 15:38:46.556601','bjbhs6bos3m8zjouf78xceg9nqw',1,'view','Board view','{\"cardOrder\":[\"cniwb8xwcqtbstbcm3sdfrr854h\",\"cs4qwpzr65fgttd7364dicskanh\",\"c9s78pzbdg3g4jkcdjqahtnfejc\",\"c8utmazns878jtfgtf7exyi9pee\",\"cnobejmb6bf8e3c1w7em5z4pwyh\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aok6pgecm85qe9k5kcphzoe63ma\",\"aq1dwbf661yx337hjcd5q3sbxwa\",\"ar87yh5xmsswqkxmjq1ipfftfpc\",\"akj3fkmxq7idma55mdt8sqpumyw\"],\"visiblePropertyIds\":[\"aspaay76a5wrnuhtqgm97tt3rer\"]}',1675957126555,1675957126555,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('vyxuq3nrpc3fzz8worq116qny7a','2023-02-09 15:38:42.092475','bzwb99zf498tsm7mjqbiy7g81ze',1,'view','Open Deals','{\"cardOrder\":[\"cuow7xsfr6jdzzpsz9q541d4sth\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"a5hwxjsmkn6bak6r7uea5bx1kwc\",\"values\":[\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"aic89a5xox4wbppi6mbyx6ujsda\",\"ah6ehh43rwj88jy4awensin8pcw\",\"aprhd96zwi34o9cs4xyr3o9sf3c\",\"axesd74yuxtbmw1sbk8ufax7z3a\"]}],\"operation\":\"and\"},\"groupById\":\"aro91wme9kfaie5ceu9qasmtcnw\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"apjnaggwixchfxwiatfh7ey7uno\",\"apiswzj7uiwbh87z8dw8c6mturw\",\"auu9bfzqeuruyjwzzqgz7q8apuw\",\"\"],\"visiblePropertyIds\":[]}',1675957122091,1675957122090,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('vzi3st7ph4bne9mxymhceyt4eey','2023-02-09 15:38:45.289863','bgi1yqiis8t8xdqxgnet8ebutky',1,'view','By Type','{\"cardOrder\":[\"csbgswatyspdiuknhxrfx4muwxa\",\"cdwyteuoeajf6dnjozotzgrtoco\",\"cafmdcqpeupyd3rhzyigdz3mcmh\",\"cekput58kh3n4jf5cf9neytx4hc\",\"cyrh1tksy5bdsdgwejsf3uyrm8y\",\"cbupk1g7hifncimcqp195orzqxo\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"a5yxq8rbubrpnoommfwqmty138h\",\"apht1nt5ryukdmxkh6fkfn6rgoy\",\"aiycbuo3dr5k4xxbfr7coem8ono\",\"aomnawq4551cbbzha9gxnmb3z5w\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957125288,1675957125287,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('vztfcigr65tb9tepufipu66uswh','2023-02-09 15:38:45.279563','bgi1yqiis8t8xdqxgnet8ebutky',1,'view','By Status','{\"cardOrder\":[\"cyrh1tksy5bdsdgwejsf3uyrm8y\",\"cekput58kh3n4jf5cf9neytx4hc\",\"cdwyteuoeajf6dnjozotzgrtoco\",\"csbgswatyspdiuknhxrfx4muwxa\",\"cafmdcqpeupyd3rhzyigdz3mcmh\",\"cbupk1g7hifncimcqp195orzqxo\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"abrfos7e7eczk9rqw6y5abadm1y\",\"ax8wzbka5ahs3zziji3pp4qp9mc\",\"atabdfbdmjh83136d5e5oysxybw\",\"ace1bzypd586kkyhcht5qqd9eca\",\"aay656c9m1hzwxc9ch5ftymh3nw\",\"a6ghze4iy441qhsh3eijnc8hwze\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957125277,1675957125277,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r');
/*!40000 ALTER TABLE `focalboard_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_blocks_history`
--

DROP TABLE IF EXISTS `focalboard_blocks_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_blocks_history` (
  `id` varchar(36) NOT NULL,
  `insert_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `parent_id` varchar(36) DEFAULT NULL,
  `schema` bigint(20) DEFAULT NULL,
  `type` text,
  `title` text,
  `fields` text,
  `create_at` bigint(20) DEFAULT NULL,
  `update_at` bigint(20) DEFAULT NULL,
  `delete_at` bigint(20) DEFAULT NULL,
  `root_id` varchar(36) DEFAULT NULL,
  `modified_by` varchar(36) DEFAULT NULL,
  `channel_id` varchar(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `board_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`insert_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_blocks_history`
--

LOCK TABLES `focalboard_blocks_history` WRITE;
/*!40000 ALTER TABLE `focalboard_blocks_history` DISABLE KEYS */;
INSERT INTO `focalboard_blocks_history` VALUES ('716dwrk9k1byr9mfs5ym8swr1tr','2023-02-09 15:38:47.506461','cbmrscrph3tymfkbr9dba5asgnr',1,'image','','{\"fileId\":\"74nt9eqzea3ydjjpgjtsxcjgrxc.gif\"}',1675957127503,1675957127503,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('71ddc8fzu9p8x8f8xucmjqcddye','2023-02-09 15:38:42.176846','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Post-sales follow up','{}',1675957122173,1675957122173,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('71xatgq9j1pr4tdo7meq6r56ypo','2023-02-09 15:38:41.559007','cbfwysn4hytfzjrkrz4rwsxoypy',1,'divider','','{}',1675957121553,1675957121553,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7353agjgjnbgqie6xoaafn1ufqa','2023-02-09 15:38:42.202538','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Send initial email','{\"value\":true}',1675957122198,1675957122198,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7355dznz4gbynipfj7hw7xgtf6h','2023-02-09 15:38:41.550119','cbfwysn4hytfzjrkrz4rwsxoypy',1,'checkbox','','{\"value\":false}',1675957121546,1675957121546,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('73dk9foche3rn7gq6shxi81dcoy','2023-02-09 15:38:47.356728','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','@mention teammates so they can follow, and collaborate on, comments and descriptions','{\"value\":false}',1675957127353,1675957127353,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('73eh34rr4m7biibwb73k4fmeg5o','2023-02-09 15:38:42.268237','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Schedule demo','{\"value\":true}',1675957122264,1675957122264,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('73htx759e1jbbzdzyze6j6psjxy','2023-02-09 15:38:42.120142','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Send proposal','{\"value\":true}',1675957122116,1675957122116,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('73qroj7qdtpb49jcqoicjw65y9r','2023-02-09 15:38:44.156810','crydizwwgwfrtjemgykge11ifmy',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957124152,1675957124152,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('73xmo3qsoy3yauju46fh69udcar','2023-02-09 15:38:47.362738','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Manage deadlines and milestones','{\"value\":false}',1675957127359,1675957127359,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('73xt4fmtc3jgc9y3he5xzwpiefa','2023-02-09 15:38:46.323305','csdmaxaygtbbdpecywm73rureor',1,'image','','{\"fileId\":\"7y5kr8x8ybpnwdykjfuz57rggrh.png\"}',1675957126319,1675957126319,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('74dnu3h6j87yzfxcj958sjiuhsc','2023-02-09 15:38:41.423342','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675957121417,1675957121417,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('74kak7ugwwtgg7jc8a8du3wpqow','2023-02-09 15:38:42.555869','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Post-sales follow up','{}',1675957122552,1675957122552,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('74qzhfq1hbp8z7qawbiepbzcawr','2023-02-09 15:38:42.746038','c49nb54ueeprz589qo735319hqo',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675957122742,1675957122742,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('74rnrembncbdjfgkzss1tjm846o','2023-02-09 15:38:44.115710','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'divider','','{}',1675957124111,1675957124111,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('74w314tfrffy78jyjzan1637yoe','2023-02-09 15:38:45.413553','cb5rd3k6997nezrcdak599yur7e',1,'image','','{\"fileId\":\"7tmfu5iqju3n1mdfwi5gru89qmw.png\"}',1675957125409,1675957125409,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('75tjroxsot3r5mpyasrccd1tnqw','2023-02-09 15:38:42.318638','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Send initial email','{\"value\":true}',1675957122315,1675957122315,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('765539ahrb7fqf8upba1zj1waqr','2023-02-09 15:38:42.667459','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675957122662,1675957122662,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('76616kunmejdu5qosasw9wmo4ee','2023-02-09 15:38:44.163510','crydizwwgwfrtjemgykge11ifmy',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124159,1675957124159,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('767hrhq4irtf9unxnh1mozpdp7y','2023-02-09 15:38:41.494281','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'checkbox','','{\"value\":false}',1675957121490,1675957121490,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('76fxqzgf6oby4xe3xzdezhdjasr','2023-02-09 15:38:43.607163','cnqf1zimzjbbjpjxpf31ciaotgc',1,'checkbox','Internet','{\"value\":true}',1675957123604,1675957123604,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('76g3iyjhxdpymuygf4gsf9j79pa','2023-02-09 15:38:42.372861','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Schedule demo','{\"value\":true}',1675957122369,1675957122369,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('76jpxhzk7u3rziessrp4pf6oocy','2023-02-09 15:38:42.643797','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675957122640,1675957122640,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('76k47w8b1i784tf9j9o99uh4yyr','2023-02-09 15:38:42.540098','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Send proposal','{}',1675957122536,1675957122536,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('76n3qjd33gigb7rm6b5nq8qjpba','2023-02-09 15:38:42.473263','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Send follow-up email','{\"value\":true}',1675957122470,1675957122470,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('76prpfjt7ktfrixguqmfr9ttnhc','2023-02-09 15:38:46.872478','cjd9omd3z8tgh3yc8g94zqiukrr',1,'image','','{\"fileId\":\"7pbp4qg415pbstc6enzeicnu3qh.png\"}',1675957126869,1675957126869,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('76uruixptajffzndrfqfznqqixr','2023-02-09 15:38:41.485883','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'divider','','{}',1675957121480,1675957121480,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('76z73gkejojr3xjruhnezkiauoy','2023-02-09 15:38:41.615694','cnuqebsb6ubgmmpbpsuun5rs11o',1,'checkbox','','{\"value\":false}',1675957121610,1675957121610,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('773ffxtiimbretrcmdd4m9cu98y','2023-02-09 15:38:41.452731','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675957121448,1675957121448,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('77fc5jnmscpfd7xoyerwysfboeo','2023-02-09 15:38:43.624141','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Bread','{\"value\":false}',1675957123622,1675957123622,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('77p1rh34rxb8etcpzs495tpp3qy','2023-02-09 15:38:47.479111','cgscdkccnbfgzbeptndqxomibhc',1,'image','','{\"fileId\":\"78jws5m1myf8pufewzkaa6i11sc.gif\"}',1675957127476,1675957127476,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('77swm19jjybfrddzyyx3uq9fdrr','2023-02-09 15:38:42.731482','c49nb54ueeprz589qo735319hqo',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675957122727,1675957122727,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('77xcztkfy1iy43fhet3q8wgf6dr','2023-02-09 15:38:43.641465','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Eggs','{\"value\":false}',1675957123638,1675957123638,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('77xoe4cfio3bzm84rwi6c487fxr','2023-02-09 15:38:42.466276','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675957122462,1675957122462,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('787juff6143nmppbjgr3qqiyz3c','2023-02-09 15:38:42.355182','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675957122350,1675957122350,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('787mcbtsteideuro4yme46gugze','2023-02-09 15:38:42.111613','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Send follow-up email','{\"value\":true}',1675957122107,1675957122107,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('78iy7q6b8r7r79b9f8f6yg67ore','2023-02-09 15:38:42.381422','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Hand-off to customer success','{\"value\":true}',1675957122376,1675957122376,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('78zqqipq9iifzdgxym93fzomq1c','2023-02-09 15:38:42.259254','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Post-sales follow up','{}',1675957122250,1675957122250,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('791sjce7anpbb8gx7gipzhw4kba','2023-02-09 15:38:42.129926','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Finalize contract','{}',1675957122124,1675957122124,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('794s61rfxcfbcuj1ed1c9dzgwhh','2023-02-09 15:38:42.458742','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Send initial email','{\"value\":true}',1675957122454,1675957122454,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('797aty5ck67b3mdqyhhnpip185h','2023-02-09 15:38:42.442449','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Follow up after demo','{}',1675957122439,1675957122439,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('79r9kss8uh7fx8x1doebumg6r6r','2023-02-09 15:38:42.345955','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Finalize contract','{\"value\":true}',1675957122341,1675957122341,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('79uda7c3u3fnt5czo8yzgwbmy3r','2023-02-09 15:38:42.336774','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Send proposal','{\"value\":true}',1675957122332,1675957122332,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7agfjix7uajrtmqb4m9zwa73mcc','2023-02-09 15:38:42.327017','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Send follow-up email','{\"value\":true}',1675957122323,1675957122323,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7azq9mxjretg65qmcguo9j5txjh','2023-02-09 15:38:47.317463','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Assign tasks to teammates','{\"value\":false}',1675957127312,1675957127312,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7b3uernjsz3g5uf8ui9rfhfcnto','2023-02-09 15:38:42.615388','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send initial email','{\"value\":false}',1675957122611,1675957122611,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7b5cy899pyigw5etbuknprr9u3e','2023-02-09 15:38:43.629966','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Milk','{\"value\":false}',1675957123625,1675957123625,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7b5swk943htypjmpaeipjmxhyka','2023-02-09 15:38:44.267607','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957124265,1675957124265,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7bmioqxgtuifux89c5xw3m1cb1w','2023-02-09 15:38:42.388945','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Post-sales follow up','{\"value\":true}',1675957122385,1675957122384,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7bx1dfx6dh7r6zndnmkj4x939ow','2023-02-09 15:38:41.364321','cao6e3zedf7fofqb3rqgypczpdy',1,'checkbox','','{\"value\":false}',1675957121358,1675957121358,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7c5y73xmnkjf5d84yg9n4bpkugo','2023-02-09 15:38:41.383514','cao6e3zedf7fofqb3rqgypczpdy',1,'checkbox','','{\"value\":false}',1675957121374,1675957121374,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7c9hhfm9yx7gzjkmj3weym49bqc','2023-02-09 15:38:44.219198','crnc89prmbtg98ms9i97rtm8x6o',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957124215,1675957124215,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7cab1f41eqfb6ip61p3wa31h5sa','2023-02-09 15:38:41.597958','cnuqebsb6ubgmmpbpsuun5rs11o',1,'divider','','{}',1675957121593,1675957121593,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7cmxsungmdin5fb6q4awj316axw','2023-02-09 15:38:44.169895','crydizwwgwfrtjemgykge11ifmy',1,'checkbox','...','{\"value\":false}',1675957124167,1675957124167,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7crjr47bh67bhzefirck7dcx4ke','2023-02-09 15:38:42.481240','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675957122476,1675957122476,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7cyatjjky87d7tbz5ni44mr5hhe','2023-02-09 15:38:42.245644','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Finalize contract','{}',1675957122241,1675957122241,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7cyd3zidtzpdpmnx8bemdbay6wy','2023-02-09 15:38:47.466537','ctatxjxc1c7nqxnstzewk5nzawh',1,'image','','{\"fileId\":\"7dybb6t8fj3nrdft7nerhuf784y.png\"}',1675957127463,1675957127463,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7dd4pazxmzbn4ijh487immy9tto','2023-02-09 15:38:42.169339','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675957122165,1675957122165,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7ddrofny3s7rc7xhujw5zg4cudh','2023-02-09 15:38:44.128914','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957124125,1675957124125,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7dganye7ax7rzin9f8cm3sdhtsy','2023-02-09 15:38:42.426584','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Send proposal','{}',1675957122422,1675957122422,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7dwg3qzc9epgx8yke5qsyq8c7py','2023-02-09 15:38:44.248320','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124244,1675957124244,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7e6834n16q7fupngwqx7t937aro','2023-02-09 15:38:44.211205','crnc89prmbtg98ms9i97rtm8x6o',1,'divider','','{}',1675957124207,1675957124207,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7eg55detouidh9rkezb83ibmg6o','2023-02-09 15:38:43.592297','cnqf1zimzjbbjpjxpf31ciaotgc',1,'checkbox','Utilities','{\"value\":true}',1675957123589,1675957123589,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7ernxp8enw3dy8jufuchq3kdjxh','2023-02-09 15:38:44.254872','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957124251,1675957124251,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7fnwzuaqyztfuic3cn49sc4cine','2023-02-09 15:38:47.493111','cmbff37bue7yrbg691t35b65c7r',1,'image','','{\"fileId\":\"7d6hrtig3zt8f9cnbo1um5oxx3y.gif\"}',1675957127489,1675957127489,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7frni9nmqujb79dn3cdf4zrcppy','2023-02-09 15:38:45.311385','cekput58kh3n4jf5cf9neytx4hc',1,'image','','{\"fileId\":\"7tmfu5iqju3n1mdfwi5gru89qmw.png\"}',1675957125307,1675957125307,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('7ftgmxj1ur3ydfqkgtie48cpfky','2023-02-09 15:38:42.514643','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Send initial email','{\"value\":false}',1675957122509,1675957122509,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7fxt891ntqtf98gkawcad1s1irc','2023-02-09 15:38:44.149665','crydizwwgwfrtjemgykge11ifmy',1,'divider','','{}',1675957124146,1675957124146,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7gczt6rkibbnguytsqeudbjafoc','2023-02-09 15:38:42.723353','c49nb54ueeprz589qo735319hqo',1,'checkbox','Finalize contract','{}',1675957122719,1675957122719,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7gkcjyzw3jtfspez7nusudm985w','2023-02-09 15:38:42.676003','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule demo','{\"value\":false}',1675957122672,1675957122672,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7gu9x9zr4jbgazq6pemig96qh3c','2023-02-09 15:38:42.161766','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Follow up after demo','{\"value\":true}',1675957122157,1675957122157,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7gzcf7gxw3innjqjm97zz8inuky','2023-02-09 15:38:44.077544','c1bmjmuj9d7dqbp6q683fbwhioo',1,'divider','','{}',1675957124073,1675957124073,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7h1scxz84h3bcdfrszhuti8es6r','2023-02-09 15:38:41.606098','cnuqebsb6ubgmmpbpsuun5rs11o',1,'checkbox','','{\"value\":false}',1675957121601,1675957121601,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7h3wrcjz5kfnhppkooho41tybnc','2023-02-09 15:38:41.502512','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'checkbox','','{\"value\":false}',1675957121498,1675957121498,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7h47gufr1ut8u7gw79xhioko83r','2023-02-09 15:38:42.570732','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Schedule demo','{\"value\":false}',1675957122567,1675957122567,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7h6gasqp4zjd5icoyphhae1hydr','2023-02-09 15:38:42.275808','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675957122272,1675957122272,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7h9x9r3kcgfbw9y6dmsiddbisca','2023-02-09 15:38:42.450951','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Schedule demo','{\"value\":true}',1675957122447,1675957122447,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7hc5arn1hwtb8bc7razzjauz3gr','2023-02-09 15:38:44.045558','c1bmjmuj9d7dqbp6q683fbwhioo',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957124041,1675957124041,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7hidha44ow7ns3e3731qd95k7aw','2023-02-09 15:38:43.655659','ctytybwsz4fybiyxo3hxu6skzpw',1,'image','','{\"fileId\":\"76fwrj36hptg6dywka4k5mt3sph.png\"}',1675957123652,1675957123652,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7hu5px3g37prcbpsxgtu1h8cazh','2023-02-09 15:38:42.699499','c49nb54ueeprz589qo735319hqo',1,'checkbox','Send proposal','{}',1675957122695,1675957122695,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7ie1ffsd3rjnt78hy7biwmq388a','2023-02-09 15:38:42.651405','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send proposal','{}',1675957122648,1675957122648,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7ifkkn1h9wj85up8kcqwbd6gqec','2023-02-09 15:38:47.441188','cdr1mhwde87n7zd64j74exwkchy',1,'image','','{\"fileId\":\"7ek6wbpp19jfoujs1goh6kttbby.gif\"}',1675957127438,1675957127438,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7igxh89mrdpryidtstp3rwnxhjo','2023-02-09 15:38:42.773584','c49nb54ueeprz589qo735319hqo',1,'checkbox','Send follow-up email','{\"value\":false}',1675957122769,1675957122769,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7ihw48cjrnbd1jgbeya43afmhfr','2023-02-09 15:38:42.227442','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Send proposal','{\"value\":true}',1675957122223,1675957122223,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7ij35dre9h38nux5k3kqefddhoo','2023-02-09 15:38:41.570407','cbfwysn4hytfzjrkrz4rwsxoypy',1,'checkbox','','{\"value\":false}',1675957121565,1675957121565,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7j4984i3j7jyg5pfdfp8o1ymzeh','2023-02-09 15:38:44.012933','cgmghb9uqnfyozy77qed7ctu8no',1,'checkbox','...','{\"value\":false}',1675957124008,1675957124008,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7jemzru7f1br4bbwm5k8bzfjkzy','2023-02-09 15:38:42.236935','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Hand-off to customer success','{}',1675957122232,1675957122232,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7jfofuyr1zpyx8yq9pjok6d77dc','2023-02-09 15:38:41.442845','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675957121436,1675957121436,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7jfqmks46utf8ixths7yehczj8w','2023-02-09 15:38:42.488361','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Finalize contract','{}',1675957122484,1675957122484,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7jno8da74x78zzj87pdoyckmy5y','2023-02-09 15:38:47.423094','cjtnba6s7f7gqdeedbh7wsi9wmy',1,'image','','{\"fileId\":\"7iw4rxx7jj7bypmdotd9z469cyh.png\"}',1675957127420,1675957127420,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7k7n85rq7rp8g78wtfh6s5ahhcc','2023-02-09 15:38:42.586091','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Follow up after demo','{}',1675957122582,1675957122582,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7kncbjtrbhbg99ci5kuxxhs9gko','2023-02-09 15:38:42.622207','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Post-sales follow up','{}',1675957122618,1675957122618,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7m1nb9juqij8stdt3fzton8i75y','2023-02-09 15:38:46.778560','cncdr6c56zpgh5xnxy1ws4syt8y',1,'image','','{\"fileId\":\"77pe9r4ckbin438ph3f18bpatua.png\"}',1675957126774,1675957126774,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('7m9iqg1tpr7grur8z6f7fye9nah','2023-02-09 15:38:42.219439','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Follow up after demo','{\"value\":true}',1675957122215,1675957122215,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7mcmz64jnejf98886sz1849qnsa','2023-02-09 15:38:42.707041','c49nb54ueeprz589qo735319hqo',1,'checkbox','Send initial email','{\"value\":true}',1675957122703,1675957122703,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7mgkwc7u9wpgq38c5hksj94dhzc','2023-02-09 15:38:43.600792','cnqf1zimzjbbjpjxpf31ciaotgc',1,'checkbox','Mobile phone','{\"value\":true}',1675957123597,1675957123597,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7mhbw7ea83jrd7bqp3meatdejnr','2023-02-09 15:38:42.548434','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Finalize contract','{}',1675957122544,1675957122544,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7mjsnjpr6tj81bkx4fjwdsgusuc','2023-02-09 15:38:47.401007','cxpohc37ix7yndjjyqj4d777cwr',1,'image','','{\"fileId\":\"7knxbyuiedtdafcgmropgkrtybr.gif\"}',1675957127396,1675957127396,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7mut8wzz3tty33e7bi7yj65oycr','2023-02-09 15:38:44.198427','crnc89prmbtg98ms9i97rtm8x6o',1,'checkbox','...','{\"value\":false}',1675957124194,1675957124194,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7mwz89dswkprpmq39xbfmszqena','2023-02-09 15:38:47.343782','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Set priorities and update statuses','{\"value\":false}',1675957127340,1675957127340,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7mzxwwfmp8jfozbqk6rmy4b843c','2023-02-09 15:38:43.614331','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Cereal','{\"value\":false}',1675957123610,1675957123610,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7n4effoi9m3b89rey9bc8ia4uth','2023-02-09 15:38:47.337750','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Follow cards to get notified on the latest updates','{\"value\":false}',1675957127334,1675957127334,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7nbe7oiagq7drupnp9sa66z6xac','2023-02-09 15:38:42.563752','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Send follow-up email','{\"value\":false}',1675957122559,1675957122559,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7nhpmb1utzbynmrdit3dgbtwq4a','2023-02-09 15:38:42.285368','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Send follow-up email','{\"value\":true}',1675957122281,1675957122281,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7njde1qge6tryjqfjh6a5p5qbkh','2023-02-09 15:38:42.146058','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Schedule demo','{\"value\":true}',1675957122141,1675957122141,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7nycetygujb8cdra17idsx8rczo','2023-02-09 15:38:42.435500','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Hand-off to customer success','{}',1675957122431,1675957122431,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7o4psoq571jfhbysze5ggqjpg1h','2023-02-09 15:38:44.054049','c1bmjmuj9d7dqbp6q683fbwhioo',1,'checkbox','...','{\"value\":false}',1675957124050,1675957124050,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7oapg5e5gx7ghtpxfwjf4ssbesr','2023-02-09 15:38:45.341723','csbgswatyspdiuknhxrfx4muwxa',1,'image','','{\"fileId\":\"7b9xk9boj3fbqfm3umeaaizp8qr.png\"}',1675957125336,1675957125336,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('7ofqzfmmnqjycxdba55jmm1bdba','2023-02-09 15:38:43.990851','cgmghb9uqnfyozy77qed7ctu8no',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957123987,1675957123987,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7ojrstcxjr3f1fy3859xz6jubuy','2023-02-09 15:38:42.757693','c49nb54ueeprz589qo735319hqo',1,'checkbox','Post-sales follow up','{}',1675957122752,1675957122752,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7op5gkqpjjfnj9fw6bpxq63po3h','2023-02-09 15:38:44.005231','cgmghb9uqnfyozy77qed7ctu8no',1,'divider','','{}',1675957124002,1675957124002,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7pfjkm3y31p8mur9183h3zrk3yy','2023-02-09 15:38:44.101441','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'checkbox','...','{\"value\":false}',1675957124098,1675957124098,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7pq3x1i5rpbf6xnsb9qwtgwtqqr','2023-02-09 15:38:41.511866','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'checkbox','','{\"value\":false}',1675957121506,1675957121506,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7pqq8ojniepfgfmb3uzxfns169y','2023-02-09 15:38:42.531961','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675957122527,1675957122527,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7qbxdt9fgdfytxf1ijn7z63tzde','2023-02-09 15:38:43.635539','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Bananas','{\"value\":false}',1675957123632,1675957123632,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7qiscat6oqfn4zpx4yikq73ijjw','2023-02-09 15:38:42.310359','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Follow up after demo','{\"value\":true}',1675957122306,1675957122306,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7qkcmsne68py3dcytmi4mtejbga','2023-02-09 15:38:44.122542','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124119,1675957124119,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7qkq6qoazhpytpqgeg8yugbny9y','2023-02-09 15:38:42.364938','ce7totp851pn8fc16szcfdnthny',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675957122360,1675957122360,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7rbjqxns9x3n15qgf648kkyfhjc','2023-02-09 15:38:44.070271','c1bmjmuj9d7dqbp6q683fbwhioo',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124066,1675957124066,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7rmf45fake7gjddw4oqcmcjnema','2023-02-09 15:38:44.019644','cgmghb9uqnfyozy77qed7ctu8no',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124016,1675957124016,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7rngcpz3aktnxmd94s39kenne9a','2023-02-09 15:38:44.204474','crnc89prmbtg98ms9i97rtm8x6o',1,'checkbox','[Subtask 3]','{\"value\":false}',1675957124201,1675957124201,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7rwou19t1s7gwuezy73xo3iiiga','2023-02-09 15:38:47.377923','cq4c7epp1ubbetm438oi5qmafba',1,'image','','{\"fileId\":\"74uia99m9btr8peydw7oexn37tw.gif\"}',1675957127374,1675957127374,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7s9bhmsu9rfd6xfxjgpxhzczzmr','2023-02-09 15:38:41.623924','cnuqebsb6ubgmmpbpsuun5rs11o',1,'checkbox','','{\"value\":false}',1675957121619,1675957121619,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7sdcsqkw5dpdidgkmbqryct4tay','2023-02-09 15:38:47.324310','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Create and manage checklists, like this one... :)','{\"value\":false}',1675957127321,1675957127321,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7seu89dxmdbg78xn6ffctf8qg7h','2023-02-09 15:38:41.540988','cbfwysn4hytfzjrkrz4rwsxoypy',1,'checkbox','','{\"value\":false}',1675957121536,1675957121536,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7skjpoeecabng7kd65f37qxnnpw','2023-02-09 15:38:42.738504','c49nb54ueeprz589qo735319hqo',1,'checkbox','Schedule demo','{\"value\":false}',1675957122735,1675957122735,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7so4cnboump8mi8je7j4q1nphqh','2023-02-09 15:38:42.765984','c49nb54ueeprz589qo735319hqo',1,'checkbox','Hand-off to customer success','{}',1675957122761,1675957122761,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7t1y9zzch3j8pxdpnbmkq5gnzsc','2023-02-09 15:38:42.102898','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Send initial email','{\"value\":true}',1675957122099,1675957122099,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7t5wwm6xj5fnf9q1kno9jabhejw','2023-02-09 15:38:42.658288','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Follow up after demo','{}',1675957122655,1675957122654,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7t7rzegarxfy3ieputjoxe9adiw','2023-02-09 15:38:43.998603','cgmghb9uqnfyozy77qed7ctu8no',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957123994,1675957123994,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7tdi3eqoyqi85ujjpgfoku41b7c','2023-02-09 15:38:43.620119','cygpgny1h9td5ufxg45tbq88ujy',1,'checkbox','Butter','{\"value\":false}',1675957123617,1675957123617,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('7tk1dfukn5jyuzft8nex1yrdofa','2023-02-09 15:38:42.137575','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675957122134,1675957122133,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7tspi4obsx7nijn9r3bk4bwqkuc','2023-02-09 15:38:44.226615','crnc89prmbtg98ms9i97rtm8x6o',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957124223,1675957124223,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7u5tfs9wxgfb77yuzfhdsg68rbo','2023-02-09 15:38:42.418533','cuow7xsfr6jdzzpsz9q541d4sth',1,'checkbox','Post-sales follow up','{}',1675957122414,1675957122414,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7uytuwjw3rjns7m8m7ozyocdsxr','2023-02-09 15:38:41.371345','cao6e3zedf7fofqb3rqgypczpdy',1,'divider','','{}',1675957121367,1675957121367,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7w5kznf6a8irrbg59modk68i46y','2023-02-09 15:38:47.350857','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Provide feedback and ask questions via comments','{\"value\":false}',1675957127347,1675957127347,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7wdrzh9tqh3r8iy7qq1m176nfxo','2023-02-09 15:38:42.630185','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Finalize contract','{}',1675957122626,1675957122626,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7wg4zd7fo1jghzektezx4bcwy5c','2023-02-09 15:38:46.818766','cfefgwjke6bbxpjpig618g9bpte',1,'image','','{\"fileId\":\"7pbp4qg415pbstc6enzeicnu3qh.png\"}',1675957126815,1675957126815,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('7wntwictxn3gwijsazxdymc6tte','2023-02-09 15:38:44.107910','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957124105,1675957124105,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7x4z8qu4e878nffrxq8arjrqtsy','2023-02-09 15:38:42.210607','c7sed4gkoe3bxif9ewg1yq36r8w',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675957122206,1675957122206,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7x6x5u9dhgin6jcbqhq8oz93hry','2023-02-09 15:38:42.715476','c49nb54ueeprz589qo735319hqo',1,'checkbox','Follow up after demo','{}',1675957122711,1675957122711,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7xf6p9qyaabgpzchrekipcdqncc','2023-02-09 15:38:42.636891','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send follow-up email','{\"value\":false}',1675957122633,1675957122633,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7xur9msnw13dndjyu6efjsnsp1a','2023-02-09 15:38:42.522985','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675957122519,1675957122519,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7xyrzt79gc3f7mnoqxebiecmzer','2023-02-09 15:38:41.354725','cao6e3zedf7fofqb3rqgypczpdy',1,'checkbox','','{\"value\":false}',1675957121348,1675957121348,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7y8kizaqnqpyxijaax4mfti1d6w','2023-02-09 15:38:44.176161','crydizwwgwfrtjemgykge11ifmy',1,'checkbox','[Subtask 2]','{\"value\":false}',1675957124173,1675957124173,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7yacd3twc3pfjtmf9bxuo1sioew','2023-02-09 15:38:44.260954','czw9es1e89fdpjr7cqptr1xq7qh',1,'divider','','{}',1675957124258,1675957124258,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7yhm1icoq47b3tya4zz169wyodr','2023-02-09 15:38:42.153871','ceq73enymxtfhzemaau1k75c3ko',1,'checkbox','Hand-off to customer success','{}',1675957122150,1675957122150,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7yqwufwrgptgqmn6hdod41gc5ye','2023-02-09 15:38:44.273702','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','...','{\"value\":false}',1675957124270,1675957124270,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('7yuzb4f73mpg58ganappiick8mw','2023-02-09 15:38:47.330706','cj1km8t149jfb7dd9cr5dsfu6ge',1,'checkbox','Add and update descriptions with Markdown','{\"value\":false}',1675957127327,1675957127327,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('7z3gpn7qt6fgamjpe8oh6j4ssba','2023-02-09 15:38:42.578103','cc4opygf357gg3gxwhrtg59r99y',1,'checkbox','Hand-off to customer success','{}',1675957122574,1675957122574,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7zcakwyykhiy6pcx81fhk77us7o','2023-02-09 15:38:41.411179','ch798q5ucefyobf5bymgqjt4f3h',1,'divider','','{}',1675957121407,1675957121407,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('7zhda56n3wbg1zygyotrefcj1xy','2023-02-09 15:38:42.607504','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Hand-off to customer success','{}',1675957122604,1675957122604,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('7zs5jxwg49tb47p4tcuc3hzjjde','2023-02-09 15:38:44.062163','c1bmjmuj9d7dqbp6q683fbwhioo',1,'checkbox','[Subtask 1]','{\"value\":false}',1675957124058,1675957124058,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('a1cqo496pgircbr6kw3r79arrse','2023-02-09 15:38:46.844761','c8ykbwa643fy6tk5btqmbzteiyh',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957126841,1675957126841,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('a1ojs13y56fnpuykuhh4q7ddpue','2023-02-09 15:38:42.496274','cuow7xsfr6jdzzpsz9q541d4sth',1,'text','## Checklist','{}',1675957122492,1675957122492,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('a1ynhznfjwiyctj35curz6757ah','2023-02-09 15:38:45.832788','cdyoz55rinbbm8y3u3zsqybxzsw',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675957125827,1675957125827,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('a34iyxqpgyigupm63iwjysydrqh','2023-02-09 15:38:41.632898','cnuqebsb6ubgmmpbpsuun5rs11o',1,'text','## Action Items','{}',1675957121628,1675957121628,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('a36i7x65b4ibs5etq8y5p7t9bwh','2023-02-09 15:38:46.795130','cncdr6c56zpgh5xnxy1ws4syt8y',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957126790,1675957126790,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('a3fgn3k3o1ff1mprakwekabmwkr','2023-02-09 15:38:44.234433','crnc89prmbtg98ms9i97rtm8x6o',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124231,1675957124231,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('a3hs8k9dhefnzjkoq1dy818r7dy','2023-02-09 15:38:47.513171','cbmrscrph3tymfkbr9dba5asgnr',1,'text','To mention a teammate use the **@ symbol with their username** in the comments or description section. They\'ll get a Direct Message notification via Channels and also be added as a [follower](https://docs.mattermost.com/boards/work-with-cards.html#receive-updates) to the card. \n\nWhenever any changes are made to the card, they\'ll automatically get notified on Channels.','{}',1675957127509,1675957127509,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('a3pcou8zsoigemmjcx8t5cnd3xa','2023-02-09 15:38:46.884821','cjd9omd3z8tgh3yc8g94zqiukrr',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957126881,1675957126881,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('a3rwrf9qi6tgetmp4m6m6bhy5rc','2023-02-09 15:38:45.858081','c4rgdu3x54tfcpy1z4wsatq7a7o',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675957125854,1675957125854,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('a4g3xkek31iygzr4xomnah9yf7y','2023-02-09 15:38:44.093752','c1bmjmuj9d7dqbp6q683fbwhioo',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124090,1675957124090,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('a4iau9riytb8hxgrrkid8f6xnac','2023-02-09 15:38:43.668765','ctytybwsz4fybiyxo3hxu6skzpw',1,'text','## Route','{}',1675957123665,1675957123665,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('a4tsbhyharffzzdcwyysgnnefrr','2023-02-09 15:38:44.136475','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124133,1675957124133,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('a4ugxsy1qfprc8nugxusiofemxe','2023-02-09 15:38:46.878421','cjd9omd3z8tgh3yc8g94zqiukrr',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957126875,1675957126875,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('a57zw9q969fgmtpd4kmkfzzitbh','2023-02-09 15:38:42.690619','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'text','## Notes\n[Enter notes here...]','{}',1675957122687,1675957122687,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('a5ii1xhdwj7g9iq77pibrxwssqa','2023-02-09 15:38:42.505076','cuow7xsfr6jdzzpsz9q541d4sth',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675957122500,1675957122500,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('a5kdt8sgcwf85ig5izbof7d74xh','2023-02-09 15:38:41.532158','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675957121524,1675957121524,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('a5makwszxp3gmin4b76mj7txmro','2023-02-09 15:38:45.866087','cmkaj68y4efrg9qa1wfxnpmg1sr',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675957125861,1675957125861,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('a5wia4hjzwfry7rqiyu9php8fhr','2023-02-09 15:38:45.840237','cdiyyn5idt7gg3rg5eqazep1nye',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675957125836,1675957125836,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('a5wjnpyt86fgx7fx3r1snh1eiww','2023-02-09 15:38:42.683816','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'text','## Checklist','{}',1675957122680,1675957122680,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('a6gjbdp8ud3nqpr9k3ao9ik4uoy','2023-02-09 15:38:43.662691','ctytybwsz4fybiyxo3hxu6skzpw',1,'text','## Goal\nWalk at least 10,000 steps every day.','{}',1675957123658,1675957123658,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('a6qbdm88dqpgmbp6i3s7epcr41a','2023-02-09 15:38:46.332673','csdmaxaygtbbdpecywm73rureor',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126327,1675957126327,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('a6rzpwykmyj8azgwfhhxdogmn7e','2023-02-09 15:38:47.309184','crk5mmf4zgtyix8khnfwsoje4ca',1,'text','Mattermost Boards makes it easy for you to update certain properties on cards through our drag and drop functionality. Simply drag this card from the **Later** column to the **Completed** column to automatically update the status and mark this task as complete.','{}',1675957127305,1675957127305,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('a6z8tfcfjijg5mj7rwgk7ko1bro','2023-02-09 15:38:46.853017','cidz4imnqhir48brz6e8hxhfrhy',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957126849,1675957126849,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('a7ed4q13ow3gj8ybikfwche9jda','2023-02-09 15:38:47.453765','cdr1mhwde87n7zd64j74exwkchy',1,'text','To share a card, you\'ll need to copy the card link first. You can:\n\n- Open a card and select the options menu button at the top right of the card.\n- Open the board view and hover your mouse over any card to access the options menu button.','{}',1675957127450,1675957127450,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('a9hijoe8xofrqie9r9uy1t8kp8o','2023-02-09 15:38:44.030692','cgmghb9uqnfyozy77qed7ctu8no',1,'text','## Checklist','{}',1675957124025,1675957124025,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('a9s6urkircigeurptty6sa6pege','2023-02-09 15:38:43.649373','cygpgny1h9td5ufxg45tbq88ujy',1,'text','## Grocery list','{}',1675957123645,1675957123645,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('aa4zg6ack43dgmqenna4jftqyxc','2023-02-09 15:38:45.850423','cax7uqt4jfbb8ue7j34yu1mpz1w',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675957125845,1675957125845,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('aagi9urk1cir17mbbmwahuf6ype','2023-02-09 15:38:46.075288','c4amsnwiypifnxdg7fduunean3e',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675957126071,1675957126071,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('ab9k4rceobjrwudtqkynz66zfpy','2023-02-09 15:38:47.459957','cdr1mhwde87n7zd64j74exwkchy',1,'text','Cards can be linked and shared with teammates directly on Channels. Card previews are displayed when shared on Channels, so your team can discuss work items and get the relevant context without having to switch over to Boards.','{}',1675957127457,1675957127457,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('abd3r8d6a1jf5xmwrhwowo77ssr','2023-02-09 15:38:47.519994','cbmrscrph3tymfkbr9dba5asgnr',1,'text','Collaborate with teammates directly on each card using @mentions and have all the relevant context in one place.','{}',1675957127517,1675957127517,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('abjhxhte5o3ru7m3earfrax3h1c','2023-02-09 15:38:46.084707','cc7oak87qyirgzdc8zdsz8qh1sh',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675957126079,1675957126079,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('abkhji1dcxbnf5py5hh89yn1aqc','2023-02-09 15:38:43.675323','c3f1ep3c97pfkzcijzknob4ukpe',1,'text','','{}',1675957123671,1675957123671,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('abr8coy5jpjr78khwn9ipuog8oa','2023-02-09 15:38:42.302487','c7sed4gkoe3bxif9ewg1yq36r8w',1,'text','## Checklist','{}',1675957122298,1675957122298,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('abs5kzwpo3tbejb4jytr59oqjoy','2023-02-09 15:38:41.520495','cu8a79dtcx3fd7gfsgtwtu3igfr',1,'text','## Action Items','{}',1675957121516,1675957121516,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('ac3py631whbg1bqdpjo5ifgt9uy','2023-02-09 15:38:46.367440','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126362,1675957126362,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('acwunc6z56trsufy6oos4ss9ssr','2023-02-09 15:38:45.385886','cfmk7771httynm8r7rm8cbrmrya',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957125381,1675957125381,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('adudjr3mgwbyqmb1n818f1k8d8r','2023-02-09 15:38:44.183918','crydizwwgwfrtjemgykge11ifmy',1,'text','## Checklist','{}',1675957124180,1675957124180,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('ae18goftntprhxdnj6rqruid5de','2023-02-09 15:38:41.588979','cbfwysn4hytfzjrkrz4rwsxoypy',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675957121585,1675957121585,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('ae9fbaq8pebdbbfmkhcrqq84nph','2023-02-09 15:38:45.376868','cdwyteuoeajf6dnjozotzgrtoco',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957125373,1675957125373,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('aedojoppjspramkzqucy4wb3cyc','2023-02-09 15:38:45.455642','cyrh1tksy5bdsdgwejsf3uyrm8y',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957125451,1675957125451,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('aegx8f1meuj8sff8fh7hai7ke4c','2023-02-09 15:38:46.314659','chikrbt1ocfgafjh8q8p6u83yth',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126310,1675957126310,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('aewxhyi5iktgwtn13y5t7np8boc','2023-02-09 15:38:46.890424','cwrq9ag3p5pgzzy98nfd3wwra1w',1,'text','## Summary\n*[Brief description of what this epic is about]*\n## Motivation\n*[Brief description on why this is needed]*\n## Acceptance Criteria\n- *[Criteron 1]*\n- *[Criteron 2]*\n- ...\n## Personas\n- *[Persona A]*\n- *[Persona B]*\n- ...\n## Reference Materials\n- *[Links to other relevant documents as needed]*\n- ...','{}',1675957126887,1675957126887,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('af4hte1z7wjdjtqhjp9w9bsx3nc','2023-02-09 15:38:42.782693','c49nb54ueeprz589qo735319hqo',1,'text','## Checklist','{}',1675957122777,1675957122777,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('afgaieg68zby5iyry16mn4zbymc','2023-02-09 15:38:45.369288','csbgswatyspdiuknhxrfx4muwxa',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957125365,1675957125365,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('aft57dqjwy3d4xgjn3ooqmxqmro','2023-02-09 15:38:45.463872','c3yzqoxmrgtfiu81usdcufmtusc',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957125459,1675957125459,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('afudzuo8kqbyobp5ppjziicaqxy','2023-02-09 15:38:45.438703','cafmdcqpeupyd3rhzyigdz3mcmh',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957125435,1675957125435,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('agbyoid6xz7f7jr593hdw8stbdh','2023-02-09 15:38:46.342837','csdmaxaygtbbdpecywm73rureor',1,'text','## Media','{}',1675957126337,1675957126337,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('ah4dw5eqfcpdjuqgfayojg9s5xy','2023-02-09 15:38:45.422207','cb5rd3k6997nezrcdak599yur7e',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957125418,1675957125418,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ahd5gizdxw7rexyucrx4qsuhfgc','2023-02-09 15:38:41.641620','cnuqebsb6ubgmmpbpsuun5rs11o',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675957121636,1675957121636,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('ai4nfzfhucjnx5ktyecpp15946a','2023-02-09 15:38:46.897500','cwrq9ag3p5pgzzy98nfd3wwra1w',1,'text','## Summary\n[Brief description of what this epic is about]\n\n## Motivation\n[Brief description on why this is needed]\n\n## Acceptance Criteria\n - [Criteron 1]\n - [Criteron 2]\n - ...\n\n## Personas\n - [Persona A]\n - [Persona B]\n - ...\n\n## Reference Materials\n - [Links to other relevant documents as needed]\n - ...','{}',1675957126894,1675957126894,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('aieqknjamabd5b8jf6kcknjn1ae','2023-02-09 15:38:46.830974','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\nA clear and concise description of what you expected to happen.\n\n## Edition and Platform\n\n - Edition: Personal Desktop / Personal Server / Mattermost plugin\n - Version: [e.g. v0.9.0]\n - Browser and OS: [e.g. Chrome 91 on macOS, Edge 93 on Windows]\n\n## Additional context\n\nAdd any other context about the problem here.','{}',1675957126828,1675957126828,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('aj3jx4wyogpfkpjybzgdwxjakdy','2023-02-09 15:38:44.190578','crydizwwgwfrtjemgykge11ifmy',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124187,1675957124187,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('ajekopxcqcig9tqgrtepgfx6cjh','2023-02-09 15:38:45.405712','cbupk1g7hifncimcqp195orzqxo',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675957125400,1675957125400,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ajfzxqte7cfnejqt6w8u1yhefce','2023-02-09 15:38:45.430424','cb5rd3k6997nezrcdak599yur7e',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957125426,1675957125426,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ajrm94fczmfdiugdck7cz8g7dhw','2023-02-09 15:38:46.804163','cp6ireo8debnc7q9jpfbeu5gwth',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957126800,1675957126800,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('ajrwye5cxojrw7euzh9psmpnewe','2023-02-09 15:38:46.101156','ciqogkfndsp8gdn6jou7ctmadoh',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675957126096,1675957126096,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('ajxy8i7sbfjdbbbcqgu5u36wjbo','2023-02-09 15:38:41.464285','ch798q5ucefyobf5bymgqjt4f3h',1,'text','# Action Items','{}',1675957121458,1675957121457,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('ajzrs8mpz4pd5fpr7t794pc139w','2023-02-09 15:38:42.593084','cc4opygf357gg3gxwhrtg59r99y',1,'text','## Notes\n[Enter notes here...]','{}',1675957122589,1675957122589,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('ak5p6j9onjt8gme4ges8d9suqao','2023-02-09 15:38:42.600993','cc4opygf357gg3gxwhrtg59r99y',1,'text','## Checklist','{}',1675957122597,1675957122597,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('akyg4q9i53ifnjji1ren9rm1yro','2023-02-09 15:38:47.446977','cdr1mhwde87n7zd64j74exwkchy',1,'text','After you\'ve copied the link, paste it into any channel or Direct Message to share the card. A preview of the card will display within the channel with a link back to the card on Boards.','{}',1675957127444,1675957127444,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('akyjyou7e5by47kfxfs4c5eh57c','2023-02-09 15:38:46.351541','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126347,1675957126347,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('amgcmwxa7pfdw5mpwjxowcnzote','2023-02-09 15:38:42.791183','c49nb54ueeprz589qo735319hqo',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675957122787,1675957122787,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('anutui7cr5tb33r6iu3ybr4ep6o','2023-02-09 15:38:41.402684','cao6e3zedf7fofqb3rqgypczpdy',1,'text','## Action Items','{}',1675957121398,1675957121398,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('anxnwy5irztyuzfqaeyyosy5drr','2023-02-09 15:38:42.194998','ceq73enymxtfhzemaau1k75c3ko',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675957122190,1675957122190,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('aopyofuea9byh9q1ac6tc13tmor','2023-02-09 15:38:46.860401','cidz4imnqhir48brz6e8hxhfrhy',1,'text','## Requirements\n- [Requirement 1]\n- [Requirement 2]\n- ...','{}',1675957126856,1675957126856,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('aoqmbijk7nbn13r73xd5rbu49py','2023-02-09 15:38:46.375244','cawy4iq6n1j86bq6r5nr411qixa',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126371,1675957126371,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('aoun46k7itjdxmxgd47bwstropc','2023-02-09 15:38:47.409282','cxpohc37ix7yndjjyqj4d777cwr',1,'text','Keep stakeholders and customers up-to-date on project progress by sharing your board.','{}',1675957127404,1675957127404,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aozygt5i473go7etympxjrz7zqe','2023-02-09 15:38:46.067408','cdqwjs75oxjdpuk8ibqcugi3meo',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675957126062,1675957126062,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('apc5x91maefy4ic5jwxnsduc1qo','2023-02-09 15:38:41.472596','ch798q5ucefyobf5bymgqjt4f3h',1,'text','# Notes\n*[Add meeting notes here]*','{}',1675957121468,1675957121468,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('apsu75tdob7y8xmfccz1ze34u1a','2023-02-09 15:38:46.092440','c9jyoy49o9ifbxctj3rnsxcd5dr',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n\n## Weaknesses\n- ...\n- ...\n\n## Opportunities\n- ...\n- ...\n\n## Threats\n- ...\n- ...','{}',1675957126088,1675957126088,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('apyqz6d5zat8p3p75qbogh4tc9e','2023-02-09 15:38:41.393532','cao6e3zedf7fofqb3rqgypczpdy',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675957121388,1675957121388,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('aq4n3zxsui7natpurtsrn75jhkh','2023-02-09 15:38:45.302639','c9wgkprk3ipn18ky1qhq1m841gy',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957125297,1675957125297,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('aq7xd8ex8tbrpframi4htuxs9da','2023-02-09 15:38:47.428417','cjtnba6s7f7gqdeedbh7wsi9wmy',1,'text','To create a new card, simply do any of the following:\n- Select \"**New**\" on the top right header\n- Select \"**+ New**\" below any column\n- Select \"**+**\" to the right of any columnn header','{}',1675957127425,1675957127425,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aq9774er56byu7mn7m9g1877aoy','2023-02-09 15:38:47.435381','cjtnba6s7f7gqdeedbh7wsi9wmy',1,'text','Mattermost Boards helps you manage and track all your project tasks with **Cards**.','{}',1675957127431,1675957127431,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aqa1enkxgpirkjbaku5ha4u9xsr','2023-02-09 15:38:47.499987','cmbff37bue7yrbg691t35b65c7r',1,'text','Customize cards to fit your needs and track the information most important to you. Boards supports a wide range of fully customizable property types. For example, you can:\n- Use the **Date** property for things like deadlines or milestones.\n- Assign owners to tasks with the **Person** property.\n- Define statuses and priorities with the **Select** property.\n- Create tags with the **Multi Select** property.\n- Link cards to webpages with the **URL** property.','{}',1675957127496,1675957127496,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aqiqhuzk88b8c3n8nggbgwebtne','2023-02-09 15:38:47.370609','cj1km8t149jfb7dd9cr5dsfu6ge',1,'text','Cards allow your entire team to manage and collaborate on a task in one place. Within a card, your team can:','{}',1675957127367,1675957127367,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aqmofry5yqbyi3pk6oizc8m168w','2023-02-09 15:38:47.392863','cq4c7epp1ubbetm438oi5qmafba',1,'text','To create your own board, select the \"+\" on the top of the left hand sidebar. Choose from one of our standard templates and see how they can help you get started with your next project:\n\n- **Project Tasks**: Stay on top of your project tasks, track progress, and set priorities. \n- **Meeting Agenda**: Set your meeting agendas for recurring team meetings and 1:1s.\n- **Roadmap**: Plan your roadmap and manage your releases more efficiently.\n- **Personal Tasks**: Organize your life and track your personal tasks.\n- **Content Calendar**: Plan your editorial content, assign work, and track deadlines.\n- **Personal Goals**: Set and accomplish new personal goals and milestones.','{}',1675957127389,1675957127389,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('aqrueepkznifmf8xczrxtoezdua','2023-02-09 15:38:46.383319','c7dtaxe38rjboubddzb8p7nxeso',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675957126379,1675957126379,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('ar84bfcatnf8q7fxgwsxmx6d35c','2023-02-09 15:38:44.282168','czw9es1e89fdpjr7cqptr1xq7qh',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124277,1675957124277,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('arzh4zmxdtt8mffsconizr3szpr','2023-02-09 15:38:44.288715','czw9es1e89fdpjr7cqptr1xq7qh',1,'text','## Checklist','{}',1675957124285,1675957124285,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('as4ec4494eff3ire9xxc8euqfir','2023-02-09 15:38:45.394773','cfmk7771httynm8r7rm8cbrmrya',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957125390,1675957125390,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ascyssjiewb86jfbfr5rpaf9khw','2023-02-09 15:38:42.407794','ce7totp851pn8fc16szcfdnthny',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675957122402,1675957122402,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('astcfbnhyhtnr5bs9n5yyn9pgoa','2023-02-09 15:38:42.398729','ce7totp851pn8fc16szcfdnthny',1,'text','## Checklist','{}',1675957122393,1675957122393,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('at38so4cpwif5xga7mgchdw5d8w','2023-02-09 15:38:46.812356','cpiw648g9s3dqiqs3sxup3n7qec',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675957126809,1675957126809,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('at5cgtckizfgdiycxfxogxptpph','2023-02-09 15:38:45.330450','cekput58kh3n4jf5cf9neytx4hc',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675957125324,1675957125324,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('at7wkmaa4dfgc7nuisymzsgjggy','2023-02-09 15:38:44.240661','crnc89prmbtg98ms9i97rtm8x6o',1,'text','## Checklist','{}',1675957124237,1675957124237,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('atans1en8kb8rurprh7jnubrc1r','2023-02-09 15:38:42.293580','c7sed4gkoe3bxif9ewg1yq36r8w',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675957122289,1675957122289,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('atbx14ts9hfnxzcruf165gqm9xa','2023-02-09 15:38:46.358674','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n- ...\n\n## Notes\n- ...\n- ...\n- ...','{}',1675957126355,1675957126355,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('ateb7q49pzfbfz881bntt94u9dr','2023-02-09 15:38:46.867428','c16iiiyo9xjyitrhaa4r7qwrcgh',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675957126863,1675957126863,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('athbwfmdjifdjxdao5h9cmcr6xr','2023-02-09 15:38:45.446683','cyhsz4iz5m7bjxp8xie3z8akxgw',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675957125442,1675957125442,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('au6zmhj8zi3nitdc47gep76qdao','2023-02-09 15:38:42.185826','ceq73enymxtfhzemaau1k75c3ko',1,'text','## Checklist','{}',1675957122181,1675957122181,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('au76uwhduw38a3cw7cm39p9p91h','2023-02-09 15:38:47.486548','cgscdkccnbfgzbeptndqxomibhc',1,'text','Views allow your team to visualize the same cards and data from different perspectives, so they can stay up-to-date in the way that works best for them. To add a new view, go to **Add a new view** from the view drop-down, then select from any of the following views:\n\n- **Board**: Adds a Kanban board, similar to this one, that allows your team to organize cards in swimlanes grouped by any property of your choosing. This view helps you visualize your project progress.\n- **Table**: Displays cards in a table format with rows and columns. Use this view to get an overview of all your project tasks. Easily view and compare the state of all properties across all cards without needing to open individual cards.\n- **Gallery**: Displays cards in a gallery format, so you can manage and organize cards with image attachments.\n- **Calendar**: Adds a calendar view to easily visualize your cards by dates and keep track of deadlines.','{}',1675957127482,1675957127482,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('awbmqrtbrhbdf3c1jbinsiju7je','2023-02-09 15:38:41.580349','cbfwysn4hytfzjrkrz4rwsxoypy',1,'text','## Action Items','{}',1675957121574,1675957121574,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('awhqdccbq678sfm3eiy4961cqqc','2023-02-09 15:38:47.417137','cxpohc37ix7yndjjyqj4d777cwr',1,'text','To share a board, select **Share** at the top right of the Board view. Copy the link to share the board internally with your team or generate public link that can be accessed by anyone externally.','{}',1675957127413,1675957127413,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('awjyu4pu76jykzm3t99sgcouzna','2023-02-09 15:38:45.359274','csbgswatyspdiuknhxrfx4muwxa',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957125354,1675957125354,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('awqyxdhfuhjgjbe1foei8sgkdpw','2023-02-09 15:38:46.837666','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\n*[A clear and concise description of what you expected to happen.]*\n\n## Screenshots\n\n*[If applicable, add screenshots to elaborate on the problem.]*\n\n## Edition and Platform\n\n - Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n - Version: *[e.g. v0.9.0]*\n - Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n\n*[Add any other context about the problem here.]*','{}',1675957126835,1675957126834,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('awro4hs7fppd1zx95b5yrweu38h','2023-02-09 15:38:45.320581','cekput58kh3n4jf5cf9neytx4hc',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957125316,1675957125316,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('awsm89qkiminfuddjwpzawx44pa','2023-02-09 15:38:46.825088','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Screenshots\nIf applicable, add screenshots to elaborate on the problem.','{}',1675957126821,1675957126821,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('awsqw6nxeebf75pgjfprwe135bc','2023-02-09 15:38:44.038244','cgmghb9uqnfyozy77qed7ctu8no',1,'text','## Description\n*[Brief description of this task]*','{}',1675957124034,1675957124034,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('ax557iho483ytmgwty89w8doraw','2023-02-09 15:38:44.086329','c1bmjmuj9d7dqbp6q683fbwhioo',1,'text','## Checklist','{}',1675957124083,1675957124083,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('axb7xpfyqzpbomq3df7biqf1pja','2023-02-09 15:38:46.786658','cncdr6c56zpgh5xnxy1ws4syt8y',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675957126783,1675957126783,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('ay1fowfzpkiyh8m3wa49zoii6ne','2023-02-09 15:38:47.386197','cq4c7epp1ubbetm438oi5qmafba',1,'text','A board helps you manage your project, organize tasks, and collaborate with your team all in one place.','{}',1675957127381,1675957127381,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('ayo673a5dwinb5ghrat43orq99a','2023-02-09 15:38:47.473182','ctatxjxc1c7nqxnstzewk5nzawh',1,'text','Organize and find the cards you\'re looking for with our filter, sort, and grouping options. From the Board header, you can quickly toggle on different properties, change the group display, set filters, and change how the cards are sorted.','{}',1675957127470,1675957127470,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('azkn9xoyupffjbbzemaktz5kaer','2023-02-09 15:38:44.142826','cyqg8cpi6d3bo8e4r1gxffn5tec',1,'text','## Checklist','{}',1675957124139,1675957124139,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('c16iiiyo9xjyitrhaa4r7qwrcgh','2023-02-09 15:38:46.721780','bui5izho7dtn77xg3thkiqprc9r',1,'card','Review API design','{\"contentOrder\":[\"ateb7q49pzfbfz881bntt94u9dr\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675957126718,1675957126718,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('c1bmjmuj9d7dqbp6q683fbwhioo','2023-02-09 15:38:43.931097','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Define project scope','{\"contentOrder\":[\"a4g3xkek31iygzr4xomnah9yf7y\",\"7gzcf7gxw3innjqjm97zz8inuky\",\"ax557iho483ytmgwty89w8doraw\",\"7zs5jxwg49tb47p4tcuc3hzjjde\",\"7hc5arn1hwtb8bc7razzjauz3gr\",\"7rbjqxns9x3n15qgf648kkyfhjc\",\"7o4psoq571jfhbysze5ggqjpg1h\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"32\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"87f59784-b859-4c24-8ebe-17c766e081dd\"}}',1675957123926,1675957123926,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('c3abrf7x8htr8brqmuxzm15p5gy','2023-02-09 15:38:44.842292','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Increase customer retention','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"66%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"90% customer retention rate\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"60%\",\"azzbawji5bksj69sekcs4srm1ky\":\"afkxpcjqjypu7hhar7banxau91h\"}}',1675957124839,1675957124839,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('c3f1ep3c97pfkzcijzknob4ukpe','2023-02-09 15:38:43.562766','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Feed Fluffy','{\"contentOrder\":[\"abkhji1dcxbnf5py5hh89yn1aqc\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"an51dnkenmoog9cetapbc4uyt3y\"}}',1675957123558,1675957123558,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('c3yzqoxmrgtfiu81usdcufmtusc','2023-02-09 15:38:45.272158','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Feature','{\"contentOrder\":[\"aft57dqjwy3d4xgjn3ooqmxqmro\"],\"icon\":\"?️\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675957125267,1675957125267,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('c49nb54ueeprz589qo735319hqo','2023-02-09 15:38:42.085913','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Shelby Olson','{\"contentOrder\":[\"amgcmwxa7pfdw5mpwjxowcnzote\",\"af4hte1z7wjdjtqhjp9w9bsx3nc\",\"7mcmz64jnejf98886sz1849qnsa\",\"7igxh89mrdpryidtstp3rwnxhjo\",\"74qzhfq1hbp8z7qawbiepbzcawr\",\"77swm19jjybfrddzyyx3uq9fdrr\",\"7skjpoeecabng7kd65f37qxnnpw\",\"7x6x5u9dhgin6jcbqhq8oz93hry\",\"7hu5px3g37prcbpsxgtu1h8cazh\",\"7gczt6rkibbnguytsqeudbjafoc\",\"7so4cnboump8mi8je7j4q1nphqh\",\"7ojrstcxjr3f1fy3859xz6jubuy\"],\"icon\":\"?‍♀️\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(111) 321-5678\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"abru6tz8uebdxy4skheqidh7zxy\":\"shelby.olson@email.com\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$30,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Kadera Global\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"ar6t1ttcumgfuqugg5o4g4mzrza\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"auu9bfzqeuruyjwzzqgz7q8apuw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1669291200000}\"}}',1675957122081,1675957122081,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('c4amsnwiypifnxdg7fduunean3e','2023-02-09 15:38:46.031783','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Helx Industries','{\"contentOrder\":[\"aagi9urk1cir17mbbmwahuf6ype\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abt79uxg5edqojsrrefcnr4eruo\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"650\",\"ahzspe59iux8wigra8bg6cg18nc\":\"helxindustries.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$50,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2009\",\"aozntq4go4nkab688j1s7stqtfc\":\"New York, NY\"}}',1675957126026,1675957126026,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('c4rgdu3x54tfcpy1z4wsatq7a7o','2023-02-09 15:38:45.799265','bh4pkixqsjift58e1qy6htrgeay',1,'card','Olivia Alsop','{\"contentOrder\":[\"a3rwrf9qi6tgetmp4m6m6bhy5rc\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"a7yq89whddzob1futao4rxk3yzc\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"olivia.alsop@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1671192000000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"a1sxagjgaadym5yrjak6tcup1oa\"}}',1675957125794,1675957125794,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('c6tfecdrxkprfxkjd31jwn5bkjc','2023-02-09 15:38:46.593247','bsjd59qtpbf888mqez3ge77domw',1,'card','Positive user feedback','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aq1dwbf661yx337hjcd5q3sbxwa\"}}',1675957126589,1675957126589,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('c6xxci6pge7gm3d9cuiuyigp3ah','2023-02-09 15:38:45.027886','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Run 3 times a week','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"6e7139e4-5358-46bb-8c01-7b029a57b80a\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"ffb3f951-b47f-413b-8f1d-238666728008\"}}',1675957125024,1675957125024,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('c7dtaxe38rjboubddzb8p7nxeso','2023-02-09 15:38:46.270473','brs9cdimfw7fodyi7erqt747rhc',1,'card','Unblocking Workflows: The Guide to Developer Productivity','{\"contentOrder\":[\"77tz16jtz5x73ncs3dxc3fp1d7h\",\"aqrueepkznifmf8xczrxtoezdua\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1638532800000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a3pdzi53kpbd4okzdkz6khi87zo\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"apy9dcd7zmand615p3h53zjqxjh\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1639483200000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://mattermost.com/newsroom/press-releases/mattermost-unveils-definitive-report-on-the-state-of-developer-productivity-unblocking-workflows-the-guide-to-developer-productivity-2022-edition/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"a3xky7ygn14osr1mokerbfah5cy\"}}',1675957126266,1675957126266,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('c7sed4gkoe3bxif9ewg1yq36r8w','2023-02-09 15:38:42.052548','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Richard Guzman','{\"contentOrder\":[\"atans1en8kb8rurprh7jnubrc1r\",\"abr8coy5jpjr78khwn9ipuog8oa\",\"7353agjgjnbgqie6xoaafn1ufqa\",\"7nhpmb1utzbynmrdit3dgbtwq4a\",\"7h6gasqp4zjd5icoyphhae1hydr\",\"7x4z8qu4e878nffrxq8arjrqtsy\",\"73eh34rr4m7biibwb73k4fmeg5o\",\"7m9iqg1tpr7grur8z6f7fye9nah\",\"7ihw48cjrnbd1jgbeya43afmhfr\",\"7cyatjjky87d7tbz5ni44mr5hhe\",\"7jemzru7f1br4bbwm5k8bzfjkzy\",\"78zqqipq9iifzdgxym93fzomq1c\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(222) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"axesd74yuxtbmw1sbk8ufax7z3a\",\"abru6tz8uebdxy4skheqidh7zxy\":\"richard.guzman@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1681992000000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"80%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$3,200,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Afformance Ltd.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"ar6t1ttcumgfuqugg5o4g4mzrza\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apjnaggwixchfxwiatfh7ey7uno\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1667476800000}\"}}',1675957122049,1675957122049,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('c8ykbwa643fy6tk5btqmbzteiyh','2023-02-09 15:38:46.713150','bui5izho7dtn77xg3thkiqprc9r',1,'card','Import / Export','{\"contentOrder\":[\"a1cqo496pgircbr6kw3r79arrse\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957126709,1675957126709,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('c99mzxxezxbgcbgpxqscroy4r4h','2023-02-09 15:38:44.874545','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Launch 3 key features','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"apnt1f7na9rzgk1rt49keg7xbiy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"ao9b5pxyt7tkgdohzh9oaustdhr\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"33%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"3\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"anruuoyez51r3yjxuoc8zoqnwaw\",\"azqnyswk6s1boiwuthscm78qwuo\":\"1\",\"azzbawji5bksj69sekcs4srm1ky\":\"aw5i7hmpadn6mbwbz955ubarhme\"}}',1675957124870,1675957124870,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('c9jyoy49o9ifbxctj3rnsxcd5dr','2023-02-09 15:38:46.050810','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Ositions Inc.','{\"contentOrder\":[\"apsu75tdob7y8xmfccz1ze34u1a\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abajmr34b8g1916w495xjb35iko\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"2,700\",\"ahzspe59iux8wigra8bg6cg18nc\":\"ositionsinc.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$125,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2004\",\"aozntq4go4nkab688j1s7stqtfc\":\"Berlin, Germany\"}}',1675957126045,1675957126045,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('c9wgkprk3ipn18ky1qhq1m841gy','2023-02-09 15:38:45.186576','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','User Story','{\"contentOrder\":[\"aq4n3zxsui7natpurtsrn75jhkh\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"apht1nt5ryukdmxkh6fkfn6rgoy\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675957125182,1675957125182,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ca3t3g3ioojd93qse39zgu8579w','2023-02-09 15:38:44.858103','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Increase user signups by 30%','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a6robxx81diugpjq5jkezz3j1fo\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"ao9b5pxyt7tkgdohzh9oaustdhr\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"0%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"1,000\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"0\",\"azzbawji5bksj69sekcs4srm1ky\":\"afkxpcjqjypu7hhar7banxau91h\"}}',1675957124854,1675957124854,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('cafmdcqpeupyd3rhzyigdz3mcmh','2023-02-09 15:38:45.247387','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Standard properties','{\"contentOrder\":[\"afudzuo8kqbyobp5ppjziicaqxy\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957125242,1675957125242,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('cao6e3zedf7fofqb3rqgypczpdy','2023-02-09 15:38:41.259456','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Team Schedule','{\"contentOrder\":[\"apyqz6d5zat8p3p75qbogh4tc9e\",\"7uytuwjw3rjns7m8m7ozyocdsxr\",\"anutui7cr5tb33r6iu3ybr4ep6o\",\"7bx1dfx6dh7r6zndnmkj4x939ow\",\"7xyrzt79gc3f7mnoqxebiecmzer\",\"7c5y73xmnkjf5d84yg9n4bpkugo\"],\"icon\":\"⏰\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"8b05c83e-a44a-4d04-831e-97f01d8e2003\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\"}}',1675957121254,1675957121254,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('cawy4iq6n1j86bq6r5nr411qixa','2023-02-09 15:38:46.260109','brs9cdimfw7fodyi7erqt747rhc',1,'card','Top 10 Must-Have DevOps Tools in 2021','{\"contentOrder\":[\"7fo1utqc8x1z1z6hzg33hes1ktc\",\"aoqmbijk7nbn13r73xd5rbu49py\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1636113600000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a8xceonxiu4n3c43szhskqizicr\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"a9ana1e9w673o5cp8md4xjjwfto\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1637323200000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://www.toolbox.com/tech/devops/articles/best-devops-tools/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"a3xky7ygn14osr1mokerbfah5cy\"}}',1675957126254,1675957126254,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('cax7uqt4jfbb8ue7j34yu1mpz1w','2023-02-09 15:38:45.789902','bh4pkixqsjift58e1qy6htrgeay',1,'card','Claire Hart','{\"contentOrder\":[\"aa4zg6ack43dgmqenna4jftqyxc\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"aseqq9hrsua56r3s6nbuirj9eec\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"claire.hart@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1670500800000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"ahn89mqg9u4igk6pdm7333t8i5h\"}}',1675957125786,1675957125786,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('cb5rd3k6997nezrcdak599yur7e','2023-02-09 15:38:45.238501','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Bug','{\"contentOrder\":[\"ah4dw5eqfcpdjuqgfayojg9s5xy\",\"ajfzxqte7cfnejqt6w8u1yhefce\",\"74w314tfrffy78jyjzan1637yoe\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675957125234,1675957125234,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('cbfwysn4hytfzjrkrz4rwsxoypy','2023-02-09 15:38:41.281642','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Offsite plans','{\"contentOrder\":[\"ae18goftntprhxdnj6rqruid5de\",\"71xatgq9j1pr4tdo7meq6r56ypo\",\"awbmqrtbrhbdf3c1jbinsiju7je\",\"7seu89dxmdbg78xn6ffctf8qg7h\",\"7355dznz4gbynipfj7hw7xgtf6h\",\"7ij35dre9h38nux5k3kqefddhoo\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"8b05c83e-a44a-4d04-831e-97f01d8e2003\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"dabadd9b-adf1-4d9f-8702-805ac6cef602\"}}',1675957121275,1675957121275,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('cbmrscrph3tymfkbr9dba5asgnr','2023-02-09 15:38:47.268561','buixxjic3xjfkieees4iafdrznc',1,'card','@mention teammates','{\"contentOrder\":[\"abd3r8d6a1jf5xmwrhwowo77ssr\",\"a3hs8k9dhefnzjkoq1dy818r7dy\",\"7mbw9t71hjbrydgzgkqqaoh8usr\",\"716dwrk9k1byr9mfs5ym8swr1tr\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#mention-people\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675957127263,1675957127263,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cbngnxne8yfy3tf5kuu1sopqr7e','2023-02-09 15:38:44.850521','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Hit company global sales target','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a6robxx81diugpjq5jkezz3j1fo\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"15%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"50MM\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"awfu37js3fomfkkczm1zppac57a\",\"azqnyswk6s1boiwuthscm78qwuo\":\"7.5MM\",\"azzbawji5bksj69sekcs4srm1ky\":\"agrfeaoj7d8p5ianw5iaf3191ae\"}}',1675957124847,1675957124847,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('cbupk1g7hifncimcqp195orzqxo','2023-02-09 15:38:45.230521','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Cross-team collaboration','{\"contentOrder\":[\"ajekopxcqcig9tqgrtepgfx6cjh\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675957125225,1675957125225,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('cc4opygf357gg3gxwhrtg59r99y','2023-02-09 15:38:42.075425','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','New Prospect','{\"contentOrder\":[\"ajzrs8mpz4pd5fpr7t794pc139w\",\"ak5p6j9onjt8gme4ges8d9suqao\",\"7ftgmxj1ur3ydfqkgtie48cpfky\",\"7nbe7oiagq7drupnp9sa66z6xac\",\"7xur9msnw13dndjyu6efjsnsp1a\",\"7pqq8ojniepfgfmb3uzxfns169y\",\"7h47gufr1ut8u7gw79xhioko83r\",\"7k7n85rq7rp8g78wtfh6s5ahhcc\",\"76k47w8b1i784tf9j9o99uh4yyr\",\"7mhbw7ea83jrd7bqp3meatdejnr\",\"7z3gpn7qt6fgamjpe8oh6j4ssba\",\"74kak7ugwwtgg7jc8a8du3wpqow\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"akj61wc9yxdwyw3t6m8igyf9d5o\"}}',1675957122071,1675957122071,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('cc7oak87qyirgzdc8zdsz8qh1sh','2023-02-09 15:38:46.040921','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Kadera Global','{\"contentOrder\":[\"abjhxhte5o3ru7m3earfrax3h1c\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"aipf3qfgjtkheiayjuxrxbpk9wa\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"150\",\"ahzspe59iux8wigra8bg6cg18nc\":\"kaderaglobal.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$12,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2015\",\"aozntq4go4nkab688j1s7stqtfc\":\"Seattle, OR\"}}',1675957126036,1675957126036,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('cdiyyn5idt7gg3rg5eqazep1nye','2023-02-09 15:38:45.783181','bh4pkixqsjift58e1qy6htrgeay',1,'card','Richard Parsons','{\"contentOrder\":[\"a5wia4hjzwfry7rqiyu9php8fhr\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"a7yq89whddzob1futao4rxk3yzc\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"richard.parsons@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1671019200000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"a1sxagjgaadym5yrjak6tcup1oa\"}}',1675957125780,1675957125779,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('cdqwjs75oxjdpuk8ibqcugi3meo','2023-02-09 15:38:46.022669','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Liminary Corp.','{\"contentOrder\":[\"aozygt5i473go7etympxjrz7zqe\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abt79uxg5edqojsrrefcnr4eruo\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"300\",\"ahzspe59iux8wigra8bg6cg18nc\":\"liminarycorp.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$25,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2017\",\"aozntq4go4nkab688j1s7stqtfc\":\"Toronto, Canada\"}}',1675957126018,1675957126018,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('cdr1mhwde87n7zd64j74exwkchy','2023-02-09 15:38:47.230697','buixxjic3xjfkieees4iafdrznc',1,'card','Share cards on Channels','{\"contentOrder\":[\"ab9k4rceobjrwudtqkynz66zfpy\",\"a7ed4q13ow3gj8ybikfwche9jda\",\"akyg4q9i53ifnjji1ren9rm1yro\",\"7ifkkn1h9wj85up8kcqwbd6gqec\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#share-card-previews\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675957127227,1675957127227,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cdttwwj85djbyunditagubfp3ny','2023-02-09 15:38:45.035729','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Learn to paint','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"77c539af-309c-4db1-8329-d20ef7e9eacd\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"9a090e33-b110-4268-8909-132c5002c90e\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"3245a32d-f688-463b-87f4-8e7142c1b397\"}}',1675957125030,1675957125030,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('cdwyteuoeajf6dnjozotzgrtoco','2023-02-09 15:38:45.221007','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Move cards across boards','{\"contentOrder\":[\"ae9fbaq8pebdbbfmkhcrqq84nph\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"abrfos7e7eczk9rqw6y5abadm1y\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"2\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957125217,1675957125217,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('cdyoz55rinbbm8y3u3zsqybxzsw','2023-02-09 15:38:45.775513','bh4pkixqsjift58e1qy6htrgeay',1,'card','Frank Nash','{\"contentOrder\":[\"a1ynhznfjwiyctj35curz6757ah\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"ap93ysuzy1xa7z818r6myrn4h4y\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"frank.nash@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1669896000000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"aehc83ffays3gh8myz16a8j7k4e\"}}',1675957125771,1675957125771,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('ce7totp851pn8fc16szcfdnthny','2023-02-09 15:38:42.059852','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Byron Cole','{\"contentOrder\":[\"ascyssjiewb86jfbfr5rpaf9khw\",\"astcfbnhyhtnr5bs9n5yyn9pgoa\",\"75tjroxsot3r5mpyasrccd1tnqw\",\"7agfjix7uajrtmqb4m9zwa73mcc\",\"7qkq6qoazhpytpqgeg8yugbny9y\",\"787juff6143nmppbjgr3qqiyz3c\",\"76g3iyjhxdpymuygf4gsf9j79pa\",\"7qiscat6oqfn4zpx4yikq73ijjw\",\"79uda7c3u3fnt5czo8yzgwbmy3r\",\"79r9kss8uh7fx8x1doebumg6r6r\",\"78iy7q6b8r7r79b9f8f6yg67ore\",\"7bmioqxgtuifux89c5xw3m1cb1w\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(333) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"acm9q494bcthyoqzmfogxxy5czy\",\"abru6tz8uebdxy4skheqidh7zxy\":\"byron.cole@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1667563200000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"100%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$500,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Helx Industries\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"aafwyza5iwdcwcyfyj6bp7emufw\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apjnaggwixchfxwiatfh7ey7uno\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1667822400000}\"}}',1675957122056,1675957122056,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('cekput58kh3n4jf5cf9neytx4hc','2023-02-09 15:38:45.201705','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Horizontal scroll issue','{\"contentOrder\":[\"awro4hs7fppd1zx95b5yrweu38h\",\"at5cgtckizfgdiycxfxogxptpph\",\"7frni9nmqujb79dn3cdf4zrcppy\"],\"icon\":\"〰️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"1\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957125192,1675957125192,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('ceq73enymxtfhzemaau1k75c3ko','2023-02-09 15:38:42.045277','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Jonathan Frazier','{\"contentOrder\":[\"anxnwy5irztyuzfqaeyyosy5drr\",\"au6zmhj8zi3nitdc47gep76qdao\",\"7t1y9zzch3j8pxdpnbmkq5gnzsc\",\"787mcbtsteideuro4yme46gugze\",\"7tk1dfukn5jyuzft8nex1yrdofa\",\"7dd4pazxmzbn4ijh487immy9tto\",\"7njde1qge6tryjqfjh6a5p5qbkh\",\"7gu9x9zr4jbgazq6pemig96qh3c\",\"73htx759e1jbbzdzyze6j6psjxy\",\"791sjce7anpbb8gx7gipzhw4kba\",\"7yhm1icoq47b3tya4zz169wyodr\",\"71ddc8fzu9p8x8f8xucmjqcddye\"],\"icon\":\"?‍♂️\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(999) 123-5678\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"a5txuiubumsmrs8gsd5jz5gc1oa\",\"abru6tz8uebdxy4skheqidh7zxy\":\"jonathan.frazier@email.com\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"0%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$800,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Ositions Inc.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"as5bk6afoaaa7caewe1zc391sce\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apiswzj7uiwbh87z8dw8c6mturw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1669118400000}\"}}',1675957122041,1675957122040,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('cgmghb9uqnfyozy77qed7ctu8no','2023-02-09 15:38:43.922752','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Identify dependencies','{\"contentOrder\":[\"awsqw6nxeebf75pgjfprwe135bc\",\"7op5gkqpjjfnj9fw6bpxq63po3h\",\"a9hijoe8xofrqie9r9uy1t8kp8o\",\"7ofqzfmmnqjycxdba55jmm1bdba\",\"7t7rzegarxfy3ieputjoxe9adiw\",\"7rmf45fake7gjddw4oqcmcjnema\",\"7j4984i3j7jyg5pfdfp8o1ymzeh\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"16\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"98a57627-0f76-471d-850d-91f3ed9fd213\"}}',1675957123919,1675957123919,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('cgscdkccnbfgzbeptndqxomibhc','2023-02-09 15:38:47.250436','buixxjic3xjfkieees4iafdrznc',1,'card','Create a new view','{\"contentOrder\":[\"aozbezukpgif3jpbsq7tahmmp5e\",\"au76uwhduw38a3cw7cm39p9p91h\",\"7owai1ux3h3gtf8byynfk6hyx1c\",\"7n8jq1dizyfgotby3o91arf1hxh\",\"77y4wffj1ctg7xmm9bx45qn6q6o\",\"77p1rh34rxb8etcpzs495tpp3qy\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-views\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675957127243,1675957127243,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('ch4rcgc3sbjnbfnsijhq6ir3joc','2023-02-09 15:38:45.021955','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Start a daily journal','{\"contentOrder\":[],\"icon\":\"✍️\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"3245a32d-f688-463b-87f4-8e7142c1b397\"}}',1675957125019,1675957125019,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('ch9h3ac8pctbn7pqwx97tgjdu5e','2023-02-09 15:38:46.578911','bsjd59qtpbf888mqez3ge77domw',1,'card','Reschedule planning meeting','{\"contentOrder\":[],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aok6pgecm85qe9k5kcphzoe63ma\"}}',1675957126575,1675957126575,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('chikrbt1ocfgafjh8q8p6u83yth','2023-02-09 15:38:46.242407','brs9cdimfw7fodyi7erqt747rhc',1,'card','New Project and Workflow Management Solutions for Developers','{\"contentOrder\":[\"71qhnzuec6esdi6fnynwpze4xya\",\"aegx8f1meuj8sff8fh7hai7ke4c\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1645790400000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a8xceonxiu4n3c43szhskqizicr\",\"a3pdzi53kpbd4okzdkz6khi87zo\",\"a3d9ux4fmi3anyd11kyipfbhwde\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"awna1nuarjca99m9s4uiy9kwj5h\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://mattermost.com/newsroom/press-releases/mattermost-launches-new-project-and-workflow-management-solutions-for-developers/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"aywiofmmtd3ofgzj95ysky4pjga\"}}',1675957126238,1675957126238,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('chpoprrty17rriggfj6y58op6mw','2023-02-09 15:38:46.586404','bsjd59qtpbf888mqez3ge77domw',1,'card','Schedule more time for testing','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"akj3fkmxq7idma55mdt8sqpumyw\"}}',1675957126582,1675957126582,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('chs33w9dkmt8w3naxz49antsaua','2023-02-09 15:38:44.866600','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Add 10 new customers in the EU','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"apnt1f7na9rzgk1rt49keg7xbiy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a1ts3ftyr8nocsicui98c89uxjy\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"30%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"10\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"3\",\"azzbawji5bksj69sekcs4srm1ky\":\"agrfeaoj7d8p5ianw5iaf3191ae\"}}',1675957124863,1675957124863,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('ciqogkfndsp8gdn6jou7ctmadoh','2023-02-09 15:38:46.058456','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Afformance Ltd.','{\"contentOrder\":[\"ajrwye5cxojrw7euzh9psmpnewe\"],\"icon\":\"⚡\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"arfjpz9by5car71tz3behba8yih\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"1,800\",\"ahzspe59iux8wigra8bg6cg18nc\":\"afformanceltd.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$200,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2002\",\"aozntq4go4nkab688j1s7stqtfc\":\"Palo Alto, CA\"}}',1675957126054,1675957126054,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('cj1km8t149jfb7dd9cr5dsfu6ge','2023-02-09 15:38:47.198009','buixxjic3xjfkieees4iafdrznc',1,'card','Manage tasks with cards','{\"contentOrder\":[\"aqiqhuzk88b8c3n8nggbgwebtne\",\"7mwz89dswkprpmq39xbfmszqena\",\"73xmo3qsoy3yauju46fh69udcar\",\"784uu3ufcgb878ky7hyugmf6xcw\",\"7azq9mxjretg65qmcguo9j5txjh\",\"7yuzb4f73mpg58ganappiick8mw\",\"7w5kznf6a8irrbg59modk68i46y\",\"7nb8y7jyoetro8cd36qcju53z8c\",\"7n4effoi9m3b89rey9bc8ia4uth\",\"73dk9foche3rn7gq6shxi81dcoy\",\"76nwb9tqfsid5jx46yw34itqima\",\"7dy3mcgzgybf1ifa3emgewkzj7e\",\"a5ca6tii33bfw8ba36y1rswq3he\",\"7876od6xhffr6fy69zeogag7eyw\",\"7x7bq9awkatbm5x4docbh5gaw4y\",\"7ghpx9qff43dgtke1rwidmge1ho\",\"7nb8y7jyoetro8cd36qcju53z8c\",\"7hdyxemhbytfm3m83g88djq9nhr\",\"7pgnejxokubbe9kdrxj6g9qa41e\",\"7hw9z6qtx8jyizkmm9g5yq3gxcy\",\"7gk6ooz6npbb8by5rgp9aig7tua\",\"7sdcsqkw5dpdidgkmbqryct4tay\"],\"icon\":\"☑️\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675957127194,1675957127194,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cjd9omd3z8tgh3yc8g94zqiukrr','2023-02-09 15:38:46.729760','bui5izho7dtn77xg3thkiqprc9r',1,'card','Icons don\'t display','{\"contentOrder\":[\"a3pcou8zsoigemmjcx8t5cnd3xa\",\"a4ugxsy1qfprc8nugxusiofemxe\",\"76prpfjt7ktfrixguqmfr9ttnhc\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"1fdbb515-edd2-4af5-80fc-437ed2211a49\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957126726,1675957126726,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('cjqpcrb5uw3bbbnywrho6u9c3hw','2023-02-09 15:38:44.884254','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Reduce bug backlog by 50%','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"abzfwnn6rmtfzyq5hg8uqmpsncy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a1ts3ftyr8nocsicui98c89uxjy\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"100%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"75\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"awfu37js3fomfkkczm1zppac57a\",\"azqnyswk6s1boiwuthscm78qwuo\":\"75\",\"azzbawji5bksj69sekcs4srm1ky\":\"aw5i7hmpadn6mbwbz955ubarhme\"}}',1675957124880,1675957124880,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('cjtnba6s7f7gqdeedbh7wsi9wmy','2023-02-09 15:38:47.223332','buixxjic3xjfkieees4iafdrznc',1,'card','Create a new card','{\"contentOrder\":[\"aq9774er56byu7mn7m9g1877aoy\",\"adhsx4h5ss7rqdcjt8xyam6xtqc\",\"aq7xd8ex8tbrpframi4htuxs9da\",\"7me9p46gbqiyfmfnapi7dyxb5br\",\"7jno8da74x78zzj87pdoyckmy5y\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-cards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675957127219,1675957127219,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('ckdxkx3wrzibsjfmyhgg114h6yc','2023-02-09 15:38:46.572328','bsjd59qtpbf888mqez3ge77domw',1,'card','Team communication','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aq1dwbf661yx337hjcd5q3sbxwa\"}}',1675957126569,1675957126569,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('cmbff37bue7yrbg691t35b65c7r','2023-02-09 15:38:47.259808','buixxjic3xjfkieees4iafdrznc',1,'card','Add new properties','{\"contentOrder\":[\"aqa1enkxgpirkjbaku5ha4u9xsr\",\"ayhk11qsuz789fk8bqae4oz8mro\",\"7gc3z8cf8rirgfyutwoke9nn6jy\",\"76cinqnb6k3dzmfbm9fnc8eofny\",\"7fnwzuaqyztfuic3cn49sc4cine\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#add-and-manage-properties\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675957127256,1675957127256,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cmkaj68y4efrg9qa1wfxnpmg1sr','2023-02-09 15:38:45.806867','bh4pkixqsjift58e1qy6htrgeay',1,'card','Bernadette Powell','{\"contentOrder\":[\"a5makwszxp3gmin4b76mj7txmro\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"af6hjb3ysuaxbwnfqpby4wwnkdr\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"bernadette.powell@email.com\"}}',1675957125803,1675957125803,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('cmq9ixgwbe7nsfqostixa5t8rje','2023-02-09 15:38:46.566504','bsjd59qtpbf888mqez3ge77domw',1,'card','Tight deadline','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"ar87yh5xmsswqkxmjq1ipfftfpc\"}}',1675957126562,1675957126562,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('cncdr6c56zpgh5xnxy1ws4syt8y','2023-02-09 15:38:46.685636','bui5izho7dtn77xg3thkiqprc9r',1,'card','App crashing','{\"contentOrder\":[\"79t7rkiuspeneqi9xurou9tqzwh\",\"axb7xpfyqzpbomq3df7biqf1pja\",\"a36i7x65b4ibs5etq8y5p7t9bwh\",\"7m1nb9juqij8stdt3fzton8i75y\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"1fdbb515-edd2-4af5-80fc-437ed2211a49\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\"}}',1675957126681,1675957126681,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('cnqf1zimzjbbjpjxpf31ciaotgc','2023-02-09 15:38:43.546492','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Pay bills','{\"contentOrder\":[\"7mgkwc7u9wpgq38c5hksj94dhzc\",\"76fxqzgf6oby4xe3xzdezhdjasr\",\"7eg55detouidh9rkezb83ibmg6o\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"aj4jyekqqssatjcq7r7chmy19ey\",\"abthng7baedhhtrwsdodeuincqy\":\"true\"}}',1675957123543,1675957123543,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('cnuqebsb6ubgmmpbpsuun5rs11o','2023-02-09 15:38:41.288637','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Social Media Strategy','{\"contentOrder\":[\"ahd5gizdxw7rexyucrx4qsuhfgc\",\"7cab1f41eqfb6ip61p3wa31h5sa\",\"a34iyxqpgyigupm63iwjysydrqh\",\"7s9bhmsu9rfd6xfxjgpxhzczzmr\",\"7h1scxz84h3bcdfrszhuti8es6r\",\"76z73gkejojr3xjruhnezkiauoy\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"b1abafbf-a038-4a19-8b68-56e0fd2319f7\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed\"}}',1675957121285,1675957121285,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('cp6ireo8debnc7q9jpfbeu5gwth','2023-02-09 15:38:46.693247','bui5izho7dtn77xg3thkiqprc9r',1,'card','Calendar view','{\"contentOrder\":[\"7df11783ny67mdnognqae31ax6y\",\"ajrm94fczmfdiugdck7cz8g7dhw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"849766ba-56a5-48d1-886f-21672f415395\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957126689,1675957126689,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('cpiw648g9s3dqiqs3sxup3n7qec','2023-02-09 15:38:46.703372','bui5izho7dtn77xg3thkiqprc9r',1,'card','Standard templates','{\"contentOrder\":[\"7uonmjk41nipnrsi6tz8wau5ssh\",\"at38so4cpwif5xga7mgchdw5d8w\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957126697,1675957126697,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('cq4c7epp1ubbetm438oi5qmafba','2023-02-09 15:38:47.206807','buixxjic3xjfkieees4iafdrznc',1,'card','Create your own board','{\"contentOrder\":[\"ay1fowfzpkiyh8m3wa49zoii6ne\",\"aqmofry5yqbyi3pk6oizc8m168w\",\"7r9my1yuddbn45dojrfht3neg8c\",\"7eir5gdjxgjbsxpbyp3df4npcze\",\"7rwou19t1s7gwuezy73xo3iiiga\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-boards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675957127203,1675957127203,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cqioq4yjo4p84bgkqxcn7egeqir','2023-02-09 15:38:44.825391','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Improve customer NPS score','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"82%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"8.5\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"anruuoyez51r3yjxuoc8zoqnwaw\",\"azqnyswk6s1boiwuthscm78qwuo\":\"7\",\"azzbawji5bksj69sekcs4srm1ky\":\"agm9p6gcq15ueuzqq3wd4be39wy\"}}',1675957124822,1675957124822,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('crk5mmf4zgtyix8khnfwsoje4ca','2023-02-09 15:38:47.189789','buixxjic3xjfkieees4iafdrznc',1,'card','Drag cards','{\"contentOrder\":[\"apktbgtee5jb8xrnqy3ibiujxew\",\"a6rzpwykmyj8azgwfhhxdogmn7e\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#dragging-cards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675957127185,1675957127185,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('crnc89prmbtg98ms9i97rtm8x6o','2023-02-09 15:38:43.951871','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Conduct market analysis','{\"contentOrder\":[\"a3fgn3k3o1ff1mprakwekabmwkr\",\"7e6834n16q7fupngwqx7t937aro\",\"at7wkmaa4dfgc7nuisymzsgjggy\",\"7tspi4obsx7nijn9r3bk4bwqkuc\",\"7c9hhfm9yx7gzjkmj3weym49bqc\",\"7rngcpz3aktnxmd94s39kenne9a\",\"7mut8wzz3tty33e7bi7yj65oycr\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"40\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"87f59784-b859-4c24-8ebe-17c766e081dd\"}}',1675957123948,1675957123948,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('crydizwwgwfrtjemgykge11ifmy','2023-02-09 15:38:43.944628','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Project budget approval','{\"contentOrder\":[\"aj3jx4wyogpfkpjybzgdwxjakdy\",\"7fxt891ntqtf98gkawcad1s1irc\",\"adudjr3mgwbyqmb1n818f1k8d8r\",\"73qroj7qdtpb49jcqoicjw65y9r\",\"7y8kizaqnqpyxijaax4mfti1d6w\",\"76616kunmejdu5qosasw9wmo4ee\",\"7cmxsungmdin5fb6q4awj316axw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"16\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\"}}',1675957123941,1675957123941,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('csbgswatyspdiuknhxrfx4muwxa','2023-02-09 15:38:45.211057','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Login screen not loading','{\"contentOrder\":[\"awjyu4pu76jykzm3t99sgcouzna\",\"afgaieg68zby5iyry16mn4zbymc\",\"7oapg5e5gx7ghtpxfwjf4ssbesr\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"abrfos7e7eczk9rqw6y5abadm1y\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"1\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\"}}',1675957125207,1675957125207,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('csdmaxaygtbbdpecywm73rureor','2023-02-09 15:38:46.249967','brs9cdimfw7fodyi7erqt747rhc',1,'card','[Tweet] Mattermost v6.1 includes card @-mention notifications in Boards','{\"contentOrder\":[\"7i96m7nbsdsex8n6hzuzrmdfjuy\",\"7ed5bwp3gr8yax3mhtuwiaa9gjy\",\"a6qbdm88dqpgmbp6i3s7epcr41a\",\"agbyoid6xz7f7jr593hdw8stbdh\",\"abdasiyq4k7ndtfrdadrias8sjy\",\"73xt4fmtc3jgc9y3he5xzwpiefa\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1639051200000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"az8o8pfe9hq6s7xaehoqyc3wpyc\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"a9ana1e9w673o5cp8md4xjjwfto\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1637668800000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://twitter.com/Mattermost/status/1463145633162969097?s=20\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"aj8y675weso8kpb6eceqbpj4ruw\"}}',1675957126246,1675957126246,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('ctatxjxc1c7nqxnstzewk5nzawh','2023-02-09 15:38:47.239828','buixxjic3xjfkieees4iafdrznc',1,'card','Filter and sort cards','{\"contentOrder\":[\"a4fz9kcfs9ibj8puk9mux7ac94c\",\"ayo673a5dwinb5ghrat43orq99a\",\"78i8aqjmqtibr7x4okhz6uqquqr\",\"7cyd3zidtzpdpmnx8bemdbay6wy\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675957127235,1675957127235,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('ctytybwsz4fybiyxo3hxu6skzpw','2023-02-09 15:38:43.555951','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Go for a walk','{\"contentOrder\":[\"a6gjbdp8ud3nqpr9k3ao9ik4uoy\",\"a4iau9riytb8hxgrrkid8f6xnac\",\"7hidha44ow7ns3e3731qd95k7aw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"an51dnkenmoog9cetapbc4uyt3y\"}}',1675957123553,1675957123553,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('ctzdmitubxby65qw7knhoef3gwh','2023-02-09 15:38:45.047652','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Open retirement account','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"80be816c-fc7a-4928-8489-8b02180f4954\"}}',1675957125042,1675957125042,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('cu8a79dtcx3fd7gfsgtwtu3igfr','2023-02-09 15:38:41.270508','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Video production','{\"contentOrder\":[\"a5kdt8sgcwf85ig5izbof7d74xh\",\"76uruixptajffzndrfqfznqqixr\",\"abs5kzwpo3tbejb4jytr59oqjoy\",\"7pq3x1i5rpbf6xnsb9qwtgwtqqr\",\"7h3wrcjz5kfnhppkooho41tybnc\",\"767hrhq4irtf9unxnh1mozpdp7y\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"b1abafbf-a038-4a19-8b68-56e0fd2319f7\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\"}}',1675957121264,1675957121264,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('cuow7xsfr6jdzzpsz9q541d4sth','2023-02-09 15:38:42.067860','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Caitlyn Russel','{\"contentOrder\":[\"a5ii1xhdwj7g9iq77pibrxwssqa\",\"a1ojs13y56fnpuykuhh4q7ddpue\",\"794s61rfxcfbcuj1ed1c9dzgwhh\",\"76n3qjd33gigb7rm6b5nq8qjpba\",\"7crjr47bh67bhzefirck7dcx4ke\",\"77xoe4cfio3bzm84rwi6c487fxr\",\"7h9x9r3kcgfbw9y6dmsiddbisca\",\"797aty5ck67b3mdqyhhnpip185h\",\"7dganye7ax7rzin9f8cm3sdhtsy\",\"7jfqmks46utf8ixths7yehczj8w\",\"7nycetygujb8cdra17idsx8rczo\",\"7u5tfs9wxgfb77yuzfhdsg68rbo\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(111) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"ah6ehh43rwj88jy4awensin8pcw\",\"abru6tz8uebdxy4skheqidh7zxy\":\"caitlyn.russel@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1689336000000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"20%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$250,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Liminary Corp.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"aafwyza5iwdcwcyfyj6bp7emufw\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apiswzj7uiwbh87z8dw8c6mturw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1668168000000}\"}}',1675957122065,1675957122065,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('cuygaok8sbbnbzpeen9mtreupoh','2023-02-09 15:38:43.569468','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Gardening','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"afpy8s7i45frggprmfsqngsocqh\"}}',1675957123566,1675957123566,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('cxpohc37ix7yndjjyqj4d777cwr','2023-02-09 15:38:47.214412','buixxjic3xjfkieees4iafdrznc',1,'card','Share a board','{\"contentOrder\":[\"aoun46k7itjdxmxgd47bwstropc\",\"awhqdccbq678sfm3eiy4961cqqc\",\"7r7asyew8d7fyunf4sow8e5iyoc\",\"ad8j3n8tp77bppee3ipjt6odgpe\",\"7w935usqt6pby8qz9x5pxaj7iow\",\"7ogbs8h6q4j8z7ngy1m7eag63nw\",\"7z1jau5qy3jfcxdp5cgq3duk6ne\",\"7mjsnjpr6tj81bkx4fjwdsgusuc\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/sharing-boards.html\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675957127210,1675957127210,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('cygpgny1h9td5ufxg45tbq88ujy','2023-02-09 15:38:43.551696','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Buy groceries','{\"contentOrder\":[\"a9s6urkircigeurptty6sa6pege\",\"7b5cy899pyigw5etbuknprr9u3e\",\"77xcztkfy1iy43fhet3q8wgf6dr\",\"77fc5jnmscpfd7xoyerwysfboeo\",\"7tdi3eqoyqi85ujjpgfoku41b7c\",\"7mzxwwfmp8jfozbqk6rmy4b843c\",\"7qbxdt9fgdfytxf1ijn7z63tzde\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"afpy8s7i45frggprmfsqngsocqh\"}}',1675957123549,1675957123549,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('cyhsz4iz5m7bjxp8xie3z8akxgw','2023-02-09 15:38:45.255338','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Epic','{\"contentOrder\":[\"athbwfmdjifdjxdao5h9cmcr6xr\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675957125251,1675957125251,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('cyn1kss7yhpga8nsdma6rw1cbsa','2023-02-09 15:38:44.834064','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Generate more Marketing Qualified Leads (MQLs)','{\"contentOrder\":[],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"65%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"100\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"ahfbn1jsmhydym33ygxwg5jt3kh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"65\",\"azzbawji5bksj69sekcs4srm1ky\":\"aehoa17cz18rqnrf75g7dwhphpr\"}}',1675957124829,1675957124829,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('cyqg8cpi6d3bo8e4r1gxffn5tec','2023-02-09 15:38:43.938046','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Requirements sign-off','{\"contentOrder\":[\"a4tsbhyharffzzdcwyysgnnefrr\",\"74rnrembncbdjfgkzss1tjm846o\",\"azkn9xoyupffjbbzemaktz5kaer\",\"7ddrofny3s7rc7xhujw5zg4cudh\",\"7wntwictxn3gwijsazxdymc6tte\",\"7qkcmsne68py3dcytmi4mtejbga\",\"7pfjkm3y31p8mur9183h3zrk3yy\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"8\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\"}}',1675957123934,1675957123934,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('cyrh1tksy5bdsdgwejsf3uyrm8y','2023-02-09 15:38:45.263565','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Global templates','{\"contentOrder\":[\"aedojoppjspramkzqucy4wb3cyc\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"a6ghze4iy441qhsh3eijnc8hwze\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"2\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675957125259,1675957125259,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('v1cwmbmhy93nzfqr33jy7cwb9ka','2023-02-09 15:38:46.005687','',1,'view','Competitor List','{\"cardOrder\":[\"cdqwjs75oxjdpuk8ibqcugi3meo\",\"c4amsnwiypifnxdg7fduunean3e\",\"cc7oak87qyirgzdc8zdsz8qh1sh\",\"ciqogkfndsp8gdn6jou7ctmadoh\",\"c9jyoy49o9ifbxctj3rnsxcd5dr\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":210,\"a1semdhszu1rq17d7et5ydrqqio\":121,\"aapogff3xoa8ym7xf56s87kysda\":194,\"ahzspe59iux8wigra8bg6cg18nc\":156,\"aiefo7nh9jwisn8b4cgakowithy\":155,\"aozntq4go4nkab688j1s7stqtfc\":151,\"az3jkw3ynd3mqmart7edypey15e\":145},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"ahzspe59iux8wigra8bg6cg18nc\",\"aozntq4go4nkab688j1s7stqtfc\",\"aiefo7nh9jwisn8b4cgakowithy\",\"a6cwaq79b1pdpb97wkanmeyy4er\",\"an1eerzscfxn6awdfajbg41uz3h\",\"a1semdhszu1rq17d7et5ydrqqio\",\"aapogff3xoa8ym7xf56s87kysda\",\"az3jkw3ynd3mqmart7edypey15e\"]}',1675957126002,1675957126002,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('v6quh5pqzn7fe9e9b5sq7bz7qbo','2023-02-09 15:38:42.025654','',1,'view','All Contacts','{\"cardOrder\":[\"c49nb54ueeprz589qo735319hqo\",\"cuow7xsfr6jdzzpsz9q541d4sth\",\"c7sed4gkoe3bxif9ewg1yq36r8w\",\"ceq73enymxtfhzemaau1k75c3ko\",\"ce7totp851pn8fc16szcfdnthny\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":240,\"a1438fbbhjeffkexmcfhnx99o1h\":151,\"a5hwxjsmkn6bak6r7uea5bx1kwc\":132,\"abru6tz8uebdxy4skheqidh7zxy\":247,\"adtf1151chornmihz4xbgbk9exa\":125,\"aejo5tcmq54bauuueem9wc4fw4y\":127,\"ahf43e44h3y8ftanqgzno9z7q7w\":129,\"ainpw47babwkpyj77ic4b9zq9xr\":157,\"amahgyn9n4twaapg3jyxb6y4jic\":224,\"amba7ot98fh7hwsx8jdcfst5g7h\":171,\"aoheuj1f3mu6eehygr45fxa144y\":130,\"auhf91pm85f73swwidi4wid8jqe\":157},\"defaultTemplateId\":\"cc4opygf357gg3gxwhrtg59r99y\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a5hwxjsmkn6bak6r7uea5bx1kwc\",\"aoheuj1f3mu6eehygr45fxa144y\",\"aro91wme9kfaie5ceu9qasmtcnw\",\"ainpw47babwkpyj77ic4b9zq9xr\",\"ahf43e44h3y8ftanqgzno9z7q7w\",\"amahgyn9n4twaapg3jyxb6y4jic\",\"abru6tz8uebdxy4skheqidh7zxy\",\"a1438fbbhjeffkexmcfhnx99o1h\",\"auhf91pm85f73swwidi4wid8jqe\",\"adtf1151chornmihz4xbgbk9exa\",\"aejo5tcmq54bauuueem9wc4fw4y\",\"amba7ot98fh7hwsx8jdcfst5g7h\"]}',1675957122015,1675957122015,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('v8jqpjxs1ojnkzjmf8bqk9xpzeo','2023-02-09 15:38:45.766410','',1,'view','All Users','{\"cardOrder\":[\"cdyoz55rinbbm8y3u3zsqybxzsw\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280,\"aaebj5fyx493eezx6ukxiwydgty\":146,\"acjq4t5ymytu8x1f68wkggm7ypc\":222,\"akrxgi7p7w14fym3gbynb98t9fh\":131,\"atg9qu6oe4bjm8jczzsn71ff5me\":131},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"akrxgi7p7w14fym3gbynb98t9fh\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"aaebj5fyx493eezx6ukxiwydgty\",\"akrxgi7p7w14fym3gbynb98t9fh\",\"atg9qu6oe4bjm8jczzsn71ff5me\",\"acjq4t5ymytu8x1f68wkggm7ypc\",\"aphio1s5gkmpdbwoxynim7acw3e\",\"aqafzdeekpyncwz7m7i54q3iqqy\",\"aify3r761b9w43bqjtskrzi68tr\"]}',1675957125762,1675957125762,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('v8wyenmx56ibw3brhiwixebqi3w','2023-02-09 15:38:43.586043','bbn1888mprfrm5fjw9f1je9x3xo',1,'view','Board View','{\"cardOrder\":[\"cygpgny1h9td5ufxg45tbq88ujy\",\"cnqf1zimzjbbjpjxpf31ciaotgc\",\"ctytybwsz4fybiyxo3hxu6skzpw\",\"c3f1ep3c97pfkzcijzknob4ukpe\",\"czowhma7rnpgb3eczbqo3t7fijo\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a9zf59u8x1rf4ywctpcqama7tio\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"an51dnkenmoog9cetapbc4uyt3y\",\"afpy8s7i45frggprmfsqngsocqh\",\"aj4jyekqqssatjcq7r7chmy19ey\",\"\"],\"visiblePropertyIds\":[\"a9zf59u8x1rf4ywctpcqama7tio\"]}',1675957123583,1675957123583,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('v98swgoxw9bgbfeuk33iympkita','2023-02-09 15:38:44.892788','bm4ubx56krp4zwyfcqh7nxiigbr',1,'view','Departments','{\"cardOrder\":[\"cpa534b5natgmunis8u1ixb55pw\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"azzbawji5bksj69sekcs4srm1ky\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aw5i7hmpadn6mbwbz955ubarhme\",\"afkxpcjqjypu7hhar7banxau91h\",\"aehoa17cz18rqnrf75g7dwhphpr\",\"agrfeaoj7d8p5ianw5iaf3191ae\",\"agm9p6gcq15ueuzqq3wd4be39wy\",\"aucop7kw6xwodcix6zzojhxih6r\",\"afust91f3g8ht368mkn5x9tgf1o\",\"acocxxwjurud1jixhp7nowdig7y\"],\"visiblePropertyIds\":[]}',1675957124888,1675957124888,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('vazascee4rin1mckqntttf3ykno','2023-02-09 15:38:45.071709','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','By Date','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d6b1249b-bc18-45fc-889e-bec48fce80ef\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"9a090e33-b110-4268-8909-132c5002c90e\",\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"6e7139e4-5358-46bb-8c01-7b029a57b80a\",\"d5371c63-66bf-4468-8738-c4dc4bea4843\",\"\"],\"visiblePropertyIds\":[\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\"]}',1675957125068,1675957125068,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('vcqpjbntc9in1dndi35yuwmmmcc','2023-02-09 15:38:47.301904','buixxjic3xjfkieees4iafdrznc',1,'view','Onboarding','{\"cardOrder\":[\"cjtnba6s7f7gqdeedbh7wsi9wmy\",\"cj1km8t149jfb7dd9cr5dsfu6ge\",\"cq4c7epp1ubbetm438oi5qmafba\",\"cdr1mhwde87n7zd64j74exwkchy\",\"cmbff37bue7yrbg691t35b65c7r\",\"cgscdkccnbfgzbeptndqxomibhc\",\"cbmrscrph3tymfkbr9dba5asgnr\",\"crk5mmf4zgtyix8khnfwsoje4ca\",\"cxpohc37ix7yndjjyqj4d777cwr\",\"ctatxjxc1c7nqxnstzewk5nzawh\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aqb5x3pt87dcc9stbk4ofodrpoy\",\"a1mtm777bkagq3iuu7xo9b13qfr\",\"auxbwzptiqzkii5r61uz3ndsy1r\",\"aj9386k1bx8qwmepeuxg3b7z4pw\"],\"visiblePropertyIds\":[]}',1675957127297,1675957127297,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('vdmngn77y9bbpmkb3x4sbd497nw','2023-02-09 15:38:46.280054','brs9cdimfw7fodyi7erqt747rhc',1,'view','By Status','{\"cardOrder\":[null,\"cdbfkd15d6iy18rgx1tskmfsr6c\",\"cn8yofg9rtkgmzgmb5xdi56p3ic\",\"csgsnnywpuqzs5jgq87snk9x17e\",\"cqwaytore5y487wdu8zffppqnea\",null],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"awna1nuarjca99m9s4uiy9kwj5h\",\"a9ana1e9w673o5cp8md4xjjwfto\",\"apy9dcd7zmand615p3h53zjqxjh\",\"acri4cm3bmay55f7ksztphmtnga\",\"amsowcd9a8e1kid317r7ttw6uzh\",\"\"],\"visiblePropertyIds\":[\"ab6mbock6styfe6htf815ph1mhw\"]}',1675957126274,1675957126274,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('ve5iu4a8iypyj8dc6npby3zmate','2023-02-09 15:38:46.762763','bui5izho7dtn77xg3thkiqprc9r',1,'view','Board: Status','{\"cardOrder\":[\"cncdr6c56zpgh5xnxy1ws4syt8y\",\"cm4w7cc3aac6s9jdcujbs4j8f4r\",\"c6egh6cpnj137ixdoitsoxq17oo\",\"cct9u78utsdyotmejbmwwg66ihr\",\"cmft87it1q7yebbd51ij9k65xbw\",\"c9fe77j9qcruxf4itzib7ag6f1c\",\"coup7afjknqnzbdwghiwbsq541w\",\"c5ex1hndz8qyc8gx6ofbfeksftc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"849766ba-56a5-48d1-886f-21672f415395\",\"\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957126759,1675957126759,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('vfoo31cqxijgomfgioq4xuqigpw','2023-02-09 15:38:44.818877','',1,'view','By Objectives','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":387,\"a17ryhi1jfsboxkwkztwawhmsxe\":134,\"a6amddgmrzakw66cidqzgk6p4ge\":183,\"aqxyzkdrs4egqf7yk866ixkaojc\":100},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a6amddgmrzakw66cidqzgk6p4ge\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a6amddgmrzakw66cidqzgk6p4ge\",\"a17ryhi1jfsboxkwkztwawhmsxe\",\"azzbawji5bksj69sekcs4srm1ky\",\"adp5ft3kgz7r5iqq3tnwg551der\",\"aqxyzkdrs4egqf7yk866ixkaojc\",\"adu6mebzpibq6mgcswk69xxmnqe\",\"asope3bddhm4gpsng5cfu4hf6rh\",\"ajwxp866f9obs1kutfwaa5ru7fe\",\"azqnyswk6s1boiwuthscm78qwuo\",\"ahz3fmjnaguec8hce7xq3h5cjdr\",\"a17bfcgnzmkwhziwa4tr38kiw5r\"]}',1675957124815,1675957124814,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('vfrebrigddprbjmdx3h633bb3tr','2023-02-09 15:38:47.276662','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Table View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280,\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":100,\"acypkejeb5yfujhj9te57p9kaxw\":169},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"aqh13jabwexjkzr3jqsz1i1syew\",\"acmg7mz1rr1eykfug4hcdpb1y1o\",\"acypkejeb5yfujhj9te57p9kaxw\"]}',1675957127272,1675957127272,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('vh7zwzax9m7ggzraf388x1sycmc','2023-02-09 15:38:43.577608','bbn1888mprfrm5fjw9f1je9x3xo',1,'view','List View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a9zf59u8x1rf4ywctpcqama7tio\",\"abthng7baedhhtrwsdodeuincqy\"]}',1675957123572,1675957123572,0,NULL,'system','','system','bdi5nwqfuyjb7tg5c477gr3x85o'),('vismuja8y8bdmbpb1ofuytqjmcw','2023-02-09 15:38:46.305939','brs9cdimfw7fodyi7erqt747rhc',1,'view','Content List','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":322,\"ab6mbock6styfe6htf815ph1mhw\":229,\"aysx3atqexotgwp5kx6h5i5ancw\":208},\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"a39x5cybshwrbjpc3juaakcyj6e\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"ae9ar615xoknd8hw8py7mbyr7zo\",\"aysx3atqexotgwp5kx6h5i5ancw\",\"ab6mbock6styfe6htf815ph1mhw\",\"ao44fz8nf6z6tuj1x31t9yyehcc\",\"a39x5cybshwrbjpc3juaakcyj6e\",\"agqsoiipowmnu9rdwxm57zrehtr\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\"]}',1675957126302,1675957126302,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('vj15bp44ztbbjfcom3mb1e9fzjh','2023-02-09 15:38:47.285303','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"acmg7mz1rr1eykfug4hcdpb1y1o\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957127280,1675957127280,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('vjin4nxaxkbbcmcazmpnmn99azr','2023-02-09 15:38:43.958572','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Project Priorities','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{\"\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"87f59784-b859-4c24-8ebe-17c766e081dd\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"98a57627-0f76-471d-850d-91f3ed9fd213\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"}},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\",\"87f59784-b859-4c24-8ebe-17c766e081dd\",\"98a57627-0f76-471d-850d-91f3ed9fd213\",\"\"],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675957123955,1675957123955,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('vjtorbhhbxp8x7p47y3w41w7m1a','2023-02-09 15:38:46.738721','bui5izho7dtn77xg3thkiqprc9r',1,'view','Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a4378omyhmgj3bex13sj4wbpfiy\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957126734,1675957126734,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('vjy9b7qm8btf77cazpuaqar93cy','2023-02-09 15:38:43.967647','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Progress Tracker','{\"cardOrder\":[\"crydizwwgwfrtjemgykge11ifmy\",\"cyqg8cpi6d3bo8e4r1gxffn5tec\",\"cgmghb9uqnfyozy77qed7ctu8no\",\"crnc89prmbtg98ms9i97rtm8x6o\",\"c1bmjmuj9d7dqbp6q683fbwhioo\",\"coxnjt3ro1in19dd1e3awdt338r\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{\"\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"adeo5xuwne3qjue83fcozekz8ko\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"afi4o5nhnqc3smtzs1hs3ij34dh\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ahpyxfnnrzynsw3im1psxpkgtpe\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ar6b8m3jxr3asyxhr8iucdbo6yc\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ayz81h9f3dwp7rzzbdebesc7ute\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"}},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"ayz81h9f3dwp7rzzbdebesc7ute\",\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"afi4o5nhnqc3smtzs1hs3ij34dh\",\"adeo5xuwne3qjue83fcozekz8ko\",\"ahpyxfnnrzynsw3im1psxpkgtpe\",\"\"],\"visiblePropertyIds\":[\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675957123963,1675957123963,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('vkaec3ssdutrn9c9ydtnbf1graa','2023-02-09 15:38:45.177457','',1,'view','By Sprint','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{\"ai7ajsdk14w7x5s8up3dwir77te\":\"count\"},\"columnWidths\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":128,\"50117d52-bcc7-4750-82aa-831a351c44a0\":126,\"__title\":280,\"a1g6i613dpe9oryeo71ex3c86hy\":159,\"aeomttrbhhsi8bph31jn84sto6h\":141,\"ax9f8so418s6s65hi5ympd93i6a\":183,\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":100},\"defaultTemplateId\":\"c9wgkprk3ipn18ky1qhq1m841gy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"60985f46-3e41-486e-8213-2b987440ea1c\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"aphg37f7zbpuc3bhwhp19s1ribh\",\"a4378omyhmgj3bex13sj4wbpfiy\",\"ai7ajsdk14w7x5s8up3dwir77te\",\"a1g6i613dpe9oryeo71ex3c86hy\",\"aeomttrbhhsi8bph31jn84sto6h\",\"ax9f8so418s6s65hi5ympd93i6a\"]}',1675957125173,1675957125173,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('vkoz8sdnnaffc9ymppgm5bkc8ho','2023-02-09 15:38:43.984457','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Task Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a3zsw7xs8sxy7atj8b6totp3mby\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957123981,1675957123981,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('vksi9ioijkpgn9bf7g79kaea3qr','2023-02-09 15:38:43.976086','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Task Overview','{\"cardOrder\":[\"c1bmjmuj9d7dqbp6q683fbwhioo\",\"crnc89prmbtg98ms9i97rtm8x6o\",\"cgmghb9uqnfyozy77qed7ctu8no\",\"crydizwwgwfrtjemgykge11ifmy\",\"cyqg8cpi6d3bo8e4r1gxffn5tec\",\"cz8p8gofakfby8kzz83j97db8ph\",\"ce1jm5q5i54enhuu4h3kkay1hcc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"sum\"},\"columnWidths\":{\"2a5da320-735c-4093-8787-f56e15cdfeed\":196,\"__title\":280,\"a8daz81s4xjgke1ww6cwik5w7ye\":139,\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":141,\"d3d682bf-e074-49d9-8df5-7320921c2d23\":110},\"defaultTemplateId\":\"czw9es1e89fdpjr7cqptr1xq7qh\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"2a5da320-735c-4093-8787-f56e15cdfeed\",\"a3zsw7xs8sxy7atj8b6totp3mby\",\"axkhqa4jxr3jcqe4k87g8bhmary\",\"a7gdnz8ff8iyuqmzddjgmgo9ery\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675957123971,1675957123971,0,NULL,'system','','system','bboohqdtgptdjtgeqd8hu1tj96o'),('vmdwnoqhp5pb97845qkf8qhiqmw','2023-02-09 15:38:46.013576','',1,'view','Market Position','{\"cardOrder\":[\"cip8b4jcomfr7by9gtizebikfke\",\"cacs91js1hb887ds41r6dwnd88c\",\"ca3u8edwrof89i8obxffnz4xw3a\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"arfjpz9by5car71tz3behba8yih\",\"abajmr34b8g1916w495xjb35iko\",\"abt79uxg5edqojsrrefcnr4eruo\",\"aipf3qfgjtkheiayjuxrxbpk9wa\"],\"visiblePropertyIds\":[]}',1675957126009,1675957126009,0,NULL,'system','','system','bfkwpzdjcu7dxjmwgom3cn75cec'),('voudpr9m9bjbrtrbune39izez1y','2023-02-09 15:38:44.811800','',1,'view','By Quarter','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":452,\"a17ryhi1jfsboxkwkztwawhmsxe\":148,\"a6amddgmrzakw66cidqzgk6p4ge\":230,\"azzbawji5bksj69sekcs4srm1ky\":142},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"aqxyzkdrs4egqf7yk866ixkaojc\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a6amddgmrzakw66cidqzgk6p4ge\",\"a17ryhi1jfsboxkwkztwawhmsxe\",\"azzbawji5bksj69sekcs4srm1ky\",\"adp5ft3kgz7r5iqq3tnwg551der\",\"aqxyzkdrs4egqf7yk866ixkaojc\",\"adu6mebzpibq6mgcswk69xxmnqe\",\"asope3bddhm4gpsng5cfu4hf6rh\",\"ajwxp866f9obs1kutfwaa5ru7fe\",\"azqnyswk6s1boiwuthscm78qwuo\",\"ahz3fmjnaguec8hce7xq3h5cjdr\",\"a17bfcgnzmkwhziwa4tr38kiw5r\"]}',1675957124808,1675957124808,0,NULL,'system','','system','bd56m1jgc37f3byxc5h15mkr9qw'),('voyno1sepd78jzxbu9zpq8tw4dy','2023-02-09 15:38:42.037047','',1,'view','Pipeline Tracker','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"aic89a5xox4wbppi6mbyx6ujsda\",\"ah6ehh43rwj88jy4awensin8pcw\",\"aprhd96zwi34o9cs4xyr3o9sf3c\",\"axesd74yuxtbmw1sbk8ufax7z3a\",\"a5txuiubumsmrs8gsd5jz5gc1oa\",\"acm9q494bcthyoqzmfogxxy5czy\"],\"visiblePropertyIds\":[\"aro91wme9kfaie5ceu9qasmtcnw\",\"amahgyn9n4twaapg3jyxb6y4jic\"]}',1675957122031,1675957122031,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('vp6mqnpff7fgcdg4g1i9jgqn3xo','2023-02-09 15:38:46.297541','brs9cdimfw7fodyi7erqt747rhc',1,'view','Publication Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"agqsoiipowmnu9rdwxm57zrehtr\",\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957126293,1675957126293,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('vp9yycccqz3dy3gfydi1kmnqtnw','2023-02-09 15:38:46.770988','bui5izho7dtn77xg3thkiqprc9r',1,'view','List: Bugs ?','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"50117d52-bcc7-4750-82aa-831a351c44a0\":145,\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"values\":[\"1fdbb515-edd2-4af5-80fc-437ed2211a49\"]}],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957126767,1675957126767,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('vqhw65ie4niyw5xsn84do5oapaa','2023-02-09 15:38:41.339664','b7wnw9awd4pnefryhq51apbzb4c',1,'view','Discussion Items','{\"cardOrder\":[\"cjpkiya33qsagr4f9hrdwhgiajc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"4cf1568d-530f-4028-8ffd-bdc65249187e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"4cf1568d-530f-4028-8ffd-bdc65249187e\"]}',1675957121332,1675957121332,0,NULL,'system','','system','bbkwfs1z8y38x5frdqe4mfnw15h'),('vs9fpcw9uwfb4zxrnyb5bu7hqmc','2023-02-09 15:38:45.823803','bixohg18tt11in4qbtinimk974y',1,'view','By Status','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"af6hjb3ysuaxbwnfqpby4wwnkdr\",\"aotxum1p5bw3xuzqz3ctjw66yww\",\"a7yq89whddzob1futao4rxk3yzc\",\"aseqq9hrsua56r3s6nbuirj9eec\",\"ap93ysuzy1xa7z818r6myrn4h4y\"],\"visiblePropertyIds\":[]}',1675957125820,1675957125820,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('vsduwy3mq3bgkpqtanncct5ab3e','2023-02-09 15:38:46.746544','bui5izho7dtn77xg3thkiqprc9r',1,'view','Board: Sprints','{\"cardOrder\":[\"cncdr6c56zpgh5xnxy1ws4syt8y\",\"cp6ireo8debnc7q9jpfbeu5gwth\",\"cpiw648g9s3dqiqs3sxup3n7qec\",\"cjd9omd3z8tgh3yc8g94zqiukrr\",\"c8ykbwa643fy6tk5btqmbzteiyh\",\"c16iiiyo9xjyitrhaa4r7qwrcgh\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"60985f46-3e41-486e-8213-2b987440ea1c\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957126742,1675957126742,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('vt7kwb3cbsty1jrqji7fiyoos5r','2023-02-09 15:38:46.755393','bui5izho7dtn77xg3thkiqprc9r',1,'view','List: Tasks ?','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"50117d52-bcc7-4750-82aa-831a351c44a0\":139,\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"values\":[\"6eea96c9-4c61-4968-8554-4b7537e8f748\"]}],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"reversed\":true}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957126751,1675957126751,0,NULL,'system','','system','b4w3wre58zifg8jorhcejo8cjny'),('vu88p6t3xk3ri7duubym9jxd3zy','2023-02-09 15:38:45.055314','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','By Status','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"77c539af-309c-4db1-8329-d20ef7e9eacd\",\"98bdea27-0cce-4cde-8dc6-212add36e63a\",\"\"],\"visiblePropertyIds\":[\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\"]}',1675957125051,1675957125051,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('vu9twba3supdh3f5m5m4gk5dqrc','2023-02-09 15:38:45.816212','bh4pkixqsjift58e1qy6htrgeay',1,'view','By Date','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"akrxgi7p7w14fym3gbynb98t9fh\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957125811,1675957125811,0,NULL,'system','','system','b6dbd9me9h3fn8j6okq4rbbzs5w'),('vunuks7tjatyjz8j9n5b4xxajja','2023-02-09 15:38:47.293070','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Gallery View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"gallery\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957127289,1675957127289,0,NULL,'system','','system','be6gme7t96trpjd5799an9pxafe'),('vuqgft1upw7y9myqydgbm81tonr','2023-02-09 15:38:46.289516','brs9cdimfw7fodyi7erqt747rhc',1,'view','Due Date Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a39x5cybshwrbjpc3juaakcyj6e\",\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957126285,1675957126285,0,NULL,'system','','system','bbfan6gkfy3ysirfrjjrczo6jzh'),('vwt4ikwyo3br3tn7wptnzabyske','2023-02-09 15:38:45.064401','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"ajy6xbebzopojaenbnmfpgtdwso\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675957125059,1675957125059,0,NULL,'system','','system','biczsf63q1fg6pkdd8ufyg49mdw'),('vxrjb64ap4pb5br9ukco4g36rjy','2023-02-09 15:38:46.558457','bjbhs6bos3m8zjouf78xceg9nqw',1,'view','Board view','{\"cardOrder\":[\"cniwb8xwcqtbstbcm3sdfrr854h\",\"cs4qwpzr65fgttd7364dicskanh\",\"c9s78pzbdg3g4jkcdjqahtnfejc\",\"c8utmazns878jtfgtf7exyi9pee\",\"cnobejmb6bf8e3c1w7em5z4pwyh\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aok6pgecm85qe9k5kcphzoe63ma\",\"aq1dwbf661yx337hjcd5q3sbxwa\",\"ar87yh5xmsswqkxmjq1ipfftfpc\",\"akj3fkmxq7idma55mdt8sqpumyw\"],\"visiblePropertyIds\":[\"aspaay76a5wrnuhtqgm97tt3rer\"]}',1675957126555,1675957126555,0,NULL,'system','','system','ba4ippd1e5fgztr91jm5zwfdgxc'),('vyxuq3nrpc3fzz8worq116qny7a','2023-02-09 15:38:42.095352','bzwb99zf498tsm7mjqbiy7g81ze',1,'view','Open Deals','{\"cardOrder\":[\"cuow7xsfr6jdzzpsz9q541d4sth\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"a5hwxjsmkn6bak6r7uea5bx1kwc\",\"values\":[\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"aic89a5xox4wbppi6mbyx6ujsda\",\"ah6ehh43rwj88jy4awensin8pcw\",\"aprhd96zwi34o9cs4xyr3o9sf3c\",\"axesd74yuxtbmw1sbk8ufax7z3a\"]}],\"operation\":\"and\"},\"groupById\":\"aro91wme9kfaie5ceu9qasmtcnw\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"apjnaggwixchfxwiatfh7ey7uno\",\"apiswzj7uiwbh87z8dw8c6mturw\",\"auu9bfzqeuruyjwzzqgz7q8apuw\",\"\"],\"visiblePropertyIds\":[]}',1675957122091,1675957122090,0,NULL,'system','','system','bfemehc1x7b8jidcrxngy5norew'),('vzi3st7ph4bne9mxymhceyt4eey','2023-02-09 15:38:45.292759','bgi1yqiis8t8xdqxgnet8ebutky',1,'view','By Type','{\"cardOrder\":[\"csbgswatyspdiuknhxrfx4muwxa\",\"cdwyteuoeajf6dnjozotzgrtoco\",\"cafmdcqpeupyd3rhzyigdz3mcmh\",\"cekput58kh3n4jf5cf9neytx4hc\",\"cyrh1tksy5bdsdgwejsf3uyrm8y\",\"cbupk1g7hifncimcqp195orzqxo\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"a5yxq8rbubrpnoommfwqmty138h\",\"apht1nt5ryukdmxkh6fkfn6rgoy\",\"aiycbuo3dr5k4xxbfr7coem8ono\",\"aomnawq4551cbbzha9gxnmb3z5w\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957125288,1675957125287,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r'),('vztfcigr65tb9tepufipu66uswh','2023-02-09 15:38:45.282867','bgi1yqiis8t8xdqxgnet8ebutky',1,'view','By Status','{\"cardOrder\":[\"cyrh1tksy5bdsdgwejsf3uyrm8y\",\"cekput58kh3n4jf5cf9neytx4hc\",\"cdwyteuoeajf6dnjozotzgrtoco\",\"csbgswatyspdiuknhxrfx4muwxa\",\"cafmdcqpeupyd3rhzyigdz3mcmh\",\"cbupk1g7hifncimcqp195orzqxo\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"abrfos7e7eczk9rqw6y5abadm1y\",\"ax8wzbka5ahs3zziji3pp4qp9mc\",\"atabdfbdmjh83136d5e5oysxybw\",\"ace1bzypd586kkyhcht5qqd9eca\",\"aay656c9m1hzwxc9ch5ftymh3nw\",\"a6ghze4iy441qhsh3eijnc8hwze\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675957125277,1675957125277,0,NULL,'system','','system','b3i7jh9mefjdsudcgxscye19t5r');
/*!40000 ALTER TABLE `focalboard_blocks_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_board_members`
--

DROP TABLE IF EXISTS `focalboard_board_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_board_members` (
  `board_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `roles` varchar(64) DEFAULT NULL,
  `scheme_admin` tinyint(1) DEFAULT NULL,
  `scheme_editor` tinyint(1) DEFAULT NULL,
  `scheme_commenter` tinyint(1) DEFAULT NULL,
  `scheme_viewer` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`board_id`,`user_id`),
  KEY `idx_boardmembers_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_board_members`
--

LOCK TABLES `focalboard_board_members` WRITE;
/*!40000 ALTER TABLE `focalboard_board_members` DISABLE KEYS */;
INSERT INTO `focalboard_board_members` VALUES ('b3i7jh9mefjdsudcgxscye19t5r','system','',1,0,0,0),('b4w3wre58zifg8jorhcejo8cjny','system','',1,0,0,0),('b6dbd9me9h3fn8j6okq4rbbzs5w','system','',1,0,0,0),('ba4ippd1e5fgztr91jm5zwfdgxc','system','',1,0,0,0),('bbfan6gkfy3ysirfrjjrczo6jzh','system','',1,0,0,0),('bbkwfs1z8y38x5frdqe4mfnw15h','system','',1,0,0,0),('bboohqdtgptdjtgeqd8hu1tj96o','system','',1,0,0,0),('bd56m1jgc37f3byxc5h15mkr9qw','system','',1,0,0,0),('bdi5nwqfuyjb7tg5c477gr3x85o','system','',1,0,0,0),('be6gme7t96trpjd5799an9pxafe','system','',1,0,0,0),('bfemehc1x7b8jidcrxngy5norew','system','',1,0,0,0),('bfkwpzdjcu7dxjmwgom3cn75cec','system','',1,0,0,0),('biczsf63q1fg6pkdd8ufyg49mdw','system','',1,0,0,0);
/*!40000 ALTER TABLE `focalboard_board_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_board_members_history`
--

DROP TABLE IF EXISTS `focalboard_board_members_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_board_members_history` (
  `board_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `action` varchar(10) DEFAULT NULL,
  `insert_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`board_id`,`user_id`,`insert_at`),
  KEY `idx_boardmembershistory_user_id` (`user_id`),
  KEY `idx_boardmembershistory_board_id_user_id` (`board_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_board_members_history`
--

LOCK TABLES `focalboard_board_members_history` WRITE;
/*!40000 ALTER TABLE `focalboard_board_members_history` DISABLE KEYS */;
INSERT INTO `focalboard_board_members_history` VALUES ('b3i7jh9mefjdsudcgxscye19t5r','system','created','2023-02-09 15:38:45.745611'),('b4w3wre58zifg8jorhcejo8cjny','system','created','2023-02-09 15:38:47.152468'),('b6dbd9me9h3fn8j6okq4rbbzs5w','system','created','2023-02-09 15:38:45.986387'),('ba4ippd1e5fgztr91jm5zwfdgxc','system','created','2023-02-09 15:38:46.667676'),('bbfan6gkfy3ysirfrjjrczo6jzh','system','created','2023-02-09 15:38:46.530429'),('bbkwfs1z8y38x5frdqe4mfnw15h','system','created','2023-02-09 15:38:41.983244'),('bboohqdtgptdjtgeqd8hu1tj96o','system','created','2023-02-09 15:38:44.792879'),('bd56m1jgc37f3byxc5h15mkr9qw','system','created','2023-02-09 15:38:45.006371'),('bdi5nwqfuyjb7tg5c477gr3x85o','system','created','2023-02-09 15:38:43.836506'),('be6gme7t96trpjd5799an9pxafe','system','created','2023-02-09 15:38:47.872614'),('bfemehc1x7b8jidcrxngy5norew','system','created','2023-02-09 15:38:43.530649'),('bfkwpzdjcu7dxjmwgom3cn75cec','system','created','2023-02-09 15:38:46.223360'),('biczsf63q1fg6pkdd8ufyg49mdw','system','created','2023-02-09 15:38:45.153749');
/*!40000 ALTER TABLE `focalboard_board_members_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_boards`
--

DROP TABLE IF EXISTS `focalboard_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_boards` (
  `id` varchar(36) NOT NULL,
  `insert_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `team_id` varchar(36) NOT NULL,
  `channel_id` varchar(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `modified_by` varchar(36) DEFAULT NULL,
  `type` varchar(1) NOT NULL,
  `title` text NOT NULL,
  `description` text,
  `icon` varchar(256) DEFAULT NULL,
  `show_description` tinyint(1) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT NULL,
  `template_version` int(11) DEFAULT '0',
  `properties` json DEFAULT NULL,
  `card_properties` json DEFAULT NULL,
  `create_at` bigint(20) DEFAULT NULL,
  `update_at` bigint(20) DEFAULT NULL,
  `delete_at` bigint(20) DEFAULT NULL,
  `minimum_role` varchar(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_board_team_id` (`team_id`,`is_template`),
  KEY `idx_board_channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_boards`
--

LOCK TABLES `focalboard_boards` WRITE;
/*!40000 ALTER TABLE `focalboard_boards` DISABLE KEYS */;
INSERT INTO `focalboard_boards` VALUES ('b3i7jh9mefjdsudcgxscye19t5r','2023-02-09 15:38:45.165933','0','','system','system','O','Sprint Planner ','Use this template to plan your sprints and manage your releases more efficiently.','?️',1,1,6,'{\"trackingTemplateId\": \"99b74e26d2f5d0a9b346d43c0a7bfb09\"}','[{\"id\": \"50117d52-bcc7-4750-82aa-831a351c44a0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"aft5bzo7h9aspqgrx3jpy5tzrer\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"abrfos7e7eczk9rqw6y5abadm1y\", \"color\": \"propColorOrange\", \"value\": \"Next Up\"}, {\"id\": \"ax8wzbka5ahs3zziji3pp4qp9mc\", \"color\": \"propColorBlue\", \"value\": \"In Progress\"}, {\"id\": \"atabdfbdmjh83136d5e5oysxybw\", \"color\": \"propColorYellow\", \"value\": \"In Review\"}, {\"id\": \"ace1bzypd586kkyhcht5qqd9eca\", \"color\": \"propColorPink\", \"value\": \"Approved\"}, {\"id\": \"aay656c9m1hzwxc9ch5ftymh3nw\", \"color\": \"propColorRed\", \"value\": \"Blocked\"}, {\"id\": \"a6ghze4iy441qhsh3eijnc8hwze\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"20717ad3-5741-4416-83f1-6f133fff3d11\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"424ea5e3-9aa1-4075-8c5c-01b44b66e634\", \"color\": \"propColorYellow\", \"value\": \"Epic ⛰\"}, {\"id\": \"a5yxq8rbubrpnoommfwqmty138h\", \"color\": \"propColorGray\", \"value\": \"Feature ?\"}, {\"id\": \"apht1nt5ryukdmxkh6fkfn6rgoy\", \"color\": \"propColorOrange\", \"value\": \"User Story ?\"}, {\"id\": \"aiycbuo3dr5k4xxbfr7coem8ono\", \"color\": \"propColorGreen\", \"value\": \"Task ⛏\"}, {\"id\": \"aomnawq4551cbbzha9gxnmb3z5w\", \"color\": \"propColorRed\", \"value\": \"Bug ?\"}]}, {\"id\": \"60985f46-3e41-486e-8213-2b987440ea1c\", \"name\": \"Sprint\", \"type\": \"select\", \"options\": [{\"id\": \"c01676ca-babf-4534-8be5-cce2287daa6c\", \"color\": \"propColorBrown\", \"value\": \"Sprint 1\"}, {\"id\": \"ed4a5340-460d-461b-8838-2c56e8ee59fe\", \"color\": \"propColorPurple\", \"value\": \"Sprint 2\"}, {\"id\": \"14892380-1a32-42dd-8034-a0cea32bc7e6\", \"color\": \"propColorBlue\", \"value\": \"Sprint 3\"}]}, {\"id\": \"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"e6a7f297-4440-4783-8ab3-3af5ba62ca11\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"c62172ea-5da7-4dec-8186-37267d8ee9a7\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aphg37f7zbpuc3bhwhp19s1ribh\", \"name\": \"Assignee\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"a4378omyhmgj3bex13sj4wbpfiy\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"ai7ajsdk14w7x5s8up3dwir77te\", \"name\": \"Story Points\", \"type\": \"number\", \"options\": []}, {\"id\": \"a1g6i613dpe9oryeo71ex3c86hy\", \"name\": \"Design Link\", \"type\": \"url\", \"options\": []}, {\"id\": \"aeomttrbhhsi8bph31jn84sto6h\", \"name\": \"Created Time\", \"type\": \"createdTime\", \"options\": []}, {\"id\": \"ax9f8so418s6s65hi5ympd93i6a\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}]',1675957125161,1675957125161,0,''),('b4w3wre58zifg8jorhcejo8cjny','2023-02-09 15:38:46.676143','0','','system','system','O','Roadmap ','Use this template to plan your roadmap and manage your releases more efficiently.','?️',1,1,6,'{\"trackingTemplateId\": \"b728c6ca730e2cfc229741c5a4712b65\"}','[{\"id\": \"50117d52-bcc7-4750-82aa-831a351c44a0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"ec6d2bc5-df2b-4f77-8479-e59ceb039946\", \"color\": \"propColorYellow\", \"value\": \"In Progress\"}, {\"id\": \"849766ba-56a5-48d1-886f-21672f415395\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"20717ad3-5741-4416-83f1-6f133fff3d11\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"424ea5e3-9aa1-4075-8c5c-01b44b66e634\", \"color\": \"propColorYellow\", \"value\": \"Epic ⛰\"}, {\"id\": \"6eea96c9-4c61-4968-8554-4b7537e8f748\", \"color\": \"propColorGreen\", \"value\": \"Task ?\"}, {\"id\": \"1fdbb515-edd2-4af5-80fc-437ed2211a49\", \"color\": \"propColorRed\", \"value\": \"Bug ?\"}]}, {\"id\": \"60985f46-3e41-486e-8213-2b987440ea1c\", \"name\": \"Sprint\", \"type\": \"select\", \"options\": [{\"id\": \"c01676ca-babf-4534-8be5-cce2287daa6c\", \"color\": \"propColorBrown\", \"value\": \"Sprint 1\"}, {\"id\": \"ed4a5340-460d-461b-8838-2c56e8ee59fe\", \"color\": \"propColorPurple\", \"value\": \"Sprint 2\"}, {\"id\": \"14892380-1a32-42dd-8034-a0cea32bc7e6\", \"color\": \"propColorBlue\", \"value\": \"Sprint 3\"}]}, {\"id\": \"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"e6a7f297-4440-4783-8ab3-3af5ba62ca11\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"c62172ea-5da7-4dec-8186-37267d8ee9a7\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aphg37f7zbpuc3bhwhp19s1ribh\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a4378omyhmgj3bex13sj4wbpfiy\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"a36o9q1yik6nmar6ri4q4uca7ey\", \"name\": \"Created Date\", \"type\": \"createdTime\", \"options\": []}, {\"id\": \"ai7ajsdk14w7x5s8up3dwir77te\", \"name\": \"Design Link\", \"type\": \"url\", \"options\": []}]',1675957126674,1675957126674,0,''),('b6dbd9me9h3fn8j6okq4rbbzs5w','2023-02-09 15:38:45.755338','0','','system','system','O','User Research Sessions','Use this template to manage and keep track of all your user research sessions.','?',1,1,6,'{\"trackingTemplateId\": \"6c345c7f50f6833f78b7d0f08ce450a3\"}','[{\"id\": \"aaebj5fyx493eezx6ukxiwydgty\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"af6hjb3ysuaxbwnfqpby4wwnkdr\", \"color\": \"propColorGray\", \"value\": \"Backlog ?\"}, {\"id\": \"aotxum1p5bw3xuzqz3ctjw66yww\", \"color\": \"propColorYellow\", \"value\": \"Contacted ?\"}, {\"id\": \"a7yq89whddzob1futao4rxk3yzc\", \"color\": \"propColorBlue\", \"value\": \"Scheduled ?\"}, {\"id\": \"aseqq9hrsua56r3s6nbuirj9eec\", \"color\": \"propColorRed\", \"value\": \"Cancelled ?\"}, {\"id\": \"ap93ysuzy1xa7z818r6myrn4h4y\", \"color\": \"propColorGreen\", \"value\": \"Completed ✔️\"}]}, {\"id\": \"akrxgi7p7w14fym3gbynb98t9fh\", \"name\": \"Interview Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"atg9qu6oe4bjm8jczzsn71ff5me\", \"name\": \"Product Area\", \"type\": \"select\", \"options\": [{\"id\": \"ahn89mqg9u4igk6pdm7333t8i5h\", \"color\": \"propColorGreen\", \"value\": \"Desktop App\"}, {\"id\": \"aehc83ffays3gh8myz16a8j7k4e\", \"color\": \"propColorPurple\", \"value\": \"Web App\"}, {\"id\": \"a1sxagjgaadym5yrjak6tcup1oa\", \"color\": \"propColorBlue\", \"value\": \"Mobile App\"}]}, {\"id\": \"acjq4t5ymytu8x1f68wkggm7ypc\", \"name\": \"Email\", \"type\": \"email\", \"options\": []}, {\"id\": \"aphio1s5gkmpdbwoxynim7acw3e\", \"name\": \"Interviewer\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"aqafzdeekpyncwz7m7i54q3iqqy\", \"name\": \"Recording URL\", \"type\": \"url\", \"options\": []}, {\"id\": \"aify3r761b9w43bqjtskrzi68tr\", \"name\": \"Passcode\", \"type\": \"text\", \"options\": []}]',1675957125753,1675957125753,0,''),('ba4ippd1e5fgztr91jm5zwfdgxc','2023-02-09 15:38:46.550002','0','','system','system','O','Team Retrospective','Use this template at the end of your project or sprint to identify what worked well and what can be improved for the future.','?',1,1,6,'{\"trackingTemplateId\": \"e4f03181c4ced8edd4d53d33d569a086\"}','[{\"id\": \"adjckpdotpgkz7c6wixzw9ipb1e\", \"name\": \"Category\", \"type\": \"select\", \"options\": [{\"id\": \"aok6pgecm85qe9k5kcphzoe63ma\", \"color\": \"propColorGray\", \"value\": \"To Discuss ?\"}, {\"id\": \"aq1dwbf661yx337hjcd5q3sbxwa\", \"color\": \"propColorGreen\", \"value\": \"Went Well ?\"}, {\"id\": \"ar87yh5xmsswqkxmjq1ipfftfpc\", \"color\": \"propColorRed\", \"value\": \"Didn\'t Go Well ?\"}, {\"id\": \"akj3fkmxq7idma55mdt8sqpumyw\", \"color\": \"propColorBlue\", \"value\": \"Action Items ✅\"}]}, {\"id\": \"aspaay76a5wrnuhtqgm97tt3rer\", \"name\": \"Details\", \"type\": \"text\", \"options\": []}, {\"id\": \"arzsm76s376y7suuhao3tu6efoc\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"a8anbe5fpa668sryatcdsuuyh8a\", \"name\": \"Created Time\", \"type\": \"createdTime\", \"options\": []}]',1675957126547,1675957126547,0,''),('bbfan6gkfy3ysirfrjjrczo6jzh','2023-02-09 15:38:46.231039','0','','system','system','O','Content Calendar ','Use this template to plan and organize your editorial content.','?',1,1,6,'{\"trackingTemplateId\": \"c75fbd659d2258b5183af2236d176ab4\"}','[{\"id\": \"ae9ar615xoknd8hw8py7mbyr7zo\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"awna1nuarjca99m9s4uiy9kwj5h\", \"color\": \"propColorGray\", \"value\": \"Idea ?\"}, {\"id\": \"a9ana1e9w673o5cp8md4xjjwfto\", \"color\": \"propColorOrange\", \"value\": \"Draft\"}, {\"id\": \"apy9dcd7zmand615p3h53zjqxjh\", \"color\": \"propColorPurple\", \"value\": \"In Review\"}, {\"id\": \"acri4cm3bmay55f7ksztphmtnga\", \"color\": \"propColorBlue\", \"value\": \"Ready to Publish\"}, {\"id\": \"amsowcd9a8e1kid317r7ttw6uzh\", \"color\": \"propColorGreen\", \"value\": \"Published ?\"}]}, {\"id\": \"aysx3atqexotgwp5kx6h5i5ancw\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"aywiofmmtd3ofgzj95ysky4pjga\", \"color\": \"propColorOrange\", \"value\": \"Press Release\"}, {\"id\": \"apqdgjrmsmx8ngmp7zst51647de\", \"color\": \"propColorGreen\", \"value\": \"Sponsored Post\"}, {\"id\": \"a3woynbjnb7j16e74uw3pubrytw\", \"color\": \"propColorPurple\", \"value\": \"Customer Story\"}, {\"id\": \"aq36k5pkpfcypqb3idw36xdi1fh\", \"color\": \"propColorRed\", \"value\": \"Product Release\"}, {\"id\": \"azn66pmk34adygnizjqhgiac4ia\", \"color\": \"propColorGray\", \"value\": \"Partnership\"}, {\"id\": \"aj8y675weso8kpb6eceqbpj4ruw\", \"color\": \"propColorBlue\", \"value\": \"Feature Announcement\"}, {\"id\": \"a3xky7ygn14osr1mokerbfah5cy\", \"color\": \"propColorYellow\", \"value\": \"Article\"}]}, {\"id\": \"ab6mbock6styfe6htf815ph1mhw\", \"name\": \"Channel\", \"type\": \"multiSelect\", \"options\": [{\"id\": \"a8xceonxiu4n3c43szhskqizicr\", \"color\": \"propColorBrown\", \"value\": \"Website\"}, {\"id\": \"a3pdzi53kpbd4okzdkz6khi87zo\", \"color\": \"propColorGreen\", \"value\": \"Blog\"}, {\"id\": \"a3d9ux4fmi3anyd11kyipfbhwde\", \"color\": \"propColorOrange\", \"value\": \"Email\"}, {\"id\": \"a8cbbfdwocx73zn3787cx6gacsh\", \"color\": \"propColorRed\", \"value\": \"Podcast\"}, {\"id\": \"aigjtpcaxdp7d6kmctrwo1ztaia\", \"color\": \"propColorPink\", \"value\": \"Print\"}, {\"id\": \"af1wsn13muho59e7ghwaogxy5ey\", \"color\": \"propColorBlue\", \"value\": \"Facebook\"}, {\"id\": \"a47zajfxwhsg6q8m7ppbiqs7jge\", \"color\": \"propColorGray\", \"value\": \"LinkedIn\"}, {\"id\": \"az8o8pfe9hq6s7xaehoqyc3wpyc\", \"color\": \"propColorYellow\", \"value\": \"Twitter\"}]}, {\"id\": \"ao44fz8nf6z6tuj1x31t9yyehcc\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a39x5cybshwrbjpc3juaakcyj6e\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"agqsoiipowmnu9rdwxm57zrehtr\", \"name\": \"Publication Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"ap4e7kdg7eip7j3c3oyiz39eaoc\", \"name\": \"Link\", \"type\": \"url\", \"options\": []}]',1675957126229,1675957126229,0,''),('bbkwfs1z8y38x5frdqe4mfnw15h','2023-02-09 15:38:41.241513','0','','system','system','O','Meeting Agenda ','Use this template for recurring meeting agendas, like team meetings and 1:1\'s. To use this board:\n* Participants queue new items to discuss under \"To Discuss\"\n* Go through items during the meeting\n* Move items to Done or Revisit Later as needed','?',1,1,6,'{\"trackingTemplateId\": \"54fcf9c610f0ac5e4c522c0657c90602\"}','[{\"id\": \"d777ba3b-8728-40d1-87a6-59406bbbbfb0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\", \"color\": \"propColorPink\", \"value\": \"To Discuss ?\"}, {\"id\": \"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed\", \"color\": \"propColorYellow\", \"value\": \"Revisit Later ⏳\"}, {\"id\": \"dabadd9b-adf1-4d9f-8702-805ac6cef602\", \"color\": \"propColorGreen\", \"value\": \"Done / Archived ?\"}]}, {\"id\": \"4cf1568d-530f-4028-8ffd-bdc65249187e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"8b05c83e-a44a-4d04-831e-97f01d8e2003\", \"color\": \"propColorRed\", \"value\": \"1. High\"}, {\"id\": \"b1abafbf-a038-4a19-8b68-56e0fd2319f7\", \"color\": \"propColorYellow\", \"value\": \"2. Medium\"}, {\"id\": \"2491ffaa-eb55-417b-8aff-4bd7d4136613\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"aw4w63xhet79y9gueqzzeiifdoe\", \"name\": \"Created by\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"a6ux19353xcwfqg9k1inqg5sg4w\", \"name\": \"Created time\", \"type\": \"createdTime\", \"options\": []}]',1675957121239,1675957121239,0,''),('bboohqdtgptdjtgeqd8hu1tj96o','2023-02-09 15:38:43.911635','0','','system','system','O','Project Tasks ','Use this template to stay on top of your project tasks and progress.','?',1,1,6,'{\"trackingTemplateId\": \"a4ec399ab4f2088b1051c3cdf1dde4c3\"}','[{\"id\": \"a972dc7a-5f4c-45d2-8044-8c28c69717f1\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"ayz81h9f3dwp7rzzbdebesc7ute\", \"color\": \"propColorBlue\", \"value\": \"Not Started\"}, {\"id\": \"ar6b8m3jxr3asyxhr8iucdbo6yc\", \"color\": \"propColorYellow\", \"value\": \"In Progress\"}, {\"id\": \"afi4o5nhnqc3smtzs1hs3ij34dh\", \"color\": \"propColorRed\", \"value\": \"Blocked\"}, {\"id\": \"adeo5xuwne3qjue83fcozekz8ko\", \"color\": \"propColorGreen\", \"value\": \"Completed ?\"}, {\"id\": \"ahpyxfnnrzynsw3im1psxpkgtpe\", \"color\": \"propColorBrown\", \"value\": \"Archived\"}]}, {\"id\": \"d3d682bf-e074-49d9-8df5-7320921c2d23\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\", \"color\": \"propColorRed\", \"value\": \"1. High ?\"}, {\"id\": \"87f59784-b859-4c24-8ebe-17c766e081dd\", \"color\": \"propColorYellow\", \"value\": \"2. Medium\"}, {\"id\": \"98a57627-0f76-471d-850d-91f3ed9fd213\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"axkhqa4jxr3jcqe4k87g8bhmary\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a8daz81s4xjgke1ww6cwik5w7ye\", \"name\": \"Estimated Hours\", \"type\": \"number\", \"options\": []}, {\"id\": \"a3zsw7xs8sxy7atj8b6totp3mby\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"a7gdnz8ff8iyuqmzddjgmgo9ery\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"2a5da320-735c-4093-8787-f56e15cdfeed\", \"name\": \"Date Created\", \"type\": \"createdTime\", \"options\": []}]',1675957123910,1675957123910,0,''),('bd56m1jgc37f3byxc5h15mkr9qw','2023-02-09 15:38:44.802795','0','','system','system','O','Company Goals & OKRs','Use this template to plan your company goals and OKRs more efficiently.','⛳',1,1,6,'{\"trackingTemplateId\": \"7ba22ccfdfac391d63dea5c4b8cde0de\"}','[{\"id\": \"a6amddgmrzakw66cidqzgk6p4ge\", \"name\": \"Objective\", \"type\": \"select\", \"options\": [{\"id\": \"auw3afh3kfhrfgmjr8muiz137jy\", \"color\": \"propColorGreen\", \"value\": \"Grow Revenue\"}, {\"id\": \"apqfjst8massbjjhpcsjs3y1yqa\", \"color\": \"propColorOrange\", \"value\": \"Delight Customers\"}, {\"id\": \"ao9b5pxyt7tkgdohzh9oaustdhr\", \"color\": \"propColorPurple\", \"value\": \"Drive Product Adoption\"}]}, {\"id\": \"a17ryhi1jfsboxkwkztwawhmsxe\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"a6robxx81diugpjq5jkezz3j1fo\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"a8nukezwwmknqwjsygg7eaxs9te\", \"color\": \"propColorBlue\", \"value\": \"In Progress\"}, {\"id\": \"apnt1f7na9rzgk1rt49keg7xbiy\", \"color\": \"propColorYellow\", \"value\": \"At Risk\"}, {\"id\": \"axbz3m1amss335wzwf9s7pqjzxr\", \"color\": \"propColorRed\", \"value\": \"Missed\"}, {\"id\": \"abzfwnn6rmtfzyq5hg8uqmpsncy\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"azzbawji5bksj69sekcs4srm1ky\", \"name\": \"Department\", \"type\": \"select\", \"options\": [{\"id\": \"aw5i7hmpadn6mbwbz955ubarhme\", \"color\": \"propColorBrown\", \"value\": \"Engineering\"}, {\"id\": \"afkxpcjqjypu7hhar7banxau91h\", \"color\": \"propColorBlue\", \"value\": \"Product\"}, {\"id\": \"aehoa17cz18rqnrf75g7dwhphpr\", \"color\": \"propColorOrange\", \"value\": \"Marketing\"}, {\"id\": \"agrfeaoj7d8p5ianw5iaf3191ae\", \"color\": \"propColorGreen\", \"value\": \"Sales\"}, {\"id\": \"agm9p6gcq15ueuzqq3wd4be39wy\", \"color\": \"propColorYellow\", \"value\": \"Support\"}, {\"id\": \"aucop7kw6xwodcix6zzojhxih6r\", \"color\": \"propColorPink\", \"value\": \"Design\"}, {\"id\": \"afust91f3g8ht368mkn5x9tgf1o\", \"color\": \"propColorPurple\", \"value\": \"Finance\"}, {\"id\": \"acocxxwjurud1jixhp7nowdig7y\", \"color\": \"propColorGray\", \"value\": \"Human Resources\"}]}, {\"id\": \"adp5ft3kgz7r5iqq3tnwg551der\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"a8zg3rjtf4swh7smsjxpsn743rh\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"as555ipyzopjjpfb5rjtssecw5e\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"a1ts3ftyr8nocsicui98c89uxjy\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aqxyzkdrs4egqf7yk866ixkaojc\", \"name\": \"Quarter\", \"type\": \"select\", \"options\": [{\"id\": \"ahfbn1jsmhydym33ygxwg5jt3kh\", \"color\": \"propColorBlue\", \"value\": \"Q1\"}, {\"id\": \"awfu37js3fomfkkczm1zppac57a\", \"color\": \"propColorBrown\", \"value\": \"Q2\"}, {\"id\": \"anruuoyez51r3yjxuoc8zoqnwaw\", \"color\": \"propColorGreen\", \"value\": \"Q3\"}, {\"id\": \"acb6dqqs6yson7bbzx6jk9bghjh\", \"color\": \"propColorPurple\", \"value\": \"Q4\"}]}, {\"id\": \"adu6mebzpibq6mgcswk69xxmnqe\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"asope3bddhm4gpsng5cfu4hf6rh\", \"name\": \"Assignee\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"ajwxp866f9obs1kutfwaa5ru7fe\", \"name\": \"Target\", \"type\": \"number\", \"options\": []}, {\"id\": \"azqnyswk6s1boiwuthscm78qwuo\", \"name\": \"Actual\", \"type\": \"number\", \"options\": []}, {\"id\": \"ahz3fmjnaguec8hce7xq3h5cjdr\", \"name\": \"Completion (%)\", \"type\": \"text\", \"options\": []}, {\"id\": \"a17bfcgnzmkwhziwa4tr38kiw5r\", \"name\": \"Note\", \"type\": \"text\", \"options\": []}]',1675957124801,1675957124801,0,''),('bdi5nwqfuyjb7tg5c477gr3x85o','2023-02-09 15:38:43.537853','0','','system','system','O','Personal Tasks ','Use this template to organize your life and track your personal tasks.','✔️',1,1,6,'{\"trackingTemplateId\": \"dfb70c146a4584b8a21837477c7b5431\"}','[{\"id\": \"a9zf59u8x1rf4ywctpcqama7tio\", \"name\": \"Occurrence\", \"type\": \"select\", \"options\": [{\"id\": \"an51dnkenmoog9cetapbc4uyt3y\", \"color\": \"propColorBlue\", \"value\": \"Daily\"}, {\"id\": \"afpy8s7i45frggprmfsqngsocqh\", \"color\": \"propColorOrange\", \"value\": \"Weekly\"}, {\"id\": \"aj4jyekqqssatjcq7r7chmy19ey\", \"color\": \"propColorPurple\", \"value\": \"Monthly\"}]}, {\"id\": \"abthng7baedhhtrwsdodeuincqy\", \"name\": \"Completed\", \"type\": \"checkbox\", \"options\": []}]',1675957123536,1675957123536,0,''),('be6gme7t96trpjd5799an9pxafe','2023-02-09 15:38:47.177817','0','','system','system','O','Welcome to Boards!','Mattermost Boards is an open source project management tool that helps you organize, track, and manage work across teams. Select a card to learn more.','?',1,1,6,'{\"trackingTemplateId\": \"65aba997282f3ac457cd66736fb86915\"}','[{\"id\": \"a972dc7a-5f4c-45d2-8044-8c28c69717f1\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"amm6wfhnbuxojwssyftgs9dipqe\", \"color\": \"propColorRed\", \"value\": \"To do ?\"}, {\"id\": \"af3p8ztcyxgn8wd9z4az7o9tjeh\", \"color\": \"propColorYellow\", \"value\": \"Next up\"}, {\"id\": \"ajurey3xkocs1nwx8di5zx6oe7o\", \"color\": \"propColorPurple\", \"value\": \"Later\"}, {\"id\": \"agkinkjy5983wsk6kppsujajxqw\", \"color\": \"propColorGreen\", \"value\": \"Completed ?\"}]}, {\"id\": \"acypkejeb5yfujhj9te57p9kaxw\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"aanaehcw3m13jytujsjk5hpf6ry\", \"color\": \"propColorOrange\", \"value\": \"1. High\"}, {\"id\": \"ascd7nm9r491ayot8i86g1gmgqw\", \"color\": \"propColorBrown\", \"value\": \"2. Medium\"}, {\"id\": \"aq6ukoiciyfctgwyhwzpfss8ghe\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"aqh13jabwexjkzr3jqsz1i1syew\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"acmg7mz1rr1eykfug4hcdpb1y1o\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"amewjwfjrtpu8ha73xsrdmxazxr\", \"name\": \"Reviewed\", \"type\": \"checkbox\", \"options\": []}, {\"id\": \"attzzboqaz6m1sdti5xa7gjnk1e\", \"name\": \"Last updated time\", \"type\": \"updatedTime\", \"options\": []}, {\"id\": \"a4nfnb5xr3txr5xq7y9ho7kyz6c\", \"name\": \"Reference\", \"type\": \"url\", \"options\": []}, {\"id\": \"a9gzwi3dt5n55nddej6zcbhxaeh\", \"name\": \"Created by\", \"type\": \"createdBy\", \"options\": []}]',1675957127176,1675957127176,0,''),('bfemehc1x7b8jidcrxngy5norew','2023-02-09 15:38:41.999024','0','','system','system','O','Sales Pipeline CRM','Use this template to grow and keep track of your sales opportunities.','?',1,1,6,'{\"trackingTemplateId\": \"ecc250bb7dff0fe02247f1110f097544\"}','[{\"id\": \"a5hwxjsmkn6bak6r7uea5bx1kwc\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"akj61wc9yxdwyw3t6m8igyf9d5o\", \"color\": \"propColorGray\", \"value\": \"Lead\"}, {\"id\": \"aic89a5xox4wbppi6mbyx6ujsda\", \"color\": \"propColorYellow\", \"value\": \"Qualified\"}, {\"id\": \"ah6ehh43rwj88jy4awensin8pcw\", \"color\": \"propColorBrown\", \"value\": \"Meeting\"}, {\"id\": \"aprhd96zwi34o9cs4xyr3o9sf3c\", \"color\": \"propColorPurple\", \"value\": \"Proposal\"}, {\"id\": \"axesd74yuxtbmw1sbk8ufax7z3a\", \"color\": \"propColorOrange\", \"value\": \"Negotiation\"}, {\"id\": \"a5txuiubumsmrs8gsd5jz5gc1oa\", \"color\": \"propColorRed\", \"value\": \"Lost\"}, {\"id\": \"acm9q494bcthyoqzmfogxxy5czy\", \"color\": \"propColorGreen\", \"value\": \"Closed ?\"}]}, {\"id\": \"aoheuj1f3mu6eehygr45fxa144y\", \"name\": \"Account Owner\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"aro91wme9kfaie5ceu9qasmtcnw\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"apjnaggwixchfxwiatfh7ey7uno\", \"color\": \"propColorRed\", \"value\": \"High ?\"}, {\"id\": \"apiswzj7uiwbh87z8dw8c6mturw\", \"color\": \"propColorYellow\", \"value\": \"Medium\"}, {\"id\": \"auu9bfzqeuruyjwzzqgz7q8apuw\", \"color\": \"propColorBrown\", \"value\": \"Low\"}]}, {\"id\": \"ainpw47babwkpyj77ic4b9zq9xr\", \"name\": \"Company\", \"type\": \"text\", \"options\": []}, {\"id\": \"ahf43e44h3y8ftanqgzno9z7q7w\", \"name\": \"Estimated Value\", \"type\": \"number\", \"options\": []}, {\"id\": \"amahgyn9n4twaapg3jyxb6y4jic\", \"name\": \"Territory\", \"type\": \"select\", \"options\": [{\"id\": \"ar6t1ttcumgfuqugg5o4g4mzrza\", \"color\": \"propColorBrown\", \"value\": \"Western US\"}, {\"id\": \"asbwojkm7zb4ohrtij97jkdfgwe\", \"color\": \"propColorGreen\", \"value\": \"Mountain West / Central US\"}, {\"id\": \"aw8ppwtcrm8iwopdadje3ni196w\", \"color\": \"propColorGray\", \"value\": \"Mid-Atlantic / Southeast\"}, {\"id\": \"aafwyza5iwdcwcyfyj6bp7emufw\", \"color\": \"propColorBlue\", \"value\": \"Northeast US / Canada\"}, {\"id\": \"agw8rcb9uxyt3c7g6tq3r65fgqe\", \"color\": \"propColorPink\", \"value\": \"Eastern Europe\"}, {\"id\": \"as5bk6afoaaa7caewe1zc391sce\", \"color\": \"propColorPurple\", \"value\": \"Central Europe / Africa\"}, {\"id\": \"a8fj94bka8z9t6p95qd3hn6t5re\", \"color\": \"propColorYellow\", \"value\": \"Middle East\"}, {\"id\": \"arpxa3faaou9trt4zx5sh435gne\", \"color\": \"propColorOrange\", \"value\": \"UK\"}, {\"id\": \"azdidd5wze4kcxf8neefj3ctkyr\", \"color\": \"propColorRed\", \"value\": \"Asia\"}, {\"id\": \"a4jn5mhqs3thknqf5opykntgsnc\", \"color\": \"propColorGray\", \"value\": \"Australia\"}, {\"id\": \"afjbgrecb7hp5owj7xh8u4w33tr\", \"color\": \"propColorBrown\", \"value\": \"Latin America\"}]}, {\"id\": \"abru6tz8uebdxy4skheqidh7zxy\", \"name\": \"Email\", \"type\": \"email\", \"options\": []}, {\"id\": \"a1438fbbhjeffkexmcfhnx99o1h\", \"name\": \"Phone\", \"type\": \"phone\", \"options\": []}, {\"id\": \"auhf91pm85f73swwidi4wid8jqe\", \"name\": \"Last Contact Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"adtf1151chornmihz4xbgbk9exa\", \"name\": \"Expected Close\", \"type\": \"date\", \"options\": []}, {\"id\": \"aejo5tcmq54bauuueem9wc4fw4y\", \"name\": \"Close Probability\", \"type\": \"text\", \"options\": []}, {\"id\": \"amba7ot98fh7hwsx8jdcfst5g7h\", \"name\": \"Created Date\", \"type\": \"createdTime\", \"options\": []}]',1675957121995,1675957121995,0,''),('bfkwpzdjcu7dxjmwgom3cn75cec','2023-02-09 15:38:45.994404','0','','system','system','O','Competitive Analysis','Use this template to track and stay ahead of the competition.','?️',1,1,6,'{\"trackingTemplateId\": \"06f4bff367a7c2126fab2380c9dec23c\"}','[{\"id\": \"ahzspe59iux8wigra8bg6cg18nc\", \"name\": \"Website\", \"type\": \"url\", \"options\": []}, {\"id\": \"aozntq4go4nkab688j1s7stqtfc\", \"name\": \"Location\", \"type\": \"text\", \"options\": []}, {\"id\": \"aiefo7nh9jwisn8b4cgakowithy\", \"name\": \"Revenue\", \"type\": \"text\", \"options\": []}, {\"id\": \"a6cwaq79b1pdpb97wkanmeyy4er\", \"name\": \"Employees\", \"type\": \"number\", \"options\": []}, {\"id\": \"an1eerzscfxn6awdfajbg41uz3h\", \"name\": \"Founded\", \"type\": \"text\", \"options\": []}, {\"id\": \"a1semdhszu1rq17d7et5ydrqqio\", \"name\": \"Market Position\", \"type\": \"select\", \"options\": [{\"id\": \"arfjpz9by5car71tz3behba8yih\", \"color\": \"propColorYellow\", \"value\": \"Leader\"}, {\"id\": \"abajmr34b8g1916w495xjb35iko\", \"color\": \"propColorRed\", \"value\": \"Challenger\"}, {\"id\": \"abt79uxg5edqojsrrefcnr4eruo\", \"color\": \"propColorBlue\", \"value\": \"Follower\"}, {\"id\": \"aipf3qfgjtkheiayjuxrxbpk9wa\", \"color\": \"propColorBrown\", \"value\": \"Nicher\"}]}, {\"id\": \"aapogff3xoa8ym7xf56s87kysda\", \"name\": \"Last updated time\", \"type\": \"updatedTime\", \"options\": []}, {\"id\": \"az3jkw3ynd3mqmart7edypey15e\", \"name\": \"Last updated by\", \"type\": \"updatedBy\", \"options\": []}]',1675957125992,1675957125992,0,''),('biczsf63q1fg6pkdd8ufyg49mdw','2023-02-09 15:38:45.014475','0','','system','system','O','Personal Goals ','Use this template to set and accomplish new personal goals.','⛰️',1,1,6,'{\"trackingTemplateId\": \"7f32dc8d2ae008cfe56554e9363505cc\"}','[{\"id\": \"af6fcbb8-ca56-4b73-83eb-37437b9a667d\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\", \"color\": \"propColorRed\", \"value\": \"To Do\"}, {\"id\": \"77c539af-309c-4db1-8329-d20ef7e9eacd\", \"color\": \"propColorYellow\", \"value\": \"Doing\"}, {\"id\": \"98bdea27-0cce-4cde-8dc6-212add36e63a\", \"color\": \"propColorGreen\", \"value\": \"Done ?\"}]}, {\"id\": \"d9725d14-d5a8-48e5-8de1-6f8c004a9680\", \"name\": \"Category\", \"type\": \"select\", \"options\": [{\"id\": \"3245a32d-f688-463b-87f4-8e7142c1b397\", \"color\": \"propColorPurple\", \"value\": \"Life Skills\"}, {\"id\": \"80be816c-fc7a-4928-8489-8b02180f4954\", \"color\": \"propColorGreen\", \"value\": \"Finance\"}, {\"id\": \"ffb3f951-b47f-413b-8f1d-238666728008\", \"color\": \"propColorOrange\", \"value\": \"Health\"}]}, {\"id\": \"d6b1249b-bc18-45fc-889e-bec48fce80ef\", \"name\": \"Target\", \"type\": \"select\", \"options\": [{\"id\": \"9a090e33-b110-4268-8909-132c5002c90e\", \"color\": \"propColorBlue\", \"value\": \"Q1\"}, {\"id\": \"0a82977f-52bf-457b-841b-e2b7f76fb525\", \"color\": \"propColorBrown\", \"value\": \"Q2\"}, {\"id\": \"6e7139e4-5358-46bb-8c01-7b029a57b80a\", \"color\": \"propColorGreen\", \"value\": \"Q3\"}, {\"id\": \"d5371c63-66bf-4468-8738-c4dc4bea4843\", \"color\": \"propColorPurple\", \"value\": \"Q4\"}]}, {\"id\": \"ajy6xbebzopojaenbnmfpgtdwso\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}]',1675957125012,1675957125012,0,'');
/*!40000 ALTER TABLE `focalboard_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_boards_history`
--

DROP TABLE IF EXISTS `focalboard_boards_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_boards_history` (
  `id` varchar(36) NOT NULL,
  `insert_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `team_id` varchar(36) NOT NULL,
  `channel_id` varchar(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `modified_by` varchar(36) DEFAULT NULL,
  `type` varchar(1) NOT NULL,
  `title` text NOT NULL,
  `description` text,
  `icon` varchar(256) DEFAULT NULL,
  `show_description` tinyint(1) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT NULL,
  `template_version` int(11) DEFAULT '0',
  `properties` json DEFAULT NULL,
  `card_properties` json DEFAULT NULL,
  `create_at` bigint(20) DEFAULT NULL,
  `update_at` bigint(20) DEFAULT NULL,
  `delete_at` bigint(20) DEFAULT NULL,
  `minimum_role` varchar(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`insert_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_boards_history`
--

LOCK TABLES `focalboard_boards_history` WRITE;
/*!40000 ALTER TABLE `focalboard_boards_history` DISABLE KEYS */;
INSERT INTO `focalboard_boards_history` VALUES ('b3i7jh9mefjdsudcgxscye19t5r','2023-02-09 15:38:45.168677','0','','system','system','O','Sprint Planner ','Use this template to plan your sprints and manage your releases more efficiently.','?️',1,1,6,'{\"trackingTemplateId\": \"99b74e26d2f5d0a9b346d43c0a7bfb09\"}','[{\"id\": \"50117d52-bcc7-4750-82aa-831a351c44a0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"aft5bzo7h9aspqgrx3jpy5tzrer\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"abrfos7e7eczk9rqw6y5abadm1y\", \"color\": \"propColorOrange\", \"value\": \"Next Up\"}, {\"id\": \"ax8wzbka5ahs3zziji3pp4qp9mc\", \"color\": \"propColorBlue\", \"value\": \"In Progress\"}, {\"id\": \"atabdfbdmjh83136d5e5oysxybw\", \"color\": \"propColorYellow\", \"value\": \"In Review\"}, {\"id\": \"ace1bzypd586kkyhcht5qqd9eca\", \"color\": \"propColorPink\", \"value\": \"Approved\"}, {\"id\": \"aay656c9m1hzwxc9ch5ftymh3nw\", \"color\": \"propColorRed\", \"value\": \"Blocked\"}, {\"id\": \"a6ghze4iy441qhsh3eijnc8hwze\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"20717ad3-5741-4416-83f1-6f133fff3d11\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"424ea5e3-9aa1-4075-8c5c-01b44b66e634\", \"color\": \"propColorYellow\", \"value\": \"Epic ⛰\"}, {\"id\": \"a5yxq8rbubrpnoommfwqmty138h\", \"color\": \"propColorGray\", \"value\": \"Feature ?\"}, {\"id\": \"apht1nt5ryukdmxkh6fkfn6rgoy\", \"color\": \"propColorOrange\", \"value\": \"User Story ?\"}, {\"id\": \"aiycbuo3dr5k4xxbfr7coem8ono\", \"color\": \"propColorGreen\", \"value\": \"Task ⛏\"}, {\"id\": \"aomnawq4551cbbzha9gxnmb3z5w\", \"color\": \"propColorRed\", \"value\": \"Bug ?\"}]}, {\"id\": \"60985f46-3e41-486e-8213-2b987440ea1c\", \"name\": \"Sprint\", \"type\": \"select\", \"options\": [{\"id\": \"c01676ca-babf-4534-8be5-cce2287daa6c\", \"color\": \"propColorBrown\", \"value\": \"Sprint 1\"}, {\"id\": \"ed4a5340-460d-461b-8838-2c56e8ee59fe\", \"color\": \"propColorPurple\", \"value\": \"Sprint 2\"}, {\"id\": \"14892380-1a32-42dd-8034-a0cea32bc7e6\", \"color\": \"propColorBlue\", \"value\": \"Sprint 3\"}]}, {\"id\": \"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"e6a7f297-4440-4783-8ab3-3af5ba62ca11\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"c62172ea-5da7-4dec-8186-37267d8ee9a7\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aphg37f7zbpuc3bhwhp19s1ribh\", \"name\": \"Assignee\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"a4378omyhmgj3bex13sj4wbpfiy\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"ai7ajsdk14w7x5s8up3dwir77te\", \"name\": \"Story Points\", \"type\": \"number\", \"options\": []}, {\"id\": \"a1g6i613dpe9oryeo71ex3c86hy\", \"name\": \"Design Link\", \"type\": \"url\", \"options\": []}, {\"id\": \"aeomttrbhhsi8bph31jn84sto6h\", \"name\": \"Created Time\", \"type\": \"createdTime\", \"options\": []}, {\"id\": \"ax9f8so418s6s65hi5ympd93i6a\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}]',1675957125161,1675957125161,0,''),('b4w3wre58zifg8jorhcejo8cjny','2023-02-09 15:38:46.677972','0','','system','system','O','Roadmap ','Use this template to plan your roadmap and manage your releases more efficiently.','?️',1,1,6,'{\"trackingTemplateId\": \"b728c6ca730e2cfc229741c5a4712b65\"}','[{\"id\": \"50117d52-bcc7-4750-82aa-831a351c44a0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"ec6d2bc5-df2b-4f77-8479-e59ceb039946\", \"color\": \"propColorYellow\", \"value\": \"In Progress\"}, {\"id\": \"849766ba-56a5-48d1-886f-21672f415395\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"20717ad3-5741-4416-83f1-6f133fff3d11\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"424ea5e3-9aa1-4075-8c5c-01b44b66e634\", \"color\": \"propColorYellow\", \"value\": \"Epic ⛰\"}, {\"id\": \"6eea96c9-4c61-4968-8554-4b7537e8f748\", \"color\": \"propColorGreen\", \"value\": \"Task ?\"}, {\"id\": \"1fdbb515-edd2-4af5-80fc-437ed2211a49\", \"color\": \"propColorRed\", \"value\": \"Bug ?\"}]}, {\"id\": \"60985f46-3e41-486e-8213-2b987440ea1c\", \"name\": \"Sprint\", \"type\": \"select\", \"options\": [{\"id\": \"c01676ca-babf-4534-8be5-cce2287daa6c\", \"color\": \"propColorBrown\", \"value\": \"Sprint 1\"}, {\"id\": \"ed4a5340-460d-461b-8838-2c56e8ee59fe\", \"color\": \"propColorPurple\", \"value\": \"Sprint 2\"}, {\"id\": \"14892380-1a32-42dd-8034-a0cea32bc7e6\", \"color\": \"propColorBlue\", \"value\": \"Sprint 3\"}]}, {\"id\": \"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"e6a7f297-4440-4783-8ab3-3af5ba62ca11\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"c62172ea-5da7-4dec-8186-37267d8ee9a7\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aphg37f7zbpuc3bhwhp19s1ribh\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a4378omyhmgj3bex13sj4wbpfiy\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"a36o9q1yik6nmar6ri4q4uca7ey\", \"name\": \"Created Date\", \"type\": \"createdTime\", \"options\": []}, {\"id\": \"ai7ajsdk14w7x5s8up3dwir77te\", \"name\": \"Design Link\", \"type\": \"url\", \"options\": []}]',1675957126674,1675957126674,0,''),('b6dbd9me9h3fn8j6okq4rbbzs5w','2023-02-09 15:38:45.757454','0','','system','system','O','User Research Sessions','Use this template to manage and keep track of all your user research sessions.','?',1,1,6,'{\"trackingTemplateId\": \"6c345c7f50f6833f78b7d0f08ce450a3\"}','[{\"id\": \"aaebj5fyx493eezx6ukxiwydgty\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"af6hjb3ysuaxbwnfqpby4wwnkdr\", \"color\": \"propColorGray\", \"value\": \"Backlog ?\"}, {\"id\": \"aotxum1p5bw3xuzqz3ctjw66yww\", \"color\": \"propColorYellow\", \"value\": \"Contacted ?\"}, {\"id\": \"a7yq89whddzob1futao4rxk3yzc\", \"color\": \"propColorBlue\", \"value\": \"Scheduled ?\"}, {\"id\": \"aseqq9hrsua56r3s6nbuirj9eec\", \"color\": \"propColorRed\", \"value\": \"Cancelled ?\"}, {\"id\": \"ap93ysuzy1xa7z818r6myrn4h4y\", \"color\": \"propColorGreen\", \"value\": \"Completed ✔️\"}]}, {\"id\": \"akrxgi7p7w14fym3gbynb98t9fh\", \"name\": \"Interview Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"atg9qu6oe4bjm8jczzsn71ff5me\", \"name\": \"Product Area\", \"type\": \"select\", \"options\": [{\"id\": \"ahn89mqg9u4igk6pdm7333t8i5h\", \"color\": \"propColorGreen\", \"value\": \"Desktop App\"}, {\"id\": \"aehc83ffays3gh8myz16a8j7k4e\", \"color\": \"propColorPurple\", \"value\": \"Web App\"}, {\"id\": \"a1sxagjgaadym5yrjak6tcup1oa\", \"color\": \"propColorBlue\", \"value\": \"Mobile App\"}]}, {\"id\": \"acjq4t5ymytu8x1f68wkggm7ypc\", \"name\": \"Email\", \"type\": \"email\", \"options\": []}, {\"id\": \"aphio1s5gkmpdbwoxynim7acw3e\", \"name\": \"Interviewer\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"aqafzdeekpyncwz7m7i54q3iqqy\", \"name\": \"Recording URL\", \"type\": \"url\", \"options\": []}, {\"id\": \"aify3r761b9w43bqjtskrzi68tr\", \"name\": \"Passcode\", \"type\": \"text\", \"options\": []}]',1675957125753,1675957125753,0,''),('ba4ippd1e5fgztr91jm5zwfdgxc','2023-02-09 15:38:46.551863','0','','system','system','O','Team Retrospective','Use this template at the end of your project or sprint to identify what worked well and what can be improved for the future.','?',1,1,6,'{\"trackingTemplateId\": \"e4f03181c4ced8edd4d53d33d569a086\"}','[{\"id\": \"adjckpdotpgkz7c6wixzw9ipb1e\", \"name\": \"Category\", \"type\": \"select\", \"options\": [{\"id\": \"aok6pgecm85qe9k5kcphzoe63ma\", \"color\": \"propColorGray\", \"value\": \"To Discuss ?\"}, {\"id\": \"aq1dwbf661yx337hjcd5q3sbxwa\", \"color\": \"propColorGreen\", \"value\": \"Went Well ?\"}, {\"id\": \"ar87yh5xmsswqkxmjq1ipfftfpc\", \"color\": \"propColorRed\", \"value\": \"Didn\'t Go Well ?\"}, {\"id\": \"akj3fkmxq7idma55mdt8sqpumyw\", \"color\": \"propColorBlue\", \"value\": \"Action Items ✅\"}]}, {\"id\": \"aspaay76a5wrnuhtqgm97tt3rer\", \"name\": \"Details\", \"type\": \"text\", \"options\": []}, {\"id\": \"arzsm76s376y7suuhao3tu6efoc\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"a8anbe5fpa668sryatcdsuuyh8a\", \"name\": \"Created Time\", \"type\": \"createdTime\", \"options\": []}]',1675957126547,1675957126547,0,''),('bbfan6gkfy3ysirfrjjrczo6jzh','2023-02-09 15:38:46.233392','0','','system','system','O','Content Calendar ','Use this template to plan and organize your editorial content.','?',1,1,6,'{\"trackingTemplateId\": \"c75fbd659d2258b5183af2236d176ab4\"}','[{\"id\": \"ae9ar615xoknd8hw8py7mbyr7zo\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"awna1nuarjca99m9s4uiy9kwj5h\", \"color\": \"propColorGray\", \"value\": \"Idea ?\"}, {\"id\": \"a9ana1e9w673o5cp8md4xjjwfto\", \"color\": \"propColorOrange\", \"value\": \"Draft\"}, {\"id\": \"apy9dcd7zmand615p3h53zjqxjh\", \"color\": \"propColorPurple\", \"value\": \"In Review\"}, {\"id\": \"acri4cm3bmay55f7ksztphmtnga\", \"color\": \"propColorBlue\", \"value\": \"Ready to Publish\"}, {\"id\": \"amsowcd9a8e1kid317r7ttw6uzh\", \"color\": \"propColorGreen\", \"value\": \"Published ?\"}]}, {\"id\": \"aysx3atqexotgwp5kx6h5i5ancw\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"aywiofmmtd3ofgzj95ysky4pjga\", \"color\": \"propColorOrange\", \"value\": \"Press Release\"}, {\"id\": \"apqdgjrmsmx8ngmp7zst51647de\", \"color\": \"propColorGreen\", \"value\": \"Sponsored Post\"}, {\"id\": \"a3woynbjnb7j16e74uw3pubrytw\", \"color\": \"propColorPurple\", \"value\": \"Customer Story\"}, {\"id\": \"aq36k5pkpfcypqb3idw36xdi1fh\", \"color\": \"propColorRed\", \"value\": \"Product Release\"}, {\"id\": \"azn66pmk34adygnizjqhgiac4ia\", \"color\": \"propColorGray\", \"value\": \"Partnership\"}, {\"id\": \"aj8y675weso8kpb6eceqbpj4ruw\", \"color\": \"propColorBlue\", \"value\": \"Feature Announcement\"}, {\"id\": \"a3xky7ygn14osr1mokerbfah5cy\", \"color\": \"propColorYellow\", \"value\": \"Article\"}]}, {\"id\": \"ab6mbock6styfe6htf815ph1mhw\", \"name\": \"Channel\", \"type\": \"multiSelect\", \"options\": [{\"id\": \"a8xceonxiu4n3c43szhskqizicr\", \"color\": \"propColorBrown\", \"value\": \"Website\"}, {\"id\": \"a3pdzi53kpbd4okzdkz6khi87zo\", \"color\": \"propColorGreen\", \"value\": \"Blog\"}, {\"id\": \"a3d9ux4fmi3anyd11kyipfbhwde\", \"color\": \"propColorOrange\", \"value\": \"Email\"}, {\"id\": \"a8cbbfdwocx73zn3787cx6gacsh\", \"color\": \"propColorRed\", \"value\": \"Podcast\"}, {\"id\": \"aigjtpcaxdp7d6kmctrwo1ztaia\", \"color\": \"propColorPink\", \"value\": \"Print\"}, {\"id\": \"af1wsn13muho59e7ghwaogxy5ey\", \"color\": \"propColorBlue\", \"value\": \"Facebook\"}, {\"id\": \"a47zajfxwhsg6q8m7ppbiqs7jge\", \"color\": \"propColorGray\", \"value\": \"LinkedIn\"}, {\"id\": \"az8o8pfe9hq6s7xaehoqyc3wpyc\", \"color\": \"propColorYellow\", \"value\": \"Twitter\"}]}, {\"id\": \"ao44fz8nf6z6tuj1x31t9yyehcc\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a39x5cybshwrbjpc3juaakcyj6e\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"agqsoiipowmnu9rdwxm57zrehtr\", \"name\": \"Publication Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"ap4e7kdg7eip7j3c3oyiz39eaoc\", \"name\": \"Link\", \"type\": \"url\", \"options\": []}]',1675957126229,1675957126229,0,''),('bbkwfs1z8y38x5frdqe4mfnw15h','2023-02-09 15:38:41.245774','0','','system','system','O','Meeting Agenda ','Use this template for recurring meeting agendas, like team meetings and 1:1\'s. To use this board:\n* Participants queue new items to discuss under \"To Discuss\"\n* Go through items during the meeting\n* Move items to Done or Revisit Later as needed','?',1,1,6,'{\"trackingTemplateId\": \"54fcf9c610f0ac5e4c522c0657c90602\"}','[{\"id\": \"d777ba3b-8728-40d1-87a6-59406bbbbfb0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\", \"color\": \"propColorPink\", \"value\": \"To Discuss ?\"}, {\"id\": \"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed\", \"color\": \"propColorYellow\", \"value\": \"Revisit Later ⏳\"}, {\"id\": \"dabadd9b-adf1-4d9f-8702-805ac6cef602\", \"color\": \"propColorGreen\", \"value\": \"Done / Archived ?\"}]}, {\"id\": \"4cf1568d-530f-4028-8ffd-bdc65249187e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"8b05c83e-a44a-4d04-831e-97f01d8e2003\", \"color\": \"propColorRed\", \"value\": \"1. High\"}, {\"id\": \"b1abafbf-a038-4a19-8b68-56e0fd2319f7\", \"color\": \"propColorYellow\", \"value\": \"2. Medium\"}, {\"id\": \"2491ffaa-eb55-417b-8aff-4bd7d4136613\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"aw4w63xhet79y9gueqzzeiifdoe\", \"name\": \"Created by\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"a6ux19353xcwfqg9k1inqg5sg4w\", \"name\": \"Created time\", \"type\": \"createdTime\", \"options\": []}]',1675957121239,1675957121239,0,''),('bboohqdtgptdjtgeqd8hu1tj96o','2023-02-09 15:38:43.915196','0','','system','system','O','Project Tasks ','Use this template to stay on top of your project tasks and progress.','?',1,1,6,'{\"trackingTemplateId\": \"a4ec399ab4f2088b1051c3cdf1dde4c3\"}','[{\"id\": \"a972dc7a-5f4c-45d2-8044-8c28c69717f1\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"ayz81h9f3dwp7rzzbdebesc7ute\", \"color\": \"propColorBlue\", \"value\": \"Not Started\"}, {\"id\": \"ar6b8m3jxr3asyxhr8iucdbo6yc\", \"color\": \"propColorYellow\", \"value\": \"In Progress\"}, {\"id\": \"afi4o5nhnqc3smtzs1hs3ij34dh\", \"color\": \"propColorRed\", \"value\": \"Blocked\"}, {\"id\": \"adeo5xuwne3qjue83fcozekz8ko\", \"color\": \"propColorGreen\", \"value\": \"Completed ?\"}, {\"id\": \"ahpyxfnnrzynsw3im1psxpkgtpe\", \"color\": \"propColorBrown\", \"value\": \"Archived\"}]}, {\"id\": \"d3d682bf-e074-49d9-8df5-7320921c2d23\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\", \"color\": \"propColorRed\", \"value\": \"1. High ?\"}, {\"id\": \"87f59784-b859-4c24-8ebe-17c766e081dd\", \"color\": \"propColorYellow\", \"value\": \"2. Medium\"}, {\"id\": \"98a57627-0f76-471d-850d-91f3ed9fd213\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"axkhqa4jxr3jcqe4k87g8bhmary\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a8daz81s4xjgke1ww6cwik5w7ye\", \"name\": \"Estimated Hours\", \"type\": \"number\", \"options\": []}, {\"id\": \"a3zsw7xs8sxy7atj8b6totp3mby\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"a7gdnz8ff8iyuqmzddjgmgo9ery\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"2a5da320-735c-4093-8787-f56e15cdfeed\", \"name\": \"Date Created\", \"type\": \"createdTime\", \"options\": []}]',1675957123910,1675957123910,0,''),('bd56m1jgc37f3byxc5h15mkr9qw','2023-02-09 15:38:44.804567','0','','system','system','O','Company Goals & OKRs','Use this template to plan your company goals and OKRs more efficiently.','⛳',1,1,6,'{\"trackingTemplateId\": \"7ba22ccfdfac391d63dea5c4b8cde0de\"}','[{\"id\": \"a6amddgmrzakw66cidqzgk6p4ge\", \"name\": \"Objective\", \"type\": \"select\", \"options\": [{\"id\": \"auw3afh3kfhrfgmjr8muiz137jy\", \"color\": \"propColorGreen\", \"value\": \"Grow Revenue\"}, {\"id\": \"apqfjst8massbjjhpcsjs3y1yqa\", \"color\": \"propColorOrange\", \"value\": \"Delight Customers\"}, {\"id\": \"ao9b5pxyt7tkgdohzh9oaustdhr\", \"color\": \"propColorPurple\", \"value\": \"Drive Product Adoption\"}]}, {\"id\": \"a17ryhi1jfsboxkwkztwawhmsxe\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"a6robxx81diugpjq5jkezz3j1fo\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"a8nukezwwmknqwjsygg7eaxs9te\", \"color\": \"propColorBlue\", \"value\": \"In Progress\"}, {\"id\": \"apnt1f7na9rzgk1rt49keg7xbiy\", \"color\": \"propColorYellow\", \"value\": \"At Risk\"}, {\"id\": \"axbz3m1amss335wzwf9s7pqjzxr\", \"color\": \"propColorRed\", \"value\": \"Missed\"}, {\"id\": \"abzfwnn6rmtfzyq5hg8uqmpsncy\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"azzbawji5bksj69sekcs4srm1ky\", \"name\": \"Department\", \"type\": \"select\", \"options\": [{\"id\": \"aw5i7hmpadn6mbwbz955ubarhme\", \"color\": \"propColorBrown\", \"value\": \"Engineering\"}, {\"id\": \"afkxpcjqjypu7hhar7banxau91h\", \"color\": \"propColorBlue\", \"value\": \"Product\"}, {\"id\": \"aehoa17cz18rqnrf75g7dwhphpr\", \"color\": \"propColorOrange\", \"value\": \"Marketing\"}, {\"id\": \"agrfeaoj7d8p5ianw5iaf3191ae\", \"color\": \"propColorGreen\", \"value\": \"Sales\"}, {\"id\": \"agm9p6gcq15ueuzqq3wd4be39wy\", \"color\": \"propColorYellow\", \"value\": \"Support\"}, {\"id\": \"aucop7kw6xwodcix6zzojhxih6r\", \"color\": \"propColorPink\", \"value\": \"Design\"}, {\"id\": \"afust91f3g8ht368mkn5x9tgf1o\", \"color\": \"propColorPurple\", \"value\": \"Finance\"}, {\"id\": \"acocxxwjurud1jixhp7nowdig7y\", \"color\": \"propColorGray\", \"value\": \"Human Resources\"}]}, {\"id\": \"adp5ft3kgz7r5iqq3tnwg551der\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"a8zg3rjtf4swh7smsjxpsn743rh\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"as555ipyzopjjpfb5rjtssecw5e\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"a1ts3ftyr8nocsicui98c89uxjy\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aqxyzkdrs4egqf7yk866ixkaojc\", \"name\": \"Quarter\", \"type\": \"select\", \"options\": [{\"id\": \"ahfbn1jsmhydym33ygxwg5jt3kh\", \"color\": \"propColorBlue\", \"value\": \"Q1\"}, {\"id\": \"awfu37js3fomfkkczm1zppac57a\", \"color\": \"propColorBrown\", \"value\": \"Q2\"}, {\"id\": \"anruuoyez51r3yjxuoc8zoqnwaw\", \"color\": \"propColorGreen\", \"value\": \"Q3\"}, {\"id\": \"acb6dqqs6yson7bbzx6jk9bghjh\", \"color\": \"propColorPurple\", \"value\": \"Q4\"}]}, {\"id\": \"adu6mebzpibq6mgcswk69xxmnqe\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"asope3bddhm4gpsng5cfu4hf6rh\", \"name\": \"Assignee\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"ajwxp866f9obs1kutfwaa5ru7fe\", \"name\": \"Target\", \"type\": \"number\", \"options\": []}, {\"id\": \"azqnyswk6s1boiwuthscm78qwuo\", \"name\": \"Actual\", \"type\": \"number\", \"options\": []}, {\"id\": \"ahz3fmjnaguec8hce7xq3h5cjdr\", \"name\": \"Completion (%)\", \"type\": \"text\", \"options\": []}, {\"id\": \"a17bfcgnzmkwhziwa4tr38kiw5r\", \"name\": \"Note\", \"type\": \"text\", \"options\": []}]',1675957124801,1675957124801,0,''),('bdi5nwqfuyjb7tg5c477gr3x85o','2023-02-09 15:38:43.539668','0','','system','system','O','Personal Tasks ','Use this template to organize your life and track your personal tasks.','✔️',1,1,6,'{\"trackingTemplateId\": \"dfb70c146a4584b8a21837477c7b5431\"}','[{\"id\": \"a9zf59u8x1rf4ywctpcqama7tio\", \"name\": \"Occurrence\", \"type\": \"select\", \"options\": [{\"id\": \"an51dnkenmoog9cetapbc4uyt3y\", \"color\": \"propColorBlue\", \"value\": \"Daily\"}, {\"id\": \"afpy8s7i45frggprmfsqngsocqh\", \"color\": \"propColorOrange\", \"value\": \"Weekly\"}, {\"id\": \"aj4jyekqqssatjcq7r7chmy19ey\", \"color\": \"propColorPurple\", \"value\": \"Monthly\"}]}, {\"id\": \"abthng7baedhhtrwsdodeuincqy\", \"name\": \"Completed\", \"type\": \"checkbox\", \"options\": []}]',1675957123536,1675957123536,0,''),('be6gme7t96trpjd5799an9pxafe','2023-02-09 15:38:47.180431','0','','system','system','O','Welcome to Boards!','Mattermost Boards is an open source project management tool that helps you organize, track, and manage work across teams. Select a card to learn more.','?',1,1,6,'{\"trackingTemplateId\": \"65aba997282f3ac457cd66736fb86915\"}','[{\"id\": \"a972dc7a-5f4c-45d2-8044-8c28c69717f1\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"amm6wfhnbuxojwssyftgs9dipqe\", \"color\": \"propColorRed\", \"value\": \"To do ?\"}, {\"id\": \"af3p8ztcyxgn8wd9z4az7o9tjeh\", \"color\": \"propColorYellow\", \"value\": \"Next up\"}, {\"id\": \"ajurey3xkocs1nwx8di5zx6oe7o\", \"color\": \"propColorPurple\", \"value\": \"Later\"}, {\"id\": \"agkinkjy5983wsk6kppsujajxqw\", \"color\": \"propColorGreen\", \"value\": \"Completed ?\"}]}, {\"id\": \"acypkejeb5yfujhj9te57p9kaxw\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"aanaehcw3m13jytujsjk5hpf6ry\", \"color\": \"propColorOrange\", \"value\": \"1. High\"}, {\"id\": \"ascd7nm9r491ayot8i86g1gmgqw\", \"color\": \"propColorBrown\", \"value\": \"2. Medium\"}, {\"id\": \"aq6ukoiciyfctgwyhwzpfss8ghe\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"aqh13jabwexjkzr3jqsz1i1syew\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"acmg7mz1rr1eykfug4hcdpb1y1o\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"amewjwfjrtpu8ha73xsrdmxazxr\", \"name\": \"Reviewed\", \"type\": \"checkbox\", \"options\": []}, {\"id\": \"attzzboqaz6m1sdti5xa7gjnk1e\", \"name\": \"Last updated time\", \"type\": \"updatedTime\", \"options\": []}, {\"id\": \"a4nfnb5xr3txr5xq7y9ho7kyz6c\", \"name\": \"Reference\", \"type\": \"url\", \"options\": []}, {\"id\": \"a9gzwi3dt5n55nddej6zcbhxaeh\", \"name\": \"Created by\", \"type\": \"createdBy\", \"options\": []}]',1675957127176,1675957127176,0,''),('bfemehc1x7b8jidcrxngy5norew','2023-02-09 15:38:42.002775','0','','system','system','O','Sales Pipeline CRM','Use this template to grow and keep track of your sales opportunities.','?',1,1,6,'{\"trackingTemplateId\": \"ecc250bb7dff0fe02247f1110f097544\"}','[{\"id\": \"a5hwxjsmkn6bak6r7uea5bx1kwc\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"akj61wc9yxdwyw3t6m8igyf9d5o\", \"color\": \"propColorGray\", \"value\": \"Lead\"}, {\"id\": \"aic89a5xox4wbppi6mbyx6ujsda\", \"color\": \"propColorYellow\", \"value\": \"Qualified\"}, {\"id\": \"ah6ehh43rwj88jy4awensin8pcw\", \"color\": \"propColorBrown\", \"value\": \"Meeting\"}, {\"id\": \"aprhd96zwi34o9cs4xyr3o9sf3c\", \"color\": \"propColorPurple\", \"value\": \"Proposal\"}, {\"id\": \"axesd74yuxtbmw1sbk8ufax7z3a\", \"color\": \"propColorOrange\", \"value\": \"Negotiation\"}, {\"id\": \"a5txuiubumsmrs8gsd5jz5gc1oa\", \"color\": \"propColorRed\", \"value\": \"Lost\"}, {\"id\": \"acm9q494bcthyoqzmfogxxy5czy\", \"color\": \"propColorGreen\", \"value\": \"Closed ?\"}]}, {\"id\": \"aoheuj1f3mu6eehygr45fxa144y\", \"name\": \"Account Owner\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"aro91wme9kfaie5ceu9qasmtcnw\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"apjnaggwixchfxwiatfh7ey7uno\", \"color\": \"propColorRed\", \"value\": \"High ?\"}, {\"id\": \"apiswzj7uiwbh87z8dw8c6mturw\", \"color\": \"propColorYellow\", \"value\": \"Medium\"}, {\"id\": \"auu9bfzqeuruyjwzzqgz7q8apuw\", \"color\": \"propColorBrown\", \"value\": \"Low\"}]}, {\"id\": \"ainpw47babwkpyj77ic4b9zq9xr\", \"name\": \"Company\", \"type\": \"text\", \"options\": []}, {\"id\": \"ahf43e44h3y8ftanqgzno9z7q7w\", \"name\": \"Estimated Value\", \"type\": \"number\", \"options\": []}, {\"id\": \"amahgyn9n4twaapg3jyxb6y4jic\", \"name\": \"Territory\", \"type\": \"select\", \"options\": [{\"id\": \"ar6t1ttcumgfuqugg5o4g4mzrza\", \"color\": \"propColorBrown\", \"value\": \"Western US\"}, {\"id\": \"asbwojkm7zb4ohrtij97jkdfgwe\", \"color\": \"propColorGreen\", \"value\": \"Mountain West / Central US\"}, {\"id\": \"aw8ppwtcrm8iwopdadje3ni196w\", \"color\": \"propColorGray\", \"value\": \"Mid-Atlantic / Southeast\"}, {\"id\": \"aafwyza5iwdcwcyfyj6bp7emufw\", \"color\": \"propColorBlue\", \"value\": \"Northeast US / Canada\"}, {\"id\": \"agw8rcb9uxyt3c7g6tq3r65fgqe\", \"color\": \"propColorPink\", \"value\": \"Eastern Europe\"}, {\"id\": \"as5bk6afoaaa7caewe1zc391sce\", \"color\": \"propColorPurple\", \"value\": \"Central Europe / Africa\"}, {\"id\": \"a8fj94bka8z9t6p95qd3hn6t5re\", \"color\": \"propColorYellow\", \"value\": \"Middle East\"}, {\"id\": \"arpxa3faaou9trt4zx5sh435gne\", \"color\": \"propColorOrange\", \"value\": \"UK\"}, {\"id\": \"azdidd5wze4kcxf8neefj3ctkyr\", \"color\": \"propColorRed\", \"value\": \"Asia\"}, {\"id\": \"a4jn5mhqs3thknqf5opykntgsnc\", \"color\": \"propColorGray\", \"value\": \"Australia\"}, {\"id\": \"afjbgrecb7hp5owj7xh8u4w33tr\", \"color\": \"propColorBrown\", \"value\": \"Latin America\"}]}, {\"id\": \"abru6tz8uebdxy4skheqidh7zxy\", \"name\": \"Email\", \"type\": \"email\", \"options\": []}, {\"id\": \"a1438fbbhjeffkexmcfhnx99o1h\", \"name\": \"Phone\", \"type\": \"phone\", \"options\": []}, {\"id\": \"auhf91pm85f73swwidi4wid8jqe\", \"name\": \"Last Contact Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"adtf1151chornmihz4xbgbk9exa\", \"name\": \"Expected Close\", \"type\": \"date\", \"options\": []}, {\"id\": \"aejo5tcmq54bauuueem9wc4fw4y\", \"name\": \"Close Probability\", \"type\": \"text\", \"options\": []}, {\"id\": \"amba7ot98fh7hwsx8jdcfst5g7h\", \"name\": \"Created Date\", \"type\": \"createdTime\", \"options\": []}]',1675957121995,1675957121995,0,''),('bfkwpzdjcu7dxjmwgom3cn75cec','2023-02-09 15:38:45.997757','0','','system','system','O','Competitive Analysis','Use this template to track and stay ahead of the competition.','?️',1,1,6,'{\"trackingTemplateId\": \"06f4bff367a7c2126fab2380c9dec23c\"}','[{\"id\": \"ahzspe59iux8wigra8bg6cg18nc\", \"name\": \"Website\", \"type\": \"url\", \"options\": []}, {\"id\": \"aozntq4go4nkab688j1s7stqtfc\", \"name\": \"Location\", \"type\": \"text\", \"options\": []}, {\"id\": \"aiefo7nh9jwisn8b4cgakowithy\", \"name\": \"Revenue\", \"type\": \"text\", \"options\": []}, {\"id\": \"a6cwaq79b1pdpb97wkanmeyy4er\", \"name\": \"Employees\", \"type\": \"number\", \"options\": []}, {\"id\": \"an1eerzscfxn6awdfajbg41uz3h\", \"name\": \"Founded\", \"type\": \"text\", \"options\": []}, {\"id\": \"a1semdhszu1rq17d7et5ydrqqio\", \"name\": \"Market Position\", \"type\": \"select\", \"options\": [{\"id\": \"arfjpz9by5car71tz3behba8yih\", \"color\": \"propColorYellow\", \"value\": \"Leader\"}, {\"id\": \"abajmr34b8g1916w495xjb35iko\", \"color\": \"propColorRed\", \"value\": \"Challenger\"}, {\"id\": \"abt79uxg5edqojsrrefcnr4eruo\", \"color\": \"propColorBlue\", \"value\": \"Follower\"}, {\"id\": \"aipf3qfgjtkheiayjuxrxbpk9wa\", \"color\": \"propColorBrown\", \"value\": \"Nicher\"}]}, {\"id\": \"aapogff3xoa8ym7xf56s87kysda\", \"name\": \"Last updated time\", \"type\": \"updatedTime\", \"options\": []}, {\"id\": \"az3jkw3ynd3mqmart7edypey15e\", \"name\": \"Last updated by\", \"type\": \"updatedBy\", \"options\": []}]',1675957125992,1675957125992,0,''),('biczsf63q1fg6pkdd8ufyg49mdw','2023-02-09 15:38:45.016415','0','','system','system','O','Personal Goals ','Use this template to set and accomplish new personal goals.','⛰️',1,1,6,'{\"trackingTemplateId\": \"7f32dc8d2ae008cfe56554e9363505cc\"}','[{\"id\": \"af6fcbb8-ca56-4b73-83eb-37437b9a667d\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\", \"color\": \"propColorRed\", \"value\": \"To Do\"}, {\"id\": \"77c539af-309c-4db1-8329-d20ef7e9eacd\", \"color\": \"propColorYellow\", \"value\": \"Doing\"}, {\"id\": \"98bdea27-0cce-4cde-8dc6-212add36e63a\", \"color\": \"propColorGreen\", \"value\": \"Done ?\"}]}, {\"id\": \"d9725d14-d5a8-48e5-8de1-6f8c004a9680\", \"name\": \"Category\", \"type\": \"select\", \"options\": [{\"id\": \"3245a32d-f688-463b-87f4-8e7142c1b397\", \"color\": \"propColorPurple\", \"value\": \"Life Skills\"}, {\"id\": \"80be816c-fc7a-4928-8489-8b02180f4954\", \"color\": \"propColorGreen\", \"value\": \"Finance\"}, {\"id\": \"ffb3f951-b47f-413b-8f1d-238666728008\", \"color\": \"propColorOrange\", \"value\": \"Health\"}]}, {\"id\": \"d6b1249b-bc18-45fc-889e-bec48fce80ef\", \"name\": \"Target\", \"type\": \"select\", \"options\": [{\"id\": \"9a090e33-b110-4268-8909-132c5002c90e\", \"color\": \"propColorBlue\", \"value\": \"Q1\"}, {\"id\": \"0a82977f-52bf-457b-841b-e2b7f76fb525\", \"color\": \"propColorBrown\", \"value\": \"Q2\"}, {\"id\": \"6e7139e4-5358-46bb-8c01-7b029a57b80a\", \"color\": \"propColorGreen\", \"value\": \"Q3\"}, {\"id\": \"d5371c63-66bf-4468-8738-c4dc4bea4843\", \"color\": \"propColorPurple\", \"value\": \"Q4\"}]}, {\"id\": \"ajy6xbebzopojaenbnmfpgtdwso\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}]',1675957125012,1675957125012,0,'');
/*!40000 ALTER TABLE `focalboard_boards_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_categories`
--

DROP TABLE IF EXISTS `focalboard_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_categories` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `team_id` varchar(36) NOT NULL,
  `channel_id` varchar(36) DEFAULT NULL,
  `create_at` bigint(20) DEFAULT NULL,
  `update_at` bigint(20) DEFAULT NULL,
  `delete_at` bigint(20) DEFAULT NULL,
  `collapsed` tinyint(1) DEFAULT '0',
  `type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_categories_user_id_team_id` (`user_id`,`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_categories`
--

LOCK TABLES `focalboard_categories` WRITE;
/*!40000 ALTER TABLE `focalboard_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `focalboard_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_category_boards`
--

DROP TABLE IF EXISTS `focalboard_category_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_category_boards` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `category_id` varchar(36) NOT NULL,
  `board_id` varchar(36) NOT NULL,
  `create_at` bigint(20) DEFAULT NULL,
  `update_at` bigint(20) DEFAULT NULL,
  `delete_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_categoryboards_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_category_boards`
--

LOCK TABLES `focalboard_category_boards` WRITE;
/*!40000 ALTER TABLE `focalboard_category_boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `focalboard_category_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_file_info`
--

DROP TABLE IF EXISTS `focalboard_file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_file_info` (
  `id` varchar(26) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `delete_at` bigint(20) DEFAULT NULL,
  `name` text NOT NULL,
  `extension` varchar(50) NOT NULL,
  `size` bigint(20) NOT NULL,
  `archived` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_file_info`
--

LOCK TABLES `focalboard_file_info` WRITE;
/*!40000 ALTER TABLE `focalboard_file_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `focalboard_file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_notification_hints`
--

DROP TABLE IF EXISTS `focalboard_notification_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_notification_hints` (
  `block_type` varchar(10) DEFAULT NULL,
  `block_id` varchar(36) NOT NULL,
  `workspace_id` varchar(36) DEFAULT NULL,
  `modified_by_id` varchar(36) DEFAULT NULL,
  `create_at` bigint(20) DEFAULT NULL,
  `notify_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_notification_hints`
--

LOCK TABLES `focalboard_notification_hints` WRITE;
/*!40000 ALTER TABLE `focalboard_notification_hints` DISABLE KEYS */;
/*!40000 ALTER TABLE `focalboard_notification_hints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_preferences`
--

DROP TABLE IF EXISTS `focalboard_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_preferences` (
  `userid` varchar(36) NOT NULL,
  `category` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`userid`,`category`,`name`),
  KEY `idx_focalboard_preferences_category` (`category`),
  KEY `idx_focalboard_preferences_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_preferences`
--

LOCK TABLES `focalboard_preferences` WRITE;
/*!40000 ALTER TABLE `focalboard_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `focalboard_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_schema_migrations`
--

DROP TABLE IF EXISTS `focalboard_schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_schema_migrations` (
  `Version` bigint(20) NOT NULL,
  `Name` varchar(64) NOT NULL,
  PRIMARY KEY (`Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_schema_migrations`
--

LOCK TABLES `focalboard_schema_migrations` WRITE;
/*!40000 ALTER TABLE `focalboard_schema_migrations` DISABLE KEYS */;
INSERT INTO `focalboard_schema_migrations` VALUES (1,'init'),(2,'system_settings_table'),(3,'blocks_rootid'),(4,'auth_table'),(5,'blocks_modifiedby'),(6,'sharing_table'),(7,'workspaces_table'),(8,'teams'),(9,'blocks_history'),(10,'blocks_created_by'),(11,'match_collation'),(12,'match_column_collation'),(13,'millisecond_timestamps'),(14,'add_not_null_constraint'),(15,'blocks_history_no_nulls'),(16,'subscriptions_table'),(17,'add_file_info'),(18,'add_teams_and_boards'),(19,'populate_categories'),(20,'populate_category_blocks'),(21,'create_boards_members_history'),(22,'create_default_board_role'),(23,'persist_category_collapsed_state'),(24,'mark_existsing_categories_collapsed'),(25,'indexes_update'),(26,'create_preferences_table'),(27,'migrate_user_props_to_preferences'),(28,'remove_template_channel_link'),(29,'add_category_type_field');
/*!40000 ALTER TABLE `focalboard_schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_sessions`
--

DROP TABLE IF EXISTS `focalboard_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_sessions` (
  `id` varchar(100) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `props` text,
  `create_at` bigint(20) DEFAULT NULL,
  `update_at` bigint(20) DEFAULT NULL,
  `auth_service` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_sessions`
--

LOCK TABLES `focalboard_sessions` WRITE;
/*!40000 ALTER TABLE `focalboard_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `focalboard_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_sharing`
--

DROP TABLE IF EXISTS `focalboard_sharing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_sharing` (
  `id` varchar(36) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `modified_by` varchar(36) DEFAULT NULL,
  `update_at` bigint(20) DEFAULT NULL,
  `workspace_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_sharing`
--

LOCK TABLES `focalboard_sharing` WRITE;
/*!40000 ALTER TABLE `focalboard_sharing` DISABLE KEYS */;
/*!40000 ALTER TABLE `focalboard_sharing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_subscriptions`
--

DROP TABLE IF EXISTS `focalboard_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_subscriptions` (
  `block_type` varchar(10) DEFAULT NULL,
  `block_id` varchar(36) NOT NULL,
  `workspace_id` varchar(36) DEFAULT NULL,
  `subscriber_type` varchar(10) DEFAULT NULL,
  `subscriber_id` varchar(36) NOT NULL,
  `notified_at` bigint(20) DEFAULT NULL,
  `create_at` bigint(20) DEFAULT NULL,
  `delete_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`block_id`,`subscriber_id`),
  KEY `idx_subscriptions_subscriber_id` (`subscriber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_subscriptions`
--

LOCK TABLES `focalboard_subscriptions` WRITE;
/*!40000 ALTER TABLE `focalboard_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `focalboard_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_system_settings`
--

DROP TABLE IF EXISTS `focalboard_system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_system_settings` (
  `id` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_system_settings`
--

LOCK TABLES `focalboard_system_settings` WRITE;
/*!40000 ALTER TABLE `focalboard_system_settings` DISABLE KEYS */;
INSERT INTO `focalboard_system_settings` VALUES ('CategoryUuidIdMigrationComplete','true'),('DeletedMembershipBoardsMigrationComplete','true'),('TeamLessBoardsMigrationComplete','true'),('TelemetryID','7w514n3hekf8r3r14emeqdptway'),('UniqueIDsMigrationComplete','true');
/*!40000 ALTER TABLE `focalboard_system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_teams`
--

DROP TABLE IF EXISTS `focalboard_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_teams` (
  `id` varchar(36) NOT NULL,
  `signup_token` varchar(100) NOT NULL,
  `settings` text,
  `modified_by` varchar(36) DEFAULT NULL,
  `update_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_teams`
--

LOCK TABLES `focalboard_teams` WRITE;
/*!40000 ALTER TABLE `focalboard_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `focalboard_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focalboard_users`
--

DROP TABLE IF EXISTS `focalboard_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focalboard_users` (
  `id` varchar(100) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mfa_secret` varchar(100) DEFAULT NULL,
  `auth_service` varchar(20) DEFAULT NULL,
  `auth_data` varchar(255) DEFAULT NULL,
  `props` text,
  `create_at` bigint(20) DEFAULT NULL,
  `update_at` bigint(20) DEFAULT NULL,
  `delete_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_users`
--

LOCK TABLES `focalboard_users` WRITE;
/*!40000 ALTER TABLE `focalboard_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `focalboard_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-09 16:02:32
