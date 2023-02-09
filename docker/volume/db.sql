-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: localhost    Database: mattermost_test
-- ------------------------------------------------------
-- Server version	5.7.41

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
INSERT INTO `Bots` VALUES ('6utgspu95pd9ppt91f38e4zkfe','Mattermost Apps Registry and API proxy.','com.mattermost.apps',1675955579748,1675955579748,0,0),('9ey9cchfujfp3gbirmab6sgm4a','Playbooks bot.','playbooks',1675955580595,1675955580595,0,0),('dekkqh1an78388hr7j5d6z5tdy','Calls Bot','com.mattermost.calls',1675955580189,1675955580189,0,0),('fxeotu3r4j86dnhfye19ctuyza','Created by Boards plugin.','focalboard',1675955583485,1675955583485,0,0),('zgup6d6s578dxjotzexy3rg38y','Feedbackbot collects user feedback to improve Mattermost. [Learn more](https://mattermost.com/pl/default-nps).','com.mattermost.nps',1675955578940,1675955578940,0,0);
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
  `UrgentMentionCount` bigint(20) DEFAULT NULL,
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
-- Table structure for table `Drafts`
--

DROP TABLE IF EXISTS `Drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drafts` (
  `CreateAt` bigint(20) DEFAULT NULL,
  `UpdateAt` bigint(20) DEFAULT NULL,
  `DeleteAt` bigint(20) DEFAULT NULL,
  `UserId` varchar(26) NOT NULL,
  `ChannelId` varchar(26) NOT NULL,
  `RootId` varchar(26) NOT NULL DEFAULT '',
  `Message` text,
  `Props` text,
  `FileIds` text,
  `Priority` text,
  PRIMARY KEY (`UserId`,`ChannelId`,`RootId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drafts`
--

LOCK TABLES `Drafts` WRITE;
/*!40000 ALTER TABLE `Drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Drafts` ENABLE KEYS */;
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
  `CreateChannelMemberOnNewParticipant` tinyint(1) DEFAULT '1',
  `RemoveChannelMemberOnRemovedParticipant` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`),
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
  `CreateChannelMemberOnNewParticipant` tinyint(1) DEFAULT '1',
  `RemoveChannelMemberOnRemovedParticipant` tinyint(1) DEFAULT '1',
  `ChannelID` varchar(26) DEFAULT '',
  `ChannelMode` varchar(32) DEFAULT 'create_new_channel',
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
  `IsFollower` tinyint(1) NOT NULL DEFAULT '0',
  `IsParticipant` tinyint(1) DEFAULT '0',
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
INSERT INTO `IR_System` VALUES ('DatabaseVersion','0.62.0');
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
INSERT INTO `Jobs` VALUES ('49gymg7jxfffm817r5bekgnz5h','migrations',0,1675955640746,1675955642476,1675955642748,'success',0,'{\"last_done\": \"{\\\"current_table\\\":\\\"ChannelMembers\\\",\\\"last_team_id\\\":\\\"00000000000000000000000000\\\",\\\"last_channel_id\\\":\\\"00000000000000000000000000\\\",\\\"last_user\\\":\\\"00000000000000000000000000\\\"}\", \"migration_key\": \"migration_advanced_permissions_phase_2\"}');
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
INSERT INTO `PluginKeyValueStore` VALUES ('com.mattermost.apps','mmi_botid',_binary '6utgspu95pd9ppt91f38e4zkfe',0),('com.mattermost.calls','mmi_botid',_binary 'dekkqh1an78388hr7j5d6z5tdy',0),('com.mattermost.nps','ServerUpgrade-7.7.0',_binary '{\"server_version\":\"7.7.0\",\"upgrade_at\":\"2023-02-09T15:12:58.97934151Z\"}',0),('com.mattermost.nps','Survey-7.7.0',_binary '{\"server_version\":\"7.7.0\",\"create_at\":\"2023-02-09T15:12:58.97934151Z\",\"start_at\":\"2023-03-26T15:12:58.97934151Z\"}',0),('com.mattermost.nps','WelcomeFeedbackMigration',_binary '{\"CreateAt\":\"2023-02-09T15:12:58.97934151Z\"}',0),('focalboard','mmi_botid',_binary 'fxeotu3r4j86dnhfye19ctuyza',0),('playbooks','mmi_botid',_binary '9ey9cchfujfp3gbirmab6sgm4a',0);
/*!40000 ALTER TABLE `PluginKeyValueStore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PostAcknowledgements`
--

DROP TABLE IF EXISTS `PostAcknowledgements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PostAcknowledgements` (
  `PostId` varchar(26) NOT NULL,
  `UserId` varchar(26) NOT NULL,
  `AcknowledgedAt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PostId`,`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostAcknowledgements`
--

LOCK TABLES `PostAcknowledgements` WRITE;
/*!40000 ALTER TABLE `PostAcknowledgements` DISABLE KEYS */;
/*!40000 ALTER TABLE `PostAcknowledgements` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PostsPriority`
--

DROP TABLE IF EXISTS `PostsPriority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PostsPriority` (
  `PostId` varchar(26) NOT NULL,
  `ChannelId` varchar(26) NOT NULL,
  `Priority` varchar(32) NOT NULL,
  `RequestedAck` tinyint(1) DEFAULT NULL,
  `PersistentNotifications` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PostId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostsPriority`
--

LOCK TABLES `PostsPriority` WRITE;
/*!40000 ALTER TABLE `PostsPriority` DISABLE KEYS */;
/*!40000 ALTER TABLE `PostsPriority` ENABLE KEYS */;
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
INSERT INTO `Roles` VALUES ('378wouuxzfd1zmraaicsbkp7ca','playbook_member','authentication.roles.playbook_member.name','authentication.roles.playbook_member.description',1675955571917,1675955573431,0,' playbook_private_view playbook_private_manage_members playbook_private_manage_properties run_create playbook_public_view playbook_public_manage_members playbook_public_manage_properties',1,1),('5mgcskzfftf6fnfg7hfbknsspo','team_post_all','authentication.roles.team_post_all.name','authentication.roles.team_post_all.description',1675955571881,1675955573433,0,' use_channel_mentions create_post use_group_mentions',0,1),('7psc7qybujr3fn7ecshmg9183y','team_guest','authentication.roles.team_guest.name','authentication.roles.team_guest.description',1675955571907,1675955573435,0,' view_team',1,1),('af3at1j8dbd49p7y7tjgrqxcbe','system_custom_group_admin','authentication.roles.system_custom_group_admin.name','authentication.roles.system_custom_group_admin.description',1675955571893,1675955573436,0,' manage_custom_group_members create_custom_group edit_custom_group delete_custom_group',0,1),('bmnyj3ejojft9xdpj4qpyqn9ie','system_user_manager','authentication.roles.system_user_manager.name','authentication.roles.system_user_manager.description',1675955571891,1675955573438,0,' sysconsole_read_authentication_guest_access sysconsole_read_user_management_channels join_private_teams convert_private_channel_to_public sysconsole_read_authentication_email manage_public_channel_properties list_public_teams sysconsole_read_authentication_signup convert_public_channel_to_private sysconsole_read_authentication_saml test_ldap delete_public_channel sysconsole_write_user_management_teams list_private_teams manage_team_roles manage_private_channel_properties read_ldap_sync_job sysconsole_read_authentication_password read_public_channel sysconsole_write_user_management_channels manage_public_channel_members sysconsole_read_authentication_ldap sysconsole_read_user_management_permissions sysconsole_read_user_management_groups sysconsole_write_user_management_groups add_user_to_team remove_user_from_team sysconsole_read_authentication_mfa read_public_channel_groups view_team manage_team sysconsole_read_user_management_teams read_private_channel_groups manage_channel_roles read_channel delete_private_channel sysconsole_read_authentication_openid join_public_teams manage_private_channel_members',0,1),('dxrsh5wjmbdmbckfiwkgx11swr','system_manager','authentication.roles.system_manager.name','authentication.roles.system_manager.description',1675955571903,1675955573440,0,' sysconsole_read_reporting_team_statistics sysconsole_write_user_management_permissions delete_private_channel test_ldap create_elasticsearch_post_indexing_job sysconsole_write_site_file_sharing_and_downloads sysconsole_read_environment_web_server sysconsole_read_environment_file_storage read_channel sysconsole_read_authentication_ldap manage_public_channel_properties purge_elasticsearch_indexes sysconsole_write_environment_performance_monitoring sysconsole_write_user_management_teams test_s3 sysconsole_write_site_notices sysconsole_write_site_users_and_teams sysconsole_read_environment_image_proxy manage_private_channel_properties sysconsole_write_integrations_gif sysconsole_write_environment_high_availability sysconsole_read_products_boards test_site_url sysconsole_read_environment_logging sysconsole_write_products_boards sysconsole_read_site_notices list_private_teams test_email sysconsole_read_user_management_permissions manage_public_channel_members sysconsole_write_site_notifications sysconsole_read_environment_session_lengths sysconsole_read_integrations_integration_management sysconsole_read_user_management_channels sysconsole_read_authentication_openid sysconsole_read_site_users_and_teams view_team sysconsole_read_site_announcement_banner convert_public_channel_to_private join_public_teams sysconsole_write_site_announcement_banner sysconsole_read_integrations_bot_accounts sysconsole_write_environment_push_notification_server manage_team_roles sysconsole_read_user_management_teams sysconsole_write_environment_file_storage sysconsole_read_environment_developer sysconsole_read_environment_database recycle_database_connections test_elasticsearch manage_channel_roles sysconsole_read_environment_performance_monitoring sysconsole_write_integrations_integration_management sysconsole_read_site_posts manage_private_channel_members join_private_teams sysconsole_write_environment_logging sysconsole_read_environment_elasticsearch create_elasticsearch_post_aggregation_job sysconsole_write_site_public_links sysconsole_read_site_customization sysconsole_read_authentication_email sysconsole_write_environment_smtp read_ldap_sync_job convert_private_channel_to_public invalidate_caches remove_user_from_team sysconsole_write_environment_developer edit_brand sysconsole_read_site_public_links get_logs sysconsole_write_site_posts sysconsole_read_environment_high_availability read_elasticsearch_post_indexing_job sysconsole_write_environment_rate_limiting sysconsole_write_environment_web_server sysconsole_write_integrations_cors delete_public_channel sysconsole_read_authentication_saml sysconsole_read_about_edition_and_license sysconsole_read_user_management_groups add_user_to_team sysconsole_write_user_management_groups sysconsole_write_integrations_bot_accounts sysconsole_read_environment_push_notification_server manage_team sysconsole_write_site_localization sysconsole_write_site_customization read_public_channel_groups sysconsole_write_user_management_channels sysconsole_read_plugins sysconsole_read_authentication_signup sysconsole_read_reporting_site_statistics sysconsole_write_environment_database sysconsole_read_reporting_server_logs sysconsole_read_site_localization get_analytics sysconsole_write_site_emoji read_public_channel sysconsole_write_environment_elasticsearch sysconsole_write_environment_image_proxy sysconsole_read_authentication_password sysconsole_read_site_file_sharing_and_downloads read_license_information sysconsole_read_authentication_mfa read_elasticsearch_post_aggregation_job sysconsole_read_site_notifications sysconsole_write_environment_session_lengths list_public_teams read_private_channel_groups sysconsole_read_site_emoji reload_config sysconsole_read_environment_smtp sysconsole_read_authentication_guest_access sysconsole_read_integrations_gif sysconsole_read_environment_rate_limiting sysconsole_read_integrations_cors',0,1),('ewqh66ra3prrbkopcmjdcxoute','system_post_all','authentication.roles.system_post_all.name','authentication.roles.system_post_all.description',1675955571872,1675955573442,0,' create_post use_channel_mentions use_group_mentions',0,1),('f7qzmserxfgn8g916m8qxt9iso','run_member','authentication.roles.run_member.name','authentication.roles.run_member.description',1675955571870,1675955573443,0,' run_view',1,1),('f94dzj5j7jb68brn6e33bzpjgc','system_user_access_token','authentication.roles.system_user_access_token.name','authentication.roles.system_user_access_token.description',1675955571889,1675955573445,0,' revoke_user_access_token create_user_access_token read_user_access_token',0,1),('fo1io6qmh78hde7udc1qh78m3r','run_admin','authentication.roles.run_admin.name','authentication.roles.run_admin.description',1675955571886,1675955573446,0,' run_manage_members run_manage_properties',1,1),('hd4ag11ig3ryipjthrhqhw8gph','team_post_all_public','authentication.roles.team_post_all_public.name','authentication.roles.team_post_all_public.description',1675955571884,1675955573448,0,' use_channel_mentions create_post_public use_group_mentions',0,1),('iuq3354h8tnhujy4rb3nyuatxy','channel_user','authentication.roles.channel_user.name','authentication.roles.channel_user.description',1675955571856,1675955573450,0,' remove_reaction delete_public_channel read_public_channel_groups manage_public_channel_members read_private_channel_groups delete_post use_slash_commands edit_post use_channel_mentions read_channel delete_private_channel add_reaction get_public_link manage_private_channel_members manage_private_channel_properties create_post upload_file manage_public_channel_properties use_group_mentions',1,1),('ko64u9bck7rtxqqcoapoacuy9r','system_guest','authentication.roles.global_guest.name','authentication.roles.global_guest.description',1675955571919,1675955573452,0,' create_direct_channel create_group_channel',1,1),('o6detupec3b9ucj1skz1dfok8a','team_user','authentication.roles.team_user.name','authentication.roles.team_user.description',1675955571912,1675955573454,0,' playbook_private_create invite_user read_public_channel join_public_channels add_user_to_team create_private_channel create_public_channel view_team playbook_public_create list_team_channels',1,1),('ou6dkoanh3n9pqx8a9ikkhrbfo','channel_guest','authentication.roles.channel_guest.name','authentication.roles.channel_guest.description',1675955571896,1675955573455,0,' remove_reaction upload_file edit_post create_post use_channel_mentions use_slash_commands read_channel add_reaction',1,1),('pt9ubpypmpf53gihxckxhkyyur','team_admin','authentication.roles.team_admin.name','authentication.roles.team_admin.description',1675955571898,1675955573457,0,' delete_post playbook_private_manage_roles convert_public_channel_to_private convert_private_channel_to_public read_public_channel_groups manage_private_channel_members manage_public_channel_members manage_team_roles use_channel_mentions playbook_public_manage_roles delete_others_posts add_reaction manage_channel_roles read_private_channel_groups manage_team remove_reaction import_team manage_outgoing_webhooks manage_others_slash_commands manage_slash_commands use_group_mentions manage_incoming_webhooks create_post manage_others_outgoing_webhooks manage_others_incoming_webhooks remove_user_from_team',1,1),('tj8qrzgef3fapxaqu8r84pb6ro','system_user','authentication.roles.global_user.name','authentication.roles.global_user.description',1675955571921,1675955573459,0,' join_public_teams create_emojis create_team create_group_channel manage_custom_group_members list_public_teams view_members create_direct_channel edit_custom_group delete_emojis delete_custom_group create_custom_group',1,1),('to85737hw3fzbyuse69xte3x8a','channel_admin','authentication.roles.channel_admin.name','authentication.roles.channel_admin.description',1675955571865,1675955573460,0,' read_private_channel_groups remove_reaction use_group_mentions add_reaction manage_channel_roles manage_public_channel_members create_post manage_private_channel_members read_public_channel_groups use_channel_mentions',1,1),('uqpiug598igafeabhca7bnhtgw','system_read_only_admin','authentication.roles.system_read_only_admin.name','authentication.roles.system_read_only_admin.description',1675955571924,1675955573462,0,' sysconsole_read_reporting_team_statistics sysconsole_read_site_public_links sysconsole_read_environment_image_proxy test_ldap sysconsole_read_environment_logging sysconsole_read_integrations_integration_management list_private_teams read_ldap_sync_job sysconsole_read_environment_session_lengths sysconsole_read_site_file_sharing_and_downloads sysconsole_read_environment_database sysconsole_read_authentication_signup read_compliance_export_job sysconsole_read_experimental_bleve sysconsole_read_user_management_permissions read_public_channel_groups sysconsole_read_environment_elasticsearch read_private_channel_groups view_team sysconsole_read_compliance_data_retention_policy sysconsole_read_environment_web_server sysconsole_read_user_management_teams read_data_retention_job sysconsole_read_environment_file_storage sysconsole_read_environment_developer sysconsole_read_about_edition_and_license sysconsole_read_plugins sysconsole_read_compliance_compliance_monitoring sysconsole_read_authentication_guest_access get_analytics sysconsole_read_site_users_and_teams sysconsole_read_integrations_bot_accounts read_elasticsearch_post_aggregation_job sysconsole_read_compliance_custom_terms_of_service sysconsole_read_authentication_openid sysconsole_read_authentication_password sysconsole_read_authentication_saml sysconsole_read_environment_rate_limiting sysconsole_read_environment_performance_monitoring sysconsole_read_site_notifications sysconsole_read_reporting_server_logs sysconsole_read_authentication_email read_public_channel sysconsole_read_site_notices sysconsole_read_site_emoji sysconsole_read_compliance_compliance_export sysconsole_read_environment_high_availability read_license_information sysconsole_read_site_localization read_elasticsearch_post_indexing_job sysconsole_read_reporting_site_statistics sysconsole_read_user_management_channels sysconsole_read_authentication_ldap sysconsole_read_integrations_cors sysconsole_read_authentication_mfa sysconsole_read_site_customization read_audits read_other_users_teams sysconsole_read_user_management_users list_public_teams download_compliance_export_result sysconsole_read_environment_smtp get_logs sysconsole_read_products_boards sysconsole_read_user_management_groups sysconsole_read_environment_push_notification_server sysconsole_read_site_announcement_banner sysconsole_read_experimental_feature_flags sysconsole_read_site_posts read_channel sysconsole_read_integrations_gif sysconsole_read_experimental_features',0,1),('wbzw1d6udbg75j1jkf5tumjggr','custom_group_user','authentication.roles.custom_group_user.name','authentication.roles.custom_group_user.description',1675955571895,1675955573464,0,'',0,0),('wga4okiow7rkmbjhu9gyt9zfeh','playbook_admin','authentication.roles.playbook_admin.name','authentication.roles.playbook_admin.description',1675955571915,1675955573465,0,' playbook_private_manage_roles playbook_private_manage_properties playbook_public_make_private playbook_public_manage_members playbook_public_manage_roles playbook_public_manage_properties playbook_private_manage_members',1,1),('zjo3srpzybbadnh3bcc44x6tgc','system_post_all_public','authentication.roles.system_post_all_public.name','authentication.roles.system_post_all_public.description',1675955571900,1675955573467,0,' create_post_public use_channel_mentions use_group_mentions',0,1),('zrwb9ns8c7g8fgzcjs1xs177ja','system_admin','authentication.roles.global_admin.name','authentication.roles.global_admin.description',1675955571876,1675955573470,0,' sysconsole_read_compliance_compliance_monitoring add_saml_public_cert read_others_bots sysconsole_read_authentication_password sysconsole_write_user_management_permissions sysconsole_read_experimental_features sysconsole_write_environment_database manage_private_channel_members create_team sysconsole_write_compliance_custom_terms_of_service read_jobs manage_others_slash_commands read_license_information manage_system_wide_oauth revoke_user_access_token sysconsole_read_user_management_users get_logs sysconsole_read_site_notifications sysconsole_write_authentication_mfa list_public_teams sysconsole_write_billing add_saml_private_cert remove_saml_idp_cert manage_shared_channels sysconsole_write_site_announcement_banner sysconsole_read_authentication_ldap sysconsole_read_products_boards playbook_public_view manage_roles read_ldap_sync_job manage_public_channel_properties sysconsole_write_user_management_channels demote_to_guest remove_reaction delete_post sysconsole_read_site_notices sysconsole_read_reporting_server_logs create_bot manage_license_information get_analytics sysconsole_read_environment_logging playbook_private_manage_roles sysconsole_write_site_localization sysconsole_read_site_public_links sysconsole_read_user_management_system_roles sysconsole_write_authentication_signup list_private_teams read_channel playbook_public_create remove_saml_private_cert sysconsole_write_authentication_openid test_email delete_others_posts sysconsole_read_user_management_channels read_other_users_teams sysconsole_write_user_management_groups invalidate_email_invite sysconsole_read_integrations_gif read_bots sysconsole_write_compliance_compliance_export test_site_url sysconsole_write_integrations_bot_accounts sysconsole_write_site_customization playbook_public_make_private sysconsole_read_plugins use_slash_commands sysconsole_write_environment_logging sysconsole_read_compliance_custom_terms_of_service add_ldap_public_cert sysconsole_write_compliance_data_retention_policy invalidate_caches sysconsole_write_site_file_sharing_and_downloads purge_elasticsearch_indexes create_compliance_export_job sysconsole_write_authentication_saml sysconsole_read_experimental_bleve view_members playbook_public_manage_roles sysconsole_write_site_notices sysconsole_write_integrations_integration_management playbook_private_make_public sysconsole_write_site_emoji playbook_private_create sysconsole_write_authentication_ldap manage_channel_roles sysconsole_read_reporting_team_statistics join_private_teams assign_bot reload_config remove_ldap_private_cert sysconsole_write_plugins read_elasticsearch_post_aggregation_job add_saml_idp_cert convert_private_channel_to_public manage_bots sysconsole_write_site_users_and_teams create_post sysconsole_read_site_posts sysconsole_write_user_management_teams playbook_public_manage_properties use_channel_mentions run_view create_post_ephemeral read_data_retention_job edit_brand sysconsole_write_products_boards download_compliance_export_result sysconsole_read_environment_high_availability sysconsole_read_site_localization sysconsole_write_environment_web_server sysconsole_write_experimental_features sysconsole_read_authentication_guest_access sysconsole_write_integrations_gif manage_system sysconsole_read_environment_push_notification_server manage_team sysconsole_read_experimental_feature_flags create_user_access_token sysconsole_read_authentication_email sysconsole_read_site_users_and_teams invite_guest manage_jobs sysconsole_write_reporting_server_logs playbook_public_manage_members edit_custom_group sysconsole_write_authentication_email delete_private_channel test_ldap sysconsole_read_environment_session_lengths delete_others_emojis sysconsole_write_integrations_cors manage_secure_connections sysconsole_write_environment_rate_limiting create_elasticsearch_post_indexing_job sysconsole_write_reporting_site_statistics create_group_channel sysconsole_read_environment_developer add_user_to_team sysconsole_write_user_management_users create_emojis sysconsole_read_user_management_teams sysconsole_read_environment_smtp sysconsole_write_about_edition_and_license purge_bleve_indexes join_public_teams list_team_channels sysconsole_read_environment_database get_saml_cert_status playbook_private_manage_properties sysconsole_read_about_edition_and_license create_post_public sysconsole_write_environment_image_proxy playbook_private_view remove_others_reactions get_saml_metadata_from_idp read_elasticsearch_post_indexing_job recycle_database_connections sysconsole_read_authentication_saml sysconsole_write_authentication_password create_direct_channel create_public_channel sysconsole_write_site_public_links manage_others_incoming_webhooks run_manage_properties sysconsole_write_environment_high_availability sysconsole_read_billing sysconsole_read_integrations_cors sysconsole_read_user_management_permissions sysconsole_read_compliance_compliance_export manage_slash_commands sysconsole_write_environment_elasticsearch sysconsole_write_environment_smtp edit_other_users edit_post manage_private_channel_properties edit_others_posts create_elasticsearch_post_aggregation_job use_group_mentions run_manage_members sysconsole_read_environment_web_server manage_others_bots playbook_private_manage_members sysconsole_write_experimental_feature_flags manage_others_outgoing_webhooks create_post_bleve_indexes_job create_private_channel sysconsole_read_environment_rate_limiting delete_emojis delete_custom_group read_public_channel_groups remove_saml_public_cert convert_public_channel_to_private delete_public_channel sysconsole_read_user_management_groups run_create sysconsole_read_integrations_bot_accounts manage_outgoing_webhooks list_users_without_team sysconsole_write_authentication_guest_access sysconsole_write_site_notifications sysconsole_write_experimental_bleve sysconsole_read_reporting_site_statistics manage_team_roles read_private_channel_groups sysconsole_write_environment_file_storage sysconsole_read_site_customization sysconsole_write_environment_push_notification_server join_public_channels create_data_retention_job sysconsole_write_compliance_compliance_monitoring remove_ldap_public_cert get_public_link create_custom_group test_s3 read_deleted_posts read_public_channel sysconsole_read_environment_file_storage import_team sysconsole_write_site_posts sysconsole_read_authentication_openid manage_custom_group_members manage_oauth read_user_access_token sysconsole_write_environment_performance_monitoring add_reaction sysconsole_read_site_emoji sysconsole_write_reporting_team_statistics add_ldap_private_cert sysconsole_read_environment_image_proxy sysconsole_read_compliance_data_retention_policy sysconsole_read_authentication_mfa sysconsole_read_environment_performance_monitoring invite_user sysconsole_read_authentication_signup remove_user_from_team sysconsole_read_integrations_integration_management sysconsole_read_site_file_sharing_and_downloads sysconsole_write_environment_session_lengths manage_public_channel_members sysconsole_read_environment_elasticsearch promote_guest read_audits test_elasticsearch sysconsole_write_environment_developer assign_system_admin_role sysconsole_write_user_management_system_roles create_ldap_sync_job view_team manage_incoming_webhooks read_compliance_export_job sysconsole_read_site_announcement_banner upload_file',1,1);
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
INSERT INTO `Sessions` VALUES ('mwp8tjr3ojgebbam5ynxrc36tw','f87ds5474fb3tfbwmxq6k8jqso',1675955580206,0,1675955580206,'dekkqh1an78388hr7j5d6z5tdy','','',0,'{}',0);
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
INSERT INTO `Systems` VALUES ('about_subsection_permissions','true'),('add_billing_permissions','true'),('add_bot_permissions','true'),('add_convert_channel_permissions','true'),('add_manage_guests_permissions','true'),('add_system_console_permissions','true'),('add_system_roles_permissions','true'),('add_use_group_mentions_permission','true'),('AdvancedPermissionsMigrationComplete','true'),('apply_channel_manage_delete_to_channel_user','true'),('AsymmetricSigningKey','{\"ecdsa_key\":{\"curve\":\"P-256\",\"x\":33505243997124909445065671928812098651512583380072755072275283156314515187280,\"y\":38454427520810081348716476467066152110871195223220389946930851683078995227844,\"d\":73322793302416216528883569676431063253352014213737782196915822694455438756012}}'),('authentication_subsection_permissions','true'),('channel_moderations_permissions','true'),('compliance_subsection_permissions','true'),('ContentExtractionConfigDefaultTrueMigrationComplete','true'),('CRTChannelMembershipCountsMigrationComplete','true'),('CRTThreadCountsAndUnreadsMigrationComplete','true'),('CustomGroupAdminRoleCreationMigrationComplete','true'),('custom_groups_permissions','true'),('DiagnosticId','mkqjn4erdtgamqcg3x78xb7eco'),('download_compliance_export_results','true'),('EmojisPermissionsMigrationComplete','true'),('emoji_permissions_split','true'),('environment_subsection_permissions','true'),('experimental_subsection_permissions','true'),('FirstServerRunTimestamp','1675955571854'),('GuestRolesCreationMigrationComplete','true'),('InstallationDate','1675955578924'),('integrations_subsection_permissions','true'),('LastSecurityTime','1675955571837'),('list_join_public_private_teams','true'),('manage_secure_connections_permissions','true'),('manage_shared_channel_permissions','true'),('migration_advanced_permissions_phase_2','true'),('PlaybookRolesCreationMigrationComplete','true'),('playbooks_manage_roles','true'),('playbooks_permissions','true'),('PostActionCookieSecret','{\"key\":\"EFKSONRN4aDscpetyB3Jse1sypbvrV4/NmrgNFNR6qA=\"}'),('products_boards','true'),('RemainingSchemaMigrations','true'),('remove_channel_manage_delete_from_team_user','true'),('remove_permanent_delete_user','true'),('reporting_subsection_permissions','true'),('site_subsection_permissions','true'),('SystemConsoleRolesCreationMigrationComplete','true'),('test_email_ancillary_permission','true'),('view_members_new_permission','true'),('webhook_permissions_split','true');
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
  `ThreadTeamId` varchar(26) DEFAULT NULL,
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
INSERT INTO `Users` VALUES ('6utgspu95pd9ppt91f38e4zkfe',1675955579744,1675955580037,0,'appsbot','',NULL,'','appsbot@localhost',0,'','Mattermost Apps','','system_user',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675955579744,1675955580037,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL),('9ey9cchfujfp3gbirmab6sgm4a',1675955580592,1675955580642,0,'playbooks','',NULL,'','playbooks@localhost',0,'','Playbooks','','system_user',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675955580592,1675955580642,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL),('dekkqh1an78388hr7j5d6z5tdy',1675955580184,1675955580184,0,'calls','',NULL,'','calls@localhost',0,'','Calls','','system_user',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675955580184,0,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL),('fxeotu3r4j86dnhfye19ctuyza',1675955583482,1675955583482,0,'boards','',NULL,'','boards@localhost',0,'','Boards','','system_user',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675955583482,0,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL),('zgup6d6s578dxjotzexy3rg38y',1675955578924,1675955578968,0,'feedbackbot','',NULL,'','feedbackbot@localhost',0,'','Feedbackbot','','system_user',0,'{}','{\"push\": \"mention\", \"email\": \"true\", \"channel\": \"true\", \"desktop\": \"mention\", \"comments\": \"never\", \"first_name\": \"false\", \"push_status\": \"away\", \"mention_keys\": \"\", \"push_threads\": \"all\", \"desktop_sound\": \"true\", \"email_threads\": \"all\", \"desktop_threads\": \"all\"}',1675955578924,1675955578968,0,'en',0,'','','{\"manualTimezone\": \"\", \"automaticTimezone\": \"\", \"useAutomaticTimezone\": \"true\"}',NULL);
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
INSERT INTO `db_migrations` VALUES (1,'create_teams'),(2,'create_team_members'),(3,'create_cluster_discovery'),(4,'create_command_webhooks'),(5,'create_compliances'),(6,'create_emojis'),(7,'create_user_groups'),(8,'create_group_members'),(9,'create_group_teams'),(10,'create_group_channels'),(11,'create_link_metadata'),(12,'create_commands'),(13,'create_incoming_webhooks'),(14,'create_outgoing_webhooks'),(15,'create_systems'),(16,'create_reactions'),(17,'create_roles'),(18,'create_schemes'),(19,'create_licenses'),(20,'create_posts'),(21,'create_product_notice_view_state'),(22,'create_sessions'),(23,'create_terms_of_service'),(24,'create_audits'),(25,'create_oauth_access_data'),(26,'create_preferences'),(27,'create_status'),(28,'create_tokens'),(29,'create_bots'),(30,'create_user_access_tokens'),(31,'create_remote_clusters'),(32,'create_sharedchannels'),(33,'create_sidebar_channels'),(34,'create_oauthauthdata'),(35,'create_sharedchannelattachments'),(36,'create_sharedchannelusers'),(37,'create_sharedchannelremotes'),(38,'create_jobs'),(39,'create_channel_member_history'),(40,'create_sidebar_categories'),(41,'create_upload_sessions'),(42,'create_threads'),(43,'thread_memberships'),(44,'create_user_terms_of_service'),(45,'create_plugin_key_value_store'),(46,'create_users'),(47,'create_file_info'),(48,'create_oauth_apps'),(49,'create_channels'),(50,'create_channelmembers'),(51,'create_msg_root_count'),(52,'create_public_channels'),(53,'create_retention_policies'),(54,'create_crt_channelmembership_count'),(55,'create_crt_thread_count_and_unreads'),(56,'upgrade_channels_v6.0'),(57,'upgrade_command_webhooks_v6.0'),(58,'upgrade_channelmembers_v6.0'),(59,'upgrade_users_v6.0'),(60,'upgrade_jobs_v6.0'),(61,'upgrade_link_metadata_v6.0'),(62,'upgrade_sessions_v6.0'),(63,'upgrade_threads_v6.0'),(64,'upgrade_status_v6.0'),(65,'upgrade_groupchannels_v6.0'),(66,'upgrade_posts_v6.0'),(67,'upgrade_channelmembers_v6.1'),(68,'upgrade_teammembers_v6.1'),(69,'upgrade_jobs_v6.1'),(70,'upgrade_cte_v6.1'),(71,'upgrade_sessions_v6.1'),(72,'upgrade_schemes_v6.3'),(73,'upgrade_plugin_key_value_store_v6.3'),(74,'upgrade_users_v6.3'),(75,'alter_upload_sessions_index'),(76,'upgrade_lastrootpostat'),(77,'upgrade_users_v6.5'),(78,'create_oauth_mattermost_app_id'),(79,'usergroups_displayname_index'),(80,'posts_createat_id'),(81,'threads_deleteat'),(82,'upgrade_oauth_mattermost_app_id'),(83,'threads_threaddeleteat'),(84,'recent_searches'),(85,'fileinfo_add_archived_column'),(86,'add_cloud_limits_archived'),(87,'sidebar_categories_index'),(88,'remaining_migrations'),(89,'add-channelid-to-reaction'),(90,'create_enums'),(91,'create_post_reminder'),(92,'add_createat_to_teammembers'),(93,'notify_admin'),(94,'threads_teamid'),(95,'remove_posts_parentid'),(96,'threads_threadteamid'),(97,'create_posts_priority'),(98,'create_post_acknowledgements'),(99,'create_drafts'),(100,'add_draft_priority_column');
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
INSERT INTO `focalboard_blocks` VALUES ('711sojjc1sbbqxgpjoujp18doua','2023-02-09 15:13:13.461707','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Create and manage checklists, like this one... :)','{\"value\":false}',1675955593459,1675955593459,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('713gcs33jf3bpzgk9pfb3xkqcrw','2023-02-09 15:13:08.863082','cikexdprbgb8ouynr5fmyimugwo',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588860,1675955588860,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('716g47bgjq3fubxkq8ei4sdoxer','2023-02-09 15:13:04.852847','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Send initial email','{\"value\":true}',1675955584849,1675955584849,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('719rhgqi9otgk8dpj3sibdwes9h','2023-02-09 15:13:08.552058','ctyi7g1r847rfteynz1fjqk8hmr',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588550,1675955588550,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('71iqhnfbqmfdei8rwfbjo8u3kor','2023-02-09 15:13:05.584546','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675955585582,1675955585582,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('736qmhr68utre8dutm1twinejth','2023-02-09 15:13:05.390877','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675955585388,1675955585388,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('73c8tujmzdjywtqz8ff6akofquw','2023-02-09 15:13:10.259992','cg46r9od7rf8ipr5139ydfieu8y',1,'image','','{\"fileId\":\"7tmfu5iqju3n1mdfwi5gru89qmw.png\"}',1675955590257,1675955590257,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('73fxjs7dmjjnixx3yb83d5bxf3e','2023-02-09 15:13:04.982938','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Send follow-up email','{\"value\":true}',1675955584980,1675955584980,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('73gdtsfdeebr8dyfmrwc1o73f9y','2023-02-09 15:13:05.415368','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Send proposal','{}',1675955585413,1675955585413,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('73hp6ecz38in6z8u19qcb3asrkw','2023-02-09 15:13:08.513474','ctyi7g1r847rfteynz1fjqk8hmr',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588510,1675955588510,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('73k1zgokp5tn1fyxjuhapq4464h','2023-02-09 15:13:13.781533','cn3cj63de9t81jdceapfgdtqhcy',1,'image','','{\"fileId\":\"74nt9eqzea3ydjjpgjtsxcjgrxc.gif\"}',1675955593779,1675955593779,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('73kmx8c9hhj8ubyif78mbbgdy1w','2023-02-09 15:13:04.719260','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Finalize contract','{}',1675955584716,1675955584716,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('746wb7e7yejywmcd7ty5szxzhay','2023-02-09 15:13:07.093985','cnogc7s1x13bgmjz456dudb85py',1,'image','','{\"fileId\":\"76fwrj36hptg6dywka4k5mt3sph.png\"}',1675955587091,1675955587091,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('74873uaoxs3fm3eg14qyw38m7ah','2023-02-09 15:13:04.955093','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Schedule demo','{\"value\":true}',1675955584952,1675955584952,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('74hgakzty8tgoirg7qd4ktkh3iw','2023-02-09 15:13:07.059601','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Bananas','{\"value\":false}',1675955587057,1675955587057,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('74krinybrui8z9rgw5tg71zwkjo','2023-02-09 15:13:06.981762','cfxrcmsqwtb8ejdae9pcenmh9mw',1,'checkbox','Utilities','{\"value\":true}',1675955586979,1675955586979,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('74nkkz6zcgjrmffrb81edxjszke','2023-02-09 15:13:06.992022','cfxrcmsqwtb8ejdae9pcenmh9mw',1,'checkbox','Mobile phone','{\"value\":true}',1675955586989,1675955586989,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('74qqg3xc8xt8n3b5c9jxrzf9zwc','2023-02-09 15:13:10.380983','chqd96dxi7jf3me4zd3c8na77ua',1,'image','','{\"fileId\":\"7tmfu5iqju3n1mdfwi5gru89qmw.png\"}',1675955590377,1675955590376,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('756mt37fhs388xk4194p3apjwhr','2023-02-09 15:13:05.474057','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Hand-off to customer success','{}',1675955585471,1675955585471,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('75m4ipoxsuibdxgf6z6cbxio4zh','2023-02-09 15:13:03.993627','ceutpudw3u38spenb7t395wup3o',1,'checkbox','','{\"value\":false}',1675955583990,1675955583990,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('75rrqrsp6fifb8gx4g6jwsr6o8a','2023-02-09 15:13:05.253257','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Hand-off to customer success','{}',1675955585250,1675955585250,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('75yipdr6tgireprzzk9yk5866nc','2023-02-09 15:13:08.619360','ckebmbmaycbrqbnot866fk7ij7y',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588617,1675955588617,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('75zzaedht4ffffr4kw11d98zidr','2023-02-09 15:13:05.486032','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Follow up after demo','{}',1675955585483,1675955585483,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('763nbftujuine8x6tuxwkboqbsa','2023-02-09 15:13:13.498921','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Set priorities and update statuses','{\"value\":false}',1675955593496,1675955593496,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7686cyfw5wpd8mc7exp6wmsnt8y','2023-02-09 15:13:05.056307','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Send follow-up email','{\"value\":true}',1675955585052,1675955585052,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('76fcdksyhjiyazkbdsncjazymzy','2023-02-09 15:13:05.462298','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Schedule demo','{\"value\":false}',1675955585459,1675955585459,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('76feihzqhofn6tc8kdsn3gsutjy','2023-02-09 15:13:08.501543','ctyi7g1r847rfteynz1fjqk8hmr',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588499,1675955588499,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('76j9579bkobdx9yffs8c36ajzto','2023-02-09 15:13:08.782167','cix88w1wqzjfb8gccg6ajrsr5th',1,'checkbox','...','{\"value\":false}',1675955588779,1675955588779,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('76m5biapsn3b9tyzmns3187bacy','2023-02-09 15:13:12.489488','cfefgwjke6bbxpjpig618g9bpte',1,'image','','{\"fileId\":\"7pbp4qg415pbstc6enzeicnu3qh.png\"}',1675955592486,1675955592486,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('773t4jpidzpftificz9umr1jioc','2023-02-09 15:13:07.014904','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Cereal','{\"value\":false}',1675955587012,1675955587012,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('775k5efyyciy6bqtze1rpog6xzh','2023-02-09 15:13:03.641974','c5r5txf1pzir358gmkeesntg8aw',1,'checkbox','','{\"value\":false}',1675955583639,1675955583639,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('779wdqq3wop86tet8akjqpqmrqa','2023-02-09 15:13:03.835120','cnq9ritr7t7nomyupipc9j7dbde',1,'checkbox','','{\"value\":false}',1675955583832,1675955583832,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('77o8djgrjftyoi8incgsp34d3xo','2023-02-09 15:13:03.821620','cnq9ritr7t7nomyupipc9j7dbde',1,'checkbox','','{\"value\":false}',1675955583819,1675955583818,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('77teehuznqigd7ftbyqpys3m46y','2023-02-09 15:13:08.744597','cix88w1wqzjfb8gccg6ajrsr5th',1,'divider','','{}',1675955588742,1675955588742,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('785ddmgjn5ff9typdnbjk9ibszo','2023-02-09 15:13:05.330186','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675955585327,1675955585327,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('78dxu6pcsefn33ru83dob8o4e4h','2023-02-09 15:13:13.663888','canoq7x74h7nt3yppsi18j496rc',1,'image','','{\"fileId\":\"7ek6wbpp19jfoujs1goh6kttbby.gif\"}',1675955593661,1675955593661,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('78gu3eap8diyk3q98psfyfg43yw','2023-02-09 15:13:13.592800','cnzbty5iahbdh9nf4p6ng1mnfxh',1,'image','','{\"fileId\":\"7knxbyuiedtdafcgmropgkrtybr.gif\"}',1675955593590,1675955593590,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('78ieu8wcdgintpcso3xxgbn6zto','2023-02-09 15:13:05.607489','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Follow up after demo','{}',1675955585605,1675955585605,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('78mh743bik3g1temrf9qmz78n7a','2023-02-09 15:13:08.874183','cikexdprbgb8ouynr5fmyimugwo',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588871,1675955588871,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('78qmgw8zchi8cbq9sq7zsd4isje','2023-02-09 15:13:05.748310','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Post-sales follow up','{}',1675955585746,1675955585746,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('798udjmxe8fnrxm41sgnctmotpa','2023-02-09 15:13:05.538200','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send initial email','{\"value\":false}',1675955585535,1675955585535,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('79icsf954fi81bqybb4xjr6bgmc','2023-02-09 15:13:04.778326','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Follow up after demo','{\"value\":true}',1675955584775,1675955584775,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('79onrnkio4jn9ipmgwk1pfz1eze','2023-02-09 15:13:04.706610','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Send proposal','{\"value\":true}',1675955584704,1675955584704,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('79pbspduwjjdwtfeh9m9htaqszr','2023-02-09 15:13:08.770808','cix88w1wqzjfb8gccg6ajrsr5th',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588768,1675955588768,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('79tzorr1j3if45qtmqeu64ow4dc','2023-02-09 15:13:04.734357','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675955584732,1675955584732,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('79ziahugmrtf5bqzjx5whjdxf8y','2023-02-09 15:13:05.736773','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675955585734,1675955585734,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7abtt31h8ojfstkz3uzxejgcq9e','2023-02-09 15:13:04.007982','ceutpudw3u38spenb7t395wup3o',1,'checkbox','','{\"value\":false}',1675955584005,1675955584005,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7aodxtmcjzbrh9et9bu17dwsf6h','2023-02-09 15:13:13.709664','c68ftccp7c3r69bhh5s9p6jxycy',1,'image','','{\"fileId\":\"7dybb6t8fj3nrdft7nerhuf784y.png\"}',1675955593707,1675955593707,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7at5hq148mfd1ueddegye8p3gsc','2023-02-09 15:13:08.526766','ctyi7g1r847rfteynz1fjqk8hmr',1,'divider','','{}',1675955588523,1675955588523,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7at63jg3h6fn1pqod4bngs1tpja','2023-02-09 15:13:05.342927','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Finalize contract','{}',1675955585340,1675955585340,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7bdt8wqxs4pguzpfz9iyxm3z9qc','2023-02-09 15:13:08.919600','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588917,1675955588917,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7cagjjmx9cirh5byccbcd4m566h','2023-02-09 15:13:05.664512','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Send proposal','{}',1675955585662,1675955585662,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7cg6kk14tapf7mxuh899fhqu1gr','2023-02-09 15:13:04.693297','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Send follow-up email','{\"value\":true}',1675955584690,1675955584690,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7cppnqstxdpgkzp4qicsct7r6kh','2023-02-09 15:13:05.305894','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675955585303,1675955585302,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7cxmaainfm7ycbka93uunsqabmy','2023-02-09 15:13:05.426721','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Finalize contract','{}',1675955585424,1675955585424,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7d4ruh7yf9jdipmu1njqqix6kua','2023-02-09 15:13:08.907820','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588905,1675955588905,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7daynwntzrtfd7muqo8ow9jhh3e','2023-02-09 15:13:08.597981','ckebmbmaycbrqbnot866fk7ij7y',1,'checkbox','...','{\"value\":false}',1675955588595,1675955588595,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7dbyebx37iiyomxe69okrps9uma','2023-02-09 15:13:07.071082','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Eggs','{\"value\":false}',1675955587068,1675955587068,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('7dc54s483qfyedkndrbu5gtiuao','2023-02-09 15:13:13.732572','cd8rx6nwwe38u3eebjefozn3xse',1,'image','','{\"fileId\":\"78jws5m1myf8pufewzkaa6i11sc.gif\"}',1675955593730,1675955593730,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7de64km5zwjdrmx33wjeh38fk4h','2023-02-09 15:13:05.403235','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675955585400,1675955585400,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7ditit61ok3813rxkhhr1bqcz3o','2023-02-09 15:13:05.109632','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675955585105,1675955585105,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7dnwzbk6wxb8hzyxcrkbj5y5jsc','2023-02-09 15:13:05.771314','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Send follow-up email','{\"value\":false}',1675955585769,1675955585769,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7dp4n86puk7bst8c5nordyozbxr','2023-02-09 15:13:05.280112','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Schedule demo','{\"value\":true}',1675955585277,1675955585277,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7efsjhctpz7bqifds3q6fkwnfzh','2023-02-09 15:13:05.073633','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Send proposal','{\"value\":true}',1675955585069,1675955585069,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7egqqgyaxmbyhic4nzm8we6k4fy','2023-02-09 15:13:05.630322','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule demo','{\"value\":false}',1675955585628,1675955585628,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7eiph4pj85pnpjkf9n7osnbzw4o','2023-02-09 15:13:04.747921','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Schedule demo','{\"value\":true}',1675955584744,1675955584744,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7ejmo388ff784zmbjqa6m1x6txr','2023-02-09 15:13:05.450565','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Send follow-up email','{\"value\":false}',1675955585448,1675955585448,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7ewhu5gutpbde5y5stwjxticsia','2023-02-09 15:13:08.664238','cbb5bnkayt3d8fdagwyexka6y5a',1,'checkbox','...','{\"value\":false}',1675955588662,1675955588662,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7f7ngti4wutyb7pqogsuqy7a1xo','2023-02-09 15:13:05.438520','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Post-sales follow up','{}',1675955585435,1675955585435,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7fknjncjw978kzjmsau1j6wxftw','2023-02-09 15:13:08.828535','cikexdprbgb8ouynr5fmyimugwo',1,'checkbox','...','{\"value\":false}',1675955588826,1675955588826,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7fn1t4d8qqbn4mmgppyq19ioh4o','2023-02-09 15:13:05.725011','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Schedule demo','{\"value\":false}',1675955585722,1675955585722,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7fskgnngriig4mmzps38rb5od6r','2023-02-09 15:13:03.915045','chdoctirc6ig39nbq17xhhgsdew',1,'divider','','{}',1675955583912,1675955583912,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7fx18ayomnjgibjqxjnht6djajr','2023-02-09 15:13:08.698483','cbb5bnkayt3d8fdagwyexka6y5a',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588695,1675955588695,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7gbhpcbahobrs9bb7985rb5rnje','2023-02-09 15:13:03.928192','chdoctirc6ig39nbq17xhhgsdew',1,'checkbox','','{\"value\":false}',1675955583925,1675955583925,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7go8ujqeusjgbmg7bgynkbm343r','2023-02-09 15:13:08.540123','ctyi7g1r847rfteynz1fjqk8hmr',1,'checkbox','...','{\"value\":false}',1675955588537,1675955588537,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7gw8c51de83ns8fpbuof8zwhb6e','2023-02-09 15:13:12.593459','c1gnbat9p3tnzfec18bf6agbhgh',1,'image','','{\"fileId\":\"7pbp4qg415pbstc6enzeicnu3qh.png\"}',1675955592590,1675955592590,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('7gzup5jwux3nu3qg81q38u4fiec','2023-02-09 15:13:04.761295','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Hand-off to customer success','{}',1675955584758,1675955584757,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7h46ajuoirjfs5cpegnu8g17pew','2023-02-09 15:13:07.025843','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Butter','{\"value\":false}',1675955587023,1675955587023,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('7h9b4z35aypn95bozwd9nxxaujh','2023-02-09 15:13:03.669584','c5r5txf1pzir358gmkeesntg8aw',1,'divider','','{}',1675955583666,1675955583666,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7hasspemw6fftdj5n7rtgu73kme','2023-02-09 15:13:04.942652','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Post-sales follow up','{}',1675955584939,1675955584939,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7hxggh6364iy6tmgdsbzms4w5ch','2023-02-09 15:13:03.807402','cnq9ritr7t7nomyupipc9j7dbde',1,'divider','','{}',1675955583804,1675955583804,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7i986n3un6t8kmet7t7g8ax1h8r','2023-02-09 15:13:04.897020','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Send proposal','{\"value\":true}',1675955584893,1675955584893,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7ijfsqoy7mbnttp5gtj9qszbkje','2023-02-09 15:13:13.626884','coi789ctpa3n5bpqsgc1jcswqso',1,'image','','{\"fileId\":\"7iw4rxx7jj7bypmdotd9z469cyh.png\"}',1675955593624,1675955593624,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7ioxhuh3pyfn69f7ifmurqkns6w','2023-02-09 15:13:13.534896','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Manage deadlines and milestones','{\"value\":false}',1675955593532,1675955593532,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7jck4rzdb3jfzmpbn6nofzdtzyy','2023-02-09 15:13:05.041061','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Send initial email','{\"value\":true}',1675955585037,1675955585037,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7jig9pq89wpd3frhnqqxhzey9zr','2023-02-09 15:13:08.931379','czw9es1e89fdpjr7cqptr1xq7qh',1,'divider','','{}',1675955588928,1675955588928,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7k1rumqtdqbbsmxzmw7p1juk4ur','2023-02-09 15:13:04.913326','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Hand-off to customer success','{}',1675955584910,1675955584910,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7kbs6muxmibymjenhatf9fycyse','2023-02-09 15:13:08.755529','cix88w1wqzjfb8gccg6ajrsr5th',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588753,1675955588753,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7kgijm6giob86pnekppcu6as7se','2023-02-09 15:13:13.450482','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Assign tasks to teammates','{\"value\":false}',1675955593448,1675955593447,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7kkm8rm5je7dtdyaixwff5zz1ac','2023-02-09 15:13:03.683408','c5r5txf1pzir358gmkeesntg8aw',1,'checkbox','','{\"value\":false}',1675955583680,1675955583680,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7kqqcb35odpyrum4f79za68t34a','2023-02-09 15:13:05.266295','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Follow up after demo','{}',1675955585263,1675955585263,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7m4mrkfifhbyrtch3erzptz97fr','2023-02-09 15:13:04.680192','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Send initial email','{\"value\":true}',1675955584677,1675955584677,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7m69x9dxeybf5meb9mewzz46awy','2023-02-09 15:13:05.317749','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Send follow-up email','{\"value\":true}',1675955585315,1675955585315,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7maefej36gt8pt85twg464jtu1o','2023-02-09 15:13:05.125590','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675955585122,1675955585122,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7mdjhtadx97bnjf5tretp4gwogy','2023-02-09 15:13:13.755598','c3zsx74nrcpys8g3r5xfgknthmr',1,'image','','{\"fileId\":\"7d6hrtig3zt8f9cnbo1um5oxx3y.gif\"}',1675955593753,1675955593753,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7mpepf7wxobbidpyxi9ijubzhrc','2023-02-09 15:13:03.847061','cnq9ritr7t7nomyupipc9j7dbde',1,'checkbox','','{\"value\":false}',1675955583844,1675955583844,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7n3yebdqpefyd8ynfkh66uafgch','2023-02-09 15:13:03.655319','c5r5txf1pzir358gmkeesntg8aw',1,'checkbox','','{\"value\":false}',1675955583652,1675955583652,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7n5i7e8ntppryzkiyr85rthn4ec','2023-02-09 15:13:05.240727','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Send proposal','{}',1675955585238,1675955585238,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7n6oeu3cbybys9keo9rzd4aht7a','2023-02-09 15:13:05.619028','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675955585616,1675955585616,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7n7s9k18nejgg5ktfcuiyip5m5r','2023-02-09 15:13:05.378747','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Send initial email','{\"value\":false}',1675955585376,1675955585376,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7njhr916g83bp8c8eajpcmyyxpw','2023-02-09 15:13:13.485434','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Follow cards to get notified on the latest updates','{\"value\":false}',1675955593482,1675955593482,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7nqdnhrm863g1ixwhzxjsuhm5bw','2023-02-09 15:13:03.726009','ch798q5ucefyobf5bymgqjt4f3h',1,'divider','','{}',1675955583722,1675955583722,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7nqfotfzk33rc9nkmqomrfkd6ue','2023-02-09 15:13:03.887516','chdoctirc6ig39nbq17xhhgsdew',1,'checkbox','','{\"value\":false}',1675955583885,1675955583884,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7nu7wk7cem78ypk7tcime36ghpc','2023-02-09 15:13:08.840383','cikexdprbgb8ouynr5fmyimugwo',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588838,1675955588838,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7nzy654n9rj8kjyzocsxswc4rwr','2023-02-09 15:13:05.701396','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Finalize contract','{}',1675955585698,1675955585698,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7oe98455wh7drtbrxkkuj3hqr3e','2023-02-09 15:13:03.967037','ceutpudw3u38spenb7t395wup3o',1,'divider','','{}',1675955583964,1675955583964,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7ojbrfnqjofnmtx7tzbo96xrowr','2023-02-09 15:13:05.092428','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Finalize contract','{\"value\":true}',1675955585088,1675955585088,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7oryzjiozefnozf4eipqqgf131y','2023-02-09 15:13:13.510895','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Provide feedback and ask questions via comments','{\"value\":false}',1675955593508,1675955593508,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7owb1aajjdi8e8mwqq3d11dgama','2023-02-09 15:13:04.866549','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675955584863,1675955584863,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7p1e6xnjebtyztqxe65p4bie77o','2023-02-09 15:13:05.141850','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Schedule demo','{\"value\":true}',1675955585138,1675955585137,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7p8qyw935rjnstqxmcofm79q44o','2023-02-09 15:13:13.472859','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Add and update descriptions with Markdown','{\"value\":false}',1675955593470,1675955593470,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7pb4fjz39uiraxqqz764s9qnkza','2023-02-09 15:13:08.709933','cbb5bnkayt3d8fdagwyexka6y5a',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588707,1675955588707,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7pdzn5d5xjjy33juafyfrus9are','2023-02-09 15:13:03.901997','chdoctirc6ig39nbq17xhhgsdew',1,'checkbox','','{\"value\":false}',1675955583898,1675955583898,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7psm9uth8h7gfmetjg6tjoaat3y','2023-02-09 15:13:05.596387','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send proposal','{}',1675955585593,1675955585593,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7q5en8apacbg83xsmmwjmf595ie','2023-02-09 15:13:03.767502','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675955583764,1675955583764,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7q5qa4ff3nfr49rrqtfr3xdn5pc','2023-02-09 15:13:03.739662','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675955583737,1675955583736,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7q933hz9op7ycuf8iywr84t3o5r','2023-02-09 15:13:08.608237','ckebmbmaycbrqbnot866fk7ij7y',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588606,1675955588606,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7qacsxadf1bde8r5fdniorab7ge','2023-02-09 15:13:13.558140','cg137mjnyipg9myrygzh41x45gc',1,'image','','{\"fileId\":\"74uia99m9btr8peydw7oexn37tw.gif\"}',1675955593555,1675955593555,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7qb4qtmf9wtfy9bhohjpzr9b8wr','2023-02-09 15:13:05.561426','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Finalize contract','{}',1675955585559,1675955585559,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7qwh7i5bb8t8w8yyxogqs4bapya','2023-02-09 15:13:05.169280','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Post-sales follow up','{\"value\":true}',1675955585166,1675955585166,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7qztz8xi9upgz7rmtc5djjkss8r','2023-02-09 15:13:05.687412','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Follow up after demo','{}',1675955585685,1675955585684,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7rjck1nau17faukrybaxf9ds47a','2023-02-09 15:13:07.048155','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Milk','{\"value\":false}',1675955587045,1675955587045,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('7ro96aqzbbifhzqridnm8bbccsr','2023-02-09 15:13:08.686435','cbb5bnkayt3d8fdagwyexka6y5a',1,'divider','','{}',1675955588684,1675955588684,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7rp75rubz3jfmmx4o4nsb74u4fh','2023-02-09 15:13:13.523057','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','@mention teammates so they can follow, and collaborate on, comments and descriptions','{\"value\":false}',1675955593520,1675955593520,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7rwguisc183gmzeb1wcc47zp1zr','2023-02-09 15:13:04.793730','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675955584790,1675955584790,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7s8ppoa9s778dib5ztgez9daroh','2023-02-09 15:13:05.155573','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Hand-off to customer success','{\"value\":true}',1675955585152,1675955585152,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7schpdqgqijytdebhmrgnpwcyzw','2023-02-09 15:13:07.036573','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Bread','{\"value\":false}',1675955587034,1675955587034,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('7sn7pp5f9g7d1fnnckshhmb163y','2023-02-09 15:13:05.227202','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Post-sales follow up','{}',1675955585224,1675955585224,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7tbdcr6rhutbf7dst5nkzyo7mrh','2023-02-09 15:13:05.026077','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Follow up after demo','{\"value\":true}',1675955585022,1675955585022,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7tf43bs64ipnwjdocnawsd3depy','2023-02-09 15:13:08.630771','ckebmbmaycbrqbnot866fk7ij7y',1,'divider','','{}',1675955588628,1675955588628,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7ti6yjwe3ttgs8ejr4tfftnyoba','2023-02-09 15:13:08.942627','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588940,1675955588940,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7tr7zu89w9frr3ninfpmxnri37c','2023-02-09 15:13:04.881395','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Follow up after demo','{\"value\":true}',1675955584878,1675955584878,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7tydudw9j4ibpmgy8bqp7egndro','2023-02-09 15:13:08.587658','ckebmbmaycbrqbnot866fk7ij7y',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588585,1675955588585,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7uji1wfkbx7nbbftj89x143mxxe','2023-02-09 15:13:08.675221','cbb5bnkayt3d8fdagwyexka6y5a',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588673,1675955588673,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7uyez9mn8p7rftqgkfoto9g489w','2023-02-09 15:13:05.712900','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675955585710,1675955585710,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7w49dpu8ygpfyzx7nfg543bhgtc','2023-02-09 15:13:08.953645','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','...','{\"value\":false}',1675955588951,1675955588951,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7whfs7b1kyb8cmy4j6588inr99y','2023-02-09 15:13:07.003347','cfxrcmsqwtb8ejdae9pcenmh9mw',1,'checkbox','Internet','{\"value\":true}',1675955587001,1675955587001,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('7wqef9psybfnyik743dd78ghw4e','2023-02-09 15:13:05.527011','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Hand-off to customer success','{}',1675955585524,1675955585524,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7wt3t94xewbyymj5g48njfs6sfo','2023-02-09 15:13:05.550428','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Post-sales follow up','{}',1675955585548,1675955585548,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7wtd46dn8qjy9xpq6mpo48k6cwo','2023-02-09 15:13:04.929310','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Finalize contract','{}',1675955584926,1675955584926,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7xecy5bwnptf6fgpkfbaetwam9r','2023-02-09 15:13:04.807572','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Post-sales follow up','{}',1675955584804,1675955584804,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7xznqkoe8y3ra3g65qqfehsehby','2023-02-09 15:13:03.753467','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675955583750,1675955583750,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7y5hqudj4n78txpockgry3is9ca','2023-02-09 15:13:05.759974','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Hand-off to customer success','{}',1675955585757,1675955585757,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7ychgwnpe6p8x9qqubki3dukuny','2023-02-09 15:13:10.294415','cmz9qxykqgpdyxf9j5axmwejt1e',1,'image','','{\"fileId\":\"7b9xk9boj3fbqfm3umeaaizp8qr.png\"}',1675955590292,1675955590292,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('7yj1c1y6n8bnez8srebr9xyhp1o','2023-02-09 15:13:12.421998','cemryxdyma7r9pek7nrua5mkcga',1,'image','','{\"fileId\":\"77pe9r4ckbin438ph3f18bpatua.png\"}',1675955592418,1675955592418,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('7yt41oaxrxfr6xmrx36fncbyr4h','2023-02-09 15:13:05.675676','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Send initial email','{\"value\":true}',1675955585673,1675955585673,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7z56arow18jdw7deb6jkusbymga','2023-02-09 15:13:03.980021','ceutpudw3u38spenb7t395wup3o',1,'checkbox','','{\"value\":false}',1675955583977,1675955583977,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7z6yqohbf7bygt8q96a8bff98oy','2023-02-09 15:13:05.573265','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send follow-up email','{\"value\":false}',1675955585571,1675955585570,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7za5q9fuuyiym3gysupwd9ogqfe','2023-02-09 15:13:05.292323','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Send initial email','{\"value\":true}',1675955585289,1675955585289,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7zafpkhuoipfatyn4quyp5ho54e','2023-02-09 15:13:04.968854','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675955584965,1675955584965,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7zas7gqctb3gxtm9ur6n7h3b1ah','2023-02-09 15:13:08.851134','cikexdprbgb8ouynr5fmyimugwo',1,'divider','','{}',1675955588849,1675955588848,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7zkd1rzi4ibnb9n57hyq97azc6e','2023-02-09 15:13:11.624836','cq9nnxgdcwfd88djwnyt88t4uuh',1,'image','','{\"fileId\":\"7y5kr8x8ybpnwdykjfuz57rggrh.png\"}',1675955591622,1675955591621,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('7zpump4j4g7rkfgisdrcofz5b5r','2023-02-09 15:13:08.793640','cix88w1wqzjfb8gccg6ajrsr5th',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588791,1675955588791,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('a1zr6uuynufb35jihug669suskc','2023-02-09 15:13:10.338878','cfmk7771httynm8r7rm8cbrmrya',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955590336,1675955590336,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('a3khhsbh7rjnafeokiyxc9i8doa','2023-02-09 15:13:13.697850','canoq7x74h7nt3yppsi18j496rc',1,'text','Cards can be linked and shared with teammates directly on Channels. Card previews are displayed when shared on Channels, so your team can discuss work items and get the relevant context without having to switch over to Boards.','{}',1675955593695,1675955593695,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('a3m9cwtsqr3bd5q1seams43jwje','2023-02-09 15:13:11.611508','cmzq3bnpxmt8f3k34pnjycidkzh',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591609,1675955591609,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('a3tbx1exnfjdnjrgwug95jmqy7y','2023-02-09 15:13:11.303745','c8q4rsku8htd7tnntzrxhpqn5ha',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675955591301,1675955591301,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('a45k4ry9pn3yobqktb6y6h45f6e','2023-02-09 15:13:03.794621','ch798q5ucefyobf5bymgqjt4f3h',1,'text','# Notes\n*[Add meeting notes here]*','{}',1675955583791,1675955583791,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('a4i1839ku9pr4mqgubpij4e3esw','2023-02-09 15:13:05.794013','c9rpp4fsq4fyazjnrufq9p197nr',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675955585791,1675955585791,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('a4je4p13yqjf6pcizp6hc1zb9ay','2023-02-09 15:13:08.562130','ctyi7g1r847rfteynz1fjqk8hmr',1,'text','## Checklist','{}',1675955588560,1675955588559,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('a4msfjnxpcfrk8f1f4px57kaztw','2023-02-09 15:13:12.567594','cidz4imnqhir48brz6e8hxhfrhy',1,'text','## Requirements\n- [Requirement 1]\n- [Requirement 2]\n- ...','{}',1675955592565,1675955592565,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('a4sfyyhjq1bdyme4zqmm3xtn6ch','2023-02-09 15:13:12.502964','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Screenshots\nIf applicable, add screenshots to elaborate on the problem.','{}',1675955592500,1675955592500,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('a4ywgn9zby3f6fjdgsgbbz1kjqo','2023-02-09 15:13:08.721553','cbb5bnkayt3d8fdagwyexka6y5a',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588719,1675955588719,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('a5amnooqcz7gy7yjd19dh3449ny','2023-02-09 15:13:12.477478','chnnww5gm138xjpobgmcnbqyspw',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955592474,1675955592474,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('a5e44frgpzj8ozmoxn8cu7x8uoh','2023-02-09 15:13:13.792996','cn3cj63de9t81jdceapfgdtqhcy',1,'text','To mention a teammate use the **@ symbol with their username** in the comments or description section. They\'ll get a Direct Message notification via Channels and also be added as a [follower](https://docs.mattermost.com/boards/work-with-cards.html#receive-updates) to the card. \n\nWhenever any changes are made to the card, they\'ll automatically get notified on Channels.','{}',1675955593790,1675955593790,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('a61mepup14t83fkmx7p75jod16c','2023-02-09 15:13:08.733382','cbb5bnkayt3d8fdagwyexka6y5a',1,'text','## Checklist','{}',1675955588730,1675955588730,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('a6kcrbx11s3guzdrfjfy1xhahya','2023-02-09 15:13:12.514580','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\nA clear and concise description of what you expected to happen.\n\n## Edition and Platform\n\n - Edition: Personal Desktop / Personal Server / Mattermost plugin\n - Version: [e.g. v0.9.0]\n - Browser and OS: [e.g. Chrome 91 on macOS, Edge 93 on Windows]\n\n## Additional context\n\nAdd any other context about the problem here.','{}',1675955592512,1675955592512,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('a6m859scuoigfmk87xd15d9zd4r','2023-02-09 15:13:11.316383','c6d843tks8fdc9gx7orr6odcdww',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675955591313,1675955591313,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('a77k6m9h6s38d3ek1bqktizmcar','2023-02-09 15:13:03.781191','ch798q5ucefyobf5bymgqjt4f3h',1,'text','# Action Items','{}',1675955583778,1675955583778,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('a7fm9z5ztp3fo7bt3g78iermp3h','2023-02-09 15:13:07.128598','crmtkd3pua38h5ysmxcjr5hw88o',1,'text','','{}',1675955587126,1675955587126,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('a9azy4hfxhbb59pfz38gq5h64aw','2023-02-09 15:13:12.606919','c1gnbat9p3tnzfec18bf6agbhgh',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955592603,1675955592603,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('a9iqt7u3xffb8zjnbcr4bxhywuc','2023-02-09 15:13:13.615403','cnzbty5iahbdh9nf4p6ng1mnfxh',1,'text','To share a board, select **Share** at the top right of the Board view. Copy the link to share the board internally with your team or generate public link that can be accessed by anyone externally.','{}',1675955593613,1675955593612,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('aa8acczgyaid7xmj16c5ws4nxie','2023-02-09 15:13:10.248810','ccxzm5dsu6tbbtyhgg31f4sec9y',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955590246,1675955590246,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aadbnnq8fj3gqucfc4ngqishwuo','2023-02-09 15:13:11.672754','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n- ...\n\n## Notes\n- ...\n- ...\n- ...','{}',1675955591670,1675955591670,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('ab14jmwfpk7yni8bm9ntrfaozuo','2023-02-09 15:13:10.963164','c3fdqgj8ut3r1iy8ugnsae7ncqy',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675955590961,1675955590961,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('ac3qw7f339fy75gquwsqby3z8kr','2023-02-09 15:13:07.105566','cnogc7s1x13bgmjz456dudb85py',1,'text','## Goal\nWalk at least 10,000 steps every day.','{}',1675955587102,1675955587102,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('acae5aqipzp8ndnoar5pmzw35mr','2023-02-09 15:13:03.697042','c5r5txf1pzir358gmkeesntg8aw',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675955583694,1675955583694,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('acciczh6eo7rs8cyrqm5ffko16r','2023-02-09 15:13:07.116756','cnogc7s1x13bgmjz456dudb85py',1,'text','## Route','{}',1675955587114,1675955587114,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('ach1ouji393na7cfh4ozzjb7teo','2023-02-09 15:13:11.328312','cyhm5hrnra781bpeatqyygemgah',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n\n## Weaknesses\n- ...\n- ...\n\n## Opportunities\n- ...\n- ...\n\n## Threats\n- ...\n- ...','{}',1675955591326,1675955591326,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('acjgpbs7oefgmfysdqk8jw6mw9w','2023-02-09 15:13:13.744031','cd8rx6nwwe38u3eebjefozn3xse',1,'text','Views allow your team to visualize the same cards and data from different perspectives, so they can stay up-to-date in the way that works best for them. To add a new view, go to **Add a new view** from the view drop-down, then select from any of the following views:\n\n- **Board**: Adds a Kanban board, similar to this one, that allows your team to organize cards in swimlanes grouped by any property of your choosing. This view helps you visualize your project progress.\n- **Table**: Displays cards in a table format with rows and columns. Use this view to get an overview of all your project tasks. Easily view and compare the state of all properties across all cards without needing to open individual cards.\n- **Gallery**: Displays cards in a gallery format, so you can manage and organize cards with image attachments.\n- **Calendar**: Adds a calendar view to easily visualize your cards by dates and keep track of deadlines.','{}',1675955593741,1675955593741,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('acjrasnxctirofjybch3qr3dcha','2023-02-09 15:13:04.836414','cqz8jga9oiibfpgrz3k7omk9u6r',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675955584833,1675955584833,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('ad6w4zipzrbgudmb7eqwmgj78sa','2023-02-09 15:13:05.354941','cb86yg4ppqbgrdktqg8hg3koqjh',1,'text','## Checklist','{}',1675955585352,1675955585352,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('adb89p5s3kiysxxdg9jwnqqso8a','2023-02-09 15:13:11.009545','c6wt3u45b4jdxpqkwmtgg3ws3ra',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675955591007,1675955591007,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('adso1om3mo3fazniwqijpbeb85a','2023-02-09 15:13:11.660352','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591658,1675955591657,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('aeiucy1bnufrbbjcfboxbomsnpw','2023-02-09 15:13:05.782719','c9rpp4fsq4fyazjnrufq9p197nr',1,'text','## Checklist','{}',1675955585780,1675955585780,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('aendew5n7apfpfbfg94hjcr8bch','2023-02-09 15:13:04.033403','ceutpudw3u38spenb7t395wup3o',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675955584030,1675955584030,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('aeugpze8spbf4xq6ce5ahutzagc','2023-02-09 15:13:13.637821','coi789ctpa3n5bpqsgc1jcswqso',1,'text','To create a new card, simply do any of the following:\n- Select \"**New**\" on the top right header\n- Select \"**+ New**\" below any column\n- Select \"**+**\" to the right of any columnn header','{}',1675955593635,1675955593635,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('afb3exyr3xbfm7yce6wggeeakhy','2023-02-09 15:13:12.631418','cwrq9ag3p5pgzzy98nfd3wwra1w',1,'text','## Summary\n*[Brief description of what this epic is about]*\n## Motivation\n*[Brief description on why this is needed]*\n## Acceptance Criteria\n- *[Criteron 1]*\n- *[Criteron 2]*\n- ...\n## Personas\n- *[Persona A]*\n- *[Persona B]*\n- ...\n## Reference Materials\n- *[Links to other relevant documents as needed]*\n- ...','{}',1675955592628,1675955592628,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('afpgs6xraqjyuuf4zhy7fsio4ur','2023-02-09 15:13:11.636635','cq9nnxgdcwfd88djwnyt88t4uuh',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591634,1675955591634,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('afsw7hyn5xpncffxn9yn5e4qbna','2023-02-09 15:13:08.652501','ckebmbmaycbrqbnot866fk7ij7y',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588650,1675955588650,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('ag7rbwonqotbndk9kiw89t1e4br','2023-02-09 15:13:11.684343','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591681,1675955591681,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('agawe389ja7ykfmnmjetbxkto9w','2023-02-09 15:13:11.648867','cq9nnxgdcwfd88djwnyt88t4uuh',1,'text','## Media','{}',1675955591646,1675955591646,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('agbfxbbe1qpbtzghib1xffspybo','2023-02-09 15:13:12.463235','cqangpbz5c3rpfefzdbe4totwnc',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955592460,1675955592460,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('agt75wzipx3f4zxcqptk7mz19ih','2023-02-09 15:13:05.641626','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'text','## Checklist','{}',1675955585639,1675955585639,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('ahaqysju1yj8jjnwzycyeyysmuc','2023-02-09 15:13:12.540982','cf75w38ufx7nmukby5irgojbskw',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955592538,1675955592538,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('ahj5ij6oshidt78xu8e34s8zmjh','2023-02-09 15:13:10.465119','ck7c7denp7tg53xnt5oz7xw8hde',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955590462,1675955590462,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ahmoo614kjty4iqp164y6bmtygc','2023-02-09 15:13:04.996554','czo1hzhtwgbg3tde9scsbn9ogbc',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675955584994,1675955584993,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('ahsudf7h5qt87dm59owgpnf14jr','2023-02-09 15:13:10.271377','cg46r9od7rf8ipr5139ydfieu8y',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955590269,1675955590269,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aijmqfdwxp7d7mj14o3ueuhbhha','2023-02-09 15:13:04.020273','ceutpudw3u38spenb7t395wup3o',1,'text','## Action Items','{}',1675955584017,1675955584017,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('aizi5qcgx8bbc9fsx1f7t73d5do','2023-02-09 15:13:10.282950','cg46r9od7rf8ipr5139ydfieu8y',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955590280,1675955590280,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ajbx8r7dmdfnu3ra11w77dxwnza','2023-02-09 15:13:12.527533','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\n*[A clear and concise description of what you expected to happen.]*\n\n## Screenshots\n\n*[If applicable, add screenshots to elaborate on the problem.]*\n\n## Edition and Platform\n\n - Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n - Version: *[e.g. v0.9.0]*\n - Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n\n*[Add any other context about the problem here.]*','{}',1675955592524,1675955592524,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('ajmhitsxxbfrb3mrewrxm1st15c','2023-02-09 15:13:13.439161','czbk3bqy8k3yjde4fnu9o8ircby',1,'text','Mattermost Boards makes it easy for you to update certain properties on cards through our drag and drop functionality. Simply drag this card from the **Later** column to the **Completed** column to automatically update the status and mark this task as complete.','{}',1675955593437,1675955593437,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('ajz9ijqfmuf8a9fb7utsccwaspr','2023-02-09 15:13:13.770877','c3zsx74nrcpys8g3r5xfgknthmr',1,'text','Customize cards to fit your needs and track the information most important to you. Boards supports a wide range of fully customizable property types. For example, you can:\n- Use the **Date** property for things like deadlines or milestones.\n- Assign owners to tasks with the **Person** property.\n- Define statuses and priorities with the **Select** property.\n- Create tags with the **Multi Select** property.\n- Link cards to webpages with the **URL** property.','{}',1675955593768,1675955593768,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('ak5fza5wbnjfo7dxxqe3m8rprrc','2023-02-09 15:13:05.515639','cagbcg7m38jydjqx1cx34pg3mzr',1,'text','## Checklist','{}',1675955585513,1675955585513,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('akhqdd35se3yz5xh5zt6ozeenwy','2023-02-09 15:13:12.436536','cemryxdyma7r9pek7nrua5mkcga',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955592433,1675955592433,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('akmg5iau977bqfxjmob8mq9ts3o','2023-02-09 15:13:03.953287','chdoctirc6ig39nbq17xhhgsdew',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675955583950,1675955583950,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('aktyo8f7993ny8x1w7c1pkr375r','2023-02-09 15:13:12.450646','cemryxdyma7r9pek7nrua5mkcga',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955592448,1675955592448,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('am6freei6e3ympkmurbutrrb5or','2023-02-09 15:13:08.975618','czw9es1e89fdpjr7cqptr1xq7qh',1,'text','## Checklist','{}',1675955588973,1675955588973,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('am97jryax1iro7n85jroh8778yw','2023-02-09 15:13:13.648830','coi789ctpa3n5bpqsgc1jcswqso',1,'text','Mattermost Boards helps you manage and track all your project tasks with **Cards**.','{}',1675955593646,1675955593646,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('amattnuhzcj8hxg1e3pqszzegrh','2023-02-09 15:13:13.546432','cebwuam6qgbb65qki6xx8rcuoph',1,'text','Cards allow your entire team to manage and collaborate on a task in one place. Within a card, your team can:','{}',1675955593544,1675955593544,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('amgk6gg4axfr5dmmid37qinmohh','2023-02-09 15:13:10.402432','chqd96dxi7jf3me4zd3c8na77ua',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955590399,1675955590399,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('amh8jwmku4pd78e3kytbzekmeac','2023-02-09 15:13:13.603963','cnzbty5iahbdh9nf4p6ng1mnfxh',1,'text','Keep stakeholders and customers up-to-date on project progress by sharing your board.','{}',1675955593601,1675955593601,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('amp6pbkxejbyhxywexbk8ftfdth','2023-02-09 15:13:10.316704','cmz9qxykqgpdyxf9j5axmwejt1e',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955590314,1675955590314,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aniyqg1s9otf1jbd7bjj3hdpryw','2023-02-09 15:13:12.579245','c1kwdjzwqsfygxe5yk53y8krkoc',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675955592576,1675955592576,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('anqhq6hzz6jn1ffwxxnsxn9uudy','2023-02-09 15:13:05.184649','cxjttr33wdbyqifk6j159j45ody',1,'text','## Checklist','{}',1675955585181,1675955585181,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('anrds5daywjyhmmawh6piy9mw6h','2023-02-09 15:13:08.805142','cix88w1wqzjfb8gccg6ajrsr5th',1,'text','## Checklist','{}',1675955588802,1675955588802,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('ant34hxkckfnffjs4cu97gwry7a','2023-02-09 15:13:03.862003','cnq9ritr7t7nomyupipc9j7dbde',1,'text','## Action Items','{}',1675955583859,1675955583858,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('aobnpxchj3jgyxy6joc3yefpcdy','2023-02-09 15:13:10.974628','cf33otfdy33nfpg9xg5c5ftdp3a',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675955590972,1675955590972,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('aoz9kboqi3tr38rpd6s5nkye34a','2023-02-09 15:13:13.675066','canoq7x74h7nt3yppsi18j496rc',1,'text','After you\'ve copied the link, paste it into any channel or Direct Message to share the card. A preview of the card will display within the channel with a link back to the card on Boards.','{}',1675955593673,1675955593673,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('ap1w3ix4qybrzpbp5yi4a79p8te','2023-02-09 15:13:08.641781','ckebmbmaycbrqbnot866fk7ij7y',1,'text','## Checklist','{}',1675955588639,1675955588639,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('ap6pw4f666id75r56b7uxutop4y','2023-02-09 15:13:13.569893','cg137mjnyipg9myrygzh41x45gc',1,'text','A board helps you manage your project, organize tasks, and collaborate with your team all in one place.','{}',1675955593567,1675955593567,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('apowhzozrbty6xjowzi3by71iqa','2023-02-09 15:13:08.574695','ctyi7g1r847rfteynz1fjqk8hmr',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588572,1675955588572,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('apr37rx4thtfm8d8z39k7ufxqew','2023-02-09 15:13:05.010153','czo1hzhtwgbg3tde9scsbn9ogbc',1,'text','## Checklist','{}',1675955585007,1675955585007,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('apu3355oj73rnimuasezwsrkrfc','2023-02-09 15:13:13.686736','canoq7x74h7nt3yppsi18j496rc',1,'text','To share a card, you\'ll need to copy the card link first. You can:\n\n- Open a card and select the options menu button at the top right of the card.\n- Open the board view and hover your mouse over any card to access the options menu button.','{}',1675955593684,1675955593684,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('aq1ien1oyzbn55j13n5r78wuzfa','2023-02-09 15:13:05.504624','cagbcg7m38jydjqx1cx34pg3mzr',1,'text','## Notes\n[Enter notes here...]','{}',1675955585502,1675955585502,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('aq3fh99xz5iro3fnm5opwh5n3tc','2023-02-09 15:13:11.289252','cu91ugd56rirqxyupgjwozoi7tr',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675955591287,1675955591287,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('aq7d5ncbc1tgzumxaztu1isypxw','2023-02-09 15:13:05.654147','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'text','## Notes\n[Enter notes here...]','{}',1675955585651,1675955585651,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('aqhufq7p6uinm98td11ayxurabw','2023-02-09 15:13:11.695535','cuxggn3p3kjf4upaaywym3xm59c',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591693,1675955591693,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('aqo375g4dipdfjd1yrmznagi5ur','2023-02-09 15:13:11.707528','cdzz1f3i9biypddmppc1fg97pbh',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591705,1675955591705,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('aqz87s9n9o7gcjchd8ahiwgrtya','2023-02-09 15:13:03.939852','chdoctirc6ig39nbq17xhhgsdew',1,'text','## Action Items','{}',1675955583937,1675955583937,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('ar4eie8yh8pgymkxy34hp3phuch','2023-02-09 15:13:08.885391','cikexdprbgb8ouynr5fmyimugwo',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588883,1675955588883,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('ar55tt5wywfdptxmqgkezgfhc6c','2023-02-09 15:13:08.964899','czw9es1e89fdpjr7cqptr1xq7qh',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588962,1675955588962,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('asga1bhnouid3ub4as84w4gh44o','2023-02-09 15:13:13.720810','c68ftccp7c3r69bhh5s9p6jxycy',1,'text','Organize and find the cards you\'re looking for with our filter, sort, and grouping options. From the Board header, you can quickly toggle on different properties, change the group display, set filters, and change how the cards are sorted.','{}',1675955593718,1675955593718,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('asgkpsgg3qfyaifjb1n6c7qowzh','2023-02-09 15:13:10.327888','cstu6h6hfcfd59yc4qwd4pd3i4o',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955590325,1675955590325,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aspcsqz8yzjdpxjmgmhypifoe8y','2023-02-09 15:13:12.643490','cwrq9ag3p5pgzzy98nfd3wwra1w',1,'text','## Summary\n[Brief description of what this epic is about]\n\n## Motivation\n[Brief description on why this is needed]\n\n## Acceptance Criteria\n - [Criteron 1]\n - [Criteron 2]\n - ...\n\n## Personas\n - [Persona A]\n - [Persona B]\n - ...\n\n## Reference Materials\n - [Links to other relevant documents as needed]\n - ...','{}',1675955592641,1675955592641,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('at46xzyqcrjgiierds18et39ggo','2023-02-09 15:13:05.366682','cb86yg4ppqbgrdktqg8hg3koqjh',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675955585364,1675955585364,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('atfky7fydsp8uigjoc8zraarxcy','2023-02-09 15:13:10.350731','cfmk7771httynm8r7rm8cbrmrya',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955590348,1675955590348,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('atw666atbn3848m58coybbxssdw','2023-02-09 15:13:08.817351','cix88w1wqzjfb8gccg6ajrsr5th',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588815,1675955588815,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('au5ex799hujratgknhmxixuws8y','2023-02-09 15:13:10.986016','cbybbaewz3b85z8jwut18o6g1dr',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675955590983,1675955590983,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('au5u4me3i7f8jmqfdo1hamw1toe','2023-02-09 15:13:10.441062','cdja7nwgcaffgxdrjtni173bayh',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675955590438,1675955590438,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aue5actny978cmg85oyjyxqtcre','2023-02-09 15:13:13.806139','cn3cj63de9t81jdceapfgdtqhcy',1,'text','Collaborate with teammates directly on each card using @mentions and have all the relevant context in one place.','{}',1675955593803,1675955593803,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('auewq49obsbboumrqbf36xh3pya','2023-02-09 15:13:10.416936','chqd96dxi7jf3me4zd3c8na77ua',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955590414,1675955590414,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aupenqk7botbjzen4dn9ue1wfpr','2023-02-09 15:13:10.305578','cmz9qxykqgpdyxf9j5axmwejt1e',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955590303,1675955590303,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aur9jj4ywcpbm3yn3kc341xcmew','2023-02-09 15:13:10.998091','cskmj8hxihj8gtdrusqkoxw9ruw',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675955590995,1675955590995,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('aw1e4ep9zeiyxpnjpedtjxwwnie','2023-02-09 15:13:12.554197','cidz4imnqhir48brz6e8hxhfrhy',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955592551,1675955592551,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('awigum1hx6ige8rfzhpmcmrkmhy','2023-02-09 15:13:10.429046','cw85ce7jszt8ufcdo44ay1buega',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955590426,1675955590426,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ax115hmekot8jupz7ewgqywi6so','2023-02-09 15:13:10.453418','cf84s7zu18jbeud54uwzam8qwpo',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955590451,1675955590451,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ax841kejdi7rwbeed5zwomt9p3e','2023-02-09 15:13:07.082360','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'text','## Grocery list','{}',1675955587080,1675955587080,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('axskm1c8n4inbfc56m6737xncza','2023-02-09 15:13:11.340031','cp8xyhyy85tgq3c6jgqmhdz3ree',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675955591337,1675955591337,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('ayhpkueiieirsmbm5zeejtfmite','2023-02-09 15:13:03.875367','cnq9ritr7t7nomyupipc9j7dbde',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675955583872,1675955583872,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('ayk98dhhnw389idq11x8ndmjdza','2023-02-09 15:13:12.619663','c1gnbat9p3tnzfec18bf6agbhgh',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955592617,1675955592617,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('ayqbm41jf87b7f8ci34p3misikh','2023-02-09 15:13:10.362263','czf1skn1natn3ppzqqqf5kc3bgr',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675955590359,1675955590359,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('az1eoncet73ni3dco91wjo1pwba','2023-02-09 15:13:05.205665','cxjttr33wdbyqifk6j159j45ody',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675955585203,1675955585203,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('azb84nx87xpnampc7mpqba7pfoy','2023-02-09 15:13:03.711393','c5r5txf1pzir358gmkeesntg8aw',1,'text','## Action Items','{}',1675955583708,1675955583708,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('azj1msd6fjt8wddpy3gms8ka19h','2023-02-09 15:13:04.821628','cqz8jga9oiibfpgrz3k7omk9u6r',1,'text','## Checklist','{}',1675955584818,1675955584818,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('azksjrk8eti8nbqpdtwfzdew91a','2023-02-09 15:13:08.896182','cikexdprbgb8ouynr5fmyimugwo',1,'text','## Checklist','{}',1675955588894,1675955588893,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('azmdzad8u8jboxka8c4ns1jorqw','2023-02-09 15:13:13.580969','cg137mjnyipg9myrygzh41x45gc',1,'text','To create your own board, select the \"+\" on the top of the left hand sidebar. Choose from one of our standard templates and see how they can help you get started with your next project:\n\n- **Project Tasks**: Stay on top of your project tasks, track progress, and set priorities. \n- **Meeting Agenda**: Set your meeting agendas for recurring team meetings and 1:1s.\n- **Roadmap**: Plan your roadmap and manage your releases more efficiently.\n- **Personal Tasks**: Organize your life and track your personal tasks.\n- **Content Calendar**: Plan your editorial content, assign work, and track deadlines.\n- **Personal Goals**: Set and accomplish new personal goals and milestones.','{}',1675955593578,1675955593578,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('c14ae1y7dr3y83x3n4pjj86yoty','2023-02-09 15:13:09.633194','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Improve customer NPS score','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"82%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"8.5\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"anruuoyez51r3yjxuoc8zoqnwaw\",\"azqnyswk6s1boiwuthscm78qwuo\":\"7\",\"azzbawji5bksj69sekcs4srm1ky\":\"agm9p6gcq15ueuzqq3wd4be39wy\"}}',1675955589630,1675955589630,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('c1gnbat9p3tnzfec18bf6agbhgh','2023-02-09 15:13:12.335842','bui5izho7dtn77xg3thkiqprc9r',1,'card','Icons don\'t display','{\"contentOrder\":[\"ayk98dhhnw389idq11x8ndmjdza\",\"a9azy4hfxhbb59pfz38gq5h64aw\",\"7gw8c51de83ns8fpbuof8zwhb6e\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"1fdbb515-edd2-4af5-80fc-437ed2211a49\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955592332,1675955592332,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('c1kwdjzwqsfygxe5yk53y8krkoc','2023-02-09 15:13:12.320571','bui5izho7dtn77xg3thkiqprc9r',1,'card','Review API design','{\"contentOrder\":[\"aniyqg1s9otf1jbd7bjj3hdpryw\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675955592317,1675955592317,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('c3fdqgj8ut3r1iy8ugnsae7ncqy','2023-02-09 15:13:10.882377','bh4pkixqsjift58e1qy6htrgeay',1,'card','Frank Nash','{\"contentOrder\":[\"ab14jmwfpk7yni8bm9ntrfaozuo\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"ap93ysuzy1xa7z818r6myrn4h4y\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"frank.nash@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1669896000000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"aehc83ffays3gh8myz16a8j7k4e\"}}',1675955590879,1675955590879,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('c3hswkeuxf78ydyjwsdhjh34rqw','2023-02-09 15:13:12.090972','bsjd59qtpbf888mqez3ge77domw',1,'card','Schedule more time for testing','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"akj3fkmxq7idma55mdt8sqpumyw\"}}',1675955592088,1675955592088,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('c3zsx74nrcpys8g3r5xfgknthmr','2023-02-09 15:13:13.363704','buixxjic3xjfkieees4iafdrznc',1,'card','Add new properties','{\"contentOrder\":[\"ajz9ijqfmuf8a9fb7utsccwaspr\",\"ayhk11qsuz789fk8bqae4oz8mro\",\"7gc3z8cf8rirgfyutwoke9nn6jy\",\"76cinqnb6k3dzmfbm9fnc8eofny\",\"7mdjhtadx97bnjf5tretp4gwogy\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#add-and-manage-properties\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675955593361,1675955593361,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('c5r5txf1pzir358gmkeesntg8aw','2023-02-09 15:13:03.575232','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Team Schedule','{\"contentOrder\":[\"acae5aqipzp8ndnoar5pmzw35mr\",\"7h9b4z35aypn95bozwd9nxxaujh\",\"azb84nx87xpnampc7mpqba7pfoy\",\"7n3yebdqpefyd8ynfkh66uafgch\",\"775k5efyyciy6bqtze1rpog6xzh\",\"7kkm8rm5je7dtdyaixwff5zz1ac\"],\"icon\":\"⏰\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"8b05c83e-a44a-4d04-831e-97f01d8e2003\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\"}}',1675955583572,1675955583572,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('c68ftccp7c3r69bhh5s9p6jxycy','2023-02-09 15:13:13.339620','buixxjic3xjfkieees4iafdrznc',1,'card','Filter and sort cards','{\"contentOrder\":[\"a4fz9kcfs9ibj8puk9mux7ac94c\",\"asga1bhnouid3ub4as84w4gh44o\",\"78i8aqjmqtibr7x4okhz6uqquqr\",\"7aodxtmcjzbrh9et9bu17dwsf6h\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675955593337,1675955593337,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('c6d843tks8fdc9gx7orr6odcdww','2023-02-09 15:13:11.252865','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Kadera Global','{\"contentOrder\":[\"a6m859scuoigfmk87xd15d9zd4r\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"aipf3qfgjtkheiayjuxrxbpk9wa\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"150\",\"ahzspe59iux8wigra8bg6cg18nc\":\"kaderaglobal.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$12,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2015\",\"aozntq4go4nkab688j1s7stqtfc\":\"Seattle, OR\"}}',1675955591250,1675955591250,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('c6dwoco55i7dt8c33dgdms9eudr','2023-02-09 15:13:12.079759','bsjd59qtpbf888mqez3ge77domw',1,'card','Reschedule planning meeting','{\"contentOrder\":[],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aok6pgecm85qe9k5kcphzoe63ma\"}}',1675955592077,1675955592077,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('c6wt3u45b4jdxpqkwmtgg3ws3ra','2023-02-09 15:13:10.928994','bh4pkixqsjift58e1qy6htrgeay',1,'card','Bernadette Powell','{\"contentOrder\":[\"adb89p5s3kiysxxdg9jwnqqso8a\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"af6hjb3ysuaxbwnfqpby4wwnkdr\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"bernadette.powell@email.com\"}}',1675955590926,1675955590926,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('c8q4rsku8htd7tnntzrxhpqn5ha','2023-02-09 15:13:11.241855','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Helx Industries','{\"contentOrder\":[\"a3tbx1exnfjdnjrgwug95jmqy7y\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abt79uxg5edqojsrrefcnr4eruo\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"650\",\"ahzspe59iux8wigra8bg6cg18nc\":\"helxindustries.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$50,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2009\",\"aozntq4go4nkab688j1s7stqtfc\":\"New York, NY\"}}',1675955591239,1675955591239,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('c9mgm3h9mwpnr5mkpqfdiad33cw','2023-02-09 15:13:06.906964','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Buy groceries','{\"contentOrder\":[\"ax841kejdi7rwbeed5zwomt9p3e\",\"7rjck1nau17faukrybaxf9ds47a\",\"7dbyebx37iiyomxe69okrps9uma\",\"7schpdqgqijytdebhmrgnpwcyzw\",\"7h46ajuoirjfs5cpegnu8g17pew\",\"773t4jpidzpftificz9umr1jioc\",\"74hgakzty8tgoirg7qd4ktkh3iw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"afpy8s7i45frggprmfsqngsocqh\"}}',1675955586904,1675955586904,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('c9rpp4fsq4fyazjnrufq9p197nr','2023-02-09 15:13:04.653452','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Shelby Olson','{\"contentOrder\":[\"a4i1839ku9pr4mqgubpij4e3esw\",\"aeiucy1bnufrbbjcfboxbomsnpw\",\"7yt41oaxrxfr6xmrx36fncbyr4h\",\"7dnwzbk6wxb8hzyxcrkbj5y5jsc\",\"79ziahugmrtf5bqzjx5whjdxf8y\",\"7uyez9mn8p7rftqgkfoto9g489w\",\"7fn1t4d8qqbn4mmgppyq19ioh4o\",\"7qztz8xi9upgz7rmtc5djjkss8r\",\"7cagjjmx9cirh5byccbcd4m566h\",\"7nzy654n9rj8kjyzocsxswc4rwr\",\"7y5hqudj4n78txpockgry3is9ca\",\"78qmgw8zchi8cbq9sq7zsd4isje\"],\"icon\":\"?‍♀️\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(111) 321-5678\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"abru6tz8uebdxy4skheqidh7zxy\":\"shelby.olson@email.com\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$30,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Kadera Global\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"ar6t1ttcumgfuqugg5o4g4mzrza\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"auu9bfzqeuruyjwzzqgz7q8apuw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1669291200000}\"}}',1675955584650,1675955584650,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('cagbcg7m38jydjqx1cx34pg3mzr','2023-02-09 15:13:04.637945','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','New Prospect','{\"contentOrder\":[\"aq1ien1oyzbn55j13n5r78wuzfa\",\"ak5fza5wbnjfo7dxxqe3m8rprrc\",\"7n7s9k18nejgg5ktfcuiyip5m5r\",\"7ejmo388ff784zmbjqa6m1x6txr\",\"736qmhr68utre8dutm1twinejth\",\"7de64km5zwjdrmx33wjeh38fk4h\",\"76fcdksyhjiyazkbdsncjazymzy\",\"75zzaedht4ffffr4kw11d98zidr\",\"73gdtsfdeebr8dyfmrwc1o73f9y\",\"7cxmaainfm7ycbka93uunsqabmy\",\"756mt37fhs388xk4194p3apjwhr\",\"7f7ngti4wutyb7pqogsuqy7a1xo\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"akj61wc9yxdwyw3t6m8igyf9d5o\"}}',1675955584635,1675955584635,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('canoq7x74h7nt3yppsi18j496rc','2023-02-09 15:13:13.327874','buixxjic3xjfkieees4iafdrznc',1,'card','Share cards on Channels','{\"contentOrder\":[\"a3khhsbh7rjnafeokiyxc9i8doa\",\"apu3355oj73rnimuasezwsrkrfc\",\"aoz9kboqi3tr38rpd6s5nkye34a\",\"78dxu6pcsefn33ru83dob8o4e4h\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#share-card-previews\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675955593325,1675955593325,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('catdmug46i3gebnxii6ebksmwye','2023-02-09 15:13:09.658246','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Increase customer retention','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"66%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"90% customer retention rate\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"60%\",\"azzbawji5bksj69sekcs4srm1ky\":\"afkxpcjqjypu7hhar7banxau91h\"}}',1675955589656,1675955589656,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('cb86yg4ppqbgrdktqg8hg3koqjh','2023-02-09 15:13:04.625153','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Caitlyn Russel','{\"contentOrder\":[\"at46xzyqcrjgiierds18et39ggo\",\"ad6w4zipzrbgudmb7eqwmgj78sa\",\"7za5q9fuuyiym3gysupwd9ogqfe\",\"7m69x9dxeybf5meb9mewzz46awy\",\"785ddmgjn5ff9typdnbjk9ibszo\",\"7cppnqstxdpgkzp4qicsct7r6kh\",\"7dp4n86puk7bst8c5nordyozbxr\",\"7kqqcb35odpyrum4f79za68t34a\",\"7n5i7e8ntppryzkiyr85rthn4ec\",\"7at63jg3h6fn1pqod4bngs1tpja\",\"75rrqrsp6fifb8gx4g6jwsr6o8a\",\"7sn7pp5f9g7d1fnnckshhmb163y\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(111) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"ah6ehh43rwj88jy4awensin8pcw\",\"abru6tz8uebdxy4skheqidh7zxy\":\"caitlyn.russel@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1689336000000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"20%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$250,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Liminary Corp.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"aafwyza5iwdcwcyfyj6bp7emufw\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apiswzj7uiwbh87z8dw8c6mturw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1668168000000}\"}}',1675955584622,1675955584622,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('cbb5bnkayt3d8fdagwyexka6y5a','2023-02-09 15:13:08.416766','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Requirements sign-off','{\"contentOrder\":[\"a4ywgn9zby3f6fjdgsgbbz1kjqo\",\"7ro96aqzbbifhzqridnm8bbccsr\",\"a61mepup14t83fkmx7p75jod16c\",\"7pb4fjz39uiraxqqz764s9qnkza\",\"7uji1wfkbx7nbbftj89x143mxxe\",\"7fx18ayomnjgibjqxjnht6djajr\",\"7ewhu5gutpbde5y5stwjxticsia\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"8\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\"}}',1675955588414,1675955588414,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('cbybbaewz3b85z8jwut18o6g1dr','2023-02-09 15:13:10.905408','bh4pkixqsjift58e1qy6htrgeay',1,'card','Claire Hart','{\"contentOrder\":[\"au5ex799hujratgknhmxixuws8y\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"aseqq9hrsua56r3s6nbuirj9eec\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"claire.hart@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1670500800000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"ahn89mqg9u4igk6pdm7333t8i5h\"}}',1675955590902,1675955590902,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('ccmnr5m3oppr4mm3iwqh5q4gwhh','2023-02-09 15:13:06.941962','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Gardening','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"afpy8s7i45frggprmfsqngsocqh\"}}',1675955586939,1675955586939,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('ccxzm5dsu6tbbtyhgg31f4sec9y','2023-02-09 15:13:10.103048','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','User Story','{\"contentOrder\":[\"aa8acczgyaid7xmj16c5ws4nxie\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"apht1nt5ryukdmxkh6fkfn6rgoy\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675955590100,1675955590100,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('cd8rx6nwwe38u3eebjefozn3xse','2023-02-09 15:13:13.351954','buixxjic3xjfkieees4iafdrznc',1,'card','Create a new view','{\"contentOrder\":[\"aozbezukpgif3jpbsq7tahmmp5e\",\"acjgpbs7oefgmfysdqk8jw6mw9w\",\"7owai1ux3h3gtf8byynfk6hyx1c\",\"7n8jq1dizyfgotby3o91arf1hxh\",\"77y4wffj1ctg7xmm9bx45qn6q6o\",\"7dc54s483qfyedkndrbu5gtiuao\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-views\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675955593349,1675955593349,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('cdja7nwgcaffgxdrjtni173bayh','2023-02-09 15:13:10.187213','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Epic','{\"contentOrder\":[\"au5u4me3i7f8jmqfdo1hamw1toe\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675955590184,1675955590184,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('cdzz1f3i9biypddmppc1fg97pbh','2023-02-09 15:13:11.555609','brs9cdimfw7fodyi7erqt747rhc',1,'card','Unblocking Workflows: The Guide to Developer Productivity','{\"contentOrder\":[\"77tz16jtz5x73ncs3dxc3fp1d7h\",\"aqo375g4dipdfjd1yrmznagi5ur\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1638532800000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a3pdzi53kpbd4okzdkz6khi87zo\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"apy9dcd7zmand615p3h53zjqxjh\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1639483200000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://mattermost.com/newsroom/press-releases/mattermost-unveils-definitive-report-on-the-state-of-developer-productivity-unblocking-workflows-the-guide-to-developer-productivity-2022-edition/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"a3xky7ygn14osr1mokerbfah5cy\"}}',1675955591553,1675955591552,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('cebwuam6qgbb65qki6xx8rcuoph','2023-02-09 15:13:13.281513','buixxjic3xjfkieees4iafdrznc',1,'card','Manage tasks with cards','{\"contentOrder\":[\"amattnuhzcj8hxg1e3pqszzegrh\",\"763nbftujuine8x6tuxwkboqbsa\",\"7ioxhuh3pyfn69f7ifmurqkns6w\",\"784uu3ufcgb878ky7hyugmf6xcw\",\"7kgijm6giob86pnekppcu6as7se\",\"7p8qyw935rjnstqxmcofm79q44o\",\"7oryzjiozefnozf4eipqqgf131y\",\"7nb8y7jyoetro8cd36qcju53z8c\",\"7njhr916g83bp8c8eajpcmyyxpw\",\"7rp75rubz3jfmmx4o4nsb74u4fh\",\"76nwb9tqfsid5jx46yw34itqima\",\"7dy3mcgzgybf1ifa3emgewkzj7e\",\"a5ca6tii33bfw8ba36y1rswq3he\",\"7876od6xhffr6fy69zeogag7eyw\",\"7x7bq9awkatbm5x4docbh5gaw4y\",\"7ghpx9qff43dgtke1rwidmge1ho\",\"7nb8y7jyoetro8cd36qcju53z8c\",\"7hdyxemhbytfm3m83g88djq9nhr\",\"7pgnejxokubbe9kdrxj6g9qa41e\",\"7hw9z6qtx8jyizkmm9g5yq3gxcy\",\"7gk6ooz6npbb8by5rgp9aig7tua\",\"711sojjc1sbbqxgpjoujp18doua\"],\"icon\":\"☑️\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675955593279,1675955593279,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('cemryxdyma7r9pek7nrua5mkcga','2023-02-09 15:13:12.260383','bui5izho7dtn77xg3thkiqprc9r',1,'card','App crashing','{\"contentOrder\":[\"79t7rkiuspeneqi9xurou9tqzwh\",\"akhqdd35se3yz5xh5zt6ozeenwy\",\"aktyo8f7993ny8x1w7c1pkr375r\",\"7yj1c1y6n8bnez8srebr9xyhp1o\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"1fdbb515-edd2-4af5-80fc-437ed2211a49\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\"}}',1675955592257,1675955592257,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('ceutpudw3u38spenb7t395wup3o','2023-02-09 15:13:03.615532','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Social Media Strategy','{\"contentOrder\":[\"aendew5n7apfpfbfg94hjcr8bch\",\"7oe98455wh7drtbrxkkuj3hqr3e\",\"aijmqfdwxp7d7mj14o3ueuhbhha\",\"7abtt31h8ojfstkz3uzxejgcq9e\",\"7z56arow18jdw7deb6jkusbymga\",\"75m4ipoxsuibdxgf6z6cbxio4zh\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"b1abafbf-a038-4a19-8b68-56e0fd2319f7\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed\"}}',1675955583613,1675955583613,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('cf33otfdy33nfpg9xg5c5ftdp3a','2023-02-09 15:13:10.893487','bh4pkixqsjift58e1qy6htrgeay',1,'card','Richard Parsons','{\"contentOrder\":[\"aobnpxchj3jgyxy6joc3yefpcdy\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"a7yq89whddzob1futao4rxk3yzc\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"richard.parsons@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1671019200000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"a1sxagjgaadym5yrjak6tcup1oa\"}}',1675955590891,1675955590891,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('cf75w38ufx7nmukby5irgojbskw','2023-02-09 15:13:12.302937','bui5izho7dtn77xg3thkiqprc9r',1,'card','Import / Export','{\"contentOrder\":[\"ahaqysju1yj8jjnwzycyeyysmuc\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955592299,1675955592299,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('cf84s7zu18jbeud54uwzam8qwpo','2023-02-09 15:13:10.199210','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Global templates','{\"contentOrder\":[\"ax115hmekot8jupz7ewgqywi6so\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"a6ghze4iy441qhsh3eijnc8hwze\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"2\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955590196,1675955590196,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('cfxrcmsqwtb8ejdae9pcenmh9mw','2023-02-09 15:13:06.895208','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Pay bills','{\"contentOrder\":[\"74nkkz6zcgjrmffrb81edxjszke\",\"7whfs7b1kyb8cmy4j6588inr99y\",\"74krinybrui8z9rgw5tg71zwkjo\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"aj4jyekqqssatjcq7r7chmy19ey\",\"abthng7baedhhtrwsdodeuincqy\":\"true\"}}',1675955586893,1675955586892,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('cg137mjnyipg9myrygzh41x45gc','2023-02-09 15:13:13.293462','buixxjic3xjfkieees4iafdrznc',1,'card','Create your own board','{\"contentOrder\":[\"ap6pw4f666id75r56b7uxutop4y\",\"azmdzad8u8jboxka8c4ns1jorqw\",\"7r9my1yuddbn45dojrfht3neg8c\",\"7eir5gdjxgjbsxpbyp3df4npcze\",\"7qacsxadf1bde8r5fdniorab7ge\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-boards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675955593291,1675955593291,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('cg46r9od7rf8ipr5139ydfieu8y','2023-02-09 15:13:10.114901','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Horizontal scroll issue','{\"contentOrder\":[\"ahsudf7h5qt87dm59owgpnf14jr\",\"aizi5qcgx8bbc9fsx1f7t73d5do\",\"73c8tujmzdjywtqz8ff6akofquw\"],\"icon\":\"〰️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"1\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955590112,1675955590112,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('chdoctirc6ig39nbq17xhhgsdew','2023-02-09 15:13:03.603065','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Offsite plans','{\"contentOrder\":[\"akmg5iau977bqfxjmob8mq9ts3o\",\"7fskgnngriig4mmzps38rb5od6r\",\"aqz87s9n9o7gcjchd8ahiwgrtya\",\"7nqfotfzk33rc9nkmqomrfkd6ue\",\"7pdzn5d5xjjy33juafyfrus9are\",\"7gbhpcbahobrs9bb7985rb5rnje\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"8b05c83e-a44a-4d04-831e-97f01d8e2003\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"dabadd9b-adf1-4d9f-8702-805ac6cef602\"}}',1675955583600,1675955583600,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('chnnww5gm138xjpobgmcnbqyspw','2023-02-09 15:13:12.289136','bui5izho7dtn77xg3thkiqprc9r',1,'card','Standard templates','{\"contentOrder\":[\"7uonmjk41nipnrsi6tz8wau5ssh\",\"a5amnooqcz7gy7yjd19dh3449ny\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955592286,1675955592286,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('chpcf3jedh7n95yo63snp4wrnbr','2023-02-09 15:13:09.919806','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Learn to paint','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"77c539af-309c-4db1-8329-d20ef7e9eacd\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"9a090e33-b110-4268-8909-132c5002c90e\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"3245a32d-f688-463b-87f4-8e7142c1b397\"}}',1675955589917,1675955589917,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('chqd96dxi7jf3me4zd3c8na77ua','2023-02-09 15:13:10.161831','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Bug','{\"contentOrder\":[\"amgk6gg4axfr5dmmid37qinmohh\",\"auewq49obsbboumrqbf36xh3pya\",\"74qqg3xc8xt8n3b5c9jxrzf9zwc\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675955590159,1675955590159,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('chz4o8wszhjyutfqmzrmhcbbc9r','2023-02-09 15:13:09.931403','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Open retirement account','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"80be816c-fc7a-4928-8489-8b02180f4954\"}}',1675955589929,1675955589929,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('cihn9mny6tbf3pbqa5kzqy3mhrr','2023-02-09 15:13:09.668449','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Hit company global sales target','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a6robxx81diugpjq5jkezz3j1fo\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"15%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"50MM\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"awfu37js3fomfkkczm1zppac57a\",\"azqnyswk6s1boiwuthscm78qwuo\":\"7.5MM\",\"azzbawji5bksj69sekcs4srm1ky\":\"agrfeaoj7d8p5ianw5iaf3191ae\"}}',1675955589666,1675955589666,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('cikexdprbgb8ouynr5fmyimugwo','2023-02-09 15:13:08.440680','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Conduct market analysis','{\"contentOrder\":[\"ar4eie8yh8pgymkxy34hp3phuch\",\"7zas7gqctb3gxtm9ur6n7h3b1ah\",\"azksjrk8eti8nbqpdtwfzdew91a\",\"78mh743bik3g1temrf9qmz78n7a\",\"713gcs33jf3bpzgk9pfb3xkqcrw\",\"7nu7wk7cem78ypk7tcime36ghpc\",\"7fknjncjw978kzjmsau1j6wxftw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"40\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"87f59784-b859-4c24-8ebe-17c766e081dd\"}}',1675955588438,1675955588438,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('cix88w1wqzjfb8gccg6ajrsr5th','2023-02-09 15:13:08.429218','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Project budget approval','{\"contentOrder\":[\"atw666atbn3848m58coybbxssdw\",\"77teehuznqigd7ftbyqpys3m46y\",\"anrds5daywjyhmmawh6piy9mw6h\",\"7kbs6muxmibymjenhatf9fycyse\",\"7zpump4j4g7rkfgisdrcofz5b5r\",\"79pbspduwjjdwtfeh9m9htaqszr\",\"76j9579bkobdx9yffs8c36ajzto\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"16\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\"}}',1675955588426,1675955588426,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('ciz8686j1fiyhidmgri8ozp1c8c','2023-02-09 15:13:09.679105','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Increase user signups by 30%','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a6robxx81diugpjq5jkezz3j1fo\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"ao9b5pxyt7tkgdohzh9oaustdhr\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"0%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"1,000\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"0\",\"azzbawji5bksj69sekcs4srm1ky\":\"afkxpcjqjypu7hhar7banxau91h\"}}',1675955589677,1675955589677,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('cjdd8x6b5atn4jj77nopukkrhja','2023-02-09 15:13:12.068237','bsjd59qtpbf888mqez3ge77domw',1,'card','Team communication','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aq1dwbf661yx337hjcd5q3sbxwa\"}}',1675955592066,1675955592065,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('ck1fpxeqebtyb3mpdasdfubk68c','2023-02-09 15:13:09.643738','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Generate more Marketing Qualified Leads (MQLs)','{\"contentOrder\":[],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"65%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"100\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"ahfbn1jsmhydym33ygxwg5jt3kh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"65\",\"azzbawji5bksj69sekcs4srm1ky\":\"aehoa17cz18rqnrf75g7dwhphpr\"}}',1675955589641,1675955589641,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('ck7c7denp7tg53xnt5oz7xw8hde','2023-02-09 15:13:10.210978','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Feature','{\"contentOrder\":[\"ahj5ij6oshidt78xu8e34s8zmjh\"],\"icon\":\"?️\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675955590208,1675955590208,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ckebmbmaycbrqbnot866fk7ij7y','2023-02-09 15:13:08.404699','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Define project scope','{\"contentOrder\":[\"afsw7hyn5xpncffxn9yn5e4qbna\",\"7tf43bs64ipnwjdocnawsd3depy\",\"ap1w3ix4qybrzpbp5yi4a79p8te\",\"7q933hz9op7ycuf8iywr84t3o5r\",\"7tydudw9j4ibpmgy8bqp7egndro\",\"75yipdr6tgireprzzk9yk5866nc\",\"7daynwntzrtfd7muqo8ow9jhh3e\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"32\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"87f59784-b859-4c24-8ebe-17c766e081dd\"}}',1675955588402,1675955588402,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('cmb3x9uyadt8yunxp8uose619qo','2023-02-09 15:13:12.102273','bsjd59qtpbf888mqez3ge77domw',1,'card','Positive user feedback','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aq1dwbf661yx337hjcd5q3sbxwa\"}}',1675955592100,1675955592099,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('cmz9qxykqgpdyxf9j5axmwejt1e','2023-02-09 15:13:10.126731','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Login screen not loading','{\"contentOrder\":[\"aupenqk7botbjzen4dn9ue1wfpr\",\"amp6pbkxejbyhxywexbk8ftfdth\",\"7ychgwnpe6p8x9qqubki3dukuny\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"abrfos7e7eczk9rqw6y5abadm1y\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"1\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\"}}',1675955590124,1675955590124,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('cmzq3bnpxmt8f3k34pnjycidkzh','2023-02-09 15:13:11.519530','brs9cdimfw7fodyi7erqt747rhc',1,'card','New Project and Workflow Management Solutions for Developers','{\"contentOrder\":[\"71qhnzuec6esdi6fnynwpze4xya\",\"a3m9cwtsqr3bd5q1seams43jwje\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1645790400000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a8xceonxiu4n3c43szhskqizicr\",\"a3pdzi53kpbd4okzdkz6khi87zo\",\"a3d9ux4fmi3anyd11kyipfbhwde\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"awna1nuarjca99m9s4uiy9kwj5h\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://mattermost.com/newsroom/press-releases/mattermost-launches-new-project-and-workflow-management-solutions-for-developers/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"aywiofmmtd3ofgzj95ysky4pjga\"}}',1675955591517,1675955591516,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('cn3cj63de9t81jdceapfgdtqhcy','2023-02-09 15:13:13.376487','buixxjic3xjfkieees4iafdrznc',1,'card','@mention teammates','{\"contentOrder\":[\"aue5actny978cmg85oyjyxqtcre\",\"a5e44frgpzj8ozmoxn8cu7x8uoh\",\"7mbw9t71hjbrydgzgkqqaoh8usr\",\"73k1zgokp5tn1fyxjuhapq4464h\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#mention-people\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675955593373,1675955593373,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('cnogc7s1x13bgmjz456dudb85py','2023-02-09 15:13:06.918376','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Go for a walk','{\"contentOrder\":[\"ac3qw7f339fy75gquwsqby3z8kr\",\"acciczh6eo7rs8cyrqm5ffko16r\",\"746wb7e7yejywmcd7ty5szxzhay\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"an51dnkenmoog9cetapbc4uyt3y\"}}',1675955586916,1675955586916,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('cnq9ritr7t7nomyupipc9j7dbde','2023-02-09 15:13:03.588985','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Video production','{\"contentOrder\":[\"ayhpkueiieirsmbm5zeejtfmite\",\"7hxggh6364iy6tmgdsbzms4w5ch\",\"ant34hxkckfnffjs4cu97gwry7a\",\"7mpepf7wxobbidpyxi9ijubzhrc\",\"779wdqq3wop86tet8akjqpqmrqa\",\"77o8djgrjftyoi8incgsp34d3xo\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"b1abafbf-a038-4a19-8b68-56e0fd2319f7\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\"}}',1675955583585,1675955583585,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('cnzbty5iahbdh9nf4p6ng1mnfxh','2023-02-09 15:13:13.305024','buixxjic3xjfkieees4iafdrznc',1,'card','Share a board','{\"contentOrder\":[\"amh8jwmku4pd78e3kytbzekmeac\",\"a9iqt7u3xffb8zjnbcr4bxhywuc\",\"7r7asyew8d7fyunf4sow8e5iyoc\",\"ad8j3n8tp77bppee3ipjt6odgpe\",\"7w935usqt6pby8qz9x5pxaj7iow\",\"7ogbs8h6q4j8z7ngy1m7eag63nw\",\"7z1jau5qy3jfcxdp5cgq3duk6ne\",\"78gu3eap8diyk3q98psfyfg43yw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/sharing-boards.html\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675955593302,1675955593302,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('coi789ctpa3n5bpqsgc1jcswqso','2023-02-09 15:13:13.316741','buixxjic3xjfkieees4iafdrznc',1,'card','Create a new card','{\"contentOrder\":[\"am97jryax1iro7n85jroh8778yw\",\"adhsx4h5ss7rqdcjt8xyam6xtqc\",\"aeugpze8spbf4xq6ce5ahutzagc\",\"7me9p46gbqiyfmfnapi7dyxb5br\",\"7ijfsqoy7mbnttp5gtj9qszbkje\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-cards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675955593314,1675955593314,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('cp8xyhyy85tgq3c6jgqmhdz3ree','2023-02-09 15:13:11.274987','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Afformance Ltd.','{\"contentOrder\":[\"axskm1c8n4inbfc56m6737xncza\"],\"icon\":\"⚡\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"arfjpz9by5car71tz3behba8yih\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"1,800\",\"ahzspe59iux8wigra8bg6cg18nc\":\"afformanceltd.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$200,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2002\",\"aozntq4go4nkab688j1s7stqtfc\":\"Palo Alto, CA\"}}',1675955591272,1675955591272,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('cpeyrctcb77yb3jf38m9fo9hmnw','2023-02-09 15:13:09.897175','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Start a daily journal','{\"contentOrder\":[],\"icon\":\"✍️\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"3245a32d-f688-463b-87f4-8e7142c1b397\"}}',1675955589894,1675955589894,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('cpf3yt33tffrmupsismb1jhymry','2023-02-09 15:13:12.056615','bsjd59qtpbf888mqez3ge77domw',1,'card','Tight deadline','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"ar87yh5xmsswqkxmjq1ipfftfpc\"}}',1675955592054,1675955592054,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('cq9nnxgdcwfd88djwnyt88t4uuh','2023-02-09 15:13:11.531603','brs9cdimfw7fodyi7erqt747rhc',1,'card','[Tweet] Mattermost v6.1 includes card @-mention notifications in Boards','{\"contentOrder\":[\"7i96m7nbsdsex8n6hzuzrmdfjuy\",\"7ed5bwp3gr8yax3mhtuwiaa9gjy\",\"afpgs6xraqjyuuf4zhy7fsio4ur\",\"agawe389ja7ykfmnmjetbxkto9w\",\"abdasiyq4k7ndtfrdadrias8sjy\",\"7zkd1rzi4ibnb9n57hyq97azc6e\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1639051200000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"az8o8pfe9hq6s7xaehoqyc3wpyc\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"a9ana1e9w673o5cp8md4xjjwfto\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1637668800000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://twitter.com/Mattermost/status/1463145633162969097?s=20\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"aj8y675weso8kpb6eceqbpj4ruw\"}}',1675955591529,1675955591529,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('cqangpbz5c3rpfefzdbe4totwnc','2023-02-09 15:13:12.275560','bui5izho7dtn77xg3thkiqprc9r',1,'card','Calendar view','{\"contentOrder\":[\"7df11783ny67mdnognqae31ax6y\",\"agbfxbbe1qpbtzghib1xffspybo\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"849766ba-56a5-48d1-886f-21672f415395\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955592272,1675955592272,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('cqjjdicpjo3dq5qb16zfg4sqy9e','2023-02-09 15:13:09.701932','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Launch 3 key features','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"apnt1f7na9rzgk1rt49keg7xbiy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"ao9b5pxyt7tkgdohzh9oaustdhr\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"33%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"3\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"anruuoyez51r3yjxuoc8zoqnwaw\",\"azqnyswk6s1boiwuthscm78qwuo\":\"1\",\"azzbawji5bksj69sekcs4srm1ky\":\"aw5i7hmpadn6mbwbz955ubarhme\"}}',1675955589699,1675955589699,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('cqz8jga9oiibfpgrz3k7omk9u6r','2023-02-09 15:13:04.587491','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Jonathan Frazier','{\"contentOrder\":[\"acjrasnxctirofjybch3qr3dcha\",\"azj1msd6fjt8wddpy3gms8ka19h\",\"7m4mrkfifhbyrtch3erzptz97fr\",\"7cg6kk14tapf7mxuh899fhqu1gr\",\"79tzorr1j3if45qtmqeu64ow4dc\",\"7rwguisc183gmzeb1wcc47zp1zr\",\"7eiph4pj85pnpjkf9n7osnbzw4o\",\"79icsf954fi81bqybb4xjr6bgmc\",\"79onrnkio4jn9ipmgwk1pfz1eze\",\"73kmx8c9hhj8ubyif78mbbgdy1w\",\"7gzup5jwux3nu3qg81q38u4fiec\",\"7xecy5bwnptf6fgpkfbaetwam9r\"],\"icon\":\"?‍♂️\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(999) 123-5678\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"a5txuiubumsmrs8gsd5jz5gc1oa\",\"abru6tz8uebdxy4skheqidh7zxy\":\"jonathan.frazier@email.com\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"0%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$800,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Ositions Inc.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"as5bk6afoaaa7caewe1zc391sce\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apiswzj7uiwbh87z8dw8c6mturw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1669118400000}\"}}',1675955584584,1675955584584,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('crmtkd3pua38h5ysmxcjr5hw88o','2023-02-09 15:13:06.929555','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Feed Fluffy','{\"contentOrder\":[\"a7fm9z5ztp3fo7bt3g78iermp3h\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"an51dnkenmoog9cetapbc4uyt3y\"}}',1675955586927,1675955586927,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('cskmj8hxihj8gtdrusqkoxw9ruw','2023-02-09 15:13:10.917337','bh4pkixqsjift58e1qy6htrgeay',1,'card','Olivia Alsop','{\"contentOrder\":[\"aur9jj4ywcpbm3yn3kc341xcmew\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"a7yq89whddzob1futao4rxk3yzc\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"olivia.alsop@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1671192000000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"a1sxagjgaadym5yrjak6tcup1oa\"}}',1675955590915,1675955590914,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('cstu6h6hfcfd59yc4qwd4pd3i4o','2023-02-09 15:13:10.138525','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Move cards across boards','{\"contentOrder\":[\"asgkpsgg3qfyaifjb1n6c7qowzh\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"abrfos7e7eczk9rqw6y5abadm1y\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"2\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955590136,1675955590136,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ct9j46agym7fh3e8o3a9zmjiaya','2023-02-09 15:13:09.907991','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Run 3 times a week','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"6e7139e4-5358-46bb-8c01-7b029a57b80a\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"ffb3f951-b47f-413b-8f1d-238666728008\"}}',1675955589905,1675955589905,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('ctcfiuyp4n78h9ef5jt9nu7mgze','2023-02-09 15:13:09.713387','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Reduce bug backlog by 50%','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"abzfwnn6rmtfzyq5hg8uqmpsncy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a1ts3ftyr8nocsicui98c89uxjy\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"100%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"75\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"awfu37js3fomfkkczm1zppac57a\",\"azqnyswk6s1boiwuthscm78qwuo\":\"75\",\"azzbawji5bksj69sekcs4srm1ky\":\"aw5i7hmpadn6mbwbz955ubarhme\"}}',1675955589711,1675955589711,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('ctyi7g1r847rfteynz1fjqk8hmr','2023-02-09 15:13:08.392304','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Identify dependencies','{\"contentOrder\":[\"apowhzozrbty6xjowzi3by71iqa\",\"7at5hq148mfd1ueddegye8p3gsc\",\"a4je4p13yqjf6pcizp6hc1zb9ay\",\"76feihzqhofn6tc8kdsn3gsutjy\",\"73hp6ecz38in6z8u19qcb3asrkw\",\"719rhgqi9otgk8dpj3sibdwes9h\",\"7go8ujqeusjgbmg7bgynkbm343r\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"16\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"98a57627-0f76-471d-850d-91f3ed9fd213\"}}',1675955588390,1675955588389,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('cu91ugd56rirqxyupgjwozoi7tr','2023-02-09 15:13:11.230171','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Liminary Corp.','{\"contentOrder\":[\"aq3fh99xz5iro3fnm5opwh5n3tc\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abt79uxg5edqojsrrefcnr4eruo\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"300\",\"ahzspe59iux8wigra8bg6cg18nc\":\"liminarycorp.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$25,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2017\",\"aozntq4go4nkab688j1s7stqtfc\":\"Toronto, Canada\"}}',1675955591227,1675955591227,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('cux6yuab9k3drtps9dr6su8xjuo','2023-02-09 15:13:09.690579','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Add 10 new customers in the EU','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"apnt1f7na9rzgk1rt49keg7xbiy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a1ts3ftyr8nocsicui98c89uxjy\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"30%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"10\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"3\",\"azzbawji5bksj69sekcs4srm1ky\":\"agrfeaoj7d8p5ianw5iaf3191ae\"}}',1675955589688,1675955589688,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('cuxggn3p3kjf4upaaywym3xm59c','2023-02-09 15:13:11.543812','brs9cdimfw7fodyi7erqt747rhc',1,'card','Top 10 Must-Have DevOps Tools in 2021','{\"contentOrder\":[\"7fo1utqc8x1z1z6hzg33hes1ktc\",\"aqhufq7p6uinm98td11ayxurabw\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1636113600000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a8xceonxiu4n3c43szhskqizicr\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"a9ana1e9w673o5cp8md4xjjwfto\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1637323200000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://www.toolbox.com/tech/devops/articles/best-devops-tools/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"a3xky7ygn14osr1mokerbfah5cy\"}}',1675955591541,1675955591541,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('cw85ce7jszt8ufcdo44ay1buega','2023-02-09 15:13:10.174224','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Standard properties','{\"contentOrder\":[\"awigum1hx6ige8rfzhpmcmrkmhy\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955590171,1675955590171,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('cxjttr33wdbyqifk6j159j45ody','2023-02-09 15:13:04.612982','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Byron Cole','{\"contentOrder\":[\"az1eoncet73ni3dco91wjo1pwba\",\"anqhq6hzz6jn1ffwxxnsxn9uudy\",\"7jck4rzdb3jfzmpbn6nofzdtzyy\",\"7686cyfw5wpd8mc7exp6wmsnt8y\",\"7maefej36gt8pt85twg464jtu1o\",\"7ditit61ok3813rxkhhr1bqcz3o\",\"7p1e6xnjebtyztqxe65p4bie77o\",\"7tbdcr6rhutbf7dst5nkzyo7mrh\",\"7efsjhctpz7bqifds3q6fkwnfzh\",\"7ojbrfnqjofnmtx7tzbo96xrowr\",\"7s8ppoa9s778dib5ztgez9daroh\",\"7qwh7i5bb8t8w8yyxogqs4bapya\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(333) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"acm9q494bcthyoqzmfogxxy5czy\",\"abru6tz8uebdxy4skheqidh7zxy\":\"byron.cole@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1667563200000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"100%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$500,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Helx Industries\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"aafwyza5iwdcwcyfyj6bp7emufw\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apjnaggwixchfxwiatfh7ey7uno\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1667822400000}\"}}',1675955584610,1675955584610,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('cyhm5hrnra781bpeatqyygemgah','2023-02-09 15:13:11.263778','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Ositions Inc.','{\"contentOrder\":[\"ach1ouji393na7cfh4ozzjb7teo\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abajmr34b8g1916w495xjb35iko\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"2,700\",\"ahzspe59iux8wigra8bg6cg18nc\":\"ositionsinc.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$125,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2004\",\"aozntq4go4nkab688j1s7stqtfc\":\"Berlin, Germany\"}}',1675955591261,1675955591261,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('czbk3bqy8k3yjde4fnu9o8ircby','2023-02-09 15:13:13.269341','buixxjic3xjfkieees4iafdrznc',1,'card','Drag cards','{\"contentOrder\":[\"apktbgtee5jb8xrnqy3ibiujxew\",\"ajmhitsxxbfrb3mrewrxm1st15c\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#dragging-cards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675955593266,1675955593266,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('czf1skn1natn3ppzqqqf5kc3bgr','2023-02-09 15:13:10.150517','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Cross-team collaboration','{\"contentOrder\":[\"ayqbm41jf87b7f8ci34p3misikh\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675955590148,1675955590148,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('czo1hzhtwgbg3tde9scsbn9ogbc','2023-02-09 15:13:04.600097','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Richard Guzman','{\"contentOrder\":[\"ahmoo614kjty4iqp164y6bmtygc\",\"apr37rx4thtfm8d8z39k7ufxqew\",\"716g47bgjq3fubxkq8ei4sdoxer\",\"73fxjs7dmjjnixx3yb83d5bxf3e\",\"7zafpkhuoipfatyn4quyp5ho54e\",\"7owb1aajjdi8e8mwqq3d11dgama\",\"74873uaoxs3fm3eg14qyw38m7ah\",\"7tr7zu89w9frr3ninfpmxnri37c\",\"7i986n3un6t8kmet7t7g8ax1h8r\",\"7wtd46dn8qjy9xpq6mpo48k6cwo\",\"7k1rumqtdqbbsmxzmw7p1juk4ur\",\"7hasspemw6fftdj5n7rtgu73kme\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(222) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"axesd74yuxtbmw1sbk8ufax7z3a\",\"abru6tz8uebdxy4skheqidh7zxy\":\"richard.guzman@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1681992000000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"80%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$3,200,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Afformance Ltd.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"ar6t1ttcumgfuqugg5o4g4mzrza\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apjnaggwixchfxwiatfh7ey7uno\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1667476800000}\"}}',1675955584597,1675955584597,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('v1h3ksgie13dr8xzdb3k1dn1c1h','2023-02-09 15:13:08.488854','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Task Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a3zsw7xs8sxy7atj8b6totp3mby\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955588486,1675955588486,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('v3q1cdyd397bdzygdzeq1daip1r','2023-02-09 15:13:12.391491','bui5izho7dtn77xg3thkiqprc9r',1,'view','Board: Status','{\"cardOrder\":[\"cemryxdyma7r9pek7nrua5mkcga\",\"cm4w7cc3aac6s9jdcujbs4j8f4r\",\"c6egh6cpnj137ixdoitsoxq17oo\",\"cct9u78utsdyotmejbmwwg66ihr\",\"cmft87it1q7yebbd51ij9k65xbw\",\"c9fe77j9qcruxf4itzib7ag6f1c\",\"coup7afjknqnzbdwghiwbsq541w\",\"c5ex1hndz8qyc8gx6ofbfeksftc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"849766ba-56a5-48d1-886f-21672f415395\",\"\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955592388,1675955592388,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('v3rk4y8387jbticpomjxwnoj4ww','2023-02-09 15:13:04.572977','',1,'view','Pipeline Tracker','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"aic89a5xox4wbppi6mbyx6ujsda\",\"ah6ehh43rwj88jy4awensin8pcw\",\"aprhd96zwi34o9cs4xyr3o9sf3c\",\"axesd74yuxtbmw1sbk8ufax7z3a\",\"a5txuiubumsmrs8gsd5jz5gc1oa\",\"acm9q494bcthyoqzmfogxxy5czy\"],\"visiblePropertyIds\":[\"aro91wme9kfaie5ceu9qasmtcnw\",\"amahgyn9n4twaapg3jyxb6y4jic\"]}',1675955584570,1675955584570,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('v57ftqfq63prp3b39dwmc651p1r','2023-02-09 15:13:12.349536','bui5izho7dtn77xg3thkiqprc9r',1,'view','Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a4378omyhmgj3bex13sj4wbpfiy\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955592346,1675955592346,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('v5ej5sfnztpnrirb5z6ykpb6ibo','2023-02-09 15:13:10.940484','bh4pkixqsjift58e1qy6htrgeay',1,'view','By Date','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"akrxgi7p7w14fym3gbynb98t9fh\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955590938,1675955590938,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('v6kujqkcy7f8piqcrtza4idxjkr','2023-02-09 15:13:11.567153','brs9cdimfw7fodyi7erqt747rhc',1,'view','By Status','{\"cardOrder\":[null,\"cdbfkd15d6iy18rgx1tskmfsr6c\",\"cn8yofg9rtkgmzgmb5xdi56p3ic\",\"csgsnnywpuqzs5jgq87snk9x17e\",\"cqwaytore5y487wdu8zffppqnea\",null],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"awna1nuarjca99m9s4uiy9kwj5h\",\"a9ana1e9w673o5cp8md4xjjwfto\",\"apy9dcd7zmand615p3h53zjqxjh\",\"acri4cm3bmay55f7ksztphmtnga\",\"amsowcd9a8e1kid317r7ttw6uzh\",\"\"],\"visiblePropertyIds\":[\"ab6mbock6styfe6htf815ph1mhw\"]}',1675955591564,1675955591564,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('v7q55a6grpig63pz88zumq171fe','2023-02-09 15:13:08.465774','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Progress Tracker','{\"cardOrder\":[\"cix88w1wqzjfb8gccg6ajrsr5th\",\"cbb5bnkayt3d8fdagwyexka6y5a\",\"ctyi7g1r847rfteynz1fjqk8hmr\",\"cikexdprbgb8ouynr5fmyimugwo\",\"ckebmbmaycbrqbnot866fk7ij7y\",\"coxnjt3ro1in19dd1e3awdt338r\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{\"\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"adeo5xuwne3qjue83fcozekz8ko\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"afi4o5nhnqc3smtzs1hs3ij34dh\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ahpyxfnnrzynsw3im1psxpkgtpe\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ar6b8m3jxr3asyxhr8iucdbo6yc\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ayz81h9f3dwp7rzzbdebesc7ute\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"}},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"ayz81h9f3dwp7rzzbdebesc7ute\",\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"afi4o5nhnqc3smtzs1hs3ij34dh\",\"adeo5xuwne3qjue83fcozekz8ko\",\"ahpyxfnnrzynsw3im1psxpkgtpe\",\"\"],\"visiblePropertyIds\":[\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675955588463,1675955588463,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('v87yj5fi9x3df7nixwmki57jxke','2023-02-09 15:13:10.952210','bixohg18tt11in4qbtinimk974y',1,'view','By Status','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"af6hjb3ysuaxbwnfqpby4wwnkdr\",\"aotxum1p5bw3xuzqz3ctjw66yww\",\"a7yq89whddzob1futao4rxk3yzc\",\"aseqq9hrsua56r3s6nbuirj9eec\",\"ap93ysuzy1xa7z818r6myrn4h4y\"],\"visiblePropertyIds\":[]}',1675955590949,1675955590949,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('v9cag9wub3jbdddgftbjjgxya1w','2023-02-09 15:13:13.427210','buixxjic3xjfkieees4iafdrznc',1,'view','Onboarding','{\"cardOrder\":[\"coi789ctpa3n5bpqsgc1jcswqso\",\"cebwuam6qgbb65qki6xx8rcuoph\",\"cg137mjnyipg9myrygzh41x45gc\",\"canoq7x74h7nt3yppsi18j496rc\",\"c3zsx74nrcpys8g3r5xfgknthmr\",\"cd8rx6nwwe38u3eebjefozn3xse\",\"cn3cj63de9t81jdceapfgdtqhcy\",\"czbk3bqy8k3yjde4fnu9o8ircby\",\"cnzbty5iahbdh9nf4p6ng1mnfxh\",\"c68ftccp7c3r69bhh5s9p6jxycy\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aqb5x3pt87dcc9stbk4ofodrpoy\",\"a1mtm777bkagq3iuu7xo9b13qfr\",\"auxbwzptiqzkii5r61uz3ndsy1r\",\"aj9386k1bx8qwmepeuxg3b7z4pw\"],\"visiblePropertyIds\":[]}',1675955593425,1675955593425,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('v9jmhicsnx7noiksf1774qoqr1y','2023-02-09 15:13:03.628609','b7wnw9awd4pnefryhq51apbzb4c',1,'view','Discussion Items','{\"cardOrder\":[\"cjpkiya33qsagr4f9hrdwhgiajc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"4cf1568d-530f-4028-8ffd-bdc65249187e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"4cf1568d-530f-4028-8ffd-bdc65249187e\"]}',1675955583626,1675955583625,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('vbb6n3631kfy9fkr9r39q5un1ey','2023-02-09 15:13:13.399961','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"acmg7mz1rr1eykfug4hcdpb1y1o\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955593397,1675955593397,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('vbhk6qjmoutndbnc3ufci6kcwzy','2023-02-09 15:13:04.559588','',1,'view','All Contacts','{\"cardOrder\":[\"c9rpp4fsq4fyazjnrufq9p197nr\",\"cb86yg4ppqbgrdktqg8hg3koqjh\",\"czo1hzhtwgbg3tde9scsbn9ogbc\",\"cqz8jga9oiibfpgrz3k7omk9u6r\",\"cxjttr33wdbyqifk6j159j45ody\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":240,\"a1438fbbhjeffkexmcfhnx99o1h\":151,\"a5hwxjsmkn6bak6r7uea5bx1kwc\":132,\"abru6tz8uebdxy4skheqidh7zxy\":247,\"adtf1151chornmihz4xbgbk9exa\":125,\"aejo5tcmq54bauuueem9wc4fw4y\":127,\"ahf43e44h3y8ftanqgzno9z7q7w\":129,\"ainpw47babwkpyj77ic4b9zq9xr\":157,\"amahgyn9n4twaapg3jyxb6y4jic\":224,\"amba7ot98fh7hwsx8jdcfst5g7h\":171,\"aoheuj1f3mu6eehygr45fxa144y\":130,\"auhf91pm85f73swwidi4wid8jqe\":157},\"defaultTemplateId\":\"cagbcg7m38jydjqx1cx34pg3mzr\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a5hwxjsmkn6bak6r7uea5bx1kwc\",\"aoheuj1f3mu6eehygr45fxa144y\",\"aro91wme9kfaie5ceu9qasmtcnw\",\"ainpw47babwkpyj77ic4b9zq9xr\",\"ahf43e44h3y8ftanqgzno9z7q7w\",\"amahgyn9n4twaapg3jyxb6y4jic\",\"abru6tz8uebdxy4skheqidh7zxy\",\"a1438fbbhjeffkexmcfhnx99o1h\",\"auhf91pm85f73swwidi4wid8jqe\",\"adtf1151chornmihz4xbgbk9exa\",\"aejo5tcmq54bauuueem9wc4fw4y\",\"amba7ot98fh7hwsx8jdcfst5g7h\"]}',1675955584557,1675955584557,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('vcz3ze78af7yd8xehda9gxs75tc','2023-02-09 15:13:08.477419','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Task Overview','{\"cardOrder\":[\"ckebmbmaycbrqbnot866fk7ij7y\",\"cikexdprbgb8ouynr5fmyimugwo\",\"ctyi7g1r847rfteynz1fjqk8hmr\",\"cix88w1wqzjfb8gccg6ajrsr5th\",\"cbb5bnkayt3d8fdagwyexka6y5a\",\"cz8p8gofakfby8kzz83j97db8ph\",\"ce1jm5q5i54enhuu4h3kkay1hcc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"sum\"},\"columnWidths\":{\"2a5da320-735c-4093-8787-f56e15cdfeed\":196,\"__title\":280,\"a8daz81s4xjgke1ww6cwik5w7ye\":139,\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":141,\"d3d682bf-e074-49d9-8df5-7320921c2d23\":110},\"defaultTemplateId\":\"czw9es1e89fdpjr7cqptr1xq7qh\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"2a5da320-735c-4093-8787-f56e15cdfeed\",\"a3zsw7xs8sxy7atj8b6totp3mby\",\"axkhqa4jxr3jcqe4k87g8bhmary\",\"a7gdnz8ff8iyuqmzddjgmgo9ery\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675955588475,1675955588475,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('vfi944y169jruzmnmm896fhzgia','2023-02-09 15:13:11.218197','',1,'view','Market Position','{\"cardOrder\":[\"cip8b4jcomfr7by9gtizebikfke\",\"cacs91js1hb887ds41r6dwnd88c\",\"ca3u8edwrof89i8obxffnz4xw3a\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"arfjpz9by5car71tz3behba8yih\",\"abajmr34b8g1916w495xjb35iko\",\"abt79uxg5edqojsrrefcnr4eruo\",\"aipf3qfgjtkheiayjuxrxbpk9wa\"],\"visiblePropertyIds\":[]}',1675955591215,1675955591215,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('vfqczcm7ymfbd9c9iz7ba881zxc','2023-02-09 15:13:09.725387','bm4ubx56krp4zwyfcqh7nxiigbr',1,'view','Departments','{\"cardOrder\":[\"cpa534b5natgmunis8u1ixb55pw\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"azzbawji5bksj69sekcs4srm1ky\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aw5i7hmpadn6mbwbz955ubarhme\",\"afkxpcjqjypu7hhar7banxau91h\",\"aehoa17cz18rqnrf75g7dwhphpr\",\"agrfeaoj7d8p5ianw5iaf3191ae\",\"agm9p6gcq15ueuzqq3wd4be39wy\",\"aucop7kw6xwodcix6zzojhxih6r\",\"afust91f3g8ht368mkn5x9tgf1o\",\"acocxxwjurud1jixhp7nowdig7y\"],\"visiblePropertyIds\":[]}',1675955589723,1675955589723,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('vg6e9p4w7j7dr8r35dzd3p85auw','2023-02-09 15:13:10.234390','bgi1yqiis8t8xdqxgnet8ebutky',1,'view','By Type','{\"cardOrder\":[\"cmz9qxykqgpdyxf9j5axmwejt1e\",\"cstu6h6hfcfd59yc4qwd4pd3i4o\",\"cw85ce7jszt8ufcdo44ay1buega\",\"cg46r9od7rf8ipr5139ydfieu8y\",\"cf84s7zu18jbeud54uwzam8qwpo\",\"czf1skn1natn3ppzqqqf5kc3bgr\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"a5yxq8rbubrpnoommfwqmty138h\",\"apht1nt5ryukdmxkh6fkfn6rgoy\",\"aiycbuo3dr5k4xxbfr7coem8ono\",\"aomnawq4551cbbzha9gxnmb3z5w\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955590232,1675955590232,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('virhpci4t33b5jmod5hzrm4ek1y','2023-02-09 15:13:11.600686','brs9cdimfw7fodyi7erqt747rhc',1,'view','Content List','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":322,\"ab6mbock6styfe6htf815ph1mhw\":229,\"aysx3atqexotgwp5kx6h5i5ancw\":208},\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"a39x5cybshwrbjpc3juaakcyj6e\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"ae9ar615xoknd8hw8py7mbyr7zo\",\"aysx3atqexotgwp5kx6h5i5ancw\",\"ab6mbock6styfe6htf815ph1mhw\",\"ao44fz8nf6z6tuj1x31t9yyehcc\",\"a39x5cybshwrbjpc3juaakcyj6e\",\"agqsoiipowmnu9rdwxm57zrehtr\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\"]}',1675955591598,1675955591598,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('vj9uzmfjx5fyeipoi1mw7joeg7c','2023-02-09 15:13:13.411479','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Gallery View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"gallery\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955593409,1675955593409,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('vkfjmbgofn3rg5f33ogo7p874iy','2023-02-09 15:13:09.942384','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','By Status','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"77c539af-309c-4db1-8329-d20ef7e9eacd\",\"98bdea27-0cce-4cde-8dc6-212add36e63a\",\"\"],\"visiblePropertyIds\":[\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\"]}',1675955589940,1675955589939,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('vkujgf83juinnxxwmyschb63cye','2023-02-09 15:13:09.621925','',1,'view','By Objectives','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":387,\"a17ryhi1jfsboxkwkztwawhmsxe\":134,\"a6amddgmrzakw66cidqzgk6p4ge\":183,\"aqxyzkdrs4egqf7yk866ixkaojc\":100},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a6amddgmrzakw66cidqzgk6p4ge\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a6amddgmrzakw66cidqzgk6p4ge\",\"a17ryhi1jfsboxkwkztwawhmsxe\",\"azzbawji5bksj69sekcs4srm1ky\",\"adp5ft3kgz7r5iqq3tnwg551der\",\"aqxyzkdrs4egqf7yk866ixkaojc\",\"adu6mebzpibq6mgcswk69xxmnqe\",\"asope3bddhm4gpsng5cfu4hf6rh\",\"ajwxp866f9obs1kutfwaa5ru7fe\",\"azqnyswk6s1boiwuthscm78qwuo\",\"ahz3fmjnaguec8hce7xq3h5cjdr\",\"a17bfcgnzmkwhziwa4tr38kiw5r\"]}',1675955589619,1675955589619,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('vmn5bn4kbyb8tjm5aqy3pe9hgeo','2023-02-09 15:13:09.954472','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"ajy6xbebzopojaenbnmfpgtdwso\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955589952,1675955589952,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('vmtpxaeb1gbdgjpu68n93nu41ow','2023-02-09 15:13:10.091673','',1,'view','By Sprint','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{\"ai7ajsdk14w7x5s8up3dwir77te\":\"count\"},\"columnWidths\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":128,\"50117d52-bcc7-4750-82aa-831a351c44a0\":126,\"__title\":280,\"a1g6i613dpe9oryeo71ex3c86hy\":159,\"aeomttrbhhsi8bph31jn84sto6h\":141,\"ax9f8so418s6s65hi5ympd93i6a\":183,\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":100},\"defaultTemplateId\":\"ccxzm5dsu6tbbtyhgg31f4sec9y\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"60985f46-3e41-486e-8213-2b987440ea1c\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"aphg37f7zbpuc3bhwhp19s1ribh\",\"a4378omyhmgj3bex13sj4wbpfiy\",\"ai7ajsdk14w7x5s8up3dwir77te\",\"a1g6i613dpe9oryeo71ex3c86hy\",\"aeomttrbhhsi8bph31jn84sto6h\",\"ax9f8so418s6s65hi5ympd93i6a\"]}',1675955590089,1675955590089,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('vnn1xpem7djbqmcq9aa3gc8fube','2023-02-09 15:13:10.870208','',1,'view','All Users','{\"cardOrder\":[\"c3fdqgj8ut3r1iy8ugnsae7ncqy\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280,\"aaebj5fyx493eezx6ukxiwydgty\":146,\"acjq4t5ymytu8x1f68wkggm7ypc\":222,\"akrxgi7p7w14fym3gbynb98t9fh\":131,\"atg9qu6oe4bjm8jczzsn71ff5me\":131},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"akrxgi7p7w14fym3gbynb98t9fh\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"aaebj5fyx493eezx6ukxiwydgty\",\"akrxgi7p7w14fym3gbynb98t9fh\",\"atg9qu6oe4bjm8jczzsn71ff5me\",\"acjq4t5ymytu8x1f68wkggm7ypc\",\"aphio1s5gkmpdbwoxynim7acw3e\",\"aqafzdeekpyncwz7m7i54q3iqqy\",\"aify3r761b9w43bqjtskrzi68tr\"]}',1675955590867,1675955590867,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('vpdqi5ouj8pf9jd8pipkdrbxfqe','2023-02-09 15:13:13.388197','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Table View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280,\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":100,\"acypkejeb5yfujhj9te57p9kaxw\":169},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"aqh13jabwexjkzr3jqsz1i1syew\",\"acmg7mz1rr1eykfug4hcdpb1y1o\",\"acypkejeb5yfujhj9te57p9kaxw\"]}',1675955593386,1675955593386,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('vr5bbbdog178jiratog6dmkro6o','2023-02-09 15:13:12.044994','bjbhs6bos3m8zjouf78xceg9nqw',1,'view','Board view','{\"cardOrder\":[\"cniwb8xwcqtbstbcm3sdfrr854h\",\"cs4qwpzr65fgttd7364dicskanh\",\"c9s78pzbdg3g4jkcdjqahtnfejc\",\"c8utmazns878jtfgtf7exyi9pee\",\"cnobejmb6bf8e3c1w7em5z4pwyh\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aok6pgecm85qe9k5kcphzoe63ma\",\"aq1dwbf661yx337hjcd5q3sbxwa\",\"ar87yh5xmsswqkxmjq1ipfftfpc\",\"akj3fkmxq7idma55mdt8sqpumyw\"],\"visiblePropertyIds\":[\"aspaay76a5wrnuhtqgm97tt3rer\"]}',1675955592042,1675955592042,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('vs6wusogf5ifa98izii58yfqajc','2023-02-09 15:13:10.222626','bgi1yqiis8t8xdqxgnet8ebutky',1,'view','By Status','{\"cardOrder\":[\"cf84s7zu18jbeud54uwzam8qwpo\",\"cg46r9od7rf8ipr5139ydfieu8y\",\"cstu6h6hfcfd59yc4qwd4pd3i4o\",\"cmz9qxykqgpdyxf9j5axmwejt1e\",\"cw85ce7jszt8ufcdo44ay1buega\",\"czf1skn1natn3ppzqqqf5kc3bgr\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"abrfos7e7eczk9rqw6y5abadm1y\",\"ax8wzbka5ahs3zziji3pp4qp9mc\",\"atabdfbdmjh83136d5e5oysxybw\",\"ace1bzypd586kkyhcht5qqd9eca\",\"aay656c9m1hzwxc9ch5ftymh3nw\",\"a6ghze4iy441qhsh3eijnc8hwze\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955590220,1675955590220,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('vsia7491953rhipmna3hncuwhhe','2023-02-09 15:13:11.578372','brs9cdimfw7fodyi7erqt747rhc',1,'view','Due Date Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a39x5cybshwrbjpc3juaakcyj6e\",\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955591576,1675955591576,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('vsjtpwuqmsfbnjyupeix33thaie','2023-02-09 15:13:11.205800','',1,'view','Competitor List','{\"cardOrder\":[\"cu91ugd56rirqxyupgjwozoi7tr\",\"c8q4rsku8htd7tnntzrxhpqn5ha\",\"c6d843tks8fdc9gx7orr6odcdww\",\"cp8xyhyy85tgq3c6jgqmhdz3ree\",\"cyhm5hrnra781bpeatqyygemgah\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":210,\"a1semdhszu1rq17d7et5ydrqqio\":121,\"aapogff3xoa8ym7xf56s87kysda\":194,\"ahzspe59iux8wigra8bg6cg18nc\":156,\"aiefo7nh9jwisn8b4cgakowithy\":155,\"aozntq4go4nkab688j1s7stqtfc\":151,\"az3jkw3ynd3mqmart7edypey15e\":145},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"ahzspe59iux8wigra8bg6cg18nc\",\"aozntq4go4nkab688j1s7stqtfc\",\"aiefo7nh9jwisn8b4cgakowithy\",\"a6cwaq79b1pdpb97wkanmeyy4er\",\"an1eerzscfxn6awdfajbg41uz3h\",\"a1semdhszu1rq17d7et5ydrqqio\",\"aapogff3xoa8ym7xf56s87kysda\",\"az3jkw3ynd3mqmart7edypey15e\"]}',1675955591198,1675955591198,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('vsk43fmmf8fdqpmae9krzeqbkfh','2023-02-09 15:13:09.966185','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','By Date','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d6b1249b-bc18-45fc-889e-bec48fce80ef\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"9a090e33-b110-4268-8909-132c5002c90e\",\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"6e7139e4-5358-46bb-8c01-7b029a57b80a\",\"d5371c63-66bf-4468-8738-c4dc4bea4843\",\"\"],\"visiblePropertyIds\":[\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\"]}',1675955589963,1675955589963,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('vtpir6o7cwirutytyubxbjbhsyr','2023-02-09 15:13:12.363923','bui5izho7dtn77xg3thkiqprc9r',1,'view','Board: Sprints','{\"cardOrder\":[\"cemryxdyma7r9pek7nrua5mkcga\",\"cqangpbz5c3rpfefzdbe4totwnc\",\"chnnww5gm138xjpobgmcnbqyspw\",\"c1gnbat9p3tnzfec18bf6agbhgh\",\"cf75w38ufx7nmukby5irgojbskw\",\"c1kwdjzwqsfygxe5yk53y8krkoc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"60985f46-3e41-486e-8213-2b987440ea1c\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955592361,1675955592361,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('vuknrkuosafnutmfe6m8qupg1ko','2023-02-09 15:13:08.454780','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Project Priorities','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{\"\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"87f59784-b859-4c24-8ebe-17c766e081dd\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"98a57627-0f76-471d-850d-91f3ed9fd213\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"}},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\",\"87f59784-b859-4c24-8ebe-17c766e081dd\",\"98a57627-0f76-471d-850d-91f3ed9fd213\",\"\"],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675955588452,1675955588452,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('vx6unz5rpt7ro8d7i15tuaearuo','2023-02-09 15:13:12.405352','bui5izho7dtn77xg3thkiqprc9r',1,'view','List: Bugs ?','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"50117d52-bcc7-4750-82aa-831a351c44a0\":145,\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"values\":[\"1fdbb515-edd2-4af5-80fc-437ed2211a49\"]}],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955592402,1675955592402,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('vxsyothtu7b853k7wfchadn796h','2023-02-09 15:13:04.666998','bzwb99zf498tsm7mjqbiy7g81ze',1,'view','Open Deals','{\"cardOrder\":[\"cb86yg4ppqbgrdktqg8hg3koqjh\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"a5hwxjsmkn6bak6r7uea5bx1kwc\",\"values\":[\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"aic89a5xox4wbppi6mbyx6ujsda\",\"ah6ehh43rwj88jy4awensin8pcw\",\"aprhd96zwi34o9cs4xyr3o9sf3c\",\"axesd74yuxtbmw1sbk8ufax7z3a\"]}],\"operation\":\"and\"},\"groupById\":\"aro91wme9kfaie5ceu9qasmtcnw\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"apjnaggwixchfxwiatfh7ey7uno\",\"apiswzj7uiwbh87z8dw8c6mturw\",\"auu9bfzqeuruyjwzzqgz7q8apuw\",\"\"],\"visiblePropertyIds\":[]}',1675955584664,1675955584664,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('vy1bwj755m7nrfj17xxuqmoxjra','2023-02-09 15:13:11.589418','brs9cdimfw7fodyi7erqt747rhc',1,'view','Publication Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"agqsoiipowmnu9rdwxm57zrehtr\",\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955591587,1675955591587,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('vy7u56x8a5fyhbgznucuq9kxzdh','2023-02-09 15:13:06.966474','bbn1888mprfrm5fjw9f1je9x3xo',1,'view','Board View','{\"cardOrder\":[\"c9mgm3h9mwpnr5mkpqfdiad33cw\",\"cfxrcmsqwtb8ejdae9pcenmh9mw\",\"cnogc7s1x13bgmjz456dudb85py\",\"crmtkd3pua38h5ysmxcjr5hw88o\",\"czowhma7rnpgb3eczbqo3t7fijo\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a9zf59u8x1rf4ywctpcqama7tio\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"an51dnkenmoog9cetapbc4uyt3y\",\"afpy8s7i45frggprmfsqngsocqh\",\"aj4jyekqqssatjcq7r7chmy19ey\",\"\"],\"visiblePropertyIds\":[\"a9zf59u8x1rf4ywctpcqama7tio\"]}',1675955586964,1675955586964,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('vykn1q9i3y3dx7ch7stu9re5xbc','2023-02-09 15:13:06.954177','bbn1888mprfrm5fjw9f1je9x3xo',1,'view','List View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a9zf59u8x1rf4ywctpcqama7tio\",\"abthng7baedhhtrwsdodeuincqy\"]}',1675955586951,1675955586951,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('vykxx6xdmj785ubitzjrakam7ee','2023-02-09 15:13:12.377676','bui5izho7dtn77xg3thkiqprc9r',1,'view','List: Tasks ?','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"50117d52-bcc7-4750-82aa-831a351c44a0\":139,\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"values\":[\"6eea96c9-4c61-4968-8554-4b7537e8f748\"]}],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"reversed\":true}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955592374,1675955592374,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('vzmw9hne6iprtpbw4uuu1adqdka','2023-02-09 15:13:09.610360','',1,'view','By Quarter','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":452,\"a17ryhi1jfsboxkwkztwawhmsxe\":148,\"a6amddgmrzakw66cidqzgk6p4ge\":230,\"azzbawji5bksj69sekcs4srm1ky\":142},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"aqxyzkdrs4egqf7yk866ixkaojc\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a6amddgmrzakw66cidqzgk6p4ge\",\"a17ryhi1jfsboxkwkztwawhmsxe\",\"azzbawji5bksj69sekcs4srm1ky\",\"adp5ft3kgz7r5iqq3tnwg551der\",\"aqxyzkdrs4egqf7yk866ixkaojc\",\"adu6mebzpibq6mgcswk69xxmnqe\",\"asope3bddhm4gpsng5cfu4hf6rh\",\"ajwxp866f9obs1kutfwaa5ru7fe\",\"azqnyswk6s1boiwuthscm78qwuo\",\"ahz3fmjnaguec8hce7xq3h5cjdr\",\"a17bfcgnzmkwhziwa4tr38kiw5r\"]}',1675955589608,1675955589608,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy');
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
INSERT INTO `focalboard_blocks_history` VALUES ('711sojjc1sbbqxgpjoujp18doua','2023-02-09 15:13:13.464892','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Create and manage checklists, like this one... :)','{\"value\":false}',1675955593459,1675955593459,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('713gcs33jf3bpzgk9pfb3xkqcrw','2023-02-09 15:13:08.866511','cikexdprbgb8ouynr5fmyimugwo',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588860,1675955588860,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('716g47bgjq3fubxkq8ei4sdoxer','2023-02-09 15:13:04.856852','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Send initial email','{\"value\":true}',1675955584849,1675955584849,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('719rhgqi9otgk8dpj3sibdwes9h','2023-02-09 15:13:08.554830','ctyi7g1r847rfteynz1fjqk8hmr',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588550,1675955588550,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('71iqhnfbqmfdei8rwfbjo8u3kor','2023-02-09 15:13:05.587934','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675955585582,1675955585582,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('736qmhr68utre8dutm1twinejth','2023-02-09 15:13:05.394519','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675955585388,1675955585388,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('73c8tujmzdjywtqz8ff6akofquw','2023-02-09 15:13:10.263248','cg46r9od7rf8ipr5139ydfieu8y',1,'image','','{\"fileId\":\"7tmfu5iqju3n1mdfwi5gru89qmw.png\"}',1675955590257,1675955590257,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('73fxjs7dmjjnixx3yb83d5bxf3e','2023-02-09 15:13:04.986622','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Send follow-up email','{\"value\":true}',1675955584980,1675955584980,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('73gdtsfdeebr8dyfmrwc1o73f9y','2023-02-09 15:13:05.418523','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Send proposal','{}',1675955585413,1675955585413,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('73hp6ecz38in6z8u19qcb3asrkw','2023-02-09 15:13:08.516894','ctyi7g1r847rfteynz1fjqk8hmr',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588510,1675955588510,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('73k1zgokp5tn1fyxjuhapq4464h','2023-02-09 15:13:13.784605','cn3cj63de9t81jdceapfgdtqhcy',1,'image','','{\"fileId\":\"74nt9eqzea3ydjjpgjtsxcjgrxc.gif\"}',1675955593779,1675955593779,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('73kmx8c9hhj8ubyif78mbbgdy1w','2023-02-09 15:13:04.724663','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Finalize contract','{}',1675955584716,1675955584716,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('746wb7e7yejywmcd7ty5szxzhay','2023-02-09 15:13:07.097342','cnogc7s1x13bgmjz456dudb85py',1,'image','','{\"fileId\":\"76fwrj36hptg6dywka4k5mt3sph.png\"}',1675955587091,1675955587091,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('74873uaoxs3fm3eg14qyw38m7ah','2023-02-09 15:13:04.958886','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Schedule demo','{\"value\":true}',1675955584952,1675955584952,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('74hgakzty8tgoirg7qd4ktkh3iw','2023-02-09 15:13:07.062930','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Bananas','{\"value\":false}',1675955587057,1675955587057,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('74krinybrui8z9rgw5tg71zwkjo','2023-02-09 15:13:06.984559','cfxrcmsqwtb8ejdae9pcenmh9mw',1,'checkbox','Utilities','{\"value\":true}',1675955586979,1675955586979,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('74nkkz6zcgjrmffrb81edxjszke','2023-02-09 15:13:06.995065','cfxrcmsqwtb8ejdae9pcenmh9mw',1,'checkbox','Mobile phone','{\"value\":true}',1675955586989,1675955586989,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('74qqg3xc8xt8n3b5c9jxrzf9zwc','2023-02-09 15:13:10.388275','chqd96dxi7jf3me4zd3c8na77ua',1,'image','','{\"fileId\":\"7tmfu5iqju3n1mdfwi5gru89qmw.png\"}',1675955590377,1675955590376,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('756mt37fhs388xk4194p3apjwhr','2023-02-09 15:13:05.477347','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Hand-off to customer success','{}',1675955585471,1675955585471,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('75m4ipoxsuibdxgf6z6cbxio4zh','2023-02-09 15:13:03.998288','ceutpudw3u38spenb7t395wup3o',1,'checkbox','','{\"value\":false}',1675955583990,1675955583990,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('75rrqrsp6fifb8gx4g6jwsr6o8a','2023-02-09 15:13:05.257011','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Hand-off to customer success','{}',1675955585250,1675955585250,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('75yipdr6tgireprzzk9yk5866nc','2023-02-09 15:13:08.622573','ckebmbmaycbrqbnot866fk7ij7y',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588617,1675955588617,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('75zzaedht4ffffr4kw11d98zidr','2023-02-09 15:13:05.493792','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Follow up after demo','{}',1675955585483,1675955585483,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('763nbftujuine8x6tuxwkboqbsa','2023-02-09 15:13:13.502269','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Set priorities and update statuses','{\"value\":false}',1675955593496,1675955593496,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7686cyfw5wpd8mc7exp6wmsnt8y','2023-02-09 15:13:05.061139','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Send follow-up email','{\"value\":true}',1675955585052,1675955585052,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('76fcdksyhjiyazkbdsncjazymzy','2023-02-09 15:13:05.465581','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Schedule demo','{\"value\":false}',1675955585459,1675955585459,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('76feihzqhofn6tc8kdsn3gsutjy','2023-02-09 15:13:08.504831','ctyi7g1r847rfteynz1fjqk8hmr',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588499,1675955588499,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('76j9579bkobdx9yffs8c36ajzto','2023-02-09 15:13:08.785375','cix88w1wqzjfb8gccg6ajrsr5th',1,'checkbox','...','{\"value\":false}',1675955588779,1675955588779,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('76m5biapsn3b9tyzmns3187bacy','2023-02-09 15:13:12.493779','cfefgwjke6bbxpjpig618g9bpte',1,'image','','{\"fileId\":\"7pbp4qg415pbstc6enzeicnu3qh.png\"}',1675955592486,1675955592486,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('773t4jpidzpftificz9umr1jioc','2023-02-09 15:13:07.018019','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Cereal','{\"value\":false}',1675955587012,1675955587012,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('775k5efyyciy6bqtze1rpog6xzh','2023-02-09 15:13:03.645073','c5r5txf1pzir358gmkeesntg8aw',1,'checkbox','','{\"value\":false}',1675955583639,1675955583639,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('779wdqq3wop86tet8akjqpqmrqa','2023-02-09 15:13:03.838566','cnq9ritr7t7nomyupipc9j7dbde',1,'checkbox','','{\"value\":false}',1675955583832,1675955583832,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('77o8djgrjftyoi8incgsp34d3xo','2023-02-09 15:13:03.825629','cnq9ritr7t7nomyupipc9j7dbde',1,'checkbox','','{\"value\":false}',1675955583819,1675955583818,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('77teehuznqigd7ftbyqpys3m46y','2023-02-09 15:13:08.747926','cix88w1wqzjfb8gccg6ajrsr5th',1,'divider','','{}',1675955588742,1675955588742,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('785ddmgjn5ff9typdnbjk9ibszo','2023-02-09 15:13:05.333538','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675955585327,1675955585327,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('78dxu6pcsefn33ru83dob8o4e4h','2023-02-09 15:13:13.667606','canoq7x74h7nt3yppsi18j496rc',1,'image','','{\"fileId\":\"7ek6wbpp19jfoujs1goh6kttbby.gif\"}',1675955593661,1675955593661,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('78gu3eap8diyk3q98psfyfg43yw','2023-02-09 15:13:13.595898','cnzbty5iahbdh9nf4p6ng1mnfxh',1,'image','','{\"fileId\":\"7knxbyuiedtdafcgmropgkrtybr.gif\"}',1675955593590,1675955593590,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('78ieu8wcdgintpcso3xxgbn6zto','2023-02-09 15:13:05.610796','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Follow up after demo','{}',1675955585605,1675955585605,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('78mh743bik3g1temrf9qmz78n7a','2023-02-09 15:13:08.877217','cikexdprbgb8ouynr5fmyimugwo',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588871,1675955588871,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('78qmgw8zchi8cbq9sq7zsd4isje','2023-02-09 15:13:05.751987','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Post-sales follow up','{}',1675955585746,1675955585746,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('798udjmxe8fnrxm41sgnctmotpa','2023-02-09 15:13:05.541513','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send initial email','{\"value\":false}',1675955585535,1675955585535,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('79icsf954fi81bqybb4xjr6bgmc','2023-02-09 15:13:04.782742','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Follow up after demo','{\"value\":true}',1675955584775,1675955584775,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('79onrnkio4jn9ipmgwk1pfz1eze','2023-02-09 15:13:04.709782','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Send proposal','{\"value\":true}',1675955584704,1675955584704,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('79pbspduwjjdwtfeh9m9htaqszr','2023-02-09 15:13:08.774050','cix88w1wqzjfb8gccg6ajrsr5th',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588768,1675955588768,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('79tzorr1j3if45qtmqeu64ow4dc','2023-02-09 15:13:04.738599','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675955584732,1675955584732,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('79ziahugmrtf5bqzjx5whjdxf8y','2023-02-09 15:13:05.739996','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675955585734,1675955585734,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7abtt31h8ojfstkz3uzxejgcq9e','2023-02-09 15:13:04.011284','ceutpudw3u38spenb7t395wup3o',1,'checkbox','','{\"value\":false}',1675955584005,1675955584005,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7aodxtmcjzbrh9et9bu17dwsf6h','2023-02-09 15:13:13.713129','c68ftccp7c3r69bhh5s9p6jxycy',1,'image','','{\"fileId\":\"7dybb6t8fj3nrdft7nerhuf784y.png\"}',1675955593707,1675955593707,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7at5hq148mfd1ueddegye8p3gsc','2023-02-09 15:13:08.530168','ctyi7g1r847rfteynz1fjqk8hmr',1,'divider','','{}',1675955588523,1675955588523,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7at63jg3h6fn1pqod4bngs1tpja','2023-02-09 15:13:05.346263','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Finalize contract','{}',1675955585340,1675955585340,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7bdt8wqxs4pguzpfz9iyxm3z9qc','2023-02-09 15:13:08.922634','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588917,1675955588917,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7cagjjmx9cirh5byccbcd4m566h','2023-02-09 15:13:05.667505','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Send proposal','{}',1675955585662,1675955585662,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7cg6kk14tapf7mxuh899fhqu1gr','2023-02-09 15:13:04.697026','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Send follow-up email','{\"value\":true}',1675955584690,1675955584690,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7cppnqstxdpgkzp4qicsct7r6kh','2023-02-09 15:13:05.309273','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675955585303,1675955585302,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7cxmaainfm7ycbka93uunsqabmy','2023-02-09 15:13:05.430012','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Finalize contract','{}',1675955585424,1675955585424,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7d4ruh7yf9jdipmu1njqqix6kua','2023-02-09 15:13:08.911025','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588905,1675955588905,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7daynwntzrtfd7muqo8ow9jhh3e','2023-02-09 15:13:08.600763','ckebmbmaycbrqbnot866fk7ij7y',1,'checkbox','...','{\"value\":false}',1675955588595,1675955588595,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7dbyebx37iiyomxe69okrps9uma','2023-02-09 15:13:07.074191','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Eggs','{\"value\":false}',1675955587068,1675955587068,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('7dc54s483qfyedkndrbu5gtiuao','2023-02-09 15:13:13.735606','cd8rx6nwwe38u3eebjefozn3xse',1,'image','','{\"fileId\":\"78jws5m1myf8pufewzkaa6i11sc.gif\"}',1675955593730,1675955593730,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7de64km5zwjdrmx33wjeh38fk4h','2023-02-09 15:13:05.406872','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675955585400,1675955585400,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7ditit61ok3813rxkhhr1bqcz3o','2023-02-09 15:13:05.113873','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675955585105,1675955585105,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7dnwzbk6wxb8hzyxcrkbj5y5jsc','2023-02-09 15:13:05.774918','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Send follow-up email','{\"value\":false}',1675955585769,1675955585769,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7dp4n86puk7bst8c5nordyozbxr','2023-02-09 15:13:05.283449','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Schedule demo','{\"value\":true}',1675955585277,1675955585277,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7efsjhctpz7bqifds3q6fkwnfzh','2023-02-09 15:13:05.078659','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Send proposal','{\"value\":true}',1675955585069,1675955585069,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7egqqgyaxmbyhic4nzm8we6k4fy','2023-02-09 15:13:05.633562','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule demo','{\"value\":false}',1675955585628,1675955585628,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7eiph4pj85pnpjkf9n7osnbzw4o','2023-02-09 15:13:04.751280','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Schedule demo','{\"value\":true}',1675955584744,1675955584744,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7ejmo388ff784zmbjqa6m1x6txr','2023-02-09 15:13:05.453801','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Send follow-up email','{\"value\":false}',1675955585448,1675955585448,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7ewhu5gutpbde5y5stwjxticsia','2023-02-09 15:13:08.667151','cbb5bnkayt3d8fdagwyexka6y5a',1,'checkbox','...','{\"value\":false}',1675955588662,1675955588662,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7f7ngti4wutyb7pqogsuqy7a1xo','2023-02-09 15:13:05.442039','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Post-sales follow up','{}',1675955585435,1675955585435,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7fknjncjw978kzjmsau1j6wxftw','2023-02-09 15:13:08.832021','cikexdprbgb8ouynr5fmyimugwo',1,'checkbox','...','{\"value\":false}',1675955588826,1675955588826,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7fn1t4d8qqbn4mmgppyq19ioh4o','2023-02-09 15:13:05.728463','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Schedule demo','{\"value\":false}',1675955585722,1675955585722,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7fskgnngriig4mmzps38rb5od6r','2023-02-09 15:13:03.918568','chdoctirc6ig39nbq17xhhgsdew',1,'divider','','{}',1675955583912,1675955583912,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7fx18ayomnjgibjqxjnht6djajr','2023-02-09 15:13:08.701575','cbb5bnkayt3d8fdagwyexka6y5a',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588695,1675955588695,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7gbhpcbahobrs9bb7985rb5rnje','2023-02-09 15:13:03.931849','chdoctirc6ig39nbq17xhhgsdew',1,'checkbox','','{\"value\":false}',1675955583925,1675955583925,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7go8ujqeusjgbmg7bgynkbm343r','2023-02-09 15:13:08.544000','ctyi7g1r847rfteynz1fjqk8hmr',1,'checkbox','...','{\"value\":false}',1675955588537,1675955588537,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7gw8c51de83ns8fpbuof8zwhb6e','2023-02-09 15:13:12.597080','c1gnbat9p3tnzfec18bf6agbhgh',1,'image','','{\"fileId\":\"7pbp4qg415pbstc6enzeicnu3qh.png\"}',1675955592590,1675955592590,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('7gzup5jwux3nu3qg81q38u4fiec','2023-02-09 15:13:04.765400','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Hand-off to customer success','{}',1675955584758,1675955584757,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7h46ajuoirjfs5cpegnu8g17pew','2023-02-09 15:13:07.028679','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Butter','{\"value\":false}',1675955587023,1675955587023,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('7h9b4z35aypn95bozwd9nxxaujh','2023-02-09 15:13:03.674013','c5r5txf1pzir358gmkeesntg8aw',1,'divider','','{}',1675955583666,1675955583666,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7hasspemw6fftdj5n7rtgu73kme','2023-02-09 15:13:04.946483','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Post-sales follow up','{}',1675955584939,1675955584939,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7hxggh6364iy6tmgdsbzms4w5ch','2023-02-09 15:13:03.811794','cnq9ritr7t7nomyupipc9j7dbde',1,'divider','','{}',1675955583804,1675955583804,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7i986n3un6t8kmet7t7g8ax1h8r','2023-02-09 15:13:04.901227','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Send proposal','{\"value\":true}',1675955584893,1675955584893,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7ijfsqoy7mbnttp5gtj9qszbkje','2023-02-09 15:13:13.629772','coi789ctpa3n5bpqsgc1jcswqso',1,'image','','{\"fileId\":\"7iw4rxx7jj7bypmdotd9z469cyh.png\"}',1675955593624,1675955593624,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7ioxhuh3pyfn69f7ifmurqkns6w','2023-02-09 15:13:13.538051','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Manage deadlines and milestones','{\"value\":false}',1675955593532,1675955593532,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7jck4rzdb3jfzmpbn6nofzdtzyy','2023-02-09 15:13:05.045714','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Send initial email','{\"value\":true}',1675955585037,1675955585037,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7jig9pq89wpd3frhnqqxhzey9zr','2023-02-09 15:13:08.934699','czw9es1e89fdpjr7cqptr1xq7qh',1,'divider','','{}',1675955588928,1675955588928,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7k1rumqtdqbbsmxzmw7p1juk4ur','2023-02-09 15:13:04.918038','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Hand-off to customer success','{}',1675955584910,1675955584910,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7kbs6muxmibymjenhatf9fycyse','2023-02-09 15:13:08.761941','cix88w1wqzjfb8gccg6ajrsr5th',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588753,1675955588753,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7kgijm6giob86pnekppcu6as7se','2023-02-09 15:13:13.453722','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Assign tasks to teammates','{\"value\":false}',1675955593448,1675955593447,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7kkm8rm5je7dtdyaixwff5zz1ac','2023-02-09 15:13:03.686983','c5r5txf1pzir358gmkeesntg8aw',1,'checkbox','','{\"value\":false}',1675955583680,1675955583680,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7kqqcb35odpyrum4f79za68t34a','2023-02-09 15:13:05.270021','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Follow up after demo','{}',1675955585263,1675955585263,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7m4mrkfifhbyrtch3erzptz97fr','2023-02-09 15:13:04.683917','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Send initial email','{\"value\":true}',1675955584677,1675955584677,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7m69x9dxeybf5meb9mewzz46awy','2023-02-09 15:13:05.321183','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Send follow-up email','{\"value\":true}',1675955585315,1675955585315,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7maefej36gt8pt85twg464jtu1o','2023-02-09 15:13:05.130391','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675955585122,1675955585122,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7mdjhtadx97bnjf5tretp4gwogy','2023-02-09 15:13:13.761303','c3zsx74nrcpys8g3r5xfgknthmr',1,'image','','{\"fileId\":\"7d6hrtig3zt8f9cnbo1um5oxx3y.gif\"}',1675955593753,1675955593753,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7mpepf7wxobbidpyxi9ijubzhrc','2023-02-09 15:13:03.851217','cnq9ritr7t7nomyupipc9j7dbde',1,'checkbox','','{\"value\":false}',1675955583844,1675955583844,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7n3yebdqpefyd8ynfkh66uafgch','2023-02-09 15:13:03.659097','c5r5txf1pzir358gmkeesntg8aw',1,'checkbox','','{\"value\":false}',1675955583652,1675955583652,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7n5i7e8ntppryzkiyr85rthn4ec','2023-02-09 15:13:05.244416','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Send proposal','{}',1675955585238,1675955585238,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7n6oeu3cbybys9keo9rzd4aht7a','2023-02-09 15:13:05.622458','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Schedule initial sales call','{\"value\":false}',1675955585616,1675955585616,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7n7s9k18nejgg5ktfcuiyip5m5r','2023-02-09 15:13:05.382008','cagbcg7m38jydjqx1cx34pg3mzr',1,'checkbox','Send initial email','{\"value\":false}',1675955585376,1675955585376,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7njhr916g83bp8c8eajpcmyyxpw','2023-02-09 15:13:13.489848','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Follow cards to get notified on the latest updates','{\"value\":false}',1675955593482,1675955593482,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7nqdnhrm863g1ixwhzxjsuhm5bw','2023-02-09 15:13:03.729537','ch798q5ucefyobf5bymgqjt4f3h',1,'divider','','{}',1675955583722,1675955583722,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7nqfotfzk33rc9nkmqomrfkd6ue','2023-02-09 15:13:03.891372','chdoctirc6ig39nbq17xhhgsdew',1,'checkbox','','{\"value\":false}',1675955583885,1675955583884,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7nu7wk7cem78ypk7tcime36ghpc','2023-02-09 15:13:08.843624','cikexdprbgb8ouynr5fmyimugwo',1,'checkbox','[Subtask 3]','{\"value\":false}',1675955588838,1675955588838,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7nzy654n9rj8kjyzocsxswc4rwr','2023-02-09 15:13:05.704632','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Finalize contract','{}',1675955585698,1675955585698,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7oe98455wh7drtbrxkkuj3hqr3e','2023-02-09 15:13:03.971093','ceutpudw3u38spenb7t395wup3o',1,'divider','','{}',1675955583964,1675955583964,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7ojbrfnqjofnmtx7tzbo96xrowr','2023-02-09 15:13:05.096590','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Finalize contract','{\"value\":true}',1675955585088,1675955585088,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7oryzjiozefnozf4eipqqgf131y','2023-02-09 15:13:13.514577','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Provide feedback and ask questions via comments','{\"value\":false}',1675955593508,1675955593508,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7owb1aajjdi8e8mwqq3d11dgama','2023-02-09 15:13:04.871223','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675955584863,1675955584863,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7p1e6xnjebtyztqxe65p4bie77o','2023-02-09 15:13:05.145322','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Schedule demo','{\"value\":true}',1675955585138,1675955585137,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7p8qyw935rjnstqxmcofm79q44o','2023-02-09 15:13:13.476229','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','Add and update descriptions with Markdown','{\"value\":false}',1675955593470,1675955593470,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7pb4fjz39uiraxqqz764s9qnkza','2023-02-09 15:13:08.713196','cbb5bnkayt3d8fdagwyexka6y5a',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588707,1675955588707,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7pdzn5d5xjjy33juafyfrus9are','2023-02-09 15:13:03.905555','chdoctirc6ig39nbq17xhhgsdew',1,'checkbox','','{\"value\":false}',1675955583898,1675955583898,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7psm9uth8h7gfmetjg6tjoaat3y','2023-02-09 15:13:05.599453','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send proposal','{}',1675955585593,1675955585593,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7q5en8apacbg83xsmmwjmf595ie','2023-02-09 15:13:03.771130','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675955583764,1675955583764,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7q5qa4ff3nfr49rrqtfr3xdn5pc','2023-02-09 15:13:03.743894','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675955583737,1675955583736,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7q933hz9op7ycuf8iywr84t3o5r','2023-02-09 15:13:08.611188','ckebmbmaycbrqbnot866fk7ij7y',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588606,1675955588606,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7qacsxadf1bde8r5fdniorab7ge','2023-02-09 15:13:13.561710','cg137mjnyipg9myrygzh41x45gc',1,'image','','{\"fileId\":\"74uia99m9btr8peydw7oexn37tw.gif\"}',1675955593555,1675955593555,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7qb4qtmf9wtfy9bhohjpzr9b8wr','2023-02-09 15:13:05.564820','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Finalize contract','{}',1675955585559,1675955585559,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7qwh7i5bb8t8w8yyxogqs4bapya','2023-02-09 15:13:05.173890','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Post-sales follow up','{\"value\":true}',1675955585166,1675955585166,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7qztz8xi9upgz7rmtc5djjkss8r','2023-02-09 15:13:05.692352','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Follow up after demo','{}',1675955585685,1675955585684,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7rjck1nau17faukrybaxf9ds47a','2023-02-09 15:13:07.051267','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Milk','{\"value\":false}',1675955587045,1675955587045,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('7ro96aqzbbifhzqridnm8bbccsr','2023-02-09 15:13:08.689775','cbb5bnkayt3d8fdagwyexka6y5a',1,'divider','','{}',1675955588684,1675955588684,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7rp75rubz3jfmmx4o4nsb74u4fh','2023-02-09 15:13:13.526428','cebwuam6qgbb65qki6xx8rcuoph',1,'checkbox','@mention teammates so they can follow, and collaborate on, comments and descriptions','{\"value\":false}',1675955593520,1675955593520,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('7rwguisc183gmzeb1wcc47zp1zr','2023-02-09 15:13:04.798154','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Schedule follow-up sales call','{\"value\":true}',1675955584790,1675955584790,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7s8ppoa9s778dib5ztgez9daroh','2023-02-09 15:13:05.159149','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Hand-off to customer success','{\"value\":true}',1675955585152,1675955585152,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7schpdqgqijytdebhmrgnpwcyzw','2023-02-09 15:13:07.039672','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'checkbox','Bread','{\"value\":false}',1675955587034,1675955587034,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('7sn7pp5f9g7d1fnnckshhmb163y','2023-02-09 15:13:05.230696','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Post-sales follow up','{}',1675955585224,1675955585224,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7tbdcr6rhutbf7dst5nkzyo7mrh','2023-02-09 15:13:05.030154','cxjttr33wdbyqifk6j159j45ody',1,'checkbox','Follow up after demo','{\"value\":true}',1675955585022,1675955585022,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7tf43bs64ipnwjdocnawsd3depy','2023-02-09 15:13:08.634012','ckebmbmaycbrqbnot866fk7ij7y',1,'divider','','{}',1675955588628,1675955588628,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7ti6yjwe3ttgs8ejr4tfftnyoba','2023-02-09 15:13:08.945872','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','[Subtask 1]','{\"value\":false}',1675955588940,1675955588940,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7tr7zu89w9frr3ninfpmxnri37c','2023-02-09 15:13:04.885334','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Follow up after demo','{\"value\":true}',1675955584878,1675955584878,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7tydudw9j4ibpmgy8bqp7egndro','2023-02-09 15:13:08.590754','ckebmbmaycbrqbnot866fk7ij7y',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588585,1675955588585,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7uji1wfkbx7nbbftj89x143mxxe','2023-02-09 15:13:08.678438','cbb5bnkayt3d8fdagwyexka6y5a',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588673,1675955588673,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7uyez9mn8p7rftqgkfoto9g489w','2023-02-09 15:13:05.716457','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Schedule follow-up sales call','{\"value\":false}',1675955585710,1675955585710,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7w49dpu8ygpfyzx7nfg543bhgtc','2023-02-09 15:13:08.956867','czw9es1e89fdpjr7cqptr1xq7qh',1,'checkbox','...','{\"value\":false}',1675955588951,1675955588951,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7whfs7b1kyb8cmy4j6588inr99y','2023-02-09 15:13:07.006641','cfxrcmsqwtb8ejdae9pcenmh9mw',1,'checkbox','Internet','{\"value\":true}',1675955587001,1675955587001,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('7wqef9psybfnyik743dd78ghw4e','2023-02-09 15:13:05.530209','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Hand-off to customer success','{}',1675955585524,1675955585524,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7wt3t94xewbyymj5g48njfs6sfo','2023-02-09 15:13:05.553624','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Post-sales follow up','{}',1675955585548,1675955585548,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7wtd46dn8qjy9xpq6mpo48k6cwo','2023-02-09 15:13:04.933008','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Finalize contract','{}',1675955584926,1675955584926,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7xecy5bwnptf6fgpkfbaetwam9r','2023-02-09 15:13:04.811968','cqz8jga9oiibfpgrz3k7omk9u6r',1,'checkbox','Post-sales follow up','{}',1675955584804,1675955584804,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7xznqkoe8y3ra3g65qqfehsehby','2023-02-09 15:13:03.757075','ch798q5ucefyobf5bymgqjt4f3h',1,'checkbox','','{\"value\":false}',1675955583750,1675955583750,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7y5hqudj4n78txpockgry3is9ca','2023-02-09 15:13:05.763137','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Hand-off to customer success','{}',1675955585757,1675955585757,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7ychgwnpe6p8x9qqubki3dukuny','2023-02-09 15:13:10.297775','cmz9qxykqgpdyxf9j5axmwejt1e',1,'image','','{\"fileId\":\"7b9xk9boj3fbqfm3umeaaizp8qr.png\"}',1675955590292,1675955590292,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('7yj1c1y6n8bnez8srebr9xyhp1o','2023-02-09 15:13:12.426206','cemryxdyma7r9pek7nrua5mkcga',1,'image','','{\"fileId\":\"77pe9r4ckbin438ph3f18bpatua.png\"}',1675955592418,1675955592418,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('7yt41oaxrxfr6xmrx36fncbyr4h','2023-02-09 15:13:05.679091','c9rpp4fsq4fyazjnrufq9p197nr',1,'checkbox','Send initial email','{\"value\":true}',1675955585673,1675955585673,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7z56arow18jdw7deb6jkusbymga','2023-02-09 15:13:03.984099','ceutpudw3u38spenb7t395wup3o',1,'checkbox','','{\"value\":false}',1675955583977,1675955583977,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('7z6yqohbf7bygt8q96a8bff98oy','2023-02-09 15:13:05.576534','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'checkbox','Send follow-up email','{\"value\":false}',1675955585571,1675955585570,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7za5q9fuuyiym3gysupwd9ogqfe','2023-02-09 15:13:05.295886','cb86yg4ppqbgrdktqg8hg3koqjh',1,'checkbox','Send initial email','{\"value\":true}',1675955585289,1675955585289,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7zafpkhuoipfatyn4quyp5ho54e','2023-02-09 15:13:04.972827','czo1hzhtwgbg3tde9scsbn9ogbc',1,'checkbox','Schedule initial sales call','{\"value\":true}',1675955584965,1675955584965,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('7zas7gqctb3gxtm9ur6n7h3b1ah','2023-02-09 15:13:08.854633','cikexdprbgb8ouynr5fmyimugwo',1,'divider','','{}',1675955588849,1675955588848,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('7zkd1rzi4ibnb9n57hyq97azc6e','2023-02-09 15:13:11.628236','cq9nnxgdcwfd88djwnyt88t4uuh',1,'image','','{\"fileId\":\"7y5kr8x8ybpnwdykjfuz57rggrh.png\"}',1675955591622,1675955591621,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('7zpump4j4g7rkfgisdrcofz5b5r','2023-02-09 15:13:08.796981','cix88w1wqzjfb8gccg6ajrsr5th',1,'checkbox','[Subtask 2]','{\"value\":false}',1675955588791,1675955588791,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('a1zr6uuynufb35jihug669suskc','2023-02-09 15:13:10.342167','cfmk7771httynm8r7rm8cbrmrya',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955590336,1675955590336,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('a3khhsbh7rjnafeokiyxc9i8doa','2023-02-09 15:13:13.701426','canoq7x74h7nt3yppsi18j496rc',1,'text','Cards can be linked and shared with teammates directly on Channels. Card previews are displayed when shared on Channels, so your team can discuss work items and get the relevant context without having to switch over to Boards.','{}',1675955593695,1675955593695,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('a3m9cwtsqr3bd5q1seams43jwje','2023-02-09 15:13:11.614987','cmzq3bnpxmt8f3k34pnjycidkzh',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591609,1675955591609,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('a3tbx1exnfjdnjrgwug95jmqy7y','2023-02-09 15:13:11.307416','c8q4rsku8htd7tnntzrxhpqn5ha',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675955591301,1675955591301,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('a45k4ry9pn3yobqktb6y6h45f6e','2023-02-09 15:13:03.798043','ch798q5ucefyobf5bymgqjt4f3h',1,'text','# Notes\n*[Add meeting notes here]*','{}',1675955583791,1675955583791,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('a4i1839ku9pr4mqgubpij4e3esw','2023-02-09 15:13:05.797510','c9rpp4fsq4fyazjnrufq9p197nr',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675955585791,1675955585791,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('a4je4p13yqjf6pcizp6hc1zb9ay','2023-02-09 15:13:08.565684','ctyi7g1r847rfteynz1fjqk8hmr',1,'text','## Checklist','{}',1675955588560,1675955588559,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('a4msfjnxpcfrk8f1f4px57kaztw','2023-02-09 15:13:12.570845','cidz4imnqhir48brz6e8hxhfrhy',1,'text','## Requirements\n- [Requirement 1]\n- [Requirement 2]\n- ...','{}',1675955592565,1675955592565,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('a4sfyyhjq1bdyme4zqmm3xtn6ch','2023-02-09 15:13:12.506597','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Screenshots\nIf applicable, add screenshots to elaborate on the problem.','{}',1675955592500,1675955592500,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('a4ywgn9zby3f6fjdgsgbbz1kjqo','2023-02-09 15:13:08.724817','cbb5bnkayt3d8fdagwyexka6y5a',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588719,1675955588719,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('a5amnooqcz7gy7yjd19dh3449ny','2023-02-09 15:13:12.480749','chnnww5gm138xjpobgmcnbqyspw',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955592474,1675955592474,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('a5e44frgpzj8ozmoxn8cu7x8uoh','2023-02-09 15:13:13.796748','cn3cj63de9t81jdceapfgdtqhcy',1,'text','To mention a teammate use the **@ symbol with their username** in the comments or description section. They\'ll get a Direct Message notification via Channels and also be added as a [follower](https://docs.mattermost.com/boards/work-with-cards.html#receive-updates) to the card. \n\nWhenever any changes are made to the card, they\'ll automatically get notified on Channels.','{}',1675955593790,1675955593790,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('a61mepup14t83fkmx7p75jod16c','2023-02-09 15:13:08.736771','cbb5bnkayt3d8fdagwyexka6y5a',1,'text','## Checklist','{}',1675955588730,1675955588730,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('a6kcrbx11s3guzdrfjfy1xhahya','2023-02-09 15:13:12.517760','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\nA clear and concise description of what you expected to happen.\n\n## Edition and Platform\n\n - Edition: Personal Desktop / Personal Server / Mattermost plugin\n - Version: [e.g. v0.9.0]\n - Browser and OS: [e.g. Chrome 91 on macOS, Edge 93 on Windows]\n\n## Additional context\n\nAdd any other context about the problem here.','{}',1675955592512,1675955592512,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('a6m859scuoigfmk87xd15d9zd4r','2023-02-09 15:13:11.319980','c6d843tks8fdc9gx7orr6odcdww',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675955591313,1675955591313,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('a77k6m9h6s38d3ek1bqktizmcar','2023-02-09 15:13:03.784924','ch798q5ucefyobf5bymgqjt4f3h',1,'text','# Action Items','{}',1675955583778,1675955583778,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('a7fm9z5ztp3fo7bt3g78iermp3h','2023-02-09 15:13:07.131823','crmtkd3pua38h5ysmxcjr5hw88o',1,'text','','{}',1675955587126,1675955587126,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('a9azy4hfxhbb59pfz38gq5h64aw','2023-02-09 15:13:12.610850','c1gnbat9p3tnzfec18bf6agbhgh',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955592603,1675955592603,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('a9iqt7u3xffb8zjnbcr4bxhywuc','2023-02-09 15:13:13.618418','cnzbty5iahbdh9nf4p6ng1mnfxh',1,'text','To share a board, select **Share** at the top right of the Board view. Copy the link to share the board internally with your team or generate public link that can be accessed by anyone externally.','{}',1675955593613,1675955593612,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('aa8acczgyaid7xmj16c5ws4nxie','2023-02-09 15:13:10.251594','ccxzm5dsu6tbbtyhgg31f4sec9y',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955590246,1675955590246,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aadbnnq8fj3gqucfc4ngqishwuo','2023-02-09 15:13:11.676035','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n- ...\n\n## Notes\n- ...\n- ...\n- ...','{}',1675955591670,1675955591670,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('ab14jmwfpk7yni8bm9ntrfaozuo','2023-02-09 15:13:10.966174','c3fdqgj8ut3r1iy8ugnsae7ncqy',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675955590961,1675955590961,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('ac3qw7f339fy75gquwsqby3z8kr','2023-02-09 15:13:07.108670','cnogc7s1x13bgmjz456dudb85py',1,'text','## Goal\nWalk at least 10,000 steps every day.','{}',1675955587102,1675955587102,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('acae5aqipzp8ndnoar5pmzw35mr','2023-02-09 15:13:03.701420','c5r5txf1pzir358gmkeesntg8aw',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675955583694,1675955583694,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('acciczh6eo7rs8cyrqm5ffko16r','2023-02-09 15:13:07.120042','cnogc7s1x13bgmjz456dudb85py',1,'text','## Route','{}',1675955587114,1675955587114,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('ach1ouji393na7cfh4ozzjb7teo','2023-02-09 15:13:11.331596','cyhm5hrnra781bpeatqyygemgah',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n\n## Weaknesses\n- ...\n- ...\n\n## Opportunities\n- ...\n- ...\n\n## Threats\n- ...\n- ...','{}',1675955591326,1675955591326,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('acjgpbs7oefgmfysdqk8jw6mw9w','2023-02-09 15:13:13.747201','cd8rx6nwwe38u3eebjefozn3xse',1,'text','Views allow your team to visualize the same cards and data from different perspectives, so they can stay up-to-date in the way that works best for them. To add a new view, go to **Add a new view** from the view drop-down, then select from any of the following views:\n\n- **Board**: Adds a Kanban board, similar to this one, that allows your team to organize cards in swimlanes grouped by any property of your choosing. This view helps you visualize your project progress.\n- **Table**: Displays cards in a table format with rows and columns. Use this view to get an overview of all your project tasks. Easily view and compare the state of all properties across all cards without needing to open individual cards.\n- **Gallery**: Displays cards in a gallery format, so you can manage and organize cards with image attachments.\n- **Calendar**: Adds a calendar view to easily visualize your cards by dates and keep track of deadlines.','{}',1675955593741,1675955593741,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('acjrasnxctirofjybch3qr3dcha','2023-02-09 15:13:04.840834','cqz8jga9oiibfpgrz3k7omk9u6r',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675955584833,1675955584833,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('ad6w4zipzrbgudmb7eqwmgj78sa','2023-02-09 15:13:05.358259','cb86yg4ppqbgrdktqg8hg3koqjh',1,'text','## Checklist','{}',1675955585352,1675955585352,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('adb89p5s3kiysxxdg9jwnqqso8a','2023-02-09 15:13:11.012638','c6wt3u45b4jdxpqkwmtgg3ws3ra',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675955591007,1675955591007,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('adso1om3mo3fazniwqijpbeb85a','2023-02-09 15:13:11.664394','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591658,1675955591657,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('aeiucy1bnufrbbjcfboxbomsnpw','2023-02-09 15:13:05.785851','c9rpp4fsq4fyazjnrufq9p197nr',1,'text','## Checklist','{}',1675955585780,1675955585780,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('aendew5n7apfpfbfg94hjcr8bch','2023-02-09 15:13:04.036987','ceutpudw3u38spenb7t395wup3o',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675955584030,1675955584030,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('aeugpze8spbf4xq6ce5ahutzagc','2023-02-09 15:13:13.641014','coi789ctpa3n5bpqsgc1jcswqso',1,'text','To create a new card, simply do any of the following:\n- Select \"**New**\" on the top right header\n- Select \"**+ New**\" below any column\n- Select \"**+**\" to the right of any columnn header','{}',1675955593635,1675955593635,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('afb3exyr3xbfm7yce6wggeeakhy','2023-02-09 15:13:12.635359','cwrq9ag3p5pgzzy98nfd3wwra1w',1,'text','## Summary\n*[Brief description of what this epic is about]*\n## Motivation\n*[Brief description on why this is needed]*\n## Acceptance Criteria\n- *[Criteron 1]*\n- *[Criteron 2]*\n- ...\n## Personas\n- *[Persona A]*\n- *[Persona B]*\n- ...\n## Reference Materials\n- *[Links to other relevant documents as needed]*\n- ...','{}',1675955592628,1675955592628,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('afpgs6xraqjyuuf4zhy7fsio4ur','2023-02-09 15:13:11.640022','cq9nnxgdcwfd88djwnyt88t4uuh',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591634,1675955591634,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('afsw7hyn5xpncffxn9yn5e4qbna','2023-02-09 15:13:08.655676','ckebmbmaycbrqbnot866fk7ij7y',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588650,1675955588650,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('ag7rbwonqotbndk9kiw89t1e4br','2023-02-09 15:13:11.687709','cff1jmrxfrirgbeebhr9qd7nida',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591681,1675955591681,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('agawe389ja7ykfmnmjetbxkto9w','2023-02-09 15:13:11.652251','cq9nnxgdcwfd88djwnyt88t4uuh',1,'text','## Media','{}',1675955591646,1675955591646,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('agbfxbbe1qpbtzghib1xffspybo','2023-02-09 15:13:12.467414','cqangpbz5c3rpfefzdbe4totwnc',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955592460,1675955592460,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('agt75wzipx3f4zxcqptk7mz19ih','2023-02-09 15:13:05.644770','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'text','## Checklist','{}',1675955585639,1675955585639,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('ahaqysju1yj8jjnwzycyeyysmuc','2023-02-09 15:13:12.544590','cf75w38ufx7nmukby5irgojbskw',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955592538,1675955592538,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('ahj5ij6oshidt78xu8e34s8zmjh','2023-02-09 15:13:10.468393','ck7c7denp7tg53xnt5oz7xw8hde',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955590462,1675955590462,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ahmoo614kjty4iqp164y6bmtygc','2023-02-09 15:13:05.000439','czo1hzhtwgbg3tde9scsbn9ogbc',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675955584994,1675955584993,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('ahsudf7h5qt87dm59owgpnf14jr','2023-02-09 15:13:10.274549','cg46r9od7rf8ipr5139ydfieu8y',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955590269,1675955590269,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aijmqfdwxp7d7mj14o3ueuhbhha','2023-02-09 15:13:04.023892','ceutpudw3u38spenb7t395wup3o',1,'text','## Action Items','{}',1675955584017,1675955584017,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('aizi5qcgx8bbc9fsx1f7t73d5do','2023-02-09 15:13:10.286445','cg46r9od7rf8ipr5139ydfieu8y',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955590280,1675955590280,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ajbx8r7dmdfnu3ra11w77dxwnza','2023-02-09 15:13:12.530876','cfefgwjke6bbxpjpig618g9bpte',1,'text','## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\n*[A clear and concise description of what you expected to happen.]*\n\n## Screenshots\n\n*[If applicable, add screenshots to elaborate on the problem.]*\n\n## Edition and Platform\n\n - Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n - Version: *[e.g. v0.9.0]*\n - Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n\n*[Add any other context about the problem here.]*','{}',1675955592524,1675955592524,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('ajmhitsxxbfrb3mrewrxm1st15c','2023-02-09 15:13:13.442173','czbk3bqy8k3yjde4fnu9o8ircby',1,'text','Mattermost Boards makes it easy for you to update certain properties on cards through our drag and drop functionality. Simply drag this card from the **Later** column to the **Completed** column to automatically update the status and mark this task as complete.','{}',1675955593437,1675955593437,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('ajz9ijqfmuf8a9fb7utsccwaspr','2023-02-09 15:13:13.773763','c3zsx74nrcpys8g3r5xfgknthmr',1,'text','Customize cards to fit your needs and track the information most important to you. Boards supports a wide range of fully customizable property types. For example, you can:\n- Use the **Date** property for things like deadlines or milestones.\n- Assign owners to tasks with the **Person** property.\n- Define statuses and priorities with the **Select** property.\n- Create tags with the **Multi Select** property.\n- Link cards to webpages with the **URL** property.','{}',1675955593768,1675955593768,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('ak5fza5wbnjfo7dxxqe3m8rprrc','2023-02-09 15:13:05.518820','cagbcg7m38jydjqx1cx34pg3mzr',1,'text','## Checklist','{}',1675955585513,1675955585513,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('akhqdd35se3yz5xh5zt6ozeenwy','2023-02-09 15:13:12.440745','cemryxdyma7r9pek7nrua5mkcga',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955592433,1675955592433,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('akmg5iau977bqfxjmob8mq9ts3o','2023-02-09 15:13:03.957041','chdoctirc6ig39nbq17xhhgsdew',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675955583950,1675955583950,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('aktyo8f7993ny8x1w7c1pkr375r','2023-02-09 15:13:12.454163','cemryxdyma7r9pek7nrua5mkcga',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955592448,1675955592448,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('am6freei6e3ympkmurbutrrb5or','2023-02-09 15:13:08.979083','czw9es1e89fdpjr7cqptr1xq7qh',1,'text','## Checklist','{}',1675955588973,1675955588973,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('am97jryax1iro7n85jroh8778yw','2023-02-09 15:13:13.654772','coi789ctpa3n5bpqsgc1jcswqso',1,'text','Mattermost Boards helps you manage and track all your project tasks with **Cards**.','{}',1675955593646,1675955593646,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('amattnuhzcj8hxg1e3pqszzegrh','2023-02-09 15:13:13.549585','cebwuam6qgbb65qki6xx8rcuoph',1,'text','Cards allow your entire team to manage and collaborate on a task in one place. Within a card, your team can:','{}',1675955593544,1675955593544,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('amgk6gg4axfr5dmmid37qinmohh','2023-02-09 15:13:10.407061','chqd96dxi7jf3me4zd3c8na77ua',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955590399,1675955590399,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('amh8jwmku4pd78e3kytbzekmeac','2023-02-09 15:13:13.607354','cnzbty5iahbdh9nf4p6ng1mnfxh',1,'text','Keep stakeholders and customers up-to-date on project progress by sharing your board.','{}',1675955593601,1675955593601,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('amp6pbkxejbyhxywexbk8ftfdth','2023-02-09 15:13:10.319815','cmz9qxykqgpdyxf9j5axmwejt1e',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955590314,1675955590314,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aniyqg1s9otf1jbd7bjj3hdpryw','2023-02-09 15:13:12.582993','c1kwdjzwqsfygxe5yk53y8krkoc',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675955592576,1675955592576,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('anqhq6hzz6jn1ffwxxnsxn9uudy','2023-02-09 15:13:05.189001','cxjttr33wdbyqifk6j159j45ody',1,'text','## Checklist','{}',1675955585181,1675955585181,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('anrds5daywjyhmmawh6piy9mw6h','2023-02-09 15:13:08.809221','cix88w1wqzjfb8gccg6ajrsr5th',1,'text','## Checklist','{}',1675955588802,1675955588802,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('ant34hxkckfnffjs4cu97gwry7a','2023-02-09 15:13:03.866042','cnq9ritr7t7nomyupipc9j7dbde',1,'text','## Action Items','{}',1675955583859,1675955583858,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('aobnpxchj3jgyxy6joc3yefpcdy','2023-02-09 15:13:10.978042','cf33otfdy33nfpg9xg5c5ftdp3a',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675955590972,1675955590972,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('aoz9kboqi3tr38rpd6s5nkye34a','2023-02-09 15:13:13.678300','canoq7x74h7nt3yppsi18j496rc',1,'text','After you\'ve copied the link, paste it into any channel or Direct Message to share the card. A preview of the card will display within the channel with a link back to the card on Boards.','{}',1675955593673,1675955593673,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('ap1w3ix4qybrzpbp5yi4a79p8te','2023-02-09 15:13:08.644950','ckebmbmaycbrqbnot866fk7ij7y',1,'text','## Checklist','{}',1675955588639,1675955588639,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('ap6pw4f666id75r56b7uxutop4y','2023-02-09 15:13:13.573097','cg137mjnyipg9myrygzh41x45gc',1,'text','A board helps you manage your project, organize tasks, and collaborate with your team all in one place.','{}',1675955593567,1675955593567,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('apowhzozrbty6xjowzi3by71iqa','2023-02-09 15:13:08.578781','ctyi7g1r847rfteynz1fjqk8hmr',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588572,1675955588572,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('apr37rx4thtfm8d8z39k7ufxqew','2023-02-09 15:13:05.014213','czo1hzhtwgbg3tde9scsbn9ogbc',1,'text','## Checklist','{}',1675955585007,1675955585007,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('apu3355oj73rnimuasezwsrkrfc','2023-02-09 15:13:13.689817','canoq7x74h7nt3yppsi18j496rc',1,'text','To share a card, you\'ll need to copy the card link first. You can:\n\n- Open a card and select the options menu button at the top right of the card.\n- Open the board view and hover your mouse over any card to access the options menu button.','{}',1675955593684,1675955593684,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('aq1ien1oyzbn55j13n5r78wuzfa','2023-02-09 15:13:05.507797','cagbcg7m38jydjqx1cx34pg3mzr',1,'text','## Notes\n[Enter notes here...]','{}',1675955585502,1675955585502,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('aq3fh99xz5iro3fnm5opwh5n3tc','2023-02-09 15:13:11.293877','cu91ugd56rirqxyupgjwozoi7tr',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675955591287,1675955591287,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('aq7d5ncbc1tgzumxaztu1isypxw','2023-02-09 15:13:05.657130','ct59gu9j4cpnrtjcpyn3a5okdqa',1,'text','## Notes\n[Enter notes here...]','{}',1675955585651,1675955585651,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('aqhufq7p6uinm98td11ayxurabw','2023-02-09 15:13:11.700268','cuxggn3p3kjf4upaaywym3xm59c',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591693,1675955591693,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('aqo375g4dipdfjd1yrmznagi5ur','2023-02-09 15:13:11.710764','cdzz1f3i9biypddmppc1fg97pbh',1,'text','## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...','{}',1675955591705,1675955591705,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('aqz87s9n9o7gcjchd8ahiwgrtya','2023-02-09 15:13:03.943506','chdoctirc6ig39nbq17xhhgsdew',1,'text','## Action Items','{}',1675955583937,1675955583937,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('ar4eie8yh8pgymkxy34hp3phuch','2023-02-09 15:13:08.888368','cikexdprbgb8ouynr5fmyimugwo',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588883,1675955588883,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('ar55tt5wywfdptxmqgkezgfhc6c','2023-02-09 15:13:08.967891','czw9es1e89fdpjr7cqptr1xq7qh',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588962,1675955588962,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('asga1bhnouid3ub4as84w4gh44o','2023-02-09 15:13:13.724000','c68ftccp7c3r69bhh5s9p6jxycy',1,'text','Organize and find the cards you\'re looking for with our filter, sort, and grouping options. From the Board header, you can quickly toggle on different properties, change the group display, set filters, and change how the cards are sorted.','{}',1675955593718,1675955593718,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('asgkpsgg3qfyaifjb1n6c7qowzh','2023-02-09 15:13:10.331056','cstu6h6hfcfd59yc4qwd4pd3i4o',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955590325,1675955590325,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aspcsqz8yzjdpxjmgmhypifoe8y','2023-02-09 15:13:12.646694','cwrq9ag3p5pgzzy98nfd3wwra1w',1,'text','## Summary\n[Brief description of what this epic is about]\n\n## Motivation\n[Brief description on why this is needed]\n\n## Acceptance Criteria\n - [Criteron 1]\n - [Criteron 2]\n - ...\n\n## Personas\n - [Persona A]\n - [Persona B]\n - ...\n\n## Reference Materials\n - [Links to other relevant documents as needed]\n - ...','{}',1675955592641,1675955592641,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('at46xzyqcrjgiierds18et39ggo','2023-02-09 15:13:05.370263','cb86yg4ppqbgrdktqg8hg3koqjh',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675955585364,1675955585364,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('atfky7fydsp8uigjoc8zraarxcy','2023-02-09 15:13:10.354037','cfmk7771httynm8r7rm8cbrmrya',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955590348,1675955590348,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('atw666atbn3848m58coybbxssdw','2023-02-09 15:13:08.820315','cix88w1wqzjfb8gccg6ajrsr5th',1,'text','## Description\n*[Brief description of this task]*','{}',1675955588815,1675955588815,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('au5ex799hujratgknhmxixuws8y','2023-02-09 15:13:10.989469','cbybbaewz3b85z8jwut18o6g1dr',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675955590983,1675955590983,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('au5u4me3i7f8jmqfdo1hamw1toe','2023-02-09 15:13:10.444896','cdja7nwgcaffgxdrjtni173bayh',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675955590438,1675955590438,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aue5actny978cmg85oyjyxqtcre','2023-02-09 15:13:13.809477','cn3cj63de9t81jdceapfgdtqhcy',1,'text','Collaborate with teammates directly on each card using @mentions and have all the relevant context in one place.','{}',1675955593803,1675955593803,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('auewq49obsbboumrqbf36xh3pya','2023-02-09 15:13:10.420642','chqd96dxi7jf3me4zd3c8na77ua',1,'text','## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*','{}',1675955590414,1675955590414,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aupenqk7botbjzen4dn9ue1wfpr','2023-02-09 15:13:10.308728','cmz9qxykqgpdyxf9j5axmwejt1e',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955590303,1675955590303,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('aur9jj4ywcpbm3yn3kc341xcmew','2023-02-09 15:13:11.001627','cskmj8hxihj8gtdrusqkoxw9ruw',1,'text','## Interview Notes\n- ...\n- ...\n- ... ','{}',1675955590995,1675955590995,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('aw1e4ep9zeiyxpnjpedtjxwwnie','2023-02-09 15:13:12.558591','cidz4imnqhir48brz6e8hxhfrhy',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955592551,1675955592551,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('awigum1hx6ige8rfzhpmcmrkmhy','2023-02-09 15:13:10.432419','cw85ce7jszt8ufcdo44ay1buega',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955590426,1675955590426,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ax115hmekot8jupz7ewgqywi6so','2023-02-09 15:13:10.456951','cf84s7zu18jbeud54uwzam8qwpo',1,'text','## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...','{}',1675955590451,1675955590451,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ax841kejdi7rwbeed5zwomt9p3e','2023-02-09 15:13:07.085683','c9mgm3h9mwpnr5mkpqfdiad33cw',1,'text','## Grocery list','{}',1675955587080,1675955587080,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('axskm1c8n4inbfc56m6737xncza','2023-02-09 15:13:11.343340','cp8xyhyy85tgq3c6jgqmhdz3ree',1,'text','## Summary\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.\n## Strengths\n- ...\n- ...\n## Weaknesses\n- ...\n- ...\n## Opportunities\n- ...\n- ...\n## Threats\n- ...\n- ...','{}',1675955591337,1675955591337,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('ayhpkueiieirsmbm5zeejtfmite','2023-02-09 15:13:03.878654','cnq9ritr7t7nomyupipc9j7dbde',1,'text','## Notes\n*[Add meeting notes here]*','{}',1675955583872,1675955583872,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('ayk98dhhnw389idq11x8ndmjdza','2023-02-09 15:13:12.622723','c1gnbat9p3tnzfec18bf6agbhgh',1,'text','## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*','{}',1675955592617,1675955592617,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('ayqbm41jf87b7f8ci34p3misikh','2023-02-09 15:13:10.366855','czf1skn1natn3ppzqqqf5kc3bgr',1,'text','## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...','{}',1675955590359,1675955590359,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('az1eoncet73ni3dco91wjo1pwba','2023-02-09 15:13:05.215184','cxjttr33wdbyqifk6j159j45ody',1,'text','## Notes\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis fermentum aliquet massa in ornare. Pellentesque mollis nisl efficitur, eleifend nisi congue, scelerisque nunc. Aliquam lorem quam, commodo id nunc nec, congue bibendum velit. Vivamus sed mattis libero, et iaculis diam. Suspendisse euismod hendrerit nisl, quis ornare ipsum gravida in.','{}',1675955585203,1675955585203,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('azb84nx87xpnampc7mpqba7pfoy','2023-02-09 15:13:03.715352','c5r5txf1pzir358gmkeesntg8aw',1,'text','## Action Items','{}',1675955583708,1675955583708,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('azj1msd6fjt8wddpy3gms8ka19h','2023-02-09 15:13:04.825822','cqz8jga9oiibfpgrz3k7omk9u6r',1,'text','## Checklist','{}',1675955584818,1675955584818,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('azksjrk8eti8nbqpdtwfzdew91a','2023-02-09 15:13:08.899736','cikexdprbgb8ouynr5fmyimugwo',1,'text','## Checklist','{}',1675955588894,1675955588893,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('azmdzad8u8jboxka8c4ns1jorqw','2023-02-09 15:13:13.584253','cg137mjnyipg9myrygzh41x45gc',1,'text','To create your own board, select the \"+\" on the top of the left hand sidebar. Choose from one of our standard templates and see how they can help you get started with your next project:\n\n- **Project Tasks**: Stay on top of your project tasks, track progress, and set priorities. \n- **Meeting Agenda**: Set your meeting agendas for recurring team meetings and 1:1s.\n- **Roadmap**: Plan your roadmap and manage your releases more efficiently.\n- **Personal Tasks**: Organize your life and track your personal tasks.\n- **Content Calendar**: Plan your editorial content, assign work, and track deadlines.\n- **Personal Goals**: Set and accomplish new personal goals and milestones.','{}',1675955593578,1675955593578,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('c14ae1y7dr3y83x3n4pjj86yoty','2023-02-09 15:13:09.636244','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Improve customer NPS score','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"82%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"8.5\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"anruuoyez51r3yjxuoc8zoqnwaw\",\"azqnyswk6s1boiwuthscm78qwuo\":\"7\",\"azzbawji5bksj69sekcs4srm1ky\":\"agm9p6gcq15ueuzqq3wd4be39wy\"}}',1675955589630,1675955589630,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('c1gnbat9p3tnzfec18bf6agbhgh','2023-02-09 15:13:12.339718','bui5izho7dtn77xg3thkiqprc9r',1,'card','Icons don\'t display','{\"contentOrder\":[\"ayk98dhhnw389idq11x8ndmjdza\",\"a9azy4hfxhbb59pfz38gq5h64aw\",\"7gw8c51de83ns8fpbuof8zwhb6e\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"1fdbb515-edd2-4af5-80fc-437ed2211a49\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955592332,1675955592332,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('c1kwdjzwqsfygxe5yk53y8krkoc','2023-02-09 15:13:12.324984','bui5izho7dtn77xg3thkiqprc9r',1,'card','Review API design','{\"contentOrder\":[\"aniyqg1s9otf1jbd7bjj3hdpryw\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675955592317,1675955592317,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('c3fdqgj8ut3r1iy8ugnsae7ncqy','2023-02-09 15:13:10.885678','bh4pkixqsjift58e1qy6htrgeay',1,'card','Frank Nash','{\"contentOrder\":[\"ab14jmwfpk7yni8bm9ntrfaozuo\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"ap93ysuzy1xa7z818r6myrn4h4y\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"frank.nash@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1669896000000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"aehc83ffays3gh8myz16a8j7k4e\"}}',1675955590879,1675955590879,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('c3hswkeuxf78ydyjwsdhjh34rqw','2023-02-09 15:13:12.094074','bsjd59qtpbf888mqez3ge77domw',1,'card','Schedule more time for testing','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"akj3fkmxq7idma55mdt8sqpumyw\"}}',1675955592088,1675955592088,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('c3zsx74nrcpys8g3r5xfgknthmr','2023-02-09 15:13:13.367490','buixxjic3xjfkieees4iafdrznc',1,'card','Add new properties','{\"contentOrder\":[\"ajz9ijqfmuf8a9fb7utsccwaspr\",\"ayhk11qsuz789fk8bqae4oz8mro\",\"7gc3z8cf8rirgfyutwoke9nn6jy\",\"76cinqnb6k3dzmfbm9fnc8eofny\",\"7mdjhtadx97bnjf5tretp4gwogy\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#add-and-manage-properties\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675955593361,1675955593361,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('c5r5txf1pzir358gmkeesntg8aw','2023-02-09 15:13:03.578994','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Team Schedule','{\"contentOrder\":[\"acae5aqipzp8ndnoar5pmzw35mr\",\"7h9b4z35aypn95bozwd9nxxaujh\",\"azb84nx87xpnampc7mpqba7pfoy\",\"7n3yebdqpefyd8ynfkh66uafgch\",\"775k5efyyciy6bqtze1rpog6xzh\",\"7kkm8rm5je7dtdyaixwff5zz1ac\"],\"icon\":\"⏰\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"8b05c83e-a44a-4d04-831e-97f01d8e2003\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\"}}',1675955583572,1675955583572,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('c68ftccp7c3r69bhh5s9p6jxycy','2023-02-09 15:13:13.343309','buixxjic3xjfkieees4iafdrznc',1,'card','Filter and sort cards','{\"contentOrder\":[\"a4fz9kcfs9ibj8puk9mux7ac94c\",\"asga1bhnouid3ub4as84w4gh44o\",\"78i8aqjmqtibr7x4okhz6uqquqr\",\"7aodxtmcjzbrh9et9bu17dwsf6h\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675955593337,1675955593337,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('c6d843tks8fdc9gx7orr6odcdww','2023-02-09 15:13:11.255804','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Kadera Global','{\"contentOrder\":[\"a6m859scuoigfmk87xd15d9zd4r\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"aipf3qfgjtkheiayjuxrxbpk9wa\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"150\",\"ahzspe59iux8wigra8bg6cg18nc\":\"kaderaglobal.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$12,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2015\",\"aozntq4go4nkab688j1s7stqtfc\":\"Seattle, OR\"}}',1675955591250,1675955591250,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('c6dwoco55i7dt8c33dgdms9eudr','2023-02-09 15:13:12.082817','bsjd59qtpbf888mqez3ge77domw',1,'card','Reschedule planning meeting','{\"contentOrder\":[],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aok6pgecm85qe9k5kcphzoe63ma\"}}',1675955592077,1675955592077,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('c6wt3u45b4jdxpqkwmtgg3ws3ra','2023-02-09 15:13:10.932198','bh4pkixqsjift58e1qy6htrgeay',1,'card','Bernadette Powell','{\"contentOrder\":[\"adb89p5s3kiysxxdg9jwnqqso8a\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"af6hjb3ysuaxbwnfqpby4wwnkdr\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"bernadette.powell@email.com\"}}',1675955590926,1675955590926,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('c8q4rsku8htd7tnntzrxhpqn5ha','2023-02-09 15:13:11.244978','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Helx Industries','{\"contentOrder\":[\"a3tbx1exnfjdnjrgwug95jmqy7y\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abt79uxg5edqojsrrefcnr4eruo\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"650\",\"ahzspe59iux8wigra8bg6cg18nc\":\"helxindustries.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$50,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2009\",\"aozntq4go4nkab688j1s7stqtfc\":\"New York, NY\"}}',1675955591239,1675955591239,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('c9mgm3h9mwpnr5mkpqfdiad33cw','2023-02-09 15:13:06.910231','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Buy groceries','{\"contentOrder\":[\"ax841kejdi7rwbeed5zwomt9p3e\",\"7rjck1nau17faukrybaxf9ds47a\",\"7dbyebx37iiyomxe69okrps9uma\",\"7schpdqgqijytdebhmrgnpwcyzw\",\"7h46ajuoirjfs5cpegnu8g17pew\",\"773t4jpidzpftificz9umr1jioc\",\"74hgakzty8tgoirg7qd4ktkh3iw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"afpy8s7i45frggprmfsqngsocqh\"}}',1675955586904,1675955586904,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('c9rpp4fsq4fyazjnrufq9p197nr','2023-02-09 15:13:04.657430','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Shelby Olson','{\"contentOrder\":[\"a4i1839ku9pr4mqgubpij4e3esw\",\"aeiucy1bnufrbbjcfboxbomsnpw\",\"7yt41oaxrxfr6xmrx36fncbyr4h\",\"7dnwzbk6wxb8hzyxcrkbj5y5jsc\",\"79ziahugmrtf5bqzjx5whjdxf8y\",\"7uyez9mn8p7rftqgkfoto9g489w\",\"7fn1t4d8qqbn4mmgppyq19ioh4o\",\"7qztz8xi9upgz7rmtc5djjkss8r\",\"7cagjjmx9cirh5byccbcd4m566h\",\"7nzy654n9rj8kjyzocsxswc4rwr\",\"7y5hqudj4n78txpockgry3is9ca\",\"78qmgw8zchi8cbq9sq7zsd4isje\"],\"icon\":\"?‍♀️\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(111) 321-5678\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"abru6tz8uebdxy4skheqidh7zxy\":\"shelby.olson@email.com\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$30,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Kadera Global\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"ar6t1ttcumgfuqugg5o4g4mzrza\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"auu9bfzqeuruyjwzzqgz7q8apuw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1669291200000}\"}}',1675955584650,1675955584650,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('cagbcg7m38jydjqx1cx34pg3mzr','2023-02-09 15:13:04.642318','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','New Prospect','{\"contentOrder\":[\"aq1ien1oyzbn55j13n5r78wuzfa\",\"ak5fza5wbnjfo7dxxqe3m8rprrc\",\"7n7s9k18nejgg5ktfcuiyip5m5r\",\"7ejmo388ff784zmbjqa6m1x6txr\",\"736qmhr68utre8dutm1twinejth\",\"7de64km5zwjdrmx33wjeh38fk4h\",\"76fcdksyhjiyazkbdsncjazymzy\",\"75zzaedht4ffffr4kw11d98zidr\",\"73gdtsfdeebr8dyfmrwc1o73f9y\",\"7cxmaainfm7ycbka93uunsqabmy\",\"756mt37fhs388xk4194p3apjwhr\",\"7f7ngti4wutyb7pqogsuqy7a1xo\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"akj61wc9yxdwyw3t6m8igyf9d5o\"}}',1675955584635,1675955584635,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('canoq7x74h7nt3yppsi18j496rc','2023-02-09 15:13:13.331232','buixxjic3xjfkieees4iafdrznc',1,'card','Share cards on Channels','{\"contentOrder\":[\"a3khhsbh7rjnafeokiyxc9i8doa\",\"apu3355oj73rnimuasezwsrkrfc\",\"aoz9kboqi3tr38rpd6s5nkye34a\",\"78dxu6pcsefn33ru83dob8o4e4h\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#share-card-previews\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675955593325,1675955593325,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('catdmug46i3gebnxii6ebksmwye','2023-02-09 15:13:09.661260','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Increase customer retention','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"66%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"90% customer retention rate\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"60%\",\"azzbawji5bksj69sekcs4srm1ky\":\"afkxpcjqjypu7hhar7banxau91h\"}}',1675955589656,1675955589656,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('cb86yg4ppqbgrdktqg8hg3koqjh','2023-02-09 15:13:04.628537','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Caitlyn Russel','{\"contentOrder\":[\"at46xzyqcrjgiierds18et39ggo\",\"ad6w4zipzrbgudmb7eqwmgj78sa\",\"7za5q9fuuyiym3gysupwd9ogqfe\",\"7m69x9dxeybf5meb9mewzz46awy\",\"785ddmgjn5ff9typdnbjk9ibszo\",\"7cppnqstxdpgkzp4qicsct7r6kh\",\"7dp4n86puk7bst8c5nordyozbxr\",\"7kqqcb35odpyrum4f79za68t34a\",\"7n5i7e8ntppryzkiyr85rthn4ec\",\"7at63jg3h6fn1pqod4bngs1tpja\",\"75rrqrsp6fifb8gx4g6jwsr6o8a\",\"7sn7pp5f9g7d1fnnckshhmb163y\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(111) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"ah6ehh43rwj88jy4awensin8pcw\",\"abru6tz8uebdxy4skheqidh7zxy\":\"caitlyn.russel@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1689336000000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"20%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$250,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Liminary Corp.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"aafwyza5iwdcwcyfyj6bp7emufw\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apiswzj7uiwbh87z8dw8c6mturw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1668168000000}\"}}',1675955584622,1675955584622,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('cbb5bnkayt3d8fdagwyexka6y5a','2023-02-09 15:13:08.420377','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Requirements sign-off','{\"contentOrder\":[\"a4ywgn9zby3f6fjdgsgbbz1kjqo\",\"7ro96aqzbbifhzqridnm8bbccsr\",\"a61mepup14t83fkmx7p75jod16c\",\"7pb4fjz39uiraxqqz764s9qnkza\",\"7uji1wfkbx7nbbftj89x143mxxe\",\"7fx18ayomnjgibjqxjnht6djajr\",\"7ewhu5gutpbde5y5stwjxticsia\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"8\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\"}}',1675955588414,1675955588414,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('cbybbaewz3b85z8jwut18o6g1dr','2023-02-09 15:13:10.908642','bh4pkixqsjift58e1qy6htrgeay',1,'card','Claire Hart','{\"contentOrder\":[\"au5ex799hujratgknhmxixuws8y\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"aseqq9hrsua56r3s6nbuirj9eec\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"claire.hart@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1670500800000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"ahn89mqg9u4igk6pdm7333t8i5h\"}}',1675955590902,1675955590902,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('ccmnr5m3oppr4mm3iwqh5q4gwhh','2023-02-09 15:13:06.945389','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Gardening','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"afpy8s7i45frggprmfsqngsocqh\"}}',1675955586939,1675955586939,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('ccxzm5dsu6tbbtyhgg31f4sec9y','2023-02-09 15:13:10.106423','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','User Story','{\"contentOrder\":[\"aa8acczgyaid7xmj16c5ws4nxie\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"apht1nt5ryukdmxkh6fkfn6rgoy\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675955590100,1675955590100,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('cd8rx6nwwe38u3eebjefozn3xse','2023-02-09 15:13:13.355247','buixxjic3xjfkieees4iafdrznc',1,'card','Create a new view','{\"contentOrder\":[\"aozbezukpgif3jpbsq7tahmmp5e\",\"acjgpbs7oefgmfysdqk8jw6mw9w\",\"7owai1ux3h3gtf8byynfk6hyx1c\",\"7n8jq1dizyfgotby3o91arf1hxh\",\"77y4wffj1ctg7xmm9bx45qn6q6o\",\"7dc54s483qfyedkndrbu5gtiuao\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-views\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"af3p8ztcyxgn8wd9z4az7o9tjeh\",\"acypkejeb5yfujhj9te57p9kaxw\":\"ascd7nm9r491ayot8i86g1gmgqw\"}}',1675955593349,1675955593349,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('cdja7nwgcaffgxdrjtni173bayh','2023-02-09 15:13:10.190787','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Epic','{\"contentOrder\":[\"au5u4me3i7f8jmqfdo1hamw1toe\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675955590184,1675955590184,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('cdzz1f3i9biypddmppc1fg97pbh','2023-02-09 15:13:11.558797','brs9cdimfw7fodyi7erqt747rhc',1,'card','Unblocking Workflows: The Guide to Developer Productivity','{\"contentOrder\":[\"77tz16jtz5x73ncs3dxc3fp1d7h\",\"aqo375g4dipdfjd1yrmznagi5ur\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1638532800000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a3pdzi53kpbd4okzdkz6khi87zo\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"apy9dcd7zmand615p3h53zjqxjh\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1639483200000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://mattermost.com/newsroom/press-releases/mattermost-unveils-definitive-report-on-the-state-of-developer-productivity-unblocking-workflows-the-guide-to-developer-productivity-2022-edition/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"a3xky7ygn14osr1mokerbfah5cy\"}}',1675955591553,1675955591552,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('cebwuam6qgbb65qki6xx8rcuoph','2023-02-09 15:13:13.284928','buixxjic3xjfkieees4iafdrznc',1,'card','Manage tasks with cards','{\"contentOrder\":[\"amattnuhzcj8hxg1e3pqszzegrh\",\"763nbftujuine8x6tuxwkboqbsa\",\"7ioxhuh3pyfn69f7ifmurqkns6w\",\"784uu3ufcgb878ky7hyugmf6xcw\",\"7kgijm6giob86pnekppcu6as7se\",\"7p8qyw935rjnstqxmcofm79q44o\",\"7oryzjiozefnozf4eipqqgf131y\",\"7nb8y7jyoetro8cd36qcju53z8c\",\"7njhr916g83bp8c8eajpcmyyxpw\",\"7rp75rubz3jfmmx4o4nsb74u4fh\",\"76nwb9tqfsid5jx46yw34itqima\",\"7dy3mcgzgybf1ifa3emgewkzj7e\",\"a5ca6tii33bfw8ba36y1rswq3he\",\"7876od6xhffr6fy69zeogag7eyw\",\"7x7bq9awkatbm5x4docbh5gaw4y\",\"7ghpx9qff43dgtke1rwidmge1ho\",\"7nb8y7jyoetro8cd36qcju53z8c\",\"7hdyxemhbytfm3m83g88djq9nhr\",\"7pgnejxokubbe9kdrxj6g9qa41e\",\"7hw9z6qtx8jyizkmm9g5yq3gxcy\",\"7gk6ooz6npbb8by5rgp9aig7tua\",\"711sojjc1sbbqxgpjoujp18doua\"],\"icon\":\"☑️\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675955593279,1675955593279,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('cemryxdyma7r9pek7nrua5mkcga','2023-02-09 15:13:12.264611','bui5izho7dtn77xg3thkiqprc9r',1,'card','App crashing','{\"contentOrder\":[\"79t7rkiuspeneqi9xurou9tqzwh\",\"akhqdd35se3yz5xh5zt6ozeenwy\",\"aktyo8f7993ny8x1w7c1pkr375r\",\"7yj1c1y6n8bnez8srebr9xyhp1o\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"1fdbb515-edd2-4af5-80fc-437ed2211a49\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\"}}',1675955592257,1675955592257,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('ceutpudw3u38spenb7t395wup3o','2023-02-09 15:13:03.619195','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Social Media Strategy','{\"contentOrder\":[\"aendew5n7apfpfbfg94hjcr8bch\",\"7oe98455wh7drtbrxkkuj3hqr3e\",\"aijmqfdwxp7d7mj14o3ueuhbhha\",\"7abtt31h8ojfstkz3uzxejgcq9e\",\"7z56arow18jdw7deb6jkusbymga\",\"75m4ipoxsuibdxgf6z6cbxio4zh\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"b1abafbf-a038-4a19-8b68-56e0fd2319f7\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed\"}}',1675955583613,1675955583613,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('cf33otfdy33nfpg9xg5c5ftdp3a','2023-02-09 15:13:10.896715','bh4pkixqsjift58e1qy6htrgeay',1,'card','Richard Parsons','{\"contentOrder\":[\"aobnpxchj3jgyxy6joc3yefpcdy\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"a7yq89whddzob1futao4rxk3yzc\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"richard.parsons@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1671019200000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"a1sxagjgaadym5yrjak6tcup1oa\"}}',1675955590891,1675955590891,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('cf75w38ufx7nmukby5irgojbskw','2023-02-09 15:13:12.309391','bui5izho7dtn77xg3thkiqprc9r',1,'card','Import / Export','{\"contentOrder\":[\"ahaqysju1yj8jjnwzycyeyysmuc\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955592299,1675955592299,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('cf84s7zu18jbeud54uwzam8qwpo','2023-02-09 15:13:10.202685','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Global templates','{\"contentOrder\":[\"ax115hmekot8jupz7ewgqywi6so\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"a6ghze4iy441qhsh3eijnc8hwze\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"2\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955590196,1675955590196,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('cfxrcmsqwtb8ejdae9pcenmh9mw','2023-02-09 15:13:06.898510','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Pay bills','{\"contentOrder\":[\"74nkkz6zcgjrmffrb81edxjszke\",\"7whfs7b1kyb8cmy4j6588inr99y\",\"74krinybrui8z9rgw5tg71zwkjo\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"aj4jyekqqssatjcq7r7chmy19ey\",\"abthng7baedhhtrwsdodeuincqy\":\"true\"}}',1675955586893,1675955586892,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('cg137mjnyipg9myrygzh41x45gc','2023-02-09 15:13:13.296787','buixxjic3xjfkieees4iafdrznc',1,'card','Create your own board','{\"contentOrder\":[\"ap6pw4f666id75r56b7uxutop4y\",\"azmdzad8u8jboxka8c4ns1jorqw\",\"7r9my1yuddbn45dojrfht3neg8c\",\"7eir5gdjxgjbsxpbyp3df4npcze\",\"7qacsxadf1bde8r5fdniorab7ge\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-boards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675955593291,1675955593291,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('cg46r9od7rf8ipr5139ydfieu8y','2023-02-09 15:13:10.118276','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Horizontal scroll issue','{\"contentOrder\":[\"ahsudf7h5qt87dm59owgpnf14jr\",\"aizi5qcgx8bbc9fsx1f7t73d5do\",\"73c8tujmzdjywtqz8ff6akofquw\"],\"icon\":\"〰️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"1\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955590112,1675955590112,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('chdoctirc6ig39nbq17xhhgsdew','2023-02-09 15:13:03.606806','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Offsite plans','{\"contentOrder\":[\"akmg5iau977bqfxjmob8mq9ts3o\",\"7fskgnngriig4mmzps38rb5od6r\",\"aqz87s9n9o7gcjchd8ahiwgrtya\",\"7nqfotfzk33rc9nkmqomrfkd6ue\",\"7pdzn5d5xjjy33juafyfrus9are\",\"7gbhpcbahobrs9bb7985rb5rnje\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"8b05c83e-a44a-4d04-831e-97f01d8e2003\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"dabadd9b-adf1-4d9f-8702-805ac6cef602\"}}',1675955583600,1675955583600,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('chnnww5gm138xjpobgmcnbqyspw','2023-02-09 15:13:12.292885','bui5izho7dtn77xg3thkiqprc9r',1,'card','Standard templates','{\"contentOrder\":[\"7uonmjk41nipnrsi6tz8wau5ssh\",\"a5amnooqcz7gy7yjd19dh3449ny\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955592286,1675955592286,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('chpcf3jedh7n95yo63snp4wrnbr','2023-02-09 15:13:09.922929','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Learn to paint','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"77c539af-309c-4db1-8329-d20ef7e9eacd\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"9a090e33-b110-4268-8909-132c5002c90e\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"3245a32d-f688-463b-87f4-8e7142c1b397\"}}',1675955589917,1675955589917,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('chqd96dxi7jf3me4zd3c8na77ua','2023-02-09 15:13:10.164828','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Bug','{\"contentOrder\":[\"amgk6gg4axfr5dmmid37qinmohh\",\"auewq49obsbboumrqbf36xh3pya\",\"74qqg3xc8xt8n3b5c9jxrzf9zwc\"],\"icon\":\"?\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675955590159,1675955590159,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('chz4o8wszhjyutfqmzrmhcbbc9r','2023-02-09 15:13:09.934324','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Open retirement account','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"80be816c-fc7a-4928-8489-8b02180f4954\"}}',1675955589929,1675955589929,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('cihn9mny6tbf3pbqa5kzqy3mhrr','2023-02-09 15:13:09.671430','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Hit company global sales target','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a6robxx81diugpjq5jkezz3j1fo\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"15%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"50MM\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"awfu37js3fomfkkczm1zppac57a\",\"azqnyswk6s1boiwuthscm78qwuo\":\"7.5MM\",\"azzbawji5bksj69sekcs4srm1ky\":\"agrfeaoj7d8p5ianw5iaf3191ae\"}}',1675955589666,1675955589666,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('cikexdprbgb8ouynr5fmyimugwo','2023-02-09 15:13:08.445837','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Conduct market analysis','{\"contentOrder\":[\"ar4eie8yh8pgymkxy34hp3phuch\",\"7zas7gqctb3gxtm9ur6n7h3b1ah\",\"azksjrk8eti8nbqpdtwfzdew91a\",\"78mh743bik3g1temrf9qmz78n7a\",\"713gcs33jf3bpzgk9pfb3xkqcrw\",\"7nu7wk7cem78ypk7tcime36ghpc\",\"7fknjncjw978kzjmsau1j6wxftw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"40\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"87f59784-b859-4c24-8ebe-17c766e081dd\"}}',1675955588438,1675955588438,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('cix88w1wqzjfb8gccg6ajrsr5th','2023-02-09 15:13:08.432605','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Project budget approval','{\"contentOrder\":[\"atw666atbn3848m58coybbxssdw\",\"77teehuznqigd7ftbyqpys3m46y\",\"anrds5daywjyhmmawh6piy9mw6h\",\"7kbs6muxmibymjenhatf9fycyse\",\"7zpump4j4g7rkfgisdrcofz5b5r\",\"79pbspduwjjdwtfeh9m9htaqszr\",\"76j9579bkobdx9yffs8c36ajzto\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"16\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\"}}',1675955588426,1675955588426,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('ciz8686j1fiyhidmgri8ozp1c8c','2023-02-09 15:13:09.682662','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Increase user signups by 30%','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a6robxx81diugpjq5jkezz3j1fo\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"ao9b5pxyt7tkgdohzh9oaustdhr\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"0%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"1,000\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"0\",\"azzbawji5bksj69sekcs4srm1ky\":\"afkxpcjqjypu7hhar7banxau91h\"}}',1675955589677,1675955589677,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('cjdd8x6b5atn4jj77nopukkrhja','2023-02-09 15:13:12.071639','bsjd59qtpbf888mqez3ge77domw',1,'card','Team communication','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aq1dwbf661yx337hjcd5q3sbxwa\"}}',1675955592066,1675955592065,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('ck1fpxeqebtyb3mpdasdfubk68c','2023-02-09 15:13:09.649398','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Generate more Marketing Qualified Leads (MQLs)','{\"contentOrder\":[],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"a8nukezwwmknqwjsygg7eaxs9te\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"as555ipyzopjjpfb5rjtssecw5e\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"65%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"100\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"ahfbn1jsmhydym33ygxwg5jt3kh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"65\",\"azzbawji5bksj69sekcs4srm1ky\":\"aehoa17cz18rqnrf75g7dwhphpr\"}}',1675955589641,1675955589641,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('ck7c7denp7tg53xnt5oz7xw8hde','2023-02-09 15:13:10.214221','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Feature','{\"contentOrder\":[\"ahj5ij6oshidt78xu8e34s8zmjh\"],\"icon\":\"?️\",\"isTemplate\":true,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\"}}',1675955590208,1675955590208,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ckebmbmaycbrqbnot866fk7ij7y','2023-02-09 15:13:08.408089','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Define project scope','{\"contentOrder\":[\"afsw7hyn5xpncffxn9yn5e4qbna\",\"7tf43bs64ipnwjdocnawsd3depy\",\"ap1w3ix4qybrzpbp5yi4a79p8te\",\"7q933hz9op7ycuf8iywr84t3o5r\",\"7tydudw9j4ibpmgy8bqp7egndro\",\"75yipdr6tgireprzzk9yk5866nc\",\"7daynwntzrtfd7muqo8ow9jhh3e\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"32\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"87f59784-b859-4c24-8ebe-17c766e081dd\"}}',1675955588402,1675955588402,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('cmb3x9uyadt8yunxp8uose619qo','2023-02-09 15:13:12.106587','bsjd59qtpbf888mqez3ge77domw',1,'card','Positive user feedback','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"aq1dwbf661yx337hjcd5q3sbxwa\"}}',1675955592100,1675955592099,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('cmz9qxykqgpdyxf9j5axmwejt1e','2023-02-09 15:13:10.129935','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Login screen not loading','{\"contentOrder\":[\"aupenqk7botbjzen4dn9ue1wfpr\",\"amp6pbkxejbyhxywexbk8ftfdth\",\"7ychgwnpe6p8x9qqubki3dukuny\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"aomnawq4551cbbzha9gxnmb3z5w\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"abrfos7e7eczk9rqw6y5abadm1y\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"1\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\"}}',1675955590124,1675955590124,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('cmzq3bnpxmt8f3k34pnjycidkzh','2023-02-09 15:13:11.522832','brs9cdimfw7fodyi7erqt747rhc',1,'card','New Project and Workflow Management Solutions for Developers','{\"contentOrder\":[\"71qhnzuec6esdi6fnynwpze4xya\",\"a3m9cwtsqr3bd5q1seams43jwje\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1645790400000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a8xceonxiu4n3c43szhskqizicr\",\"a3pdzi53kpbd4okzdkz6khi87zo\",\"a3d9ux4fmi3anyd11kyipfbhwde\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"awna1nuarjca99m9s4uiy9kwj5h\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://mattermost.com/newsroom/press-releases/mattermost-launches-new-project-and-workflow-management-solutions-for-developers/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"aywiofmmtd3ofgzj95ysky4pjga\"}}',1675955591517,1675955591516,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('cn3cj63de9t81jdceapfgdtqhcy','2023-02-09 15:13:13.379800','buixxjic3xjfkieees4iafdrznc',1,'card','@mention teammates','{\"contentOrder\":[\"aue5actny978cmg85oyjyxqtcre\",\"a5e44frgpzj8ozmoxn8cu7x8uoh\",\"7mbw9t71hjbrydgzgkqqaoh8usr\",\"73k1zgokp5tn1fyxjuhapq4464h\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/work-with-cards.html#mention-people\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675955593373,1675955593373,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('cnogc7s1x13bgmjz456dudb85py','2023-02-09 15:13:06.921614','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Go for a walk','{\"contentOrder\":[\"ac3qw7f339fy75gquwsqby3z8kr\",\"acciczh6eo7rs8cyrqm5ffko16r\",\"746wb7e7yejywmcd7ty5szxzhay\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"an51dnkenmoog9cetapbc4uyt3y\"}}',1675955586916,1675955586916,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('cnq9ritr7t7nomyupipc9j7dbde','2023-02-09 15:13:03.592903','b7wnw9awd4pnefryhq51apbzb4c',1,'card','Video production','{\"contentOrder\":[\"ayhpkueiieirsmbm5zeejtfmite\",\"7hxggh6364iy6tmgdsbzms4w5ch\",\"ant34hxkckfnffjs4cu97gwry7a\",\"7mpepf7wxobbidpyxi9ijubzhrc\",\"779wdqq3wop86tet8akjqpqmrqa\",\"77o8djgrjftyoi8incgsp34d3xo\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"4cf1568d-530f-4028-8ffd-bdc65249187e\":\"b1abafbf-a038-4a19-8b68-56e0fd2319f7\",\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\":\"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\"}}',1675955583585,1675955583585,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('cnzbty5iahbdh9nf4p6ng1mnfxh','2023-02-09 15:13:13.308517','buixxjic3xjfkieees4iafdrznc',1,'card','Share a board','{\"contentOrder\":[\"amh8jwmku4pd78e3kytbzekmeac\",\"a9iqt7u3xffb8zjnbcr4bxhywuc\",\"7r7asyew8d7fyunf4sow8e5iyoc\",\"ad8j3n8tp77bppee3ipjt6odgpe\",\"7w935usqt6pby8qz9x5pxaj7iow\",\"7ogbs8h6q4j8z7ngy1m7eag63nw\",\"7z1jau5qy3jfcxdp5cgq3duk6ne\",\"78gu3eap8diyk3q98psfyfg43yw\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/sharing-boards.html\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675955593302,1675955593302,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('coi789ctpa3n5bpqsgc1jcswqso','2023-02-09 15:13:13.319988','buixxjic3xjfkieees4iafdrznc',1,'card','Create a new card','{\"contentOrder\":[\"am97jryax1iro7n85jroh8778yw\",\"adhsx4h5ss7rqdcjt8xyam6xtqc\",\"aeugpze8spbf4xq6ce5ahutzagc\",\"7me9p46gbqiyfmfnapi7dyxb5br\",\"7ijfsqoy7mbnttp5gtj9qszbkje\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#adding-cards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"amm6wfhnbuxojwssyftgs9dipqe\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aanaehcw3m13jytujsjk5hpf6ry\"}}',1675955593314,1675955593314,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('cp8xyhyy85tgq3c6jgqmhdz3ree','2023-02-09 15:13:11.280346','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Afformance Ltd.','{\"contentOrder\":[\"axskm1c8n4inbfc56m6737xncza\"],\"icon\":\"⚡\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"arfjpz9by5car71tz3behba8yih\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"1,800\",\"ahzspe59iux8wigra8bg6cg18nc\":\"afformanceltd.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$200,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2002\",\"aozntq4go4nkab688j1s7stqtfc\":\"Palo Alto, CA\"}}',1675955591272,1675955591272,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('cpeyrctcb77yb3jf38m9fo9hmnw','2023-02-09 15:13:09.900461','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Start a daily journal','{\"contentOrder\":[],\"icon\":\"✍️\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"3245a32d-f688-463b-87f4-8e7142c1b397\"}}',1675955589894,1675955589894,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('cpf3yt33tffrmupsismb1jhymry','2023-02-09 15:13:12.060075','bsjd59qtpbf888mqez3ge77domw',1,'card','Tight deadline','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"adjckpdotpgkz7c6wixzw9ipb1e\":\"ar87yh5xmsswqkxmjq1ipfftfpc\"}}',1675955592054,1675955592054,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('cq9nnxgdcwfd88djwnyt88t4uuh','2023-02-09 15:13:11.535243','brs9cdimfw7fodyi7erqt747rhc',1,'card','[Tweet] Mattermost v6.1 includes card @-mention notifications in Boards','{\"contentOrder\":[\"7i96m7nbsdsex8n6hzuzrmdfjuy\",\"7ed5bwp3gr8yax3mhtuwiaa9gjy\",\"afpgs6xraqjyuuf4zhy7fsio4ur\",\"agawe389ja7ykfmnmjetbxkto9w\",\"abdasiyq4k7ndtfrdadrias8sjy\",\"7zkd1rzi4ibnb9n57hyq97azc6e\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1639051200000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"az8o8pfe9hq6s7xaehoqyc3wpyc\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"a9ana1e9w673o5cp8md4xjjwfto\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1637668800000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://twitter.com/Mattermost/status/1463145633162969097?s=20\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"aj8y675weso8kpb6eceqbpj4ruw\"}}',1675955591529,1675955591529,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('cqangpbz5c3rpfefzdbe4totwnc','2023-02-09 15:13:12.279352','bui5izho7dtn77xg3thkiqprc9r',1,'card','Calendar view','{\"contentOrder\":[\"7df11783ny67mdnognqae31ax6y\",\"agbfxbbe1qpbtzghib1xffspybo\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"6eea96c9-4c61-4968-8554-4b7537e8f748\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"849766ba-56a5-48d1-886f-21672f415395\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"https://mattermost.com/boards/\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955592272,1675955592272,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('cqjjdicpjo3dq5qb16zfg4sqy9e','2023-02-09 15:13:09.705157','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Launch 3 key features','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"apnt1f7na9rzgk1rt49keg7xbiy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"ao9b5pxyt7tkgdohzh9oaustdhr\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a8zg3rjtf4swh7smsjxpsn743rh\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"33%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"3\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"anruuoyez51r3yjxuoc8zoqnwaw\",\"azqnyswk6s1boiwuthscm78qwuo\":\"1\",\"azzbawji5bksj69sekcs4srm1ky\":\"aw5i7hmpadn6mbwbz955ubarhme\"}}',1675955589699,1675955589699,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('cqz8jga9oiibfpgrz3k7omk9u6r','2023-02-09 15:13:04.591371','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Jonathan Frazier','{\"contentOrder\":[\"acjrasnxctirofjybch3qr3dcha\",\"azj1msd6fjt8wddpy3gms8ka19h\",\"7m4mrkfifhbyrtch3erzptz97fr\",\"7cg6kk14tapf7mxuh899fhqu1gr\",\"79tzorr1j3if45qtmqeu64ow4dc\",\"7rwguisc183gmzeb1wcc47zp1zr\",\"7eiph4pj85pnpjkf9n7osnbzw4o\",\"79icsf954fi81bqybb4xjr6bgmc\",\"79onrnkio4jn9ipmgwk1pfz1eze\",\"73kmx8c9hhj8ubyif78mbbgdy1w\",\"7gzup5jwux3nu3qg81q38u4fiec\",\"7xecy5bwnptf6fgpkfbaetwam9r\"],\"icon\":\"?‍♂️\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(999) 123-5678\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"a5txuiubumsmrs8gsd5jz5gc1oa\",\"abru6tz8uebdxy4skheqidh7zxy\":\"jonathan.frazier@email.com\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"0%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$800,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Ositions Inc.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"as5bk6afoaaa7caewe1zc391sce\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apiswzj7uiwbh87z8dw8c6mturw\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1669118400000}\"}}',1675955584584,1675955584584,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('crmtkd3pua38h5ysmxcjr5hw88o','2023-02-09 15:13:06.932977','bbn1888mprfrm5fjw9f1je9x3xo',1,'card','Feed Fluffy','{\"contentOrder\":[\"a7fm9z5ztp3fo7bt3g78iermp3h\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a9zf59u8x1rf4ywctpcqama7tio\":\"an51dnkenmoog9cetapbc4uyt3y\"}}',1675955586927,1675955586927,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('cskmj8hxihj8gtdrusqkoxw9ruw','2023-02-09 15:13:10.920655','bh4pkixqsjift58e1qy6htrgeay',1,'card','Olivia Alsop','{\"contentOrder\":[\"aur9jj4ywcpbm3yn3kc341xcmew\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"aaebj5fyx493eezx6ukxiwydgty\":\"a7yq89whddzob1futao4rxk3yzc\",\"acjq4t5ymytu8x1f68wkggm7ypc\":\"olivia.alsop@email.com\",\"aify3r761b9w43bqjtskrzi68tr\":\"Password123\",\"akrxgi7p7w14fym3gbynb98t9fh\":\"{\\\"from\\\":1671192000000}\",\"aqafzdeekpyncwz7m7i54q3iqqy\":\"https://user-images.githubusercontent.com/46905241/121941290-ee355280-cd03-11eb-9b9f-f6f524e4103e.gif\",\"atg9qu6oe4bjm8jczzsn71ff5me\":\"a1sxagjgaadym5yrjak6tcup1oa\"}}',1675955590915,1675955590914,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('cstu6h6hfcfd59yc4qwd4pd3i4o','2023-02-09 15:13:10.141977','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Move cards across boards','{\"contentOrder\":[\"asgkpsgg3qfyaifjb1n6c7qowzh\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"abrfos7e7eczk9rqw6y5abadm1y\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"2\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955590136,1675955590136,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('ct9j46agym7fh3e8o3a9zmjiaya','2023-02-09 15:13:09.911366','bd65qbzuqupfztpg31dgwgwm5ga',1,'card','Run 3 times a week','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\":\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\":\"6e7139e4-5358-46bb-8c01-7b029a57b80a\",\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\":\"ffb3f951-b47f-413b-8f1d-238666728008\"}}',1675955589905,1675955589905,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('ctcfiuyp4n78h9ef5jt9nu7mgze','2023-02-09 15:13:09.716891','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Reduce bug backlog by 50%','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"abzfwnn6rmtfzyq5hg8uqmpsncy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"apqfjst8massbjjhpcsjs3y1yqa\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a1ts3ftyr8nocsicui98c89uxjy\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"100%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"75\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"awfu37js3fomfkkczm1zppac57a\",\"azqnyswk6s1boiwuthscm78qwuo\":\"75\",\"azzbawji5bksj69sekcs4srm1ky\":\"aw5i7hmpadn6mbwbz955ubarhme\"}}',1675955589711,1675955589711,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('ctyi7g1r847rfteynz1fjqk8hmr','2023-02-09 15:13:08.396009','bc41mwxg9ybb69pn9j5zna6d36c',1,'card','Identify dependencies','{\"contentOrder\":[\"apowhzozrbty6xjowzi3by71iqa\",\"7at5hq148mfd1ueddegye8p3gsc\",\"a4je4p13yqjf6pcizp6hc1zb9ay\",\"76feihzqhofn6tc8kdsn3gsutjy\",\"73hp6ecz38in6z8u19qcb3asrkw\",\"719rhgqi9otgk8dpj3sibdwes9h\",\"7go8ujqeusjgbmg7bgynkbm343r\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"16\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ayz81h9f3dwp7rzzbdebesc7ute\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\":\"98a57627-0f76-471d-850d-91f3ed9fd213\"}}',1675955588390,1675955588389,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('cu91ugd56rirqxyupgjwozoi7tr','2023-02-09 15:13:11.233493','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Liminary Corp.','{\"contentOrder\":[\"aq3fh99xz5iro3fnm5opwh5n3tc\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abt79uxg5edqojsrrefcnr4eruo\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"300\",\"ahzspe59iux8wigra8bg6cg18nc\":\"liminarycorp.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$25,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2017\",\"aozntq4go4nkab688j1s7stqtfc\":\"Toronto, Canada\"}}',1675955591227,1675955591227,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('cux6yuab9k3drtps9dr6su8xjuo','2023-02-09 15:13:09.693814','bcm39o11e4ib8tye8mt6iyuec9o',1,'card','Add 10 new customers in the EU','{\"contentOrder\":[],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a17ryhi1jfsboxkwkztwawhmsxe\":\"apnt1f7na9rzgk1rt49keg7xbiy\",\"a6amddgmrzakw66cidqzgk6p4ge\":\"auw3afh3kfhrfgmjr8muiz137jy\",\"adp5ft3kgz7r5iqq3tnwg551der\":\"a1ts3ftyr8nocsicui98c89uxjy\",\"ahz3fmjnaguec8hce7xq3h5cjdr\":\"30%\",\"ajwxp866f9obs1kutfwaa5ru7fe\":\"10\",\"aqxyzkdrs4egqf7yk866ixkaojc\":\"acb6dqqs6yson7bbzx6jk9bghjh\",\"azqnyswk6s1boiwuthscm78qwuo\":\"3\",\"azzbawji5bksj69sekcs4srm1ky\":\"agrfeaoj7d8p5ianw5iaf3191ae\"}}',1675955589688,1675955589688,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('cuxggn3p3kjf4upaaywym3xm59c','2023-02-09 15:13:11.546973','brs9cdimfw7fodyi7erqt747rhc',1,'card','Top 10 Must-Have DevOps Tools in 2021','{\"contentOrder\":[\"7fo1utqc8x1z1z6hzg33hes1ktc\",\"aqhufq7p6uinm98td11ayxurabw\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"a39x5cybshwrbjpc3juaakcyj6e\":\"{\\\"from\\\":1636113600000}\",\"ab6mbock6styfe6htf815ph1mhw\":[\"a8xceonxiu4n3c43szhskqizicr\"],\"ae9ar615xoknd8hw8py7mbyr7zo\":\"a9ana1e9w673o5cp8md4xjjwfto\",\"agqsoiipowmnu9rdwxm57zrehtr\":\"{\\\"from\\\":1637323200000}\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\":\"https://www.toolbox.com/tech/devops/articles/best-devops-tools/\",\"aysx3atqexotgwp5kx6h5i5ancw\":\"a3xky7ygn14osr1mokerbfah5cy\"}}',1675955591541,1675955591541,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('cw85ce7jszt8ufcdo44ay1buega','2023-02-09 15:13:10.178199','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Standard properties','{\"contentOrder\":[\"awigum1hx6ige8rfzhpmcmrkmhy\"],\"icon\":\"?️\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"a5yxq8rbubrpnoommfwqmty138h\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"e6a7f297-4440-4783-8ab3-3af5ba62ca11\"}}',1675955590171,1675955590171,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('cxjttr33wdbyqifk6j159j45ody','2023-02-09 15:13:04.616465','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Byron Cole','{\"contentOrder\":[\"az1eoncet73ni3dco91wjo1pwba\",\"anqhq6hzz6jn1ffwxxnsxn9uudy\",\"7jck4rzdb3jfzmpbn6nofzdtzyy\",\"7686cyfw5wpd8mc7exp6wmsnt8y\",\"7maefej36gt8pt85twg464jtu1o\",\"7ditit61ok3813rxkhhr1bqcz3o\",\"7p1e6xnjebtyztqxe65p4bie77o\",\"7tbdcr6rhutbf7dst5nkzyo7mrh\",\"7efsjhctpz7bqifds3q6fkwnfzh\",\"7ojbrfnqjofnmtx7tzbo96xrowr\",\"7s8ppoa9s778dib5ztgez9daroh\",\"7qwh7i5bb8t8w8yyxogqs4bapya\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(333) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"acm9q494bcthyoqzmfogxxy5czy\",\"abru6tz8uebdxy4skheqidh7zxy\":\"byron.cole@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1667563200000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"100%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$500,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Helx Industries\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"aafwyza5iwdcwcyfyj6bp7emufw\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apjnaggwixchfxwiatfh7ey7uno\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1667822400000}\"}}',1675955584610,1675955584610,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('cyhm5hrnra781bpeatqyygemgah','2023-02-09 15:13:11.266792','bkqk6hpfx7pbsucue7jan5n1o1o',1,'card','Ositions Inc.','{\"contentOrder\":[\"ach1ouji393na7cfh4ozzjb7teo\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a1semdhszu1rq17d7et5ydrqqio\":\"abajmr34b8g1916w495xjb35iko\",\"a6cwaq79b1pdpb97wkanmeyy4er\":\"2,700\",\"ahzspe59iux8wigra8bg6cg18nc\":\"ositionsinc.com\",\"aiefo7nh9jwisn8b4cgakowithy\":\"$125,000,000\",\"an1eerzscfxn6awdfajbg41uz3h\":\"2004\",\"aozntq4go4nkab688j1s7stqtfc\":\"Berlin, Germany\"}}',1675955591261,1675955591261,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('czbk3bqy8k3yjde4fnu9o8ircby','2023-02-09 15:13:13.272786','buixxjic3xjfkieees4iafdrznc',1,'card','Drag cards','{\"contentOrder\":[\"apktbgtee5jb8xrnqy3ibiujxew\",\"ajmhitsxxbfrb3mrewrxm1st15c\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"a4nfnb5xr3txr5xq7y9ho7kyz6c\":\"https://docs.mattermost.com/boards/working-with-boards.html#dragging-cards\",\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":\"ajurey3xkocs1nwx8di5zx6oe7o\",\"acypkejeb5yfujhj9te57p9kaxw\":\"aq6ukoiciyfctgwyhwzpfss8ghe\"}}',1675955593266,1675955593266,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('czf1skn1natn3ppzqqqf5kc3bgr','2023-02-09 15:13:10.153729','bgi1yqiis8t8xdqxgnet8ebutky',1,'card','Cross-team collaboration','{\"contentOrder\":[\"ayqbm41jf87b7f8ci34p3misikh\"],\"icon\":\"?\",\"isTemplate\":false,\"properties\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"50117d52-bcc7-4750-82aa-831a351c44a0\":\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"60985f46-3e41-486e-8213-2b987440ea1c\":\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"a1g6i613dpe9oryeo71ex3c86hy\":\"https://mattermost.com/boards/\",\"ai7ajsdk14w7x5s8up3dwir77te\":\"3\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":\"c62172ea-5da7-4dec-8186-37267d8ee9a7\"}}',1675955590148,1675955590148,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('czo1hzhtwgbg3tde9scsbn9ogbc','2023-02-09 15:13:04.603542','bbkpwdj8x17bdpdqd176n8ctoua',1,'card','Richard Guzman','{\"contentOrder\":[\"ahmoo614kjty4iqp164y6bmtygc\",\"apr37rx4thtfm8d8z39k7ufxqew\",\"716g47bgjq3fubxkq8ei4sdoxer\",\"73fxjs7dmjjnixx3yb83d5bxf3e\",\"7zafpkhuoipfatyn4quyp5ho54e\",\"7owb1aajjdi8e8mwqq3d11dgama\",\"74873uaoxs3fm3eg14qyw38m7ah\",\"7tr7zu89w9frr3ninfpmxnri37c\",\"7i986n3un6t8kmet7t7g8ax1h8r\",\"7wtd46dn8qjy9xpq6mpo48k6cwo\",\"7k1rumqtdqbbsmxzmw7p1juk4ur\",\"7hasspemw6fftdj5n7rtgu73kme\"],\"icon\":\"?‍?\",\"isTemplate\":false,\"properties\":{\"a1438fbbhjeffkexmcfhnx99o1h\":\"(222) 123-1234\",\"a5hwxjsmkn6bak6r7uea5bx1kwc\":\"axesd74yuxtbmw1sbk8ufax7z3a\",\"abru6tz8uebdxy4skheqidh7zxy\":\"richard.guzman@email.com\",\"adtf1151chornmihz4xbgbk9exa\":\"{\\\"from\\\":1681992000000}\",\"aejo5tcmq54bauuueem9wc4fw4y\":\"80%\",\"ahf43e44h3y8ftanqgzno9z7q7w\":\"$3,200,000\",\"ainpw47babwkpyj77ic4b9zq9xr\":\"Afformance Ltd.\",\"amahgyn9n4twaapg3jyxb6y4jic\":\"ar6t1ttcumgfuqugg5o4g4mzrza\",\"aro91wme9kfaie5ceu9qasmtcnw\":\"apjnaggwixchfxwiatfh7ey7uno\",\"auhf91pm85f73swwidi4wid8jqe\":\"{\\\"from\\\":1667476800000}\"}}',1675955584597,1675955584597,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('v1h3ksgie13dr8xzdb3k1dn1c1h','2023-02-09 15:13:08.492661','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Task Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a3zsw7xs8sxy7atj8b6totp3mby\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955588486,1675955588486,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('v3q1cdyd397bdzygdzeq1daip1r','2023-02-09 15:13:12.394961','bui5izho7dtn77xg3thkiqprc9r',1,'view','Board: Status','{\"cardOrder\":[\"cemryxdyma7r9pek7nrua5mkcga\",\"cm4w7cc3aac6s9jdcujbs4j8f4r\",\"c6egh6cpnj137ixdoitsoxq17oo\",\"cct9u78utsdyotmejbmwwg66ihr\",\"cmft87it1q7yebbd51ij9k65xbw\",\"c9fe77j9qcruxf4itzib7ag6f1c\",\"coup7afjknqnzbdwghiwbsq541w\",\"c5ex1hndz8qyc8gx6ofbfeksftc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\",\"ec6d2bc5-df2b-4f77-8479-e59ceb039946\",\"849766ba-56a5-48d1-886f-21672f415395\",\"\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955592388,1675955592388,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('v3rk4y8387jbticpomjxwnoj4ww','2023-02-09 15:13:04.576875','',1,'view','Pipeline Tracker','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"aic89a5xox4wbppi6mbyx6ujsda\",\"ah6ehh43rwj88jy4awensin8pcw\",\"aprhd96zwi34o9cs4xyr3o9sf3c\",\"axesd74yuxtbmw1sbk8ufax7z3a\",\"a5txuiubumsmrs8gsd5jz5gc1oa\",\"acm9q494bcthyoqzmfogxxy5czy\"],\"visiblePropertyIds\":[\"aro91wme9kfaie5ceu9qasmtcnw\",\"amahgyn9n4twaapg3jyxb6y4jic\"]}',1675955584570,1675955584570,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('v57ftqfq63prp3b39dwmc651p1r','2023-02-09 15:13:12.353658','bui5izho7dtn77xg3thkiqprc9r',1,'view','Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a4378omyhmgj3bex13sj4wbpfiy\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955592346,1675955592346,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('v5ej5sfnztpnrirb5z6ykpb6ibo','2023-02-09 15:13:10.943994','bh4pkixqsjift58e1qy6htrgeay',1,'view','By Date','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"akrxgi7p7w14fym3gbynb98t9fh\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955590938,1675955590938,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('v6kujqkcy7f8piqcrtza4idxjkr','2023-02-09 15:13:11.570302','brs9cdimfw7fodyi7erqt747rhc',1,'view','By Status','{\"cardOrder\":[null,\"cdbfkd15d6iy18rgx1tskmfsr6c\",\"cn8yofg9rtkgmzgmb5xdi56p3ic\",\"csgsnnywpuqzs5jgq87snk9x17e\",\"cqwaytore5y487wdu8zffppqnea\",null],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"awna1nuarjca99m9s4uiy9kwj5h\",\"a9ana1e9w673o5cp8md4xjjwfto\",\"apy9dcd7zmand615p3h53zjqxjh\",\"acri4cm3bmay55f7ksztphmtnga\",\"amsowcd9a8e1kid317r7ttw6uzh\",\"\"],\"visiblePropertyIds\":[\"ab6mbock6styfe6htf815ph1mhw\"]}',1675955591564,1675955591564,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('v7q55a6grpig63pz88zumq171fe','2023-02-09 15:13:08.468988','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Progress Tracker','{\"cardOrder\":[\"cix88w1wqzjfb8gccg6ajrsr5th\",\"cbb5bnkayt3d8fdagwyexka6y5a\",\"ctyi7g1r847rfteynz1fjqk8hmr\",\"cikexdprbgb8ouynr5fmyimugwo\",\"ckebmbmaycbrqbnot866fk7ij7y\",\"coxnjt3ro1in19dd1e3awdt338r\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{\"\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"adeo5xuwne3qjue83fcozekz8ko\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"afi4o5nhnqc3smtzs1hs3ij34dh\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ahpyxfnnrzynsw3im1psxpkgtpe\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ar6b8m3jxr3asyxhr8iucdbo6yc\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"ayz81h9f3dwp7rzzbdebesc7ute\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"}},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"ayz81h9f3dwp7rzzbdebesc7ute\",\"ar6b8m3jxr3asyxhr8iucdbo6yc\",\"afi4o5nhnqc3smtzs1hs3ij34dh\",\"adeo5xuwne3qjue83fcozekz8ko\",\"ahpyxfnnrzynsw3im1psxpkgtpe\",\"\"],\"visiblePropertyIds\":[\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675955588463,1675955588463,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('v87yj5fi9x3df7nixwmki57jxke','2023-02-09 15:13:10.955331','bixohg18tt11in4qbtinimk974y',1,'view','By Status','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"af6hjb3ysuaxbwnfqpby4wwnkdr\",\"aotxum1p5bw3xuzqz3ctjw66yww\",\"a7yq89whddzob1futao4rxk3yzc\",\"aseqq9hrsua56r3s6nbuirj9eec\",\"ap93ysuzy1xa7z818r6myrn4h4y\"],\"visiblePropertyIds\":[]}',1675955590949,1675955590949,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('v9cag9wub3jbdddgftbjjgxya1w','2023-02-09 15:13:13.430734','buixxjic3xjfkieees4iafdrznc',1,'view','Onboarding','{\"cardOrder\":[\"coi789ctpa3n5bpqsgc1jcswqso\",\"cebwuam6qgbb65qki6xx8rcuoph\",\"cg137mjnyipg9myrygzh41x45gc\",\"canoq7x74h7nt3yppsi18j496rc\",\"c3zsx74nrcpys8g3r5xfgknthmr\",\"cd8rx6nwwe38u3eebjefozn3xse\",\"cn3cj63de9t81jdceapfgdtqhcy\",\"czbk3bqy8k3yjde4fnu9o8ircby\",\"cnzbty5iahbdh9nf4p6ng1mnfxh\",\"c68ftccp7c3r69bhh5s9p6jxycy\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aqb5x3pt87dcc9stbk4ofodrpoy\",\"a1mtm777bkagq3iuu7xo9b13qfr\",\"auxbwzptiqzkii5r61uz3ndsy1r\",\"aj9386k1bx8qwmepeuxg3b7z4pw\"],\"visiblePropertyIds\":[]}',1675955593425,1675955593425,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('v9jmhicsnx7noiksf1774qoqr1y','2023-02-09 15:13:03.632082','b7wnw9awd4pnefryhq51apbzb4c',1,'view','Discussion Items','{\"cardOrder\":[\"cjpkiya33qsagr4f9hrdwhgiajc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d777ba3b-8728-40d1-87a6-59406bbbbfb0\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"4cf1568d-530f-4028-8ffd-bdc65249187e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"4cf1568d-530f-4028-8ffd-bdc65249187e\"]}',1675955583626,1675955583625,0,NULL,'system','','system','boegirwoddb8ojrr19gnf8dwotr'),('vbb6n3631kfy9fkr9r39q5un1ey','2023-02-09 15:13:13.403168','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"acmg7mz1rr1eykfug4hcdpb1y1o\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955593397,1675955593397,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('vbhk6qjmoutndbnc3ufci6kcwzy','2023-02-09 15:13:04.563148','',1,'view','All Contacts','{\"cardOrder\":[\"c9rpp4fsq4fyazjnrufq9p197nr\",\"cb86yg4ppqbgrdktqg8hg3koqjh\",\"czo1hzhtwgbg3tde9scsbn9ogbc\",\"cqz8jga9oiibfpgrz3k7omk9u6r\",\"cxjttr33wdbyqifk6j159j45ody\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":240,\"a1438fbbhjeffkexmcfhnx99o1h\":151,\"a5hwxjsmkn6bak6r7uea5bx1kwc\":132,\"abru6tz8uebdxy4skheqidh7zxy\":247,\"adtf1151chornmihz4xbgbk9exa\":125,\"aejo5tcmq54bauuueem9wc4fw4y\":127,\"ahf43e44h3y8ftanqgzno9z7q7w\":129,\"ainpw47babwkpyj77ic4b9zq9xr\":157,\"amahgyn9n4twaapg3jyxb6y4jic\":224,\"amba7ot98fh7hwsx8jdcfst5g7h\":171,\"aoheuj1f3mu6eehygr45fxa144y\":130,\"auhf91pm85f73swwidi4wid8jqe\":157},\"defaultTemplateId\":\"cagbcg7m38jydjqx1cx34pg3mzr\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a5hwxjsmkn6bak6r7uea5bx1kwc\",\"aoheuj1f3mu6eehygr45fxa144y\",\"aro91wme9kfaie5ceu9qasmtcnw\",\"ainpw47babwkpyj77ic4b9zq9xr\",\"ahf43e44h3y8ftanqgzno9z7q7w\",\"amahgyn9n4twaapg3jyxb6y4jic\",\"abru6tz8uebdxy4skheqidh7zxy\",\"a1438fbbhjeffkexmcfhnx99o1h\",\"auhf91pm85f73swwidi4wid8jqe\",\"adtf1151chornmihz4xbgbk9exa\",\"aejo5tcmq54bauuueem9wc4fw4y\",\"amba7ot98fh7hwsx8jdcfst5g7h\"]}',1675955584557,1675955584557,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('vcz3ze78af7yd8xehda9gxs75tc','2023-02-09 15:13:08.480930','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Task Overview','{\"cardOrder\":[\"ckebmbmaycbrqbnot866fk7ij7y\",\"cikexdprbgb8ouynr5fmyimugwo\",\"ctyi7g1r847rfteynz1fjqk8hmr\",\"cix88w1wqzjfb8gccg6ajrsr5th\",\"cbb5bnkayt3d8fdagwyexka6y5a\",\"cz8p8gofakfby8kzz83j97db8ph\",\"ce1jm5q5i54enhuu4h3kkay1hcc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{\"a8daz81s4xjgke1ww6cwik5w7ye\":\"sum\"},\"columnWidths\":{\"2a5da320-735c-4093-8787-f56e15cdfeed\":196,\"__title\":280,\"a8daz81s4xjgke1ww6cwik5w7ye\":139,\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":141,\"d3d682bf-e074-49d9-8df5-7320921c2d23\":110},\"defaultTemplateId\":\"czw9es1e89fdpjr7cqptr1xq7qh\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"2a5da320-735c-4093-8787-f56e15cdfeed\",\"a3zsw7xs8sxy7atj8b6totp3mby\",\"axkhqa4jxr3jcqe4k87g8bhmary\",\"a7gdnz8ff8iyuqmzddjgmgo9ery\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675955588475,1675955588475,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('vfi944y169jruzmnmm896fhzgia','2023-02-09 15:13:11.221489','',1,'view','Market Position','{\"cardOrder\":[\"cip8b4jcomfr7by9gtizebikfke\",\"cacs91js1hb887ds41r6dwnd88c\",\"ca3u8edwrof89i8obxffnz4xw3a\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"arfjpz9by5car71tz3behba8yih\",\"abajmr34b8g1916w495xjb35iko\",\"abt79uxg5edqojsrrefcnr4eruo\",\"aipf3qfgjtkheiayjuxrxbpk9wa\"],\"visiblePropertyIds\":[]}',1675955591215,1675955591215,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('vfqczcm7ymfbd9c9iz7ba881zxc','2023-02-09 15:13:09.728545','bm4ubx56krp4zwyfcqh7nxiigbr',1,'view','Departments','{\"cardOrder\":[\"cpa534b5natgmunis8u1ixb55pw\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"azzbawji5bksj69sekcs4srm1ky\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aw5i7hmpadn6mbwbz955ubarhme\",\"afkxpcjqjypu7hhar7banxau91h\",\"aehoa17cz18rqnrf75g7dwhphpr\",\"agrfeaoj7d8p5ianw5iaf3191ae\",\"agm9p6gcq15ueuzqq3wd4be39wy\",\"aucop7kw6xwodcix6zzojhxih6r\",\"afust91f3g8ht368mkn5x9tgf1o\",\"acocxxwjurud1jixhp7nowdig7y\"],\"visiblePropertyIds\":[]}',1675955589723,1675955589723,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('vg6e9p4w7j7dr8r35dzd3p85auw','2023-02-09 15:13:10.240044','bgi1yqiis8t8xdqxgnet8ebutky',1,'view','By Type','{\"cardOrder\":[\"cmz9qxykqgpdyxf9j5axmwejt1e\",\"cstu6h6hfcfd59yc4qwd4pd3i4o\",\"cw85ce7jszt8ufcdo44ay1buega\",\"cg46r9od7rf8ipr5139ydfieu8y\",\"cf84s7zu18jbeud54uwzam8qwpo\",\"czf1skn1natn3ppzqqqf5kc3bgr\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"424ea5e3-9aa1-4075-8c5c-01b44b66e634\",\"a5yxq8rbubrpnoommfwqmty138h\",\"apht1nt5ryukdmxkh6fkfn6rgoy\",\"aiycbuo3dr5k4xxbfr7coem8ono\",\"aomnawq4551cbbzha9gxnmb3z5w\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955590232,1675955590232,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('virhpci4t33b5jmod5hzrm4ek1y','2023-02-09 15:13:11.603641','brs9cdimfw7fodyi7erqt747rhc',1,'view','Content List','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":322,\"ab6mbock6styfe6htf815ph1mhw\":229,\"aysx3atqexotgwp5kx6h5i5ancw\":208},\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"a39x5cybshwrbjpc3juaakcyj6e\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"ae9ar615xoknd8hw8py7mbyr7zo\",\"aysx3atqexotgwp5kx6h5i5ancw\",\"ab6mbock6styfe6htf815ph1mhw\",\"ao44fz8nf6z6tuj1x31t9yyehcc\",\"a39x5cybshwrbjpc3juaakcyj6e\",\"agqsoiipowmnu9rdwxm57zrehtr\",\"ap4e7kdg7eip7j3c3oyiz39eaoc\"]}',1675955591598,1675955591598,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('vj9uzmfjx5fyeipoi1mw7joeg7c','2023-02-09 15:13:13.417871','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Gallery View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"gallery\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955593409,1675955593409,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('vkfjmbgofn3rg5f33ogo7p874iy','2023-02-09 15:13:09.946207','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','By Status','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"af6fcbb8-ca56-4b73-83eb-37437b9a667d\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\",\"77c539af-309c-4db1-8329-d20ef7e9eacd\",\"98bdea27-0cce-4cde-8dc6-212add36e63a\",\"\"],\"visiblePropertyIds\":[\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\",\"d6b1249b-bc18-45fc-889e-bec48fce80ef\"]}',1675955589940,1675955589939,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('vkujgf83juinnxxwmyschb63cye','2023-02-09 15:13:09.625175','',1,'view','By Objectives','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":387,\"a17ryhi1jfsboxkwkztwawhmsxe\":134,\"a6amddgmrzakw66cidqzgk6p4ge\":183,\"aqxyzkdrs4egqf7yk866ixkaojc\":100},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a6amddgmrzakw66cidqzgk6p4ge\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a6amddgmrzakw66cidqzgk6p4ge\",\"a17ryhi1jfsboxkwkztwawhmsxe\",\"azzbawji5bksj69sekcs4srm1ky\",\"adp5ft3kgz7r5iqq3tnwg551der\",\"aqxyzkdrs4egqf7yk866ixkaojc\",\"adu6mebzpibq6mgcswk69xxmnqe\",\"asope3bddhm4gpsng5cfu4hf6rh\",\"ajwxp866f9obs1kutfwaa5ru7fe\",\"azqnyswk6s1boiwuthscm78qwuo\",\"ahz3fmjnaguec8hce7xq3h5cjdr\",\"a17bfcgnzmkwhziwa4tr38kiw5r\"]}',1675955589619,1675955589619,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy'),('vmn5bn4kbyb8tjm5aqy3pe9hgeo','2023-02-09 15:13:09.957797','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','Calendar View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"ajy6xbebzopojaenbnmfpgtdwso\",\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955589952,1675955589952,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('vmtpxaeb1gbdgjpu68n93nu41ow','2023-02-09 15:13:10.095087','',1,'view','By Sprint','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{\"ai7ajsdk14w7x5s8up3dwir77te\":\"count\"},\"columnWidths\":{\"20717ad3-5741-4416-83f1-6f133fff3d11\":128,\"50117d52-bcc7-4750-82aa-831a351c44a0\":126,\"__title\":280,\"a1g6i613dpe9oryeo71ex3c86hy\":159,\"aeomttrbhhsi8bph31jn84sto6h\":141,\"ax9f8so418s6s65hi5ympd93i6a\":183,\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\":100},\"defaultTemplateId\":\"ccxzm5dsu6tbbtyhgg31f4sec9y\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"60985f46-3e41-486e-8213-2b987440ea1c\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"aphg37f7zbpuc3bhwhp19s1ribh\",\"a4378omyhmgj3bex13sj4wbpfiy\",\"ai7ajsdk14w7x5s8up3dwir77te\",\"a1g6i613dpe9oryeo71ex3c86hy\",\"aeomttrbhhsi8bph31jn84sto6h\",\"ax9f8so418s6s65hi5ympd93i6a\"]}',1675955590089,1675955590089,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('vnn1xpem7djbqmcq9aa3gc8fube','2023-02-09 15:13:10.873557','',1,'view','All Users','{\"cardOrder\":[\"c3fdqgj8ut3r1iy8ugnsae7ncqy\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280,\"aaebj5fyx493eezx6ukxiwydgty\":146,\"acjq4t5ymytu8x1f68wkggm7ypc\":222,\"akrxgi7p7w14fym3gbynb98t9fh\":131,\"atg9qu6oe4bjm8jczzsn71ff5me\":131},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"akrxgi7p7w14fym3gbynb98t9fh\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"aaebj5fyx493eezx6ukxiwydgty\",\"akrxgi7p7w14fym3gbynb98t9fh\",\"atg9qu6oe4bjm8jczzsn71ff5me\",\"acjq4t5ymytu8x1f68wkggm7ypc\",\"aphio1s5gkmpdbwoxynim7acw3e\",\"aqafzdeekpyncwz7m7i54q3iqqy\",\"aify3r761b9w43bqjtskrzi68tr\"]}',1675955590867,1675955590867,0,NULL,'system','','system','bftee3gu1tigb586p9wywiqtwer'),('vpdqi5ouj8pf9jd8pipkdrbxfqe','2023-02-09 15:13:13.391514','buixxjic3xjfkieees4iafdrznc',1,'view','Preview: Table View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280,\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\":100,\"acypkejeb5yfujhj9te57p9kaxw\":169},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"aqh13jabwexjkzr3jqsz1i1syew\",\"acmg7mz1rr1eykfug4hcdpb1y1o\",\"acypkejeb5yfujhj9te57p9kaxw\"]}',1675955593386,1675955593386,0,NULL,'system','','system','bw5z4u7spotb3xkimsx1njfcwoy'),('vr5bbbdog178jiratog6dmkro6o','2023-02-09 15:13:12.048235','bjbhs6bos3m8zjouf78xceg9nqw',1,'view','Board view','{\"cardOrder\":[\"cniwb8xwcqtbstbcm3sdfrr854h\",\"cs4qwpzr65fgttd7364dicskanh\",\"c9s78pzbdg3g4jkcdjqahtnfejc\",\"c8utmazns878jtfgtf7exyi9pee\",\"cnobejmb6bf8e3c1w7em5z4pwyh\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"aok6pgecm85qe9k5kcphzoe63ma\",\"aq1dwbf661yx337hjcd5q3sbxwa\",\"ar87yh5xmsswqkxmjq1ipfftfpc\",\"akj3fkmxq7idma55mdt8sqpumyw\"],\"visiblePropertyIds\":[\"aspaay76a5wrnuhtqgm97tt3rer\"]}',1675955592042,1675955592042,0,NULL,'system','','system','bynzzcwfksfnq9m5utpd7wa76ch'),('vs6wusogf5ifa98izii58yfqajc','2023-02-09 15:13:10.225988','bgi1yqiis8t8xdqxgnet8ebutky',1,'view','By Status','{\"cardOrder\":[\"cf84s7zu18jbeud54uwzam8qwpo\",\"cg46r9od7rf8ipr5139ydfieu8y\",\"cstu6h6hfcfd59yc4qwd4pd3i4o\",\"cmz9qxykqgpdyxf9j5axmwejt1e\",\"cw85ce7jszt8ufcdo44ay1buega\",\"czf1skn1natn3ppzqqqf5kc3bgr\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"cidz4imnqhir48brz6e8hxhfrhy\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"aft5bzo7h9aspqgrx3jpy5tzrer\",\"abrfos7e7eczk9rqw6y5abadm1y\",\"ax8wzbka5ahs3zziji3pp4qp9mc\",\"atabdfbdmjh83136d5e5oysxybw\",\"ace1bzypd586kkyhcht5qqd9eca\",\"aay656c9m1hzwxc9ch5ftymh3nw\",\"a6ghze4iy441qhsh3eijnc8hwze\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955590220,1675955590220,0,NULL,'system','','system','bqcoxgsa4xjfwu8tfnu9k18piha'),('vsia7491953rhipmna3hncuwhhe','2023-02-09 15:13:11.581693','brs9cdimfw7fodyi7erqt747rhc',1,'view','Due Date Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"a39x5cybshwrbjpc3juaakcyj6e\",\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955591576,1675955591576,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('vsjtpwuqmsfbnjyupeix33thaie','2023-02-09 15:13:11.209421','',1,'view','Competitor List','{\"cardOrder\":[\"cu91ugd56rirqxyupgjwozoi7tr\",\"c8q4rsku8htd7tnntzrxhpqn5ha\",\"c6d843tks8fdc9gx7orr6odcdww\",\"cp8xyhyy85tgq3c6jgqmhdz3ree\",\"cyhm5hrnra781bpeatqyygemgah\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":210,\"a1semdhszu1rq17d7et5ydrqqio\":121,\"aapogff3xoa8ym7xf56s87kysda\":194,\"ahzspe59iux8wigra8bg6cg18nc\":156,\"aiefo7nh9jwisn8b4cgakowithy\":155,\"aozntq4go4nkab688j1s7stqtfc\":151,\"az3jkw3ynd3mqmart7edypey15e\":145},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"ahzspe59iux8wigra8bg6cg18nc\",\"aozntq4go4nkab688j1s7stqtfc\",\"aiefo7nh9jwisn8b4cgakowithy\",\"a6cwaq79b1pdpb97wkanmeyy4er\",\"an1eerzscfxn6awdfajbg41uz3h\",\"a1semdhszu1rq17d7et5ydrqqio\",\"aapogff3xoa8ym7xf56s87kysda\",\"az3jkw3ynd3mqmart7edypey15e\"]}',1675955591198,1675955591198,0,NULL,'system','','system','bat83fib1b3ny9bhmof1cpd59sr'),('vsk43fmmf8fdqpmae9krzeqbkfh','2023-02-09 15:13:09.969866','bd65qbzuqupfztpg31dgwgwm5ga',1,'view','By Date','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d6b1249b-bc18-45fc-889e-bec48fce80ef\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"9a090e33-b110-4268-8909-132c5002c90e\",\"0a82977f-52bf-457b-841b-e2b7f76fb525\",\"6e7139e4-5358-46bb-8c01-7b029a57b80a\",\"d5371c63-66bf-4468-8738-c4dc4bea4843\",\"\"],\"visiblePropertyIds\":[\"d9725d14-d5a8-48e5-8de1-6f8c004a9680\"]}',1675955589963,1675955589963,0,NULL,'system','','system','b9wseunsg8b8w7gubd7zbgabjkh'),('vtpir6o7cwirutytyubxbjbhsyr','2023-02-09 15:13:12.367699','bui5izho7dtn77xg3thkiqprc9r',1,'view','Board: Sprints','{\"cardOrder\":[\"cemryxdyma7r9pek7nrua5mkcga\",\"cqangpbz5c3rpfefzdbe4totwnc\",\"chnnww5gm138xjpobgmcnbqyspw\",\"c1gnbat9p3tnzfec18bf6agbhgh\",\"cf75w38ufx7nmukby5irgojbskw\",\"c1kwdjzwqsfygxe5yk53y8krkoc\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"60985f46-3e41-486e-8213-2b987440ea1c\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"board\",\"visibleOptionIds\":[\"c01676ca-babf-4534-8be5-cce2287daa6c\",\"ed4a5340-460d-461b-8838-2c56e8ee59fe\",\"14892380-1a32-42dd-8034-a0cea32bc7e6\",\"\"],\"visiblePropertyIds\":[\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955592361,1675955592361,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('vuknrkuosafnutmfe6m8qupg1ko','2023-02-09 15:13:08.457659','bc41mwxg9ybb69pn9j5zna6d36c',1,'view','Project Priorities','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"d3d682bf-e074-49d9-8df5-7320921c2d23\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{\"\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"87f59784-b859-4c24-8ebe-17c766e081dd\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"98a57627-0f76-471d-850d-91f3ed9fd213\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"},\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\":{\"calculation\":\"sum\",\"propertyId\":\"a8daz81s4xjgke1ww6cwik5w7ye\"}},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\",\"87f59784-b859-4c24-8ebe-17c766e081dd\",\"98a57627-0f76-471d-850d-91f3ed9fd213\",\"\"],\"visiblePropertyIds\":[\"a972dc7a-5f4c-45d2-8044-8c28c69717f1\",\"a8daz81s4xjgke1ww6cwik5w7ye\"]}',1675955588452,1675955588452,0,NULL,'system','','system','bwdfr59gmy3r43nrsmupxwt1rje'),('vx6unz5rpt7ro8d7i15tuaearuo','2023-02-09 15:13:12.409694','bui5izho7dtn77xg3thkiqprc9r',1,'view','List: Bugs ?','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"50117d52-bcc7-4750-82aa-831a351c44a0\":145,\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"values\":[\"1fdbb515-edd2-4af5-80fc-437ed2211a49\"]}],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\",\"reversed\":false}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955592402,1675955592402,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('vxsyothtu7b853k7wfchadn796h','2023-02-09 15:13:04.670816','bzwb99zf498tsm7mjqbiy7g81ze',1,'view','Open Deals','{\"cardOrder\":[\"cb86yg4ppqbgrdktqg8hg3koqjh\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"a5hwxjsmkn6bak6r7uea5bx1kwc\",\"values\":[\"akj61wc9yxdwyw3t6m8igyf9d5o\",\"aic89a5xox4wbppi6mbyx6ujsda\",\"ah6ehh43rwj88jy4awensin8pcw\",\"aprhd96zwi34o9cs4xyr3o9sf3c\",\"axesd74yuxtbmw1sbk8ufax7z3a\"]}],\"operation\":\"and\"},\"groupById\":\"aro91wme9kfaie5ceu9qasmtcnw\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"apjnaggwixchfxwiatfh7ey7uno\",\"apiswzj7uiwbh87z8dw8c6mturw\",\"auu9bfzqeuruyjwzzqgz7q8apuw\",\"\"],\"visiblePropertyIds\":[]}',1675955584664,1675955584664,0,NULL,'system','','system','bdqwwu3hqq7rafgkfwc1wetff6c'),('vy1bwj755m7nrfj17xxuqmoxjra','2023-02-09 15:13:11.592751','brs9cdimfw7fodyi7erqt747rhc',1,'view','Publication Calendar','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"dateDisplayPropertyId\":\"agqsoiipowmnu9rdwxm57zrehtr\",\"defaultTemplateId\":\"cff1jmrxfrirgbeebhr9qd7nida\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"calendar\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"__title\"]}',1675955591587,1675955591587,0,NULL,'system','','system','bqf1dca4xubycjbgbyjiia7e3sr'),('vy7u56x8a5fyhbgznucuq9kxzdh','2023-02-09 15:13:06.972773','bbn1888mprfrm5fjw9f1je9x3xo',1,'view','Board View','{\"cardOrder\":[\"c9mgm3h9mwpnr5mkpqfdiad33cw\",\"cfxrcmsqwtb8ejdae9pcenmh9mw\",\"cnogc7s1x13bgmjz456dudb85py\",\"crmtkd3pua38h5ysmxcjr5hw88o\",\"czowhma7rnpgb3eczbqo3t7fijo\"],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"a9zf59u8x1rf4ywctpcqama7tio\",\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"board\",\"visibleOptionIds\":[\"an51dnkenmoog9cetapbc4uyt3y\",\"afpy8s7i45frggprmfsqngsocqh\",\"aj4jyekqqssatjcq7r7chmy19ey\",\"\"],\"visiblePropertyIds\":[\"a9zf59u8x1rf4ywctpcqama7tio\"]}',1675955586964,1675955586964,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('vykn1q9i3y3dx7ch7stu9re5xbc','2023-02-09 15:13:06.957981','bbn1888mprfrm5fjw9f1je9x3xo',1,'view','List View','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a9zf59u8x1rf4ywctpcqama7tio\",\"abthng7baedhhtrwsdodeuincqy\"]}',1675955586951,1675955586951,0,NULL,'system','','system','biafjiuypqid5ukjfumu3qgkw6o'),('vykxx6xdmj785ubitzjrakam7ee','2023-02-09 15:13:12.381592','bui5izho7dtn77xg3thkiqprc9r',1,'view','List: Tasks ?','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"50117d52-bcc7-4750-82aa-831a351c44a0\":139,\"__title\":280},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[{\"condition\":\"includes\",\"propertyId\":\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"values\":[\"6eea96c9-4c61-4968-8554-4b7537e8f748\"]}],\"operation\":\"and\"},\"hiddenOptionIds\":[],\"kanbanCalculations\":{},\"sortOptions\":[{\"propertyId\":\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"reversed\":true}],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"50117d52-bcc7-4750-82aa-831a351c44a0\",\"20717ad3-5741-4416-83f1-6f133fff3d11\",\"60985f46-3e41-486e-8213-2b987440ea1c\",\"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\"]}',1675955592374,1675955592374,0,NULL,'system','','system','b3czjjrq9bb8b7fmo8n73niho1h'),('vzmw9hne6iprtpbw4uuu1adqdka','2023-02-09 15:13:09.613457','',1,'view','By Quarter','{\"cardOrder\":[],\"collapsedOptionIds\":[],\"columnCalculations\":{},\"columnWidths\":{\"__title\":452,\"a17ryhi1jfsboxkwkztwawhmsxe\":148,\"a6amddgmrzakw66cidqzgk6p4ge\":230,\"azzbawji5bksj69sekcs4srm1ky\":142},\"defaultTemplateId\":\"\",\"filter\":{\"filters\":[],\"operation\":\"and\"},\"groupById\":\"aqxyzkdrs4egqf7yk866ixkaojc\",\"hiddenOptionIds\":[\"\"],\"kanbanCalculations\":{},\"sortOptions\":[],\"viewType\":\"table\",\"visibleOptionIds\":[],\"visiblePropertyIds\":[\"a6amddgmrzakw66cidqzgk6p4ge\",\"a17ryhi1jfsboxkwkztwawhmsxe\",\"azzbawji5bksj69sekcs4srm1ky\",\"adp5ft3kgz7r5iqq3tnwg551der\",\"aqxyzkdrs4egqf7yk866ixkaojc\",\"adu6mebzpibq6mgcswk69xxmnqe\",\"asope3bddhm4gpsng5cfu4hf6rh\",\"ajwxp866f9obs1kutfwaa5ru7fe\",\"azqnyswk6s1boiwuthscm78qwuo\",\"ahz3fmjnaguec8hce7xq3h5cjdr\",\"a17bfcgnzmkwhziwa4tr38kiw5r\"]}',1675955589608,1675955589608,0,NULL,'system','','system','bubw9oxrmnifczyxtkexbx5fopy');
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
  KEY `idx_board_members_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_board_members`
--

LOCK TABLES `focalboard_board_members` WRITE;
/*!40000 ALTER TABLE `focalboard_board_members` DISABLE KEYS */;
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
  KEY `idx_board_members_history_user_id` (`user_id`),
  KEY `idx_board_members_history_board_id_user_id` (`board_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_board_members_history`
--

LOCK TABLES `focalboard_board_members_history` WRITE;
/*!40000 ALTER TABLE `focalboard_board_members_history` DISABLE KEYS */;
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
  KEY `idx_boards_team_id_is_template` (`team_id`,`is_template`),
  KEY `idx_boards_channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focalboard_boards`
--

LOCK TABLES `focalboard_boards` WRITE;
/*!40000 ALTER TABLE `focalboard_boards` DISABLE KEYS */;
INSERT INTO `focalboard_boards` VALUES ('b3czjjrq9bb8b7fmo8n73niho1h','2023-02-09 15:13:12.243712','0','','system','system','O','Roadmap ','Use this template to plan your roadmap and manage your releases more efficiently.','?️',1,1,6,'{\"trackingTemplateId\": \"b728c6ca730e2cfc229741c5a4712b65\"}','[{\"id\": \"50117d52-bcc7-4750-82aa-831a351c44a0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"ec6d2bc5-df2b-4f77-8479-e59ceb039946\", \"color\": \"propColorYellow\", \"value\": \"In Progress\"}, {\"id\": \"849766ba-56a5-48d1-886f-21672f415395\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"20717ad3-5741-4416-83f1-6f133fff3d11\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"424ea5e3-9aa1-4075-8c5c-01b44b66e634\", \"color\": \"propColorYellow\", \"value\": \"Epic ⛰\"}, {\"id\": \"6eea96c9-4c61-4968-8554-4b7537e8f748\", \"color\": \"propColorGreen\", \"value\": \"Task ?\"}, {\"id\": \"1fdbb515-edd2-4af5-80fc-437ed2211a49\", \"color\": \"propColorRed\", \"value\": \"Bug ?\"}]}, {\"id\": \"60985f46-3e41-486e-8213-2b987440ea1c\", \"name\": \"Sprint\", \"type\": \"select\", \"options\": [{\"id\": \"c01676ca-babf-4534-8be5-cce2287daa6c\", \"color\": \"propColorBrown\", \"value\": \"Sprint 1\"}, {\"id\": \"ed4a5340-460d-461b-8838-2c56e8ee59fe\", \"color\": \"propColorPurple\", \"value\": \"Sprint 2\"}, {\"id\": \"14892380-1a32-42dd-8034-a0cea32bc7e6\", \"color\": \"propColorBlue\", \"value\": \"Sprint 3\"}]}, {\"id\": \"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"e6a7f297-4440-4783-8ab3-3af5ba62ca11\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"c62172ea-5da7-4dec-8186-37267d8ee9a7\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aphg37f7zbpuc3bhwhp19s1ribh\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a4378omyhmgj3bex13sj4wbpfiy\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"a36o9q1yik6nmar6ri4q4uca7ey\", \"name\": \"Created Date\", \"type\": \"createdTime\", \"options\": []}, {\"id\": \"ai7ajsdk14w7x5s8up3dwir77te\", \"name\": \"Design Link\", \"type\": \"url\", \"options\": []}]',1675955592239,1675955592239,0,''),('b9wseunsg8b8w7gubd7zbgabjkh','2023-02-09 15:13:09.884405','0','','system','system','O','Personal Goals ','Use this template to set and accomplish new personal goals.','⛰️',1,1,6,'{\"trackingTemplateId\": \"7f32dc8d2ae008cfe56554e9363505cc\"}','[{\"id\": \"af6fcbb8-ca56-4b73-83eb-37437b9a667d\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\", \"color\": \"propColorRed\", \"value\": \"To Do\"}, {\"id\": \"77c539af-309c-4db1-8329-d20ef7e9eacd\", \"color\": \"propColorYellow\", \"value\": \"Doing\"}, {\"id\": \"98bdea27-0cce-4cde-8dc6-212add36e63a\", \"color\": \"propColorGreen\", \"value\": \"Done ?\"}]}, {\"id\": \"d9725d14-d5a8-48e5-8de1-6f8c004a9680\", \"name\": \"Category\", \"type\": \"select\", \"options\": [{\"id\": \"3245a32d-f688-463b-87f4-8e7142c1b397\", \"color\": \"propColorPurple\", \"value\": \"Life Skills\"}, {\"id\": \"80be816c-fc7a-4928-8489-8b02180f4954\", \"color\": \"propColorGreen\", \"value\": \"Finance\"}, {\"id\": \"ffb3f951-b47f-413b-8f1d-238666728008\", \"color\": \"propColorOrange\", \"value\": \"Health\"}]}, {\"id\": \"d6b1249b-bc18-45fc-889e-bec48fce80ef\", \"name\": \"Target\", \"type\": \"select\", \"options\": [{\"id\": \"9a090e33-b110-4268-8909-132c5002c90e\", \"color\": \"propColorBlue\", \"value\": \"Q1\"}, {\"id\": \"0a82977f-52bf-457b-841b-e2b7f76fb525\", \"color\": \"propColorBrown\", \"value\": \"Q2\"}, {\"id\": \"6e7139e4-5358-46bb-8c01-7b029a57b80a\", \"color\": \"propColorGreen\", \"value\": \"Q3\"}, {\"id\": \"d5371c63-66bf-4468-8738-c4dc4bea4843\", \"color\": \"propColorPurple\", \"value\": \"Q4\"}]}, {\"id\": \"ajy6xbebzopojaenbnmfpgtdwso\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}]',1675955589881,1675955589881,0,''),('bat83fib1b3ny9bhmof1cpd59sr','2023-02-09 15:13:11.188175','0','','system','system','O','Competitive Analysis','Use this template to track and stay ahead of the competition.','?️',1,1,6,'{\"trackingTemplateId\": \"06f4bff367a7c2126fab2380c9dec23c\"}','[{\"id\": \"ahzspe59iux8wigra8bg6cg18nc\", \"name\": \"Website\", \"type\": \"url\", \"options\": []}, {\"id\": \"aozntq4go4nkab688j1s7stqtfc\", \"name\": \"Location\", \"type\": \"text\", \"options\": []}, {\"id\": \"aiefo7nh9jwisn8b4cgakowithy\", \"name\": \"Revenue\", \"type\": \"text\", \"options\": []}, {\"id\": \"a6cwaq79b1pdpb97wkanmeyy4er\", \"name\": \"Employees\", \"type\": \"number\", \"options\": []}, {\"id\": \"an1eerzscfxn6awdfajbg41uz3h\", \"name\": \"Founded\", \"type\": \"text\", \"options\": []}, {\"id\": \"a1semdhszu1rq17d7et5ydrqqio\", \"name\": \"Market Position\", \"type\": \"select\", \"options\": [{\"id\": \"arfjpz9by5car71tz3behba8yih\", \"color\": \"propColorYellow\", \"value\": \"Leader\"}, {\"id\": \"abajmr34b8g1916w495xjb35iko\", \"color\": \"propColorRed\", \"value\": \"Challenger\"}, {\"id\": \"abt79uxg5edqojsrrefcnr4eruo\", \"color\": \"propColorBlue\", \"value\": \"Follower\"}, {\"id\": \"aipf3qfgjtkheiayjuxrxbpk9wa\", \"color\": \"propColorBrown\", \"value\": \"Nicher\"}]}, {\"id\": \"aapogff3xoa8ym7xf56s87kysda\", \"name\": \"Last updated time\", \"type\": \"updatedTime\", \"options\": []}, {\"id\": \"az3jkw3ynd3mqmart7edypey15e\", \"name\": \"Last updated by\", \"type\": \"updatedBy\", \"options\": []}]',1675955591185,1675955591185,0,''),('bdqwwu3hqq7rafgkfwc1wetff6c','2023-02-09 15:13:04.544477','0','','system','system','O','Sales Pipeline CRM','Use this template to grow and keep track of your sales opportunities.','?',1,1,6,'{\"trackingTemplateId\": \"ecc250bb7dff0fe02247f1110f097544\"}','[{\"id\": \"a5hwxjsmkn6bak6r7uea5bx1kwc\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"akj61wc9yxdwyw3t6m8igyf9d5o\", \"color\": \"propColorGray\", \"value\": \"Lead\"}, {\"id\": \"aic89a5xox4wbppi6mbyx6ujsda\", \"color\": \"propColorYellow\", \"value\": \"Qualified\"}, {\"id\": \"ah6ehh43rwj88jy4awensin8pcw\", \"color\": \"propColorBrown\", \"value\": \"Meeting\"}, {\"id\": \"aprhd96zwi34o9cs4xyr3o9sf3c\", \"color\": \"propColorPurple\", \"value\": \"Proposal\"}, {\"id\": \"axesd74yuxtbmw1sbk8ufax7z3a\", \"color\": \"propColorOrange\", \"value\": \"Negotiation\"}, {\"id\": \"a5txuiubumsmrs8gsd5jz5gc1oa\", \"color\": \"propColorRed\", \"value\": \"Lost\"}, {\"id\": \"acm9q494bcthyoqzmfogxxy5czy\", \"color\": \"propColorGreen\", \"value\": \"Closed ?\"}]}, {\"id\": \"aoheuj1f3mu6eehygr45fxa144y\", \"name\": \"Account Owner\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"aro91wme9kfaie5ceu9qasmtcnw\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"apjnaggwixchfxwiatfh7ey7uno\", \"color\": \"propColorRed\", \"value\": \"High ?\"}, {\"id\": \"apiswzj7uiwbh87z8dw8c6mturw\", \"color\": \"propColorYellow\", \"value\": \"Medium\"}, {\"id\": \"auu9bfzqeuruyjwzzqgz7q8apuw\", \"color\": \"propColorBrown\", \"value\": \"Low\"}]}, {\"id\": \"ainpw47babwkpyj77ic4b9zq9xr\", \"name\": \"Company\", \"type\": \"text\", \"options\": []}, {\"id\": \"ahf43e44h3y8ftanqgzno9z7q7w\", \"name\": \"Estimated Value\", \"type\": \"number\", \"options\": []}, {\"id\": \"amahgyn9n4twaapg3jyxb6y4jic\", \"name\": \"Territory\", \"type\": \"select\", \"options\": [{\"id\": \"ar6t1ttcumgfuqugg5o4g4mzrza\", \"color\": \"propColorBrown\", \"value\": \"Western US\"}, {\"id\": \"asbwojkm7zb4ohrtij97jkdfgwe\", \"color\": \"propColorGreen\", \"value\": \"Mountain West / Central US\"}, {\"id\": \"aw8ppwtcrm8iwopdadje3ni196w\", \"color\": \"propColorGray\", \"value\": \"Mid-Atlantic / Southeast\"}, {\"id\": \"aafwyza5iwdcwcyfyj6bp7emufw\", \"color\": \"propColorBlue\", \"value\": \"Northeast US / Canada\"}, {\"id\": \"agw8rcb9uxyt3c7g6tq3r65fgqe\", \"color\": \"propColorPink\", \"value\": \"Eastern Europe\"}, {\"id\": \"as5bk6afoaaa7caewe1zc391sce\", \"color\": \"propColorPurple\", \"value\": \"Central Europe / Africa\"}, {\"id\": \"a8fj94bka8z9t6p95qd3hn6t5re\", \"color\": \"propColorYellow\", \"value\": \"Middle East\"}, {\"id\": \"arpxa3faaou9trt4zx5sh435gne\", \"color\": \"propColorOrange\", \"value\": \"UK\"}, {\"id\": \"azdidd5wze4kcxf8neefj3ctkyr\", \"color\": \"propColorRed\", \"value\": \"Asia\"}, {\"id\": \"a4jn5mhqs3thknqf5opykntgsnc\", \"color\": \"propColorGray\", \"value\": \"Australia\"}, {\"id\": \"afjbgrecb7hp5owj7xh8u4w33tr\", \"color\": \"propColorBrown\", \"value\": \"Latin America\"}]}, {\"id\": \"abru6tz8uebdxy4skheqidh7zxy\", \"name\": \"Email\", \"type\": \"email\", \"options\": []}, {\"id\": \"a1438fbbhjeffkexmcfhnx99o1h\", \"name\": \"Phone\", \"type\": \"phone\", \"options\": []}, {\"id\": \"auhf91pm85f73swwidi4wid8jqe\", \"name\": \"Last Contact Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"adtf1151chornmihz4xbgbk9exa\", \"name\": \"Expected Close\", \"type\": \"date\", \"options\": []}, {\"id\": \"aejo5tcmq54bauuueem9wc4fw4y\", \"name\": \"Close Probability\", \"type\": \"text\", \"options\": []}, {\"id\": \"amba7ot98fh7hwsx8jdcfst5g7h\", \"name\": \"Created Date\", \"type\": \"createdTime\", \"options\": []}]',1675955584541,1675955584541,0,''),('bftee3gu1tigb586p9wywiqtwer','2023-02-09 15:13:10.855824','0','','system','system','O','User Research Sessions','Use this template to manage and keep track of all your user research sessions.','?',1,1,6,'{\"trackingTemplateId\": \"6c345c7f50f6833f78b7d0f08ce450a3\"}','[{\"id\": \"aaebj5fyx493eezx6ukxiwydgty\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"af6hjb3ysuaxbwnfqpby4wwnkdr\", \"color\": \"propColorGray\", \"value\": \"Backlog ?\"}, {\"id\": \"aotxum1p5bw3xuzqz3ctjw66yww\", \"color\": \"propColorYellow\", \"value\": \"Contacted ?\"}, {\"id\": \"a7yq89whddzob1futao4rxk3yzc\", \"color\": \"propColorBlue\", \"value\": \"Scheduled ?\"}, {\"id\": \"aseqq9hrsua56r3s6nbuirj9eec\", \"color\": \"propColorRed\", \"value\": \"Cancelled ?\"}, {\"id\": \"ap93ysuzy1xa7z818r6myrn4h4y\", \"color\": \"propColorGreen\", \"value\": \"Completed ✔️\"}]}, {\"id\": \"akrxgi7p7w14fym3gbynb98t9fh\", \"name\": \"Interview Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"atg9qu6oe4bjm8jczzsn71ff5me\", \"name\": \"Product Area\", \"type\": \"select\", \"options\": [{\"id\": \"ahn89mqg9u4igk6pdm7333t8i5h\", \"color\": \"propColorGreen\", \"value\": \"Desktop App\"}, {\"id\": \"aehc83ffays3gh8myz16a8j7k4e\", \"color\": \"propColorPurple\", \"value\": \"Web App\"}, {\"id\": \"a1sxagjgaadym5yrjak6tcup1oa\", \"color\": \"propColorBlue\", \"value\": \"Mobile App\"}]}, {\"id\": \"acjq4t5ymytu8x1f68wkggm7ypc\", \"name\": \"Email\", \"type\": \"email\", \"options\": []}, {\"id\": \"aphio1s5gkmpdbwoxynim7acw3e\", \"name\": \"Interviewer\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"aqafzdeekpyncwz7m7i54q3iqqy\", \"name\": \"Recording URL\", \"type\": \"url\", \"options\": []}, {\"id\": \"aify3r761b9w43bqjtskrzi68tr\", \"name\": \"Passcode\", \"type\": \"text\", \"options\": []}]',1675955590853,1675955590853,0,''),('biafjiuypqid5ukjfumu3qgkw6o','2023-02-09 15:13:06.883036','0','','system','system','O','Personal Tasks ','Use this template to organize your life and track your personal tasks.','✔️',1,1,6,'{\"trackingTemplateId\": \"dfb70c146a4584b8a21837477c7b5431\"}','[{\"id\": \"a9zf59u8x1rf4ywctpcqama7tio\", \"name\": \"Occurrence\", \"type\": \"select\", \"options\": [{\"id\": \"an51dnkenmoog9cetapbc4uyt3y\", \"color\": \"propColorBlue\", \"value\": \"Daily\"}, {\"id\": \"afpy8s7i45frggprmfsqngsocqh\", \"color\": \"propColorOrange\", \"value\": \"Weekly\"}, {\"id\": \"aj4jyekqqssatjcq7r7chmy19ey\", \"color\": \"propColorPurple\", \"value\": \"Monthly\"}]}, {\"id\": \"abthng7baedhhtrwsdodeuincqy\", \"name\": \"Completed\", \"type\": \"checkbox\", \"options\": []}]',1675955586880,1675955586880,0,''),('boegirwoddb8ojrr19gnf8dwotr','2023-02-09 15:13:03.558290','0','','system','system','O','Meeting Agenda ','Use this template for recurring meeting agendas, like team meetings and 1:1\'s. To use this board:\n* Participants queue new items to discuss under \"To Discuss\"\n* Go through items during the meeting\n* Move items to Done or Revisit Later as needed','?',1,1,6,'{\"trackingTemplateId\": \"54fcf9c610f0ac5e4c522c0657c90602\"}','[{\"id\": \"d777ba3b-8728-40d1-87a6-59406bbbbfb0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\", \"color\": \"propColorPink\", \"value\": \"To Discuss ?\"}, {\"id\": \"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed\", \"color\": \"propColorYellow\", \"value\": \"Revisit Later ⏳\"}, {\"id\": \"dabadd9b-adf1-4d9f-8702-805ac6cef602\", \"color\": \"propColorGreen\", \"value\": \"Done / Archived ?\"}]}, {\"id\": \"4cf1568d-530f-4028-8ffd-bdc65249187e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"8b05c83e-a44a-4d04-831e-97f01d8e2003\", \"color\": \"propColorRed\", \"value\": \"1. High\"}, {\"id\": \"b1abafbf-a038-4a19-8b68-56e0fd2319f7\", \"color\": \"propColorYellow\", \"value\": \"2. Medium\"}, {\"id\": \"2491ffaa-eb55-417b-8aff-4bd7d4136613\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"aw4w63xhet79y9gueqzzeiifdoe\", \"name\": \"Created by\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"a6ux19353xcwfqg9k1inqg5sg4w\", \"name\": \"Created time\", \"type\": \"createdTime\", \"options\": []}]',1675955583554,1675955583554,0,''),('bqcoxgsa4xjfwu8tfnu9k18piha','2023-02-09 15:13:10.078899','0','','system','system','O','Sprint Planner ','Use this template to plan your sprints and manage your releases more efficiently.','?️',1,1,6,'{\"trackingTemplateId\": \"99b74e26d2f5d0a9b346d43c0a7bfb09\"}','[{\"id\": \"50117d52-bcc7-4750-82aa-831a351c44a0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"aft5bzo7h9aspqgrx3jpy5tzrer\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"abrfos7e7eczk9rqw6y5abadm1y\", \"color\": \"propColorOrange\", \"value\": \"Next Up\"}, {\"id\": \"ax8wzbka5ahs3zziji3pp4qp9mc\", \"color\": \"propColorBlue\", \"value\": \"In Progress\"}, {\"id\": \"atabdfbdmjh83136d5e5oysxybw\", \"color\": \"propColorYellow\", \"value\": \"In Review\"}, {\"id\": \"ace1bzypd586kkyhcht5qqd9eca\", \"color\": \"propColorPink\", \"value\": \"Approved\"}, {\"id\": \"aay656c9m1hzwxc9ch5ftymh3nw\", \"color\": \"propColorRed\", \"value\": \"Blocked\"}, {\"id\": \"a6ghze4iy441qhsh3eijnc8hwze\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"20717ad3-5741-4416-83f1-6f133fff3d11\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"424ea5e3-9aa1-4075-8c5c-01b44b66e634\", \"color\": \"propColorYellow\", \"value\": \"Epic ⛰\"}, {\"id\": \"a5yxq8rbubrpnoommfwqmty138h\", \"color\": \"propColorGray\", \"value\": \"Feature ?\"}, {\"id\": \"apht1nt5ryukdmxkh6fkfn6rgoy\", \"color\": \"propColorOrange\", \"value\": \"User Story ?\"}, {\"id\": \"aiycbuo3dr5k4xxbfr7coem8ono\", \"color\": \"propColorGreen\", \"value\": \"Task ⛏\"}, {\"id\": \"aomnawq4551cbbzha9gxnmb3z5w\", \"color\": \"propColorRed\", \"value\": \"Bug ?\"}]}, {\"id\": \"60985f46-3e41-486e-8213-2b987440ea1c\", \"name\": \"Sprint\", \"type\": \"select\", \"options\": [{\"id\": \"c01676ca-babf-4534-8be5-cce2287daa6c\", \"color\": \"propColorBrown\", \"value\": \"Sprint 1\"}, {\"id\": \"ed4a5340-460d-461b-8838-2c56e8ee59fe\", \"color\": \"propColorPurple\", \"value\": \"Sprint 2\"}, {\"id\": \"14892380-1a32-42dd-8034-a0cea32bc7e6\", \"color\": \"propColorBlue\", \"value\": \"Sprint 3\"}]}, {\"id\": \"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"e6a7f297-4440-4783-8ab3-3af5ba62ca11\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"c62172ea-5da7-4dec-8186-37267d8ee9a7\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aphg37f7zbpuc3bhwhp19s1ribh\", \"name\": \"Assignee\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"a4378omyhmgj3bex13sj4wbpfiy\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"ai7ajsdk14w7x5s8up3dwir77te\", \"name\": \"Story Points\", \"type\": \"number\", \"options\": []}, {\"id\": \"a1g6i613dpe9oryeo71ex3c86hy\", \"name\": \"Design Link\", \"type\": \"url\", \"options\": []}, {\"id\": \"aeomttrbhhsi8bph31jn84sto6h\", \"name\": \"Created Time\", \"type\": \"createdTime\", \"options\": []}, {\"id\": \"ax9f8so418s6s65hi5ympd93i6a\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}]',1675955590076,1675955590076,0,''),('bqf1dca4xubycjbgbyjiia7e3sr','2023-02-09 15:13:11.505805','0','','system','system','O','Content Calendar ','Use this template to plan and organize your editorial content.','?',1,1,6,'{\"trackingTemplateId\": \"c75fbd659d2258b5183af2236d176ab4\"}','[{\"id\": \"ae9ar615xoknd8hw8py7mbyr7zo\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"awna1nuarjca99m9s4uiy9kwj5h\", \"color\": \"propColorGray\", \"value\": \"Idea ?\"}, {\"id\": \"a9ana1e9w673o5cp8md4xjjwfto\", \"color\": \"propColorOrange\", \"value\": \"Draft\"}, {\"id\": \"apy9dcd7zmand615p3h53zjqxjh\", \"color\": \"propColorPurple\", \"value\": \"In Review\"}, {\"id\": \"acri4cm3bmay55f7ksztphmtnga\", \"color\": \"propColorBlue\", \"value\": \"Ready to Publish\"}, {\"id\": \"amsowcd9a8e1kid317r7ttw6uzh\", \"color\": \"propColorGreen\", \"value\": \"Published ?\"}]}, {\"id\": \"aysx3atqexotgwp5kx6h5i5ancw\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"aywiofmmtd3ofgzj95ysky4pjga\", \"color\": \"propColorOrange\", \"value\": \"Press Release\"}, {\"id\": \"apqdgjrmsmx8ngmp7zst51647de\", \"color\": \"propColorGreen\", \"value\": \"Sponsored Post\"}, {\"id\": \"a3woynbjnb7j16e74uw3pubrytw\", \"color\": \"propColorPurple\", \"value\": \"Customer Story\"}, {\"id\": \"aq36k5pkpfcypqb3idw36xdi1fh\", \"color\": \"propColorRed\", \"value\": \"Product Release\"}, {\"id\": \"azn66pmk34adygnizjqhgiac4ia\", \"color\": \"propColorGray\", \"value\": \"Partnership\"}, {\"id\": \"aj8y675weso8kpb6eceqbpj4ruw\", \"color\": \"propColorBlue\", \"value\": \"Feature Announcement\"}, {\"id\": \"a3xky7ygn14osr1mokerbfah5cy\", \"color\": \"propColorYellow\", \"value\": \"Article\"}]}, {\"id\": \"ab6mbock6styfe6htf815ph1mhw\", \"name\": \"Channel\", \"type\": \"multiSelect\", \"options\": [{\"id\": \"a8xceonxiu4n3c43szhskqizicr\", \"color\": \"propColorBrown\", \"value\": \"Website\"}, {\"id\": \"a3pdzi53kpbd4okzdkz6khi87zo\", \"color\": \"propColorGreen\", \"value\": \"Blog\"}, {\"id\": \"a3d9ux4fmi3anyd11kyipfbhwde\", \"color\": \"propColorOrange\", \"value\": \"Email\"}, {\"id\": \"a8cbbfdwocx73zn3787cx6gacsh\", \"color\": \"propColorRed\", \"value\": \"Podcast\"}, {\"id\": \"aigjtpcaxdp7d6kmctrwo1ztaia\", \"color\": \"propColorPink\", \"value\": \"Print\"}, {\"id\": \"af1wsn13muho59e7ghwaogxy5ey\", \"color\": \"propColorBlue\", \"value\": \"Facebook\"}, {\"id\": \"a47zajfxwhsg6q8m7ppbiqs7jge\", \"color\": \"propColorGray\", \"value\": \"LinkedIn\"}, {\"id\": \"az8o8pfe9hq6s7xaehoqyc3wpyc\", \"color\": \"propColorYellow\", \"value\": \"Twitter\"}]}, {\"id\": \"ao44fz8nf6z6tuj1x31t9yyehcc\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a39x5cybshwrbjpc3juaakcyj6e\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"agqsoiipowmnu9rdwxm57zrehtr\", \"name\": \"Publication Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"ap4e7kdg7eip7j3c3oyiz39eaoc\", \"name\": \"Link\", \"type\": \"url\", \"options\": []}]',1675955591503,1675955591503,0,''),('bubw9oxrmnifczyxtkexbx5fopy','2023-02-09 15:13:09.597606','0','','system','system','O','Company Goals & OKRs','Use this template to plan your company goals and OKRs more efficiently.','⛳',1,1,6,'{\"trackingTemplateId\": \"7ba22ccfdfac391d63dea5c4b8cde0de\"}','[{\"id\": \"a6amddgmrzakw66cidqzgk6p4ge\", \"name\": \"Objective\", \"type\": \"select\", \"options\": [{\"id\": \"auw3afh3kfhrfgmjr8muiz137jy\", \"color\": \"propColorGreen\", \"value\": \"Grow Revenue\"}, {\"id\": \"apqfjst8massbjjhpcsjs3y1yqa\", \"color\": \"propColorOrange\", \"value\": \"Delight Customers\"}, {\"id\": \"ao9b5pxyt7tkgdohzh9oaustdhr\", \"color\": \"propColorPurple\", \"value\": \"Drive Product Adoption\"}]}, {\"id\": \"a17ryhi1jfsboxkwkztwawhmsxe\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"a6robxx81diugpjq5jkezz3j1fo\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"a8nukezwwmknqwjsygg7eaxs9te\", \"color\": \"propColorBlue\", \"value\": \"In Progress\"}, {\"id\": \"apnt1f7na9rzgk1rt49keg7xbiy\", \"color\": \"propColorYellow\", \"value\": \"At Risk\"}, {\"id\": \"axbz3m1amss335wzwf9s7pqjzxr\", \"color\": \"propColorRed\", \"value\": \"Missed\"}, {\"id\": \"abzfwnn6rmtfzyq5hg8uqmpsncy\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"azzbawji5bksj69sekcs4srm1ky\", \"name\": \"Department\", \"type\": \"select\", \"options\": [{\"id\": \"aw5i7hmpadn6mbwbz955ubarhme\", \"color\": \"propColorBrown\", \"value\": \"Engineering\"}, {\"id\": \"afkxpcjqjypu7hhar7banxau91h\", \"color\": \"propColorBlue\", \"value\": \"Product\"}, {\"id\": \"aehoa17cz18rqnrf75g7dwhphpr\", \"color\": \"propColorOrange\", \"value\": \"Marketing\"}, {\"id\": \"agrfeaoj7d8p5ianw5iaf3191ae\", \"color\": \"propColorGreen\", \"value\": \"Sales\"}, {\"id\": \"agm9p6gcq15ueuzqq3wd4be39wy\", \"color\": \"propColorYellow\", \"value\": \"Support\"}, {\"id\": \"aucop7kw6xwodcix6zzojhxih6r\", \"color\": \"propColorPink\", \"value\": \"Design\"}, {\"id\": \"afust91f3g8ht368mkn5x9tgf1o\", \"color\": \"propColorPurple\", \"value\": \"Finance\"}, {\"id\": \"acocxxwjurud1jixhp7nowdig7y\", \"color\": \"propColorGray\", \"value\": \"Human Resources\"}]}, {\"id\": \"adp5ft3kgz7r5iqq3tnwg551der\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"a8zg3rjtf4swh7smsjxpsn743rh\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"as555ipyzopjjpfb5rjtssecw5e\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"a1ts3ftyr8nocsicui98c89uxjy\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aqxyzkdrs4egqf7yk866ixkaojc\", \"name\": \"Quarter\", \"type\": \"select\", \"options\": [{\"id\": \"ahfbn1jsmhydym33ygxwg5jt3kh\", \"color\": \"propColorBlue\", \"value\": \"Q1\"}, {\"id\": \"awfu37js3fomfkkczm1zppac57a\", \"color\": \"propColorBrown\", \"value\": \"Q2\"}, {\"id\": \"anruuoyez51r3yjxuoc8zoqnwaw\", \"color\": \"propColorGreen\", \"value\": \"Q3\"}, {\"id\": \"acb6dqqs6yson7bbzx6jk9bghjh\", \"color\": \"propColorPurple\", \"value\": \"Q4\"}]}, {\"id\": \"adu6mebzpibq6mgcswk69xxmnqe\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"asope3bddhm4gpsng5cfu4hf6rh\", \"name\": \"Assignee\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"ajwxp866f9obs1kutfwaa5ru7fe\", \"name\": \"Target\", \"type\": \"number\", \"options\": []}, {\"id\": \"azqnyswk6s1boiwuthscm78qwuo\", \"name\": \"Actual\", \"type\": \"number\", \"options\": []}, {\"id\": \"ahz3fmjnaguec8hce7xq3h5cjdr\", \"name\": \"Completion (%)\", \"type\": \"text\", \"options\": []}, {\"id\": \"a17bfcgnzmkwhziwa4tr38kiw5r\", \"name\": \"Note\", \"type\": \"text\", \"options\": []}]',1675955589594,1675955589594,0,''),('bw5z4u7spotb3xkimsx1njfcwoy','2023-02-09 15:13:13.255820','0','','system','system','O','Welcome to Boards!','Mattermost Boards is an open source project management tool that helps you organize, track, and manage work across teams. Select a card to learn more.','?',1,1,6,'{\"trackingTemplateId\": \"65aba997282f3ac457cd66736fb86915\"}','[{\"id\": \"a972dc7a-5f4c-45d2-8044-8c28c69717f1\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"amm6wfhnbuxojwssyftgs9dipqe\", \"color\": \"propColorRed\", \"value\": \"To do ?\"}, {\"id\": \"af3p8ztcyxgn8wd9z4az7o9tjeh\", \"color\": \"propColorYellow\", \"value\": \"Next up\"}, {\"id\": \"ajurey3xkocs1nwx8di5zx6oe7o\", \"color\": \"propColorPurple\", \"value\": \"Later\"}, {\"id\": \"agkinkjy5983wsk6kppsujajxqw\", \"color\": \"propColorGreen\", \"value\": \"Completed ?\"}]}, {\"id\": \"acypkejeb5yfujhj9te57p9kaxw\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"aanaehcw3m13jytujsjk5hpf6ry\", \"color\": \"propColorOrange\", \"value\": \"1. High\"}, {\"id\": \"ascd7nm9r491ayot8i86g1gmgqw\", \"color\": \"propColorBrown\", \"value\": \"2. Medium\"}, {\"id\": \"aq6ukoiciyfctgwyhwzpfss8ghe\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"aqh13jabwexjkzr3jqsz1i1syew\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"acmg7mz1rr1eykfug4hcdpb1y1o\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"amewjwfjrtpu8ha73xsrdmxazxr\", \"name\": \"Reviewed\", \"type\": \"checkbox\", \"options\": []}, {\"id\": \"attzzboqaz6m1sdti5xa7gjnk1e\", \"name\": \"Last updated time\", \"type\": \"updatedTime\", \"options\": []}, {\"id\": \"a4nfnb5xr3txr5xq7y9ho7kyz6c\", \"name\": \"Reference\", \"type\": \"url\", \"options\": []}, {\"id\": \"a9gzwi3dt5n55nddej6zcbhxaeh\", \"name\": \"Created by\", \"type\": \"createdBy\", \"options\": []}]',1675955593253,1675955593253,0,''),('bwdfr59gmy3r43nrsmupxwt1rje','2023-02-09 15:13:08.379304','0','','system','system','O','Project Tasks ','Use this template to stay on top of your project tasks and progress.','?',1,1,6,'{\"trackingTemplateId\": \"a4ec399ab4f2088b1051c3cdf1dde4c3\"}','[{\"id\": \"a972dc7a-5f4c-45d2-8044-8c28c69717f1\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"ayz81h9f3dwp7rzzbdebesc7ute\", \"color\": \"propColorBlue\", \"value\": \"Not Started\"}, {\"id\": \"ar6b8m3jxr3asyxhr8iucdbo6yc\", \"color\": \"propColorYellow\", \"value\": \"In Progress\"}, {\"id\": \"afi4o5nhnqc3smtzs1hs3ij34dh\", \"color\": \"propColorRed\", \"value\": \"Blocked\"}, {\"id\": \"adeo5xuwne3qjue83fcozekz8ko\", \"color\": \"propColorGreen\", \"value\": \"Completed ?\"}, {\"id\": \"ahpyxfnnrzynsw3im1psxpkgtpe\", \"color\": \"propColorBrown\", \"value\": \"Archived\"}]}, {\"id\": \"d3d682bf-e074-49d9-8df5-7320921c2d23\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\", \"color\": \"propColorRed\", \"value\": \"1. High ?\"}, {\"id\": \"87f59784-b859-4c24-8ebe-17c766e081dd\", \"color\": \"propColorYellow\", \"value\": \"2. Medium\"}, {\"id\": \"98a57627-0f76-471d-850d-91f3ed9fd213\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"axkhqa4jxr3jcqe4k87g8bhmary\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a8daz81s4xjgke1ww6cwik5w7ye\", \"name\": \"Estimated Hours\", \"type\": \"number\", \"options\": []}, {\"id\": \"a3zsw7xs8sxy7atj8b6totp3mby\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"a7gdnz8ff8iyuqmzddjgmgo9ery\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"2a5da320-735c-4093-8787-f56e15cdfeed\", \"name\": \"Date Created\", \"type\": \"createdTime\", \"options\": []}]',1675955588376,1675955588376,0,''),('bynzzcwfksfnq9m5utpd7wa76ch','2023-02-09 15:13:12.031841','0','','system','system','O','Team Retrospective','Use this template at the end of your project or sprint to identify what worked well and what can be improved for the future.','?',1,1,6,'{\"trackingTemplateId\": \"e4f03181c4ced8edd4d53d33d569a086\"}','[{\"id\": \"adjckpdotpgkz7c6wixzw9ipb1e\", \"name\": \"Category\", \"type\": \"select\", \"options\": [{\"id\": \"aok6pgecm85qe9k5kcphzoe63ma\", \"color\": \"propColorGray\", \"value\": \"To Discuss ?\"}, {\"id\": \"aq1dwbf661yx337hjcd5q3sbxwa\", \"color\": \"propColorGreen\", \"value\": \"Went Well ?\"}, {\"id\": \"ar87yh5xmsswqkxmjq1ipfftfpc\", \"color\": \"propColorRed\", \"value\": \"Didn\'t Go Well ?\"}, {\"id\": \"akj3fkmxq7idma55mdt8sqpumyw\", \"color\": \"propColorBlue\", \"value\": \"Action Items ✅\"}]}, {\"id\": \"aspaay76a5wrnuhtqgm97tt3rer\", \"name\": \"Details\", \"type\": \"text\", \"options\": []}, {\"id\": \"arzsm76s376y7suuhao3tu6efoc\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"a8anbe5fpa668sryatcdsuuyh8a\", \"name\": \"Created Time\", \"type\": \"createdTime\", \"options\": []}]',1675955592029,1675955592029,0,'');
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
INSERT INTO `focalboard_boards_history` VALUES ('b3czjjrq9bb8b7fmo8n73niho1h','2023-02-09 15:13:12.248950','0','','system','system','O','Roadmap ','Use this template to plan your roadmap and manage your releases more efficiently.','?️',1,1,6,'{\"trackingTemplateId\": \"b728c6ca730e2cfc229741c5a4712b65\"}','[{\"id\": \"50117d52-bcc7-4750-82aa-831a351c44a0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"8c557f69-b0ed-46ec-83a3-8efab9d47ef5\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"ec6d2bc5-df2b-4f77-8479-e59ceb039946\", \"color\": \"propColorYellow\", \"value\": \"In Progress\"}, {\"id\": \"849766ba-56a5-48d1-886f-21672f415395\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"20717ad3-5741-4416-83f1-6f133fff3d11\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"424ea5e3-9aa1-4075-8c5c-01b44b66e634\", \"color\": \"propColorYellow\", \"value\": \"Epic ⛰\"}, {\"id\": \"6eea96c9-4c61-4968-8554-4b7537e8f748\", \"color\": \"propColorGreen\", \"value\": \"Task ?\"}, {\"id\": \"1fdbb515-edd2-4af5-80fc-437ed2211a49\", \"color\": \"propColorRed\", \"value\": \"Bug ?\"}]}, {\"id\": \"60985f46-3e41-486e-8213-2b987440ea1c\", \"name\": \"Sprint\", \"type\": \"select\", \"options\": [{\"id\": \"c01676ca-babf-4534-8be5-cce2287daa6c\", \"color\": \"propColorBrown\", \"value\": \"Sprint 1\"}, {\"id\": \"ed4a5340-460d-461b-8838-2c56e8ee59fe\", \"color\": \"propColorPurple\", \"value\": \"Sprint 2\"}, {\"id\": \"14892380-1a32-42dd-8034-a0cea32bc7e6\", \"color\": \"propColorBlue\", \"value\": \"Sprint 3\"}]}, {\"id\": \"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"e6a7f297-4440-4783-8ab3-3af5ba62ca11\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"c62172ea-5da7-4dec-8186-37267d8ee9a7\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aphg37f7zbpuc3bhwhp19s1ribh\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a4378omyhmgj3bex13sj4wbpfiy\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"a36o9q1yik6nmar6ri4q4uca7ey\", \"name\": \"Created Date\", \"type\": \"createdTime\", \"options\": []}, {\"id\": \"ai7ajsdk14w7x5s8up3dwir77te\", \"name\": \"Design Link\", \"type\": \"url\", \"options\": []}]',1675955592239,1675955592239,0,''),('b9wseunsg8b8w7gubd7zbgabjkh','2023-02-09 15:13:09.888261','0','','system','system','O','Personal Goals ','Use this template to set and accomplish new personal goals.','⛰️',1,1,6,'{\"trackingTemplateId\": \"7f32dc8d2ae008cfe56554e9363505cc\"}','[{\"id\": \"af6fcbb8-ca56-4b73-83eb-37437b9a667d\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a\", \"color\": \"propColorRed\", \"value\": \"To Do\"}, {\"id\": \"77c539af-309c-4db1-8329-d20ef7e9eacd\", \"color\": \"propColorYellow\", \"value\": \"Doing\"}, {\"id\": \"98bdea27-0cce-4cde-8dc6-212add36e63a\", \"color\": \"propColorGreen\", \"value\": \"Done ?\"}]}, {\"id\": \"d9725d14-d5a8-48e5-8de1-6f8c004a9680\", \"name\": \"Category\", \"type\": \"select\", \"options\": [{\"id\": \"3245a32d-f688-463b-87f4-8e7142c1b397\", \"color\": \"propColorPurple\", \"value\": \"Life Skills\"}, {\"id\": \"80be816c-fc7a-4928-8489-8b02180f4954\", \"color\": \"propColorGreen\", \"value\": \"Finance\"}, {\"id\": \"ffb3f951-b47f-413b-8f1d-238666728008\", \"color\": \"propColorOrange\", \"value\": \"Health\"}]}, {\"id\": \"d6b1249b-bc18-45fc-889e-bec48fce80ef\", \"name\": \"Target\", \"type\": \"select\", \"options\": [{\"id\": \"9a090e33-b110-4268-8909-132c5002c90e\", \"color\": \"propColorBlue\", \"value\": \"Q1\"}, {\"id\": \"0a82977f-52bf-457b-841b-e2b7f76fb525\", \"color\": \"propColorBrown\", \"value\": \"Q2\"}, {\"id\": \"6e7139e4-5358-46bb-8c01-7b029a57b80a\", \"color\": \"propColorGreen\", \"value\": \"Q3\"}, {\"id\": \"d5371c63-66bf-4468-8738-c4dc4bea4843\", \"color\": \"propColorPurple\", \"value\": \"Q4\"}]}, {\"id\": \"ajy6xbebzopojaenbnmfpgtdwso\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}]',1675955589881,1675955589881,0,''),('bat83fib1b3ny9bhmof1cpd59sr','2023-02-09 15:13:11.192039','0','','system','system','O','Competitive Analysis','Use this template to track and stay ahead of the competition.','?️',1,1,6,'{\"trackingTemplateId\": \"06f4bff367a7c2126fab2380c9dec23c\"}','[{\"id\": \"ahzspe59iux8wigra8bg6cg18nc\", \"name\": \"Website\", \"type\": \"url\", \"options\": []}, {\"id\": \"aozntq4go4nkab688j1s7stqtfc\", \"name\": \"Location\", \"type\": \"text\", \"options\": []}, {\"id\": \"aiefo7nh9jwisn8b4cgakowithy\", \"name\": \"Revenue\", \"type\": \"text\", \"options\": []}, {\"id\": \"a6cwaq79b1pdpb97wkanmeyy4er\", \"name\": \"Employees\", \"type\": \"number\", \"options\": []}, {\"id\": \"an1eerzscfxn6awdfajbg41uz3h\", \"name\": \"Founded\", \"type\": \"text\", \"options\": []}, {\"id\": \"a1semdhszu1rq17d7et5ydrqqio\", \"name\": \"Market Position\", \"type\": \"select\", \"options\": [{\"id\": \"arfjpz9by5car71tz3behba8yih\", \"color\": \"propColorYellow\", \"value\": \"Leader\"}, {\"id\": \"abajmr34b8g1916w495xjb35iko\", \"color\": \"propColorRed\", \"value\": \"Challenger\"}, {\"id\": \"abt79uxg5edqojsrrefcnr4eruo\", \"color\": \"propColorBlue\", \"value\": \"Follower\"}, {\"id\": \"aipf3qfgjtkheiayjuxrxbpk9wa\", \"color\": \"propColorBrown\", \"value\": \"Nicher\"}]}, {\"id\": \"aapogff3xoa8ym7xf56s87kysda\", \"name\": \"Last updated time\", \"type\": \"updatedTime\", \"options\": []}, {\"id\": \"az3jkw3ynd3mqmart7edypey15e\", \"name\": \"Last updated by\", \"type\": \"updatedBy\", \"options\": []}]',1675955591185,1675955591185,0,''),('bdqwwu3hqq7rafgkfwc1wetff6c','2023-02-09 15:13:04.549170','0','','system','system','O','Sales Pipeline CRM','Use this template to grow and keep track of your sales opportunities.','?',1,1,6,'{\"trackingTemplateId\": \"ecc250bb7dff0fe02247f1110f097544\"}','[{\"id\": \"a5hwxjsmkn6bak6r7uea5bx1kwc\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"akj61wc9yxdwyw3t6m8igyf9d5o\", \"color\": \"propColorGray\", \"value\": \"Lead\"}, {\"id\": \"aic89a5xox4wbppi6mbyx6ujsda\", \"color\": \"propColorYellow\", \"value\": \"Qualified\"}, {\"id\": \"ah6ehh43rwj88jy4awensin8pcw\", \"color\": \"propColorBrown\", \"value\": \"Meeting\"}, {\"id\": \"aprhd96zwi34o9cs4xyr3o9sf3c\", \"color\": \"propColorPurple\", \"value\": \"Proposal\"}, {\"id\": \"axesd74yuxtbmw1sbk8ufax7z3a\", \"color\": \"propColorOrange\", \"value\": \"Negotiation\"}, {\"id\": \"a5txuiubumsmrs8gsd5jz5gc1oa\", \"color\": \"propColorRed\", \"value\": \"Lost\"}, {\"id\": \"acm9q494bcthyoqzmfogxxy5czy\", \"color\": \"propColorGreen\", \"value\": \"Closed ?\"}]}, {\"id\": \"aoheuj1f3mu6eehygr45fxa144y\", \"name\": \"Account Owner\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"aro91wme9kfaie5ceu9qasmtcnw\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"apjnaggwixchfxwiatfh7ey7uno\", \"color\": \"propColorRed\", \"value\": \"High ?\"}, {\"id\": \"apiswzj7uiwbh87z8dw8c6mturw\", \"color\": \"propColorYellow\", \"value\": \"Medium\"}, {\"id\": \"auu9bfzqeuruyjwzzqgz7q8apuw\", \"color\": \"propColorBrown\", \"value\": \"Low\"}]}, {\"id\": \"ainpw47babwkpyj77ic4b9zq9xr\", \"name\": \"Company\", \"type\": \"text\", \"options\": []}, {\"id\": \"ahf43e44h3y8ftanqgzno9z7q7w\", \"name\": \"Estimated Value\", \"type\": \"number\", \"options\": []}, {\"id\": \"amahgyn9n4twaapg3jyxb6y4jic\", \"name\": \"Territory\", \"type\": \"select\", \"options\": [{\"id\": \"ar6t1ttcumgfuqugg5o4g4mzrza\", \"color\": \"propColorBrown\", \"value\": \"Western US\"}, {\"id\": \"asbwojkm7zb4ohrtij97jkdfgwe\", \"color\": \"propColorGreen\", \"value\": \"Mountain West / Central US\"}, {\"id\": \"aw8ppwtcrm8iwopdadje3ni196w\", \"color\": \"propColorGray\", \"value\": \"Mid-Atlantic / Southeast\"}, {\"id\": \"aafwyza5iwdcwcyfyj6bp7emufw\", \"color\": \"propColorBlue\", \"value\": \"Northeast US / Canada\"}, {\"id\": \"agw8rcb9uxyt3c7g6tq3r65fgqe\", \"color\": \"propColorPink\", \"value\": \"Eastern Europe\"}, {\"id\": \"as5bk6afoaaa7caewe1zc391sce\", \"color\": \"propColorPurple\", \"value\": \"Central Europe / Africa\"}, {\"id\": \"a8fj94bka8z9t6p95qd3hn6t5re\", \"color\": \"propColorYellow\", \"value\": \"Middle East\"}, {\"id\": \"arpxa3faaou9trt4zx5sh435gne\", \"color\": \"propColorOrange\", \"value\": \"UK\"}, {\"id\": \"azdidd5wze4kcxf8neefj3ctkyr\", \"color\": \"propColorRed\", \"value\": \"Asia\"}, {\"id\": \"a4jn5mhqs3thknqf5opykntgsnc\", \"color\": \"propColorGray\", \"value\": \"Australia\"}, {\"id\": \"afjbgrecb7hp5owj7xh8u4w33tr\", \"color\": \"propColorBrown\", \"value\": \"Latin America\"}]}, {\"id\": \"abru6tz8uebdxy4skheqidh7zxy\", \"name\": \"Email\", \"type\": \"email\", \"options\": []}, {\"id\": \"a1438fbbhjeffkexmcfhnx99o1h\", \"name\": \"Phone\", \"type\": \"phone\", \"options\": []}, {\"id\": \"auhf91pm85f73swwidi4wid8jqe\", \"name\": \"Last Contact Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"adtf1151chornmihz4xbgbk9exa\", \"name\": \"Expected Close\", \"type\": \"date\", \"options\": []}, {\"id\": \"aejo5tcmq54bauuueem9wc4fw4y\", \"name\": \"Close Probability\", \"type\": \"text\", \"options\": []}, {\"id\": \"amba7ot98fh7hwsx8jdcfst5g7h\", \"name\": \"Created Date\", \"type\": \"createdTime\", \"options\": []}]',1675955584541,1675955584541,0,''),('bftee3gu1tigb586p9wywiqtwer','2023-02-09 15:13:10.860523','0','','system','system','O','User Research Sessions','Use this template to manage and keep track of all your user research sessions.','?',1,1,6,'{\"trackingTemplateId\": \"6c345c7f50f6833f78b7d0f08ce450a3\"}','[{\"id\": \"aaebj5fyx493eezx6ukxiwydgty\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"af6hjb3ysuaxbwnfqpby4wwnkdr\", \"color\": \"propColorGray\", \"value\": \"Backlog ?\"}, {\"id\": \"aotxum1p5bw3xuzqz3ctjw66yww\", \"color\": \"propColorYellow\", \"value\": \"Contacted ?\"}, {\"id\": \"a7yq89whddzob1futao4rxk3yzc\", \"color\": \"propColorBlue\", \"value\": \"Scheduled ?\"}, {\"id\": \"aseqq9hrsua56r3s6nbuirj9eec\", \"color\": \"propColorRed\", \"value\": \"Cancelled ?\"}, {\"id\": \"ap93ysuzy1xa7z818r6myrn4h4y\", \"color\": \"propColorGreen\", \"value\": \"Completed ✔️\"}]}, {\"id\": \"akrxgi7p7w14fym3gbynb98t9fh\", \"name\": \"Interview Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"atg9qu6oe4bjm8jczzsn71ff5me\", \"name\": \"Product Area\", \"type\": \"select\", \"options\": [{\"id\": \"ahn89mqg9u4igk6pdm7333t8i5h\", \"color\": \"propColorGreen\", \"value\": \"Desktop App\"}, {\"id\": \"aehc83ffays3gh8myz16a8j7k4e\", \"color\": \"propColorPurple\", \"value\": \"Web App\"}, {\"id\": \"a1sxagjgaadym5yrjak6tcup1oa\", \"color\": \"propColorBlue\", \"value\": \"Mobile App\"}]}, {\"id\": \"acjq4t5ymytu8x1f68wkggm7ypc\", \"name\": \"Email\", \"type\": \"email\", \"options\": []}, {\"id\": \"aphio1s5gkmpdbwoxynim7acw3e\", \"name\": \"Interviewer\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"aqafzdeekpyncwz7m7i54q3iqqy\", \"name\": \"Recording URL\", \"type\": \"url\", \"options\": []}, {\"id\": \"aify3r761b9w43bqjtskrzi68tr\", \"name\": \"Passcode\", \"type\": \"text\", \"options\": []}]',1675955590853,1675955590853,0,''),('biafjiuypqid5ukjfumu3qgkw6o','2023-02-09 15:13:06.886828','0','','system','system','O','Personal Tasks ','Use this template to organize your life and track your personal tasks.','✔️',1,1,6,'{\"trackingTemplateId\": \"dfb70c146a4584b8a21837477c7b5431\"}','[{\"id\": \"a9zf59u8x1rf4ywctpcqama7tio\", \"name\": \"Occurrence\", \"type\": \"select\", \"options\": [{\"id\": \"an51dnkenmoog9cetapbc4uyt3y\", \"color\": \"propColorBlue\", \"value\": \"Daily\"}, {\"id\": \"afpy8s7i45frggprmfsqngsocqh\", \"color\": \"propColorOrange\", \"value\": \"Weekly\"}, {\"id\": \"aj4jyekqqssatjcq7r7chmy19ey\", \"color\": \"propColorPurple\", \"value\": \"Monthly\"}]}, {\"id\": \"abthng7baedhhtrwsdodeuincqy\", \"name\": \"Completed\", \"type\": \"checkbox\", \"options\": []}]',1675955586880,1675955586880,0,''),('boegirwoddb8ojrr19gnf8dwotr','2023-02-09 15:13:03.563824','0','','system','system','O','Meeting Agenda ','Use this template for recurring meeting agendas, like team meetings and 1:1\'s. To use this board:\n* Participants queue new items to discuss under \"To Discuss\"\n* Go through items during the meeting\n* Move items to Done or Revisit Later as needed','?',1,1,6,'{\"trackingTemplateId\": \"54fcf9c610f0ac5e4c522c0657c90602\"}','[{\"id\": \"d777ba3b-8728-40d1-87a6-59406bbbbfb0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"34eb9c25-d5bf-49d9-859e-f74f4e0030e7\", \"color\": \"propColorPink\", \"value\": \"To Discuss ?\"}, {\"id\": \"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed\", \"color\": \"propColorYellow\", \"value\": \"Revisit Later ⏳\"}, {\"id\": \"dabadd9b-adf1-4d9f-8702-805ac6cef602\", \"color\": \"propColorGreen\", \"value\": \"Done / Archived ?\"}]}, {\"id\": \"4cf1568d-530f-4028-8ffd-bdc65249187e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"8b05c83e-a44a-4d04-831e-97f01d8e2003\", \"color\": \"propColorRed\", \"value\": \"1. High\"}, {\"id\": \"b1abafbf-a038-4a19-8b68-56e0fd2319f7\", \"color\": \"propColorYellow\", \"value\": \"2. Medium\"}, {\"id\": \"2491ffaa-eb55-417b-8aff-4bd7d4136613\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"aw4w63xhet79y9gueqzzeiifdoe\", \"name\": \"Created by\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"a6ux19353xcwfqg9k1inqg5sg4w\", \"name\": \"Created time\", \"type\": \"createdTime\", \"options\": []}]',1675955583554,1675955583554,0,''),('bqcoxgsa4xjfwu8tfnu9k18piha','2023-02-09 15:13:10.083196','0','','system','system','O','Sprint Planner ','Use this template to plan your sprints and manage your releases more efficiently.','?️',1,1,6,'{\"trackingTemplateId\": \"99b74e26d2f5d0a9b346d43c0a7bfb09\"}','[{\"id\": \"50117d52-bcc7-4750-82aa-831a351c44a0\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"aft5bzo7h9aspqgrx3jpy5tzrer\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"abrfos7e7eczk9rqw6y5abadm1y\", \"color\": \"propColorOrange\", \"value\": \"Next Up\"}, {\"id\": \"ax8wzbka5ahs3zziji3pp4qp9mc\", \"color\": \"propColorBlue\", \"value\": \"In Progress\"}, {\"id\": \"atabdfbdmjh83136d5e5oysxybw\", \"color\": \"propColorYellow\", \"value\": \"In Review\"}, {\"id\": \"ace1bzypd586kkyhcht5qqd9eca\", \"color\": \"propColorPink\", \"value\": \"Approved\"}, {\"id\": \"aay656c9m1hzwxc9ch5ftymh3nw\", \"color\": \"propColorRed\", \"value\": \"Blocked\"}, {\"id\": \"a6ghze4iy441qhsh3eijnc8hwze\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"20717ad3-5741-4416-83f1-6f133fff3d11\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"424ea5e3-9aa1-4075-8c5c-01b44b66e634\", \"color\": \"propColorYellow\", \"value\": \"Epic ⛰\"}, {\"id\": \"a5yxq8rbubrpnoommfwqmty138h\", \"color\": \"propColorGray\", \"value\": \"Feature ?\"}, {\"id\": \"apht1nt5ryukdmxkh6fkfn6rgoy\", \"color\": \"propColorOrange\", \"value\": \"User Story ?\"}, {\"id\": \"aiycbuo3dr5k4xxbfr7coem8ono\", \"color\": \"propColorGreen\", \"value\": \"Task ⛏\"}, {\"id\": \"aomnawq4551cbbzha9gxnmb3z5w\", \"color\": \"propColorRed\", \"value\": \"Bug ?\"}]}, {\"id\": \"60985f46-3e41-486e-8213-2b987440ea1c\", \"name\": \"Sprint\", \"type\": \"select\", \"options\": [{\"id\": \"c01676ca-babf-4534-8be5-cce2287daa6c\", \"color\": \"propColorBrown\", \"value\": \"Sprint 1\"}, {\"id\": \"ed4a5340-460d-461b-8838-2c56e8ee59fe\", \"color\": \"propColorPurple\", \"value\": \"Sprint 2\"}, {\"id\": \"14892380-1a32-42dd-8034-a0cea32bc7e6\", \"color\": \"propColorBlue\", \"value\": \"Sprint 3\"}]}, {\"id\": \"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"e6a7f297-4440-4783-8ab3-3af5ba62ca11\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"c62172ea-5da7-4dec-8186-37267d8ee9a7\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aphg37f7zbpuc3bhwhp19s1ribh\", \"name\": \"Assignee\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"a4378omyhmgj3bex13sj4wbpfiy\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"ai7ajsdk14w7x5s8up3dwir77te\", \"name\": \"Story Points\", \"type\": \"number\", \"options\": []}, {\"id\": \"a1g6i613dpe9oryeo71ex3c86hy\", \"name\": \"Design Link\", \"type\": \"url\", \"options\": []}, {\"id\": \"aeomttrbhhsi8bph31jn84sto6h\", \"name\": \"Created Time\", \"type\": \"createdTime\", \"options\": []}, {\"id\": \"ax9f8so418s6s65hi5ympd93i6a\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}]',1675955590076,1675955590076,0,''),('bqf1dca4xubycjbgbyjiia7e3sr','2023-02-09 15:13:11.509928','0','','system','system','O','Content Calendar ','Use this template to plan and organize your editorial content.','?',1,1,6,'{\"trackingTemplateId\": \"c75fbd659d2258b5183af2236d176ab4\"}','[{\"id\": \"ae9ar615xoknd8hw8py7mbyr7zo\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"awna1nuarjca99m9s4uiy9kwj5h\", \"color\": \"propColorGray\", \"value\": \"Idea ?\"}, {\"id\": \"a9ana1e9w673o5cp8md4xjjwfto\", \"color\": \"propColorOrange\", \"value\": \"Draft\"}, {\"id\": \"apy9dcd7zmand615p3h53zjqxjh\", \"color\": \"propColorPurple\", \"value\": \"In Review\"}, {\"id\": \"acri4cm3bmay55f7ksztphmtnga\", \"color\": \"propColorBlue\", \"value\": \"Ready to Publish\"}, {\"id\": \"amsowcd9a8e1kid317r7ttw6uzh\", \"color\": \"propColorGreen\", \"value\": \"Published ?\"}]}, {\"id\": \"aysx3atqexotgwp5kx6h5i5ancw\", \"name\": \"Type\", \"type\": \"select\", \"options\": [{\"id\": \"aywiofmmtd3ofgzj95ysky4pjga\", \"color\": \"propColorOrange\", \"value\": \"Press Release\"}, {\"id\": \"apqdgjrmsmx8ngmp7zst51647de\", \"color\": \"propColorGreen\", \"value\": \"Sponsored Post\"}, {\"id\": \"a3woynbjnb7j16e74uw3pubrytw\", \"color\": \"propColorPurple\", \"value\": \"Customer Story\"}, {\"id\": \"aq36k5pkpfcypqb3idw36xdi1fh\", \"color\": \"propColorRed\", \"value\": \"Product Release\"}, {\"id\": \"azn66pmk34adygnizjqhgiac4ia\", \"color\": \"propColorGray\", \"value\": \"Partnership\"}, {\"id\": \"aj8y675weso8kpb6eceqbpj4ruw\", \"color\": \"propColorBlue\", \"value\": \"Feature Announcement\"}, {\"id\": \"a3xky7ygn14osr1mokerbfah5cy\", \"color\": \"propColorYellow\", \"value\": \"Article\"}]}, {\"id\": \"ab6mbock6styfe6htf815ph1mhw\", \"name\": \"Channel\", \"type\": \"multiSelect\", \"options\": [{\"id\": \"a8xceonxiu4n3c43szhskqizicr\", \"color\": \"propColorBrown\", \"value\": \"Website\"}, {\"id\": \"a3pdzi53kpbd4okzdkz6khi87zo\", \"color\": \"propColorGreen\", \"value\": \"Blog\"}, {\"id\": \"a3d9ux4fmi3anyd11kyipfbhwde\", \"color\": \"propColorOrange\", \"value\": \"Email\"}, {\"id\": \"a8cbbfdwocx73zn3787cx6gacsh\", \"color\": \"propColorRed\", \"value\": \"Podcast\"}, {\"id\": \"aigjtpcaxdp7d6kmctrwo1ztaia\", \"color\": \"propColorPink\", \"value\": \"Print\"}, {\"id\": \"af1wsn13muho59e7ghwaogxy5ey\", \"color\": \"propColorBlue\", \"value\": \"Facebook\"}, {\"id\": \"a47zajfxwhsg6q8m7ppbiqs7jge\", \"color\": \"propColorGray\", \"value\": \"LinkedIn\"}, {\"id\": \"az8o8pfe9hq6s7xaehoqyc3wpyc\", \"color\": \"propColorYellow\", \"value\": \"Twitter\"}]}, {\"id\": \"ao44fz8nf6z6tuj1x31t9yyehcc\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a39x5cybshwrbjpc3juaakcyj6e\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"agqsoiipowmnu9rdwxm57zrehtr\", \"name\": \"Publication Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"ap4e7kdg7eip7j3c3oyiz39eaoc\", \"name\": \"Link\", \"type\": \"url\", \"options\": []}]',1675955591503,1675955591503,0,''),('bubw9oxrmnifczyxtkexbx5fopy','2023-02-09 15:13:09.601676','0','','system','system','O','Company Goals & OKRs','Use this template to plan your company goals and OKRs more efficiently.','⛳',1,1,6,'{\"trackingTemplateId\": \"7ba22ccfdfac391d63dea5c4b8cde0de\"}','[{\"id\": \"a6amddgmrzakw66cidqzgk6p4ge\", \"name\": \"Objective\", \"type\": \"select\", \"options\": [{\"id\": \"auw3afh3kfhrfgmjr8muiz137jy\", \"color\": \"propColorGreen\", \"value\": \"Grow Revenue\"}, {\"id\": \"apqfjst8massbjjhpcsjs3y1yqa\", \"color\": \"propColorOrange\", \"value\": \"Delight Customers\"}, {\"id\": \"ao9b5pxyt7tkgdohzh9oaustdhr\", \"color\": \"propColorPurple\", \"value\": \"Drive Product Adoption\"}]}, {\"id\": \"a17ryhi1jfsboxkwkztwawhmsxe\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"a6robxx81diugpjq5jkezz3j1fo\", \"color\": \"propColorGray\", \"value\": \"Not Started\"}, {\"id\": \"a8nukezwwmknqwjsygg7eaxs9te\", \"color\": \"propColorBlue\", \"value\": \"In Progress\"}, {\"id\": \"apnt1f7na9rzgk1rt49keg7xbiy\", \"color\": \"propColorYellow\", \"value\": \"At Risk\"}, {\"id\": \"axbz3m1amss335wzwf9s7pqjzxr\", \"color\": \"propColorRed\", \"value\": \"Missed\"}, {\"id\": \"abzfwnn6rmtfzyq5hg8uqmpsncy\", \"color\": \"propColorGreen\", \"value\": \"Complete ?\"}]}, {\"id\": \"azzbawji5bksj69sekcs4srm1ky\", \"name\": \"Department\", \"type\": \"select\", \"options\": [{\"id\": \"aw5i7hmpadn6mbwbz955ubarhme\", \"color\": \"propColorBrown\", \"value\": \"Engineering\"}, {\"id\": \"afkxpcjqjypu7hhar7banxau91h\", \"color\": \"propColorBlue\", \"value\": \"Product\"}, {\"id\": \"aehoa17cz18rqnrf75g7dwhphpr\", \"color\": \"propColorOrange\", \"value\": \"Marketing\"}, {\"id\": \"agrfeaoj7d8p5ianw5iaf3191ae\", \"color\": \"propColorGreen\", \"value\": \"Sales\"}, {\"id\": \"agm9p6gcq15ueuzqq3wd4be39wy\", \"color\": \"propColorYellow\", \"value\": \"Support\"}, {\"id\": \"aucop7kw6xwodcix6zzojhxih6r\", \"color\": \"propColorPink\", \"value\": \"Design\"}, {\"id\": \"afust91f3g8ht368mkn5x9tgf1o\", \"color\": \"propColorPurple\", \"value\": \"Finance\"}, {\"id\": \"acocxxwjurud1jixhp7nowdig7y\", \"color\": \"propColorGray\", \"value\": \"Human Resources\"}]}, {\"id\": \"adp5ft3kgz7r5iqq3tnwg551der\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"a8zg3rjtf4swh7smsjxpsn743rh\", \"color\": \"propColorRed\", \"value\": \"P1 ?\"}, {\"id\": \"as555ipyzopjjpfb5rjtssecw5e\", \"color\": \"propColorYellow\", \"value\": \"P2\"}, {\"id\": \"a1ts3ftyr8nocsicui98c89uxjy\", \"color\": \"propColorGray\", \"value\": \"P3\"}]}, {\"id\": \"aqxyzkdrs4egqf7yk866ixkaojc\", \"name\": \"Quarter\", \"type\": \"select\", \"options\": [{\"id\": \"ahfbn1jsmhydym33ygxwg5jt3kh\", \"color\": \"propColorBlue\", \"value\": \"Q1\"}, {\"id\": \"awfu37js3fomfkkczm1zppac57a\", \"color\": \"propColorBrown\", \"value\": \"Q2\"}, {\"id\": \"anruuoyez51r3yjxuoc8zoqnwaw\", \"color\": \"propColorGreen\", \"value\": \"Q3\"}, {\"id\": \"acb6dqqs6yson7bbzx6jk9bghjh\", \"color\": \"propColorPurple\", \"value\": \"Q4\"}]}, {\"id\": \"adu6mebzpibq6mgcswk69xxmnqe\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"asope3bddhm4gpsng5cfu4hf6rh\", \"name\": \"Assignee\", \"type\": \"multiPerson\", \"options\": []}, {\"id\": \"ajwxp866f9obs1kutfwaa5ru7fe\", \"name\": \"Target\", \"type\": \"number\", \"options\": []}, {\"id\": \"azqnyswk6s1boiwuthscm78qwuo\", \"name\": \"Actual\", \"type\": \"number\", \"options\": []}, {\"id\": \"ahz3fmjnaguec8hce7xq3h5cjdr\", \"name\": \"Completion (%)\", \"type\": \"text\", \"options\": []}, {\"id\": \"a17bfcgnzmkwhziwa4tr38kiw5r\", \"name\": \"Note\", \"type\": \"text\", \"options\": []}]',1675955589594,1675955589594,0,''),('bw5z4u7spotb3xkimsx1njfcwoy','2023-02-09 15:13:13.260227','0','','system','system','O','Welcome to Boards!','Mattermost Boards is an open source project management tool that helps you organize, track, and manage work across teams. Select a card to learn more.','?',1,1,6,'{\"trackingTemplateId\": \"65aba997282f3ac457cd66736fb86915\"}','[{\"id\": \"a972dc7a-5f4c-45d2-8044-8c28c69717f1\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"amm6wfhnbuxojwssyftgs9dipqe\", \"color\": \"propColorRed\", \"value\": \"To do ?\"}, {\"id\": \"af3p8ztcyxgn8wd9z4az7o9tjeh\", \"color\": \"propColorYellow\", \"value\": \"Next up\"}, {\"id\": \"ajurey3xkocs1nwx8di5zx6oe7o\", \"color\": \"propColorPurple\", \"value\": \"Later\"}, {\"id\": \"agkinkjy5983wsk6kppsujajxqw\", \"color\": \"propColorGreen\", \"value\": \"Completed ?\"}]}, {\"id\": \"acypkejeb5yfujhj9te57p9kaxw\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"aanaehcw3m13jytujsjk5hpf6ry\", \"color\": \"propColorOrange\", \"value\": \"1. High\"}, {\"id\": \"ascd7nm9r491ayot8i86g1gmgqw\", \"color\": \"propColorBrown\", \"value\": \"2. Medium\"}, {\"id\": \"aq6ukoiciyfctgwyhwzpfss8ghe\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"aqh13jabwexjkzr3jqsz1i1syew\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"acmg7mz1rr1eykfug4hcdpb1y1o\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"amewjwfjrtpu8ha73xsrdmxazxr\", \"name\": \"Reviewed\", \"type\": \"checkbox\", \"options\": []}, {\"id\": \"attzzboqaz6m1sdti5xa7gjnk1e\", \"name\": \"Last updated time\", \"type\": \"updatedTime\", \"options\": []}, {\"id\": \"a4nfnb5xr3txr5xq7y9ho7kyz6c\", \"name\": \"Reference\", \"type\": \"url\", \"options\": []}, {\"id\": \"a9gzwi3dt5n55nddej6zcbhxaeh\", \"name\": \"Created by\", \"type\": \"createdBy\", \"options\": []}]',1675955593253,1675955593253,0,''),('bwdfr59gmy3r43nrsmupxwt1rje','2023-02-09 15:13:08.383320','0','','system','system','O','Project Tasks ','Use this template to stay on top of your project tasks and progress.','?',1,1,6,'{\"trackingTemplateId\": \"a4ec399ab4f2088b1051c3cdf1dde4c3\"}','[{\"id\": \"a972dc7a-5f4c-45d2-8044-8c28c69717f1\", \"name\": \"Status\", \"type\": \"select\", \"options\": [{\"id\": \"ayz81h9f3dwp7rzzbdebesc7ute\", \"color\": \"propColorBlue\", \"value\": \"Not Started\"}, {\"id\": \"ar6b8m3jxr3asyxhr8iucdbo6yc\", \"color\": \"propColorYellow\", \"value\": \"In Progress\"}, {\"id\": \"afi4o5nhnqc3smtzs1hs3ij34dh\", \"color\": \"propColorRed\", \"value\": \"Blocked\"}, {\"id\": \"adeo5xuwne3qjue83fcozekz8ko\", \"color\": \"propColorGreen\", \"value\": \"Completed ?\"}, {\"id\": \"ahpyxfnnrzynsw3im1psxpkgtpe\", \"color\": \"propColorBrown\", \"value\": \"Archived\"}]}, {\"id\": \"d3d682bf-e074-49d9-8df5-7320921c2d23\", \"name\": \"Priority\", \"type\": \"select\", \"options\": [{\"id\": \"d3bfb50f-f569-4bad-8a3a-dd15c3f60101\", \"color\": \"propColorRed\", \"value\": \"1. High ?\"}, {\"id\": \"87f59784-b859-4c24-8ebe-17c766e081dd\", \"color\": \"propColorYellow\", \"value\": \"2. Medium\"}, {\"id\": \"98a57627-0f76-471d-850d-91f3ed9fd213\", \"color\": \"propColorGray\", \"value\": \"3. Low\"}]}, {\"id\": \"axkhqa4jxr3jcqe4k87g8bhmary\", \"name\": \"Assignee\", \"type\": \"person\", \"options\": []}, {\"id\": \"a8daz81s4xjgke1ww6cwik5w7ye\", \"name\": \"Estimated Hours\", \"type\": \"number\", \"options\": []}, {\"id\": \"a3zsw7xs8sxy7atj8b6totp3mby\", \"name\": \"Due Date\", \"type\": \"date\", \"options\": []}, {\"id\": \"a7gdnz8ff8iyuqmzddjgmgo9ery\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"2a5da320-735c-4093-8787-f56e15cdfeed\", \"name\": \"Date Created\", \"type\": \"createdTime\", \"options\": []}]',1675955588376,1675955588376,0,''),('bynzzcwfksfnq9m5utpd7wa76ch','2023-02-09 15:13:12.035797','0','','system','system','O','Team Retrospective','Use this template at the end of your project or sprint to identify what worked well and what can be improved for the future.','?',1,1,6,'{\"trackingTemplateId\": \"e4f03181c4ced8edd4d53d33d569a086\"}','[{\"id\": \"adjckpdotpgkz7c6wixzw9ipb1e\", \"name\": \"Category\", \"type\": \"select\", \"options\": [{\"id\": \"aok6pgecm85qe9k5kcphzoe63ma\", \"color\": \"propColorGray\", \"value\": \"To Discuss ?\"}, {\"id\": \"aq1dwbf661yx337hjcd5q3sbxwa\", \"color\": \"propColorGreen\", \"value\": \"Went Well ?\"}, {\"id\": \"ar87yh5xmsswqkxmjq1ipfftfpc\", \"color\": \"propColorRed\", \"value\": \"Didn\'t Go Well ?\"}, {\"id\": \"akj3fkmxq7idma55mdt8sqpumyw\", \"color\": \"propColorBlue\", \"value\": \"Action Items ✅\"}]}, {\"id\": \"aspaay76a5wrnuhtqgm97tt3rer\", \"name\": \"Details\", \"type\": \"text\", \"options\": []}, {\"id\": \"arzsm76s376y7suuhao3tu6efoc\", \"name\": \"Created By\", \"type\": \"createdBy\", \"options\": []}, {\"id\": \"a8anbe5fpa668sryatcdsuuyh8a\", \"name\": \"Created Time\", \"type\": \"createdTime\", \"options\": []}]',1675955592029,1675955592029,0,'');
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
  `sort_order` bigint(20) DEFAULT NULL,
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
  `sort_order` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_boards_category_id` (`category_id`)
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
  `value` text,
  PRIMARY KEY (`userid`,`category`,`name`),
  KEY `idx_preferences_category` (`category`),
  KEY `idx_preferences_name` (`name`)
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
INSERT INTO `focalboard_schema_migrations` VALUES (1,'init'),(2,'system_settings_table'),(3,'blocks_rootid'),(4,'auth_table'),(5,'blocks_modifiedby'),(6,'sharing_table'),(7,'workspaces_table'),(8,'teams'),(9,'blocks_history'),(10,'blocks_created_by'),(11,'match_collation'),(12,'match_column_collation'),(13,'millisecond_timestamps'),(14,'add_not_null_constraint'),(15,'blocks_history_no_nulls'),(16,'subscriptions_table'),(17,'add_file_info'),(18,'add_teams_and_boards'),(19,'populate_categories'),(20,'populate_category_blocks'),(21,'create_boards_members_history'),(22,'create_default_board_role'),(23,'persist_category_collapsed_state'),(24,'mark_existsing_categories_collapsed'),(25,'indexes_update'),(26,'create_preferences_table'),(27,'migrate_user_props_to_preferences'),(28,'remove_template_channel_link'),(29,'add_category_type_field'),(30,'add_category_sort_order'),(31,'add_category_boards_sort_order'),(32,'move_boards_category_to_end');
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
INSERT INTO `focalboard_system_settings` VALUES ('CategoryUuidIdMigrationComplete','true'),('DeletedMembershipBoardsMigrationComplete','true'),('TeamLessBoardsMigrationComplete','true'),('TelemetryID','7otpp4gujeby5xbxoo9w6c5oboo'),('UniqueIDsMigrationComplete','true');
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

-- Dump completed on 2023-02-09 15:27:26
