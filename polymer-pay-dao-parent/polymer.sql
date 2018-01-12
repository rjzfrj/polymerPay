prompt PL/SQL Developer import file
prompt Created on 2017年11月28日 by Administrator
set feedback off
set define off
prompt Creating CARD_ACCOUNT_CHECK_BATCH...
create table CARD_ACCOUNT_CHECK_BATCH
(
  id          NUMBER(18) not null,
  create_user VARCHAR2(32),
  create_time TIMESTAMP(6),
  editor_user VARCHAR2(32),
  edit_time   TIMESTAMP(6),
  status      NUMBER(1),
  batch_no    VARCHAR2(16),
  get_type    NUMBER(4),
  channel_id  NUMBER(10),
  bill_date   TIMESTAMP(6),
  file_path   VARCHAR2(256),
  bill_type   NUMBER(4),
  req_code    VARCHAR2(10),
  req_msg     VARCHAR2(256),
  remark      VARCHAR2(256)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table CARD_ACCOUNT_CHECK_BATCH
  add constraint PK_CARD_ACCOUNT_CHECK_BATCH primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating CARD_ACCOUNT_CHECK_BILL...
create table CARD_ACCOUNT_CHECK_BILL
(
  batch_no            VARCHAR2(18),
  bill_date           TIMESTAMP(6),
  mcode               VARCHAR2(32),
  merchant_order_id   VARCHAR2(32),
  merchant_order_time TIMESTAMP(6),
  order_type          NUMBER(4),
  pay_channel_type    NUMBER(4),
  channel_id          NUMBER(10) not null,
  bank_order_num      VARCHAR2(32),
  third_order_num     VARCHAR2(32),
  trans_money         NUMBER(18),
  fee_money           NUMBER(10),
  account_number      VARCHAR2(32),
  status              NUMBER(1),
  bank_bill_no        VARCHAR2(32),
  pay_date            TIMESTAMP(6),
  remark              VARCHAR2(256),
  id                  NUMBER(18) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_CA_CHECK_BILL_BANK_ORDER_NUM on CARD_ACCOUNT_CHECK_BILL (BANK_ORDER_NUM)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_CA_CHECK_BILL_CHANNEL_ID on CARD_ACCOUNT_CHECK_BILL (CHANNEL_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table CARD_ACCOUNT_CHECK_BILL
  add constraint PK_CARD_ACCOUNT_CHECK_BILL primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating CARD_ACCOUNT_CHECK_MISTAKE...
create table CARD_ACCOUNT_CHECK_MISTAKE
(
  id                  NUMBER(18) not null,
  batch_no            VARCHAR2(16),
  bill_date           TIMESTAMP(6),
  mcode               VARCHAR2(32),
  merchant_order_id   VARCHAR2(32),
  merchant_order_time TIMESTAMP(6),
  trans_no            VARCHAR2(32),
  trade_status        NUMBER(1),
  trade_time          TIMESTAMP(6),
  order_type          NUMBER(4),
  pay_channel_type    NUMBER(4),
  channel_id          NUMBER(10),
  bank_order_num      VARCHAR2(32),
  third_order_num     VARCHAR2(32),
  bank_fee            NUMBER(10),
  bank_trade_status   NUMBER(1),
  pay_date            TIMESTAMP(6),
  account_number      VARCHAR2(32),
  error_type          NUMBER(1),
  dispose_status      NUMBER(1),
  dispose_result      VARCHAR2(256),
  remark              VARCHAR2(256),
  trans_money         NUMBER(15),
  refund_money        NUMBER(15),
  trans_fee_money     NUMBER(10),
  bank_money          NUMBER(15),
  bank_refund_money   NUMBER(15)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table CARD_ACCOUNT_CHECK_MISTAKE
  add constraint PK_CARD_ACCOUNT_CHECK_MISTAKE primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating CARD_ACCOUNT_CHECK_MISTAKE_P...
create table CARD_ACCOUNT_CHECK_MISTAKE_P
(
  id                  NUMBER(18) not null,
  batch_no            VARCHAR2(16),
  bill_date           TIMESTAMP(6),
  mcode               VARCHAR2(32),
  merchant_order_id   VARCHAR2(32),
  trans_no            VARCHAR2(32),
  trade_status        NUMBER(1),
  trade_time          TIMESTAMP(6),
  merchant_order_time TIMESTAMP(6),
  order_type          NUMBER(4),
  pay_channel_type    NUMBER(4),
  channel_id          NUMBER(10),
  bank_order_num      VARCHAR2(32),
  third_order_num     VARCHAR2(32),
  bank_trade_status   NUMBER(1),
  pay_date            TIMESTAMP(6),
  account_number      VARCHAR2(32),
  error_type          NUMBER(1),
  dispose_status      NUMBER(1),
  dispose_result      VARCHAR2(256),
  remark              VARCHAR2(256),
  trans_money         NUMBER(15),
  refund_money        NUMBER(15),
  trans_fee_money     NUMBER(10),
  bank_money          NUMBER(15),
  bank_refund_money   NUMBER(15),
  bank_fee            NUMBER(10)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table CARD_ACCOUNT_CHECK_MISTAKE_P
  add constraint PK_CARD_ACCOUNTCHECK_MISTAKE_P primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_CARD_ORDER...
create table PMS_CARD_ORDER
(
  trans_id            VARCHAR2(32) not null,
  org_id              NUMBER(18) not null,
  role_id             NUMBER(1) not null,
  client_type         NUMBER(1) not null,
  mcode               VARCHAR2(32) not null,
  tcode               VARCHAR2(32) not null,
  merchant_order_id   VARCHAR2(64) not null,
  merchant_order_time TIMESTAMP(6) not null,
  order_type_id       NUMBER(10) not null,
  pay_channel_type    NUMBER(4) not null,
  clear_type          NUMBER(1) not null,
  clear_mcode_type    NUMBER(1) not null,
  trans_money         NUMBER(15) not null,
  fee_money           NUMBER(10) not null,
  fee_rate            NUMBER(6,5) not null,
  charge_amount       NUMBER(10) not null,
  account_number      VARCHAR2(32) not null,
  track2_data         VARCHAR2(128) not null,
  track3_data         VARCHAR2(256),
  pin                 VARCHAR2(32) not null,
  ic_card_yu          VARCHAR2(512),
  ip                  VARCHAR2(64),
  client_info         VARCHAR2(512),
  remark              VARCHAR2(256),
  card_type_n         NUMBER(1),
  status              NUMBER(2) not null,
  signature_path      VARCHAR2(128),
  create_time         TIMESTAMP(6) not null,
  create_long_time    NUMBER(16) not null,
  edit_time           TIMESTAMP(6),
  edit_long_time      NUMBER(16) not null,
  channel_id          NUMBER(10) not null,
  merchant_id         VARCHAR2(32),
  terminal_id         VARCHAR2(32),
  son_mcode           VARCHAR2(32),
  bank_order_num      VARCHAR2(64),
  req_code            VARCHAR2(10),
  req_msg             VARCHAR2(256),
  card_type           NUMBER(1),
  expire_date         VARCHAR2(4),
  batch_id            VARCHAR2(10),
  authorization_code  VARCHAR2(20),
  issue_bank          VARCHAR2(64),
  bank_ref            VARCHAR2(20),
  search_id           VARCHAR2(6),
  real_ticket         VARCHAR2(1024),
  notify_url          VARCHAR2(256),
  notify_cnt          NUMBER(1) not null,
  notify_status       NUMBER(1) not null,
  revoc_send_id       VARCHAR2(32),
  org_trans_id        VARCHAR2(32),
  is_investig         NUMBER(1) not null,
  marked_red          NUMBER(1) not null,
  description         VARCHAR2(512),
  iss_status          NUMBER(1) not null,
  iss_req_code        VARCHAR2(10) not null,
  iss_req_msg         VARCHAR2(256) not null,
  revenue_fee_money   NUMBER(10),
  receivable_money    NUMBER(10),
  maori               NUMBER(10),
  other_param         VARCHAR2(1024)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_CARD_ORDER_MCODE on PMS_CARD_ORDER (MCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_CARD_ORDER_ORGID on PMS_CARD_ORDER (ORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_CARD_ORDER_TCODE on PMS_CARD_ORDER (TCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_CARD_ORDER
  add constraint PK_PMS_CARD_ORDER primary key (TRANS_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_CARD_ORDER_TEMP...
create table PMS_CARD_ORDER_TEMP
(
  trans_id            VARCHAR2(32) not null,
  org_id              NUMBER(18) not null,
  role_id             NUMBER(1) not null,
  client_type         NUMBER(1) not null,
  mcode               VARCHAR2(32) not null,
  tcode               VARCHAR2(32) not null,
  merchant_order_id   VARCHAR2(64) not null,
  merchant_order_time TIMESTAMP(6) not null,
  order_type_id       NUMBER(10) not null,
  pay_channel_type    NUMBER(4) not null,
  clear_type          NUMBER(1) not null,
  clear_mcode_type    NUMBER(1) not null,
  trans_money         NUMBER(15) not null,
  fee_money           NUMBER(10) not null,
  fee_rate            NUMBER(6,5) not null,
  charge_amount       NUMBER(10) not null,
  account_number      VARCHAR2(32) not null,
  track2_data         VARCHAR2(128) not null,
  track3_data         VARCHAR2(256),
  pin                 VARCHAR2(32) not null,
  ic_card_yu          VARCHAR2(512),
  ip                  VARCHAR2(64),
  client_info         VARCHAR2(512),
  remark              VARCHAR2(256),
  card_type_n         NUMBER(1),
  status              NUMBER(2) not null,
  signature_path      VARCHAR2(128),
  create_time         TIMESTAMP(6) not null,
  create_long_time    NUMBER(16) not null,
  edit_time           TIMESTAMP(6),
  edit_long_time      NUMBER(16) not null,
  channel_id          NUMBER(10) not null,
  merchant_id         VARCHAR2(32),
  terminal_id         VARCHAR2(32),
  son_mcode           VARCHAR2(32),
  bank_order_num      VARCHAR2(64),
  req_code            VARCHAR2(10),
  req_msg             VARCHAR2(256),
  card_type           NUMBER(1),
  expire_date         VARCHAR2(4),
  batch_id            VARCHAR2(10),
  authorization_code  VARCHAR2(20),
  issue_bank          VARCHAR2(64),
  bank_ref            VARCHAR2(20),
  search_id           VARCHAR2(6),
  real_ticket         VARCHAR2(1024),
  notify_url          VARCHAR2(256),
  notify_cnt          NUMBER(1) not null,
  notify_status       NUMBER(1) not null,
  revoc_send_id       VARCHAR2(32),
  org_trans_id        VARCHAR2(32),
  is_investig         NUMBER(1) not null,
  marked_red          NUMBER(1) not null,
  description         VARCHAR2(512),
  iss_status          NUMBER(1) not null,
  iss_req_code        VARCHAR2(10) not null,
  iss_req_msg         VARCHAR2(256) not null,
  revenue_fee_money   NUMBER(10),
  receivable_money    NUMBER(10),
  maori               NUMBER(10),
  other_param         VARCHAR2(1024)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_CHANNEL...
create table PMS_CHANNEL
(
  channel_id          NUMBER(10) not null,
  corg_id             NUMBER(10) not null,
  pay_channel_type    NUMBER(4) not null,
  fee_rate            NUMBER(5,4) not null,
  fd_max_fee          NUMBER(10) not null,
  fd_min_fee          NUMBER(10) not null,
  clear_fee           NUMBER(10) not null,
  status              NUMBER(1) not null,
  description         VARCHAR2(600),
  cost_type           NUMBER(1) not null,
  param_type          NUMBER(1) not null,
  main_key            VARCHAR2(32) not null,
  url                 VARCHAR2(200) not null,
  port                NUMBER(6) not null,
  public_key          VARCHAR2(1024),
  private_key         VARCHAR2(2048),
  sign_type           NUMBER(1) not null,
  is_record_trans_amt NUMBER(1) not null,
  other_param         VARCHAR2(1024),
  channel_name        VARCHAR2(64) not null,
  pay_type            NUMBER(1)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_PMS_CHANNEL_CORGID on PMS_CHANNEL (CORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_CHANNEL
  add constraint PK_PMS_CHANNEL primary key (CHANNEL_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_CHANNEL_M...
create table PMS_CHANNEL_M
(
  channel_m_id  NUMBER(10) not null,
  channel_id    NUMBER(10) not null,
  terminal_id   VARCHAR2(32) not null,
  merchant_id   VARCHAR2(32) not null,
  other_param   VARCHAR2(1024),
  role_id       NUMBER(10) not null,
  status        NUMBER(1) not null,
  fee_rate      NUMBER(6,5) not null,
  fd_max_fee    NUMBER(10) not null,
  fd_min_fee    NUMBER(10) not null,
  single_limit  NUMBER(10),
  total_limit   NUMBER(15),
  use_time      TIMESTAMP(6),
  description   VARCHAR2(512),
  usetotal      NUMBER(15) default 0,
  province      VARCHAR2(30),
  province_code NUMBER(2),
  city          VARCHAR2(30),
  city_code     NUMBER(4),
  mcc           VARCHAR2(30),
  main_key      VARCHAR2(32),
  public_key    VARCHAR2(1024),
  private_key   VARCHAR2(2048),
  sign_type     NUMBER(1) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_CHANNEL_M_CHANNELID on PMS_CHANNEL_M (CHANNEL_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_CHANNEL_M_MCODE on PMS_CHANNEL_M (MERCHANT_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_CHANNEL_M_TCODE on PMS_CHANNEL_M (TERMINAL_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_CHANNEL_M
  add constraint PK_PMS_CHANNEL_M primary key (CHANNEL_M_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_CHANNEL_ORG...
create table PMS_CHANNEL_ORG
(
  corg_id     NUMBER(10) not null,
  name        VARCHAR2(100) not null,
  province    NUMBER(4),
  city        NUMBER(4),
  address     VARCHAR2(200),
  mobile      VARCHAR2(20) not null,
  phone       VARCHAR2(20),
  legal_name  VARCHAR2(50),
  id_card     VARCHAR2(20),
  post        VARCHAR2(6),
  email       VARCHAR2(50),
  salesman    VARCHAR2(50) not null,
  status      NUMBER(1) not null,
  remark      VARCHAR2(512) not null,
  create_user VARCHAR2(64) not null,
  create_time TIMESTAMP(6) not null,
  editor_user VARCHAR2(64),
  edit_time   TIMESTAMP(6)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_CHANNEL_ORG_NAME on PMS_CHANNEL_ORG (NAME)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_CHANNEL_ORG
  add constraint PK_PMS_CHANNEL_ORG primary key (CORG_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_CHANNEL_TYPE...
create table PMS_CHANNEL_TYPE
(
  pay_channel_type NUMBER(4) not null,
  name             VARCHAR2(64) not null,
  remark           VARCHAR2(512) not null,
  create_user      VARCHAR2(64) not null,
  create_time      TIMESTAMP(6) not null,
  editor_user      VARCHAR2(64),
  edit_time        TIMESTAMP(6)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_CHANNEL_TYPE
  add constraint PK_PMS_CHANNEL_TYPE primary key (PAY_CHANNEL_TYPE)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_ERROR_CODE...
create table PMS_ERROR_CODE
(
  id           NUMBER(10) not null,
  code         VARCHAR2(16) not null,
  type         NUMBER(1),
  remark       VARCHAR2(256),
  display_desc VARCHAR2(256),
  create_user  VARCHAR2(64),
  create_time  TIMESTAMP(6),
  editor_user  VARCHAR2(64),
  edit_time    TIMESTAMP(6)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_ERROR_CODE
  add constraint PK_PMS_ERRORCODE primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_ERROR_CODE
  add constraint UK_ERRORCODE unique (CODE)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_FC_T_TRANSLIMIT...
create table PMS_FC_T_TRANSLIMIT
(
  id               NUMBER(18) not null,
  mcode            VARCHAR2(32) not null,
  tcode            VARCHAR2(32) not null,
  function_key     VARCHAR2(32) not null,
  limit_type       NUMBER(1) not null,
  day_all_amt      NUMBER(15) not null,
  day_cnt          NUMBER(10) not null,
  day_min_amt      NUMBER(10) not null,
  day_max_amt      NUMBER(10) not null,
  day_card_all_amt NUMBER(10) not null,
  day_card_cnt     NUMBER(10) not null,
  status           NUMBER(1) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_FC_T_TRANSLIMIT_FUNCTIONKEY on PMS_FC_T_TRANSLIMIT (FUNCTION_KEY)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_FC_T_TRANSLIMIT_MCODE on PMS_FC_T_TRANSLIMIT (MCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_FC_T_TRANSLIMIT_TCODE on PMS_FC_T_TRANSLIMIT (TCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_FC_T_TRANSLIMIT
  add constraint PK_PMS_FC_T_TRANSLIMIT primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_IDBLACKLIST...
create table PMS_IDBLACKLIST
(
  id          NUMBER(10) not null,
  id_card     VARCHAR2(20) not null,
  deleted     NUMBER(1) not null,
  description VARCHAR2(600) not null,
  delete_desc VARCHAR2(300) not null,
  create_user VARCHAR2(64) not null,
  create_time TIMESTAMP(6) not null,
  editor_user VARCHAR2(64),
  edit_time   TIMESTAMP(6)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_IDBLACKLIST_IDCARD on PMS_IDBLACKLIST (ID_CARD)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PMS_IDBLACKLIST
  add constraint PK_PMS_IDBLACKLIST primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_ISS_CLEAR...
create table PMS_ISS_CLEAR
(
  clear_id          NUMBER(18) not null,
  bank_order_id     VARCHAR2(64),
  total_items       NUMBER(8) not null,
  total_money       NUMBER(15) not null,
  total_channel_fee NUMBER(15) not null,
  maori             NUMBER(15),
  status            NUMBER(1) not null,
  channel_id        NUMBER(10),
  create_user       VARCHAR2(64) not null,
  create_time       TIMESTAMP(6) not null,
  editor_user       VARCHAR2(64),
  edit_time         TIMESTAMP(6),
  description       VARCHAR2(512),
  cl_file_name      VARCHAR2(64),
  cl_file_path      VARCHAR2(128),
  cl_file_name1     VARCHAR2(64),
  cl_file_path1     VARCHAR2(128),
  re_file_path      VARCHAR2(128),
  re_file_path1     VARCHAR2(128),
  operate_type      NUMBER(1) not null,
  req_code          VARCHAR2(10) not null,
  req_msg           VARCHAR2(256) not null,
  total_error_amt   NUMBER(15) not null,
  total_error_cnt   NUMBER(10) not null,
  clear_mcode_type  NUMBER(1) not null,
  merchant_id       VARCHAR2(32),
  terminal_id       VARCHAR2(32)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_ISS_CLEAR
  add constraint PK_PMS_ISS_CLEAR primary key (CLEAR_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_ISS_ORDER...
create table PMS_ISS_ORDER
(
  iss_o_id                NUMBER(18) not null,
  merchant_single_transid VARCHAR2(64) not null,
  bank_single_order_id    VARCHAR2(64),
  mcode                   VARCHAR2(32) not null,
  tcode                   VARCHAR2(32) not null,
  org_id                  NUMBER(18) not null,
  order_type_id           NUMBER(10) not null,
  clear_mcode_type        NUMBER(1) not null,
  clear_type              NUMBER(1) not null,
  user_name               VARCHAR2(64) not null,
  bank_card               VARCHAR2(32) not null,
  opening_bank            VARCHAR2(64) not null,
  branches_bank           VARCHAR2(64) not null,
  branches_bank_code      VARCHAR2(20) not null,
  bbank_province          VARCHAR2(32) not null,
  bbank_city              VARCHAR2(32) not null,
  pub_pri                 NUMBER(1) not null,
  card_type               NUMBER(1) not null,
  trans_money             NUMBER(15,2) not null,
  fee_money               NUMBER(10,2) not null,
  status                  NUMBER(1) not null,
  req_code                VARCHAR2(10) not null,
  req_msg                 VARCHAR2(256) not null,
  is_return               NUMBER(1) not null,
  create_user             VARCHAR2(64) not null,
  create_time             TIMESTAMP(6) not null,
  create_long_time        NUMBER(16) not null,
  editor_user             VARCHAR2(64),
  edit_time               TIMESTAMP(6),
  edit_long_time          NUMBER(16),
  channel_fee             NUMBER(15,2),
  maori                   NUMBER(15,2),
  remark                  VARCHAR2(254),
  description             VARCHAR2(254),
  clear_mac               VARCHAR2(512) not null,
  operate_type            NUMBER(1) not null,
  org_order_num           VARCHAR2(32),
  channel_id              NUMBER(10) not null,
  is_co                   NUMBER(1) not null,
  merchant_id             VARCHAR2(32),
  terminal_id             VARCHAR2(32),
  clear_again             NUMBER(1) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_ISS_ORDER_BANKSINGLEORDERID on PMS_ISS_ORDER (BANK_SINGLE_ORDER_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_ISS_ORDER_MCODE on PMS_ISS_ORDER (MCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_ISS_ORDER_MSINGLETRANSID on PMS_ISS_ORDER (MERCHANT_SINGLE_TRANSID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_ISS_ORDER_ORGID on PMS_ISS_ORDER (ORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_ISS_ORDER_TCODE on PMS_ISS_ORDER (TCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PMS_ISS_ORDER
  add constraint PK_PMS_ISS_ORDER primary key (ISS_O_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_ISS_ORDER_LOG...
create table PMS_ISS_ORDER_LOG
(
  trans_log_id         NUMBER(18) not null,
  send_id              VARCHAR2(32) not null,
  org_id               NUMBER(18) not null,
  mcode                VARCHAR2(32) not null,
  tcode                VARCHAR2(32) not null,
  trans_id             VARCHAR2(32) not null,
  clear_id             NUMBER(18) not null,
  user_name            VARCHAR2(64) not null,
  bank_card            VARCHAR2(32) not null,
  opening_bank         VARCHAR2(64) not null,
  branches_bank        VARCHAR2(64),
  branches_bank_code   VARCHAR2(20),
  bbank_province       VARCHAR2(32),
  bbank_city           VARCHAR2(32),
  trans_money          NUMBER(15) not null,
  fee                  NUMBER(10) not null,
  channel_fee          NUMBER(10) not null,
  bank_single_order_id VARCHAR2(64) not null,
  status               NUMBER(1) not null,
  create_user          VARCHAR2(64) not null,
  create_time          TIMESTAMP(6) not null,
  create_long_time     NUMBER(16) not null,
  editor_user          VARCHAR2(64),
  edit_time            TIMESTAMP(6),
  edit_long_time       NUMBER(16),
  req_code             VARCHAR2(10) not null,
  req_msg              VARCHAR2(256) not null,
  is_return            NUMBER(1) not null,
  remark               VARCHAR2(256),
  description          VARCHAR2(256),
  clear_mac            VARCHAR2(1024),
  sort                 NUMBER(6),
  son_mcode            VARCHAR2(32),
  merchant_id          VARCHAR2(32),
  terminal_id          VARCHAR2(32),
  marked_red           NUMBER(1) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_ISS_ORDER_LOG_CLEARID on PMS_ISS_ORDER_LOG (CLEAR_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_ISS_ORDER_LOG_MCODE on PMS_ISS_ORDER_LOG (MCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_ISS_ORDER_LOG_ORGID on PMS_ISS_ORDER_LOG (ORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_ISS_ORDER_LOG_SENDID on PMS_ISS_ORDER_LOG (SEND_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_ISS_ORDER_LOG_TCODE on PMS_ISS_ORDER_LOG (TCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_ISS_ORDER_LOG_TRANSID on PMS_ISS_ORDER_LOG (TRANS_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PMS_ISS_ORDER_LOG
  add constraint PK_PMS_ISS_ORDER_LOG primary key (TRANS_LOG_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_MENU...
create table PMS_MENU
(
  id          NUMBER(10) not null,
  status      NUMBER(1) not null,
  remark      VARCHAR2(512),
  sort        NUMBER(4) not null,
  name        VARCHAR2(64) not null,
  url         VARCHAR2(128) not null,
  param       VARCHAR2(200),
  create_user VARCHAR2(50) not null,
  create_time TIMESTAMP(6) not null,
  editor_user VARCHAR2(50),
  edit_time   TIMESTAMP(6),
  is_leaf     NUMBER(1) not null,
  parent_id   NUMBER(18) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_MENU_NAME on PMS_MENU (NAME)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_MENU_PARENTID on PMS_MENU (PARENT_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_MENU
  add constraint PK_PMS_MENU primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_MENU_ROLE...
create table PMS_MENU_ROLE
(
  id          NUMBER(10) not null,
  create_user VARCHAR2(64) not null,
  create_time TIMESTAMP(6) not null,
  editor_user VARCHAR2(64),
  edit_time   TIMESTAMP(6),
  status      NUMBER(1) default 1,
  remark      VARCHAR2(512),
  role_id     NUMBER(10) not null,
  menu_id     NUMBER(10) not null,
  pause_msg   VARCHAR2(512)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_MENU_ROLE
  add constraint PK_PMS_MENU_ROLE primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_MENU_ROLE
  add constraint UK_MENU_ROLE_RIDORMID unique (ROLE_ID, MENU_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_MERCHANT...
create table PMS_MERCHANT
(
  mcode            VARCHAR2(32) not null,
  org_id           NUMBER(18) not null,
  public_key       VARCHAR2(512) not null,
  private_key      VARCHAR2(2048) not null,
  status           NUMBER(1) not null,
  description      VARCHAR2(512) not null,
  create_user      VARCHAR2(64) not null,
  create_time      TIMESTAMP(6) not null,
  editor_user      VARCHAR2(64),
  edit_time        TIMESTAMP(6),
  deleted          NUMBER(1) default 0 not null,
  clear_mcode_type NUMBER(1) default 1 not null,
  role_type        NUMBER(1) default 1 not null,
  mer_name         VARCHAR2(64)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_MERCHANT_ORGID on PMS_MERCHANT (ORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_MERCHANT
  add constraint PK_PMS_MERCHANT primary key (MCODE)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_MERCHANT_CLEANING...
create table PMS_MERCHANT_CLEANING
(
  mcode              VARCHAR2(32) not null,
  opening_bank       VARCHAR2(64) not null,
  branches_bank      VARCHAR2(60),
  bbank_province     NUMBER(4),
  bbank_city         NUMBER(4),
  bank_card          VARCHAR2(30) not null,
  cardholder         VARCHAR2(64) not null,
  clean_type         NUMBER(1) default 1 not null,
  fee_rate           NUMBER(5,4) not null,
  clear_fee          NUMBER(5) not null,
  min_fee            NUMBER(10),
  max_fee            NUMBER(10),
  branches_bank_code VARCHAR2(20)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_UK_MERCHANT_CL_BANKCARD on PMS_MERCHANT_CLEANING (BANK_CARD)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_UK_MERCHANT_CL_CARDHOLDER on PMS_MERCHANT_CLEANING (CARDHOLDER)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PMS_MERCHANT_CLEANING
  add constraint UK_MERCHANT_CLEANING_MCODE primary key (MCODE)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_MERCHANT_REGISTER...
create table PMS_MERCHANT_REGISTER
(
  mcode               VARCHAR2(32) not null,
  cor_name            VARCHAR2(64) not null,
  cor_card_type       NUMBER(1) not null,
  cor_id_card         VARCHAR2(30) not null,
  cor_id_card_valid   TIMESTAMP(6) not null,
  license_code        VARCHAR2(30),
  license_code_valid  TIMESTAMP(6),
  mer_register_addr   VARCHAR2(256) not null,
  main_business       VARCHAR2(512),
  sign_amount         NUMBER(9),
  real_amount         NUMBER(9),
  license_img         VARCHAR2(128),
  id_front_img        VARCHAR2(128) not null,
  id_back_img         VARCHAR2(128) not null,
  bankcard_front_img  VARCHAR2(128),
  bankcard_back_img   VARCHAR2(128),
  open_bank_pc_img    VARCHAR2(128),
  merchant_ofd_img    VARCHAR2(128),
  merchant_stores_img VARCHAR2(128),
  head_img            VARCHAR2(128) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_MERCHANT_REGISTE_CORIDCARD on PMS_MERCHANT_REGISTER (COR_ID_CARD)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_MERCHANT_REGISTE_CORNAME on PMS_MERCHANT_REGISTER (COR_NAME)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_MERCHANT_REGISTE_LICENSECODE on PMS_MERCHANT_REGISTER (LICENSE_CODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_MERCHANT_REGISTER
  add constraint UK_MERCHANT_REGISTE_MCODE unique (MCODE)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_OPERATOR...
create table PMS_OPERATOR
(
  id            NUMBER(10) not null,
  org_id        NUMBER(18) not null,
  create_user   VARCHAR2(64) not null,
  create_time   TIMESTAMP(6) not null,
  editor_user   VARCHAR2(64),
  edit_time     TIMESTAMP(6),
  status        NUMBER(1) not null,
  remark        VARCHAR2(512),
  real_name     VARCHAR2(64) not null,
  mobile        VARCHAR2(15) not null,
  login_name    VARCHAR2(64) not null,
  login_pwd     VARCHAR2(256) not null,
  type          NUMBER(1) not null,
  salt          VARCHAR2(64) not null,
  login_cnt     NUMBER(18) not null,
  email         VARCHAR2(64) not null,
  authorize_pwd VARCHAR2(256) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_OPERATOR_LOGINNAME on PMS_OPERATOR (LOGIN_NAME)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_OPERATOR_ORGID on PMS_OPERATOR (ORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_OPERATOR
  add constraint PK_PMS_OPERATOR primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_OPERATOR_LOG...
create table PMS_OPERATOR_LOG
(
  id            NUMBER(10) not null,
  user_id       NUMBER(10) not null,
  login_name    VARCHAR2(64) not null,
  permission    VARCHAR2(128) not null,
  method_name   VARCHAR2(64) not null,
  function_name VARCHAR2(64) not null,
  type          NUMBER(1) not null,
  ip            VARCHAR2(64) not null,
  description   VARCHAR2(512),
  create_time   TIMESTAMP(6) not null,
  param         VARCHAR2(1024),
  req_code      VARCHAR2(10),
  req_msg       VARCHAR2(256)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_OPERATOR_LOG_LOGINNAME on PMS_OPERATOR_LOG (LOGIN_NAME)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_OPERATOR_LOG_PERMISSION on PMS_OPERATOR_LOG (PERMISSION)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_OPERATOR_LOG_TYPE on PMS_OPERATOR_LOG (TYPE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_OPERATOR_LOG_USERID on PMS_OPERATOR_LOG (USER_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PMS_OPERATOR_LOG
  add constraint PK_PMS_OPERATOR_LOG primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_ORGANIZATION...
create table PMS_ORGANIZATION
(
  org_id       NUMBER(18) not null,
  name         VARCHAR2(128) not null,
  type         NUMBER(4) not null,
  parent_id    NUMBER(18),
  layer        VARCHAR2(512) not null,
  description  VARCHAR2(512),
  create_user  VARCHAR2(64) not null,
  create_time  TIMESTAMP(6) not null,
  editor_user  VARCHAR2(64),
  edit_time    TIMESTAMP(6),
  deleted      NUMBER(1) not null,
  province     NUMBER(4),
  city         NUMBER(4),
  address      VARCHAR2(256) not null,
  mobile       VARCHAR2(20) not null,
  phone        VARCHAR2(20) not null,
  legal_name   VARCHAR2(64) not null,
  id_card      VARCHAR2(20) not null,
  post         VARCHAR2(6),
  email        VARCHAR2(64),
  salesman     VARCHAR2(64) not null,
  check_user   VARCHAR2(64),
  status       NUMBER(1) not null,
  check_desc   VARCHAR2(512),
  is_check_org NUMBER(1),
  is_dir       NUMBER(1) not null,
  clear_mac    VARCHAR2(512)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index ORGANIZATION_LAYER on PMS_ORGANIZATION (REVERSE(LAYER))
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index ORGANIZATION_PARENTID on PMS_ORGANIZATION (PARENT_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_ORGANIZATION
  add constraint PK_PMS_ORGANIZATION primary key (ORG_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_ORG_CHANNEL...
create table PMS_ORG_CHANNEL
(
  channel_id  NUMBER(10) not null,
  org_id      NUMBER(10) not null,
  create_user VARCHAR2(64) not null,
  create_time TIMESTAMP(6) not null,
  editor_user VARCHAR2(64),
  edit_time   TIMESTAMP(6),
  status      NUMBER(1) not null,
  remark      VARCHAR2(512)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_ORG_CHANNEL
  add constraint UK_ORG_CHANNEL_CIDORORGOD primary key (CHANNEL_ID, ORG_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_ORG_CLEANING...
create table PMS_ORG_CLEANING
(
  org_id            NUMBER(18) not null,
  cardholder        VARCHAR2(64),
  cleantype         NUMBER(1),
  opening_bank      VARCHAR2(30),
  branches_bank     VARCHAR2(64),
  bbank_province    NUMBER(4),
  bbank_city        NUMBER(4),
  bank_card         VARCHAR2(32),
  fee_rate          NUMBER(5,4),
  clear_fee         NUMBER(5),
  min_fee           NUMBER(10),
  max_fee           NUMBER(10),
  branches_bankcode VARCHAR2(20)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_ORG_CLEANING_BANKCARD on PMS_ORG_CLEANING (BANK_CARD)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_ORG_CLEANING_CARDHOLDER on PMS_ORG_CLEANING (CARDHOLDER)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create unique index I_ORG_CLEANING_ORGID on PMS_ORG_CLEANING (ORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_ORG_CONTRACT...
create table PMS_ORG_CONTRACT
(
  ccode            VARCHAR2(50),
  org_id           NUMBER(18) not null,
  con_startdate    TIMESTAMP(6),
  con_enddate      TIMESTAMP(6),
  agency_fee       NUMBER(15),
  pay_type         NUMBER(1),
  security_money   NUMBER(15),
  initial_fee      NUMBER(15),
  monthly_invoices NUMBER(1),
  fee_directions   VARCHAR2(600),
  description      VARCHAR2(1024)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index INDEX_PMS_ORG_CONTRACT_CCODE on PMS_ORG_CONTRACT (CCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_ORG_CONTRACT
  add constraint PK_PMS_ORG_CONTRACT primary key (ORG_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_ORG_REGISTER...
create table PMS_ORG_REGISTER
(
  org_id              NUMBER(18) not null,
  cor_name            VARCHAR2(64) not null,
  cor_card_type       NUMBER(1) not null,
  cor_id_card         VARCHAR2(30) not null,
  cor_id_card_valid   TIMESTAMP(6) not null,
  license_code        VARCHAR2(30) not null,
  license_code_valid  TIMESTAMP(6) not null,
  mer_register_addr   VARCHAR2(512) not null,
  main_business       VARCHAR2(512) not null,
  sign_amount         NUMBER(9) not null,
  real_amount         NUMBER(9) not null,
  role_type           NUMBER(1) not null,
  license_img         VARCHAR2(128),
  id_front_img        VARCHAR2(128) not null,
  id_back_img         VARCHAR2(128) not null,
  bankcard_front_img  VARCHAR2(128) not null,
  bankcard_back_img   VARCHAR2(128) not null,
  open_bank_pc_img    VARCHAR2(128),
  merchant_ofd_img    VARCHAR2(128),
  merchant_stores_img VARCHAR2(128),
  head_img            VARCHAR2(128) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_ORG_REGISTER_ORGID on PMS_ORG_REGISTER (ORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_PERMISSION...
create table PMS_PERMISSION
(
  id              NUMBER(10) not null,
  create_user     VARCHAR2(64) not null,
  create_time     TIMESTAMP(6) not null,
  editor_user     VARCHAR2(64),
  edit_time       TIMESTAMP(6),
  status          NUMBER(1) not null,
  remark          VARCHAR2(512),
  permission_name VARCHAR2(128) not null,
  menu_id         NUMBER(10) not null,
  permission      VARCHAR2(128) not null,
  permission_type NUMBER(1) not null,
  sort            NUMBER(4) not null,
  pause_msg       VARCHAR2(512),
  class_name      VARCHAR2(64)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_PERMISSION_PERMISSIONNAME on PMS_PERMISSION (PERMISSION_NAME)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_PERMISSION_SORT on PMS_PERMISSION (SORT)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_PERMISSION
  add constraint PK_PMS_PERMISSION primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_PERMISSION
  add constraint UK_PERMISSION_PERMISSION unique (PERMISSION)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_ROLE...
create table PMS_ROLE
(
  id            NUMBER(10) not null,
  status        NUMBER(1) not null,
  remark        VARCHAR2(512),
  type          NUMBER(1) not null,
  create_user   VARCHAR2(64) not null,
  create_time   TIMESTAMP(6) not null,
  editor_user   VARCHAR2(64),
  edit_time     TIMESTAMP(6),
  role_code     VARCHAR2(20) not null,
  role_name     VARCHAR2(64) not null,
  org_id        NUMBER(18) not null,
  assign_org_id NUMBER(18)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_ROLE_ORGI on PMS_ROLE (ORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_ROLE_ROLENAME on PMS_ROLE (ROLE_NAME)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_ROLE
  add constraint PK_PMS_ROLE primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_ROLE_OPERATOR...
create table PMS_ROLE_OPERATOR
(
  id          NUMBER(10) not null,
  create_user VARCHAR2(64) not null,
  create_time TIMESTAMP(6) not null,
  editor_user VARCHAR2(64),
  edit_time   TIMESTAMP(6),
  status      NUMBER(1) not null,
  remark      VARCHAR2(512),
  role_id     NUMBER(10) not null,
  operator_id NUMBER(10) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_ROLE_OPERATOR
  add constraint PK_PMS_ROLE_OPERATOR primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_ROLE_OPERATOR
  add constraint UK_ROLE_OPERATOR_RIDOROOID unique (ROLE_ID, OPERATOR_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_ROLE_PERMISSION...
create table PMS_ROLE_PERMISSION
(
  id            NUMBER(10) not null,
  create_user   VARCHAR2(64) not null,
  create_time   TIMESTAMP(6) not null,
  editor_user   VARCHAR2(64),
  edit_time     TIMESTAMP(6),
  status        NUMBER(1) not null,
  remark        VARCHAR2(512),
  role_id       NUMBER(10) not null,
  permission_id NUMBER(10) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_ROLE_PERMISSION
  add constraint PK_PMS_ROLE_PERMISSION primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_ROLE_PERMISSION
  add constraint UK_ROLE_OPERATOR_RIDOROPID unique (ROLE_ID, PERMISSION_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_SCAN_ORDER...
create table PMS_SCAN_ORDER
(
  trans_id            VARCHAR2(32) not null,
  org_id              NUMBER(18) not null,
  client_type         NUMBER(1) not null,
  mcode               VARCHAR2(32) not null,
  tcode               VARCHAR2(32) not null,
  merchant_order_id   VARCHAR2(64) not null,
  merchant_order_time TIMESTAMP(6) not null,
  order_type_id       NUMBER(10) not null,
  pay_channel_type    NUMBER(4) not null,
  clear_type          NUMBER(1) not null,
  clear_mcode_type    NUMBER(1) not null,
  trade_type          NUMBER(1) not null,
  trans_money         NUMBER(10) not null,
  fee_money           NUMBER(10) not null,
  fee_rate            NUMBER(6,5) not null,
  charge_amount       NUMBER(10) not null,
  ip                  VARCHAR2(64),
  client_info         VARCHAR2(512),
  remark              VARCHAR2(256),
  status              NUMBER(2) not null,
  channel_id          NUMBER(10) not null,
  bank_order_num      VARCHAR2(64) not null,
  qrcode_url          VARCHAR2(256),
  qrcode_img_url      VARCHAR2(256),
  auth_code           VARCHAR2(30),
  org_trans_id        VARCHAR2(32),
  third_order_num     VARCHAR2(64),
  bank_type           VARCHAR2(16),
  bank_bill_no        VARCHAR2(32),
  coupon_fee          VARCHAR2(10),
  refund_channel      VARCHAR2(16),
  card_type           NUMBER(1),
  opening_bank        VARCHAR2(32),
  create_time         TIMESTAMP(6) not null,
  create_long_time    NUMBER(16) not null,
  edit_time           TIMESTAMP(6),
  edit_long_time      NUMBER(16) not null,
  pay_date            TIMESTAMP(6),
  pay_long_time       NUMBER(16),
  merchant_id         VARCHAR2(32),
  terminal_id         VARCHAR2(32),
  son_mcode           VARCHAR2(32),
  req_code            VARCHAR2(10) not null,
  req_msg             VARCHAR2(200) not null,
  notify_url          VARCHAR2(256),
  notify_cnt          NUMBER(4) not null,
  notify_status       NUMBER(1) not null,
  callback_date       TIMESTAMP(6),
  callback_long_time  NUMBER(16),
  is_investig         NUMBER(1),
  marked_red          NUMBER(1),
  description         VARCHAR2(512),
  iss_status          NUMBER(1) not null,
  iss_req_code        VARCHAR2(10) not null,
  iss_req_msg         VARCHAR2(256) not null,
  revenue_fee_money   NUMBER(10),
  receivable_money    NUMBER(10),
  maori               NUMBER(10),
  other_param         VARCHAR2(1024)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_SCAN_ORDER_MCODE on PMS_SCAN_ORDER (MCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_SCAN_ORDER_MERCHANTORDERI on PMS_SCAN_ORDER (MERCHANT_ORDER_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_SCAN_ORDER_ORGID on PMS_SCAN_ORDER (ORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_SCAN_ORDER_TCODE on PMS_SCAN_ORDER (TCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_SCAN_ORDER
  add constraint PK_PMS_SCAN_ORDER primary key (TRANS_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_TERMINAL...
create table PMS_TERMINAL
(
  tcode         VARCHAR2(32) not null,
  mcode         VARCHAR2(32) not null,
  main_key      VARCHAR2(32) not null,
  pin_key       VARCHAR2(32) not null,
  track_key     VARCHAR2(32) not null,
  callback_key  VARCHAR2(32) not null,
  sensitive_key VARCHAR2(32) not null,
  active        NUMBER(1) not null,
  deleted       NUMBER(1) not null,
  role_id       NUMBER(10) not null,
  create_user   VARCHAR2(64) not null,
  create_time   TIMESTAMP(6) not null,
  editor_user   VARCHAR2(64),
  edit_time     TIMESTAMP(6),
  channel_id    NUMBER(10) not null,
  status        NUMBER(1) not null,
  description   VARCHAR2(512),
  client_type   NUMBER(1) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_PMS_TERMINAL_MCODE on PMS_TERMINAL (MCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_TERMINAL
  add constraint PK_PMS_TERMINAL primary key (TCODE)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_TERMINAL_CHANNEL...
create table PMS_TERMINAL_CHANNEL
(
  terminal_id NUMBER(10) not null,
  channel_id  NUMBER(10) not null,
  create_user VARCHAR2(64) not null,
  create_time TIMESTAMP(6) not null,
  editor_user VARCHAR2(64),
  edit_time   TIMESTAMP(6),
  status      NUMBER(1) not null,
  remark      VARCHAR2(512)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_TERMINAL_CHANNEL
  add constraint UK_TERMINAL_CHANNEL_TIDORORGID primary key (TERMINAL_ID, CHANNEL_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_TERMINAL_C_INTO...
create table PMS_TERMINAL_C_INTO
(
  tc_into_id       NUMBER(18) not null,
  org_id           NUMBER(18) not null,
  mcode            VARCHAR2(32) not null,
  tcode            VARCHAR2(32) not null,
  mer_no           VARCHAR2(30),
  bank_mcode       VARCHAR2(30),
  bank_tcode       VARCHAR2(30),
  create_user      VARCHAR2(64) not null,
  create_time      TIMESTAMP(6) not null,
  editor_user      VARCHAR2(64),
  edit_time        TIMESTAMP(6),
  status           NUMBER(1) not null,
  role_id          NUMBER(1) not null,
  org_no           VARCHAR2(30),
  user_name        VARCHAR2(60) not null,
  simple_money     VARCHAR2(20) not null,
  day_money        VARCHAR2(20) not null,
  relate           VARCHAR2(10) not null,
  tmk              VARCHAR2(32),
  tmkck            VARCHAR2(16),
  req_code         VARCHAR2(10),
  req_msg          VARCHAR2(254),
  mcc              VARCHAR2(10),
  group_no         VARCHAR2(10),
  channel_id       NUMBER(10) not null,
  pay_channel_type NUMBER(4) not null,
  clear_code_type  NUMBER(1) not null,
  invoke_pattern   NUMBER(1) not null,
  is_default       NUMBER(1) default 2 not null,
  priority_level   NUMBER(2) not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_TERMINAL_C_INTO_ on PMS_TERMINAL_C_INTO (TCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_TERMINAL_C_INTO_BANKTCODE on PMS_TERMINAL_C_INTO (BANK_TCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_TERMINAL_C_INTO_MCODE on PMS_TERMINAL_C_INTO (MCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_TERMINAL_C_INTO_ORGID on PMS_TERMINAL_C_INTO (ORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PMS_TERMINAL_C_INTO
  add constraint PK_PMS_TERMINAL_C_INTO primary key (TC_INTO_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_TERMINAL_C_INTO_FEERATE...
create table PMS_TERMINAL_C_INTO_FEERATE
(
  tc_into_id       NUMBER(18) not null,
  mcode            VARCHAR2(32) not null,
  tcode            VARCHAR2(32) not null,
  pay_channel_type NUMBER(4) not null,
  fee_rate         NUMBER(6,6) not null,
  pay_fee          NUMBER(10) not null,
  fd_max_fee       NUMBER(10) not null,
  fd_min_fee       NUMBER(10) not null,
  debit_fee_rate   NUMBER(6,6) not null,
  debit_fd_max_fee NUMBER(10) not null,
  debit_fd_min_fee NUMBER(10) not null,
  d0_fj_rate       NUMBER(6,5) not null,
  d0_fj_fee        NUMBER(10) not null,
  create_user      VARCHAR2(64) not null,
  create_time      TIMESTAMP(6) not null,
  editor_user      VARCHAR2(64),
  edit_time        TIMESTAMP(6),
  status           NUMBER(1) not null,
  remark           VARCHAR2(512)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_TERMINAL_C_I_FR_MCODE on PMS_TERMINAL_C_INTO_FEERATE (MCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_TERMINAL_C_I_FR_TCODE on PMS_TERMINAL_C_INTO_FEERATE (TCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PMS_TERMINAL_C_INTO_FEERATE
  add constraint PK_PMS_TERMINAL_C_I_FR primary key (TC_INTO_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_TERMINAL_FEERATE...
create table PMS_TERMINAL_FEERATE
(
  tcode            VARCHAR2(32) not null,
  mcode            VARCHAR2(32) not null,
  pay_channel_type NUMBER(4) not null,
  fee_rate         NUMBER(6,6) not null,
  pay_fee          NUMBER(10) not null,
  fd_max_fee       NUMBER(10) default -100,
  fd_min_fee       NUMBER(10) default -100,
  debit_fee_rate   NUMBER(6,6) not null,
  debit_fd_max_fee NUMBER(10) default -100,
  debit_fd_min_fee NUMBER(10) default -100,
  d0_fj_rate       NUMBER(6,5) not null,
  d0_fj_fee        NUMBER(10) default -100,
  create_user      VARCHAR2(64) not null,
  create_time      TIMESTAMP(6) not null,
  editor_user      VARCHAR2(64),
  edit_time        TIMESTAMP(6),
  status           NUMBER(1) not null,
  remark           VARCHAR2(512)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_TERMINAL_FR_MCODE on PMS_TERMINAL_FEERATE (MCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_TERMINAL_FEERATE
  add constraint UK_TERMINAL_FR_TCODEORPCTYPE unique (TCODE, PAY_CHANNEL_TYPE)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Creating PMS_TERMINAL_MONEY...
create table PMS_TERMINAL_MONEY
(
  tcode        VARCHAR2(32) not null,
  mcode        VARCHAR2(32) not null,
  money        NUMBER(18) default 0 not null,
  avail_money  NUMBER(18) default 0 not null,
  frozen_money NUMBER(18) default 0 not null
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_TERMINAL_MONEY_MCODE on PMS_TERMINAL_MONEY (MCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PMS_TERMINAL_MONEY
  add constraint UK_TERMINAL_MONEY_TCODE unique (TCODE)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_TERMINAL_PRIVILEGES...
create table PMS_TERMINAL_PRIVILEGES
(
  id                 NUMBER(10) not null,
  pay_channel_type   NUMBER(4) not null,
  name               VARCHAR2(64) not null,
  function_key       VARCHAR2(32) not null,
  description        VARCHAR2(512),
  create_user        VARCHAR2(64) not null,
  create_time        TIMESTAMP(6) not null,
  editor_user        VARCHAR2(64),
  edit_time          TIMESTAMP(6),
  status             NUMBER(1) not null,
  deleted            NUMBER(1) not null,
  tchannel_id        NUMBER(10) not null,
  pay_tchannel_id    NUMBER(10) not null,
  pass_msg           VARCHAR2(512),
  pause_msg          VARCHAR2(512),
  min_trans_amt      NUMBER(10) not null,
  max_trans_amt      NUMBER(10) not null,
  day_all_amt        NUMBER(10,2) not null,
  day_cnt            NUMBER(10) not null,
  limit_trans_msg    VARCHAR2(1024),
  clear_mcode_type   NUMBER(1) not null,
  operate_start_time VARCHAR2(8) not null,
  operate_end_time   VARCHAR2(8) not null,
  no_operate_msg     VARCHAR2(512)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_TERMINAL_P_PAYCHANNELTYPE on PMS_TERMINAL_PRIVILEGES (PAY_CHANNEL_TYPE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_TERMINAL_P_PAYTCHANNELID on PMS_TERMINAL_PRIVILEGES (PAY_TCHANNEL_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_TERMINAL_P_TCHANNELID on PMS_TERMINAL_PRIVILEGES (TCHANNEL_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PMS_TERMINAL_PRIVILEGES
  add constraint PK_PMS_TERMINAL_PRIVILEGES primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_TRANS_INVESTIG...
create table PMS_TRANS_INVESTIG
(
  investig_id      NUMBER(18) not null,
  pay_channel_type NUMBER(4) not null,
  trans_id         VARCHAR2(32) not null,
  org_id           NUMBER(18) not null,
  org_name         VARCHAR2(60) not null,
  channel_id       NUMBER(10) not null,
  channel_name     VARCHAR2(64) not null,
  mcode            VARCHAR2(32) not null,
  tcode            VARCHAR2(32) not null,
  order_type_id    NUMBER(18) not null,
  trans_money      NUMBER(15,2) not null,
  bank_card        VARCHAR2(30) not null,
  type             NUMBER(1) not null,
  status           NUMBER(1) not null,
  order_date       TIMESTAMP(6) not null,
  create_user      VARCHAR2(64) not null,
  create_time      TIMESTAMP(6) not null,
  editor_user      VARCHAR2(64),
  edit_time        TIMESTAMP(6),
  investig_desc    VARCHAR2(600),
  update_desc      VARCHAR2(600)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_TRANS_INVESTIG_MCODE on PMS_TRANS_INVESTIG (MCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_TRANS_INVESTIG_ORGID on PMS_TRANS_INVESTIG (ORG_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_TRANS_INVESTIG_TCODE on PMS_TRANS_INVESTIG (TCODE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
create index I_TRANS_INVESTIG_TRANSID on PMS_TRANS_INVESTIG (TRANS_ID)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PMS_TRANS_INVESTIG
  add constraint PK_PMS_TRANS_INVESTIG primary key (INVESTIG_ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_TRANS_REFUSECARD...
create table PMS_TRANS_REFUSECARD
(
  id           NUMBER(10) not null,
  bank_card    VARCHAR2(32) not null,
  type         NUMBER(1) not null,
  opening_bank VARCHAR2(64),
  card_name    VARCHAR2(64),
  create_date  TIMESTAMP(6) not null,
  description  VARCHAR2(256)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_TRANS_REFUSECARD_BANKCARD on PMS_TRANS_REFUSECARD (BANK_CARD)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PMS_TRANS_REFUSECARD
  add constraint PK_PMS_TRANS_REFUSECARD primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating PMS_WORDBOOK...
create table PMS_WORDBOOK
(
  id          NUMBER(18) not null,
  type        VARCHAR2(64) not null,
  name        VARCHAR2(128) not null,
  value1      VARCHAR2(30) not null,
  value2      VARCHAR2(30) not null,
  status      NUMBER(1) not null,
  create_user VARCHAR2(20) not null,
  create_time TIMESTAMP(6) not null,
  editor_user VARCHAR2(20),
  edit_time   TIMESTAMP(6),
  remark      VARCHAR2(300)
)
tablespace POLYMER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_WORDBOOK_NAME on PMS_WORDBOOK (NAME)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index I_WORDBOOK_TYPE on PMS_WORDBOOK (TYPE)
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table PMS_WORDBOOK
  add constraint PK_PMS_WORDBOOK primary key (ID)
  using index 
  tablespace POLYMER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Disabling triggers for CARD_ACCOUNT_CHECK_BATCH...
alter table CARD_ACCOUNT_CHECK_BATCH disable all triggers;
prompt Disabling triggers for CARD_ACCOUNT_CHECK_BILL...
alter table CARD_ACCOUNT_CHECK_BILL disable all triggers;
prompt Disabling triggers for CARD_ACCOUNT_CHECK_MISTAKE...
alter table CARD_ACCOUNT_CHECK_MISTAKE disable all triggers;
prompt Disabling triggers for CARD_ACCOUNT_CHECK_MISTAKE_P...
alter table CARD_ACCOUNT_CHECK_MISTAKE_P disable all triggers;
prompt Disabling triggers for PMS_CARD_ORDER...
alter table PMS_CARD_ORDER disable all triggers;
prompt Disabling triggers for PMS_CARD_ORDER_TEMP...
alter table PMS_CARD_ORDER_TEMP disable all triggers;
prompt Disabling triggers for PMS_CHANNEL...
alter table PMS_CHANNEL disable all triggers;
prompt Disabling triggers for PMS_CHANNEL_M...
alter table PMS_CHANNEL_M disable all triggers;
prompt Disabling triggers for PMS_CHANNEL_ORG...
alter table PMS_CHANNEL_ORG disable all triggers;
prompt Disabling triggers for PMS_CHANNEL_TYPE...
alter table PMS_CHANNEL_TYPE disable all triggers;
prompt Disabling triggers for PMS_ERROR_CODE...
alter table PMS_ERROR_CODE disable all triggers;
prompt Disabling triggers for PMS_FC_T_TRANSLIMIT...
alter table PMS_FC_T_TRANSLIMIT disable all triggers;
prompt Disabling triggers for PMS_IDBLACKLIST...
alter table PMS_IDBLACKLIST disable all triggers;
prompt Disabling triggers for PMS_ISS_CLEAR...
alter table PMS_ISS_CLEAR disable all triggers;
prompt Disabling triggers for PMS_ISS_ORDER...
alter table PMS_ISS_ORDER disable all triggers;
prompt Disabling triggers for PMS_ISS_ORDER_LOG...
alter table PMS_ISS_ORDER_LOG disable all triggers;
prompt Disabling triggers for PMS_MENU...
alter table PMS_MENU disable all triggers;
prompt Disabling triggers for PMS_MENU_ROLE...
alter table PMS_MENU_ROLE disable all triggers;
prompt Disabling triggers for PMS_MERCHANT...
alter table PMS_MERCHANT disable all triggers;
prompt Disabling triggers for PMS_MERCHANT_CLEANING...
alter table PMS_MERCHANT_CLEANING disable all triggers;
prompt Disabling triggers for PMS_MERCHANT_REGISTER...
alter table PMS_MERCHANT_REGISTER disable all triggers;
prompt Disabling triggers for PMS_OPERATOR...
alter table PMS_OPERATOR disable all triggers;
prompt Disabling triggers for PMS_OPERATOR_LOG...
alter table PMS_OPERATOR_LOG disable all triggers;
prompt Disabling triggers for PMS_ORGANIZATION...
alter table PMS_ORGANIZATION disable all triggers;
prompt Disabling triggers for PMS_ORG_CHANNEL...
alter table PMS_ORG_CHANNEL disable all triggers;
prompt Disabling triggers for PMS_ORG_CLEANING...
alter table PMS_ORG_CLEANING disable all triggers;
prompt Disabling triggers for PMS_ORG_CONTRACT...
alter table PMS_ORG_CONTRACT disable all triggers;
prompt Disabling triggers for PMS_ORG_REGISTER...
alter table PMS_ORG_REGISTER disable all triggers;
prompt Disabling triggers for PMS_PERMISSION...
alter table PMS_PERMISSION disable all triggers;
prompt Disabling triggers for PMS_ROLE...
alter table PMS_ROLE disable all triggers;
prompt Disabling triggers for PMS_ROLE_OPERATOR...
alter table PMS_ROLE_OPERATOR disable all triggers;
prompt Disabling triggers for PMS_ROLE_PERMISSION...
alter table PMS_ROLE_PERMISSION disable all triggers;
prompt Disabling triggers for PMS_SCAN_ORDER...
alter table PMS_SCAN_ORDER disable all triggers;
prompt Disabling triggers for PMS_TERMINAL...
alter table PMS_TERMINAL disable all triggers;
prompt Disabling triggers for PMS_TERMINAL_CHANNEL...
alter table PMS_TERMINAL_CHANNEL disable all triggers;
prompt Disabling triggers for PMS_TERMINAL_C_INTO...
alter table PMS_TERMINAL_C_INTO disable all triggers;
prompt Disabling triggers for PMS_TERMINAL_C_INTO_FEERATE...
alter table PMS_TERMINAL_C_INTO_FEERATE disable all triggers;
prompt Disabling triggers for PMS_TERMINAL_FEERATE...
alter table PMS_TERMINAL_FEERATE disable all triggers;
prompt Disabling triggers for PMS_TERMINAL_MONEY...
alter table PMS_TERMINAL_MONEY disable all triggers;
prompt Disabling triggers for PMS_TERMINAL_PRIVILEGES...
alter table PMS_TERMINAL_PRIVILEGES disable all triggers;
prompt Disabling triggers for PMS_TRANS_INVESTIG...
alter table PMS_TRANS_INVESTIG disable all triggers;
prompt Disabling triggers for PMS_TRANS_REFUSECARD...
alter table PMS_TRANS_REFUSECARD disable all triggers;
prompt Disabling triggers for PMS_WORDBOOK...
alter table PMS_WORDBOOK disable all triggers;
prompt Deleting PMS_WORDBOOK...
delete from PMS_WORDBOOK;
commit;
prompt Deleting PMS_TRANS_REFUSECARD...
delete from PMS_TRANS_REFUSECARD;
commit;
prompt Deleting PMS_TRANS_INVESTIG...
delete from PMS_TRANS_INVESTIG;
commit;
prompt Deleting PMS_TERMINAL_PRIVILEGES...
delete from PMS_TERMINAL_PRIVILEGES;
commit;
prompt Deleting PMS_TERMINAL_MONEY...
delete from PMS_TERMINAL_MONEY;
commit;
prompt Deleting PMS_TERMINAL_FEERATE...
delete from PMS_TERMINAL_FEERATE;
commit;
prompt Deleting PMS_TERMINAL_C_INTO_FEERATE...
delete from PMS_TERMINAL_C_INTO_FEERATE;
commit;
prompt Deleting PMS_TERMINAL_C_INTO...
delete from PMS_TERMINAL_C_INTO;
commit;
prompt Deleting PMS_TERMINAL_CHANNEL...
delete from PMS_TERMINAL_CHANNEL;
commit;
prompt Deleting PMS_TERMINAL...
delete from PMS_TERMINAL;
commit;
prompt Deleting PMS_SCAN_ORDER...
delete from PMS_SCAN_ORDER;
commit;
prompt Deleting PMS_ROLE_PERMISSION...
delete from PMS_ROLE_PERMISSION;
commit;
prompt Deleting PMS_ROLE_OPERATOR...
delete from PMS_ROLE_OPERATOR;
commit;
prompt Deleting PMS_ROLE...
delete from PMS_ROLE;
commit;
prompt Deleting PMS_PERMISSION...
delete from PMS_PERMISSION;
commit;
prompt Deleting PMS_ORG_REGISTER...
delete from PMS_ORG_REGISTER;
commit;
prompt Deleting PMS_ORG_CONTRACT...
delete from PMS_ORG_CONTRACT;
commit;
prompt Deleting PMS_ORG_CLEANING...
delete from PMS_ORG_CLEANING;
commit;
prompt Deleting PMS_ORG_CHANNEL...
delete from PMS_ORG_CHANNEL;
commit;
prompt Deleting PMS_ORGANIZATION...
delete from PMS_ORGANIZATION;
commit;
prompt Deleting PMS_OPERATOR_LOG...
delete from PMS_OPERATOR_LOG;
commit;
prompt Deleting PMS_OPERATOR...
delete from PMS_OPERATOR;
commit;
prompt Deleting PMS_MERCHANT_REGISTER...
delete from PMS_MERCHANT_REGISTER;
commit;
prompt Deleting PMS_MERCHANT_CLEANING...
delete from PMS_MERCHANT_CLEANING;
commit;
prompt Deleting PMS_MERCHANT...
delete from PMS_MERCHANT;
commit;
prompt Deleting PMS_MENU_ROLE...
delete from PMS_MENU_ROLE;
commit;
prompt Deleting PMS_MENU...
delete from PMS_MENU;
commit;
prompt Deleting PMS_ISS_ORDER_LOG...
delete from PMS_ISS_ORDER_LOG;
commit;
prompt Deleting PMS_ISS_ORDER...
delete from PMS_ISS_ORDER;
commit;
prompt Deleting PMS_ISS_CLEAR...
delete from PMS_ISS_CLEAR;
commit;
prompt Deleting PMS_IDBLACKLIST...
delete from PMS_IDBLACKLIST;
commit;
prompt Deleting PMS_FC_T_TRANSLIMIT...
delete from PMS_FC_T_TRANSLIMIT;
commit;
prompt Deleting PMS_ERROR_CODE...
delete from PMS_ERROR_CODE;
commit;
prompt Deleting PMS_CHANNEL_TYPE...
delete from PMS_CHANNEL_TYPE;
commit;
prompt Deleting PMS_CHANNEL_ORG...
delete from PMS_CHANNEL_ORG;
commit;
prompt Deleting PMS_CHANNEL_M...
delete from PMS_CHANNEL_M;
commit;
prompt Deleting PMS_CHANNEL...
delete from PMS_CHANNEL;
commit;
prompt Deleting PMS_CARD_ORDER_TEMP...
delete from PMS_CARD_ORDER_TEMP;
commit;
prompt Deleting PMS_CARD_ORDER...
delete from PMS_CARD_ORDER;
commit;
prompt Deleting CARD_ACCOUNT_CHECK_MISTAKE_P...
delete from CARD_ACCOUNT_CHECK_MISTAKE_P;
commit;
prompt Deleting CARD_ACCOUNT_CHECK_MISTAKE...
delete from CARD_ACCOUNT_CHECK_MISTAKE;
commit;
prompt Deleting CARD_ACCOUNT_CHECK_BILL...
delete from CARD_ACCOUNT_CHECK_BILL;
commit;
prompt Deleting CARD_ACCOUNT_CHECK_BATCH...
delete from CARD_ACCOUNT_CHECK_BATCH;
commit;
prompt Loading CARD_ACCOUNT_CHECK_BATCH...
insert into CARD_ACCOUNT_CHECK_BATCH (id, create_user, create_time, editor_user, edit_time, status, batch_no, get_type, channel_id, bill_date, file_path, bill_type, req_code, req_msg, remark)
values (4, 'system', to_timestamp('07-08-2017 12:20:25.843000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 3, '200020170807', 2, 1100, to_timestamp('06-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 2001, null, null, null);
insert into CARD_ACCOUNT_CHECK_BATCH (id, create_user, create_time, editor_user, edit_time, status, batch_no, get_type, channel_id, bill_date, file_path, bill_type, req_code, req_msg, remark)
values (2, 'system', to_timestamp('31-07-2017 14:31:39.932000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 3, '200020170731', 2, 1100, to_timestamp('30-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 2001, null, null, null);
commit;
prompt 2 records loaded
prompt Loading CARD_ACCOUNT_CHECK_BILL...
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('27-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412000010', '2017072414125578', 100000, 200, '1991201707241412000008', 1, '201707241412000871', to_timestamp('27-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('27-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412000011', '2017072414125581', 200000, 400, '1991201707241412000006', 1, '201707241412001871', to_timestamp('27-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 2);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('27-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 2001, 2001, '1991201707241412000112', '2017072414125571', 100001, 200, '1991201707241412000178', 1, '201707241412010872', to_timestamp('27-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 3);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170807', to_timestamp('06-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201708061155000001', '2017072414225578', 100000, 200, '6222020200113677515', 0, '201708061155000001', to_timestamp('07-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 14);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170807', to_timestamp('06-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201708061155000002', '2017072414225581', 200000, 400, '6222020200113677115', 1, '201708061155000002', to_timestamp('07-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 15);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170807', to_timestamp('06-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201708061155000003', '2017072414225582', 200000, 400, '6222020200113677115', 1, '201708061155000003', to_timestamp('07-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 16);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170807', to_timestamp('06-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201708061155000004', '2017072414225584', 200000, 400, '6222020200113677115', 1, '201708061155000004', to_timestamp('07-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 17);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170807', to_timestamp('06-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201708061155000005', '2017072414225585', 200000, 400, '6222020200113677115', 1, '201708061155000005', to_timestamp('07-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 18);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('26-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412000001', '2017072414125551', 100000, 200, '1991201707241412000005', 1, '201707241412000001', to_timestamp('14-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 4);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('26-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412000002', '2017072414125559', 200000, 400, '1991201707241412000004', 1, '201707241412001111', to_timestamp('14-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 5);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('30-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412000113', '2017072414225578', 200000, 400, '1991201707241412000003', 1, '201707301412000871', to_timestamp('30-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 6);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('30-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412010014', '2017072414225581', 100001, 200, '1991201707241412010078', 1, '201707301412001871', to_timestamp('30-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 7);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('23-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412000003', '2017072414125553', 100000, 200, '1991201707241412010077', 1, '201707241412000001', to_timestamp('23-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 8);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('23-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412000004', '20170724141255619', 200000, 400, '1991201707241412000002', 1, '201707241412001111', to_timestamp('23-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 9);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('24-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412000005', '2017072414125551', 100000, 200, '1991201707241412000001', 1, '201707241412000005', to_timestamp('24-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 10);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('24-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412000006', '2017072414125559', 200000, 400, '1991201707241412000078', 1, '201707241412001116', to_timestamp('24-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 11);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('25-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412000008', '2017072414125566', 100000, 200, '1991201707241412000077', 1, '201707241412000061', to_timestamp('14-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 12);
insert into CARD_ACCOUNT_CHECK_BILL (batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, trans_money, fee_money, account_number, status, bank_bill_no, pay_date, remark, id)
values ('200020170731', to_timestamp('25-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 2001, 1001, 1100, '1991201707241412000009', '2017072414125569', 200000, 400, '1991201707241412000009', 1, '201707241412001161', to_timestamp('14-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 13);
commit;
prompt 18 records loaded
prompt Loading CARD_ACCOUNT_CHECK_MISTAKE...
insert into CARD_ACCOUNT_CHECK_MISTAKE (id, batch_no, bill_date, mcode, merchant_order_id, merchant_order_time, trans_no, trade_status, trade_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, bank_fee, bank_trade_status, pay_date, account_number, error_type, dispose_status, dispose_result, remark, trans_money, refund_money, trans_fee_money, bank_money, bank_refund_money)
values (8, '200020170731', to_timestamp('30-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '138458170611098', '13845817061109810000016', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), '10000015', 1, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1100, '1991201707241412010014', null, 200, 1, to_timestamp('30-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 6, null, null, null, 100000, null, 200, null, null);
commit;
prompt 1 records loaded
prompt Loading CARD_ACCOUNT_CHECK_MISTAKE_P...
insert into CARD_ACCOUNT_CHECK_MISTAKE_P (id, batch_no, bill_date, mcode, merchant_order_id, trans_no, trade_status, trade_time, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, bank_trade_status, pay_date, account_number, error_type, dispose_status, dispose_result, remark, trans_money, refund_money, trans_fee_money, bank_money, bank_refund_money, bank_fee)
values (7, '200020170810', to_timestamp('10-08-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '138458170611098', '13845817061109810000017', '10000016', 1, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 2001, 1100, '1991201707241412010015', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into CARD_ACCOUNT_CHECK_MISTAKE_P (id, batch_no, bill_date, mcode, merchant_order_id, trans_no, trade_status, trade_time, merchant_order_time, order_type, pay_channel_type, channel_id, bank_order_num, third_order_num, bank_trade_status, pay_date, account_number, error_type, dispose_status, dispose_result, remark, trans_money, refund_money, trans_fee_money, bank_money, bank_refund_money, bank_fee)
values (8, '200020170731', to_timestamp('30-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '138458170611098', '13845817061109810000016', '10000015', 1, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1100, '1991201707241412010014', null, 1, to_timestamp('30-07-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 3, null, null, null, 100000, null, 200, 100001, null, 200);
commit;
prompt 2 records loaded
prompt Loading PMS_CARD_ORDER...
insert into PMS_CARD_ORDER (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000011', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000011', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 2, 1000000, 500, .05, 999500, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1, '1', null, null, null, null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 2, '111', '1111', null, null, null, null);
commit;
prompt 1 records loaded
prompt Loading PMS_CARD_ORDER_TEMP...
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000021', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000022', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 100000, 200, .02, 200, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412000008', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000020', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000021', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 200000, 400, .02, 400, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412000006', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000019', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000020', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 100000, 200, .02, 200, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412000005', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000018', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000019', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 200000, 400, .02, 400, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412000004', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000017', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000018', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 100000, 200, .02, 200, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412000003', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000016', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000017', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 200000, 400, .02, 400, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412010015', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000015', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000016', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 100000, 200, .02, 200, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412010014', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000014', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000015', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 200000, 400, .02, 400, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412000002', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000013', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000014', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 100000, 200, .02, 200, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412000001', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000012', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000013', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 200000, 400, .02, 400, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412000011', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000011', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000012', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 100000, 200, .02, 200, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412000010', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000022', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000023', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 200000, 400, .02, 400, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412000009', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000023', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000024', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 100001, 200, .02, 200, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 2001, '1', null, null, '1991201707241412000112', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
insert into PMS_CARD_ORDER_TEMP (trans_id, org_id, role_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trans_money, fee_money, fee_rate, charge_amount, account_number, track2_data, track3_data, pin, ic_card_yu, ip, client_info, remark, card_type_n, status, signature_path, create_time, create_long_time, edit_time, edit_long_time, channel_id, merchant_id, terminal_id, son_mcode, bank_order_num, req_code, req_msg, card_type, expire_date, batch_id, authorization_code, issue_bank, bank_ref, search_id, real_ticket, notify_url, notify_cnt, notify_status, revoc_send_id, org_trans_id, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('10000024', 100049, 1, 2, '138458170611098', '600001', '13845817061109810000025', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2001, 2001, 1, 1, 200000, 400, .02, 400, '62220002001134577', '11111', null, '11111', null, null, null, null, 1, 1, null, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498289899, 1100, '1', null, null, '1991201707241412000113', null, null, 2, null, null, null, null, null, null, null, null, 1, 1, '0', null, 0, 0, null, 1, '1', '1', null, null, null, null);
commit;
prompt 14 records loaded
prompt Loading PMS_CHANNEL...
insert into PMS_CHANNEL (channel_id, corg_id, pay_channel_type, fee_rate, fd_max_fee, fd_min_fee, clear_fee, status, description, cost_type, param_type, main_key, url, port, public_key, private_key, sign_type, is_record_trans_amt, other_param, channel_name, pay_type)
values (6, 2, 1003, 1, 1, 1, 1, 1, '1', 1, 1, '1', '1', 1, '1', '1', 1, 1, '1', 'test1111111', 1);
insert into PMS_CHANNEL (channel_id, corg_id, pay_channel_type, fee_rate, fd_max_fee, fd_min_fee, clear_fee, status, description, cost_type, param_type, main_key, url, port, public_key, private_key, sign_type, is_record_trans_amt, other_param, channel_name, pay_type)
values (1, 1, 1001, .0025, 2000, 1000, 2, 1, null, 1, 2, 'a', 'http://8583', 80, null, null, 1, 1, null, '测试通道', null);
insert into PMS_CHANNEL (channel_id, corg_id, pay_channel_type, fee_rate, fd_max_fee, fd_min_fee, clear_fee, status, description, cost_type, param_type, main_key, url, port, public_key, private_key, sign_type, is_record_trans_amt, other_param, channel_name, pay_type)
values (5, 2, 1001, .001, 100, 1, 1, 1, 'XXXXXXXXXXX', 1, 1, 'test', 'http://xxx', 80, 'test', 'test', 1, 1, 'xx', '威富通微信通道', 1);
commit;
prompt 3 records loaded
prompt Loading PMS_CHANNEL_M...
insert into PMS_CHANNEL_M (channel_m_id, channel_id, terminal_id, merchant_id, other_param, role_id, status, fee_rate, fd_max_fee, fd_min_fee, single_limit, total_limit, use_time, description, usetotal, province, province_code, city, city_code, mcc, main_key, public_key, private_key, sign_type)
values (3, 1, '555', '6666', 'test1', 1, 2, .02, 1000, 1, 100000, 1000000, null, 'test', null, '北京市', 1, '北京市', 1000, 'mvcvc', '1111111', '222222222', '33333333', 1);
commit;
prompt 1 records loaded
prompt Loading PMS_CHANNEL_ORG...
insert into PMS_CHANNEL_ORG (corg_id, name, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, status, remark, create_user, create_time, editor_user, edit_time)
values (2, '威富通支付服务有限公司', 1, 1, '1', '13439915863', '010-8888888', 'test', '1000000000000000', '100000', 'test@.com', 'test', 1, 'tesst', 'admin', to_timestamp('17-06-2017 16:31:25.411000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_ORG (corg_id, name, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, status, remark, create_user, create_time, editor_user, edit_time)
values (3, 'test', 1, 1, '111', '111', '11', '111', '11', '11', '11', '11', 1, '111', 'admin', to_timestamp('17-06-2017 18:13:05.578000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_ORG (corg_id, name, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, status, remark, create_user, create_time, editor_user, edit_time)
values (1, '北京中亿支付', 1, null, null, '13752149424', null, null, null, null, null, 'admin', 1, '测试渠道', 'wuhp', to_timestamp('14-06-2017 04:56:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_ORG (corg_id, name, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, status, remark, create_user, create_time, editor_user, edit_time)
values (5, '高汇通', 1, 1, '111', '111', '11', '111', '11', '11', '11', '11', 1, '111', 'admin', to_timestamp('19-06-2017 13:42:56.198000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_ORG (corg_id, name, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, status, remark, create_user, create_time, editor_user, edit_time)
values (6, '银联商务有限公司', 11, 1, '1111', '1113334234', '113241', '1112314', '11', '11', '11', '11', 1, '111', 'admin', to_timestamp('19-06-2017 13:43:50.041000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_ORG (corg_id, name, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, status, remark, create_user, create_time, editor_user, edit_time)
values (7, '北京高汇通商业管理有限公司', 1, 1, '111', '111', '11', '111', '11', '11', '11', '11', 1, '111', 'admin', to_timestamp('19-06-2017 13:45:43.283000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_ORG (corg_id, name, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, status, remark, create_user, create_time, editor_user, edit_time)
values (8, '支付宝', 1, 1, '111', '111', '11', '111', '11', '11', '11', '11', 1, '111', 'admin', to_timestamp('19-06-2017 13:48:24.779000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_ORG (corg_id, name, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, status, remark, create_user, create_time, editor_user, edit_time)
values (9, '深圳市财付通科技有限公司', 11, 1, '1111', '1113334234', '113241', '1112314', '11', '11', '11', '11', 1, '111', 'admin', to_timestamp('19-06-2017 13:49:03.487000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_ORG (corg_id, name, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, status, remark, create_user, create_time, editor_user, edit_time)
values (10, '快钱支付', 1, 1, '111', '111', '11', '111', '11', '11', '11', '11', 1, '111', 'admin', to_timestamp('19-06-2017 13:50:49.465000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_ORG (corg_id, name, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, status, remark, create_user, create_time, editor_user, edit_time)
values (4, 'test1212', 11, 1, '1111', '1113334234', '113241', '1112314', '11', '11', '11', '11', 1, '111', 'admin', to_timestamp('17-06-2017 18:21:57.523000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 10 records loaded
prompt Loading PMS_CHANNEL_TYPE...
insert into PMS_CHANNEL_TYPE (pay_channel_type, name, remark, create_user, create_time, editor_user, edit_time)
values (1001, '微信支付', '1', 'admin', to_timestamp('12-06-2017 09:31:40.907000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_TYPE (pay_channel_type, name, remark, create_user, create_time, editor_user, edit_time)
values (1002, '支付宝', '1', 'admin', to_timestamp('12-06-2017 09:31:40.907000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_TYPE (pay_channel_type, name, remark, create_user, create_time, editor_user, edit_time)
values (1003, '银联钱包', '1', 'admin', to_timestamp('12-06-2017 09:31:40.907000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_TYPE (pay_channel_type, name, remark, create_user, create_time, editor_user, edit_time)
values (1004, 'QQ钱包', '1', 'admin', to_timestamp('12-06-2017 09:31:40.907000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_CHANNEL_TYPE (pay_channel_type, name, remark, create_user, create_time, editor_user, edit_time)
values (2001, '银行卡刷卡', '1', 'admin', to_timestamp('12-06-2017 09:31:40.907000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 5 records loaded
prompt Loading PMS_ERROR_CODE...
insert into PMS_ERROR_CODE (id, code, type, remark, display_desc, create_user, create_time, editor_user, edit_time)
values (7, 'TEST3333', 1, 'TEST3333', 'TEST3333', 'test', to_timestamp('24-06-2017 17:05:44.559000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into PMS_ERROR_CODE (id, code, type, remark, display_desc, create_user, create_time, editor_user, edit_time)
values (3, 'test2', 1, 'test5111222', 'tes3', null, null, 'admin', to_timestamp('22-06-2017 12:14:52.012000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into PMS_ERROR_CODE (id, code, type, remark, display_desc, create_user, create_time, editor_user, edit_time)
values (4, 'test3', 1, 'test3', 'test3', 'admin', to_timestamp('22-06-2017 12:15:08.268000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 3 records loaded
prompt Loading PMS_FC_T_TRANSLIMIT...
insert into PMS_FC_T_TRANSLIMIT (id, mcode, tcode, function_key, limit_type, day_all_amt, day_cnt, day_min_amt, day_max_amt, day_card_all_amt, day_card_cnt, status)
values (1, '138458170611001', '600001', 'aaaaaaaa', 1, 88888, 3, 1000, 10000, 50000, 0, 1);
insert into PMS_FC_T_TRANSLIMIT (id, mcode, tcode, function_key, limit_type, day_all_amt, day_cnt, day_min_amt, day_max_amt, day_card_all_amt, day_card_cnt, status)
values (2, '138458170611074', '600004', 'bbbbbbbbbb', 1, 0, 3, 500, 500000, 3500000, 8, 1);
commit;
prompt 2 records loaded
prompt Loading PMS_IDBLACKLIST...
prompt Table is empty
prompt Loading PMS_ISS_CLEAR...
prompt Table is empty
prompt Loading PMS_ISS_ORDER...
prompt Table is empty
prompt Loading PMS_ISS_ORDER_LOG...
prompt Table is empty
prompt Loading PMS_MENU...
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (151, 1, '商户通道管理', 1214, '商户通道管理', 'merchant/channel/list', null, 'admin', to_timestamp('23-06-2017 11:24:31.698000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 124);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (1, 1, '系统管理', 10, '系统管理', '##', null, 'admin', to_timestamp('18-06-2017 11:26:48.879000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('19-05-2017 18:00:28.267000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, 0);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (2, 1, '菜单管理', 1010, '菜单管理', 'pms/menu/list', null, 'admin', to_timestamp('18-06-2017 11:27:18.260000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('17-05-2017 16:55:40.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 1);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (3, 1, '权限管理', 1011, '权限管理', 'pms/permission/list', null, 'admin', to_timestamp('18-06-2017 11:27:36.871000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('17-05-2017 16:55:40.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 1);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (4, 1, '角色管理', 1013, '角色管理', 'pms/role/list', null, 'admin', to_timestamp('18-06-2017 11:37:29.580000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('17-05-2017 16:55:41.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 1);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (5, 1, '操作员管理', 1012, '操作员管理', 'pms/operator/list', null, 'admin', to_timestamp('18-06-2017 11:27:57.174000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('17-05-2017 16:55:41.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 1);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (22, 1, '错误代码管理', 1014, '错误代码管理', 'sys/errorcode/list', null, 'admin', to_timestamp('22-06-2017 11:06:24.905000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', null, 1, 1);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (23, 1, '数据字典管理', 1015, '数据字典管理', 'sys/wordbook/list', null, 'admin', to_timestamp('18-06-2017 11:53:09.348000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', null, 1, 1);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (24, 1, '机构管理', 1312, '机构管理', 'mt/organization/list', null, 'admin', to_timestamp('21-06-2017 16:48:03.938000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', null, 1, 13);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (152, 1, '终端通道管理', 1511, '终端通道管理', 'terminal/channel/list', null, 'admin', to_timestamp('23-06-2017 12:17:09.424000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 14);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (33, 1, '终端管理', 1510, '终端管理', 'merchant/terminal/list', null, 'admin', to_timestamp('21-06-2017 17:05:21.335000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 14);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (13, 1, '机构管理', 13, '机构管理', '##', null, 'admin', to_timestamp('21-06-2017 16:44:29.988000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('23-05-2017 17:13:42.985000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, 0);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (14, 1, '终端管理', 15, '终端管理', '##', null, 'admin', to_timestamp('21-06-2017 16:44:37.154000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', null, 0, 0);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (153, 1, '终端限额管理', 1512, '终端限额管理', 'terminal/transLimit/list', null, 'admin', to_timestamp('23-06-2017 12:20:45.550000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 14);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (149, 1, '有卡交易管理', 1710, '有卡交易管理', 'tran/cardorder/list', null, 'admin', to_timestamp('23-06-2017 09:32:42.823000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 148);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (128, 1, '机构列表管理', 1313, '机构列表管理', 'mt/organization/orgList', null, 'admin', to_timestamp('21-06-2017 16:50:30.502000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', null, 1, 13);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (146, 1, '商户注册管理', 1213, '商户注册管理', 'merchant/register/list', null, 'admin', to_timestamp('22-06-2017 14:18:18.195000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 124);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (148, 1, '交易管理', 17, '交易管理', '#', null, 'admin', to_timestamp('23-06-2017 09:30:08.240000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 0);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (150, 1, '无卡交易管理', 1711, '无卡交易管理', 'tran/scanorder/list', null, 'admin', to_timestamp('23-06-2017 09:34:05.889000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 148);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (155, 1, null, 1712, '下发订单管理', 'tran/issorder/list', null, 'admin', to_timestamp('26-06-2017 14:49:13.518000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 148);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (156, 1, null, 1713, '调单处理管理', 'tran/transinvestig/list', null, 'admin', to_timestamp('26-06-2017 14:49:40.831000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 148);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (124, 1, '商户管理', 12, '商户管理', '#', null, 'admin', to_timestamp('21-06-2017 16:41:40.575000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 0);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (125, 1, '商户管理', 1210, '商户管理', 'merchant/list', null, 'admin', to_timestamp('21-06-2017 16:45:31.082000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 124);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (126, 1, '通道管理', 1611, '通道管理', 'channel/channel/list', null, 'admin', to_timestamp('21-06-2017 17:06:09.838000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 120);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (127, 1, '渠道商户号管理', 1612, '渠道商户号管理', 'channel/merchant/list', null, 'admin', to_timestamp('21-06-2017 17:06:18.373000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 120);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (129, 1, '待审核机构管理', 1314, '待审核机构管理', 'mt/organization/uncheckedList', null, 'admin', to_timestamp('21-06-2017 17:22:00.912000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', null, 1, 13);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (143, 1, '待审核商户管理', 1211, '待审核商户管理', 'approval/merchants/list', null, 'admin', to_timestamp('21-06-2017 17:31:47.669000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 124);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (121, 1, '渠道管理', 1610, '渠道管理', 'channel/org/list', null, 'admin', to_timestamp('21-06-2017 17:05:58.678000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 120);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (154, 1, '商户列表管理', 1215, '商户列表管理', 'merchant/merchantlist/list', null, 'admin', to_timestamp('23-06-2017 17:56:25.624000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 124);
insert into PMS_MENU (id, status, remark, sort, name, url, param, create_user, create_time, editor_user, edit_time, is_leaf, parent_id)
values (120, 1, '渠道管理', 16, '渠道管理', '#', null, 'admin', to_timestamp('21-06-2017 16:49:26.663000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 0);
commit;
prompt 30 records loaded
prompt Loading PMS_MENU_ROLE...
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (423, 'xiaomi', to_timestamp('21-06-2017 15:47:44.302000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 22, 2, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (424, 'xiaomi', to_timestamp('21-06-2017 15:47:44.324000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 22, 5, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (398, 'admin', to_timestamp('20-06-2017 12:24:04.434000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 1, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (399, 'admin', to_timestamp('20-06-2017 12:24:04.445000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 124, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (400, 'admin', to_timestamp('20-06-2017 12:24:04.454000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 13, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (401, 'admin', to_timestamp('20-06-2017 12:24:04.462000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 14, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (402, 'admin', to_timestamp('20-06-2017 12:24:04.478000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 120, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (403, 'admin', to_timestamp('20-06-2017 12:24:04.489000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 2, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (404, 'admin', to_timestamp('20-06-2017 12:24:04.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 3, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (405, 'admin', to_timestamp('20-06-2017 12:24:04.508000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 5, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (406, 'admin', to_timestamp('20-06-2017 12:24:04.519000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 4, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (407, 'admin', to_timestamp('20-06-2017 12:24:04.530000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 125, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (408, 'admin', to_timestamp('20-06-2017 12:24:04.538000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 123, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (409, 'admin', to_timestamp('20-06-2017 12:24:04.547000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 24, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (410, 'admin', to_timestamp('20-06-2017 12:24:04.556000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 25, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (411, 'admin', to_timestamp('20-06-2017 12:24:04.565000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 128, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (412, 'admin', to_timestamp('20-06-2017 12:24:04.573000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 33, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (413, 'admin', to_timestamp('20-06-2017 12:24:04.589000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 121, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (414, 'admin', to_timestamp('20-06-2017 12:24:04.601000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 126, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (415, 'admin', to_timestamp('20-06-2017 12:24:04.611000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 20, 127, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (422, 'xiaomi', to_timestamp('21-06-2017 15:47:44.261000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 22, 1, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (245, 'admin', to_timestamp('13-06-2017 14:34:25.678000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 2, 1, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (246, 'admin', to_timestamp('13-06-2017 14:34:25.690000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 2, 2, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (247, 'admin', to_timestamp('13-06-2017 14:34:25.700000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 2, 3, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (248, 'admin', to_timestamp('13-06-2017 14:34:25.712000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 2, 4, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (249, 'admin', to_timestamp('13-06-2017 14:34:25.724000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 2, 5, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (100, 'admin', to_timestamp('15-06-2017 17:46:00.686000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 23, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (101, 'admin', to_timestamp('15-06-2017 17:46:00.719000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 22, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (102, 'admin', to_timestamp('15-06-2017 17:46:00.725000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 5, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (103, 'admin', to_timestamp('15-06-2017 17:46:00.740000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 4, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (104, 'admin', to_timestamp('15-06-2017 17:46:00.752000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 3, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (105, 'admin', to_timestamp('15-06-2017 17:46:00.759000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 2, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (106, 'admin', to_timestamp('15-06-2017 17:46:00.765000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 127, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (107, 'admin', to_timestamp('15-06-2017 17:46:00.772000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 25, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (108, 'admin', to_timestamp('15-06-2017 17:46:00.779000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 24, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (109, 'admin', to_timestamp('15-06-2017 17:46:00.786000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 33, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (110, 'admin', to_timestamp('15-06-2017 17:46:00.793000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 121, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (111, 'admin', to_timestamp('15-06-2017 17:46:00.803000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 20, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (112, 'admin', to_timestamp('15-06-2017 17:46:00.810000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 19, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (113, 'admin', to_timestamp('15-06-2017 17:46:00.817000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 18, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (114, 'admin', to_timestamp('15-06-2017 17:46:00.826000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 17, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (115, 'admin', to_timestamp('15-06-2017 17:46:00.832000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 16, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (116, 'admin', to_timestamp('15-06-2017 17:46:00.843000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 15, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (117, 'admin', to_timestamp('15-06-2017 17:46:00.852000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 14, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (118, 'admin', to_timestamp('15-06-2017 17:46:00.859000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 13, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (119, 'admin', to_timestamp('15-06-2017 17:46:00.865000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 100, 1, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (416, 'admin', to_timestamp('21-06-2017 14:18:21.961000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 21, 1, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (417, 'admin', to_timestamp('21-06-2017 14:18:21.970000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 21, 124, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (418, 'admin', to_timestamp('21-06-2017 14:18:21.982000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 21, 2, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (419, 'admin', to_timestamp('21-06-2017 14:18:21.988000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 21, 3, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (420, 'admin', to_timestamp('21-06-2017 14:18:21.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 21, 5, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (421, 'admin', to_timestamp('21-06-2017 14:18:22.009000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 21, 4, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (729, 'admin', to_timestamp('23-06-2017 17:57:14.492000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 156, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (648, 'admin', to_timestamp('23-06-2017 12:09:05.002000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 1, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (649, 'admin', to_timestamp('23-06-2017 12:09:05.016000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 124, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (650, 'admin', to_timestamp('23-06-2017 12:09:05.028000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 13, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (651, 'admin', to_timestamp('23-06-2017 12:09:05.036000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 14, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (652, 'admin', to_timestamp('23-06-2017 12:09:05.046000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 120, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (653, 'admin', to_timestamp('23-06-2017 12:09:05.055000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 148, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (654, 'admin', to_timestamp('23-06-2017 12:09:05.063000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 2, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (655, 'admin', to_timestamp('23-06-2017 12:09:05.083000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 3, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (656, 'admin', to_timestamp('23-06-2017 12:09:05.093000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 5, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (657, 'admin', to_timestamp('23-06-2017 12:09:05.101000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 4, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (658, 'admin', to_timestamp('23-06-2017 12:09:05.111000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 22, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (659, 'admin', to_timestamp('23-06-2017 12:09:05.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 23, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (660, 'admin', to_timestamp('23-06-2017 12:09:05.129000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 125, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (661, 'admin', to_timestamp('23-06-2017 12:09:05.137000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 143, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (662, 'admin', to_timestamp('23-06-2017 12:09:05.145000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 146, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (663, 'admin', to_timestamp('23-06-2017 12:09:05.158000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 151, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (664, 'admin', to_timestamp('23-06-2017 12:09:05.171000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 24, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (665, 'admin', to_timestamp('23-06-2017 12:09:05.180000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 128, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (666, 'admin', to_timestamp('23-06-2017 12:09:05.192000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 129, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (667, 'admin', to_timestamp('23-06-2017 12:09:05.200000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 33, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (668, 'admin', to_timestamp('23-06-2017 12:09:05.211000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 121, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (669, 'admin', to_timestamp('23-06-2017 12:09:05.221000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 126, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (670, 'admin', to_timestamp('23-06-2017 12:09:05.255000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 127, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (671, 'admin', to_timestamp('23-06-2017 12:09:05.265000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 149, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (672, 'admin', to_timestamp('23-06-2017 12:09:05.273000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 24, 150, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (728, 'admin', to_timestamp('23-06-2017 17:57:14.604000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 155, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (700, 'admin', to_timestamp('23-06-2017 17:57:14.185000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 1, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (701, 'admin', to_timestamp('23-06-2017 17:57:14.220000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 124, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (702, 'admin', to_timestamp('23-06-2017 17:57:14.252000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 13, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (703, 'admin', to_timestamp('23-06-2017 17:57:14.290000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 14, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (704, 'admin', to_timestamp('23-06-2017 17:57:14.310000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 120, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (705, 'admin', to_timestamp('23-06-2017 17:57:14.328000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 148, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (706, 'admin', to_timestamp('23-06-2017 17:57:14.354000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 2, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (707, 'admin', to_timestamp('23-06-2017 17:57:14.370000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 3, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (708, 'admin', to_timestamp('23-06-2017 17:57:14.385000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 5, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (709, 'admin', to_timestamp('23-06-2017 17:57:14.395000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 4, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (710, 'admin', to_timestamp('23-06-2017 17:57:14.410000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 22, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (711, 'admin', to_timestamp('23-06-2017 17:57:14.420000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 23, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (712, 'admin', to_timestamp('23-06-2017 17:57:14.438000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 125, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (713, 'admin', to_timestamp('23-06-2017 17:57:14.448000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 143, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (714, 'admin', to_timestamp('23-06-2017 17:57:14.466000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 146, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (715, 'admin', to_timestamp('23-06-2017 17:57:14.480000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 151, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (716, 'admin', to_timestamp('23-06-2017 17:57:14.492000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 154, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (717, 'admin', to_timestamp('23-06-2017 17:57:14.512000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 24, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (718, 'admin', to_timestamp('23-06-2017 17:57:14.526000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 128, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (719, 'admin', to_timestamp('23-06-2017 17:57:14.555000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 129, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (720, 'admin', to_timestamp('23-06-2017 17:57:14.575000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 33, null);
commit;
prompt 100 records committed...
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (721, 'admin', to_timestamp('23-06-2017 17:57:14.586000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 152, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (722, 'admin', to_timestamp('23-06-2017 17:57:14.604000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 153, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (723, 'admin', to_timestamp('23-06-2017 17:57:14.624000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 121, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (724, 'admin', to_timestamp('23-06-2017 17:57:14.643000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 126, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (725, 'admin', to_timestamp('23-06-2017 17:57:14.653000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 127, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (726, 'admin', to_timestamp('23-06-2017 17:57:14.697000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 149, null);
insert into PMS_MENU_ROLE (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, menu_id, pause_msg)
values (727, 'admin', to_timestamp('23-06-2017 17:57:14.720000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, 150, null);
commit;
prompt 107 records loaded
prompt Loading PMS_MERCHANT...
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611098', 100048, 'aaaaaaaa', 'bbbbbbb', 3, 'dddd', '测试添加', to_timestamp('20-06-2017 20:38:31.204000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, 2, '刘志峰修改测试');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611088', 100048, '3333333333333', '3333333333', 1, '33333333333333333', '33333333333', to_timestamp('20-06-2017 16:08:47.465000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, 2, '33333333333');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611089', 100048, '333333333333333', '8888888888888', 3, '88888888888888888', '33333333333', to_timestamp('20-06-2017 16:13:41.068000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, 1, '33333333333');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611087', 100048, 'sssss', 'sss', 1, 'ssssssssssssss', 'ssss', to_timestamp('20-06-2017 16:02:58.045000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, 2, 'ssssss');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611091', 100048, '3333', '333333', 1, '3333333333333', '33333333333', to_timestamp('20-06-2017 17:01:43.676000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, 2, '333');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611095', 100048, '333', '3333333', 1, '3333333333', '333', to_timestamp('20-06-2017 20:21:50.626000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, 1, '33333333333');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611090', 100048, '6', '6', 3, '6', '6', to_timestamp('20-06-2017 16:24:00.732000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, 1, '6');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611096', 100048, 'aaaaaaa', 'bbbbbbbb', 1, 'dddddddddd', 'wuhongpu测试', to_timestamp('20-06-2017 20:25:30.818000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, 2, '刘志峰');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611097', 100048, 'aaaaaaaa', 'bbbbbbb', 1, 'dddd', '测试添加', to_timestamp('20-06-2017 20:27:06.676000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, 2, '刘志峰');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611093', 100048, '333', '3333333', 3, '3333333333', '333', to_timestamp('20-06-2017 20:15:01.742000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 2, '33333333333');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611084', 100001, '测试公钥', '测试私钥', 1, 'aaaaaaaaaaaaaaaaaaaaaa', '测试', to_timestamp('20-06-2017 11:00:22.389000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 2, 2, '测试修改商户信息');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611092', 100048, '333', '3333333', 3, '3333333333', '333', to_timestamp('20-06-2017 20:14:56.116000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 1, '33333333333');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611094', 100048, '333', '3333333', 3, '3333333333', '333', to_timestamp('20-06-2017 20:15:03.807000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 1, '33333333333');
insert into PMS_MERCHANT (mcode, org_id, public_key, private_key, status, description, create_user, create_time, editor_user, edit_time, deleted, clear_mcode_type, role_type, mer_name)
values ('138458170611099', 100048, 'ssssssss', 'sssssssssss', 1, 'sssssss', 'ss', to_timestamp('21-06-2017 16:35:33.749000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 1, null);
commit;
prompt 14 records loaded
prompt Loading PMS_MERCHANT_CLEANING...
prompt Table is empty
prompt Loading PMS_MERCHANT_REGISTER...
insert into PMS_MERCHANT_REGISTER (mcode, cor_name, cor_card_type, cor_id_card, cor_id_card_valid, license_code, license_code_valid, mer_register_addr, main_business, sign_amount, real_amount, license_img, id_front_img, id_back_img, bankcard_front_img, bankcard_back_img, open_bank_pc_img, merchant_ofd_img, merchant_stores_img, head_img)
values ('138458170611001', '法人姓名(测试)1', 1, '123456', to_timestamp('24-08-2015 10:37:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '北京市搜宝中心', null, null, null, null, 'ffffffa', 'aaaaaaaaa', null, null, null, null, null, 'ssssss');
insert into PMS_MERCHANT_REGISTER (mcode, cor_name, cor_card_type, cor_id_card, cor_id_card_valid, license_code, license_code_valid, mer_register_addr, main_business, sign_amount, real_amount, license_img, id_front_img, id_back_img, bankcard_front_img, bankcard_back_img, open_bank_pc_img, merchant_ofd_img, merchant_stores_img, head_img)
values ('138458170611002', '法人姓名(测试)2', 1, '123457', to_timestamp('24-08-2015 10:37:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '北京市搜宝中心', null, null, null, null, 'ffffffb', 'aaaaaaaaa', null, null, null, null, null, 'ssssss');
insert into PMS_MERCHANT_REGISTER (mcode, cor_name, cor_card_type, cor_id_card, cor_id_card_valid, license_code, license_code_valid, mer_register_addr, main_business, sign_amount, real_amount, license_img, id_front_img, id_back_img, bankcard_front_img, bankcard_back_img, open_bank_pc_img, merchant_ofd_img, merchant_stores_img, head_img)
values ('138458170611003', '法人姓名(测试)3', 1, '123458', to_timestamp('24-08-2015 10:37:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '北京市搜宝中心', null, null, null, null, 'ffffffc', 'aaaaaaaaa', null, null, null, null, null, 'ssssss');
commit;
prompt 3 records loaded
prompt Loading PMS_OPERATOR...
insert into PMS_OPERATOR (id, org_id, create_user, create_time, editor_user, edit_time, status, remark, real_name, mobile, login_name, login_pwd, type, salt, login_cnt, email, authorize_pwd)
values (1, 100000, 'admin', to_timestamp('17-05-2017 16:56:26.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('17-05-2017 16:56:26.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '超级管理员', '超级管理员', '18620936193', 'admin', 'd3c59d25033dbf980d29554025c23a75', 2, '8d78869f470951332959580424d4bf4f', 1, '1', '1');
insert into PMS_OPERATOR (id, org_id, create_user, create_time, editor_user, edit_time, status, remark, real_name, mobile, login_name, login_pwd, type, salt, login_cnt, email, authorize_pwd)
values (25, 100001, 'admin', to_timestamp('20-06-2017 20:54:24.893000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '再填加一个中亿的用户', 'zhongyi', '13439915863', 'zhongyi', 'e31a0b648aa9d1465285587aaec28a3f', 2, '2d1778f6853885f1d325bd2118cf8c46', 0, '1074166578@qq.com', '123456');
insert into PMS_OPERATOR (id, org_id, create_user, create_time, editor_user, edit_time, status, remark, real_name, mobile, login_name, login_pwd, type, salt, login_cnt, email, authorize_pwd)
values (26, 100050, 'admin', to_timestamp('21-06-2017 14:20:11.559000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 'ddddddd', '小米', '13439999999', 'xiaomi', '84344ea2ffa332f895f77928df7fa718', 2, 'b0f6cdad86c5e7ebbe50224e2a75df62', 0, '1074166@qq.com', '123456');
insert into PMS_OPERATOR (id, org_id, create_user, create_time, editor_user, edit_time, status, remark, real_name, mobile, login_name, login_pwd, type, salt, login_cnt, email, authorize_pwd)
values (27, 100050, 'xiaomi', to_timestamp('21-06-2017 16:33:53.674000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '小米操作员01', '小米操作员01', '13439915866', 'xiaomicz01', '3841b0363bd6537e179bf8fc94c17433', 2, '736489eeecb558471321700680eb8006', 0, '10001@qq.com', '123456');
insert into PMS_OPERATOR (id, org_id, create_user, create_time, editor_user, edit_time, status, remark, real_name, mobile, login_name, login_pwd, type, salt, login_cnt, email, authorize_pwd)
values (2, 1, 'wuhp', to_timestamp('14-06-2017 16:56:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, '李春琦', '13752149424', '李春琦', 'aaaaaa', 1, 'cccc', 0, '123456@163.com', 'aaaaaa');
insert into PMS_OPERATOR (id, org_id, create_user, create_time, editor_user, edit_time, status, remark, real_name, mobile, login_name, login_pwd, type, salt, login_cnt, email, authorize_pwd)
values (22, 100000, 'admin', to_timestamp('23-06-2017 11:49:26.620000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('23-06-2017 12:08:17.352000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 'TEST', 'test', '13439915866', 'test', '11057db2b60a324c7ae6e00d03622d31', 2, 'a916e141266bac8ab0a5a578f244ec9a', 0, '13435588858', '123456');
insert into PMS_OPERATOR (id, org_id, create_user, create_time, editor_user, edit_time, status, remark, real_name, mobile, login_name, login_pwd, type, salt, login_cnt, email, authorize_pwd)
values (24, 100001, 'admin', to_timestamp('20-06-2017 11:50:42.127000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 'test2用户所属机构100001', 'test2', '13439915888', 'test2', '49a0e63c4760065729e9f68065760d78', 2, '710cd2ce679d31ec19b957e72c390df1', 0, 'test2qq.com', '123456');
commit;
prompt 7 records loaded
prompt Loading PMS_OPERATOR_LOG...
prompt Table is empty
prompt Loading PMS_ORGANIZATION...
insert into PMS_ORGANIZATION (org_id, name, type, parent_id, layer, description, create_user, create_time, editor_user, edit_time, deleted, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, check_user, status, check_desc, is_check_org, is_dir, clear_mac)
values (100048, '上海肯德基', 1, 100044, '100000A100001A100044A100048', null, 'admin', to_timestamp('20-06-2017 14:49:10.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('20-06-2017 14:49:14.200000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, 1, 1000, '丰台区', '13811121515', '01065214572', '测试员', '211481198401154411', null, null, '测试员', null, 1, null, 0, 0, null);
insert into PMS_ORGANIZATION (org_id, name, type, parent_id, layer, description, create_user, create_time, editor_user, edit_time, deleted, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, check_user, status, check_desc, is_check_org, is_dir, clear_mac)
values (100046, '测试4', 1, 100045, '100000A100001A100044A100045A100046', null, 'admin', to_timestamp('20-06-2017 14:41:24.720000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 1000, '丰台区', '13811121515', '01065214572', '测试', '211481198401154411', null, null, '测试', null, 1, null, 0, 0, null);
insert into PMS_ORGANIZATION (org_id, name, type, parent_id, layer, description, create_user, create_time, editor_user, edit_time, deleted, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, check_user, status, check_desc, is_check_org, is_dir, clear_mac)
values (100047, '北京肯德基', 1, 100046, '100000A100001A100044A100045A100046A100047', null, 'admin', to_timestamp('20-06-2017 14:47:55.342000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 1000, '丰台区', '13811121512', '01065214572', '测试员', '211481198401154411', null, null, '测试员', null, 1, null, 0, 0, null);
insert into PMS_ORGANIZATION (org_id, name, type, parent_id, layer, description, create_user, create_time, editor_user, edit_time, deleted, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, check_user, status, check_desc, is_check_org, is_dir, clear_mac)
values (100001, '中亿XX', 1, 100000, '100000A100001', null, 'admin', to_timestamp('10-06-2017 18:05:47.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 1000, '西城区广安门外大街', '13810525047', '01088888888', '测试一下', '513021198505258316', '100020', 'test@qq.com', '测试一下', null, 1, null, 0, 0, null);
insert into PMS_ORGANIZATION (org_id, name, type, parent_id, layer, description, create_user, create_time, editor_user, edit_time, deleted, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, check_user, status, check_desc, is_check_org, is_dir, clear_mac)
values (100000, '中亿腾乐', 0, null, '100000', null, 'admin', to_timestamp('09-06-2017 18:05:47.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 2, 1100, '西城区广安门外大街168号朗琴国际大厦B座806B', '13810525047', '01088888888', '测试', '513021198505258316', '100020', 'test@qq.com', '测试', null, 1, null, 0, 0, null);
insert into PMS_ORGANIZATION (org_id, name, type, parent_id, layer, description, create_user, create_time, editor_user, edit_time, deleted, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, check_user, status, check_desc, is_check_org, is_dir, clear_mac)
values (100049, '北京麦当劳', 1, 100045, '100000A100001A100044A100045A100049', null, 'admin', to_timestamp('20-06-2017 15:13:28.527000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('20-06-2017 15:50:11.209000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, 1, 1000, '丰台区', '13811121515', '01065214572', '测试员', '211481198401154411', null, null, '测试员', null, 1, null, 0, 0, 'zyzf_orgFFFFFFFFzHZvn9VyCvP7R5fQ0AuTcQb7O6N4fYXdra4bWvOJK3vH0Wt32nKswZ6xOKMZlb2nwVniKdzmWEI=');
insert into PMS_ORGANIZATION (org_id, name, type, parent_id, layer, description, create_user, create_time, editor_user, edit_time, deleted, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, check_user, status, check_desc, is_check_org, is_dir, clear_mac)
values (100052, '测试5', 2, 100045, '100000A100001A100044A100045A100052', null, 'admin', to_timestamp('25-06-2017 16:58:03.944000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 1000, '丰台区', '13811121515', '01065214572', '测试员', '211481198401154411', null, null, '测试员', null, 1, null, 0, 0, null);
insert into PMS_ORGANIZATION (org_id, name, type, parent_id, layer, description, create_user, create_time, editor_user, edit_time, deleted, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, check_user, status, check_desc, is_check_org, is_dir, clear_mac)
values (100050, '小米', 1, 100047, '100000A100001A100044A100045A100046A100047A100050', null, 'admin', to_timestamp('20-06-2017 16:00:52.032000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 1000, '丰台区', '13811121515', '01065214572', '测试员', '211481198401154411', null, null, '测试员', null, 1, null, 0, 0, null);
insert into PMS_ORGANIZATION (org_id, name, type, parent_id, layer, description, create_user, create_time, editor_user, edit_time, deleted, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, check_user, status, check_desc, is_check_org, is_dir, clear_mac)
values (100053, '测试6', 4, 100045, '100000A100001A100044A100045A100053', null, 'admin', to_timestamp('25-06-2017 17:24:47.586000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 1000, '丰台区', '13811121515', '01065214572', '测试员', '211481198401154411', null, null, '测试员', null, 3, null, 1, 0, null);
insert into PMS_ORGANIZATION (org_id, name, type, parent_id, layer, description, create_user, create_time, editor_user, edit_time, deleted, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, check_user, status, check_desc, is_check_org, is_dir, clear_mac)
values (100044, '肯德基', 1, 100001, '100000A100001A100044', null, 'admin', to_timestamp('20-06-2017 14:26:22.130000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 1000, '丰台区', '13811121515', '01065214573', '测试员', '211481198401154411', null, null, '测试员', null, 1, null, 0, 0, null);
insert into PMS_ORGANIZATION (org_id, name, type, parent_id, layer, description, create_user, create_time, editor_user, edit_time, deleted, province, city, address, mobile, phone, legal_name, id_card, post, email, salesman, check_user, status, check_desc, is_check_org, is_dir, clear_mac)
values (100045, '麦当劳', 1, 100044, '100000A100001A100044A100045', null, 'admin', to_timestamp('20-06-2017 14:32:44.328000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 0, 1, 1000, '丰台区', '13811121512', '01065214572', '测试', '211481198401154411', null, null, '测试', 'admin', 1, '认证成功', 1, 0, null);
commit;
prompt 11 records loaded
prompt Loading PMS_ORG_CHANNEL...
prompt Table is empty
prompt Loading PMS_ORG_CLEANING...
insert into PMS_ORG_CLEANING (org_id, cardholder, cleantype, opening_bank, branches_bank, bbank_province, bbank_city, bank_card, fee_rate, clear_fee, min_fee, max_fee, branches_bankcode)
values (100047, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PMS_ORG_CLEANING (org_id, cardholder, cleantype, opening_bank, branches_bank, bbank_province, bbank_city, bank_card, fee_rate, clear_fee, min_fee, max_fee, branches_bankcode)
values (100046, '测试', 1, '中国农业发展银行', '北京市密云县支行', 1, 1000, '628549812121321', .0065, 300, 200, 1000, '203100003118');
insert into PMS_ORG_CLEANING (org_id, cardholder, cleantype, opening_bank, branches_bank, bbank_province, bbank_city, bank_card, fee_rate, clear_fee, min_fee, max_fee, branches_bankcode)
values (100048, '测试', 1, '中国光大银行', '北京海淀支行', 1, 1000, '6116112313213151', .0065, 300, 200, 1000, '303100000047');
insert into PMS_ORG_CLEANING (org_id, cardholder, cleantype, opening_bank, branches_bank, bbank_province, bbank_city, bank_card, fee_rate, clear_fee, min_fee, max_fee, branches_bankcode)
values (100049, '测试啊', 1, '中国银行', '北京亚运村支行', 1, 1000, '612165112321', .0065, 300, 200, 1000, '104100006079');
insert into PMS_ORG_CLEANING (org_id, cardholder, cleantype, opening_bank, branches_bank, bbank_province, bbank_city, bank_card, fee_rate, clear_fee, min_fee, max_fee, branches_bankcode)
values (100000, '包月飞', 1, '交通银行', '交通银行天津金钟河支行', 2, 1100, '6222601210001441585', .0065, 300, 200, 1000, '301110000383');
insert into PMS_ORG_CLEANING (org_id, cardholder, cleantype, opening_bank, branches_bank, bbank_province, bbank_city, bank_card, fee_rate, clear_fee, min_fee, max_fee, branches_bankcode)
values (100052, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PMS_ORG_CLEANING (org_id, cardholder, cleantype, opening_bank, branches_bank, bbank_province, bbank_city, bank_card, fee_rate, clear_fee, min_fee, max_fee, branches_bankcode)
values (100050, '测试', 1, '中国银行', '北京车公庄西路支行', 1, 1000, '4561211321321', .0065, 300, 200, 1000, '104100005686');
insert into PMS_ORG_CLEANING (org_id, cardholder, cleantype, opening_bank, branches_bank, bbank_province, bbank_city, bank_card, fee_rate, clear_fee, min_fee, max_fee, branches_bankcode)
values (100053, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PMS_ORG_CLEANING (org_id, cardholder, cleantype, opening_bank, branches_bank, bbank_province, bbank_city, bank_card, fee_rate, clear_fee, min_fee, max_fee, branches_bankcode)
values (100045, '测试', 1, '中国建设银行', '北京晓月苑支行', 1, 1000, '612345321321815', .0065, 300, 200, 1000, '105100050534');
insert into PMS_ORG_CLEANING (org_id, cardholder, cleantype, opening_bank, branches_bank, bbank_province, bbank_city, bank_card, fee_rate, clear_fee, min_fee, max_fee, branches_bankcode)
values (100044, '测试', 1, '中国农业银行', '北京和平里支行', 1, 1000, '6225156198165', .0065, 300, 200, 1000, '103100023037');
commit;
prompt 10 records loaded
prompt Loading PMS_ORG_CONTRACT...
insert into PMS_ORG_CONTRACT (ccode, org_id, con_startdate, con_enddate, agency_fee, pay_type, security_money, initial_fee, monthly_invoices, fee_directions, description)
values (null, 100047, null, null, null, null, null, null, null, null, null);
insert into PMS_ORG_CONTRACT (ccode, org_id, con_startdate, con_enddate, agency_fee, pay_type, security_money, initial_fee, monthly_invoices, fee_directions, description)
values ('4444444444444444', 100046, null, null, 10000000, 1, 10000000, 10000000, 0, null, null);
insert into PMS_ORG_CONTRACT (ccode, org_id, con_startdate, con_enddate, agency_fee, pay_type, security_money, initial_fee, monthly_invoices, fee_directions, description)
values ('55555555555555', 100048, to_timestamp('20-06-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 10000000, 1, 10000000, 10000000, 0, null, null);
insert into PMS_ORG_CONTRACT (ccode, org_id, con_startdate, con_enddate, agency_fee, pay_type, security_money, initial_fee, monthly_invoices, fee_directions, description)
values (null, 100049, null, null, null, null, null, null, null, null, null);
insert into PMS_ORG_CONTRACT (ccode, org_id, con_startdate, con_enddate, agency_fee, pay_type, security_money, initial_fee, monthly_invoices, fee_directions, description)
values ('1111111111', 100000, to_timestamp('22-03-2014 20:52:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('22-03-2044 20:52:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, 1, 0, 0, 0, null, null);
insert into PMS_ORG_CONTRACT (ccode, org_id, con_startdate, con_enddate, agency_fee, pay_type, security_money, initial_fee, monthly_invoices, fee_directions, description)
values (null, 100052, null, null, null, null, null, null, null, null, null);
insert into PMS_ORG_CONTRACT (ccode, org_id, con_startdate, con_enddate, agency_fee, pay_type, security_money, initial_fee, monthly_invoices, fee_directions, description)
values ('666666666666666', 100050, to_timestamp('20-06-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 10000000, 1, 10000000, 10000000, 0, null, null);
insert into PMS_ORG_CONTRACT (ccode, org_id, con_startdate, con_enddate, agency_fee, pay_type, security_money, initial_fee, monthly_invoices, fee_directions, description)
values (null, 100053, null, null, null, null, null, null, null, null, null);
insert into PMS_ORG_CONTRACT (ccode, org_id, con_startdate, con_enddate, agency_fee, pay_type, security_money, initial_fee, monthly_invoices, fee_directions, description)
values ('33333333333333333333333', 100045, to_timestamp('29-06-2017 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('25-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 10000000, 1, 10000000, 10000000, 0, null, null);
insert into PMS_ORG_CONTRACT (ccode, org_id, con_startdate, con_enddate, agency_fee, pay_type, security_money, initial_fee, monthly_invoices, fee_directions, description)
values ('222222222222222', 100044, null, null, 10000000, 1, 10000000, 10000000, 0, null, null);
commit;
prompt 10 records loaded
prompt Loading PMS_ORG_REGISTER...
insert into PMS_ORG_REGISTER (org_id, cor_name, cor_card_type, cor_id_card, cor_id_card_valid, license_code, license_code_valid, mer_register_addr, main_business, sign_amount, real_amount, role_type, license_img, id_front_img, id_back_img, bankcard_front_img, bankcard_back_img, open_bank_pc_img, merchant_ofd_img, merchant_stores_img, head_img)
values (100046, '测试4', 1, '211481198401154411', to_timestamp('20-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '2312312123123', to_timestamp('20-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '北京市', '餐饮娱乐', 10, 10, 1, null, '/document/organization/orgRegister/2017-06-20/100046/idFront.png', '/document/organization/orgRegister/2017-06-20/100046/idBack.png', '/document/organization/orgRegister/2017-06-20/100046/bankcardFront.png', '/document/organization/orgRegister/2017-06-20/100046/bankcardBack.png', null, null, null, '/document/organization/orgRegister/2017-06-20/100046/head.png');
insert into PMS_ORG_REGISTER (org_id, cor_name, cor_card_type, cor_id_card, cor_id_card_valid, license_code, license_code_valid, mer_register_addr, main_business, sign_amount, real_amount, role_type, license_img, id_front_img, id_back_img, bankcard_front_img, bankcard_back_img, open_bank_pc_img, merchant_ofd_img, merchant_stores_img, head_img)
values (100048, '测试6', 1, '211481198401154411', to_timestamp('20-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '2312312123123', to_timestamp('20-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '北京市', '餐饮娱乐', 10, 10, 1, null, '/document/organization/orgRegister/2017-06-20/100048/idFront.png', '/document/organization/orgRegister/2017-06-20/100048/idBack.png', '/document/organization/orgRegister/2017-06-20/100048/bankcardFront.png', '/document/organization/orgRegister/2017-06-20/100048/bankcardBack.png', null, null, null, '/document/organization/orgRegister/2017-06-20/100048/head.png');
insert into PMS_ORG_REGISTER (org_id, cor_name, cor_card_type, cor_id_card, cor_id_card_valid, license_code, license_code_valid, mer_register_addr, main_business, sign_amount, real_amount, role_type, license_img, id_front_img, id_back_img, bankcard_front_img, bankcard_back_img, open_bank_pc_img, merchant_ofd_img, merchant_stores_img, head_img)
values (100049, '测试', 1, '211481198401154411', to_timestamp('20-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '2312312123123', to_timestamp('20-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '北京市', '餐饮娱乐', 10, 10, 1, null, '/document/organization/orgRegister/2017-06-20/100049/idFront.png', '/document/organization/orgRegister/2017-06-20/100049/idBack.png', '/document/organization/orgRegister/2017-06-20/100049/bankcardFront.png', '/document/organization/orgRegister/2017-06-20/100049/bankcardBack.png', null, null, null, '/document/organization/orgRegister/2017-06-20/100049/head.png');
insert into PMS_ORG_REGISTER (org_id, cor_name, cor_card_type, cor_id_card, cor_id_card_valid, license_code, license_code_valid, mer_register_addr, main_business, sign_amount, real_amount, role_type, license_img, id_front_img, id_back_img, bankcard_front_img, bankcard_back_img, open_bank_pc_img, merchant_ofd_img, merchant_stores_img, head_img)
values (100000, '测试', 1, '513021198505258316', to_timestamp('10-06-2037 18:05:47.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '210515451051', to_timestamp('10-06-2037 18:05:47.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '丰台区', '西城区广安门外大街168号朗琴国际大厦B座806B', 10, 10, 2, '/document/organization/orgRegister/2017-06-19/111.jpg', '/document/organization/orgRegister/2017-06-19/222.jpg', '/document/organization/orgRegister/2017-06-19/333.jpg', '/document/organization/orgRegister/2017-06-19/444.jpg', '/document/organization/orgRegister/2017-06-19/555.jpg', '/document/organization/orgRegister/2017-06-19/666.jpg', '/document/organization/orgRegister/2017-06-19/777.jpg', '/document/organization/orgRegister/2017-06-19/888.jpg', '/document/organization/orgRegister/2017-06-19/999.jpg');
insert into PMS_ORG_REGISTER (org_id, cor_name, cor_card_type, cor_id_card, cor_id_card_valid, license_code, license_code_valid, mer_register_addr, main_business, sign_amount, real_amount, role_type, license_img, id_front_img, id_back_img, bankcard_front_img, bankcard_back_img, open_bank_pc_img, merchant_ofd_img, merchant_stores_img, head_img)
values (100050, '测试', 1, '211481198401154411', to_timestamp('20-06-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '2312312123123', to_timestamp('20-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '北京市', '餐饮娱乐', 10, 10, 1, null, '/document/organization/orgRegister/2017-06-20/100050/idFront.png', '/document/organization/orgRegister/2017-06-20/100050/idBack.png', '/document/organization/orgRegister/2017-06-20/100050/bankcardFront.png', '/document/organization/orgRegister/2017-06-20/100050/bankcardBack.png', null, null, null, '/document/organization/orgRegister/2017-06-20/100050/head.png');
insert into PMS_ORG_REGISTER (org_id, cor_name, cor_card_type, cor_id_card, cor_id_card_valid, license_code, license_code_valid, mer_register_addr, main_business, sign_amount, real_amount, role_type, license_img, id_front_img, id_back_img, bankcard_front_img, bankcard_back_img, open_bank_pc_img, merchant_ofd_img, merchant_stores_img, head_img)
values (100044, '测试2', 1, '211481198401154411', to_timestamp('20-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '2312312123123', to_timestamp('20-06-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '北京市', '餐饮娱乐', 10, 10, 1, null, '/document/organization/orgRegister/2017-06-20/100044/idFront.png', '/document/organization/orgRegister/2017-06-20/100044/idBack.png', '/document/organization/orgRegister/2017-06-20/100044/bankcardFront.png', '/document/organization/orgRegister/2017-06-20/100044/bankcardBack.png', null, null, null, '/document/organization/orgRegister/2017-06-20/100044/head.png');
insert into PMS_ORG_REGISTER (org_id, cor_name, cor_card_type, cor_id_card, cor_id_card_valid, license_code, license_code_valid, mer_register_addr, main_business, sign_amount, real_amount, role_type, license_img, id_front_img, id_back_img, bankcard_front_img, bankcard_back_img, open_bank_pc_img, merchant_ofd_img, merchant_stores_img, head_img)
values (100045, '测试3', 1, '211481198401154411', to_timestamp('20-06-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '2312312123123', to_timestamp('20-06-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '北京市', '餐饮娱乐', 10, 10, 1, null, '/document/organization/orgRegister/2017-06-20/100045/idFront.png', '/document/organization/orgRegister/2017-06-20/100045/idBack.png', '/document/organization/orgRegister/2017-06-20/100045/bankcardFront.png', '/document/organization/orgRegister/2017-06-20/100045/bankcardBack.png', null, null, null, '/document/organization/orgRegister/2017-06-20/100045/head.png');
commit;
prompt 7 records loaded
prompt Loading PMS_PERMISSION...
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (150, 'admin', to_timestamp('23-06-2017 11:34:32.221000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '商户管理-商户通道-查询', '商户管理-商户通道-查询', 151, 'merchant:channel:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (132, 'admin', to_timestamp('27-05-2017 12:22:36.722000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '机构管理-机构管理列表--查询', '机构管理-机构管理列表--查询', 128, 'mt:orgList:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (1, 'admin', to_timestamp('17-05-2017 16:56:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-菜单-查看', '权限管理-菜单-查看', 2, 'pms:menu:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (2, 'admin', to_timestamp('17-05-2017 16:56:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-菜单-添加', '权限管理-菜单-添加', 2, 'pms:menu:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (3, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-菜单-修改', '权限管理-菜单-修改', 2, 'pms:menu:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (4, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-菜单-删除', '权限管理-菜单-删除', 2, 'pms:menu:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (11, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-权限-查看', '权限管理-权限-查看', 3, 'pms:permission:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (12, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-权限-添加', '权限管理-权限-添加', 3, 'pms:permission:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (13, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-权限-修改', '权限管理-权限-修改', 3, 'pms:permission:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (14, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-权限-删除', '权限管理-权限-删除', 3, 'pms:permission:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (21, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-角色-查看', '权限管理-角色-查看', 4, 'pms:role:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (22, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-角色-添加', '权限管理-角色-添加', 4, 'pms:role:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (23, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-角色-修改', '权限管理-角色-修改', 4, 'pms:role:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (24, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-角色-删除', '权限管理-角色-删除', 4, 'pms:role:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (25, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-角色-分配权限', '权限管理-角色-分配权限', 4, 'pms:role:assignpermission', 2, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (31, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-操作员-查看', '权限管理-操作员-查看', 5, 'pms:operator:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (32, 'admin', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-操作员-添加', '权限管理-操作员-添加', 5, 'pms:operator:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (33, 'admin', to_timestamp('17-05-2017 16:56:18.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:18.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-操作员-查看', '权限管理-操作员-修改', 5, 'pms:operator:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (34, 'admin', to_timestamp('17-05-2017 16:56:18.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:18.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-操作员-冻结与解冻', '权限管理-操作员-冻结与解冻', 5, 'pms:operator:changestatus', 2, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (35, 'admin', to_timestamp('17-05-2017 16:56:18.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('19-05-2017 12:00:44.720000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, '权限管理-操作员-重置密码', '权限管理-操作员-重置密码', 5, 'pms:operator:resetpwd', 2, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (50, 'admin', to_timestamp('26-05-2017 15:45:07.709000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '系统管理-错误代码--添加', '系统管理-错误代码--添加', 22, 'sys:errorcode:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (51, 'admin', to_timestamp('26-05-2017 15:46:08.853000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '系统管理-错误代码--修改', '系统管理-错误代码--修改', 22, 'sys:errorcode:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (52, 'admin', to_timestamp('26-05-2017 15:47:04.759000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '系统管理-错误代码--删除', '系统管理-错误代码--删除', 22, 'sys:errorcode:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (59, 'admin', to_timestamp('27-05-2017 12:20:15.825000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '系统管理-数据字典--修改', '系统管理-数据字典--修改', 23, 'sys:wordbook:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (58, 'admin', to_timestamp('27-05-2017 12:19:31.074000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '系统管理-数据字典--添加', '系统管理-数据字典--添加', 23, 'sys:wordbook:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (60, 'admin', to_timestamp('27-05-2017 12:21:30.822000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '系统管理-数据字典--删除', '系统管理-数据字典--删除', 23, 'sys:wordbook:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (61, 'admin', to_timestamp('27-05-2017 12:22:36.722000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '系统管理-数组字典--查询', '系统管理-数组字典--查询', 23, 'sys:wordbook:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (62, 'admin', to_timestamp('21-06-2017 10:11:42.169000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '机构管理-机构树--查看', '机构管理-机构树--查看', 24, 'mt:organization:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (63, 'admin', to_timestamp('31-05-2017 12:38:50.823000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '商户管理-待审核商户管理--查看', '商户管理-商户管理待审核--查看', 24, 'mt:checkpending:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (64, 'admin', to_timestamp('21-06-2017 10:32:00.433000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '机构管理-机构树--添加', '机构管理-机构树--添加', 24, 'mt:organization:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (65, 'admin', to_timestamp('21-06-2017 10:32:51.618000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '机构管理-机构树--修改', '机构管理-机构树--修改', 24, 'mt:organization:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (66, 'admin', to_timestamp('21-06-2017 10:32:22.750000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '商户管理-商户树--删除', '机构管理-机构树--删除', 24, 'mt:organization:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (20, 'admin', to_timestamp('25-05-2017 15:55:42.665000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '系统管理-错误代码--查看', '系统管理-错误代码--查看', 22, 'sys:errorcode:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (73, 'admin', to_timestamp('18-06-2017 17:43:25.675000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '终端管理-终端管理-查看', '终端管理-终端管理-查看', 33, 'merchant:terminal:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (111, 'admin', to_timestamp('16-06-2017 14:11:49.448000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '系统管理-操作员管理-删除', '系统管理-操作员管理-删除', 5, 'pms:operator:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (116, 'admin', to_timestamp('17-06-2017 11:52:24.516000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '渠道管理-通道管理-查看', '渠道管理-通道管理-查看', 126, 'channel:channel:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (117, 'admin', to_timestamp('17-06-2017 11:53:09.585000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '渠道管理-通道管理-添加', '渠道管理-通道管理-添加', 126, 'channel:channel:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (118, 'admin', to_timestamp('17-06-2017 11:53:52.370000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '渠道管理-通道管理-修改', '渠道管理-通道管理-修改', 126, 'channel:channel:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (119, 'admin', to_timestamp('17-06-2017 11:54:16.213000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '渠道管理-通道管理-删除', '渠道管理-通道管理-删除', 126, 'channel:channel:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (120, 'admin', to_timestamp('17-06-2017 17:05:19.385000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '商户管理-商户管理-删除', '商户管理-商户管理-删除', 125, 'mt:merchant:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (121, 'admin', to_timestamp('17-06-2017 17:10:05.410000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '商户管理-商户管理-修改', '商户管理-商户管理-修改', 125, 'mt:merchant:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (129, 'admin', to_timestamp('18-06-2017 15:09:02.748000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '渠道管理-渠道商户号管理-修改', '渠道管理-渠道商户号管理-修改', 127, 'channel:merchant:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (130, 'admin', to_timestamp('18-06-2017 15:09:50.379000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '渠道管理-渠道商户号管理-删除', '渠道管理-渠道商户号管理-删除', 127, 'channel:merchant:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (131, 'admin', to_timestamp('18-06-2017 17:40:19.284000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '终端管理-终端管理-添加', '终端管理-终端管理-添加', 33, 'merchant:terminal:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (151, 'test', to_timestamp('23-06-2017 16:24:45.702000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '终端管理-终端通道管理-终端通道查询', '终端管理-终端通道管理-终端通道查询', 152, 'terminal:channel:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (152, 'test', to_timestamp('23-06-2017 16:24:36.350000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '终端管理-终端限额管理-终端限额查询', '终端管理-终端限额管理-终端限额查询', 153, 'terminal:transLimit:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (144, 'admin', to_timestamp('22-06-2017 17:23:47.987000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '商户管理-待审核商户管理-待审核商户查询', '商户管理-待审核商户管理-待审核商户查询', 143, 'merchan:unchecked:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (133, 'admin', to_timestamp('20-06-2017 14:23:17.704000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '终端管理-终端管理-删除', '终端管理-终端管理-删除', 33, 'merchant:terminal:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (134, 'admin', to_timestamp('20-06-2017 14:25:53.082000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '终端管理-终端管理-修改', '终端管理-终端管理-修改', 33, 'merchant:terminal:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (140, 'admin', to_timestamp('22-06-2017 14:06:38.300000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '商户管理-商户注册管理-删除', '商户管理-商户注册管理-删除', 145, 'mt:register:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (147, 'admin', to_timestamp('23-06-2017 10:34:48.298000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '交易管理-有卡交易管理-查看', '交易管理-有卡交易管理-查看', 149, 'tran:cardorder:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (143, 'admin', to_timestamp('22-06-2017 14:23:25.901000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '商户管理-商户注册-商户注册查询', '商户管理-商户注册-商户注册查询', 146, 'mt:register:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (148, 'admin', to_timestamp('23-06-2017 10:39:04.605000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '交易管理-无卡交易管理-查看', '交易管理-无卡交易管理-查看', 150, 'tran:scanorder:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (153, 'admin', to_timestamp('26-06-2017 15:10:43.104000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '交易管理-下发订单管理-查看', '交易管理-下发订单管理-查看', 155, 'tran:issorder:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (154, 'admin', to_timestamp('26-06-2017 15:11:08.603000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '交易管理-调单处理管理-查看', '交易管理-调单处理管理-查看', 156, 'tran:transinvestig:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (55, 'admin', to_timestamp('16-06-2017 14:43:29.062000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '商户管理-商户管理-查询', '商户管理-商户管理-查询', 125, 'mt:merchant:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (56, 'admin', to_timestamp('16-06-2017 14:44:04.948000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '商户管理-商户管理-添加', '商户管理-商户管理-添加', 125, 'mt:merchant:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (57, 'admin', to_timestamp('16-06-2017 17:26:47.001000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '渠道管理-渠道管理-查询', '渠道管理-渠道管理-查询', 121, 'channel:org:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (112, 'admin', to_timestamp('16-06-2017 17:34:25.376000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '渠道管理-渠道管理-添加', '渠道管理-渠道管理-添加', 121, 'channel:org:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (113, 'admin', to_timestamp('16-06-2017 17:35:29.623000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '渠道管理-渠道管理-修改', '渠道管理-渠道管理-修改', 121, 'channel:org:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (114, 'admin', to_timestamp('16-06-2017 17:36:27.629000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '渠道管理-渠道管理-删除', '渠道管理-渠道管理-删除', 121, 'channel:org:delete', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (122, 'admin', to_timestamp('18-06-2017 12:19:57.995000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '渠道管理-渠道商户号管理-查看', '渠道管理-渠道商户号管理-查看', 127, 'channel:merchant:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (145, 'admin', to_timestamp('22-06-2017 18:37:12.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '商户管理-商户注册-添加', '商户管理-商户注册-添加', 146, 'mt:register:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (125, 'admin', to_timestamp('18-06-2017 15:06:20.528000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 2, '渠道管理-渠道商户号管理-添加', '渠道管理-渠道商户号管理-添加', 127, 'channel:merchant:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (135, 'admin', to_timestamp('27-05-2017 12:22:36.722000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '机构管理-待审核机构管理--查询', '机构管理-待审核机构管理--查询', 129, 'mt:uncheckedList:view', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (137, 'admin', to_timestamp('27-05-2017 12:22:36.722000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '机构管理-待审核机构管理--修改', '机构管理-待审核机构管理--修改', 129, 'mt:uncheckedList:edit', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (136, 'admin', to_timestamp('27-05-2017 12:22:36.722000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '机构管理-待审核机构管理--添加', '机构管理-待审核机构管理--添加', 129, 'mt:uncheckedList:add', 1, 1, null, null);
insert into PMS_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, permission_name, menu_id, permission, permission_type, sort, pause_msg, class_name)
values (138, 'admin', to_timestamp('27-05-2017 12:22:36.722000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '机构管理-待审核机构管理--删除', '机构管理-待审核机构管理--删除', 129, 'mt:uncheckedList:delete', 1, 1, null, null);
commit;
prompt 68 records loaded
prompt Loading PMS_ROLE...
insert into PMS_ROLE (id, status, remark, type, create_user, create_time, editor_user, edit_time, role_code, role_name, org_id, assign_org_id)
values (24, 1, 'admintest', 1, 'admin', to_timestamp('23-06-2017 11:42:52.697000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 'admintest', 'test', 100000, null);
insert into PMS_ROLE (id, status, remark, type, create_user, create_time, editor_user, edit_time, role_code, role_name, org_id, assign_org_id)
values (1, 1, '超级管理员角色', 1, 'admin', to_timestamp('17-05-2017 16:56:32.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('17-05-2017 16:56:32.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', '超级管理员角色', 100000, null);
insert into PMS_ROLE (id, status, remark, type, create_user, create_time, editor_user, edit_time, role_code, role_name, org_id, assign_org_id)
values (2, 1, '游客角色', 1, 'admin', to_timestamp('17-05-2017 16:56:32.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'guest', to_timestamp('17-05-2017 16:56:32.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'guest', '游客角色', 100000, null);
insert into PMS_ROLE (id, status, remark, type, create_user, create_time, editor_user, edit_time, role_code, role_name, org_id, assign_org_id)
values (21, 1, '小米机构管理员-这个账号登录可以给该机构下创建操作用户', 1, 'admin', to_timestamp('21-06-2017 14:16:16.543000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 'xiaomiadmin', '小米机构管理员', 100050, null);
insert into PMS_ROLE (id, status, remark, type, create_user, create_time, editor_user, edit_time, role_code, role_name, org_id, assign_org_id)
values (22, 1, '小米操作员角色xiaomicz', 1, 'xiaomi', to_timestamp('21-06-2017 14:25:14.593000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 'xiaomicz', '小米操作员角色', 100050, null);
insert into PMS_ROLE (id, status, remark, type, create_user, create_time, editor_user, edit_time, role_code, role_name, org_id, assign_org_id)
values (20, 1, '中亿XX管理员角色', 1, 'admin', to_timestamp('21-06-2017 14:02:58.123000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('21-06-2017 14:03:05.168000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'zhongyiadmin', '中亿XX管理员角色', 100001, null);
commit;
prompt 6 records loaded
prompt Loading PMS_ROLE_OPERATOR...
insert into PMS_ROLE_OPERATOR (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, operator_id)
values (1, 'admin', to_timestamp('17-05-2017 16:56:37.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:37.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, null, 1, 1);
insert into PMS_ROLE_OPERATOR (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, operator_id)
values (2, 'admin', to_timestamp('17-05-2017 16:56:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, null, 2, 1);
insert into PMS_ROLE_OPERATOR (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, operator_id)
values (3, 'admin', to_timestamp('17-05-2017 16:56:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('17-05-2017 16:56:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, null, 2, 2);
insert into PMS_ROLE_OPERATOR (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, operator_id)
values (23, 'admin', to_timestamp('20-06-2017 20:54:24.943000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 25);
insert into PMS_ROLE_OPERATOR (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, operator_id)
values (24, 'admin', to_timestamp('21-06-2017 14:20:11.594000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 26);
insert into PMS_ROLE_OPERATOR (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, operator_id)
values (25, 'xiaomi', to_timestamp('21-06-2017 16:33:53.729000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 22, 27);
insert into PMS_ROLE_OPERATOR (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, operator_id)
values (32, 'admin', to_timestamp('23-06-2017 12:08:25.909000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 22);
insert into PMS_ROLE_OPERATOR (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, operator_id)
values (22, 'admin', to_timestamp('20-06-2017 11:53:25.725000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 24);
commit;
prompt 8 records loaded
prompt Loading PMS_ROLE_PERMISSION...
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (363, 'admin', to_timestamp('13-06-2017 15:14:40.644000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 2, 21);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (364, 'admin', to_timestamp('13-06-2017 15:14:40.656000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 2, 31);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (365, 'admin', to_timestamp('13-06-2017 15:14:40.664000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 2, 1);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (366, 'admin', to_timestamp('13-06-2017 15:14:40.676000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 2, 73);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (367, 'admin', to_timestamp('13-06-2017 15:14:40.685000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 2, 61);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (368, 'admin', to_timestamp('13-06-2017 15:14:40.695000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 2, 11);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (369, 'admin', to_timestamp('13-06-2017 15:14:40.706000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 2, 51);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (119, 'admin', to_timestamp('15-06-2017 21:02:05.820000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 22);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (120, 'admin', to_timestamp('15-06-2017 21:02:05.845000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 24);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (121, 'admin', to_timestamp('15-06-2017 21:02:05.851000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 23);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (122, 'admin', to_timestamp('15-06-2017 21:02:05.858000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 21);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (123, 'admin', to_timestamp('15-06-2017 21:02:05.864000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 25);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (124, 'admin', to_timestamp('15-06-2017 21:02:05.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 32);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (125, 'admin', to_timestamp('15-06-2017 21:02:05.879000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 33);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (126, 'admin', to_timestamp('15-06-2017 21:02:05.887000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 31);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (127, 'admin', to_timestamp('15-06-2017 21:02:05.893000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 34);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (128, 'admin', to_timestamp('15-06-2017 21:02:05.902000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 35);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (129, 'admin', to_timestamp('15-06-2017 21:02:05.908000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 2);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (130, 'admin', to_timestamp('15-06-2017 21:02:05.916000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 4);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (131, 'admin', to_timestamp('15-06-2017 21:02:05.923000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 3);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (132, 'admin', to_timestamp('15-06-2017 21:02:05.930000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 1);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (133, 'admin', to_timestamp('15-06-2017 21:02:05.938000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 12);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (134, 'admin', to_timestamp('15-06-2017 21:02:05.946000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 14);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (135, 'admin', to_timestamp('15-06-2017 21:02:05.955000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 13);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (136, 'admin', to_timestamp('15-06-2017 21:02:05.961000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 11);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (137, 'admin', to_timestamp('15-06-2017 21:02:05.968000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 73);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (138, 'admin', to_timestamp('15-06-2017 21:02:05.975000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, '1', 100, 111);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1000, 'admin', to_timestamp('21-06-2017 10:40:46.145000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 22);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1001, 'admin', to_timestamp('21-06-2017 10:40:46.222000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 24);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1002, 'admin', to_timestamp('21-06-2017 10:40:46.240000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 23);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1003, 'admin', to_timestamp('21-06-2017 10:40:46.302000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 21);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1004, 'admin', to_timestamp('21-06-2017 10:40:46.328000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 25);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1005, 'admin', to_timestamp('21-06-2017 10:40:46.357000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 32);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1006, 'admin', to_timestamp('21-06-2017 10:40:46.398000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 111);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1007, 'admin', to_timestamp('21-06-2017 10:40:46.411000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 33);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1008, 'admin', to_timestamp('21-06-2017 10:40:46.422000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 31);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1009, 'admin', to_timestamp('21-06-2017 10:40:46.442000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 34);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1010, 'admin', to_timestamp('21-06-2017 10:40:46.454000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 35);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1011, 'admin', to_timestamp('21-06-2017 10:40:46.463000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 63);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1012, 'admin', to_timestamp('21-06-2017 10:40:46.499000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 117);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1013, 'admin', to_timestamp('21-06-2017 10:40:46.506000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 119);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1014, 'admin', to_timestamp('21-06-2017 10:40:46.525000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 118);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1015, 'admin', to_timestamp('21-06-2017 10:40:46.553000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 116);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1016, 'admin', to_timestamp('21-06-2017 10:40:46.646000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 1);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1017, 'admin', to_timestamp('21-06-2017 10:40:46.657000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 112);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1018, 'admin', to_timestamp('21-06-2017 10:40:46.669000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 114);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1019, 'admin', to_timestamp('21-06-2017 10:40:46.836000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 113);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1020, 'admin', to_timestamp('21-06-2017 10:40:46.869000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 57);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1021, 'admin', to_timestamp('21-06-2017 10:40:46.913000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 56);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1022, 'admin', to_timestamp('21-06-2017 10:40:46.928000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 120);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1023, 'admin', to_timestamp('21-06-2017 10:40:46.939000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 121);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1024, 'admin', to_timestamp('21-06-2017 10:40:46.957000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 55);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1025, 'admin', to_timestamp('21-06-2017 10:40:47.014000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 132);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1026, 'admin', to_timestamp('21-06-2017 10:40:47.033000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 58);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1027, 'admin', to_timestamp('21-06-2017 10:40:47.045000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 60);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1028, 'admin', to_timestamp('21-06-2017 10:40:47.086000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 59);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1029, 'admin', to_timestamp('21-06-2017 10:40:47.113000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 61);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1030, 'admin', to_timestamp('21-06-2017 10:40:47.131000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 20, 11);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1031, 'admin', to_timestamp('21-06-2017 14:17:17.221000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 22);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1032, 'admin', to_timestamp('21-06-2017 14:17:17.234000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 24);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1033, 'admin', to_timestamp('21-06-2017 14:17:17.243000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 23);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1034, 'admin', to_timestamp('21-06-2017 14:17:17.257000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 21);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1035, 'admin', to_timestamp('21-06-2017 14:17:17.265000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 25);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1036, 'admin', to_timestamp('21-06-2017 14:17:17.273000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 32);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1037, 'admin', to_timestamp('21-06-2017 14:17:17.284000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 111);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1038, 'admin', to_timestamp('21-06-2017 14:17:17.302000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 33);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1039, 'admin', to_timestamp('21-06-2017 14:17:17.320000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 31);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1040, 'admin', to_timestamp('21-06-2017 14:17:17.330000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 34);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1041, 'admin', to_timestamp('21-06-2017 14:17:17.361000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 35);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1042, 'admin', to_timestamp('21-06-2017 14:17:17.392000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 21, 1);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1422, 'admin', to_timestamp('23-06-2017 12:09:34.767000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 150);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1423, 'admin', to_timestamp('23-06-2017 12:09:34.786000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 22);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1424, 'admin', to_timestamp('23-06-2017 12:09:34.795000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 24);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1425, 'admin', to_timestamp('23-06-2017 12:09:34.805000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 23);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1426, 'admin', to_timestamp('23-06-2017 12:09:34.813000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 21);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1427, 'admin', to_timestamp('23-06-2017 12:09:34.821000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 25);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1428, 'admin', to_timestamp('23-06-2017 12:09:34.829000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 32);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1429, 'admin', to_timestamp('23-06-2017 12:09:34.837000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 111);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1430, 'admin', to_timestamp('23-06-2017 12:09:34.845000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 33);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1431, 'admin', to_timestamp('23-06-2017 12:09:34.854000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 31);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1432, 'admin', to_timestamp('23-06-2017 12:09:34.867000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 34);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1433, 'admin', to_timestamp('23-06-2017 12:09:34.875000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 35);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1434, 'admin', to_timestamp('23-06-2017 12:09:34.883000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 64);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1435, 'admin', to_timestamp('23-06-2017 12:09:34.893000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 66);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1436, 'admin', to_timestamp('23-06-2017 12:09:34.900000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 65);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1437, 'admin', to_timestamp('23-06-2017 12:09:34.912000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 63);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1438, 'admin', to_timestamp('23-06-2017 12:09:34.921000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 117);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1439, 'admin', to_timestamp('23-06-2017 12:09:34.930000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 119);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1440, 'admin', to_timestamp('23-06-2017 12:09:34.938000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 118);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1441, 'admin', to_timestamp('23-06-2017 12:09:34.946000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 116);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1442, 'admin', to_timestamp('23-06-2017 12:09:34.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 144);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1443, 'admin', to_timestamp('23-06-2017 12:09:34.970000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 145);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1444, 'admin', to_timestamp('23-06-2017 12:09:34.977000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 143);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1445, 'admin', to_timestamp('23-06-2017 12:09:34.986000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 2);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1446, 'admin', to_timestamp('23-06-2017 12:09:34.993000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 4);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1447, 'admin', to_timestamp('23-06-2017 12:09:35.001000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 3);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1448, 'admin', to_timestamp('23-06-2017 12:09:35.012000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 1);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1449, 'admin', to_timestamp('23-06-2017 12:09:35.021000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 148);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1450, 'admin', to_timestamp('23-06-2017 12:09:35.029000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 112);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1451, 'admin', to_timestamp('23-06-2017 12:09:35.037000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 114);
commit;
prompt 100 records committed...
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1452, 'admin', to_timestamp('23-06-2017 12:09:35.045000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 113);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1453, 'admin', to_timestamp('23-06-2017 12:09:35.054000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 57);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1454, 'admin', to_timestamp('23-06-2017 12:09:35.065000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 56);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1455, 'admin', to_timestamp('23-06-2017 12:09:35.077000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 120);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1456, 'admin', to_timestamp('23-06-2017 12:09:35.087000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 121);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1457, 'admin', to_timestamp('23-06-2017 12:09:35.095000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 55);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1458, 'admin', to_timestamp('23-06-2017 12:09:35.103000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 132);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1459, 'admin', to_timestamp('23-06-2017 12:09:35.118000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 58);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1460, 'admin', to_timestamp('23-06-2017 12:09:35.126000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 60);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1461, 'admin', to_timestamp('23-06-2017 12:09:35.135000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 59);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1462, 'admin', to_timestamp('23-06-2017 12:09:35.143000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 61);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1463, 'admin', to_timestamp('23-06-2017 12:09:35.152000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 136);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1464, 'admin', to_timestamp('23-06-2017 12:09:35.161000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 138);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1465, 'admin', to_timestamp('23-06-2017 12:09:35.172000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 137);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1466, 'admin', to_timestamp('23-06-2017 12:09:35.182000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 135);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1467, 'admin', to_timestamp('23-06-2017 12:09:35.190000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 12);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1468, 'admin', to_timestamp('23-06-2017 12:09:35.200000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 14);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1469, 'admin', to_timestamp('23-06-2017 12:09:35.210000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 13);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1470, 'admin', to_timestamp('23-06-2017 12:09:35.221000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 11);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1471, 'admin', to_timestamp('23-06-2017 12:09:35.229000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 50);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1472, 'admin', to_timestamp('23-06-2017 12:09:35.238000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 52);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1473, 'admin', to_timestamp('23-06-2017 12:09:35.247000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 51);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1474, 'admin', to_timestamp('23-06-2017 12:09:35.254000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 20);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1475, 'admin', to_timestamp('23-06-2017 12:09:35.262000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 125);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1476, 'admin', to_timestamp('23-06-2017 12:09:35.273000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 130);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1477, 'admin', to_timestamp('23-06-2017 12:09:35.285000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 129);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1478, 'admin', to_timestamp('23-06-2017 12:09:35.294000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 122);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1479, 'admin', to_timestamp('23-06-2017 12:09:35.303000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 140);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1480, 'admin', to_timestamp('23-06-2017 12:09:35.313000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 131);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1481, 'admin', to_timestamp('23-06-2017 12:09:35.322000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 133);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1482, 'admin', to_timestamp('23-06-2017 12:09:35.331000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 134);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1483, 'admin', to_timestamp('23-06-2017 12:09:35.338000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 73);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1484, 'admin', to_timestamp('23-06-2017 12:09:35.345000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 24, 147);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1926, 'admin', to_timestamp('24-06-2017 10:15:56.707000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 150);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1927, 'admin', to_timestamp('24-06-2017 10:15:56.718000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 22);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1928, 'admin', to_timestamp('24-06-2017 10:15:56.725000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 24);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1929, 'admin', to_timestamp('24-06-2017 10:15:56.731000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 23);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1930, 'admin', to_timestamp('24-06-2017 10:15:56.740000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 21);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1931, 'admin', to_timestamp('24-06-2017 10:15:56.746000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 25);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1932, 'admin', to_timestamp('24-06-2017 10:15:56.752000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 32);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1933, 'admin', to_timestamp('24-06-2017 10:15:56.758000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 111);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1934, 'admin', to_timestamp('24-06-2017 10:15:56.763000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 33);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1935, 'admin', to_timestamp('24-06-2017 10:15:56.769000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 31);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1936, 'admin', to_timestamp('24-06-2017 10:15:56.776000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 34);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1937, 'admin', to_timestamp('24-06-2017 10:15:56.786000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 35);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1938, 'admin', to_timestamp('24-06-2017 10:15:56.794000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 64);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1939, 'admin', to_timestamp('24-06-2017 10:15:56.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 66);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1940, 'admin', to_timestamp('24-06-2017 10:15:56.808000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 65);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1941, 'admin', to_timestamp('24-06-2017 10:15:56.818000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 63);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1942, 'admin', to_timestamp('24-06-2017 10:15:56.829000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 117);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1943, 'admin', to_timestamp('24-06-2017 10:15:56.836000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 119);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1944, 'admin', to_timestamp('24-06-2017 10:15:56.842000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 118);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1945, 'admin', to_timestamp('24-06-2017 10:15:56.848000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 116);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1946, 'admin', to_timestamp('24-06-2017 10:15:56.853000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 144);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1947, 'admin', to_timestamp('24-06-2017 10:15:56.861000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 145);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1948, 'admin', to_timestamp('24-06-2017 10:15:56.867000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 143);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1949, 'admin', to_timestamp('24-06-2017 10:15:56.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 2);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1950, 'admin', to_timestamp('24-06-2017 10:15:56.879000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 4);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1951, 'admin', to_timestamp('24-06-2017 10:15:56.889000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 3);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1952, 'admin', to_timestamp('24-06-2017 10:15:56.896000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 1);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1953, 'admin', to_timestamp('24-06-2017 10:15:56.909000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 148);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1954, 'admin', to_timestamp('24-06-2017 10:15:56.916000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 112);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1955, 'admin', to_timestamp('24-06-2017 10:15:56.924000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 114);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1956, 'admin', to_timestamp('24-06-2017 10:15:56.932000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 113);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1957, 'admin', to_timestamp('24-06-2017 10:15:56.940000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 57);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1958, 'admin', to_timestamp('24-06-2017 10:15:56.946000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 152);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1959, 'admin', to_timestamp('24-06-2017 10:15:56.952000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 56);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1960, 'admin', to_timestamp('24-06-2017 10:15:56.958000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 120);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1961, 'admin', to_timestamp('24-06-2017 10:15:56.964000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 121);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1962, 'admin', to_timestamp('24-06-2017 10:15:56.970000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 55);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1963, 'admin', to_timestamp('24-06-2017 10:15:56.978000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 132);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1964, 'admin', to_timestamp('24-06-2017 10:15:56.986000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 58);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1965, 'admin', to_timestamp('24-06-2017 10:15:56.993000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 60);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1966, 'admin', to_timestamp('24-06-2017 10:15:57.003000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 59);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1967, 'admin', to_timestamp('24-06-2017 10:15:57.012000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 61);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (1968, 'admin', to_timestamp('24-06-2017 10:15:57.021000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 151);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (140, 'admin', to_timestamp('24-06-2017 10:15:57.012000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 62);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (142, 'admin', to_timestamp('23-06-2017 12:09:35.345000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 147);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (141, 'admin', to_timestamp('24-06-2017 10:15:57.021000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 135);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (143, 'admin', to_timestamp('23-06-2017 12:09:35.190000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 12);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (144, 'admin', to_timestamp('24-06-2017 10:15:56.970000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 153);
insert into PMS_ROLE_PERMISSION (id, create_user, create_time, editor_user, edit_time, status, remark, role_id, permission_id)
values (145, 'admin', to_timestamp('21-06-2017 10:40:46.957000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, 154);
commit;
prompt 182 records loaded
prompt Loading PMS_SCAN_ORDER...
insert into PMS_SCAN_ORDER (trans_id, org_id, client_type, mcode, tcode, merchant_order_id, merchant_order_time, order_type_id, pay_channel_type, clear_type, clear_mcode_type, trade_type, trans_money, fee_money, fee_rate, charge_amount, ip, client_info, remark, status, channel_id, bank_order_num, qrcode_url, qrcode_img_url, auth_code, org_trans_id, third_order_num, bank_type, bank_bill_no, coupon_fee, refund_channel, card_type, opening_bank, create_time, create_long_time, edit_time, edit_long_time, pay_date, pay_long_time, merchant_id, terminal_id, son_mcode, req_code, req_msg, notify_url, notify_cnt, notify_status, callback_date, callback_long_time, is_investig, marked_red, description, iss_status, iss_req_code, iss_req_msg, revenue_fee_money, receivable_money, maori, other_param)
values ('1000011', 100000, 1, '138458170611098', '600001', '11111', to_timestamp('20-06-2017 20:38:31.204000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1001, 1001, 1, 1, 1, 10000, 10, .02, 10, null, null, null, 1, 1, '99999999', null, null, null, null, null, null, null, null, null, 2, null, to_timestamp('20-06-2017 20:38:31.204000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498213162, to_timestamp('20-06-2017 20:38:31.204000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1498213162, null, null, null, null, '1', '1', '99999', null, 0, 1, to_timestamp('20-06-2017 20:38:31.204000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 1, '1', '1', null, null, null, null);
commit;
prompt 1 records loaded
prompt Loading PMS_TERMINAL...
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600001', '138458170611001', 'a', 'b', 'c', 'd', 'e', 1, 1, 1, 'wuhp', to_timestamp('13-06-2017 04:56:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, '测试', 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600019', '138458170611098', '014145138BE7C18F8DFC838F989885BE', 'D7A228D2CE3E4AC0B08BB316E9FB0AAE', 'A47F8C3A92504F6996BCFEC3A416B168', 'CAD98840593ABB5C0FFFEF9CE9077559', 'B174DFD45C50B6498EF45B400D5E41AD', 1, 1, 1, '李四', to_timestamp('20-06-2017 20:39:29.694000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600020', '138458170611098', '26022B79DA8EA4F9B42593C15E490991', '6E59548A3BFB96CEBAC8C6A463A8E084', 'DD21CF296EE8C2DB255A1699E63C3D66', '404D0240A003E3F76E22D90FCB5A5F3C', 'DE988D78881E1C461852B76A413C5D19', 1, 1, 1, 'wuhp', to_timestamp('20-06-2017 20:42:54.220000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600027', '138458170611088', '62F55C39B4A22A281F332D0A27794AD9', '2966ED6C88E79A819D2ABC3EF6A102AD', 'F3FCAC269D9C9FCF5FA422630C5011F6', 'B67BDCD122352009B3C8C3FC258EABB9', '32D8F524B0A6BE2893628ACD14CD8004', 1, 1, 1, '测试终端修改', to_timestamp('21-06-2017 14:52:25.094000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 2, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600028', '138458170611088', 'D850EB250F0CDA0B887497B1954F5692', 'ED9C28EAD7C46F5142D998D454832D31', '088D3558E263FDC257227162CE9FDA14', '362F6D0BDEA9E079663F32B803DFD40E', '1D1BCD27F99452D9822C04CA0B313818', 1, 1, 1, 'wuhongpu测试', to_timestamp('21-06-2017 14:54:50.476000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, null, 5);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600029', '138458170611091', '404CA200D442967011529FBB18C6C23B', '267355F072C14185DD7FDE0ADDEE2288', '89A67F2BBFD4DEC9A8682D9043D6AAB2', 'DC79587E6782CE808AB186590C4758D1', 'A7C3F2E47994DEC0D9FD5A329450F85D', 1, 1, 1, '333333', to_timestamp('21-06-2017 14:55:42.031000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 5, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600030', '138458170611088', 'F9854E8377E5898E88D1AFB14987FE9C', '0516B69F6BBF9447585A2A3CF41577A4', '219A9C0E2CBFC5EF1EFF711963598BBA', '2F690FA1C0A9F64D00F85465C5E8C5FF', '381141D91B3AD07C155CF2AFE355C84E', 1, 1, 1, 'wuhongpu测试', to_timestamp('21-06-2017 14:56:38.970000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 5, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600031', '138458170611088', '4A57BD0FAFBF0298FB1C8C5554A94F1D', 'F0FC53EA55818D3AE9EFE6E5A4D0CFA7', '3FC3164C160E97CA9E33A7A6FB676DE2', '36E1F1A38D5DFBAB078DD17FC591DB90', '943785BA76782A2B63AA4F1D27794622', 1, 0, 1, 'wuhongpu测试', to_timestamp('21-06-2017 14:59:49.400000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, null, 5);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600011', '138458170611082', '5ABCD3EBFA585862282EF34EADF1AA95', 'CC208B6FC5E8BEAED02295C07B57E5DF', 'CC1E58F07BD29E12612CE07F10104877', 'AF3172813F8F3273B0611D58FE670D55', '0DB2E052F1050B0583077AED5E01A2BB', 1, 1, 1, 'wuhp', to_timestamp('19-06-2017 15:21:24.934000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600026', '138458170611091', 'ABA7A98513EFC45687BB67EF980A9AF4', '7A6199CE4791DB1B611622CADAE68734', 'DAD0E5454C0B074BBA2F2EF989F79ED0', '0F96B3CA1C20B2F09622BE060275C89C', '3A004CD64949613735B2645AA9181336', 1, 1, 1, '333333', to_timestamp('21-06-2017 14:37:07.617000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 5);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600004', '138458170611074', '1', '2', '3', '4', '5', 1, 1, 1, '测试1111,wuhp', to_timestamp('19-06-2017 11:06:24.793000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600006', '138458170611077', '1', '2', '3', '4', '5', 1, 1, 1, '2222,测试3', to_timestamp('19-06-2017 11:24:20.971000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 5, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600009', '138458170611080', '1', '2', '3', '4', '5', 1, 1, 1, 'ss', to_timestamp('19-06-2017 13:17:01.605000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600010', '138458170611081', '1', '2', '3', '4', '5', 1, 1, 1, '222', to_timestamp('19-06-2017 13:20:46.637000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600013', '333', 'F8E2394A157B37FBCF9A3ABEFB6714C3', '934F35695AAA64E38E1EF68F13DFC403', '9FDA43840E08F6D0D4A755532C306368', '81B85AD9A580E6C5E7929F735C45FADE', '3664D340174E00B75AAFDF9130852C80', 1, 1, 1, 'heloo', to_timestamp('20-06-2017 16:36:31.687000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600014', '138458170611088', '12B05B29F29DE3D58E76C37CA218D9C0', 'B49BD6CA9F98E83CE5D67727382ECAF2', '4597320AAAF29806F318FEA74D784EB2', '6CC739873E9209297757D709AA040930', '943637DACC44951E4A5D993177A4EBDD', 1, 1, 1, 'wuhp', to_timestamp('20-06-2017 16:59:15.775000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600015', '138458170611091', '0756CAB15D5CD4E1C2B1D4C7C1979554', '58C335484B8AFCC4FA67E8E852AAE6B4', '7E8C3C484130A733C760F672260B2242', 'F500C417ECE63297A5BA942D563666ED', 'D74FD2F54EB31D515A92729CC2DA0460', 1, 1, 1, '333333', to_timestamp('20-06-2017 17:02:29.100000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600016', '138458170611088', '31847677BD40A8AF25D7F4F255986AB6', 'B50708811936699055738D6B722FF7D3', '99A2998C06A11A5C767232077EA0D34D', '4C2E9B3D129D18C3F6E9DB7B0789B150', 'B9F6750A154FC9D4ED300E9FCE26313D', 1, 1, 1, 'wuhongpu测试', to_timestamp('20-06-2017 17:04:51.958000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600017', '138458170611088', '18FC48BD99A02364DEA02FE7D777EE3D', '08EEE4D5EB94B56E71DFD904D686ACA7', '9106E5C97C2CE81B53FE8B861F1FD98D', '406BABCC37B1B0248DD8C6E8CEAC264B', 'BB4B4E3A5CD2A350D7C9263A1E210D25', 1, 1, 1, 'wuhongpu测试', to_timestamp('20-06-2017 17:07:03.371000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600018', '138458170611088', '0C198E3D616C5CD21F304947A7EED756', '82D3E142BA543708427DA4A8F60B1DD6', 'C77E98807B23BDBF11278C2354E91C40', '648E84A7DC1159D91B6654B668EA0915', '0251DFF562C64DB8C82511DEABEF9752', 1, 1, 1, 'hello', to_timestamp('20-06-2017 17:27:59.803000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600021', '138458170611091', '41CA22B40738A6133F51CD8CA7D11F6B', '31E34490CD090FC8FF05254116DF22A2', '8811914538A18857DB1D0FDF417E43C5', '848E69C97F64C8138281B0365EAE3A06', 'F2409BF3C603A361957C682FC73D1FF9', 1, 1, 1, '333333', to_timestamp('21-06-2017 14:06:01.603000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 5);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600022', '138458170611088', '78FC80FB4059A2C7278040D221A8A5E8', '82975E7DA656F26608F674E89DA40245', 'E25B015B472E5D774118E86B3EC5821D', 'C40A077F7E073ACE9BF7D6062272B419', '903FD0BED60B5B69F9A6439A45B934B6', 1, 1, 1, 'wuhongpu测试', to_timestamp('21-06-2017 14:06:17.678000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 5);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600023', '138458170611091', '5C732DBAC7567A5A37595F9647BE6EAF', 'F5347F591910E4069495E58F98539359', '40DF41E2FD906166588C7D46077B8BBD', 'F43585E0AF87E9D9B58A4200768EE5E4', '1FF88BDB0A0764FEB606D41E4BBBA303', 1, 1, 1, '333333', to_timestamp('21-06-2017 14:07:59.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, 1, null, 5);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600024', '138458170611091', '0CE6717459E02CF677CC6925D67A8DEC', 'DC3130F2542E6B6CA5E009BDAF1103DB', 'E1CEE5EE1CCDE9F81FA3086D0739F2AA', '30683FC715FF07B6A7CA6E3CF3770EDB', '2C35BE901A48D844D6D20106A5FC33E7', 1, 1, 1, '333333', to_timestamp('21-06-2017 14:08:13.213000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 5);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600025', '138458170611091', 'A769391D0BA30A64ADF9272D2C618124', '2A2214DAA2E022B9EBE0BD2F358B20B7', '5CAE1AD8E0AD77512045E2758F9698E3', 'CDE8EA3FDCAD8B3C97B9B6439F321DC0', 'CE97F10FD5BE35EB1350054EB765D4FB', 1, 1, 1, '333333', to_timestamp('21-06-2017 14:08:23.291000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 5);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600032', '138458170611099', '78639095B2D1E20742FFB4F8263329DD', 'A6ADE0378B666D110DF9B729A4E5D660', '071C2E8B94A20829F519B55E90699DA4', 'A64BD9A6595009FFA99DA17BD56801BA', 'AAD0FC4FD4CF53F8CA8A36D362F216ED', 1, 0, 1, '额额额额额', to_timestamp('21-06-2017 16:36:09.042000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600002', '138458170611073', '1', '2', '3', '4', '5', 1, 1, 1, ',', to_timestamp('19-06-2017 10:23:03.390000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600003', '138458170611073,', '1', '2', '3', '4', '5', 1, 1, 1, '测试,', to_timestamp('19-06-2017 10:26:27.194000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600005', '138458170611075', '1', '2', '3', '4', '5', 1, 1, 1, '333333333,wuhp', to_timestamp('19-06-2017 11:15:02.244000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600007', '138458170611078', '1', '2', '3', '4', '5', 1, 1, 1, 'wuhp123456', to_timestamp('19-06-2017 11:54:09.594000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
insert into PMS_TERMINAL (tcode, mcode, main_key, pin_key, track_key, callback_key, sensitive_key, active, deleted, role_id, create_user, create_time, editor_user, edit_time, channel_id, status, description, client_type)
values ('600008', '138458170611079', '1', '2', '3', '4', '5', 1, 1, 1, '333', to_timestamp('19-06-2017 12:07:53.760000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 6, 1, null, 1);
commit;
prompt 31 records loaded
prompt Loading PMS_TERMINAL_CHANNEL...
prompt Table is empty
prompt Loading PMS_TERMINAL_C_INTO...
prompt Table is empty
prompt Loading PMS_TERMINAL_C_INTO_FEERATE...
prompt Table is empty
prompt Loading PMS_TERMINAL_FEERATE...
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600019', '138458170611098', 2, .36, 1, 0, 0, .25, 1, 0, .158, 0, '李四', to_timestamp('20-06-2017 20:39:29.694000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600020', '600020', 2, .33, 0, 0, 0, .23, 0, 0, .39, 0, 'wuhp', to_timestamp('20-06-2017 20:42:54.220000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600027', '600027', 4, .169, 0, 0, 0, .123, 0, 0, .359, 0, '测试终端修改', to_timestamp('21-06-2017 14:52:25.094000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 2, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600028', '600028', 4, .169, 0, 0, 0, .123, 0, 0, .359, 0, 'wuhongpu测试', to_timestamp('21-06-2017 14:54:50.476000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600029', '600029', 1, .123, 0, 0, 1, .169, 0, 0, .36, 0, '333333', to_timestamp('21-06-2017 14:55:42.031000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600030', '600030', 4, .169, 0, 0, 0, .123, 0, 0, .359, 0, 'wuhongpu测试', to_timestamp('21-06-2017 14:56:38.970000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600031', '600031', 4, .169, 0, 0, 0, .123, 0, 0, .359, 0, 'wuhongpu测试', to_timestamp('21-06-2017 14:59:49.400000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600011', '138458170611082', 2, .22, 1, 0, 1, .44, 0, 1, .88, 1, 'wuhop', to_timestamp('19-06-2017 15:21:24.934000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600026', '600026', 4, .123, 0, 0, 1, .169, 0, 0, .36, 0, '333333', to_timestamp('21-06-2017 14:37:07.617000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600009', '138458170611080', 2, .1, 0, 0, 0, .12, 0, 0, .18, 0, '测试', to_timestamp('19-06-2017 13:17:01.605000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600010', '138458170611081', 2, .12, 0, 1, 1, .13, 0, 0, .77, 1, 'wuhp', to_timestamp('19-06-2017 13:20:46.637000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600014', '138458170611088', 2, .46, 0, 0, 0, .23, 0, 0, .169, 0, 'wuhp', to_timestamp('20-06-2017 16:59:15.775000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600015', '138458170611091', 2, .123, 0, 0, 1, .169, 0, 0, .36, 0, '333333', to_timestamp('20-06-2017 17:02:29.100000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600016', '138458170611088', 2, .169, 0, 0, 0, .123, 0, 0, .359, 0, 'wuhongpu测试', to_timestamp('20-06-2017 17:04:51.958000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600017', '138458170611088', 2, .169, 0, 0, 0, .123, 0, 0, .359, 0, 'wuhongpu测试', to_timestamp('20-06-2017 17:07:03.371000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600018', '600018', 2, .33, 0, 0, 0, .123, 0, 0, .88, 1, 'hello', to_timestamp('20-06-2017 17:27:59.803000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600021', '600021', 1, .123, 0, 0, 1, .169, 0, 0, .36, 0, '333333', to_timestamp('21-06-2017 14:06:01.603000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600022', '600022', 1, .169, 0, 0, 0, .123, 0, 0, .359, 0, 'wuhongpu测试', to_timestamp('21-06-2017 14:06:17.678000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600023', '600023', 2, .123, 0, 0, 1, .169, 0, 0, .36, 0, '333333', to_timestamp('21-06-2017 14:07:59.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600024', '600024', 2, .123, 0, 0, 1, .169, 0, 0, .36, 0, '333333', to_timestamp('21-06-2017 14:08:13.213000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600025', '600025', 7, .123, 0, 0, 1, .169, 0, 0, .36, 0, '333333', to_timestamp('21-06-2017 14:08:23.291000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600032', '138458170611099', 2, .369, 0, 1, 0, .23, 1, 0, .231, 0, '额额额额额', to_timestamp('21-06-2017 16:36:09.042000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600007', '138458170611078', 2, .222, 1, 1, 0, .32, 0, 0, .55, 1, '车市', to_timestamp('19-06-2017 11:54:09.594000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
insert into PMS_TERMINAL_FEERATE (tcode, mcode, pay_channel_type, fee_rate, pay_fee, fd_max_fee, fd_min_fee, debit_fee_rate, debit_fd_max_fee, debit_fd_min_fee, d0_fj_rate, d0_fj_fee, create_user, create_time, editor_user, edit_time, status, remark)
values ('600008', '138458170611079', 2, .12, 0, 0, 0, .33, 0, 0, .33, 0, '3333', to_timestamp('19-06-2017 12:07:53.760000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null);
commit;
prompt 24 records loaded
prompt Loading PMS_TERMINAL_MONEY...
prompt Table is empty
prompt Loading PMS_TERMINAL_PRIVILEGES...
prompt Table is empty
prompt Loading PMS_TRANS_INVESTIG...
prompt Table is empty
prompt Loading PMS_TRANS_REFUSECARD...
prompt Table is empty
prompt Loading PMS_WORDBOOK...
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (21, 'TREAN_CARD_ORDER_STATUS', '交易失败', '0', '0', 1, 'test', to_timestamp('23-06-2017 14:50:05.656000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0交易失败 1交易成功 2银行交易处理中 3 未付款 4等待对方付款 5关闭交易 6 交易已撤销 7 交易发起撤销  10 撤销失败');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (22, 'TREAN_CARD_ORDER_STATUS', '交易成功', '1', '1', 1, 'test', to_timestamp('23-06-2017 14:50:32.949000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0交易失败 1交易成功 2银行交易处理中 3 未付款 4等待对方付款 5关闭交易 6 交易已撤销 7 交易发起撤销  10 撤销失败');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (23, 'TREAN_CARD_ORDER_STATUS', '银行交易处理中', '2', '2', 1, 'test', to_timestamp('23-06-2017 14:50:54.150000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0交易失败 1交易成功 2银行交易处理中 3 未付款 4等待对方付款 5关闭交易 6 交易已撤销 7 交易发起撤销  10 撤销失败');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (24, 'TREAN_CARD_ORDER_STATUS', '未付款', '3', '3', 1, 'test', to_timestamp('23-06-2017 14:51:09.816000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0交易失败 1交易成功 2银行交易处理中 3 未付款 4等待对方付款 5关闭交易 6 交易已撤销 7 交易发起撤销  10 撤销失败');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (25, 'TREAN_CARD_ORDER_STATUS', '等待对方付款', '4', '4', 1, 'test', to_timestamp('23-06-2017 14:51:26.377000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0交易失败 1交易成功 2银行交易处理中 3 未付款 4等待对方付款 5关闭交易 6 交易已撤销 7 交易发起撤销  10 撤销失败');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (26, 'TREAN_CARD_ORDER_STATUS', '关闭交易', '5', '5', 1, 'test', to_timestamp('23-06-2017 14:51:50.595000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0交易失败 1交易成功 2银行交易处理中 3 未付款 4等待对方付款 5关闭交易 6 交易已撤销 7 交易发起撤销 10 撤销失败');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (27, 'TREAN_CARD_ORDER_STATUS', '交易已撤销', '6', '6', 1, 'test', to_timestamp('23-06-2017 14:52:12.585000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0交易失败 1交易成功 2银行交易处理中 3 未付款 4等待对方付款 5关闭交易 6 交易已撤销 7 交易发起撤销 10 撤销失败');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (28, 'TREAN_CARD_ORDER_STATUS', '交易发起撤销', '7', '7', 1, 'test', to_timestamp('23-06-2017 14:52:43.985000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0交易失败 1交易成功 2银行交易处理中 3 未付款 4等待对方付款 5关闭交易 6 交易已撤销 7 交易发起撤销 10 撤销失败');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (29, 'TREAN_CARD_ORDER_STATUS', '撤销失败', '10', '10', 1, 'test', to_timestamp('23-06-2017 14:52:59.394000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0交易失败 1交易成功 2银行交易处理中 3 未付款 4等待对方付款 5关闭交易 6 交易已撤销 7 交易发起撤销 10 撤销失败');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (1, 'CHANNEL_PAY_TYPE', '微信支付', '1001', '1001', 1, 'admin', to_timestamp('17-06-2017 15:02:00.473000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('23-06-2017 17:54:41.101000', 'dd-mm-yyyy hh24:mi:ss.ff'), '支付渠道类型-微信支付');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (2, 'CHANNEL_PAY_TYPE', '支付宝', '1002', '1002', 1, 'admin', to_timestamp('17-06-2017 15:02:34.091000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('23-06-2017 17:54:49.458000', 'dd-mm-yyyy hh24:mi:ss.ff'), '支付渠道类型-支付宝');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (3, 'CHANNEL_PAY_TYPE', '银联钱包', '1003', '1003', 1, 'admin', to_timestamp('17-06-2017 15:02:53.632000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('23-06-2017 17:54:56.826000', 'dd-mm-yyyy hh24:mi:ss.ff'), '支付渠道类型-银联钱包');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (4, 'CHANNEL_PAY_TYPE', 'QQ钱包', '1004', '1004', 1, 'admin', to_timestamp('17-06-2017 15:03:13.870000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('23-06-2017 17:55:03.315000', 'dd-mm-yyyy hh24:mi:ss.ff'), '支付渠道类型-QQ钱包');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (5, 'CHANNEL_PAY_TYPE', '银行卡刷卡', '2001', '2001', 1, 'admin', to_timestamp('17-06-2017 15:03:40.858000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('23-06-2017 17:55:23.745000', 'dd-mm-yyyy hh24:mi:ss.ff'), '支付渠道类型- 银行卡刷卡');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (42, 'CARD_TYPE', '借记卡', '1', '1', 1, 'test', to_timestamp('24-06-2017 15:18:21.995000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '主卡类型 （ 1借记卡 2贷记卡 3准贷记卡 4预付费卡）');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (7, 'CHANNEL_M_ROLE_ID', '混合', '1', '1', 1, 'admin', to_timestamp('17-06-2017 15:18:06.791000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('18-06-2017 18:21:25.011000', 'dd-mm-yyyy hh24:mi:ss.ff'), '商户通道表-终端角色');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (43, 'CARD_TYPE', '贷记卡', '2', '2', 1, 'test', to_timestamp('24-06-2017 15:18:37.674000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '主卡类型 （ 1借记卡 2贷记卡 3准贷记卡 4预付费卡）');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (44, 'CARD_TYPE', '准贷记卡', '3', '3', 1, 'test', to_timestamp('24-06-2017 15:19:00.969000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '主卡类型 （ 1借记卡 2贷记卡 3准贷记卡 4预付费卡）');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (45, 'CARD_TYPE', '预付费卡', '4', '4', 1, 'test', to_timestamp('24-06-2017 15:19:17.053000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '主卡类型 （ 1借记卡 2贷记卡 3准贷记卡 4预付费卡）');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (30, 'TREAN_SCAN_ORDER_STATUS', '交易失败', '0', '0', 1, 'test', to_timestamp('23-06-2017 17:37:26.087000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('23-06-2017 17:38:38.842000', 'dd-mm-yyyy hh24:mi:ss.ff'), '扫码表pms_scan_order交易状态数据字典');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (31, 'TREAN_SCAN_ORDER_STATUS', '交易成功', '1', '1', 1, 'test', to_timestamp('23-06-2017 17:39:50.518000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('23-06-2017 17:43:20.298000', 'dd-mm-yyyy hh24:mi:ss.ff'), '0 交易失败 1交易成功 2处理中 3等待付款 4未上送 5交易关闭 6未知状态回调  7交易已撤销 8交易发起撤销 9撤销失败 10单边长款 11违法嫌疑');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (32, 'TREAN_SCAN_ORDER_STATUS', '处理中', '2', '2', 1, 'test', to_timestamp('23-06-2017 17:40:06.637000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('23-06-2017 17:43:55.118000', 'dd-mm-yyyy hh24:mi:ss.ff'), '0 交易失败 1交易成功 2处理中 3等待付款 4未上送 5交易关闭 6未知状态回调  7交易已撤销 8交易发起撤销 9撤销失败 10单边长款 11违法嫌疑');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (33, 'TREAN_SCAN_ORDER_STATUS', '等待付款', '3', '3', 1, 'test', to_timestamp('23-06-2017 17:40:29.560000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('23-06-2017 17:44:05.850000', 'dd-mm-yyyy hh24:mi:ss.ff'), '0 交易失败 1交易成功 2处理中 3等待付款 4未上送 5交易关闭 6未知状态回调  7交易已撤销 8交易发起撤销 9撤销失败 10单边长款 11违法嫌疑');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (34, 'TREAN_SCAN_ORDER_STATUS', '未上送', '4', '4', 1, 'test', to_timestamp('23-06-2017 17:42:55.994000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0 交易失败 1交易成功 2处理中 3等待付款 4未上送 5交易关闭 6未知状态回调  7交易已撤销 8交易发起撤销 9撤销失败 10单边长款 11违法嫌疑');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (35, 'TREAN_SCAN_ORDER_STATUS', '交易关闭', '5', '5', 1, 'test', to_timestamp('23-06-2017 17:44:28.627000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0 交易失败 1交易成功 2处理中 3等待付款 4未上送 5交易关闭 6未知状态回调 7交易已撤销 8交易发起撤销 9撤销失败 10单边长款 11违法嫌疑');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (36, 'TREAN_SCAN_ORDER_STATUS', '未知状态回调', '6', '6', 1, 'test', to_timestamp('23-06-2017 17:44:45.536000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0 交易失败 1交易成功 2处理中 3等待付款 4未上送 5交易关闭 6未知状态回调 7交易已撤销 8交易发起撤销 9撤销失败 10单边长款 11违法嫌疑');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (37, 'TREAN_SCAN_ORDER_STATUS', '交易已撤销', '7', '7', 1, 'test', to_timestamp('23-06-2017 17:45:02.200000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0 交易失败 1交易成功 2处理中 3等待付款 4未上送 5交易关闭 6未知状态回调 7交易已撤销 8交易发起撤销 9撤销失败 10单边长款 11违法嫌疑');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (38, 'TREAN_SCAN_ORDER_STATUS', '交易发起撤销', '8', '8', 1, 'test', to_timestamp('23-06-2017 17:45:20.326000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'test', to_timestamp('23-06-2017 17:45:38.329000', 'dd-mm-yyyy hh24:mi:ss.ff'), '0 交易失败 1交易成功 2处理中 3等待付款 4未上送 5交易关闭 6未知状态回调 7交易已撤销 8交易发起撤销 9撤销失败 10单边长款 11违法嫌疑');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (39, 'TREAN_SCAN_ORDER_STATUS', '撤销失败', '9', '9', 1, 'test', to_timestamp('23-06-2017 17:46:01.742000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0 交易失败 1交易成功 2处理中 3等待付款 4未上送 5交易关闭 6未知状态回调 7交易已撤销 8交易发起撤销 9撤销失败 10单边长款 11违法嫌疑');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (40, 'TREAN_SCAN_ORDER_STATUS', '单边长款', '10', '10', 1, 'test', to_timestamp('23-06-2017 17:46:23.503000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0 交易失败 1交易成功 2处理中 3等待付款 4未上送 5交易关闭 6未知状态回调 7交易已撤销 8交易发起撤销 9撤销失败 10单边长款 11违法嫌疑');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (41, 'TREAN_SCAN_ORDER_STATUS', '违法嫌疑', '11', '11', 1, 'test', to_timestamp('23-06-2017 17:46:34.402000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '0 交易失败 1交易成功 2处理中 3等待付款 4未上送 5交易关闭 6未知状态回调 7交易已撤销 8交易发起撤销 9撤销失败 10单边长款 11违法嫌疑');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (8, 'CHANNEL_M_ROLE_ID', '费率', '2', '2', 1, 'admin', to_timestamp('18-06-2017 18:22:35.144000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '商户通道表-终端角色');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (9, 'CHANNEL_M_STATUS', '未使用', '0', '0', 1, 'admin', to_timestamp('18-06-2017 18:26:16.554000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'admin', to_timestamp('18-06-2017 18:31:17.746000', 'dd-mm-yyyy hh24:mi:ss.ff'), '商户通道表-状态');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (10, 'CHANNEL_M_STATUS', '正在使用', '2', '2', 1, 'admin', to_timestamp('18-06-2017 18:27:29.304000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '商户通道表-状态');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (11, 'CHANNEL_M_STATUS', '正在使用', '1', '1', 1, 'admin', to_timestamp('18-06-2017 18:32:08.749000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '通道商户号表-状态');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (12, 'CHANNEL_M_STATUS', '收满暂停', '3', '3', 1, 'admin', to_timestamp('18-06-2017 18:33:24.507000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '通道商户号表-状态');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (13, 'CHANNEL_M_STATUS', '指定商户收款', '4', '4', 1, 'admin', to_timestamp('18-06-2017 18:33:45.928000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '通道商户号表-状态');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (17, 'TRAN_CARD_ORDER_TYPE', '消费', '2001', '2001', 1, 'test', to_timestamp('23-06-2017 14:16:49.574000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '订单类型' || chr(13) || '' || chr(10) || '2001   消费' || chr(13) || '' || chr(10) || '2002   冲正' || chr(13) || '' || chr(10) || '2003   退货   需要原路返回');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (18, 'TRAN_CARD_ORDER_TYPE', '冲正', '2002', '2002', 1, 'test', to_timestamp('23-06-2017 14:17:26.436000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '订单类型' || chr(13) || '' || chr(10) || '2001   消费' || chr(13) || '' || chr(10) || '2002   冲正' || chr(13) || '' || chr(10) || '2003   退货   需要原路返回');
insert into PMS_WORDBOOK (id, type, name, value1, value2, status, create_user, create_time, editor_user, edit_time, remark)
values (19, 'TRAN_CARD_ORDER_TYPE', '退货', '2003', '2003', 1, 'test', to_timestamp('23-06-2017 14:17:47.738000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, '订单类型' || chr(13) || '' || chr(10) || '2001   消费' || chr(13) || '' || chr(10) || '2002   冲正' || chr(13) || '' || chr(10) || '2003   退货   需要原路返回');
commit;
prompt 40 records loaded
prompt Enabling triggers for CARD_ACCOUNT_CHECK_BATCH...
alter table CARD_ACCOUNT_CHECK_BATCH enable all triggers;
prompt Enabling triggers for CARD_ACCOUNT_CHECK_BILL...
alter table CARD_ACCOUNT_CHECK_BILL enable all triggers;
prompt Enabling triggers for CARD_ACCOUNT_CHECK_MISTAKE...
alter table CARD_ACCOUNT_CHECK_MISTAKE enable all triggers;
prompt Enabling triggers for CARD_ACCOUNT_CHECK_MISTAKE_P...
alter table CARD_ACCOUNT_CHECK_MISTAKE_P enable all triggers;
prompt Enabling triggers for PMS_CARD_ORDER...
alter table PMS_CARD_ORDER enable all triggers;
prompt Enabling triggers for PMS_CARD_ORDER_TEMP...
alter table PMS_CARD_ORDER_TEMP enable all triggers;
prompt Enabling triggers for PMS_CHANNEL...
alter table PMS_CHANNEL enable all triggers;
prompt Enabling triggers for PMS_CHANNEL_M...
alter table PMS_CHANNEL_M enable all triggers;
prompt Enabling triggers for PMS_CHANNEL_ORG...
alter table PMS_CHANNEL_ORG enable all triggers;
prompt Enabling triggers for PMS_CHANNEL_TYPE...
alter table PMS_CHANNEL_TYPE enable all triggers;
prompt Enabling triggers for PMS_ERROR_CODE...
alter table PMS_ERROR_CODE enable all triggers;
prompt Enabling triggers for PMS_FC_T_TRANSLIMIT...
alter table PMS_FC_T_TRANSLIMIT enable all triggers;
prompt Enabling triggers for PMS_IDBLACKLIST...
alter table PMS_IDBLACKLIST enable all triggers;
prompt Enabling triggers for PMS_ISS_CLEAR...
alter table PMS_ISS_CLEAR enable all triggers;
prompt Enabling triggers for PMS_ISS_ORDER...
alter table PMS_ISS_ORDER enable all triggers;
prompt Enabling triggers for PMS_ISS_ORDER_LOG...
alter table PMS_ISS_ORDER_LOG enable all triggers;
prompt Enabling triggers for PMS_MENU...
alter table PMS_MENU enable all triggers;
prompt Enabling triggers for PMS_MENU_ROLE...
alter table PMS_MENU_ROLE enable all triggers;
prompt Enabling triggers for PMS_MERCHANT...
alter table PMS_MERCHANT enable all triggers;
prompt Enabling triggers for PMS_MERCHANT_CLEANING...
alter table PMS_MERCHANT_CLEANING enable all triggers;
prompt Enabling triggers for PMS_MERCHANT_REGISTER...
alter table PMS_MERCHANT_REGISTER enable all triggers;
prompt Enabling triggers for PMS_OPERATOR...
alter table PMS_OPERATOR enable all triggers;
prompt Enabling triggers for PMS_OPERATOR_LOG...
alter table PMS_OPERATOR_LOG enable all triggers;
prompt Enabling triggers for PMS_ORGANIZATION...
alter table PMS_ORGANIZATION enable all triggers;
prompt Enabling triggers for PMS_ORG_CHANNEL...
alter table PMS_ORG_CHANNEL enable all triggers;
prompt Enabling triggers for PMS_ORG_CLEANING...
alter table PMS_ORG_CLEANING enable all triggers;
prompt Enabling triggers for PMS_ORG_CONTRACT...
alter table PMS_ORG_CONTRACT enable all triggers;
prompt Enabling triggers for PMS_ORG_REGISTER...
alter table PMS_ORG_REGISTER enable all triggers;
prompt Enabling triggers for PMS_PERMISSION...
alter table PMS_PERMISSION enable all triggers;
prompt Enabling triggers for PMS_ROLE...
alter table PMS_ROLE enable all triggers;
prompt Enabling triggers for PMS_ROLE_OPERATOR...
alter table PMS_ROLE_OPERATOR enable all triggers;
prompt Enabling triggers for PMS_ROLE_PERMISSION...
alter table PMS_ROLE_PERMISSION enable all triggers;
prompt Enabling triggers for PMS_SCAN_ORDER...
alter table PMS_SCAN_ORDER enable all triggers;
prompt Enabling triggers for PMS_TERMINAL...
alter table PMS_TERMINAL enable all triggers;
prompt Enabling triggers for PMS_TERMINAL_CHANNEL...
alter table PMS_TERMINAL_CHANNEL enable all triggers;
prompt Enabling triggers for PMS_TERMINAL_C_INTO...
alter table PMS_TERMINAL_C_INTO enable all triggers;
prompt Enabling triggers for PMS_TERMINAL_C_INTO_FEERATE...
alter table PMS_TERMINAL_C_INTO_FEERATE enable all triggers;
prompt Enabling triggers for PMS_TERMINAL_FEERATE...
alter table PMS_TERMINAL_FEERATE enable all triggers;
prompt Enabling triggers for PMS_TERMINAL_MONEY...
alter table PMS_TERMINAL_MONEY enable all triggers;
prompt Enabling triggers for PMS_TERMINAL_PRIVILEGES...
alter table PMS_TERMINAL_PRIVILEGES enable all triggers;
prompt Enabling triggers for PMS_TRANS_INVESTIG...
alter table PMS_TRANS_INVESTIG enable all triggers;
prompt Enabling triggers for PMS_TRANS_REFUSECARD...
alter table PMS_TRANS_REFUSECARD enable all triggers;
prompt Enabling triggers for PMS_WORDBOOK...
alter table PMS_WORDBOOK enable all triggers;
set feedback on
set define on
prompt Done.
