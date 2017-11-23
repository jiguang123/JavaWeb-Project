use master
go
--��D�̽�һ���ļ���

--�����ݿ�
if exists(select * from sysdatabases where name='Eatery_DB')
drop database Eatery_DB
go
create database Eatery_DB                 
on
(
	name = Eatery_DB_dat,
	filename = 'C:\Eatery_DB.mdf',
	size = 1MB,
	maxsize = 100MB,
	filegrowth = 1%
)
log on 
(
	name = Eatery_DB_log,
	filename = 'C:\Eatery_DB.ldf',
	size = 1MB,
	maxsize = 100MB,
	filegrowth = 1%
)
go

use Eatery_DB
go


--��������Ա��--

if exists (select * from sysobjects where name='ManageInfo')
drop table ManageInfo
go
create table ManageInfo
(
	m_id      int primary key identity(1,1) not null,   	--����Աid
	m_name    varchar(20) not null,		      	    	--����
	m_pass	  varchar(50) not null,				--����	
	m_age	  int ,				      	    	--����	
	m_sex 	  int ,				      		--�Ա�(1�����У�2����Ů)
	m_tel     varchar(20),			     		--��ϵ�绰
	m_address varchar(150),			      		--סַ
	m_email	  varchar(50)			      		--�����ʼ�
)
go

--�����û���

if exists (select * from sysobjects where name='UserInfo')
drop table UserInfo
go
create table UserInfo
(
	u_id      int primary key identity(1,1) not null,   	--�û�id
	u_name    varchar(20) not null,		      	    	--�û���
	u_pass	  varchar(50) not null,				--����	
	u_realName varchar(20),					--��ʵ����
	u_paperCode varchar(50),				--֤������ 
	u_age	  int ,				      	    	--����	
	u_sex 	  int ,				      		--�Ա�(1�����У�2����Ů)
	u_tel     varchar(20),			     		--��ϵ�绰
	u_address varchar(150),			      		--סַ
	u_email	  varchar(50)			      		--�����ʼ�
)
go

--�������ֱ�
if exists (select * from sysobjects where name='Credit')
drop table Credit
go
create table Credit
(
	c_id	 int primary key identity(1,1) not null,   	--����id
	u_id	 int,						--�û�id(���)
	u_count	 int						--������			
)


--������ҵ��
if exists (select * from sysobjects where name='EnterpriseInfo')
drop table EnterpriseInfo
go
create table EnterpriseInfo
(
	e_id      int primary key identity(1,1) not null,   	--��ҵid
	e_name    varchar(20) not null,		      	    	--�û���
	e_pass	  varchar(50) not null,				--����	
	e_companyName varchar(50),				--��˾����
	e_linkMan varchar(50),					--��ϵ�� 
	e_tel     varchar(20),			     		--��ϵ�绰
	e_address varchar(150),			      		--��ַ
	e_email	  varchar(50),			      		--�����ʼ�
)
go

--��������������
if exists (select * from sysobjects where name='FoodBigType')
drop table FoodBigType
go
create table FoodBigType
(
	fbt_id 	int primary key identity(1,1) not null,   		--���������id
	fbt_name	varchar(50) not null				--���������  
)
go

--��������С�����
if exists (select * from sysobjects where name='FoodSmallType')
drop table FoodSmallType
go
create table FoodSmallType
(
	fst_id	 	int primary key identity(1,1) not null,		--��������id
	fst_name	varchar(50) not null,				--С��������
	fbt_id  	int						--�����id
)
go


--����������
if exists (select * from sysobjects where name='FoodInfo')
drop table FoodInfo
go
create table FoodInfo
(
	f_id 	int primary key identity(1,1) not null,   	--����id
	f_name  varchar(50) not null,				--��������
	f_price money not null,					--��������
	fst_id  int,	 					--��������(���)
	f_from  varchar(50), 					--����
	f_image varchar(50),   					--ͼ��
	f_state int,						--������״̬(0����ԭʼ״̬��1��������Ϊ�����Ƽ�,����2��������Ϊ�����Ʒ,) 
	e_id 	int,						--������ҵ(���)
	f_date	datetime	 				--����ʱ��
)
go

--��������
if exists (select * from sysobjects where name='OrderInfo')
drop table OrderInfo
go
create table OrderInfo
(
	o_id	int primary key identity(1,1) not null,		--��������id
	f_id	int,						--����id(���)
	o_count int,						--����
	u_id	int,						--�û�id(���)
	e_id	int,						--��ҵid(���)
	o_state int,						--����״̬(1.δ���,2.�����)
	o_time	datetime					--����ʱ��					 	 
)
go

--��������
if exists (select * from sysobjects where name='OrderAccessorily')
drop table OrderAccessorily
go
create table OrderAccessorily
(
	oa_id	int primary key identity(1,1) not null,		--��������id
	o_id	int,						--��������id(���)
	oa_totalprice money					--��Ʒ�ܼ� 
)
go

--����Ͷ�߱�
if exists (select * from sysobjects where name='ComplainInfo')
drop table ComplainInfo
go
create table ComplainInfo
(
	ci_id	int primary key identity(1,1) not null,		--Ͷ�߱�id
	ci_idea	varchar(200),					--Ͷ�����
	u_id	int 						--�û�id
	
)


--------------------------------�������ӹ�ϵ--------------------------------------


--���ֱ����û���֮��Ĺ�ϵ
alter table Credit add
constraint FK_CUID foreign key(u_id)  references  UserInfo(u_id)


--��������������ͱ�,������ҵ��֮��Ĺ�ϵ
alter table FoodInfo add
constraint FK_FSTID foreign key(fst_id)  references  FoodSmallType(fst_id),
constraint FK_FEID foreign key(e_id)  references  EnterpriseInfo(e_id)



--�����������û���������֮��,��ҵ��Ĺ�ϵ
alter table OrderInfo add
constraint FK_OUID foreign key(u_id)  references  UserInfo(u_id),
constraint FK_OFID foreign key(f_id)  references  FoodInfo(f_id),
constraint FK_OEID foreign key(e_id)  references  EnterpriseInfo(e_id)

--����С��������������֮��Ĺ�ϵ
alter table FoodSmallType add
constraint FK_FBTID foreign key(fbt_id)  references  FoodBigType(fbt_id)

--Ͷ�߱����û���֮��Ĺ�ϵ
alter table ComplainInfo add
constraint FK_CIUID foreign key(u_id)  references  UserInfo(u_id)

---------------------------------�������Ӳ�������------------------------------------------


--����Ա��
insert into ManageInfo values ('admin','admin',20,1,'88888888','�����ж���������','henryyuangang@163.com')

select * from ManageInfo


--�û���
insert into UserInfo values ('zhangsan','202CB962AC59075B964B07152D234B70','����','010123456789',20,1,'66666666','�����ж����26#','zhangsan@163.com')
select * from UserInfo


--��ҵ��
insert into EnterpriseInfo values ('��Ϊ1','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ2','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ3','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ4','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ5','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ6','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ7','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ8','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ9','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ10','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ11','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ12','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ13','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
insert into EnterpriseInfo values ('��Ϊ14','202CB962AC59075B964B07152D234B70','��Ϊ�Ƽ����޹�˾','����','55555555','�����пƼ���56#','huawei126.com')
select * from EnterpriseInfo

--���ֱ�
insert into Credit values (1,20)

select * from Credit

--����������

insert into FoodBigType values ('���')
insert into FoodBigType values ('�в�')
insert into FoodBigType values ('����')
insert into FoodBigType values ('�ղ�')
insert into FoodBigType values ('����')

select * from FoodBigType

--����С�����
insert into FoodSmallType values ('����',1)
insert into FoodSmallType values ('��ʳ',1)
insert into FoodSmallType values ('����',1)
insert into FoodSmallType values ('����',1)
insert into FoodSmallType values ('����',1)
insert into FoodSmallType values ('�з�',1)
insert into FoodSmallType values ('����',1)
insert into FoodSmallType values ('����',2)
insert into FoodSmallType values ('³��',2)
insert into FoodSmallType values ('�ղ�',2)
insert into FoodSmallType values ('���',2)
insert into FoodSmallType values ('������',2)
insert into FoodSmallType values ('���',2)

select * from  FoodSmallType


--������

insert into FoodInfo values ('��������',3.50,1,'����','food/image/xgongbaojiding.gif',1,1,'2006-7-6')
insert into FoodInfo values ('������',3.50,1,'����','food/image/xguobaorou.gif',1,1,'2006-6-2')
insert into FoodInfo values ('�ҳ��ֲ�',13.50,4,'̨��','food/image/xjiachangduncai.gif',1,1,'2006-6-4')
insert into FoodInfo values ('��ţ��',13.50,4,'̨��','food/image/xbanniurou.gif',1,1,'2006-2-6')
insert into FoodInfo values ('�����Ź�',13.50,4,'̨��','food/image/200652315121638498.jpg',2,1,'2006-3-6')
insert into FoodInfo values ('���Ⱥ���',13.50,4,'̨��','food/image/20065109373618555.jpg',2,1,'2006-6-9')
insert into FoodInfo values ('�Ǵ��Ｙ',13.50,4,'̨��','food/image/20065109344051414.jpg',2,1,'2006-6-26')
insert into FoodInfo values ('���ն���',13.50,4,'̨��','food/image/2006381002495861.jpg',2,1,'2006-6-16')
insert into FoodInfo values ('��Ȼţ��',13.50,4,'̨��','food/image/xziranniurou.gif',2,1,'2006-6-12')
insert into FoodInfo values ('ӣ����',13.50,4,'̨��','food/image/xyingtaorou.gif',2,1,'2006-6-21')

select * from FoodInfo order by f_date desc

--Ͷ�߱�
insert into ComplainInfo values('sfs',1)
select * from ComplainInfo



--������

insert into orderinfo values (2,3,1,1,1,'2008-7-5')
insert into orderinfo values (1,20,1,1,2,'2008-7-5')

select * from orderinfo

	
select * from foodbigtype



 