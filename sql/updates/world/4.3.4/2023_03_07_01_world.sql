 -- Captive Spitescale Scout smart ai
SET @ENTRY := 38142;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryOrGuid` = @ENTRY;
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = @ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, 0, 0, 0, 0, 100, 0, 1000, 2000, 10000, 12000, 11, 15089, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Every 10 - 12 seconds (1 - 2s initially) (IC) - Self: Cast spell 15089 on Victim'),
(@ENTRY, 0, 1, 2, 8, 0, 100, 1, 84114, 0, 0, 0, 41, 120000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On spell 84114 hit - Self: Despawn in 120 s'),
(@ENTRY, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 20, 201968, 20, 0, 0, 0, 0, 0, 'On spell 84114 hit - Closest gameobject Darkspear Cage (201968) in 20 yards: Activate gameobject'),
(@ENTRY, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 67, 1, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On spell 84114 hit - Trigger timed event timedEvent[1] in 2000 - 2000 ms // -meta_wait'),
(@ENTRY, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 67, 2, 4000, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On spell 84114 hit - Trigger timed event timedEvent[2] in 4000 - 4000 ms // -meta_wait'),
(@ENTRY, 0, 5, 0, 59, 0, 100, 0, 1, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 19, 52426, 20, 0, 0, 0, 0, 0, 'On timed event timedEvent[1] triggered - Self: Move to Closest alive creature Generic Bunny (52426) in 20 yards'),
(@ENTRY, 0, 6, 0, 59, 0, 100, 0, 2, 0, 0, 0, 19, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On timed event timedEvent[2] triggered - Self: Remove UNIT_FLAGS to IMMUNE_TO_PC'),
(@ENTRY, 0, 7, 8, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On evade - Self: Despawn instantly'),
(@ENTRY, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 20, 201968, 20, 0, 0, 0, 0, 0, 'On evade - Closest gameobject Darkspear Cage (201968) in 20 yards: Activate gameobject'),
(@ENTRY, 0, 9, 0, 6, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 20, 201968, 20, 0, 0, 0, 0, 0, 'On death - Closest gameobject Darkspear Cage (201968) in 20 yards: Activate gameobject');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 38142 AND `SourceId` = 0;

 -- Darkspear Jailor smart ai
SET @ENTRY := 39062;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryOrGuid` = @ENTRY;
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = @ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, 0, 1, 62, 0, 100, 0, 10974, 0, 0, 0, 33, 39062, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip action I\'m ready to face my challenge. (0) from menu 10974 selected - Gossip player: Give kill credit Darkspear Jailor (39062)'),
(@ENTRY, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 84114, 0, 0, 0, 0, 0, 19, 38142, 20, 0, 0, 0, 0, 0, 'On gossip action I\'m ready to face my challenge. (0) from menu 10974 selected - Self: Cast spell 84114 on Closest alive creature Captive Spitescale Scout (38142) in 20 yards');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 39062 AND `SourceId` = 0;

 -- Modifying general trigger spell on spellhit event or cast action
UPDATE `smart_scripts` SET `event_param1` = 84114 WHERE `event_type` = 8 AND `event_param1` = 90252;
UPDATE `smart_scripts` SET `action_param1` = 84114 WHERE `action_type` = 11 AND `action_param1` = 90252;
