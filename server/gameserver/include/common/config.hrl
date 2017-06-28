-ifndef(config_hrl).
-define(config_hrl,1).

-include("cfg_mapsetting.hrl").
-include("cfg_mainMenu.hrl").
-include("cfg_battlePropInfo.hrl").
-include("cfg_skill.hrl").
-include("cfg_skillCDGroup.hrl").
-include("cfg_attributeRegent.hrl").
-include("cfg_defRegent.hrl").
-include("cfg_item.hrl").
-include("cfg_equipment.hrl").
-include("cfg_monster.hrl").
-include("cfg_npc.hrl").
-include("cfg_player_base.hrl").
-include("cfg_task_new.hrl").
-include("cfg_skillmoneycost.hrl").
-include("cfg_npcstore.hrl").
-include("cfg_drop.hrl").
-include("cfg_drop_package.hrl").
-include("cfg_buff.hrl").
-include("cfg_petenhance.hrl").
-include("cfg_petLevelProperty.hrl").
-include("cfg_petrelation.hrl").
-include("cfg_pet.hrl").
-include("cfg_mount.hrl").
-include("cfg_skill_effect.hrl").
-include("cfg_equipdrop.hrl").
-include("cfg_player_desc.hrl").
-include("cfg_globalsetup.hrl").
-include("cfg_dailyActive.hrl").
-include("cfg_task_group.hrl").
-include("cfg_comboSkill.hrl").
-include("cfg_copymapScheduleInit.hrl").
-include("cfg_copymapScheduleSettle.hrl").
-include("cfg_copymapScheduleCharacters.hrl").
-include("cfg_object.hrl").
-include("cfg_itemCDandCount.hrl").
-include("cfg_dungeonschallenge.hrl").
-include("cfg_guild.hrl").
-include("cfg_guildbuff.hrl").
-include("cfg_guildskill.hrl").
-include("cfg_guildsupplies.hrl").
-include("cfg_guild_reward.hrl").
-include("cfg_guildhome_task.hrl").
-include("cfg_factionList.hrl").
-include("cfg_indexGrowth.hrl").
-include("cfg_rift.hrl").
-include("cfg_rift_rand.hrl").
-include("cfg_demonBattleID.hrl").
-include("cfg_demonBattleLoc.hrl").
-include("cfg_demonreward.hrl").
-include("cfg_worldboss.hrl").
-include("cfg_openbag.hrl").
-include("cfg_dailyInterface.hrl").
-include("cfg_gemproperty.hrl").
-include("cfg_gembox_info.hrl").
-include("cfg_fashion.hrl").
-include("cfg_knighted_level.hrl").
-include("cfg_vip_power.hrl").
-include("cfg_rank.hrl").
-include("cfg_welfare.hrl").
-include("cfg_activity.hrl").
-include("cfg_chaos.hrl").
-include("cfg_lottery.hrl").
-include("cfg_mapConvey.hrl").
-include("cfg_achievement.hrl").
-include("cfg_achievecollection.hrl").
-include("cfg_titlesystem.hrl").
-include("cfg_rechargeFirst.hrl").
-include("cfg_rechargeAccumulation.hrl").
-include("cfg_monthCard.hrl").
-include("cfg_mall.hrl").
-include("cfg_transform.hrl").
-include("cfg_buddy_gift.hrl").
-include("cfg_buddy_dailytask.hrl").
-include("cfg_cost.hrl").
-include("cfg_petSkill.hrl").
-include("cfg_transformspell.hrl").
-include("cfg_petSkillRoll.hrl").
-include("cfg_sweeping_drop.hrl").
-include("cfg_fashionCollection.hrl").
-include("cfg_gorgeous.hrl").
-include("cfg_talentProp.hrl").
-include("cfg_talentExp.hrl").
-include("cfg_petEquipment.hrl").
-include("cfg_petEquipmentLevel.hrl").
-include("cfg_warriortrial.hrl").
-include("cfg_goddess.hrl").
-include("cfg_dailyrecharge.hrl").
-include("cfg_mysterious_shop.hrl").
-include("cfg_equipNewInten.hrl").
-include("cfg_equipIntenLevel.hrl").
-include("cfg_ladder_1v1.hrl").
-include("cfg_ladder_1v1_reward.hrl").
-include("cfg_ladder_1v1_rand.hrl").
-include("cfg_escort_monster.hrl").
-include("cfg_escort_event.hrl").
-include("cfg_darkness.hrl").
-include("cfg_indexFunction.hrl").
-include("cfg_dailytask.hrl").
-include("cfg_fightall.hrl").
-include("cfg_goblin.hrl").
-include("cfg_shenqi.hrl").
-include("cfg_skill_up.hrl").
-include("cfg_wildboss.hrl").
-include("cfg_battlepower.hrl").
-include("cfg_question.hrl").
-include("cfg_knightedPackage.hrl").
-include("cfg_petWar.hrl").
-include("cfg_pet_stronger.hrl").
-include("cfg_equipstar.hrl").
-include("cfg_monstergroup.hrl").
-include("cfg_divine.hrl").
-include("cfg_collectActivity.hrl").
-include("cfg_worldlevel_exp.hrl").
-include("cfg_pet_pvp.hrl").
-include("cfg_fightbossActivity.hrl").
-include("cfg_wing.hrl").
-include("cfg_itemTinker.hrl").
-include("cfg_serverstrings.hrl").
-include("cfg_arena.hrl").
-include("cfg_koreangift.hrl").
-include("cfg_find_res.hrl").
-include("cfg_signinaward.hrl").
-include("cfg_level_reward.hrl").
-include("cfg_drop_control.hrl").
-include("cfg_online_reward.hrl").
-include("cfg_monthly_signinaward.hrl").
-include("cfg_player_skills_upgrading.hrl").
-include("cfg_severday_task.hrl").
-include("cfg_angel_investment.hrl").
-include("cfg_petreborn.hrl").
-include("cfg_petfairy_level.hrl").
-include("cfg_petfairy_point.hrl").
-include("cfg_rune.hrl").
-include("cfg_rune_level.hrl").
-include("cfg_rune_smeltcost.hrl").
-include("cfg_rune_basePro.hrl").
-include("cfg_rune_randomPro.hrl").
-include("cfg_rune_suite.hrl").
-include("cfg_rune_compound.hrl").
-include("cfg_rune_battlepower.hrl").
-include("cfg_lotteryForTower.hrl").
-include("cfg_sixwar_monster.hrl").
-include("cfg_attedf.hrl").
-include("cfg_condition.hrl").
-include("cfg_condition_group.hrl").
-include("cfg_trigger.hrl").
-include("cfg_logic.hrl").
-include("cfg_logic_group.hrl").
-include("cfg_target.hrl").
-include("cfg_gem_level.hrl").
-include("cfg_identity_area.hrl").
-include("cfg_identity_tag.hrl").
-include("cfg_identity_zodiac.hrl").
-include("cfg_appointment.hrl").
-include("cfg_appointment_reward.hrl").
-include("cfg_fightForce.hrl").
-include("cfg_acKingBattleBuyBuff.hrl").
-include("cfg_specialinstance.hrl").
-include("cfg_goldDragon.hrl").
-include("cfg_spouseskill.hrl").
-include("cfg_weddingring.hrl").
-include("cfg_petfightForce.hrl").
-include("cfg_bubbleExpression.hrl").
-include("cfg_task.hrl").
-include("cfg_guildexchange.hrl").
-include("cfg_spiritArea.hrl").
-include("cfg_equipRecastAdvance.hrl").
-include("cfg_equipRecastInit.hrl").
-include("cfg_equipRecastRand.hrl").
-include("cfg_pet_territory_reward.hrl").
-include("cfg_pet_territory_time.hrl").
-include("cfg_pet_territory_force.hrl").
-include("cfg_pet_territory_search.hrl").
-include("cfg_skillBase.hrl").
-include("cfg_skillLevelParam.hrl").
-include("cfg_pet_star.hrl").
-include("cfg_pet_rebirth.hrl").
-include("cfg_task_other.hrl").
-endif.