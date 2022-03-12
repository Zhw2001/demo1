create table if not exists graduationdb.cdesign
(
    sTime    varchar(255) null,
    cId      varchar(255) null,
    cNum     varchar(255) null,
    sId      varchar(255) null,
    sName    varchar(255) null,
    sClass   varchar(255) null,
    sState   varchar(255) null,
    `select` varchar(255) null,
    begin    varchar(255) null,
    medium   varchar(255) null,
    progarm  varchar(255) null,
    answer   varchar(255) null,
    report   varchar(255) null,
    overall  varchar(255) null
)
    charset = utf8;

create table if not exists graduationdb.course
(
    sTime   varchar(255)  null,
    cId     varchar(255)  null,
    cNum    varchar(255)  null,
    sId     float(255, 0) null,
    sName   varchar(255)  null,
    sClass  varchar(255)  null,
    sState  varchar(255)  null,
    regular varchar(255)  null,
    written varchar(255)  null,
    overall varchar(255)  null
)
    charset = utf8;

create table if not exists graduationdb.courseinformation
(
    cNum          varchar(255) not null,
    department    varchar(255) null,
    cId           varchar(255) null,
    cName         varchar(255) null,
    cTarget       varchar(255) null,
    `优秀（>=90)`    varchar(255) null,
    `良好(<90,>80)` varchar(255) null,
    `中等(<80,>70)` varchar(255) null,
    `及格(<70,>60)` varchar(255) null,
    `不及格(<60)`    varchar(255) null,
    primary key (cNum)
)
    charset = utf8;

create table if not exists graduationdb.experiment
(
    sTime   varchar(255) null,
    cId     varchar(255) null,
    cNum    varchar(255) null,
    sId     varchar(255) null,
    sName   varchar(255) null,
    sClass  varchar(255) null,
    sState  varchar(255) null,
    p1      varchar(255) null,
    r1      varchar(255) null,
    p2      varchar(255) null,
    r2      varchar(255) null,
    p3      varchar(255) null,
    r3      varchar(255) null,
    p4      varchar(255) null,
    r4      varchar(255) null,
    p5      varchar(255) null,
    r5      varchar(255) null,
    p6      varchar(255) null,
    r6      varchar(255) null,
    p7      varchar(255) null,
    r7      varchar(255) null,
    p8      varchar(255) null,
    t8      varchar(255) null,
    regular varchar(255) null,
    written varchar(255) null,
    overall varchar(255) null
)
    charset = utf8;

create table if not exists graduationdb.gdesign
(
    sTime    varchar(255) null,
    cId      varchar(255) null,
    cNum     varchar(255) null,
    sId      varchar(255) null,
    sName    varchar(255) null,
    grade1_1 varchar(255) null,
    grade1_2 varchar(255) null,
    grade1_3 varchar(255) null,
    grade1_4 varchar(255) null,
    grade1_5 varchar(255) null,
    grade1_6 varchar(255) null,
    grade2_1 varchar(255) null,
    grade2_2 varchar(255) null,
    grade2_3 varchar(255) null,
    grade2_4 varchar(255) null,
    grade3_1 varchar(255) null,
    grade3_2 varchar(255) null,
    grade3_3 varchar(255) null,
    overall  varchar(255) null
)
    charset = utf8;


