%%: 声明
-ifndef(cfg_question).
-define(cfg_question, 1).

-record(questionCfg, {
        id,

        %%: admin:
        %%: 1.游戏相关问题
        %%: 2.大百科问题
        type,

        question,

        %%: admin:
        %%: answer1为正确答案
        answer1,

        answer2,

        answer3,

        answer4

 }).

-endif.