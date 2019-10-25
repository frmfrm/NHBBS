/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/10/24 23:17:39                          */
/*==============================================================*/


drop table if exists comment;

drop table if exists data;

drop table if exists follow;

drop table if exists massage;

drop table if exists notice;

drop table if exists post;

drop table if exists reply;

drop table if exists surport;

drop table if exists user;

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   commId               int not null,
   commContext          varchar(1000),
   commTime             datetime,
   postId               int,
   userId               int,
   primary key (commId)
);

alter table comment comment 'comment';

/*==============================================================*/
/* Table: data                                                  */
/*==============================================================*/
create table data
(
   dict_id              int not null,
   dict_parent_id       int,
   dict_index           int,
   dict_name            varchar(50),
   dict_value           varchar(50),
   primary key (dict_id)
);

alter table data comment 'data';

/*==============================================================*/
/* Table: follow                                                */
/*==============================================================*/
create table follow
(
   followId             int not null,
   userId_Befollowed    int,
   userId_follow        int,
   primary key (followId)
);

alter table follow comment 'follow';

/*==============================================================*/
/* Table: massage                                               */
/*==============================================================*/
create table massage
(
   massageId            int not null,
   massageContext       varchar(1000),
   massageTime          datetime,
   primary key (massageId)
);

alter table massage comment 'massage';

/*==============================================================*/
/* Table: notice                                                */
/*==============================================================*/
create table notice
(
   noticeId             int not null,
   massageId            int,
   userId               int,
   flag                 int,
   primary key (noticeId)
);

alter table notice comment 'notice';

/*==============================================================*/
/* Table: post                                                  */
/*==============================================================*/
create table post
(
   postId               int not null,
   postType             varchar(50),
   userId               int,
   dict_id              int,
   postTime             datetime,
   postTitle            varchar(100),
   postContext          varchar(1000),
   surport              int,
   primary key (postId)
);

alter table post comment 'post';

/*==============================================================*/
/* Table: reply                                                 */
/*==============================================================*/
create table reply
(
   userId_Bereplyed     int,
   userId_reply         int,
   replyId              int not null,
   replyContext         varchar(1000),
   primary key (replyId)
);

alter table reply comment 'reply';

/*==============================================================*/
/* Table: surport                                               */
/*==============================================================*/
create table surport
(
   surpId               int not null,
   userId_surport       int,
   userId_Besurported   int,
   postId               int,
   primary key (surpId)
);

alter table surport comment 'surport';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   userId               int not null,
   userSex              varchar(4),
   userName             varchar(20),
   userTel              varchar(20),
   userEmail            varchar(30),
   userPwd              varchar(30),
   fans                 int,
   follow               int,
   primary key (userId)
);

alter table user comment 'user';

alter table comment add constraint FK_Reference_2 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table comment add constraint FK_Reference_6 foreign key (postId)
      references post (postId) on delete restrict on update restrict;

alter table data add constraint FK_Reference_1 foreign key (dict_parent_id)
      references data (dict_id) on delete restrict on update restrict;

alter table follow add constraint FK_Reference_12 foreign key (userId_Befollowed)
      references user (userId) on delete restrict on update restrict;

alter table follow add constraint FK_Reference_13 foreign key (userId_follow)
      references user (userId) on delete restrict on update restrict;

alter table notice add constraint FK_Reference_10 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table notice add constraint FK_Reference_11 foreign key (massageId)
      references massage (massageId) on delete restrict on update restrict;

alter table post add constraint FK_Reference_14 foreign key (dict_id)
      references data (dict_id) on delete restrict on update restrict;

alter table post add constraint FK_Reference_9 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table reply add constraint FK_Reference_7 foreign key (userId_Bereplyed)
      references user (userId) on delete restrict on update restrict;

alter table reply add constraint FK_Reference_8 foreign key (userId_reply)
      references user (userId) on delete restrict on update restrict;

alter table surport add constraint FK_Reference_3 foreign key (userId_surport)
      references user (userId) on delete restrict on update restrict;

alter table surport add constraint FK_Reference_4 foreign key (userId_Besurported)
      references user (userId) on delete restrict on update restrict;

alter table surport add constraint FK_Reference_5 foreign key (postId)
      references post (postId) on delete restrict on update restrict;

