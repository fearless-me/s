#配置选项，可以是DEBUG和RELEASE
#后面会添加HIPE相关的编译配置
#																					by:钟元伟

CONFIG ?= RELEASE

Region ?= chs

#源文件目录
SOURCE_DIR = ./src

#文件包含目录
INCLUDE_DIR = -I ./include
INCLUDE_DIR += -I ./include/common
INCLUDE_DIR += -I ./src/config
INCLUDE_DIR += -I ./src/netmsg
INCLUDE_DIR += -I ./src/database/emysql/include
INCLUDE_DIR += -I ./src/language/
INCLUDE_DIR += -I ./src/client/
INCLUDE_DIR += -I ./src/db/
INCLUDE_DIR += -I ./src/logDB/
INCLUDE_DIR += -I ./src/dbServer/
INCLUDE_DIR += -I ./src/loginQueue/

#需要额外定义的宏
EXT_MICROS := -D'GAME_SERVER'

#输出目录
EBIN_DIR := ebin

#以下内容请不要随意修改
ifeq ($(CONFIG),DEBUG)
	FLAGS := +debug_info
else
	FLAGS := -D'RELEASE'
endif

FLAGS += ${EXT_MICROS}
FLAGS += -DRegion="$(Region)"

define walk
$(wildcard $(1)/*.erl) $(foreach e, $(wildcard $(1)/*), $(call walk, $(e)))
endef

AllFiles = $(call walk, $(SOURCE_DIR))

AllCfgFiles = $(call walk, $(SOURCE_DIR)/config)

SpecRegionCfgFiles = $(call walk, $(SOURCE_DIR)/config/$(Region))

NoCfgFiles = $(filter-out $(AllCfgFiles),$(AllFiles))

NeedAllFiles = $(NoCfgFiles)
NeedAllFiles += $(SpecRegionCfgFiles)

OBJS = $(patsubst %.erl,%.beam,$(NeedAllFiles))

ERLC = erlc -W $(FLAGS) -o ${EBIN_DIR} $(INCLUDE_DIR)

all: dir compile

clean:
	rm -rf $(EBIN_DIR)

dir:
	mkdir -p $(EBIN_DIR)

compile:${OBJS}

%.beam:%.erl
	${ERLC} $<

