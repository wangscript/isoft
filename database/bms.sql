prompt PL/SQL Developer import file
prompt Created on 2014年7月3日 by wzq
set feedback off
set define off
prompt Dropping BMS_AUTHORITY...
drop table BMS_AUTHORITY cascade constraints;
prompt Dropping BMS_DOMAIN...
drop table BMS_DOMAIN cascade constraints;
prompt Dropping BMS_DOMAIN_VALUE...
drop table BMS_DOMAIN_VALUE cascade constraints;
prompt Dropping BMS_GROUP...
drop table BMS_GROUP cascade constraints;
prompt Dropping BMS_GROUP_AUTHORITY...
drop table BMS_GROUP_AUTHORITY cascade constraints;
prompt Dropping BMS_GROUP_MEMBER...
drop table BMS_GROUP_MEMBER cascade constraints;
prompt Dropping BMS_RSC_MENU...
drop table BMS_RSC_MENU cascade constraints;
prompt Dropping BMS_MENU_BROWSER...
drop table BMS_MENU_BROWSER cascade constraints;
prompt Dropping BMS_ORG...
drop table BMS_ORG cascade constraints;
prompt Dropping BMS_PERSISTENT_LOGINS...
drop table BMS_PERSISTENT_LOGINS cascade constraints;
prompt Dropping BMS_USER...
drop table BMS_USER cascade constraints;
prompt Dropping DEMO_CLUB_CHANNEL...
drop table DEMO_CLUB_CHANNEL cascade constraints;
prompt Dropping DEMO_CLUB_MEMBER...
drop table DEMO_CLUB_MEMBER cascade constraints;
prompt Creating BMS_AUTHORITY...
create table BMS_AUTHORITY
(
  AUTHORITY VARCHAR2(30)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 100M
    minextents 1
    maxextents unlimited
  );

prompt Creating BMS_DOMAIN...
create table BMS_DOMAIN
(
  NAME      VARCHAR2(32 CHAR) not null,
  CANMODIFY VARCHAR2(1 CHAR),
  REMARK    VARCHAR2(500 CHAR)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table BMS_DOMAIN
  is '域';
comment on column BMS_DOMAIN.CANMODIFY
  is '可修改';
comment on column BMS_DOMAIN.REMARK
  is '描述';
alter table BMS_DOMAIN
  add primary key (NAME)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating BMS_DOMAIN_VALUE...
create table BMS_DOMAIN_VALUE
(
  ID          VARCHAR2(32 CHAR) not null,
  SORT        NUMBER(19),
  LABEL       VARCHAR2(60 CHAR),
  DOMAINNAME  VARCHAR2(32 CHAR),
  VALUE       VARCHAR2(60 CHAR),
  DOMAINLEVEL VARCHAR2(60 CHAR)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table BMS_DOMAIN_VALUE
  is '域值';
comment on column BMS_DOMAIN_VALUE.SORT
  is '显示次序';
comment on column BMS_DOMAIN_VALUE.LABEL
  is '键';
comment on column BMS_DOMAIN_VALUE.DOMAINNAME
  is '域编号';
comment on column BMS_DOMAIN_VALUE.VALUE
  is '值';
comment on column BMS_DOMAIN_VALUE.DOMAINLEVEL
  is '级别';
alter table BMS_DOMAIN_VALUE
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BMS_DOMAIN_VALUE
  add constraint FKD1752EB66F9E0527 foreign key (DOMAINNAME)
  references BMS_DOMAIN (NAME);

prompt Creating BMS_GROUP...
create table BMS_GROUP
(
  ID         NUMBER not null,
  GROUP_NAME VARCHAR2(60 CHAR)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table BMS_GROUP
  is '角色';
comment on column BMS_GROUP.GROUP_NAME
  is '名称';
alter table BMS_GROUP
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating BMS_GROUP_AUTHORITY...
create table BMS_GROUP_AUTHORITY
(
  GROUP_ID  VARCHAR2(50),
  AUTHORITY VARCHAR2(30)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 100M
    minextents 1
    maxextents unlimited
  );

prompt Creating BMS_GROUP_MEMBER...
create table BMS_GROUP_MEMBER
(
  USER_ID  VARCHAR2(50),
  GROUP_ID VARCHAR2(50)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 100M
    minextents 1
    maxextents unlimited
  );

prompt Creating BMS_RSC_MENU...
create table BMS_RSC_MENU
(
  ID               VARCHAR2(32 CHAR) not null,
  TEXT             VARCHAR2(60 CHAR) not null,
  PARENTID         VARCHAR2(32 CHAR),
  REMARK           VARCHAR2(1000 CHAR),
  URL              VARCHAR2(1000 CHAR),
  ICON             VARCHAR2(100 CHAR),
  TYPE             CHAR(1) default 1 not null,
  MENULEAF         CHAR(1) default 0,
  ADAPTCLASS       VARCHAR2(100 CHAR),
  SORTID           NUMBER(19),
  OUTERADDR        VARCHAR2(100 CHAR),
  HTTPMETHOD       VARCHAR2(100 CHAR),
  LEAF             NUMBER(1),
  TARGET_CONTAINER VARCHAR2(50),
  NAME             VARCHAR2(60 CHAR)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table BMS_RSC_MENU
  is '菜单';
comment on column BMS_RSC_MENU.ID
  is 'ID ';
comment on column BMS_RSC_MENU.TEXT
  is '名称';
comment on column BMS_RSC_MENU.PARENTID
  is '父节点名称';
comment on column BMS_RSC_MENU.REMARK
  is '描述';
comment on column BMS_RSC_MENU.URL
  is '描述';
comment on column BMS_RSC_MENU.ICON
  is '显示图标';
comment on column BMS_RSC_MENU.TYPE
  is '类型（1：菜单；2：功能；3：资源）';
comment on column BMS_RSC_MENU.MENULEAF
  is '是否末级菜单（0：否；1：是）';
comment on column BMS_RSC_MENU.ADAPTCLASS
  is '适配器类';
comment on column BMS_RSC_MENU.SORTID
  is '排序自动';
comment on column BMS_RSC_MENU.OUTERADDR
  is '是否系统整合地址';
comment on column BMS_RSC_MENU.HTTPMETHOD
  is 'HTTP提交方式';
comment on column BMS_RSC_MENU.LEAF
  is '是否叶子节点（0：否；1：是）';
comment on column BMS_RSC_MENU.TARGET_CONTAINER
  is '跳转目标：iframe,div';
comment on column BMS_RSC_MENU.NAME
  is '名称';
alter table BMS_RSC_MENU
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating BMS_MENU_BROWSER...
create table BMS_MENU_BROWSER
(
  MENU_ID VARCHAR2(50),
  SORT    NUMBER(10)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 100M
    minextents 1
    maxextents unlimited
  );
alter table BMS_MENU_BROWSER
  add constraint FKC7A88D9FB7649581 foreign key (MENU_ID)
  references BMS_RSC_MENU (ID);

prompt Creating BMS_ORG...
create table BMS_ORG
(
  ID       VARCHAR2(50 CHAR) not null,
  NAME     VARCHAR2(60 CHAR),
  PARENTID VARCHAR2(50 CHAR),
  REMARK   VARCHAR2(1000 CHAR),
  ICON     VARCHAR2(200)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table BMS_ORG
  is '组织机构';
comment on column BMS_ORG.NAME
  is '名称';
comment on column BMS_ORG.PARENTID
  is '父节点名称';
comment on column BMS_ORG.REMARK
  is '描述';
comment on column BMS_ORG.ICON
  is '显示图标';
alter table BMS_ORG
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating BMS_PERSISTENT_LOGINS...
create table BMS_PERSISTENT_LOGINS
(
  USERNAME  VARCHAR2(64) not null,
  SERIES    VARCHAR2(64) not null,
  TOKEN     VARCHAR2(64) not null,
  LAST_USED TIMESTAMP(6) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 100M
    minextents 1
    maxextents unlimited
  );
alter table BMS_PERSISTENT_LOGINS
  add primary key (SERIES)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 100M
    minextents 1
    maxextents unlimited
  );

prompt Creating BMS_USER...
create table BMS_USER
(
  ID          VARCHAR2(32 CHAR) not null,
  SEX         CHAR(1),
  REAL_NAME   VARCHAR2(20 CHAR),
  MOBILE      VARCHAR2(50 CHAR),
  EMAIL       VARCHAR2(100 CHAR),
  FAX         VARCHAR2(50 CHAR),
  PHONE       VARCHAR2(50 CHAR),
  ADDRESS     VARCHAR2(200 CHAR),
  ENABLED     CHAR(1) default 1 not null,
  REMARK      VARCHAR2(200 CHAR),
  PASSWORD    VARCHAR2(50 CHAR),
  ORGID       VARCHAR2(32 CHAR),
  USERNAME    VARCHAR2(50 CHAR),
  REGIST_DATE DATE,
  SALT        VARCHAR2(25)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table BMS_USER
  is '用户';
comment on column BMS_USER.SEX
  is '性别 :1男，0女';
comment on column BMS_USER.REAL_NAME
  is '真实姓名';
comment on column BMS_USER.ENABLED
  is '状态：1正常，0停用';
comment on column BMS_USER.PASSWORD
  is '密码';
comment on column BMS_USER.ORGID
  is '组织机构编号';
comment on column BMS_USER.USERNAME
  is '用户名';
comment on column BMS_USER.REGIST_DATE
  is '注册时间';
alter table BMS_USER
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BMS_USER
  add constraint FK44523C42968E1D82 foreign key (ORGID)
  references BMS_ORG (ID);

prompt Creating DEMO_CLUB_CHANNEL...
create table DEMO_CLUB_CHANNEL
(
  ID              VARCHAR2(50 CHAR) not null,
  SCODE           VARCHAR2(20 CHAR),
  SPHONE          VARCHAR2(20 CHAR),
  SCONTEN         VARCHAR2(400 CHAR),
  SADDR           VARCHAR2(100 CHAR),
  SCOMPLAINTPHONE VARCHAR2(20 CHAR),
  SNAME           VARCHAR2(100 CHAR),
  SCITYID         VARCHAR2(20 CHAR),
  SCITYNAME       VARCHAR2(20 CHAR),
  STYPE           VARCHAR2(10 CHAR),
  STYPENAME       VARCHAR2(50 CHAR)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table DEMO_CLUB_CHANNEL
  is 'demo_club_channel';
comment on column DEMO_CLUB_CHANNEL.SCODE
  is 'scode';
comment on column DEMO_CLUB_CHANNEL.SPHONE
  is 'sphone';
comment on column DEMO_CLUB_CHANNEL.SCONTEN
  is 'sconten';
comment on column DEMO_CLUB_CHANNEL.SADDR
  is 'saddr';
comment on column DEMO_CLUB_CHANNEL.SCOMPLAINTPHONE
  is 'scomplaintphone';
comment on column DEMO_CLUB_CHANNEL.SNAME
  is 'sname';
comment on column DEMO_CLUB_CHANNEL.SCITYID
  is 'scityid';
comment on column DEMO_CLUB_CHANNEL.SCITYNAME
  is 'scityname';
comment on column DEMO_CLUB_CHANNEL.STYPE
  is 'stype';
comment on column DEMO_CLUB_CHANNEL.STYPENAME
  is 'stypename';
alter table DEMO_CLUB_CHANNEL
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating DEMO_CLUB_MEMBER...
create table DEMO_CLUB_MEMBER
(
  ID               VARCHAR2(50 CHAR) not null,
  SCODE            VARCHAR2(20 CHAR),
  P2               VARCHAR2(100 CHAR),
  SPASS            VARCHAR2(10 CHAR),
  P1               VARCHAR2(20 CHAR),
  SNAME            VARCHAR2(20 CHAR),
  CREATE_TIME      TIMESTAMP(6),
  IS_LOCKED        NUMBER(10),
  CLUB_CHANNEL_ID  VARCHAR2(255 CHAR),
  CLUBCHANNELDTO   RAW(255),
  CLUBCHANNELDTOID VARCHAR2(255 CHAR)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table DEMO_CLUB_MEMBER
  is 'demo_club_member';
comment on column DEMO_CLUB_MEMBER.SCODE
  is 'scode';
comment on column DEMO_CLUB_MEMBER.P2
  is 'p2';
comment on column DEMO_CLUB_MEMBER.SPASS
  is 'spass';
comment on column DEMO_CLUB_MEMBER.P1
  is 'p1';
comment on column DEMO_CLUB_MEMBER.SNAME
  is 'sname';
comment on column DEMO_CLUB_MEMBER.CREATE_TIME
  is '创建时间';
comment on column DEMO_CLUB_MEMBER.IS_LOCKED
  is '是否加锁?1，加锁；0，不加锁';
comment on column DEMO_CLUB_MEMBER.CLUB_CHANNEL_ID
  is '所属绿色通道Id';
alter table DEMO_CLUB_MEMBER
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DEMO_CLUB_MEMBER
  add constraint FK7A649AF81670E21C foreign key (CLUB_CHANNEL_ID)
  references DEMO_CLUB_CHANNEL (ID);

prompt Disabling triggers for BMS_AUTHORITY...
alter table BMS_AUTHORITY disable all triggers;
prompt Disabling triggers for BMS_DOMAIN...
alter table BMS_DOMAIN disable all triggers;
prompt Disabling triggers for BMS_DOMAIN_VALUE...
alter table BMS_DOMAIN_VALUE disable all triggers;
prompt Disabling triggers for BMS_GROUP...
alter table BMS_GROUP disable all triggers;
prompt Disabling triggers for BMS_GROUP_AUTHORITY...
alter table BMS_GROUP_AUTHORITY disable all triggers;
prompt Disabling triggers for BMS_GROUP_MEMBER...
alter table BMS_GROUP_MEMBER disable all triggers;
prompt Disabling triggers for BMS_RSC_MENU...
alter table BMS_RSC_MENU disable all triggers;
prompt Disabling triggers for BMS_MENU_BROWSER...
alter table BMS_MENU_BROWSER disable all triggers;
prompt Disabling triggers for BMS_ORG...
alter table BMS_ORG disable all triggers;
prompt Disabling triggers for BMS_PERSISTENT_LOGINS...
alter table BMS_PERSISTENT_LOGINS disable all triggers;
prompt Disabling triggers for BMS_USER...
alter table BMS_USER disable all triggers;
prompt Disabling triggers for DEMO_CLUB_CHANNEL...
alter table DEMO_CLUB_CHANNEL disable all triggers;
prompt Disabling triggers for DEMO_CLUB_MEMBER...
alter table DEMO_CLUB_MEMBER disable all triggers;
prompt Disabling foreign key constraints for BMS_DOMAIN_VALUE...
alter table BMS_DOMAIN_VALUE disable constraint FKD1752EB66F9E0527;
prompt Disabling foreign key constraints for BMS_MENU_BROWSER...
alter table BMS_MENU_BROWSER disable constraint FKC7A88D9FB7649581;
prompt Disabling foreign key constraints for BMS_USER...
alter table BMS_USER disable constraint FK44523C42968E1D82;
prompt Disabling foreign key constraints for DEMO_CLUB_MEMBER...
alter table DEMO_CLUB_MEMBER disable constraint FK7A649AF81670E21C;
prompt Loading BMS_AUTHORITY...
insert into BMS_AUTHORITY (AUTHORITY)
values ('ROLE_USER');
insert into BMS_AUTHORITY (AUTHORITY)
values ('ROLE_ADMIN');
commit;
prompt 2 records loaded
prompt Loading BMS_DOMAIN...
prompt Table is empty
prompt Loading BMS_DOMAIN_VALUE...
prompt Table is empty
prompt Loading BMS_GROUP...
insert into BMS_GROUP (ID, GROUP_NAME)
values (2, 'Users');
insert into BMS_GROUP (ID, GROUP_NAME)
values (4, 'Administrators');
commit;
prompt 2 records loaded
prompt Loading BMS_GROUP_AUTHORITY...
insert into BMS_GROUP_AUTHORITY (GROUP_ID, AUTHORITY)
values ('2', 'ROLE_USER');
insert into BMS_GROUP_AUTHORITY (GROUP_ID, AUTHORITY)
values ('4', 'ROLE_USER');
insert into BMS_GROUP_AUTHORITY (GROUP_ID, AUTHORITY)
values ('4', 'ROLE_ADMIN');
commit;
prompt 3 records loaded
prompt Loading BMS_GROUP_MEMBER...
insert into BMS_GROUP_MEMBER (USER_ID, GROUP_ID)
values ('2c92e2ac42db8aff0142dbedd1a30003', '4');
insert into BMS_GROUP_MEMBER (USER_ID, GROUP_ID)
values ('ff80808142e48f400142e4afe6370001', '2');
commit;
prompt 2 records loaded
prompt Loading BMS_RSC_MENU...
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('01', '系统管理', 'root', null, null, 'resources/images/menu/plugin.gif', '1', '0', null, null, null, null, null, null, null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('01-01', '系统菜单管理', '01', null, 'FM.view.bms.menursc.MenurscManage', 'resources/images/menu/plugin.gif', '1', '1', null, null, null, null, null, 'panel', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('01-02', '人力资源组织机构管理', '01', null, 'FM.view.bms.org.OrgManage', 'resources/images/menu/menu-62.gif', '1', '1', null, null, null, null, null, 'panel', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('04-04', '成功案例管理', '04', null, 'jsp/twater/suc_case/sucCaseManage.do', 'resources/images/menu/menu-11.gif', '1', '1', null, null, null, null, null, 'iframe', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('04', '水处理', 'root', null, null, 'resources/images/menu/menu-1.gif', '1', '0', null, null, null, null, null, 'iframe', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('04-01', '产品类别管理', '04', null, 'jsp/twater/procategory/proCategoryManage.do', 'resources/images/menu/menu-53.gif', '1', '1', null, null, null, null, null, 'iframe', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('04-03', '公司动态管理', '04', null, 'jsp/twater/trends/trendsManage.do', 'resources/images/menu/menu-61.gif', '1', '1', null, null, null, null, null, 'iframe', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('04-02', '产品管理', '04', null, 'jsp/twater/product/productManage.do', 'resources/images/menu/plugin.gif', '1', '1', null, null, null, null, null, 'iframe', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('04-05', '留言管理', '04', null, 'jsp/twater/message/messageManage.do', 'resources/images/menu/menu-61.gif', '1', '1', null, null, null, null, null, 'iframe', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('04-06', '修改公司信息', '04', null, 'jsp/twater/contact/contact.do', 'resources/images/menu/system-setting.gif', '1', '1', null, null, null, null, null, 'iframe', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('04-07', '推荐产品到首页', '04', null, 'jsp/twater/recommend2home/recommend2homeManage.do', 'resources/images/menu/menu-11.gif', '1', '1', null, null, null, null, null, 'iframe', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('01-03', '用户管理', '01', null, 'FM.view.bms.user.UserManage', 'resources/images/menu/menu-51.gif', '1', '1', null, null, null, null, null, 'panel', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('04-08', '修改密码', '04', null, 'jsp/bms/sys/changePasswordManage.do', 'resources/images/menu/system-setting.gif', '1', '1', null, null, null, null, null, 'iframe', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('02', 'demo', 'root', null, null, 'resources/images/menu/menu-3.gif', '1', '0', null, null, null, null, null, null, null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('02-01', '分页', '02', null, 'demo/page/queryClubMember', 'resources/images/menu/menu-4.gif', '1', '1', null, null, null, null, null, 'iframe', 'dd');
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('03', 'isfotstore', 'root', null, null, 'resources/images/menu/menu-41.gif', '1', '0', null, null, null, null, null, 'panel', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('06', '新建 菜单', 'root', null, null, null, '1', '0', null, null, null, null, null, null, null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('03-01', '软件类别管理', '03', null, 'FM.view.isoftstore.category.CategoryManage', 'resources/images/menu/menu-53.gif', '1', '0', null, null, null, null, null, 'panel', null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('06-01', '新建 菜单', '06', null, null, null, '1', '0', null, null, null, null, null, null, null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('06-02', '新建 菜单', '06', null, null, null, '1', '0', null, null, null, null, null, null, null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('06-02-01', '新建 菜单', '06-02', null, null, null, '1', '0', null, null, null, null, null, null, null);
insert into BMS_RSC_MENU (ID, TEXT, PARENTID, REMARK, URL, ICON, TYPE, MENULEAF, ADAPTCLASS, SORTID, OUTERADDR, HTTPMETHOD, LEAF, TARGET_CONTAINER, NAME)
values ('05', '新建 菜单', 'root', null, null, null, '1', '0', null, null, null, null, null, null, null);
commit;
prompt 22 records loaded
prompt Loading BMS_MENU_BROWSER...
insert into BMS_MENU_BROWSER (MENU_ID, SORT)
values ('01-01', 0);
insert into BMS_MENU_BROWSER (MENU_ID, SORT)
values ('01-02', 1);
insert into BMS_MENU_BROWSER (MENU_ID, SORT)
values ('04-03', 6);
insert into BMS_MENU_BROWSER (MENU_ID, SORT)
values ('01-03', 2);
insert into BMS_MENU_BROWSER (MENU_ID, SORT)
values ('02-01', 4);
insert into BMS_MENU_BROWSER (MENU_ID, SORT)
values ('03-01', 5);
insert into BMS_MENU_BROWSER (MENU_ID, SORT)
values ('04-06', 7);
insert into BMS_MENU_BROWSER (MENU_ID, SORT)
values ('04-04', 5);
commit;
prompt 8 records loaded
prompt Loading BMS_ORG...
insert into BMS_ORG (ID, NAME, PARENTID, REMARK, ICON)
values ('01-01', '山东电力分公司', '01', null, 'resources/images/org/user.png');
insert into BMS_ORG (ID, NAME, PARENTID, REMARK, ICON)
values ('03', 'testwww', 'root', null, null);
insert into BMS_ORG (ID, NAME, PARENTID, REMARK, ICON)
values ('01', '国家电网', 'root', null, 'resources/images/org/user_green.png');
insert into BMS_ORG (ID, NAME, PARENTID, REMARK, ICON)
values ('04', '山东2', 'root', null, '#');
insert into BMS_ORG (ID, NAME, PARENTID, REMARK, ICON)
values ('05', '山东3', 'root', null, '#');
insert into BMS_ORG (ID, NAME, PARENTID, REMARK, ICON)
values ('02', '新建组织机构 ', 'root', null, 'resources/images/org/user_green.gif');
commit;
prompt 6 records loaded
prompt Loading BMS_PERSISTENT_LOGINS...
prompt Table is empty
prompt Loading BMS_USER...
insert into BMS_USER (ID, SEX, REAL_NAME, MOBILE, EMAIL, FAX, PHONE, ADDRESS, ENABLED, REMARK, PASSWORD, ORGID, USERNAME, REGIST_DATE, SALT)
values ('2c92e2b94491e66e014491e7deff0001', '1', 'dsf', '123', '123', '123', '123', '123', '1', '123', '123', '01', 'admin', null, null);
insert into BMS_USER (ID, SEX, REAL_NAME, MOBILE, EMAIL, FAX, PHONE, ADDRESS, ENABLED, REMARK, PASSWORD, ORGID, USERNAME, REGIST_DATE, SALT)
values ('402880ea449ccb7f01449ccf0f560000', '1', null, null, null, null, null, null, '', null, 'q2311213', null, 'test', null, null);
insert into BMS_USER (ID, SEX, REAL_NAME, MOBILE, EMAIL, FAX, PHONE, ADDRESS, ENABLED, REMARK, PASSWORD, ORGID, USERNAME, REGIST_DATE, SALT)
values ('2c92e2b9449c094601449c1916020000', '1', null, null, null, null, null, null, '', null, '123', null, 'test', null, null);
insert into BMS_USER (ID, SEX, REAL_NAME, MOBILE, EMAIL, FAX, PHONE, ADDRESS, ENABLED, REMARK, PASSWORD, ORGID, USERNAME, REGIST_DATE, SALT)
values ('402880ea449ccb7f01449ce1d2bb0004', '1', null, null, null, null, null, null, '', null, 'sf', '01', 'test1', null, null);
insert into BMS_USER (ID, SEX, REAL_NAME, MOBILE, EMAIL, FAX, PHONE, ADDRESS, ENABLED, REMARK, PASSWORD, ORGID, USERNAME, REGIST_DATE, SALT)
values ('2c92e2b945f992030145f9942f570000', '1', 'ddd', null, null, 'd', null, null, '', 'ddd', 'wwww', '02', 'www', null, null);
commit;
prompt 5 records loaded
prompt Loading DEMO_CLUB_CHANNEL...
insert into DEMO_CLUB_CHANNEL (ID, SCODE, SPHONE, SCONTEN, SADDR, SCOMPLAINTPHONE, SNAME, SCITYID, SCITYNAME, STYPE, STYPENAME)
values ('1', null, null, null, null, null, '通道1', null, null, null, null);
insert into DEMO_CLUB_CHANNEL (ID, SCODE, SPHONE, SCONTEN, SADDR, SCOMPLAINTPHONE, SNAME, SCITYID, SCITYNAME, STYPE, STYPENAME)
values ('2', null, null, null, null, null, '通道2', null, null, null, null);
commit;
prompt 2 records loaded
prompt Loading DEMO_CLUB_MEMBER...
insert into DEMO_CLUB_MEMBER (ID, SCODE, P2, SPASS, P1, SNAME, CREATE_TIME, IS_LOCKED, CLUB_CHANNEL_ID, CLUBCHANNELDTO, CLUBCHANNELDTOID)
values ('2c92e2ac4305412001430541247a0000', null, null, null, null, 'test', null, 0, null, null, null);
insert into DEMO_CLUB_MEMBER (ID, SCODE, P2, SPASS, P1, SNAME, CREATE_TIME, IS_LOCKED, CLUB_CHANNEL_ID, CLUBCHANNELDTO, CLUBCHANNELDTOID)
values ('2c92e2ac43053ecb0143053ecf260000', '123', null, '123', null, '123', null, 1, '1', null, null);
insert into DEMO_CLUB_MEMBER (ID, SCODE, P2, SPASS, P1, SNAME, CREATE_TIME, IS_LOCKED, CLUB_CHANNEL_ID, CLUBCHANNELDTO, CLUBCHANNELDTOID)
values ('2c92e2ac430540840143054088770000', '123', null, '123', null, 'test', null, 0, '1', null, null);
insert into DEMO_CLUB_MEMBER (ID, SCODE, P2, SPASS, P1, SNAME, CREATE_TIME, IS_LOCKED, CLUB_CHANNEL_ID, CLUBCHANNELDTO, CLUBCHANNELDTOID)
values ('2c92e2b9442e3d5801442e4071330000', 'admin', null, '123', null, '似懂非懂司法', to_timestamp('14-02-2014 10:36:19.118000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, '1', null, null);
insert into DEMO_CLUB_MEMBER (ID, SCODE, P2, SPASS, P1, SNAME, CREATE_TIME, IS_LOCKED, CLUB_CHANNEL_ID, CLUBCHANNELDTO, CLUBCHANNELDTOID)
values ('2c92e2b9442e3d5801442e40a8690001', 'admin323', null, '123', null, '士大夫', to_timestamp('14-02-2014 10:36:33.257000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, '1', null, null);
insert into DEMO_CLUB_MEMBER (ID, SCODE, P2, SPASS, P1, SNAME, CREATE_TIME, IS_LOCKED, CLUB_CHANNEL_ID, CLUBCHANNELDTO, CLUBCHANNELDTOID)
values ('2c92e2b9442e3d5801442e40de040002', 'admin44', null, '123', null, '史蒂芬森地方', to_timestamp('14-02-2014 10:36:46.980000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, '2', null, null);
insert into DEMO_CLUB_MEMBER (ID, SCODE, P2, SPASS, P1, SNAME, CREATE_TIME, IS_LOCKED, CLUB_CHANNEL_ID, CLUBCHANNELDTO, CLUBCHANNELDTOID)
values ('2c92e2b9442e3d5801442e410fc60003', 'adminrrerr', null, '123', null, '史蒂芬森地方', to_timestamp('14-02-2014 10:36:59.717000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, '2', null, null);
insert into DEMO_CLUB_MEMBER (ID, SCODE, P2, SPASS, P1, SNAME, CREATE_TIME, IS_LOCKED, CLUB_CHANNEL_ID, CLUBCHANNELDTO, CLUBCHANNELDTOID)
values ('2c92e2b9442e3d5801442e4133560004', 'admin333', null, '123', null, '123', to_timestamp('14-02-2014 10:37:08.822000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, '1', null, null);
insert into DEMO_CLUB_MEMBER (ID, SCODE, P2, SPASS, P1, SNAME, CREATE_TIME, IS_LOCKED, CLUB_CHANNEL_ID, CLUBCHANNELDTO, CLUBCHANNELDTOID)
values ('402880ea44c9998c0144c99accbc0000', '343434', null, '123', null, '4rrrrff', to_timestamp('16-03-2014 14:36:09.275000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, '2', null, null);
insert into DEMO_CLUB_MEMBER (ID, SCODE, P2, SPASS, P1, SNAME, CREATE_TIME, IS_LOCKED, CLUB_CHANNEL_ID, CLUBCHANNELDTO, CLUBCHANNELDTOID)
values ('402880ea44c9fbb60144ca1c303d0000', '234', null, '123', null, '东方大道', to_timestamp('16-03-2014 16:57:28.888000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, '2', null, null);
commit;
prompt 10 records loaded
prompt Enabling foreign key constraints for BMS_DOMAIN_VALUE...
alter table BMS_DOMAIN_VALUE enable constraint FKD1752EB66F9E0527;
prompt Enabling foreign key constraints for BMS_MENU_BROWSER...
alter table BMS_MENU_BROWSER enable constraint FKC7A88D9FB7649581;
prompt Enabling foreign key constraints for BMS_USER...
alter table BMS_USER enable constraint FK44523C42968E1D82;
prompt Enabling foreign key constraints for DEMO_CLUB_MEMBER...
alter table DEMO_CLUB_MEMBER enable constraint FK7A649AF81670E21C;
prompt Enabling triggers for BMS_AUTHORITY...
alter table BMS_AUTHORITY enable all triggers;
prompt Enabling triggers for BMS_DOMAIN...
alter table BMS_DOMAIN enable all triggers;
prompt Enabling triggers for BMS_DOMAIN_VALUE...
alter table BMS_DOMAIN_VALUE enable all triggers;
prompt Enabling triggers for BMS_GROUP...
alter table BMS_GROUP enable all triggers;
prompt Enabling triggers for BMS_GROUP_AUTHORITY...
alter table BMS_GROUP_AUTHORITY enable all triggers;
prompt Enabling triggers for BMS_GROUP_MEMBER...
alter table BMS_GROUP_MEMBER enable all triggers;
prompt Enabling triggers for BMS_RSC_MENU...
alter table BMS_RSC_MENU enable all triggers;
prompt Enabling triggers for BMS_MENU_BROWSER...
alter table BMS_MENU_BROWSER enable all triggers;
prompt Enabling triggers for BMS_ORG...
alter table BMS_ORG enable all triggers;
prompt Enabling triggers for BMS_PERSISTENT_LOGINS...
alter table BMS_PERSISTENT_LOGINS enable all triggers;
prompt Enabling triggers for BMS_USER...
alter table BMS_USER enable all triggers;
prompt Enabling triggers for DEMO_CLUB_CHANNEL...
alter table DEMO_CLUB_CHANNEL enable all triggers;
prompt Enabling triggers for DEMO_CLUB_MEMBER...
alter table DEMO_CLUB_MEMBER enable all triggers;
set feedback on
set define on
prompt Done.
