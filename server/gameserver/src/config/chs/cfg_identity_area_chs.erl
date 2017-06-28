%% coding: latin-1
%%: 实现
-module(cfg_identity_area_chs).
-compile(export_all).
-include("cfg_identity_area.hrl").
-include("logger.hrl").

getRow(1,1)->
    #identity_areaCfg {
    id1 = 1,
    id2 = 1,
    area1 = "北京",
    area2 = "北京"
    };
getRow(2,1)->
    #identity_areaCfg {
    id1 = 2,
    id2 = 1,
    area1 = "天津",
    area2 = "天津"
    };
getRow(3,1)->
    #identity_areaCfg {
    id1 = 3,
    id2 = 1,
    area1 = "上海",
    area2 = "上海"
    };
getRow(4,1)->
    #identity_areaCfg {
    id1 = 4,
    id2 = 1,
    area1 = "重庆",
    area2 = "重庆"
    };
getRow(5,1)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 1,
    area1 = "江苏",
    area2 = "南京"
    };
getRow(5,2)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 2,
    area1 = "江苏",
    area2 = "无锡"
    };
getRow(5,3)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 3,
    area1 = "江苏",
    area2 = "徐州"
    };
getRow(5,4)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 4,
    area1 = "江苏",
    area2 = "常州"
    };
getRow(5,5)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 5,
    area1 = "江苏",
    area2 = "苏州"
    };
getRow(5,6)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 6,
    area1 = "江苏",
    area2 = "南通"
    };
getRow(5,7)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 7,
    area1 = "江苏",
    area2 = "连云港"
    };
getRow(5,8)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 8,
    area1 = "江苏",
    area2 = "淮安"
    };
getRow(5,9)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 9,
    area1 = "江苏",
    area2 = "盐城"
    };
getRow(5,10)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 10,
    area1 = "江苏",
    area2 = "扬州"
    };
getRow(5,11)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 11,
    area1 = "江苏",
    area2 = "镇江"
    };
getRow(5,12)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 12,
    area1 = "江苏",
    area2 = "泰州"
    };
getRow(5,13)->
    #identity_areaCfg {
    id1 = 5,
    id2 = 13,
    area1 = "江苏",
    area2 = "宿迁"
    };
getRow(6,1)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 1,
    area1 = "浙江",
    area2 = "杭州"
    };
getRow(6,2)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 2,
    area1 = "浙江",
    area2 = "宁波"
    };
getRow(6,3)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 3,
    area1 = "浙江",
    area2 = "温州"
    };
getRow(6,4)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 4,
    area1 = "浙江",
    area2 = "嘉兴"
    };
getRow(6,5)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 5,
    area1 = "浙江",
    area2 = "湖州"
    };
getRow(6,6)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 6,
    area1 = "浙江",
    area2 = "绍兴"
    };
getRow(6,7)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 7,
    area1 = "浙江",
    area2 = "金华"
    };
getRow(6,8)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 8,
    area1 = "浙江",
    area2 = "衢州"
    };
getRow(6,9)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 9,
    area1 = "浙江",
    area2 = "舟山"
    };
getRow(6,10)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 10,
    area1 = "浙江",
    area2 = "台州"
    };
getRow(6,11)->
    #identity_areaCfg {
    id1 = 6,
    id2 = 11,
    area1 = "浙江",
    area2 = "丽水"
    };
getRow(7,1)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 1,
    area1 = "安徽",
    area2 = "合肥"
    };
getRow(7,2)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 2,
    area1 = "安徽",
    area2 = "芜湖"
    };
getRow(7,3)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 3,
    area1 = "安徽",
    area2 = "蚌埠"
    };
getRow(7,4)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 4,
    area1 = "安徽",
    area2 = "淮南"
    };
getRow(7,5)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 5,
    area1 = "安徽",
    area2 = "马鞍山"
    };
getRow(7,6)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 6,
    area1 = "安徽",
    area2 = "淮北"
    };
getRow(7,7)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 7,
    area1 = "安徽",
    area2 = "铜陵"
    };
getRow(7,8)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 8,
    area1 = "安徽",
    area2 = "安庆"
    };
getRow(7,9)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 9,
    area1 = "安徽",
    area2 = "黄山"
    };
getRow(7,10)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 10,
    area1 = "安徽",
    area2 = "滁州"
    };
getRow(7,11)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 11,
    area1 = "安徽",
    area2 = "阜阳"
    };
getRow(7,12)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 12,
    area1 = "安徽",
    area2 = "宿州"
    };
getRow(7,13)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 13,
    area1 = "安徽",
    area2 = "巢湖"
    };
getRow(7,14)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 14,
    area1 = "安徽",
    area2 = "六安"
    };
getRow(7,15)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 15,
    area1 = "安徽",
    area2 = "毫州"
    };
getRow(7,16)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 16,
    area1 = "安徽",
    area2 = "池州"
    };
getRow(7,17)->
    #identity_areaCfg {
    id1 = 7,
    id2 = 17,
    area1 = "安徽",
    area2 = "宣城"
    };
getRow(8,1)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 1,
    area1 = "福建",
    area2 = "福州"
    };
getRow(8,2)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 2,
    area1 = "福建",
    area2 = "厦门"
    };
getRow(8,3)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 3,
    area1 = "福建",
    area2 = "莆田"
    };
getRow(8,4)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 4,
    area1 = "福建",
    area2 = "三明"
    };
getRow(8,5)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 5,
    area1 = "福建",
    area2 = "泉州"
    };
getRow(8,6)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 6,
    area1 = "福建",
    area2 = "漳州"
    };
getRow(8,7)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 7,
    area1 = "福建",
    area2 = "南平"
    };
getRow(8,8)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 8,
    area1 = "福建",
    area2 = "龙岩"
    };
getRow(8,9)->
    #identity_areaCfg {
    id1 = 8,
    id2 = 9,
    area1 = "福建",
    area2 = "宁德"
    };
getRow(9,1)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 1,
    area1 = "江西",
    area2 = "南昌"
    };
getRow(9,2)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 2,
    area1 = "江西",
    area2 = "景德镇"
    };
getRow(9,3)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 3,
    area1 = "江西",
    area2 = "萍乡"
    };
getRow(9,4)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 4,
    area1 = "江西",
    area2 = "九江"
    };
getRow(9,5)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 5,
    area1 = "江西",
    area2 = "新余"
    };
getRow(9,6)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 6,
    area1 = "江西",
    area2 = "鹰潭"
    };
getRow(9,7)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 7,
    area1 = "江西",
    area2 = "赣州"
    };
getRow(9,8)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 8,
    area1 = "江西",
    area2 = "吉安"
    };
getRow(9,9)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 9,
    area1 = "江西",
    area2 = "宜春"
    };
getRow(9,10)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 10,
    area1 = "江西",
    area2 = "抚州"
    };
getRow(9,11)->
    #identity_areaCfg {
    id1 = 9,
    id2 = 11,
    area1 = "江西",
    area2 = "上饶"
    };
getRow(10,1)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 1,
    area1 = "湖北",
    area2 = "武汉"
    };
getRow(10,2)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 2,
    area1 = "湖北",
    area2 = "黄石"
    };
getRow(10,3)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 3,
    area1 = "湖北",
    area2 = "襄樊"
    };
getRow(10,4)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 4,
    area1 = "湖北",
    area2 = "十堰"
    };
getRow(10,5)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 5,
    area1 = "湖北",
    area2 = "荆州"
    };
getRow(10,6)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 6,
    area1 = "湖北",
    area2 = "宜昌"
    };
getRow(10,7)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 7,
    area1 = "湖北",
    area2 = "荆门"
    };
getRow(10,8)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 8,
    area1 = "湖北",
    area2 = "鄂州"
    };
getRow(10,9)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 9,
    area1 = "湖北",
    area2 = "孝感"
    };
getRow(10,10)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 10,
    area1 = "湖北",
    area2 = "黄冈"
    };
getRow(10,11)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 11,
    area1 = "湖北",
    area2 = "咸宁"
    };
getRow(10,12)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 12,
    area1 = "湖北",
    area2 = "随州"
    };
getRow(10,13)->
    #identity_areaCfg {
    id1 = 10,
    id2 = 13,
    area1 = "湖北",
    area2 = "恩施"
    };
getRow(11,1)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 1,
    area1 = "湖南",
    area2 = "长沙"
    };
getRow(11,2)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 2,
    area1 = "湖南",
    area2 = "株洲"
    };
getRow(11,3)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 3,
    area1 = "湖南",
    area2 = "湘潭"
    };
getRow(11,4)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 4,
    area1 = "湖南",
    area2 = "衡阳"
    };
getRow(11,5)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 5,
    area1 = "湖南",
    area2 = "邵阳"
    };
getRow(11,6)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 6,
    area1 = "湖南",
    area2 = "岳阳"
    };
getRow(11,7)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 7,
    area1 = "湖南",
    area2 = "常德"
    };
getRow(11,8)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 8,
    area1 = "湖南",
    area2 = "张家界"
    };
getRow(11,9)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 9,
    area1 = "湖南",
    area2 = "益阳"
    };
getRow(11,10)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 10,
    area1 = "湖南",
    area2 = "郴州"
    };
getRow(11,11)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 11,
    area1 = "湖南",
    area2 = "永州"
    };
getRow(11,12)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 12,
    area1 = "湖南",
    area2 = "怀化"
    };
getRow(11,13)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 13,
    area1 = "湖南",
    area2 = "娄底"
    };
getRow(11,14)->
    #identity_areaCfg {
    id1 = 11,
    id2 = 14,
    area1 = "湖南",
    area2 = "湘西"
    };
getRow(12,1)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 1,
    area1 = "广东",
    area2 = "广州"
    };
getRow(12,2)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 2,
    area1 = "广东",
    area2 = "深圳"
    };
getRow(12,3)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 3,
    area1 = "广东",
    area2 = "珠海"
    };
getRow(12,4)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 4,
    area1 = "广东",
    area2 = "汕头"
    };
getRow(12,5)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 5,
    area1 = "广东",
    area2 = "韶关"
    };
getRow(12,6)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 6,
    area1 = "广东",
    area2 = "佛山"
    };
getRow(12,7)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 7,
    area1 = "广东",
    area2 = "江门"
    };
getRow(12,8)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 8,
    area1 = "广东",
    area2 = "湛江"
    };
getRow(12,9)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 9,
    area1 = "广东",
    area2 = "茂名"
    };
getRow(12,10)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 10,
    area1 = "广东",
    area2 = "肇庆"
    };
getRow(12,11)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 11,
    area1 = "广东",
    area2 = "惠州"
    };
getRow(12,12)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 12,
    area1 = "广东",
    area2 = "梅州"
    };
getRow(12,13)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 13,
    area1 = "广东",
    area2 = "汕尾"
    };
getRow(12,14)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 14,
    area1 = "广东",
    area2 = "河源"
    };
getRow(12,15)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 15,
    area1 = "广东",
    area2 = "阳江"
    };
getRow(12,16)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 16,
    area1 = "广东",
    area2 = "清远"
    };
getRow(12,17)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 17,
    area1 = "广东",
    area2 = "东莞"
    };
getRow(12,18)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 18,
    area1 = "广东",
    area2 = "中山"
    };
getRow(12,19)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 19,
    area1 = "广东",
    area2 = "潮州"
    };
getRow(12,20)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 20,
    area1 = "广东",
    area2 = "揭阳"
    };
getRow(12,21)->
    #identity_areaCfg {
    id1 = 12,
    id2 = 21,
    area1 = "广东",
    area2 = "云浮"
    };
getRow(13,1)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 1,
    area1 = "广西",
    area2 = "南宁"
    };
getRow(13,2)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 2,
    area1 = "广西",
    area2 = "柳州"
    };
getRow(13,3)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 3,
    area1 = "广西",
    area2 = "桂林"
    };
getRow(13,4)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 4,
    area1 = "广西",
    area2 = "梧州"
    };
getRow(13,5)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 5,
    area1 = "广西",
    area2 = "北海"
    };
getRow(13,6)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 6,
    area1 = "广西",
    area2 = "防城港"
    };
getRow(13,7)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 7,
    area1 = "广西",
    area2 = "钦州"
    };
getRow(13,8)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 8,
    area1 = "广西",
    area2 = "贵港"
    };
getRow(13,9)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 9,
    area1 = "广西",
    area2 = "玉林"
    };
getRow(13,10)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 10,
    area1 = "广西",
    area2 = "百色"
    };
getRow(13,11)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 11,
    area1 = "广西",
    area2 = "贺州"
    };
getRow(13,12)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 12,
    area1 = "广西",
    area2 = "河池"
    };
getRow(13,13)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 13,
    area1 = "广西",
    area2 = "来宾"
    };
getRow(13,14)->
    #identity_areaCfg {
    id1 = 13,
    id2 = 14,
    area1 = "广西",
    area2 = "崇左"
    };
getRow(14,1)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 1,
    area1 = "海南",
    area2 = "海口"
    };
getRow(14,2)->
    #identity_areaCfg {
    id1 = 14,
    id2 = 2,
    area1 = "海南",
    area2 = "三亚"
    };
getRow(15,1)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 1,
    area1 = "山东",
    area2 = "济南"
    };
getRow(15,2)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 2,
    area1 = "山东",
    area2 = "青岛"
    };
getRow(15,3)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 3,
    area1 = "山东",
    area2 = "淄博"
    };
getRow(15,4)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 4,
    area1 = "山东",
    area2 = "枣庄"
    };
getRow(15,5)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 5,
    area1 = "山东",
    area2 = "东营"
    };
getRow(15,6)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 6,
    area1 = "山东",
    area2 = "烟台"
    };
getRow(15,7)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 7,
    area1 = "山东",
    area2 = "潍坊"
    };
getRow(15,8)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 8,
    area1 = "山东",
    area2 = "威海"
    };
getRow(15,9)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 9,
    area1 = "山东",
    area2 = "济宁"
    };
getRow(15,10)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 10,
    area1 = "山东",
    area2 = "泰安"
    };
getRow(15,11)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 11,
    area1 = "山东",
    area2 = "日照"
    };
getRow(15,12)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 12,
    area1 = "山东",
    area2 = "莱芜"
    };
getRow(15,13)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 13,
    area1 = "山东",
    area2 = "临沂"
    };
getRow(15,14)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 14,
    area1 = "山东",
    area2 = "德州"
    };
getRow(15,15)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 15,
    area1 = "山东",
    area2 = "聊城"
    };
getRow(15,16)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 16,
    area1 = "山东",
    area2 = "滨州"
    };
getRow(15,17)->
    #identity_areaCfg {
    id1 = 15,
    id2 = 17,
    area1 = "山东",
    area2 = "菏泽"
    };
getRow(16,1)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 1,
    area1 = "河南",
    area2 = "郑州"
    };
getRow(16,2)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 2,
    area1 = "河南",
    area2 = "开封"
    };
getRow(16,3)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 3,
    area1 = "河南",
    area2 = "洛阳"
    };
getRow(16,4)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 4,
    area1 = "河南",
    area2 = "平顶山"
    };
getRow(16,5)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 5,
    area1 = "河南",
    area2 = "焦作"
    };
getRow(16,6)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 6,
    area1 = "河南",
    area2 = "鹤壁"
    };
getRow(16,7)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 7,
    area1 = "河南",
    area2 = "新乡"
    };
getRow(16,8)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 8,
    area1 = "河南",
    area2 = "安阳"
    };
getRow(16,9)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 9,
    area1 = "河南",
    area2 = "濮阳"
    };
getRow(16,10)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 10,
    area1 = "河南",
    area2 = "许昌"
    };
getRow(16,11)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 11,
    area1 = "河南",
    area2 = "漯河"
    };
getRow(16,12)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 12,
    area1 = "河南",
    area2 = "三门峡"
    };
getRow(16,13)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 13,
    area1 = "河南",
    area2 = "南阳"
    };
getRow(16,14)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 14,
    area1 = "河南",
    area2 = "商丘"
    };
getRow(16,15)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 15,
    area1 = "河南",
    area2 = "信阳"
    };
getRow(16,16)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 16,
    area1 = "河南",
    area2 = "周口"
    };
getRow(16,17)->
    #identity_areaCfg {
    id1 = 16,
    id2 = 17,
    area1 = "河南",
    area2 = "驻马店"
    };
getRow(17,1)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 1,
    area1 = "河北",
    area2 = "石家庄"
    };
getRow(17,2)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 2,
    area1 = "河北",
    area2 = "唐山"
    };
getRow(17,3)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 3,
    area1 = "河北",
    area2 = "秦皇岛"
    };
getRow(17,4)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 4,
    area1 = "河北",
    area2 = "邯郸"
    };
getRow(17,5)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 5,
    area1 = "河北",
    area2 = "邢台"
    };
getRow(17,6)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 6,
    area1 = "河北",
    area2 = "保定"
    };
getRow(17,7)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 7,
    area1 = "河北",
    area2 = "张家口"
    };
getRow(17,8)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 8,
    area1 = "河北",
    area2 = "承德"
    };
getRow(17,9)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 9,
    area1 = "河北",
    area2 = "沧州"
    };
getRow(17,10)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 10,
    area1 = "河北",
    area2 = "廊坊"
    };
getRow(17,11)->
    #identity_areaCfg {
    id1 = 17,
    id2 = 11,
    area1 = "河北",
    area2 = "衡水"
    };
getRow(18,1)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 1,
    area1 = "山西",
    area2 = "太原"
    };
getRow(18,2)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 2,
    area1 = "山西",
    area2 = "大同"
    };
getRow(18,3)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 3,
    area1 = "山西",
    area2 = "阳泉"
    };
getRow(18,4)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 4,
    area1 = "山西",
    area2 = "长治"
    };
getRow(18,5)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 5,
    area1 = "山西",
    area2 = "晋城"
    };
getRow(18,6)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 6,
    area1 = "山西",
    area2 = "朔州"
    };
getRow(18,7)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 7,
    area1 = "山西",
    area2 = "晋中"
    };
getRow(18,8)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 8,
    area1 = "山西",
    area2 = "运城"
    };
getRow(18,9)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 9,
    area1 = "山西",
    area2 = "忻州"
    };
getRow(18,10)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 10,
    area1 = "山西",
    area2 = "临汾"
    };
getRow(18,11)->
    #identity_areaCfg {
    id1 = 18,
    id2 = 11,
    area1 = "山西",
    area2 = "吕梁"
    };
getRow(19,1)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 1,
    area1 = "内蒙古",
    area2 = "呼和浩特"
    };
getRow(19,2)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 2,
    area1 = "内蒙古",
    area2 = "包头"
    };
getRow(19,3)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 3,
    area1 = "内蒙古",
    area2 = "乌海"
    };
getRow(19,4)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 4,
    area1 = "内蒙古",
    area2 = "赤峰"
    };
getRow(19,5)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 5,
    area1 = "内蒙古",
    area2 = "通辽"
    };
getRow(19,6)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 6,
    area1 = "内蒙古",
    area2 = "鄂尔多斯"
    };
getRow(19,7)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 7,
    area1 = "内蒙古",
    area2 = "呼伦贝尔"
    };
getRow(19,8)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 8,
    area1 = "内蒙古",
    area2 = "巴彦淖尔"
    };
getRow(19,9)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 9,
    area1 = "内蒙古",
    area2 = "乌兰察布"
    };
getRow(19,10)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 10,
    area1 = "内蒙古",
    area2 = "兴安"
    };
getRow(19,11)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 11,
    area1 = "内蒙古",
    area2 = "锡林郭勒"
    };
getRow(19,12)->
    #identity_areaCfg {
    id1 = 19,
    id2 = 12,
    area1 = "内蒙古",
    area2 = "阿拉善"
    };
getRow(20,1)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 1,
    area1 = "辽宁",
    area2 = "沈阳"
    };
getRow(20,2)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 2,
    area1 = "辽宁",
    area2 = "大连"
    };
getRow(20,3)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 3,
    area1 = "辽宁",
    area2 = "鞍山"
    };
getRow(20,4)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 4,
    area1 = "辽宁",
    area2 = "抚顺"
    };
getRow(20,5)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 5,
    area1 = "辽宁",
    area2 = "本溪"
    };
getRow(20,6)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 6,
    area1 = "辽宁",
    area2 = "丹东"
    };
getRow(20,7)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 7,
    area1 = "辽宁",
    area2 = "锦州"
    };
getRow(20,8)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 8,
    area1 = "辽宁",
    area2 = "营口"
    };
getRow(20,9)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 9,
    area1 = "辽宁",
    area2 = "阜新"
    };
getRow(20,10)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 10,
    area1 = "辽宁",
    area2 = "辽阳"
    };
getRow(20,11)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 11,
    area1 = "辽宁",
    area2 = "盘锦"
    };
getRow(20,12)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 12,
    area1 = "辽宁",
    area2 = "铁岭"
    };
getRow(20,13)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 13,
    area1 = "辽宁",
    area2 = "朝阳"
    };
getRow(20,14)->
    #identity_areaCfg {
    id1 = 20,
    id2 = 14,
    area1 = "辽宁",
    area2 = "葫芦岛"
    };
getRow(21,1)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 1,
    area1 = "吉林",
    area2 = "长春"
    };
getRow(21,2)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 2,
    area1 = "吉林",
    area2 = "吉林"
    };
getRow(21,3)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 3,
    area1 = "吉林",
    area2 = "四平"
    };
getRow(21,4)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 4,
    area1 = "吉林",
    area2 = "辽源"
    };
getRow(21,5)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 5,
    area1 = "吉林",
    area2 = "通化"
    };
getRow(21,6)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 6,
    area1 = "吉林",
    area2 = "白山"
    };
getRow(21,7)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 7,
    area1 = "吉林",
    area2 = "松原"
    };
getRow(21,8)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 8,
    area1 = "吉林",
    area2 = "白城"
    };
getRow(21,9)->
    #identity_areaCfg {
    id1 = 21,
    id2 = 9,
    area1 = "吉林",
    area2 = "延边"
    };
getRow(22,1)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 1,
    area1 = "黑龙江",
    area2 = "哈尔滨"
    };
getRow(22,2)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 2,
    area1 = "黑龙江",
    area2 = "齐齐哈尔"
    };
getRow(22,3)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 3,
    area1 = "黑龙江",
    area2 = "鸡西"
    };
getRow(22,4)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 4,
    area1 = "黑龙江",
    area2 = "鹤岗"
    };
getRow(22,5)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 5,
    area1 = "黑龙江",
    area2 = "双鸭山"
    };
getRow(22,6)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 6,
    area1 = "黑龙江",
    area2 = "大庆"
    };
getRow(22,7)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 7,
    area1 = "黑龙江",
    area2 = "伊春"
    };
getRow(22,8)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 8,
    area1 = "黑龙江",
    area2 = "佳木斯"
    };
getRow(22,9)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 9,
    area1 = "黑龙江",
    area2 = "七台河"
    };
getRow(22,10)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 10,
    area1 = "黑龙江",
    area2 = "牡丹江"
    };
getRow(22,11)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 11,
    area1 = "黑龙江",
    area2 = "黑河"
    };
getRow(22,12)->
    #identity_areaCfg {
    id1 = 22,
    id2 = 12,
    area1 = "黑龙江",
    area2 = "绥化"
    };
getRow(23,1)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 1,
    area1 = "四川",
    area2 = "成都"
    };
getRow(23,2)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 2,
    area1 = "四川",
    area2 = "绵阳"
    };
getRow(23,3)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 3,
    area1 = "四川",
    area2 = "自贡"
    };
getRow(23,4)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 4,
    area1 = "四川",
    area2 = "攀枝花"
    };
getRow(23,5)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 5,
    area1 = "四川",
    area2 = "泸州"
    };
getRow(23,6)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 6,
    area1 = "四川",
    area2 = "德阳"
    };
getRow(23,7)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 7,
    area1 = "四川",
    area2 = "广元"
    };
getRow(23,8)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 8,
    area1 = "四川",
    area2 = "遂宁"
    };
getRow(23,9)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 9,
    area1 = "四川",
    area2 = "内江"
    };
getRow(23,10)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 10,
    area1 = "四川",
    area2 = "乐山"
    };
getRow(23,11)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 11,
    area1 = "四川",
    area2 = "资阳"
    };
getRow(23,12)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 12,
    area1 = "四川",
    area2 = "宜宾"
    };
getRow(23,13)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 13,
    area1 = "四川",
    area2 = "南充"
    };
getRow(23,14)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 14,
    area1 = "四川",
    area2 = "达州"
    };
getRow(23,15)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 15,
    area1 = "四川",
    area2 = "雅安"
    };
getRow(23,16)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 16,
    area1 = "四川",
    area2 = "阿坝"
    };
getRow(23,17)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 17,
    area1 = "四川",
    area2 = "甘孜"
    };
getRow(23,18)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 18,
    area1 = "四川",
    area2 = "凉山"
    };
getRow(23,19)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 19,
    area1 = "四川",
    area2 = "广安"
    };
getRow(23,20)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 20,
    area1 = "四川",
    area2 = "巴中"
    };
getRow(23,21)->
    #identity_areaCfg {
    id1 = 23,
    id2 = 21,
    area1 = "四川",
    area2 = "眉山"
    };
getRow(24,1)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 1,
    area1 = "贵州",
    area2 = "贵阳"
    };
getRow(24,2)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 2,
    area1 = "贵州",
    area2 = "六盘水"
    };
getRow(24,3)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 3,
    area1 = "贵州",
    area2 = "遵义"
    };
getRow(24,4)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 4,
    area1 = "贵州",
    area2 = "安顺"
    };
getRow(24,5)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 5,
    area1 = "贵州",
    area2 = "铜仁"
    };
getRow(24,6)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 6,
    area1 = "贵州",
    area2 = "毕节"
    };
getRow(24,7)->
    #identity_areaCfg {
    id1 = 24,
    id2 = 7,
    area1 = "贵州",
    area2 = "黔南"
    };
getRow(25,1)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 1,
    area1 = "云南",
    area2 = "昆明"
    };
getRow(25,2)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 2,
    area1 = "云南",
    area2 = "曲靖"
    };
getRow(25,3)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 3,
    area1 = "云南",
    area2 = "玉溪"
    };
getRow(25,4)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 4,
    area1 = "云南",
    area2 = "宝山"
    };
getRow(25,5)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 5,
    area1 = "云南",
    area2 = "昭通"
    };
getRow(25,6)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 6,
    area1 = "云南",
    area2 = "丽江"
    };
getRow(25,7)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 7,
    area1 = "云南",
    area2 = "普洱"
    };
getRow(25,8)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 8,
    area1 = "云南",
    area2 = "临沧"
    };
getRow(25,9)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 9,
    area1 = "云南",
    area2 = "文山"
    };
getRow(25,10)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 10,
    area1 = "云南",
    area2 = "红河"
    };
getRow(25,11)->
    #identity_areaCfg {
    id1 = 25,
    id2 = 11,
    area1 = "云南",
    area2 = "西双版纳"
    };
getRow(26,1)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 1,
    area1 = "西藏",
    area2 = "拉萨"
    };
getRow(26,2)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 2,
    area1 = "西藏",
    area2 = "昌都"
    };
getRow(26,3)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 3,
    area1 = "西藏",
    area2 = "山南"
    };
getRow(26,4)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 4,
    area1 = "西藏",
    area2 = "日喀则"
    };
getRow(26,5)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 5,
    area1 = "西藏",
    area2 = "那曲"
    };
getRow(26,6)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 6,
    area1 = "西藏",
    area2 = "阿里"
    };
getRow(26,7)->
    #identity_areaCfg {
    id1 = 26,
    id2 = 7,
    area1 = "西藏",
    area2 = "林芝"
    };
getRow(27,1)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 1,
    area1 = "陕西",
    area2 = "西安"
    };
getRow(27,2)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 2,
    area1 = "陕西",
    area2 = "铜川"
    };
getRow(27,3)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 3,
    area1 = "陕西",
    area2 = "宝鸡"
    };
getRow(27,4)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 4,
    area1 = "陕西",
    area2 = "咸阳"
    };
getRow(27,5)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 5,
    area1 = "陕西",
    area2 = "渭南"
    };
getRow(27,6)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 6,
    area1 = "陕西",
    area2 = "延安"
    };
getRow(27,7)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 7,
    area1 = "陕西",
    area2 = "汉中"
    };
getRow(27,8)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 8,
    area1 = "陕西",
    area2 = "榆林"
    };
getRow(27,9)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 9,
    area1 = "陕西",
    area2 = "安康"
    };
getRow(27,10)->
    #identity_areaCfg {
    id1 = 27,
    id2 = 10,
    area1 = "陕西",
    area2 = "商洛"
    };
getRow(28,1)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 1,
    area1 = "甘肃",
    area2 = "兰州"
    };
getRow(28,2)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 2,
    area1 = "甘肃",
    area2 = "嘉峪关"
    };
getRow(28,3)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 3,
    area1 = "甘肃",
    area2 = "金昌"
    };
getRow(28,4)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 4,
    area1 = "甘肃",
    area2 = "白银"
    };
getRow(28,5)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 5,
    area1 = "甘肃",
    area2 = "天水"
    };
getRow(28,6)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 6,
    area1 = "甘肃",
    area2 = "威武"
    };
getRow(28,7)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 7,
    area1 = "甘肃",
    area2 = "张掖"
    };
getRow(28,8)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 8,
    area1 = "甘肃",
    area2 = "平凉"
    };
getRow(28,9)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 9,
    area1 = "甘肃",
    area2 = "酒泉"
    };
getRow(28,10)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 10,
    area1 = "甘肃",
    area2 = "庆阳"
    };
getRow(28,11)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 11,
    area1 = "甘肃",
    area2 = "定西"
    };
getRow(28,12)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 12,
    area1 = "甘肃",
    area2 = "陇南"
    };
getRow(28,13)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 13,
    area1 = "甘肃",
    area2 = "临夏"
    };
getRow(28,14)->
    #identity_areaCfg {
    id1 = 28,
    id2 = 14,
    area1 = "甘肃",
    area2 = "甘南"
    };
getRow(29,1)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 1,
    area1 = "青海",
    area2 = "西宁"
    };
getRow(29,2)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 2,
    area1 = "青海",
    area2 = "海东"
    };
getRow(29,3)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 3,
    area1 = "青海",
    area2 = "海北"
    };
getRow(29,4)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 4,
    area1 = "青海",
    area2 = "黄南"
    };
getRow(29,5)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 5,
    area1 = "青海",
    area2 = "果洛"
    };
getRow(29,6)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 6,
    area1 = "青海",
    area2 = "玉树"
    };
getRow(29,7)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 7,
    area1 = "青海",
    area2 = "海西"
    };
getRow(29,8)->
    #identity_areaCfg {
    id1 = 29,
    id2 = 8,
    area1 = "青海",
    area2 = "海南"
    };
getRow(30,1)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 1,
    area1 = "宁夏",
    area2 = "银川"
    };
getRow(30,2)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 2,
    area1 = "宁夏",
    area2 = "石嘴山"
    };
getRow(30,3)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 3,
    area1 = "宁夏",
    area2 = "吴忠"
    };
getRow(30,4)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 4,
    area1 = "宁夏",
    area2 = "固原"
    };
getRow(30,5)->
    #identity_areaCfg {
    id1 = 30,
    id2 = 5,
    area1 = "宁夏",
    area2 = "中卫"
    };
getRow(31,1)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 1,
    area1 = "新疆",
    area2 = "乌鲁木齐"
    };
getRow(31,2)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 2,
    area1 = "新疆",
    area2 = "克拉玛依"
    };
getRow(31,3)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 3,
    area1 = "新疆",
    area2 = "吐鲁番"
    };
getRow(31,4)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 4,
    area1 = "新疆",
    area2 = "哈密"
    };
getRow(31,5)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 5,
    area1 = "新疆",
    area2 = "和田"
    };
getRow(31,6)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 6,
    area1 = "新疆",
    area2 = "阿克苏"
    };
getRow(31,7)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 7,
    area1 = "新疆",
    area2 = "喀什"
    };
getRow(31,8)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 8,
    area1 = "新疆",
    area2 = "克孜勒苏柯尔克孜"
    };
getRow(31,9)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 9,
    area1 = "新疆",
    area2 = "巴音郭楞蒙古"
    };
getRow(31,10)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 10,
    area1 = "新疆",
    area2 = "昌吉"
    };
getRow(31,11)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 11,
    area1 = "新疆",
    area2 = "伊犁哈萨克"
    };
getRow(31,12)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 12,
    area1 = "新疆",
    area2 = "塔城"
    };
getRow(31,13)->
    #identity_areaCfg {
    id1 = 31,
    id2 = 13,
    area1 = "新疆",
    area2 = "阿勒泰"
    };
getRow(32,1)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 1,
    area1 = "台湾",
    area2 = "台北"
    };
getRow(32,2)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 2,
    area1 = "台湾",
    area2 = "高雄"
    };
getRow(32,3)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 3,
    area1 = "台湾",
    area2 = "基隆"
    };
getRow(32,4)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 4,
    area1 = "台湾",
    area2 = "台中"
    };
getRow(32,5)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 5,
    area1 = "台湾",
    area2 = "台南"
    };
getRow(32,6)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 6,
    area1 = "台湾",
    area2 = "新竹"
    };
getRow(32,7)->
    #identity_areaCfg {
    id1 = 32,
    id2 = 7,
    area1 = "台湾",
    area2 = "嘉义"
    };
getRow(33,1)->
    #identity_areaCfg {
    id1 = 33,
    id2 = 1,
    area1 = "香港",
    area2 = "香港"
    };
getRow(34,1)->
    #identity_areaCfg {
    id1 = 34,
    id2 = 1,
    area1 = "澳门",
    area2 = "澳门"
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {2,1},
    {3,1},
    {4,1},
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {5,5},
    {5,6},
    {5,7},
    {5,8},
    {5,9},
    {5,10},
    {5,11},
    {5,12},
    {5,13},
    {6,1},
    {6,2},
    {6,3},
    {6,4},
    {6,5},
    {6,6},
    {6,7},
    {6,8},
    {6,9},
    {6,10},
    {6,11},
    {7,1},
    {7,2},
    {7,3},
    {7,4},
    {7,5},
    {7,6},
    {7,7},
    {7,8},
    {7,9},
    {7,10},
    {7,11},
    {7,12},
    {7,13},
    {7,14},
    {7,15},
    {7,16},
    {7,17},
    {8,1},
    {8,2},
    {8,3},
    {8,4},
    {8,5},
    {8,6},
    {8,7},
    {8,8},
    {8,9},
    {9,1},
    {9,2},
    {9,3},
    {9,4},
    {9,5},
    {9,6},
    {9,7},
    {9,8},
    {9,9},
    {9,10},
    {9,11},
    {10,1},
    {10,2},
    {10,3},
    {10,4},
    {10,5},
    {10,6},
    {10,7},
    {10,8},
    {10,9},
    {10,10},
    {10,11},
    {10,12},
    {10,13},
    {11,1},
    {11,2},
    {11,3},
    {11,4},
    {11,5},
    {11,6},
    {11,7},
    {11,8},
    {11,9},
    {11,10},
    {11,11},
    {11,12},
    {11,13},
    {11,14},
    {12,1},
    {12,2},
    {12,3},
    {12,4},
    {12,5},
    {12,6},
    {12,7},
    {12,8},
    {12,9},
    {12,10},
    {12,11},
    {12,12},
    {12,13},
    {12,14},
    {12,15},
    {12,16},
    {12,17},
    {12,18},
    {12,19},
    {12,20},
    {12,21},
    {13,1},
    {13,2},
    {13,3},
    {13,4},
    {13,5},
    {13,6},
    {13,7},
    {13,8},
    {13,9},
    {13,10},
    {13,11},
    {13,12},
    {13,13},
    {13,14},
    {14,1},
    {14,2},
    {15,1},
    {15,2},
    {15,3},
    {15,4},
    {15,5},
    {15,6},
    {15,7},
    {15,8},
    {15,9},
    {15,10},
    {15,11},
    {15,12},
    {15,13},
    {15,14},
    {15,15},
    {15,16},
    {15,17},
    {16,1},
    {16,2},
    {16,3},
    {16,4},
    {16,5},
    {16,6},
    {16,7},
    {16,8},
    {16,9},
    {16,10},
    {16,11},
    {16,12},
    {16,13},
    {16,14},
    {16,15},
    {16,16},
    {16,17},
    {17,1},
    {17,2},
    {17,3},
    {17,4},
    {17,5},
    {17,6},
    {17,7},
    {17,8},
    {17,9},
    {17,10},
    {17,11},
    {18,1},
    {18,2},
    {18,3},
    {18,4},
    {18,5},
    {18,6},
    {18,7},
    {18,8},
    {18,9},
    {18,10},
    {18,11},
    {19,1},
    {19,2},
    {19,3},
    {19,4},
    {19,5},
    {19,6},
    {19,7},
    {19,8},
    {19,9},
    {19,10},
    {19,11},
    {19,12},
    {20,1},
    {20,2},
    {20,3},
    {20,4},
    {20,5},
    {20,6},
    {20,7},
    {20,8},
    {20,9},
    {20,10},
    {20,11},
    {20,12},
    {20,13},
    {20,14},
    {21,1},
    {21,2},
    {21,3},
    {21,4},
    {21,5},
    {21,6},
    {21,7},
    {21,8},
    {21,9},
    {22,1},
    {22,2},
    {22,3},
    {22,4},
    {22,5},
    {22,6},
    {22,7},
    {22,8},
    {22,9},
    {22,10},
    {22,11},
    {22,12},
    {23,1},
    {23,2},
    {23,3},
    {23,4},
    {23,5},
    {23,6},
    {23,7},
    {23,8},
    {23,9},
    {23,10},
    {23,11},
    {23,12},
    {23,13},
    {23,14},
    {23,15},
    {23,16},
    {23,17},
    {23,18},
    {23,19},
    {23,20},
    {23,21},
    {24,1},
    {24,2},
    {24,3},
    {24,4},
    {24,5},
    {24,6},
    {24,7},
    {25,1},
    {25,2},
    {25,3},
    {25,4},
    {25,5},
    {25,6},
    {25,7},
    {25,8},
    {25,9},
    {25,10},
    {25,11},
    {26,1},
    {26,2},
    {26,3},
    {26,4},
    {26,5},
    {26,6},
    {26,7},
    {27,1},
    {27,2},
    {27,3},
    {27,4},
    {27,5},
    {27,6},
    {27,7},
    {27,8},
    {27,9},
    {27,10},
    {28,1},
    {28,2},
    {28,3},
    {28,4},
    {28,5},
    {28,6},
    {28,7},
    {28,8},
    {28,9},
    {28,10},
    {28,11},
    {28,12},
    {28,13},
    {28,14},
    {29,1},
    {29,2},
    {29,3},
    {29,4},
    {29,5},
    {29,6},
    {29,7},
    {29,8},
    {30,1},
    {30,2},
    {30,3},
    {30,4},
    {30,5},
    {31,1},
    {31,2},
    {31,3},
    {31,4},
    {31,5},
    {31,6},
    {31,7},
    {31,8},
    {31,9},
    {31,10},
    {31,11},
    {31,12},
    {31,13},
    {32,1},
    {32,2},
    {32,3},
    {32,4},
    {32,5},
    {32,6},
    {32,7},
    {33,1},
    {34,1}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34
    ].

get2KeyList(1)->[
    1
    ];
get2KeyList(2)->[
    1
    ];
get2KeyList(3)->[
    1
    ];
get2KeyList(4)->[
    1
    ];
get2KeyList(5)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
    ];
get2KeyList(6)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11
    ];
get2KeyList(7)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17
    ];
get2KeyList(8)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(9)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11
    ];
get2KeyList(10)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
    ];
get2KeyList(11)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14
    ];
get2KeyList(12)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21
    ];
get2KeyList(13)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14
    ];
get2KeyList(14)->[
    1,
    2
    ];
get2KeyList(15)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17
    ];
get2KeyList(16)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17
    ];
get2KeyList(17)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11
    ];
get2KeyList(18)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11
    ];
get2KeyList(19)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12
    ];
get2KeyList(20)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14
    ];
get2KeyList(21)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(22)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12
    ];
get2KeyList(23)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21
    ];
get2KeyList(24)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(25)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11
    ];
get2KeyList(26)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(27)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(28)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14
    ];
get2KeyList(29)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ];
get2KeyList(30)->[
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(31)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
    ];
get2KeyList(32)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(33)->[
    1
    ];
get2KeyList(34)->[
    1
    ];
get2KeyList(_)->[].

