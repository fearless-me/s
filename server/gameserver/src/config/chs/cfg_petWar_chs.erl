%% coding: latin-1
%%: 实现
-module(cfg_petWar_chs).
-compile(export_all).
-include("cfg_petWar.hrl").
-include("logger.hrl").

getRow(1)->
    #petWarCfg {
    id = 1,
    chapter = 1,
    chapterName = "龙城",
    point = 1,
    cost = 6,
    monster = [2001,0,0,0,0],
    monstericon = [432,0,0,0,0],
    monsterpower = 900,
    gift_1 = [1901,2160,62],
    dorpid = 10001,
    exp = 110,
    money = 100,
    nextid = 2,
    roundoff = 30
    };
getRow(2)->
    #petWarCfg {
    id = 2,
    chapter = 1,
    chapterName = "龙城",
    point = 2,
    cost = 6,
    monster = [2002,0,0,0,0],
    monstericon = [432,0,0,0,0],
    monsterpower = 900,
    gift_1 = [1901,2160,62],
    dorpid = 10002,
    exp = 120,
    money = 125,
    nextid = 3,
    roundoff = 30
    };
getRow(3)->
    #petWarCfg {
    id = 3,
    chapter = 1,
    chapterName = "龙城",
    point = 3,
    cost = 6,
    monster = [2003,0,0,0,0],
    monstericon = [432,0,0,0,0],
    monsterpower = 1000,
    gift_1 = [1901,2160,62],
    dorpid = 10003,
    exp = 130,
    money = 150,
    nextid = 4,
    roundoff = 30
    };
getRow(4)->
    #petWarCfg {
    id = 4,
    chapter = 1,
    chapterName = "龙城",
    point = 4,
    cost = 6,
    monster = [2004,0,0,0,0],
    monstericon = [432,0,0,0,0],
    monsterpower = 1000,
    gift_1 = [1901,2160,62],
    dorpid = 10004,
    exp = 140,
    money = 175,
    nextid = 5,
    roundoff = 30
    };
getRow(5)->
    #petWarCfg {
    id = 5,
    chapter = 1,
    chapterName = "龙城",
    point = 5,
    cost = 6,
    monster = [2005,0,0,0,0],
    monstericon = [433,0,0,0,0],
    monsterpower = 1000,
    gift_1 = [1925,2160,62],
    dorpid = 10005,
    exp = 150,
    money = 200,
    nextid = 6,
    roundoff = 30
    };
getRow(6)->
    #petWarCfg {
    id = 6,
    chapter = 1,
    chapterName = "龙城",
    point = 6,
    cost = 6,
    monster = [2006,0,0,0,0],
    monstericon = [432,0,0,0,0],
    monsterpower = 1300,
    gift_1 = [1901,2160,62],
    dorpid = 10006,
    exp = 160,
    money = 225,
    nextid = 7,
    roundoff = 30
    };
getRow(7)->
    #petWarCfg {
    id = 7,
    chapter = 1,
    chapterName = "龙城",
    point = 7,
    cost = 6,
    monster = [2007,0,0,0,0],
    monstericon = [432,0,0,0,0],
    monsterpower = 1500,
    gift_1 = [1901,2160,62],
    dorpid = 10007,
    exp = 170,
    money = 250,
    nextid = 8,
    roundoff = 30
    };
getRow(8)->
    #petWarCfg {
    id = 8,
    chapter = 1,
    chapterName = "龙城",
    point = 8,
    cost = 6,
    monster = [2008,0,0,0,0],
    monstericon = [432,0,0,0,0],
    monsterpower = 1800,
    gift_1 = [1901,2160,62],
    dorpid = 10008,
    exp = 180,
    money = 275,
    nextid = 9,
    roundoff = 30
    };
getRow(9)->
    #petWarCfg {
    id = 9,
    chapter = 1,
    chapterName = "龙城",
    point = 9,
    cost = 6,
    monster = [2009,0,0,0,0],
    monstericon = [432,0,0,0,0],
    monsterpower = 2000,
    gift_1 = [1901,2160,62],
    dorpid = 10009,
    exp = 190,
    money = 300,
    nextid = 10,
    roundoff = 30
    };
getRow(10)->
    #petWarCfg {
    id = 10,
    chapter = 1,
    chapterName = "龙城",
    point = 10,
    cost = 6,
    monster = [2010,0,0,0,0],
    monstericon = [434,0,0,0,0],
    monsterpower = 2300,
    gift_1 = [1912,2160,62,11000,11010],
    dorpid = 10010,
    exp = 200,
    money = 325,
    nextid = 11,
    roundoff = 30
    };
getRow(11)->
    #petWarCfg {
    id = 11,
    chapter = 2,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [2011,2012,0,0,0],
    monstericon = [432,432,0,0,0],
    monsterpower = 2400,
    gift_1 = [1901,2160,62],
    dorpid = 10011,
    exp = 210,
    money = 350,
    nextid = 12,
    roundoff = 30
    };
getRow(12)->
    #petWarCfg {
    id = 12,
    chapter = 2,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [2013,2014,0,0,0],
    monstericon = [432,432,0,0,0],
    monsterpower = 2400,
    gift_1 = [1901,2160,62],
    dorpid = 10012,
    exp = 220,
    money = 375,
    nextid = 13,
    roundoff = 30
    };
getRow(13)->
    #petWarCfg {
    id = 13,
    chapter = 2,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [2015,2016,0,0,0],
    monstericon = [432,432,0,0,0],
    monsterpower = 2500,
    gift_1 = [1901,2160,62],
    dorpid = 10013,
    exp = 230,
    money = 400,
    nextid = 14,
    roundoff = 30
    };
getRow(14)->
    #petWarCfg {
    id = 14,
    chapter = 2,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [2017,2018,0,0,0],
    monstericon = [432,432,0,0,0],
    monsterpower = 2600,
    gift_1 = [1901,2160,62],
    dorpid = 10014,
    exp = 240,
    money = 425,
    nextid = 15,
    roundoff = 30
    };
getRow(15)->
    #petWarCfg {
    id = 15,
    chapter = 2,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [2019,2020,0,0,0],
    monstericon = [433,432,0,0,0],
    monsterpower = 2600,
    gift_1 = [1903,2160,62],
    dorpid = 10015,
    exp = 250,
    money = 450,
    nextid = 16,
    roundoff = 30
    };
getRow(16)->
    #petWarCfg {
    id = 16,
    chapter = 2,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [2021,2022,0,0,0],
    monstericon = [432,432,0,0,0],
    monsterpower = 2900,
    gift_1 = [1901,2160,62],
    dorpid = 10016,
    exp = 260,
    money = 475,
    nextid = 17,
    roundoff = 30
    };
getRow(17)->
    #petWarCfg {
    id = 17,
    chapter = 2,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [2023,2024,0,0,0],
    monstericon = [432,432,0,0,0],
    monsterpower = 3200,
    gift_1 = [1901,2160,62],
    dorpid = 10017,
    exp = 270,
    money = 500,
    nextid = 18,
    roundoff = 30
    };
getRow(18)->
    #petWarCfg {
    id = 18,
    chapter = 2,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [2025,2026,0,0,0],
    monstericon = [432,432,0,0,0],
    monsterpower = 3500,
    gift_1 = [1901,2160,62],
    dorpid = 10018,
    exp = 280,
    money = 525,
    nextid = 19,
    roundoff = 30
    };
getRow(19)->
    #petWarCfg {
    id = 19,
    chapter = 2,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [2027,2028,0,0,0],
    monstericon = [432,432,0,0,0],
    monsterpower = 3800,
    gift_1 = [1901,2160,62],
    dorpid = 10019,
    exp = 290,
    money = 550,
    nextid = 20,
    roundoff = 30
    };
getRow(20)->
    #petWarCfg {
    id = 20,
    chapter = 2,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [2029,2030,0,0,0],
    monstericon = [434,432,0,0,0],
    monsterpower = 4100,
    gift_1 = [1924,2160,62,11000,11010],
    dorpid = 10020,
    exp = 300,
    money = 575,
    nextid = 21,
    roundoff = 30
    };
getRow(21)->
    #petWarCfg {
    id = 21,
    chapter = 3,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [2031,2032,2033,0,0],
    monstericon = [432,432,432,0,0],
    monsterpower = 4200,
    gift_1 = [1901,2160,62],
    dorpid = 10021,
    exp = 310,
    money = 600,
    nextid = 22,
    roundoff = 30
    };
getRow(22)->
    #petWarCfg {
    id = 22,
    chapter = 3,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [2034,2035,2036,0,0],
    monstericon = [432,432,432,0,0],
    monsterpower = 4300,
    gift_1 = [1901,2160,62],
    dorpid = 10022,
    exp = 320,
    money = 625,
    nextid = 23,
    roundoff = 30
    };
getRow(23)->
    #petWarCfg {
    id = 23,
    chapter = 3,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [2037,2038,2039,0,0],
    monstericon = [432,432,432,0,0],
    monsterpower = 4400,
    gift_1 = [1901,2160,62],
    dorpid = 10023,
    exp = 330,
    money = 650,
    nextid = 24,
    roundoff = 30
    };
getRow(24)->
    #petWarCfg {
    id = 24,
    chapter = 3,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [2040,2041,2042,0,0],
    monstericon = [432,432,432,0,0],
    monsterpower = 4600,
    gift_1 = [1901,2160,62],
    dorpid = 10024,
    exp = 340,
    money = 675,
    nextid = 25,
    roundoff = 30
    };
getRow(25)->
    #petWarCfg {
    id = 25,
    chapter = 3,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [2043,2044,2045,0,0],
    monstericon = [433,432,432,0,0],
    monsterpower = 4700,
    gift_1 = [1918,2160,62],
    dorpid = 10025,
    exp = 350,
    money = 700,
    nextid = 26,
    roundoff = 30
    };
getRow(26)->
    #petWarCfg {
    id = 26,
    chapter = 3,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [2046,2047,2048,0,0],
    monstericon = [432,432,432,0,0],
    monsterpower = 5600,
    gift_1 = [1901,2160,62],
    dorpid = 10026,
    exp = 360,
    money = 725,
    nextid = 27,
    roundoff = 30
    };
getRow(27)->
    #petWarCfg {
    id = 27,
    chapter = 3,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [2049,2050,2051,0,0],
    monstericon = [432,432,432,0,0],
    monsterpower = 6600,
    gift_1 = [1901,2160,62],
    dorpid = 10027,
    exp = 370,
    money = 750,
    nextid = 28,
    roundoff = 30
    };
getRow(28)->
    #petWarCfg {
    id = 28,
    chapter = 3,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [2052,2053,2054,0,0],
    monstericon = [432,432,432,0,0],
    monsterpower = 7600,
    gift_1 = [1901,2160,62],
    dorpid = 10028,
    exp = 380,
    money = 775,
    nextid = 29,
    roundoff = 30
    };
getRow(29)->
    #petWarCfg {
    id = 29,
    chapter = 3,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [2055,2056,2057,0,0],
    monstericon = [432,432,432,0,0],
    monsterpower = 8600,
    gift_1 = [1901,2160,62],
    dorpid = 10029,
    exp = 390,
    money = 800,
    nextid = 30,
    roundoff = 30
    };
getRow(30)->
    #petWarCfg {
    id = 30,
    chapter = 3,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [2058,2059,2060,0,0],
    monstericon = [434,432,432,0,0],
    monsterpower = 9600,
    gift_1 = [1923,2160,62,11000,11010],
    dorpid = 10030,
    exp = 400,
    money = 825,
    nextid = 31,
    roundoff = 30
    };
getRow(31)->
    #petWarCfg {
    id = 31,
    chapter = 4,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [2061,2062,2063,2064,0],
    monstericon = [432,432,432,432,0],
    monsterpower = 10300,
    gift_1 = [1901,2160,62],
    dorpid = 10031,
    exp = 410,
    money = 850,
    nextid = 32,
    roundoff = 30
    };
getRow(32)->
    #petWarCfg {
    id = 32,
    chapter = 4,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [2065,2066,2067,2068,0],
    monstericon = [432,432,432,432,0],
    monsterpower = 11000,
    gift_1 = [1901,2160,62],
    dorpid = 10032,
    exp = 420,
    money = 875,
    nextid = 33,
    roundoff = 30
    };
getRow(33)->
    #petWarCfg {
    id = 33,
    chapter = 4,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [2069,2070,2071,2072,0],
    monstericon = [432,432,432,432,0],
    monsterpower = 11800,
    gift_1 = [1901,2160,62],
    dorpid = 10033,
    exp = 430,
    money = 900,
    nextid = 34,
    roundoff = 30
    };
getRow(34)->
    #petWarCfg {
    id = 34,
    chapter = 4,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [2073,2074,2075,2076,0],
    monstericon = [432,432,432,432,0],
    monsterpower = 12500,
    gift_1 = [1901,2160,62],
    dorpid = 10034,
    exp = 440,
    money = 925,
    nextid = 35,
    roundoff = 30
    };
getRow(35)->
    #petWarCfg {
    id = 35,
    chapter = 4,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [2077,2078,2079,2080,0],
    monstericon = [433,432,432,432,0],
    monsterpower = 13300,
    gift_1 = [1905,2160,62],
    dorpid = 10035,
    exp = 450,
    money = 950,
    nextid = 36,
    roundoff = 30
    };
getRow(36)->
    #petWarCfg {
    id = 36,
    chapter = 4,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [2081,2082,2083,2084,2085],
    monstericon = [432,432,432,432,432],
    monsterpower = 15800,
    gift_1 = [1925,2160,62],
    dorpid = 10036,
    exp = 460,
    money = 975,
    nextid = 37,
    roundoff = 30
    };
getRow(37)->
    #petWarCfg {
    id = 37,
    chapter = 4,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [2086,2087,2088,2089,2090],
    monstericon = [432,432,432,432,432],
    monsterpower = 18300,
    gift_1 = [1925,2160,62],
    dorpid = 10037,
    exp = 470,
    money = 1000,
    nextid = 38,
    roundoff = 30
    };
getRow(38)->
    #petWarCfg {
    id = 38,
    chapter = 4,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [2091,2092,2093,2094,2095],
    monstericon = [432,432,432,432,432],
    monsterpower = 20900,
    gift_1 = [1925,2160,62],
    dorpid = 10038,
    exp = 480,
    money = 1025,
    nextid = 39,
    roundoff = 30
    };
getRow(39)->
    #petWarCfg {
    id = 39,
    chapter = 4,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [2096,2097,2098,2099,2100],
    monstericon = [432,432,432,432,432],
    monsterpower = 23400,
    gift_1 = [1925,2160,62],
    dorpid = 10039,
    exp = 490,
    money = 1050,
    nextid = 40,
    roundoff = 30
    };
getRow(40)->
    #petWarCfg {
    id = 40,
    chapter = 4,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [2101,2102,2103,2104,2105],
    monstericon = [434,432,432,432,432],
    monsterpower = 25900,
    gift_1 = [1928,2160,62,11000,11010],
    dorpid = 10040,
    exp = 500,
    money = 1075,
    nextid = 41,
    roundoff = 30
    };
getRow(41)->
    #petWarCfg {
    id = 41,
    chapter = 5,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [2106,2107,2108,2109,2110],
    monstericon = [432,432,432,432,432],
    monsterpower = 27800,
    gift_1 = [1918,2160,62],
    dorpid = 10041,
    exp = 510,
    money = 1100,
    nextid = 42,
    roundoff = 30
    };
getRow(42)->
    #petWarCfg {
    id = 42,
    chapter = 5,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [2111,2112,2113,2114,2115],
    monstericon = [432,432,432,432,432],
    monsterpower = 29600,
    gift_1 = [1918,2160,62],
    dorpid = 10042,
    exp = 520,
    money = 1125,
    nextid = 43,
    roundoff = 30
    };
getRow(43)->
    #petWarCfg {
    id = 43,
    chapter = 5,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [2116,2117,2118,2119,2120],
    monstericon = [432,432,432,432,432],
    monsterpower = 31500,
    gift_1 = [1918,2160,62],
    dorpid = 10043,
    exp = 530,
    money = 1150,
    nextid = 44,
    roundoff = 30
    };
getRow(44)->
    #petWarCfg {
    id = 44,
    chapter = 5,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [2121,2122,2123,2124,2125],
    monstericon = [432,432,432,432,432],
    monsterpower = 33300,
    gift_1 = [1918,2160,62],
    dorpid = 10044,
    exp = 540,
    money = 1175,
    nextid = 45,
    roundoff = 30
    };
getRow(45)->
    #petWarCfg {
    id = 45,
    chapter = 5,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [2126,2127,2128,2129,2130],
    monstericon = [433,433,432,432,432],
    monsterpower = 35200,
    gift_1 = [1902,2160,62],
    dorpid = 10045,
    exp = 550,
    money = 1200,
    nextid = 46,
    roundoff = 30
    };
getRow(46)->
    #petWarCfg {
    id = 46,
    chapter = 5,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [2131,2132,2133,2134,2135],
    monstericon = [432,432,432,432,432],
    monsterpower = 36200,
    gift_1 = [1903,2160,62],
    dorpid = 10046,
    exp = 560,
    money = 1225,
    nextid = 47,
    roundoff = 30
    };
getRow(47)->
    #petWarCfg {
    id = 47,
    chapter = 5,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [2136,2137,2138,2139,2140],
    monstericon = [432,432,432,432,432],
    monsterpower = 37300,
    gift_1 = [1903,2160,62],
    dorpid = 10047,
    exp = 570,
    money = 1250,
    nextid = 48,
    roundoff = 30
    };
getRow(48)->
    #petWarCfg {
    id = 48,
    chapter = 5,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [2141,2142,2143,2144,2145],
    monstericon = [432,432,432,432,432],
    monsterpower = 38300,
    gift_1 = [1903,2160,62],
    dorpid = 10048,
    exp = 580,
    money = 1275,
    nextid = 49,
    roundoff = 30
    };
getRow(49)->
    #petWarCfg {
    id = 49,
    chapter = 5,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [2146,2147,2148,2149,2150],
    monstericon = [432,432,432,432,432],
    monsterpower = 39400,
    gift_1 = [1903,2160,62],
    dorpid = 10049,
    exp = 590,
    money = 1300,
    nextid = 50,
    roundoff = 30
    };
getRow(50)->
    #petWarCfg {
    id = 50,
    chapter = 5,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [2151,2152,2153,2154,2155],
    monstericon = [434,433,432,432,432],
    monsterpower = 40400,
    gift_1 = [1928,2160,62,11000,11010],
    dorpid = 10050,
    exp = 600,
    money = 1325,
    nextid = 51,
    roundoff = 30
    };
getRow(51)->
    #petWarCfg {
    id = 51,
    chapter = 6,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [2156,2157,2158,2159,2160],
    monstericon = [432,432,432,432,432],
    monsterpower = 42000,
    gift_1 = [1918,2160,62],
    dorpid = 10051,
    exp = 610,
    money = 1350,
    nextid = 52,
    roundoff = 30
    };
getRow(52)->
    #petWarCfg {
    id = 52,
    chapter = 6,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [2161,2162,2163,2164,2165],
    monstericon = [432,432,432,432,432],
    monsterpower = 43700,
    gift_1 = [1918,2160,62],
    dorpid = 10052,
    exp = 620,
    money = 1375,
    nextid = 53,
    roundoff = 30
    };
getRow(53)->
    #petWarCfg {
    id = 53,
    chapter = 6,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [2166,2167,2168,2169,2170],
    monstericon = [432,432,432,432,432],
    monsterpower = 45300,
    gift_1 = [1918,2160,62],
    dorpid = 10053,
    exp = 630,
    money = 1400,
    nextid = 54,
    roundoff = 30
    };
getRow(54)->
    #petWarCfg {
    id = 54,
    chapter = 6,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [2171,2172,2173,2174,2175],
    monstericon = [432,432,432,432,432],
    monsterpower = 46900,
    gift_1 = [1918,2160,62],
    dorpid = 10054,
    exp = 640,
    money = 1425,
    nextid = 55,
    roundoff = 30
    };
getRow(55)->
    #petWarCfg {
    id = 55,
    chapter = 6,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [2176,2177,2178,2179,2180],
    monstericon = [433,433,432,432,432],
    monsterpower = 48600,
    gift_1 = [1911,2160,62],
    dorpid = 10055,
    exp = 650,
    money = 1450,
    nextid = 56,
    roundoff = 30
    };
getRow(56)->
    #petWarCfg {
    id = 56,
    chapter = 6,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [2181,2182,2183,2184,2185],
    monstericon = [432,432,432,432,432],
    monsterpower = 50400,
    gift_1 = [1905,2160,62],
    dorpid = 10056,
    exp = 660,
    money = 1475,
    nextid = 57,
    roundoff = 30
    };
getRow(57)->
    #petWarCfg {
    id = 57,
    chapter = 6,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [2186,2187,2188,2189,2190],
    monstericon = [432,432,432,432,432],
    monsterpower = 52300,
    gift_1 = [1905,2160,62],
    dorpid = 10057,
    exp = 670,
    money = 1500,
    nextid = 58,
    roundoff = 30
    };
getRow(58)->
    #petWarCfg {
    id = 58,
    chapter = 6,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [2191,2192,2193,2194,2195],
    monstericon = [432,432,432,432,432],
    monsterpower = 54100,
    gift_1 = [1905,2160,62],
    dorpid = 10058,
    exp = 680,
    money = 1525,
    nextid = 59,
    roundoff = 30
    };
getRow(59)->
    #petWarCfg {
    id = 59,
    chapter = 6,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [2196,2197,2198,2199,2200],
    monstericon = [432,432,432,432,432],
    monsterpower = 56000,
    gift_1 = [1905,2160,62],
    dorpid = 10059,
    exp = 690,
    money = 1550,
    nextid = 60,
    roundoff = 30
    };
getRow(60)->
    #petWarCfg {
    id = 60,
    chapter = 6,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [2201,2202,2203,2204,2205],
    monstericon = [434,433,432,432,432],
    monsterpower = 57800,
    gift_1 = [1914,2160,62,11000,11010],
    dorpid = 10060,
    exp = 700,
    money = 1575,
    nextid = 61,
    roundoff = 30
    };
getRow(61)->
    #petWarCfg {
    id = 61,
    chapter = 7,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [2206,2207,2208,2209,2210],
    monstericon = [432,432,432,432,432],
    monsterpower = 61700,
    gift_1 = [1902,2160,62],
    dorpid = 10061,
    exp = 710,
    money = 1600,
    nextid = 62,
    roundoff = 30
    };
getRow(62)->
    #petWarCfg {
    id = 62,
    chapter = 7,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [2211,2212,2213,2214,2215],
    monstericon = [432,432,432,432,432],
    monsterpower = 65600,
    gift_1 = [1902,2160,62],
    dorpid = 10062,
    exp = 720,
    money = 1625,
    nextid = 63,
    roundoff = 30
    };
getRow(63)->
    #petWarCfg {
    id = 63,
    chapter = 7,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [2216,2217,2218,2219,2220],
    monstericon = [432,432,432,432,432],
    monsterpower = 69500,
    gift_1 = [1902,2160,62],
    dorpid = 10063,
    exp = 730,
    money = 1650,
    nextid = 64,
    roundoff = 30
    };
getRow(64)->
    #petWarCfg {
    id = 64,
    chapter = 7,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [2221,2222,2223,2224,2225],
    monstericon = [432,432,432,432,432],
    monsterpower = 73500,
    gift_1 = [1902,2160,62],
    dorpid = 10064,
    exp = 740,
    money = 1675,
    nextid = 65,
    roundoff = 30
    };
getRow(65)->
    #petWarCfg {
    id = 65,
    chapter = 7,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [2226,2227,2228,2229,2230],
    monstericon = [433,433,432,432,432],
    monsterpower = 77400,
    gift_1 = [1921,2160,62],
    dorpid = 10065,
    exp = 750,
    money = 1700,
    nextid = 66,
    roundoff = 30
    };
getRow(66)->
    #petWarCfg {
    id = 66,
    chapter = 7,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [2231,2232,2233,2234,2235],
    monstericon = [432,432,432,432,432],
    monsterpower = 81600,
    gift_1 = [1912,2160,62],
    dorpid = 10066,
    exp = 760,
    money = 1725,
    nextid = 67,
    roundoff = 30
    };
getRow(67)->
    #petWarCfg {
    id = 67,
    chapter = 7,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [2236,2237,2238,2239,2240],
    monstericon = [432,432,432,432,432],
    monsterpower = 85700,
    gift_1 = [1912,2160,62],
    dorpid = 10067,
    exp = 770,
    money = 1750,
    nextid = 68,
    roundoff = 30
    };
getRow(68)->
    #petWarCfg {
    id = 68,
    chapter = 7,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [2241,2242,2243,2244,2245],
    monstericon = [432,432,432,432,432],
    monsterpower = 89900,
    gift_1 = [1912,2160,62],
    dorpid = 10068,
    exp = 780,
    money = 1775,
    nextid = 69,
    roundoff = 30
    };
getRow(69)->
    #petWarCfg {
    id = 69,
    chapter = 7,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [2246,2247,2248,2249,2250],
    monstericon = [432,432,432,432,432],
    monsterpower = 94100,
    gift_1 = [1912,2160,62],
    dorpid = 10069,
    exp = 790,
    money = 1800,
    nextid = 70,
    roundoff = 30
    };
getRow(70)->
    #petWarCfg {
    id = 70,
    chapter = 7,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [2251,2252,2253,2254,2255],
    monstericon = [434,433,432,432,432],
    monsterpower = 98300,
    gift_1 = [1919,1912,62,11000,11010],
    dorpid = 10070,
    exp = 800,
    money = 1825,
    nextid = 71,
    roundoff = 30
    };
getRow(71)->
    #petWarCfg {
    id = 71,
    chapter = 8,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [2256,2257,2258,2259,2260],
    monstericon = [432,432,432,432,432],
    monsterpower = 100000,
    gift_1 = [1908,1925,62],
    dorpid = 10071,
    exp = 810,
    money = 1850,
    nextid = 72,
    roundoff = 30
    };
getRow(72)->
    #petWarCfg {
    id = 72,
    chapter = 8,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [2261,2262,2263,2264,2265],
    monstericon = [432,432,432,432,432],
    monsterpower = 102000,
    gift_1 = [1908,1925,62],
    dorpid = 10072,
    exp = 820,
    money = 1875,
    nextid = 73,
    roundoff = 30
    };
getRow(73)->
    #petWarCfg {
    id = 73,
    chapter = 8,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [2266,2267,2268,2269,2270],
    monstericon = [432,432,432,432,432],
    monsterpower = 104000,
    gift_1 = [1908,1925,62],
    dorpid = 10073,
    exp = 830,
    money = 1900,
    nextid = 74,
    roundoff = 30
    };
getRow(74)->
    #petWarCfg {
    id = 74,
    chapter = 8,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [2271,2272,2273,2274,2275],
    monstericon = [432,432,432,432,432],
    monsterpower = 106000,
    gift_1 = [1908,1925,62],
    dorpid = 10074,
    exp = 840,
    money = 1925,
    nextid = 75,
    roundoff = 30
    };
getRow(75)->
    #petWarCfg {
    id = 75,
    chapter = 8,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [2276,2277,2278,2279,2280],
    monstericon = [433,433,433,432,432],
    monsterpower = 107000,
    gift_1 = [1910,1908,62],
    dorpid = 10075,
    exp = 850,
    money = 1950,
    nextid = 76,
    roundoff = 30
    };
getRow(76)->
    #petWarCfg {
    id = 76,
    chapter = 8,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [2281,2282,2283,2284,2285],
    monstericon = [432,432,432,432,432],
    monsterpower = 116000,
    gift_1 = [1924,1925,62],
    dorpid = 10076,
    exp = 860,
    money = 1975,
    nextid = 77,
    roundoff = 30
    };
getRow(77)->
    #petWarCfg {
    id = 77,
    chapter = 8,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [2286,2287,2288,2289,2290],
    monstericon = [432,432,432,432,432],
    monsterpower = 124000,
    gift_1 = [1924,1925,62],
    dorpid = 10077,
    exp = 870,
    money = 2000,
    nextid = 78,
    roundoff = 30
    };
getRow(78)->
    #petWarCfg {
    id = 78,
    chapter = 8,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [2291,2292,2293,2294,2295],
    monstericon = [432,432,432,432,432],
    monsterpower = 133000,
    gift_1 = [1924,1925,62],
    dorpid = 10078,
    exp = 880,
    money = 2025,
    nextid = 79,
    roundoff = 30
    };
getRow(79)->
    #petWarCfg {
    id = 79,
    chapter = 8,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [2296,2297,2298,2299,2300],
    monstericon = [432,432,432,432,432],
    monsterpower = 141000,
    gift_1 = [1924,1925,62],
    dorpid = 10079,
    exp = 890,
    money = 2050,
    nextid = 80,
    roundoff = 30
    };
getRow(80)->
    #petWarCfg {
    id = 80,
    chapter = 8,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [2301,2302,2303,2304,2305],
    monstericon = [434,433,433,432,432],
    monsterpower = 150000,
    gift_1 = [1909,1924,62,11000,11010],
    dorpid = 10080,
    exp = 900,
    money = 2075,
    nextid = 81,
    roundoff = 30
    };
getRow(81)->
    #petWarCfg {
    id = 81,
    chapter = 9,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [2306,2307,2308,2309,2310],
    monstericon = [432,432,432,432,432],
    monsterpower = 154000,
    gift_1 = [1911,1918,62],
    dorpid = 10081,
    exp = 910,
    money = 2100,
    nextid = 82,
    roundoff = 30
    };
getRow(82)->
    #petWarCfg {
    id = 82,
    chapter = 9,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [2311,2312,2313,2314,2315],
    monstericon = [432,432,432,432,432],
    monsterpower = 158000,
    gift_1 = [1911,1918,62],
    dorpid = 10082,
    exp = 920,
    money = 2125,
    nextid = 83,
    roundoff = 30
    };
getRow(83)->
    #petWarCfg {
    id = 83,
    chapter = 9,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [2316,2317,2318,2319,2320],
    monstericon = [432,432,432,432,432],
    monsterpower = 162000,
    gift_1 = [1911,1918,62],
    dorpid = 10083,
    exp = 930,
    money = 2150,
    nextid = 84,
    roundoff = 30
    };
getRow(84)->
    #petWarCfg {
    id = 84,
    chapter = 9,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [2321,2322,2323,2324,2325],
    monstericon = [432,432,432,432,432],
    monsterpower = 167000,
    gift_1 = [1911,1918,62],
    dorpid = 10084,
    exp = 940,
    money = 2175,
    nextid = 85,
    roundoff = 30
    };
getRow(85)->
    #petWarCfg {
    id = 85,
    chapter = 9,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [2326,2327,2328,2329,2330],
    monstericon = [433,433,433,432,432],
    monsterpower = 171000,
    gift_1 = [1906,1911,62],
    dorpid = 10085,
    exp = 950,
    money = 2200,
    nextid = 86,
    roundoff = 30
    };
getRow(86)->
    #petWarCfg {
    id = 86,
    chapter = 9,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [2331,2332,2333,2334,2335],
    monstericon = [432,432,432,432,432],
    monsterpower = 177000,
    gift_1 = [1928,1918,62],
    dorpid = 10086,
    exp = 960,
    money = 2225,
    nextid = 87,
    roundoff = 30
    };
getRow(87)->
    #petWarCfg {
    id = 87,
    chapter = 9,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [2336,2337,2338,2339,2340],
    monstericon = [432,432,432,432,432],
    monsterpower = 183000,
    gift_1 = [1928,1918,62],
    dorpid = 10087,
    exp = 970,
    money = 2250,
    nextid = 88,
    roundoff = 30
    };
getRow(88)->
    #petWarCfg {
    id = 88,
    chapter = 9,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [2341,2342,2343,2344,2345],
    monstericon = [432,432,432,432,432],
    monsterpower = 189000,
    gift_1 = [1928,1918,62],
    dorpid = 10088,
    exp = 980,
    money = 2275,
    nextid = 89,
    roundoff = 30
    };
getRow(89)->
    #petWarCfg {
    id = 89,
    chapter = 9,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [2346,2347,2348,2349,2350],
    monstericon = [432,432,432,432,432],
    monsterpower = 196000,
    gift_1 = [1928,1918,62],
    dorpid = 10089,
    exp = 990,
    money = 2300,
    nextid = 90,
    roundoff = 30
    };
getRow(90)->
    #petWarCfg {
    id = 90,
    chapter = 9,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [2351,2352,2353,2354,2355],
    monstericon = [434,433,433,432,432],
    monsterpower = 202000,
    gift_1 = [1929,1928,62,11000,11010],
    dorpid = 10090,
    exp = 1000,
    money = 2325,
    nextid = 91,
    roundoff = 30
    };
getRow(91)->
    #petWarCfg {
    id = 91,
    chapter = 10,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [2356,2357,2358,2359,2360],
    monstericon = [432,432,432,432,432],
    monsterpower = 203000,
    gift_1 = [1919,1903,62],
    dorpid = 10091,
    exp = 1010,
    money = 2350,
    nextid = 92,
    roundoff = 30
    };
getRow(92)->
    #petWarCfg {
    id = 92,
    chapter = 10,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [2361,2362,2363,2364,2365],
    monstericon = [432,432,432,432,432],
    monsterpower = 204000,
    gift_1 = [1919,1903,62],
    dorpid = 10092,
    exp = 1020,
    money = 2375,
    nextid = 93,
    roundoff = 30
    };
getRow(93)->
    #petWarCfg {
    id = 93,
    chapter = 10,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [2366,2367,2368,2369,2370],
    monstericon = [432,432,432,432,432],
    monsterpower = 205000,
    gift_1 = [1919,1903,62],
    dorpid = 10093,
    exp = 1030,
    money = 2400,
    nextid = 94,
    roundoff = 30
    };
getRow(94)->
    #petWarCfg {
    id = 94,
    chapter = 10,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [2371,2372,2373,2374,2375],
    monstericon = [432,432,432,432,432],
    monsterpower = 207000,
    gift_1 = [1919,1903,62],
    dorpid = 10094,
    exp = 1040,
    money = 2425,
    nextid = 95,
    roundoff = 30
    };
getRow(95)->
    #petWarCfg {
    id = 95,
    chapter = 10,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [2376,2377,2378,2379,2380],
    monstericon = [433,433,433,432,432],
    monsterpower = 208000,
    gift_1 = [1904,1919,62],
    dorpid = 10095,
    exp = 1050,
    money = 2450,
    nextid = 96,
    roundoff = 30
    };
getRow(96)->
    #petWarCfg {
    id = 96,
    chapter = 10,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [2381,2382,2383,2384,2385],
    monstericon = [432,432,432,432,432],
    monsterpower = 232000,
    gift_1 = [1921,1903,62],
    dorpid = 10096,
    exp = 1060,
    money = 2475,
    nextid = 97,
    roundoff = 30
    };
getRow(97)->
    #petWarCfg {
    id = 97,
    chapter = 10,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [2386,2387,2388,2389,2390],
    monstericon = [432,432,432,432,432],
    monsterpower = 256000,
    gift_1 = [1921,1903,62],
    dorpid = 10097,
    exp = 1070,
    money = 2500,
    nextid = 98,
    roundoff = 30
    };
getRow(98)->
    #petWarCfg {
    id = 98,
    chapter = 10,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [2391,2392,2393,2394,2395],
    monstericon = [432,432,432,432,432],
    monsterpower = 280000,
    gift_1 = [1921,1903,62],
    dorpid = 10098,
    exp = 1080,
    money = 2525,
    nextid = 99,
    roundoff = 30
    };
getRow(99)->
    #petWarCfg {
    id = 99,
    chapter = 10,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [2396,2397,2398,2399,2400],
    monstericon = [432,432,432,432,432],
    monsterpower = 304000,
    gift_1 = [1921,1903,62],
    dorpid = 10099,
    exp = 1090,
    money = 2550,
    nextid = 100,
    roundoff = 30
    };
getRow(100)->
    #petWarCfg {
    id = 100,
    chapter = 10,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [2401,2402,2403,2404,2405],
    monstericon = [434,433,433,432,432],
    monsterpower = 328000,
    gift_1 = [1923,1921,62,11000,11010],
    dorpid = 10100,
    exp = 1100,
    money = 2575,
    nextid = 101,
    roundoff = 30
    };
getRow(101)->
    #petWarCfg {
    id = 101,
    chapter = 11,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [2406,2407,2408,2409,2410],
    monstericon = [432,432,432,432,432],
    monsterpower = 368000,
    gift_1 = [1910,1905,62],
    dorpid = 10101,
    exp = 1110,
    money = 2600,
    nextid = 102,
    roundoff = 30
    };
getRow(102)->
    #petWarCfg {
    id = 102,
    chapter = 11,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [2411,2412,2413,2414,2415],
    monstericon = [432,432,432,432,432],
    monsterpower = 408000,
    gift_1 = [1910,1905,62],
    dorpid = 10102,
    exp = 1120,
    money = 2625,
    nextid = 103,
    roundoff = 30
    };
getRow(103)->
    #petWarCfg {
    id = 103,
    chapter = 11,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [2416,2417,2418,2419,2420],
    monstericon = [432,432,432,432,432],
    monsterpower = 449000,
    gift_1 = [1910,1905,62],
    dorpid = 10103,
    exp = 1130,
    money = 2650,
    nextid = 104,
    roundoff = 30
    };
getRow(104)->
    #petWarCfg {
    id = 104,
    chapter = 11,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [2421,2422,2423,2424,2425],
    monstericon = [432,432,432,432,432],
    monsterpower = 489000,
    gift_1 = [1910,1905,62],
    dorpid = 10104,
    exp = 1140,
    money = 2675,
    nextid = 105,
    roundoff = 30
    };
getRow(105)->
    #petWarCfg {
    id = 105,
    chapter = 11,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [2426,2427,2428,2429,2430],
    monstericon = [433,433,433,432,432],
    monsterpower = 530000,
    gift_1 = [1914,1910,62],
    dorpid = 10105,
    exp = 1150,
    money = 2700,
    nextid = 106,
    roundoff = 30
    };
getRow(106)->
    #petWarCfg {
    id = 106,
    chapter = 11,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [2431,2432,2433,2434,2435],
    monstericon = [432,432,432,432,432],
    monsterpower = 561000,
    gift_1 = [1909,1905,62],
    dorpid = 10106,
    exp = 1160,
    money = 2725,
    nextid = 107,
    roundoff = 30
    };
getRow(107)->
    #petWarCfg {
    id = 107,
    chapter = 11,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [2436,2437,2438,2439,2440],
    monstericon = [432,432,432,432,432],
    monsterpower = 592000,
    gift_1 = [1909,1905,62],
    dorpid = 10107,
    exp = 1170,
    money = 2750,
    nextid = 108,
    roundoff = 30
    };
getRow(108)->
    #petWarCfg {
    id = 108,
    chapter = 11,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [2441,2442,2443,2444,2445],
    monstericon = [432,432,432,432,432],
    monsterpower = 624000,
    gift_1 = [1909,1905,62],
    dorpid = 10108,
    exp = 1180,
    money = 2775,
    nextid = 109,
    roundoff = 30
    };
getRow(109)->
    #petWarCfg {
    id = 109,
    chapter = 11,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [2446,2447,2448,2449,2450],
    monstericon = [432,432,432,432,432],
    monsterpower = 655000,
    gift_1 = [1909,1905,62],
    dorpid = 10109,
    exp = 1190,
    money = 2800,
    nextid = 110,
    roundoff = 30
    };
getRow(110)->
    #petWarCfg {
    id = 110,
    chapter = 11,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [2451,2452,2453,2454,2455],
    monstericon = [434,433,433,433,432],
    monsterpower = 687000,
    gift_1 = [1920,1909,62,11000,11010],
    dorpid = 10110,
    exp = 1200,
    money = 2825,
    nextid = 111,
    roundoff = 30
    };
getRow(111)->
    #petWarCfg {
    id = 111,
    chapter = 12,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [2456,2457,2458,2459,2460],
    monstericon = [432,432,432,432,432],
    monsterpower = 718000,
    gift_1 = [1904,1902,62],
    dorpid = 10111,
    exp = 1210,
    money = 2850,
    nextid = 112,
    roundoff = 30
    };
getRow(112)->
    #petWarCfg {
    id = 112,
    chapter = 12,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [2461,2462,2463,2464,2465],
    monstericon = [432,432,432,432,432],
    monsterpower = 749000,
    gift_1 = [1904,1902,62],
    dorpid = 10112,
    exp = 1220,
    money = 2875,
    nextid = 113,
    roundoff = 30
    };
getRow(113)->
    #petWarCfg {
    id = 113,
    chapter = 12,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [2466,2467,2468,2469,2470],
    monstericon = [432,432,432,432,432],
    monsterpower = 780000,
    gift_1 = [1904,1902,62],
    dorpid = 10113,
    exp = 1230,
    money = 2900,
    nextid = 114,
    roundoff = 30
    };
getRow(114)->
    #petWarCfg {
    id = 114,
    chapter = 12,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [2471,2472,2473,2474,2475],
    monstericon = [432,432,432,432,432],
    monsterpower = 811000,
    gift_1 = [1904,1902,62],
    dorpid = 10114,
    exp = 1240,
    money = 2925,
    nextid = 115,
    roundoff = 30
    };
getRow(115)->
    #petWarCfg {
    id = 115,
    chapter = 12,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [2476,2477,2478,2479,2480],
    monstericon = [433,433,433,433,432],
    monsterpower = 842000,
    gift_1 = [1929,1904,62],
    dorpid = 10115,
    exp = 1250,
    money = 2950,
    nextid = 116,
    roundoff = 30
    };
getRow(116)->
    #petWarCfg {
    id = 116,
    chapter = 12,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [2481,2482,2483,2484,2485],
    monstericon = [432,432,432,432,432],
    monsterpower = 874000,
    gift_1 = [1906,1902,62],
    dorpid = 10116,
    exp = 1260,
    money = 2975,
    nextid = 117,
    roundoff = 30
    };
getRow(117)->
    #petWarCfg {
    id = 117,
    chapter = 12,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [2486,2487,2488,2489,2490],
    monstericon = [432,432,432,432,432],
    monsterpower = 905000,
    gift_1 = [1906,1902,62],
    dorpid = 10117,
    exp = 1270,
    money = 3000,
    nextid = 118,
    roundoff = 30
    };
getRow(118)->
    #petWarCfg {
    id = 118,
    chapter = 12,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [2491,2492,2493,2494,2495],
    monstericon = [432,432,432,432,432],
    monsterpower = 937000,
    gift_1 = [1906,1902,62],
    dorpid = 10118,
    exp = 1280,
    money = 3025,
    nextid = 119,
    roundoff = 30
    };
getRow(119)->
    #petWarCfg {
    id = 119,
    chapter = 12,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [2496,2497,2498,2499,2500],
    monstericon = [432,432,432,432,432],
    monsterpower = 969000,
    gift_1 = [1906,1902,62],
    dorpid = 10119,
    exp = 1290,
    money = 3050,
    nextid = 120,
    roundoff = 30
    };
getRow(120)->
    #petWarCfg {
    id = 120,
    chapter = 12,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [2501,2502,2503,2504,2505],
    monstericon = [434,433,433,433,433],
    monsterpower = 1000000,
    gift_1 = [1926,1920,62,11000,11010],
    dorpid = 10120,
    exp = 1300,
    money = 3075,
    nextid = 121,
    roundoff = 30
    };
getRow(121)->
    #petWarCfg {
    id = 121,
    chapter = 13,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5101,5102,5103,5104,5105],
    monstericon = [432,432,432,432,432],
    monsterpower = 1003500,
    gift_1 = [1908,1925,62],
    dorpid = 10121,
    exp = 1310,
    money = 3100,
    nextid = 122,
    roundoff = 30
    };
getRow(122)->
    #petWarCfg {
    id = 122,
    chapter = 13,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5106,5107,5108,5109,5110],
    monstericon = [432,432,432,432,432],
    monsterpower = 1007012,
    gift_1 = [1908,1925,62],
    dorpid = 10122,
    exp = 1320,
    money = 3125,
    nextid = 123,
    roundoff = 30
    };
getRow(123)->
    #petWarCfg {
    id = 123,
    chapter = 13,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5111,5112,5113,5114,5115],
    monstericon = [432,432,432,432,432],
    monsterpower = 1010536,
    gift_1 = [1908,1925,62],
    dorpid = 10123,
    exp = 1330,
    money = 3150,
    nextid = 124,
    roundoff = 30
    };
getRow(124)->
    #petWarCfg {
    id = 124,
    chapter = 13,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5116,5117,5118,5119,5120],
    monstericon = [432,432,432,432,432],
    monsterpower = 1014072,
    gift_1 = [1908,1925,62],
    dorpid = 10124,
    exp = 1340,
    money = 3175,
    nextid = 125,
    roundoff = 30
    };
getRow(125)->
    #petWarCfg {
    id = 125,
    chapter = 13,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5121,5122,5123,5124,5125],
    monstericon = [433,433,432,432,432],
    monsterpower = 1017621,
    gift_1 = [1910,1908,62],
    dorpid = 10125,
    exp = 1350,
    money = 3200,
    nextid = 126,
    roundoff = 30
    };
getRow(126)->
    #petWarCfg {
    id = 126,
    chapter = 13,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5126,5127,5128,5129,5130],
    monstericon = [432,432,432,432,432],
    monsterpower = 1021182,
    gift_1 = [1924,1925,62],
    dorpid = 10126,
    exp = 1360,
    money = 3225,
    nextid = 127,
    roundoff = 30
    };
getRow(127)->
    #petWarCfg {
    id = 127,
    chapter = 13,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5131,5132,5133,5134,5135],
    monstericon = [432,432,432,432,432],
    monsterpower = 1024756,
    gift_1 = [1924,1925,62],
    dorpid = 10127,
    exp = 1370,
    money = 3250,
    nextid = 128,
    roundoff = 30
    };
getRow(128)->
    #petWarCfg {
    id = 128,
    chapter = 13,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5136,5137,5138,5139,5140],
    monstericon = [432,432,432,432,432],
    monsterpower = 1028342,
    gift_1 = [1924,1925,62],
    dorpid = 10128,
    exp = 1380,
    money = 3275,
    nextid = 129,
    roundoff = 30
    };
getRow(129)->
    #petWarCfg {
    id = 129,
    chapter = 13,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5141,5142,5143,5144,5145],
    monstericon = [432,432,432,432,432],
    monsterpower = 1031941,
    gift_1 = [1924,1925,62],
    dorpid = 10129,
    exp = 1390,
    money = 3300,
    nextid = 130,
    roundoff = 30
    };
getRow(130)->
    #petWarCfg {
    id = 130,
    chapter = 13,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5146,5147,5148,5149,5150],
    monstericon = [434,433,432,432,432],
    monsterpower = 1035552,
    gift_1 = [1909,1924,62,11000,11010],
    dorpid = 10130,
    exp = 1400,
    money = 3325,
    nextid = 131,
    roundoff = 30
    };
getRow(131)->
    #petWarCfg {
    id = 131,
    chapter = 14,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5151,5152,5153,5154,5155],
    monstericon = [432,432,432,432,432],
    monsterpower = 1039176,
    gift_1 = [1911,1918,62],
    dorpid = 10131,
    exp = 1410,
    money = 3350,
    nextid = 132,
    roundoff = 30
    };
getRow(132)->
    #petWarCfg {
    id = 132,
    chapter = 14,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5156,5157,5158,5159,5160],
    monstericon = [432,432,432,432,432],
    monsterpower = 1042813,
    gift_1 = [1911,1918,62],
    dorpid = 10132,
    exp = 1420,
    money = 3375,
    nextid = 133,
    roundoff = 30
    };
getRow(133)->
    #petWarCfg {
    id = 133,
    chapter = 14,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5161,5162,5163,5164,5165],
    monstericon = [432,432,432,432,432],
    monsterpower = 1046462,
    gift_1 = [1911,1918,62],
    dorpid = 10133,
    exp = 1430,
    money = 3400,
    nextid = 134,
    roundoff = 30
    };
getRow(134)->
    #petWarCfg {
    id = 134,
    chapter = 14,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5166,5167,5168,5169,5170],
    monstericon = [432,432,432,432,432],
    monsterpower = 1050124,
    gift_1 = [1911,1918,62],
    dorpid = 10134,
    exp = 1440,
    money = 3425,
    nextid = 135,
    roundoff = 30
    };
getRow(135)->
    #petWarCfg {
    id = 135,
    chapter = 14,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5171,5172,5173,5174,5175],
    monstericon = [433,433,432,432,432],
    monsterpower = 1053799,
    gift_1 = [1906,1911,62],
    dorpid = 10135,
    exp = 1450,
    money = 3450,
    nextid = 136,
    roundoff = 30
    };
getRow(136)->
    #petWarCfg {
    id = 136,
    chapter = 14,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5176,5177,5178,5179,5180],
    monstericon = [432,432,432,432,432],
    monsterpower = 1057487,
    gift_1 = [1928,1918,62],
    dorpid = 10136,
    exp = 1460,
    money = 3475,
    nextid = 137,
    roundoff = 30
    };
getRow(137)->
    #petWarCfg {
    id = 137,
    chapter = 14,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5181,5182,5183,5184,5185],
    monstericon = [432,432,432,432,432],
    monsterpower = 1061188,
    gift_1 = [1928,1918,62],
    dorpid = 10137,
    exp = 1470,
    money = 3500,
    nextid = 138,
    roundoff = 30
    };
getRow(138)->
    #petWarCfg {
    id = 138,
    chapter = 14,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5186,5187,5188,5189,5190],
    monstericon = [432,432,432,432,432],
    monsterpower = 1064902,
    gift_1 = [1928,1918,62],
    dorpid = 10138,
    exp = 1480,
    money = 3525,
    nextid = 139,
    roundoff = 30
    };
getRow(139)->
    #petWarCfg {
    id = 139,
    chapter = 14,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5191,5192,5193,5194,5195],
    monstericon = [432,432,432,432,432],
    monsterpower = 1068629,
    gift_1 = [1928,1918,62],
    dorpid = 10139,
    exp = 1490,
    money = 3550,
    nextid = 140,
    roundoff = 30
    };
getRow(140)->
    #petWarCfg {
    id = 140,
    chapter = 14,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5196,5197,5198,5199,5200],
    monstericon = [434,433,432,432,432],
    monsterpower = 1072369,
    gift_1 = [1929,1928,62,11000,11010],
    dorpid = 10140,
    exp = 1500,
    money = 3575,
    nextid = 141,
    roundoff = 30
    };
getRow(141)->
    #petWarCfg {
    id = 141,
    chapter = 15,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5201,5202,5203,5204,5205],
    monstericon = [432,432,432,432,432],
    monsterpower = 1076122,
    gift_1 = [1919,1903,62],
    dorpid = 10141,
    exp = 1510,
    money = 3600,
    nextid = 142,
    roundoff = 30
    };
getRow(142)->
    #petWarCfg {
    id = 142,
    chapter = 15,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5206,5207,5208,5209,5210],
    monstericon = [432,432,432,432,432],
    monsterpower = 1079888,
    gift_1 = [1919,1903,62],
    dorpid = 10142,
    exp = 1520,
    money = 3625,
    nextid = 143,
    roundoff = 30
    };
getRow(143)->
    #petWarCfg {
    id = 143,
    chapter = 15,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5211,5212,5213,5214,5215],
    monstericon = [432,432,432,432,432],
    monsterpower = 1083667,
    gift_1 = [1919,1903,62],
    dorpid = 10143,
    exp = 1530,
    money = 3650,
    nextid = 144,
    roundoff = 30
    };
getRow(144)->
    #petWarCfg {
    id = 144,
    chapter = 15,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5216,5217,5218,5219,5220],
    monstericon = [432,432,432,432,432],
    monsterpower = 1087459,
    gift_1 = [1919,1903,62],
    dorpid = 10144,
    exp = 1540,
    money = 3675,
    nextid = 145,
    roundoff = 30
    };
getRow(145)->
    #petWarCfg {
    id = 145,
    chapter = 15,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5221,5222,5223,5224,5225],
    monstericon = [433,433,432,432,432],
    monsterpower = 1091265,
    gift_1 = [1904,1919,62],
    dorpid = 10145,
    exp = 1550,
    money = 3700,
    nextid = 146,
    roundoff = 30
    };
getRow(146)->
    #petWarCfg {
    id = 146,
    chapter = 15,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5226,5227,5228,5229,5230],
    monstericon = [432,432,432,432,432],
    monsterpower = 1095084,
    gift_1 = [1921,1903,62],
    dorpid = 10146,
    exp = 1560,
    money = 3725,
    nextid = 147,
    roundoff = 30
    };
getRow(147)->
    #petWarCfg {
    id = 147,
    chapter = 15,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5231,5232,5233,5234,5235],
    monstericon = [432,432,432,432,432],
    monsterpower = 1098916,
    gift_1 = [1921,1903,62],
    dorpid = 10147,
    exp = 1570,
    money = 3750,
    nextid = 148,
    roundoff = 30
    };
getRow(148)->
    #petWarCfg {
    id = 148,
    chapter = 15,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5236,5237,5238,5239,5240],
    monstericon = [432,432,432,432,432],
    monsterpower = 1102762,
    gift_1 = [1921,1903,62],
    dorpid = 10148,
    exp = 1580,
    money = 3775,
    nextid = 149,
    roundoff = 30
    };
getRow(149)->
    #petWarCfg {
    id = 149,
    chapter = 15,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5241,5242,5243,5244,5245],
    monstericon = [432,432,432,432,432],
    monsterpower = 1106621,
    gift_1 = [1921,1903,62],
    dorpid = 10149,
    exp = 1590,
    money = 3800,
    nextid = 150,
    roundoff = 30
    };
getRow(150)->
    #petWarCfg {
    id = 150,
    chapter = 15,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5246,5247,5248,5249,5250],
    monstericon = [434,433,432,432,432],
    monsterpower = 1110494,
    gift_1 = [1923,1921,62,11000,11010],
    dorpid = 10150,
    exp = 1600,
    money = 3825,
    nextid = 151,
    roundoff = 30
    };
getRow(151)->
    #petWarCfg {
    id = 151,
    chapter = 16,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5251,5252,5253,5254,5255],
    monstericon = [432,432,432,432,432],
    monsterpower = 1114380,
    gift_1 = [1910,1905,62],
    dorpid = 10151,
    exp = 1610,
    money = 3850,
    nextid = 152,
    roundoff = 30
    };
getRow(152)->
    #petWarCfg {
    id = 152,
    chapter = 16,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5256,5257,5258,5259,5260],
    monstericon = [432,432,432,432,432],
    monsterpower = 1118280,
    gift_1 = [1910,1905,62],
    dorpid = 10152,
    exp = 1620,
    money = 3875,
    nextid = 153,
    roundoff = 30
    };
getRow(153)->
    #petWarCfg {
    id = 153,
    chapter = 16,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5261,5262,5263,5264,5265],
    monstericon = [432,432,432,432,432],
    monsterpower = 1122193,
    gift_1 = [1910,1905,62],
    dorpid = 10153,
    exp = 1630,
    money = 3900,
    nextid = 154,
    roundoff = 30
    };
getRow(154)->
    #petWarCfg {
    id = 154,
    chapter = 16,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5266,5267,5268,5269,5270],
    monstericon = [432,432,432,432,432],
    monsterpower = 1126120,
    gift_1 = [1910,1905,62],
    dorpid = 10154,
    exp = 1640,
    money = 3925,
    nextid = 155,
    roundoff = 30
    };
getRow(155)->
    #petWarCfg {
    id = 155,
    chapter = 16,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5271,5272,5273,5274,5275],
    monstericon = [433,433,433,432,432],
    monsterpower = 1130061,
    gift_1 = [1904,1910,62],
    dorpid = 10155,
    exp = 1650,
    money = 3950,
    nextid = 156,
    roundoff = 30
    };
getRow(156)->
    #petWarCfg {
    id = 156,
    chapter = 16,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5276,5277,5278,5279,5280],
    monstericon = [432,432,432,432,432],
    monsterpower = 1134016,
    gift_1 = [1909,1905,62],
    dorpid = 10156,
    exp = 1660,
    money = 3975,
    nextid = 157,
    roundoff = 30
    };
getRow(157)->
    #petWarCfg {
    id = 157,
    chapter = 16,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5281,5282,5283,5284,5285],
    monstericon = [432,432,432,432,432],
    monsterpower = 1137985,
    gift_1 = [1909,1905,62],
    dorpid = 10157,
    exp = 1670,
    money = 4000,
    nextid = 158,
    roundoff = 30
    };
getRow(158)->
    #petWarCfg {
    id = 158,
    chapter = 16,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5286,5287,5288,5289,5290],
    monstericon = [432,432,432,432,432],
    monsterpower = 1141967,
    gift_1 = [1909,1905,62],
    dorpid = 10158,
    exp = 1680,
    money = 4025,
    nextid = 159,
    roundoff = 30
    };
getRow(159)->
    #petWarCfg {
    id = 159,
    chapter = 16,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5291,5292,5293,5294,5295],
    monstericon = [432,432,432,432,432],
    monsterpower = 1145963,
    gift_1 = [1909,1905,62],
    dorpid = 10159,
    exp = 1690,
    money = 4050,
    nextid = 160,
    roundoff = 30
    };
getRow(160)->
    #petWarCfg {
    id = 160,
    chapter = 16,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5296,5297,5298,5299,5300],
    monstericon = [434,433,433,432,432],
    monsterpower = 1149973,
    gift_1 = [1920,1909,62,11000,11010],
    dorpid = 10160,
    exp = 1700,
    money = 4075,
    nextid = 161,
    roundoff = 30
    };
getRow(161)->
    #petWarCfg {
    id = 161,
    chapter = 17,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5301,5302,5303,5304,5305],
    monstericon = [432,432,432,432,432],
    monsterpower = 1153997,
    gift_1 = [1904,1902,62],
    dorpid = 10161,
    exp = 1710,
    money = 4100,
    nextid = 162,
    roundoff = 30
    };
getRow(162)->
    #petWarCfg {
    id = 162,
    chapter = 17,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5306,5307,5308,5309,5310],
    monstericon = [432,432,432,432,432],
    monsterpower = 1158035,
    gift_1 = [1904,1902,62],
    dorpid = 10162,
    exp = 1720,
    money = 4125,
    nextid = 163,
    roundoff = 30
    };
getRow(163)->
    #petWarCfg {
    id = 163,
    chapter = 17,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5311,5312,5313,5314,5315],
    monstericon = [432,432,432,432,432],
    monsterpower = 1162088,
    gift_1 = [1904,1902,62],
    dorpid = 10163,
    exp = 1730,
    money = 4150,
    nextid = 164,
    roundoff = 30
    };
getRow(164)->
    #petWarCfg {
    id = 164,
    chapter = 17,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5316,5317,5318,5319,5320],
    monstericon = [432,432,432,432,432],
    monsterpower = 1166155,
    gift_1 = [1904,1902,62],
    dorpid = 10164,
    exp = 1740,
    money = 4175,
    nextid = 165,
    roundoff = 30
    };
getRow(165)->
    #petWarCfg {
    id = 165,
    chapter = 17,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5321,5322,5323,5324,5325],
    monstericon = [433,433,433,432,432],
    monsterpower = 1170236,
    gift_1 = [1909,1904,62],
    dorpid = 10165,
    exp = 1750,
    money = 4200,
    nextid = 166,
    roundoff = 30
    };
getRow(166)->
    #petWarCfg {
    id = 166,
    chapter = 17,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5326,5327,5328,5329,5330],
    monstericon = [432,432,432,432,432],
    monsterpower = 1174331,
    gift_1 = [1928,1918,62],
    dorpid = 10166,
    exp = 1760,
    money = 4225,
    nextid = 167,
    roundoff = 30
    };
getRow(167)->
    #petWarCfg {
    id = 167,
    chapter = 17,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5331,5332,5333,5334,5335],
    monstericon = [432,432,432,432,432],
    monsterpower = 1178441,
    gift_1 = [1928,1918,62],
    dorpid = 10167,
    exp = 1770,
    money = 4250,
    nextid = 168,
    roundoff = 30
    };
getRow(168)->
    #petWarCfg {
    id = 168,
    chapter = 17,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5336,5337,5338,5339,5340],
    monstericon = [432,432,432,432,432],
    monsterpower = 1182565,
    gift_1 = [1928,1918,62],
    dorpid = 10168,
    exp = 1780,
    money = 4275,
    nextid = 169,
    roundoff = 30
    };
getRow(169)->
    #petWarCfg {
    id = 169,
    chapter = 17,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5341,5342,5343,5344,5345],
    monstericon = [432,432,432,432,432],
    monsterpower = 1186703,
    gift_1 = [1928,1918,62],
    dorpid = 10169,
    exp = 1790,
    money = 4300,
    nextid = 170,
    roundoff = 30
    };
getRow(170)->
    #petWarCfg {
    id = 170,
    chapter = 17,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5346,5347,5348,5349,5350],
    monstericon = [434,433,433,432,432],
    monsterpower = 1190856,
    gift_1 = [1914,1928,62,11000,11010],
    dorpid = 10170,
    exp = 1800,
    money = 4325,
    nextid = 171,
    roundoff = 30
    };
getRow(171)->
    #petWarCfg {
    id = 171,
    chapter = 18,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5351,5352,5353,5354,5355],
    monstericon = [432,432,432,432,432],
    monsterpower = 1195023,
    gift_1 = [1908,1925,62],
    dorpid = 10171,
    exp = 1810,
    money = 4350,
    nextid = 172,
    roundoff = 30
    };
getRow(172)->
    #petWarCfg {
    id = 172,
    chapter = 18,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5356,5357,5358,5359,5360],
    monstericon = [432,432,432,432,432],
    monsterpower = 1199205,
    gift_1 = [1908,1925,62],
    dorpid = 10172,
    exp = 1820,
    money = 4375,
    nextid = 173,
    roundoff = 30
    };
getRow(173)->
    #petWarCfg {
    id = 173,
    chapter = 18,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5361,5362,5363,5364,5365],
    monstericon = [432,432,432,432,432],
    monsterpower = 1203402,
    gift_1 = [1908,1925,62],
    dorpid = 10173,
    exp = 1830,
    money = 4400,
    nextid = 174,
    roundoff = 30
    };
getRow(174)->
    #petWarCfg {
    id = 174,
    chapter = 18,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5366,5367,5368,5369,5370],
    monstericon = [432,432,432,432,432],
    monsterpower = 1207613,
    gift_1 = [1908,1925,62],
    dorpid = 10174,
    exp = 1840,
    money = 4425,
    nextid = 175,
    roundoff = 30
    };
getRow(175)->
    #petWarCfg {
    id = 175,
    chapter = 18,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5371,5372,5373,5374,5375],
    monstericon = [433,433,433,432,432],
    monsterpower = 1211839,
    gift_1 = [1910,1908,62],
    dorpid = 10175,
    exp = 1850,
    money = 4450,
    nextid = 176,
    roundoff = 30
    };
getRow(176)->
    #petWarCfg {
    id = 176,
    chapter = 18,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5376,5377,5378,5379,5380],
    monstericon = [432,432,432,432,432],
    monsterpower = 1216080,
    gift_1 = [1924,1925,62],
    dorpid = 10176,
    exp = 1860,
    money = 4475,
    nextid = 177,
    roundoff = 30
    };
getRow(177)->
    #petWarCfg {
    id = 177,
    chapter = 18,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5381,5382,5383,5384,5385],
    monstericon = [432,432,432,432,432],
    monsterpower = 1220336,
    gift_1 = [1924,1925,62],
    dorpid = 10177,
    exp = 1870,
    money = 4500,
    nextid = 178,
    roundoff = 30
    };
getRow(178)->
    #petWarCfg {
    id = 178,
    chapter = 18,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5386,5387,5388,5389,5390],
    monstericon = [432,432,432,432,432],
    monsterpower = 1224607,
    gift_1 = [1924,1925,62],
    dorpid = 10178,
    exp = 1880,
    money = 4525,
    nextid = 179,
    roundoff = 30
    };
getRow(179)->
    #petWarCfg {
    id = 179,
    chapter = 18,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5391,5392,5393,5394,5395],
    monstericon = [432,432,432,432,432],
    monsterpower = 1228893,
    gift_1 = [1924,1925,62],
    dorpid = 10179,
    exp = 1890,
    money = 4550,
    nextid = 180,
    roundoff = 30
    };
getRow(180)->
    #petWarCfg {
    id = 180,
    chapter = 18,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5396,5397,5398,5399,5400],
    monstericon = [434,433,433,432,432],
    monsterpower = 1233194,
    gift_1 = [1909,1924,62,11000,11010],
    dorpid = 10180,
    exp = 1900,
    money = 4575,
    nextid = 181,
    roundoff = 30
    };
getRow(181)->
    #petWarCfg {
    id = 181,
    chapter = 19,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5401,5402,5403,5404,5405],
    monstericon = [432,432,432,432,432],
    monsterpower = 1237510,
    gift_1 = [1911,1918,62],
    dorpid = 10181,
    exp = 1910,
    money = 4600,
    nextid = 182,
    roundoff = 30
    };
getRow(182)->
    #petWarCfg {
    id = 182,
    chapter = 19,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5406,5407,5408,5409,5410],
    monstericon = [432,432,432,432,432],
    monsterpower = 1241841,
    gift_1 = [1911,1918,62],
    dorpid = 10182,
    exp = 1920,
    money = 4625,
    nextid = 183,
    roundoff = 30
    };
getRow(183)->
    #petWarCfg {
    id = 183,
    chapter = 19,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5411,5412,5413,5414,5415],
    monstericon = [432,432,432,432,432],
    monsterpower = 1246187,
    gift_1 = [1911,1918,62],
    dorpid = 10183,
    exp = 1930,
    money = 4650,
    nextid = 184,
    roundoff = 30
    };
getRow(184)->
    #petWarCfg {
    id = 184,
    chapter = 19,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5416,5417,5418,5419,5420],
    monstericon = [432,432,432,432,432],
    monsterpower = 1250548,
    gift_1 = [1911,1918,62],
    dorpid = 10184,
    exp = 1940,
    money = 4675,
    nextid = 185,
    roundoff = 30
    };
getRow(185)->
    #petWarCfg {
    id = 185,
    chapter = 19,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5421,5422,5423,5424,5425],
    monstericon = [433,433,433,432,432],
    monsterpower = 1254924,
    gift_1 = [1906,1911,62],
    dorpid = 10185,
    exp = 1950,
    money = 4700,
    nextid = 186,
    roundoff = 30
    };
getRow(186)->
    #petWarCfg {
    id = 186,
    chapter = 19,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5426,5427,5428,5429,5430],
    monstericon = [432,432,432,432,432],
    monsterpower = 1259316,
    gift_1 = [1928,1918,62],
    dorpid = 10186,
    exp = 1960,
    money = 4725,
    nextid = 187,
    roundoff = 30
    };
getRow(187)->
    #petWarCfg {
    id = 187,
    chapter = 19,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5431,5432,5433,5434,5435],
    monstericon = [432,432,432,432,432],
    monsterpower = 1263723,
    gift_1 = [1928,1918,62],
    dorpid = 10187,
    exp = 1970,
    money = 4750,
    nextid = 188,
    roundoff = 30
    };
getRow(188)->
    #petWarCfg {
    id = 188,
    chapter = 19,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5436,5437,5438,5439,5440],
    monstericon = [432,432,432,432,432],
    monsterpower = 1268146,
    gift_1 = [1928,1918,62],
    dorpid = 10188,
    exp = 1980,
    money = 4775,
    nextid = 189,
    roundoff = 30
    };
getRow(189)->
    #petWarCfg {
    id = 189,
    chapter = 19,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5441,5442,5443,5444,5445],
    monstericon = [432,432,432,432,432],
    monsterpower = 1272584,
    gift_1 = [1928,1918,62],
    dorpid = 10189,
    exp = 1990,
    money = 4800,
    nextid = 190,
    roundoff = 30
    };
getRow(190)->
    #petWarCfg {
    id = 190,
    chapter = 19,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5446,5447,5448,5449,5450],
    monstericon = [434,433,433,433,432],
    monsterpower = 1277038,
    gift_1 = [1929,1928,62,11000,11010],
    dorpid = 10190,
    exp = 2000,
    money = 4825,
    nextid = 191,
    roundoff = 30
    };
getRow(191)->
    #petWarCfg {
    id = 191,
    chapter = 20,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5451,5452,5453,5454,5455],
    monstericon = [432,432,432,432,432],
    monsterpower = 1281507,
    gift_1 = [1919,1903,62],
    dorpid = 10191,
    exp = 2010,
    money = 4850,
    nextid = 192,
    roundoff = 30
    };
getRow(192)->
    #petWarCfg {
    id = 192,
    chapter = 20,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5456,5457,5458,5459,5460],
    monstericon = [432,432,432,432,432],
    monsterpower = 1285992,
    gift_1 = [1919,1903,62],
    dorpid = 10192,
    exp = 2020,
    money = 4875,
    nextid = 193,
    roundoff = 30
    };
getRow(193)->
    #petWarCfg {
    id = 193,
    chapter = 20,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5461,5462,5463,5464,5465],
    monstericon = [432,432,432,432,432],
    monsterpower = 1290492,
    gift_1 = [1919,1903,62],
    dorpid = 10193,
    exp = 2030,
    money = 4900,
    nextid = 194,
    roundoff = 30
    };
getRow(194)->
    #petWarCfg {
    id = 194,
    chapter = 20,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5466,5467,5468,5469,5470],
    monstericon = [432,432,432,432,432],
    monsterpower = 1295008,
    gift_1 = [1919,1903,62],
    dorpid = 10194,
    exp = 2040,
    money = 4925,
    nextid = 195,
    roundoff = 30
    };
getRow(195)->
    #petWarCfg {
    id = 195,
    chapter = 20,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5471,5472,5473,5474,5475],
    monstericon = [433,433,433,433,432],
    monsterpower = 1299540,
    gift_1 = [1904,1919,62],
    dorpid = 10195,
    exp = 2050,
    money = 4950,
    nextid = 196,
    roundoff = 30
    };
getRow(196)->
    #petWarCfg {
    id = 196,
    chapter = 20,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5476,5477,5478,5479,5480],
    monstericon = [432,432,432,432,432],
    monsterpower = 1304088,
    gift_1 = [1921,1903,62],
    dorpid = 10196,
    exp = 2060,
    money = 4975,
    nextid = 197,
    roundoff = 30
    };
getRow(197)->
    #petWarCfg {
    id = 197,
    chapter = 20,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5481,5482,5483,5484,5485],
    monstericon = [432,432,432,432,432],
    monsterpower = 1308652,
    gift_1 = [1921,1903,62],
    dorpid = 10197,
    exp = 2070,
    money = 5000,
    nextid = 198,
    roundoff = 30
    };
getRow(198)->
    #petWarCfg {
    id = 198,
    chapter = 20,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5486,5487,5488,5489,5490],
    monstericon = [432,432,432,432,432],
    monsterpower = 1313232,
    gift_1 = [1921,1903,62],
    dorpid = 10198,
    exp = 2080,
    money = 5025,
    nextid = 199,
    roundoff = 30
    };
getRow(199)->
    #petWarCfg {
    id = 199,
    chapter = 20,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5491,5492,5493,5494,5495],
    monstericon = [432,432,432,432,432],
    monsterpower = 1317828,
    gift_1 = [1921,1903,62],
    dorpid = 10199,
    exp = 2090,
    money = 5050,
    nextid = 200,
    roundoff = 30
    };
getRow(200)->
    #petWarCfg {
    id = 200,
    chapter = 20,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5496,5497,5498,5499,5500],
    monstericon = [434,433,433,433,433],
    monsterpower = 1322440,
    gift_1 = [1923,1921,62,11000,11010],
    dorpid = 10200,
    exp = 2100,
    money = 5075,
    nextid = 201,
    roundoff = 30
    };
getRow(201)->
    #petWarCfg {
    id = 201,
    chapter = 21,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5501,5502,5503,5504,5505],
    monstericon = [432,432,432,432,432],
    monsterpower = 1327068,
    gift_1 = [1910,1905,62],
    dorpid = 10201,
    exp = 2110,
    money = 5100,
    nextid = 202,
    roundoff = 30
    };
getRow(202)->
    #petWarCfg {
    id = 202,
    chapter = 21,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5506,5507,5508,5509,5510],
    monstericon = [432,432,432,432,432],
    monsterpower = 1331712,
    gift_1 = [1910,1905,62],
    dorpid = 10202,
    exp = 2120,
    money = 5125,
    nextid = 203,
    roundoff = 30
    };
getRow(203)->
    #petWarCfg {
    id = 203,
    chapter = 21,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5511,5512,5513,5514,5515],
    monstericon = [432,432,432,432,432],
    monsterpower = 1336372,
    gift_1 = [1910,1905,62],
    dorpid = 10203,
    exp = 2130,
    money = 5150,
    nextid = 204,
    roundoff = 30
    };
getRow(204)->
    #petWarCfg {
    id = 204,
    chapter = 21,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5516,5517,5518,5519,5520],
    monstericon = [432,432,432,432,432],
    monsterpower = 1341049,
    gift_1 = [1910,1905,62],
    dorpid = 10204,
    exp = 2140,
    money = 5175,
    nextid = 205,
    roundoff = 30
    };
getRow(205)->
    #petWarCfg {
    id = 205,
    chapter = 21,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5521,5522,5523,5524,5525],
    monstericon = [433,433,432,432,432],
    monsterpower = 1345742,
    gift_1 = [1904,1910,62],
    dorpid = 10205,
    exp = 2150,
    money = 5200,
    nextid = 206,
    roundoff = 30
    };
getRow(206)->
    #petWarCfg {
    id = 206,
    chapter = 21,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5526,5527,5528,5529,5530],
    monstericon = [432,432,432,432,432],
    monsterpower = 1350452,
    gift_1 = [1909,1905,62],
    dorpid = 10206,
    exp = 2160,
    money = 5225,
    nextid = 207,
    roundoff = 30
    };
getRow(207)->
    #petWarCfg {
    id = 207,
    chapter = 21,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5531,5532,5533,5534,5535],
    monstericon = [432,432,432,432,432],
    monsterpower = 1355178,
    gift_1 = [1909,1905,62],
    dorpid = 10207,
    exp = 2170,
    money = 5250,
    nextid = 208,
    roundoff = 30
    };
getRow(208)->
    #petWarCfg {
    id = 208,
    chapter = 21,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5536,5537,5538,5539,5540],
    monstericon = [432,432,432,432,432],
    monsterpower = 1359921,
    gift_1 = [1909,1905,62],
    dorpid = 10208,
    exp = 2180,
    money = 5275,
    nextid = 209,
    roundoff = 30
    };
getRow(209)->
    #petWarCfg {
    id = 209,
    chapter = 21,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5541,5542,5543,5544,5545],
    monstericon = [432,432,432,432,432],
    monsterpower = 1364680,
    gift_1 = [1909,1905,62],
    dorpid = 10209,
    exp = 2190,
    money = 5300,
    nextid = 210,
    roundoff = 30
    };
getRow(210)->
    #petWarCfg {
    id = 210,
    chapter = 21,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5546,5547,5548,5549,5550],
    monstericon = [434,433,432,432,432],
    monsterpower = 1369456,
    gift_1 = [1920,1909,62,11000,11010],
    dorpid = 10210,
    exp = 2200,
    money = 5325,
    nextid = 211,
    roundoff = 30
    };
getRow(211)->
    #petWarCfg {
    id = 211,
    chapter = 22,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5551,5552,5553,5554,5555],
    monstericon = [432,432,432,432,432],
    monsterpower = 1374249,
    gift_1 = [1904,1902,62],
    dorpid = 10211,
    exp = 2210,
    money = 5350,
    nextid = 212,
    roundoff = 30
    };
getRow(212)->
    #petWarCfg {
    id = 212,
    chapter = 22,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5556,5557,5558,5559,5560],
    monstericon = [432,432,432,432,432],
    monsterpower = 1379058,
    gift_1 = [1904,1902,62],
    dorpid = 10212,
    exp = 2220,
    money = 5375,
    nextid = 213,
    roundoff = 30
    };
getRow(213)->
    #petWarCfg {
    id = 213,
    chapter = 22,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5561,5562,5563,5564,5565],
    monstericon = [432,432,432,432,432],
    monsterpower = 1383884,
    gift_1 = [1904,1902,62],
    dorpid = 10213,
    exp = 2230,
    money = 5400,
    nextid = 214,
    roundoff = 30
    };
getRow(214)->
    #petWarCfg {
    id = 214,
    chapter = 22,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5566,5567,5568,5569,5570],
    monstericon = [432,432,432,432,432],
    monsterpower = 1388727,
    gift_1 = [1904,1902,62],
    dorpid = 10214,
    exp = 2240,
    money = 5425,
    nextid = 215,
    roundoff = 30
    };
getRow(215)->
    #petWarCfg {
    id = 215,
    chapter = 22,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5571,5572,5573,5574,5575],
    monstericon = [433,433,432,432,432],
    monsterpower = 1393587,
    gift_1 = [1909,1904,62],
    dorpid = 10215,
    exp = 2250,
    money = 5450,
    nextid = 216,
    roundoff = 30
    };
getRow(216)->
    #petWarCfg {
    id = 216,
    chapter = 22,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5576,5577,5578,5579,5580],
    monstericon = [432,432,432,432,432],
    monsterpower = 1398464,
    gift_1 = [1928,1918,62],
    dorpid = 10216,
    exp = 2260,
    money = 5475,
    nextid = 217,
    roundoff = 30
    };
getRow(217)->
    #petWarCfg {
    id = 217,
    chapter = 22,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5581,5582,5583,5584,5585],
    monstericon = [432,432,432,432,432],
    monsterpower = 1403358,
    gift_1 = [1928,1918,62],
    dorpid = 10217,
    exp = 2270,
    money = 5500,
    nextid = 218,
    roundoff = 30
    };
getRow(218)->
    #petWarCfg {
    id = 218,
    chapter = 22,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5586,5587,5588,5589,5590],
    monstericon = [432,432,432,432,432],
    monsterpower = 1408269,
    gift_1 = [1928,1918,62],
    dorpid = 10218,
    exp = 2280,
    money = 5525,
    nextid = 219,
    roundoff = 30
    };
getRow(219)->
    #petWarCfg {
    id = 219,
    chapter = 22,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5591,5592,5593,5594,5595],
    monstericon = [432,432,432,432,432],
    monsterpower = 1413197,
    gift_1 = [1928,1918,62],
    dorpid = 10219,
    exp = 2290,
    money = 5550,
    nextid = 220,
    roundoff = 30
    };
getRow(220)->
    #petWarCfg {
    id = 220,
    chapter = 22,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5596,5597,5598,5599,5600],
    monstericon = [434,433,432,432,432],
    monsterpower = 1418143,
    gift_1 = [1914,1928,62,11000,11010],
    dorpid = 10220,
    exp = 2300,
    money = 5575,
    nextid = 221,
    roundoff = 30
    };
getRow(221)->
    #petWarCfg {
    id = 221,
    chapter = 23,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5601,5602,5603,5604,5605],
    monstericon = [432,432,432,432,432],
    monsterpower = 1423106,
    gift_1 = [1908,1925,62],
    dorpid = 10221,
    exp = 2310,
    money = 5600,
    nextid = 222,
    roundoff = 30
    };
getRow(222)->
    #petWarCfg {
    id = 222,
    chapter = 23,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5606,5607,5608,5609,5610],
    monstericon = [432,432,432,432,432],
    monsterpower = 1428086,
    gift_1 = [1908,1925,62],
    dorpid = 10222,
    exp = 2320,
    money = 5625,
    nextid = 223,
    roundoff = 30
    };
getRow(223)->
    #petWarCfg {
    id = 223,
    chapter = 23,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5611,5612,5613,5614,5615],
    monstericon = [432,432,432,432,432],
    monsterpower = 1433084,
    gift_1 = [1908,1925,62],
    dorpid = 10223,
    exp = 2330,
    money = 5650,
    nextid = 224,
    roundoff = 30
    };
getRow(224)->
    #petWarCfg {
    id = 224,
    chapter = 23,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5616,5617,5618,5619,5620],
    monstericon = [432,432,432,432,432],
    monsterpower = 1438099,
    gift_1 = [1908,1925,62],
    dorpid = 10224,
    exp = 2340,
    money = 5675,
    nextid = 225,
    roundoff = 30
    };
getRow(225)->
    #petWarCfg {
    id = 225,
    chapter = 23,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5621,5622,5623,5624,5625],
    monstericon = [433,433,432,432,432],
    monsterpower = 1443132,
    gift_1 = [1910,1908,62],
    dorpid = 10225,
    exp = 2350,
    money = 5700,
    nextid = 226,
    roundoff = 30
    };
getRow(226)->
    #petWarCfg {
    id = 226,
    chapter = 23,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5626,5627,5628,5629,5630],
    monstericon = [432,432,432,432,432],
    monsterpower = 1448182,
    gift_1 = [1924,1925,62],
    dorpid = 10226,
    exp = 2360,
    money = 5725,
    nextid = 227,
    roundoff = 30
    };
getRow(227)->
    #petWarCfg {
    id = 227,
    chapter = 23,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5631,5632,5633,5634,5635],
    monstericon = [432,432,432,432,432],
    monsterpower = 1453250,
    gift_1 = [1924,1925,62],
    dorpid = 10227,
    exp = 2370,
    money = 5750,
    nextid = 228,
    roundoff = 30
    };
getRow(228)->
    #petWarCfg {
    id = 228,
    chapter = 23,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5636,5637,5638,5639,5640],
    monstericon = [432,432,432,432,432],
    monsterpower = 1458336,
    gift_1 = [1924,1925,62],
    dorpid = 10228,
    exp = 2380,
    money = 5775,
    nextid = 229,
    roundoff = 30
    };
getRow(229)->
    #petWarCfg {
    id = 229,
    chapter = 23,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5641,5642,5643,5644,5645],
    monstericon = [432,432,432,432,432],
    monsterpower = 1463440,
    gift_1 = [1924,1925,62],
    dorpid = 10229,
    exp = 2390,
    money = 5800,
    nextid = 230,
    roundoff = 30
    };
getRow(230)->
    #petWarCfg {
    id = 230,
    chapter = 23,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5646,5647,5648,5649,5650],
    monstericon = [434,433,432,432,432],
    monsterpower = 1468562,
    gift_1 = [1909,1924,62,11000,11010],
    dorpid = 10230,
    exp = 2400,
    money = 5825,
    nextid = 231,
    roundoff = 30
    };
getRow(231)->
    #petWarCfg {
    id = 231,
    chapter = 24,
    chapterName = "花湖",
    point = 1,
    cost = 6,
    monster = [5651,5652,5653,5654,5655],
    monstericon = [432,432,432,432,432],
    monsterpower = 1473701,
    gift_1 = [1911,1918,62],
    dorpid = 10231,
    exp = 2410,
    money = 5850,
    nextid = 232,
    roundoff = 30
    };
getRow(232)->
    #petWarCfg {
    id = 232,
    chapter = 24,
    chapterName = "花湖",
    point = 2,
    cost = 6,
    monster = [5656,5657,5658,5659,5660],
    monstericon = [432,432,432,432,432],
    monsterpower = 1478858,
    gift_1 = [1911,1918,62],
    dorpid = 10232,
    exp = 2420,
    money = 5875,
    nextid = 233,
    roundoff = 30
    };
getRow(233)->
    #petWarCfg {
    id = 233,
    chapter = 24,
    chapterName = "花湖",
    point = 3,
    cost = 6,
    monster = [5661,5662,5663,5664,5665],
    monstericon = [432,432,432,432,432],
    monsterpower = 1484034,
    gift_1 = [1911,1918,62],
    dorpid = 10233,
    exp = 2430,
    money = 5900,
    nextid = 234,
    roundoff = 30
    };
getRow(234)->
    #petWarCfg {
    id = 234,
    chapter = 24,
    chapterName = "花湖",
    point = 4,
    cost = 6,
    monster = [5666,5667,5668,5669,5670],
    monstericon = [432,432,432,432,432],
    monsterpower = 1489228,
    gift_1 = [1911,1918,62],
    dorpid = 10234,
    exp = 2440,
    money = 5925,
    nextid = 235,
    roundoff = 30
    };
getRow(235)->
    #petWarCfg {
    id = 235,
    chapter = 24,
    chapterName = "花湖",
    point = 5,
    cost = 6,
    monster = [5671,5672,5673,5674,5675],
    monstericon = [433,433,433,432,432],
    monsterpower = 1494440,
    gift_1 = [1906,1911,62],
    dorpid = 10235,
    exp = 2450,
    money = 5950,
    nextid = 236,
    roundoff = 30
    };
getRow(236)->
    #petWarCfg {
    id = 236,
    chapter = 24,
    chapterName = "花湖",
    point = 6,
    cost = 6,
    monster = [5676,5677,5678,5679,5680],
    monstericon = [432,432,432,432,432],
    monsterpower = 1499670,
    gift_1 = [1928,1918,62],
    dorpid = 10236,
    exp = 2460,
    money = 5975,
    nextid = 237,
    roundoff = 30
    };
getRow(237)->
    #petWarCfg {
    id = 237,
    chapter = 24,
    chapterName = "花湖",
    point = 7,
    cost = 6,
    monster = [5681,5682,5683,5684,5685],
    monstericon = [432,432,432,432,432],
    monsterpower = 1504918,
    gift_1 = [1928,1918,62],
    dorpid = 10237,
    exp = 2470,
    money = 6000,
    nextid = 238,
    roundoff = 30
    };
getRow(238)->
    #petWarCfg {
    id = 238,
    chapter = 24,
    chapterName = "花湖",
    point = 8,
    cost = 6,
    monster = [5686,5687,5688,5689,5690],
    monstericon = [432,432,432,432,432],
    monsterpower = 1510185,
    gift_1 = [1928,1918,62],
    dorpid = 10238,
    exp = 2480,
    money = 6025,
    nextid = 239,
    roundoff = 30
    };
getRow(239)->
    #petWarCfg {
    id = 239,
    chapter = 24,
    chapterName = "花湖",
    point = 9,
    cost = 6,
    monster = [5691,5692,5693,5694,5695],
    monstericon = [432,432,432,432,432],
    monsterpower = 1515470,
    gift_1 = [1928,1918,62],
    dorpid = 10239,
    exp = 2490,
    money = 6050,
    nextid = 240,
    roundoff = 30
    };
getRow(240)->
    #petWarCfg {
    id = 240,
    chapter = 24,
    chapterName = "花湖",
    point = 10,
    cost = 6,
    monster = [5696,5697,5698,5699,5700],
    monstericon = [434,433,433,432,432],
    monsterpower = 1520774,
    gift_1 = [1926,1929,62,11000,11010],
    dorpid = 10240,
    exp = 2500,
    money = 6075,
    nextid = 0,
    roundoff = 30
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30},
    {31},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {53},
    {54},
    {55},
    {56},
    {57},
    {58},
    {59},
    {60},
    {61},
    {62},
    {63},
    {64},
    {65},
    {66},
    {67},
    {68},
    {69},
    {70},
    {71},
    {72},
    {73},
    {74},
    {75},
    {76},
    {77},
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
    {91},
    {92},
    {93},
    {94},
    {95},
    {96},
    {97},
    {98},
    {99},
    {100},
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123},
    {124},
    {125},
    {126},
    {127},
    {128},
    {129},
    {130},
    {131},
    {132},
    {133},
    {134},
    {135},
    {136},
    {137},
    {138},
    {139},
    {140},
    {141},
    {142},
    {143},
    {144},
    {145},
    {146},
    {147},
    {148},
    {149},
    {150},
    {151},
    {152},
    {153},
    {154},
    {155},
    {156},
    {157},
    {158},
    {159},
    {160},
    {161},
    {162},
    {163},
    {164},
    {165},
    {166},
    {167},
    {168},
    {169},
    {170},
    {171},
    {172},
    {173},
    {174},
    {175},
    {176},
    {177},
    {178},
    {179},
    {180},
    {181},
    {182},
    {183},
    {184},
    {185},
    {186},
    {187},
    {188},
    {189},
    {190},
    {191},
    {192},
    {193},
    {194},
    {195},
    {196},
    {197},
    {198},
    {199},
    {200},
    {201},
    {202},
    {203},
    {204},
    {205},
    {206},
    {207},
    {208},
    {209},
    {210},
    {211},
    {212},
    {213},
    {214},
    {215},
    {216},
    {217},
    {218},
    {219},
    {220},
    {221},
    {222},
    {223},
    {224},
    {225},
    {226},
    {227},
    {228},
    {229},
    {230},
    {231},
    {232},
    {233},
    {234},
    {235},
    {236},
    {237},
    {238},
    {239},
    {240}
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
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    220,
    221,
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240
    ].

