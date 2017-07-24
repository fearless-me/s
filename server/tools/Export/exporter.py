# -*- coding:UTF-8 -*-
#mysqldb      
import time, MySQLdb, os
import xlsxwriter      
import codecs 
import utils 
from datetime import datetime 

#连接

def acuTime():
	timeList =[]
	timeList += [['2017-7-31 00:00:00', '2017-7-31 23:59:59']]
	timeList += [['2017-7-25 00:00:00', '2017-7-31 23:59:59']]
	# timeList += [['2017-7-29 00:00:00', '2017-7-29 23:59:59']]
	# timeList += [['2017-7-30 00:00:00', '2017-7-30 23:59:59']]
	return timeList
	

def roleOnlineMap():
	Sql = {}
	#Sql[U'角色每日平均线时长(分钟)'] = "SELECT DATE_FORMAT(FROM_UNIXTIME(`time`), '%Y-%m-%d') AS days, AVG(CASE WHEN `onlineOrOffline` = 1 THEN 0 - `time` ELSE `time` END )/60 AS 'avg_online_minutes',`playerID` AS onlinesecon FROM `log_player_online_offline`GROUP BY `playerID`, days ORDER BY days"
	# Sql[U'角色每日在线时长(分钟)'] = "SELECT DATE_FORMAT(FROM_UNIXTIME(`time`), '%Y-%m-%d') AS days, SUM( CASE WHEN `onlineOrOffline` = 1 THEN 0 - `time` ELSE `time` END )/60 AS 'online_minutes',`playerID`  FROM `log_player_online_offline` GROUP  BY   `playerID` , days"
	# Sql[U'角色每日在线时长(分钟)'] = "SELECT `playerID`, DATE_FORMAT(FROM_UNIXTIME(`time`), '%Y%m%d') AS days, SUM( CASE WHEN `onlineOrOffline` = 1 THEN 1 ELSE 0 END) AS loginTimes, SUM( CASE WHEN `onlineOrOffline` = 1 THEN 0 - `time` ELSE `time` END )/60 AS 'online_minutes' FROM `log_player_online_offline` GROUP  BY   `playerID` , days"
	return Sql


def gameSql():
	Sql = {}
	Sql[U"任务分布"] = "SELECT taskID AS `任务ID` , COUNT(RoleID) AS `人数` FROM task GROUP BY taskID"
	Sql[U"等级分布"] = "SELECT LEVEL AS `等级`,   COUNT(RoleID) AS `人数` FROM `base_role` GROUP BY LEVEL"
	Sql[U"职业分布"] = "SELECT career AS `职业`, SUM(CASE WHEN sex = 0 THEN 1 ELSE 0 END) AS `男`, SUM(CASE WHEN sex = 1 THEN 1 ELSE 0 END) AS `女` FROM base_role GROUP BY career"
	Sql[U"神秘商店"] = "SELECT `itemID` AS `物品ID`, SUM(`count`) AS `购买数量` FROM `player_ms_shop` GROUP BY `itemID`"
	return Sql

def logSql():
	Sql = {}
	Sql[U"商城消耗"] = "SELECT `itemDataID` AS `物品ID`, SUM(`buyCount`) AS `购买数量` FROM  `log_mall_buy` GROUP BY  `itemDataID`"
	Sql[U"钻石消耗"] = "SELECT  `reason` AS `DiamonChangedReason`, SUM(`changediamond`) AS `钻石` FROM `log_gold` WHERE `addOrDec` = 1 GROUP BY `reason`"
	return Sql

#,FROM_UNIXTIME(CAST(LEFT(GROUP_CONCAT(`time` ORDER BY `count` DESC),10) AS SIGNED)) AS pcu_time, FROM_UNIXTIME(CAST( LEFT(GROUP_CONCAT(`time` ORDER BY `count` ASC),10)  AS SIGNED )) AS vcu_time 	
def logAcuSql(StartTime, EndTime):
	Sql = {}
	Sql[U"PCU & ACU"]  = "SELECT CEIL(AVG(`count`)) AS acu,MAX(`count`) AS pcu, CONCAT('%s','至', '%s') as '时间段' FROM `log_online_players` WHERE `time` BETWEEN UNIX_TIMESTAMP('%s') AND  UNIX_TIMESTAMP('%s')" % (StartTime, EndTime, StartTime, EndTime) 
	return Sql


def writeToXls(Rows,worksheet, cursor, format):
	result = cursor.fetchall()
	fields = cursor.description # get column name

	Reasons = utils.diamonReason()
	FirstColNeedConvert = False
	for field in range(0,len(fields)):
		if field == 0:
			if cmp(fields[field][0], "DiamonChangedReason") != 0:
				worksheet.write(Rows,field,fields[field][0].decode('utf8'), format)
			else:
				FirstColNeedConvert = True
				worksheet.write(Rows,field,U'原因', format)
		else:
			worksheet.write(Rows,field,fields[field][0].decode('utf8'), format)

	Rows = Rows + 1	
	for row in range(1,len(result)+1):
		for col in range(0,len(fields)):
			if col == 0 and FirstColNeedConvert == True:
				ResonNumber = int(result[row-1][col])
				worksheet.write(Rows,col,Reasons.get(ResonNumber, ResonNumber), format)
			else:
				if col < 2:
					worksheet.write(Rows,col, result[row-1][col], format)
				else:
					worksheet.write(Rows,col, "%s" % result[row-1][col], format)
		Rows = Rows + 1	
	return Rows + 1	


def queryData(Host, Port, User, Pwd, Database, Sqls, workbook, worksheet, Rows):
	conn= MySQLdb.connect(host=Host,port=Port,user=User,passwd=Pwd,db=Database,charset="utf8")  
	format=workbook.add_format()    #定义format格式对象
	format.set_border(1)    #定义format对象单元格边框加粗(1像素)的格式
	format.set_align('left')

	format_title=workbook.add_format({'bold':1})    #定义format_title格式对象
	format_title.set_border(1)   #定义format_title对象单元格边框加粗(1像素)的格式
	format_title.set_bg_color('#cccccc')   #定义format_title对象单元格背景颜色为#'#cccccc'的格式
	format_title.set_align('left')

	for Prompt, Sql in Sqls.items():
		cursor = conn.cursor()
		cursor.execute(Sql)
		worksheet.write(Rows,0,Prompt, format_title)
		Rows = writeToXls(Rows + 1, worksheet, cursor, format)
	return Rows	

def isLogin(conn, RoleID, StartTime,EndTime):
	result2 = excute(conn, "SELECT COUNT(*) FROM `log_player_online_offline` WHERE `playerID` = %d AND `time` BETWEEN UNIX_TIMESTAMP('%s') AND UNIX_TIMESTAMP('%s')"%(RoleID,StartTime,EndTime))
	return result2[0][0]


def modData(Tbl,StartTime,EndTime, TomStarTime, TomEndTime):
	conn= MySQLdb.connect(host="127.0.0.1",port=3306,user='root',passwd='1234',db='test',charset="utf8") 

	OnlineInit = "drop table if exists `%s`;CREATE TABLE `%s` AS SELECT DATE_FORMAT(FROM_UNIXTIME(`time`), '%%Y-%%m-%%d') AS days,`playerID`, SUM( CASE WHEN `onlineOrOffline` = 1 THEN 0 - `time` ELSE `time` END ) AS 'online_minutes', 1 AS `flag`  FROM `log_player_online_offline` where `time` BETWEEN UNIX_TIMESTAMP('%s') AND UNIX_TIMESTAMP('%s')  GROUP by `playerID` , days"
	excute(conn, OnlineInit%(Tbl,Tbl, StartTime, EndTime))

	result = excute(conn, "SELECT `playerID` FROM `%s` WHERE `online_minutes` < 0"%Tbl)
	for row in range(1,len(result)+1):
		RoleID = result[row-1][0]
		Sql1 = "insert into `log_player_online_offline`(playerID,onlineOrOffline,`time`) value(%d,0,UNIX_TIMESTAMP('%s'))" % (int(RoleID),EndTime)
		Sql2 = "insert into `log_player_online_offline`(playerID,onlineOrOffline,`time`) value(%d,1,UNIX_TIMESTAMP('%s'))" % (int(RoleID),TomStarTime)
		excute(conn, Sql1)
		excute(conn, Sql2)

	excute(conn, OnlineInit%(Tbl,Tbl, StartTime, EndTime))

	AllRole = excute(conn, "SELECT distinct `playerID` FROM `%s`"%Tbl)
	fLogin = open( "%s.sql"%Tbl, "w+")
	for row in range(1,len(AllRole)+1):
		RoleID = AllRole[row-1][0]
		OLFlag = isLogin(conn, RoleID,TomStarTime, TomEndTime)
		if OLFlag == 0:
			# fLogin.write("update `%s` set `flag` = 0 where `playerID` = %d;"% (Tbl,RoleID))
			excute(conn, "update `%s` set `flag` = 0 where `playerID` = %d"% (Tbl,RoleID))
	conn.commit()		

def excute(conn, Sql):	
	cursor = conn.cursor()
	try:
		cursor.execute(Sql)
	except MySQLdb.Warning, w:  
		print w
	except MySQLdb.Error, e:
		print e
	result = cursor.fetchall()
	cursor.close()
	return result


if __name__ == "__main__":
	dt = datetime.now() 
	fileName = dt.strftime('.\\..\\..\\export-%Y-%m-%d-%H-%M-%S.xlsx')
	workbook = xlsxwriter.Workbook(fileName)
	# 定义sheet的名字
	worksheet = workbook.add_worksheet(" ")


	Rows = 0
	GameSql = gameSql()
	LogSql = logSql()
	OnlineTime = roleOnlineMap()
	
	format_title=workbook.add_format()    #定义format_title格式对象
	format_title.set_border(1)   #定义format_title对象单元格边框加粗(1像素)的格式
	format_title.set_bg_color('#cccccc')   #定义format_title对象单元格背景颜色为
                                       #'#cccccc'的格式

	worksheet.set_column('A:A', 50) #设置A列的单元格宽度为25 
	worksheet.set_column('B:B', 15) #设置A列的单元格宽度为25 
	worksheet.set_column('C:C', 40) #设置A列的单元格宽度为25 
	worksheet.write(Rows,0,U'######139.199.107.86_命运服务器######', format_title)
	
	# modData('log_20170725','2017-07-25 00:00:01', '2017-07-25 23:59:59','2017-07-26 00:00:01', '2017-07-26 23:59:59')
	# modData('log_20170726','2017-07-26 00:00:01', '2017-07-26 23:59:59','2017-07-27 00:00:01', '2017-07-27 23:59:59')
	# modData('log_20170727','2017-07-27 00:00:01', '2017-07-27 23:59:59','2017-07-28 00:00:01', '2017-07-28 23:59:59')

	AcuTimes = acuTime()
	for time in AcuTimes:
		Rows = queryData("139.199.107.86", 2998, "luna_yanfa","aOZ*jGcAhTs55Y+n", "luna_gamelog_1_998", logAcuSql(time[0], time[1]), workbook, worksheet, Rows + 1)
	
	Rows = queryData("139.199.107.86", 2998, "luna_yanfa","aOZ*jGcAhTs55Y+n", "luna_gamelog_1_998", OnlineTime, workbook, worksheet, Rows + 1)
	Rows = queryData("139.199.107.86", 2998, "luna_yanfa","aOZ*jGcAhTs55Y+n", "luna_gamedata_1_998", GameSql, workbook, worksheet, Rows + 1)
	Rows = queryData("139.199.107.86", 2998, "luna_yanfa","aOZ*jGcAhTs55Y+n", "luna_gamelog_1_998", LogSql, workbook, worksheet, Rows + 1)

	#Rows = Rows + 1
	#worksheet.write(Rows,0,U'######139.199.107.86_星云服务器######',format_title)
	#for time in AcuTimes:
	#	Rows = queryData("139.199.107.86", 3307, "luna_yanfa","aOZ*jGcAhTs55Y+n", "luna_gamelog", logAcuSql(time[0], time[1]), workbook, worksheet, Rows + 1)
	#Rows = queryData("139.199.107.86", 3307, "luna_yanfa","aOZ*jGcAhTs55Y+n", "luna_gamelog", LogAcuSql, workbook, worksheet, Rows + 1)
	#Rows = queryData("139.199.107.86", 3307, "luna_yanfa","aOZ*jGcAhTs55Y+n", "luna_gamedata", GameSql, workbook, worksheet, Rows + 1)
	#Rows = queryData("139.199.107.86", 3307, "luna_yanfa","aOZ*jGcAhTs55Y+n", "luna_gamelog", LogSql, workbook, worksheet, Rows + 1)

	#Rows = Rows + 1
	#worksheet.write(Rows,0,U'######192.168.18.57_策划服######',format_title)
	#Rows = queryData("192.168.18.57", 3306, "root","abcd", "luna_data_cehua", GameSql, workbook, worksheet, Rows + 1)
	#Rows = queryData("192.168.18.57", 3306, "root","abcd", "luna_log_cehua", LogSql, workbook, worksheet, Rows + 1)

	print "create file " ,  fileName, " in " , os.getcwd() 
	workbook.close()