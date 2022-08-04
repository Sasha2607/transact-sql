set dateformat ymd
if object_id('tempdb..#empl') is not null
	drop table #empl

CREATE TABLE #empl (
	[id] [nvarchar](50) NOT NULL,
	[dadd] [datetime] NULL,
	[num] [nvarchar](50) NOT NULL,
	[tp] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[objid] [nvarchar](50) NOT NULL,
	[a] [char](1) NOT NULL,
	[lstupdt] [datetime] NULL,
	[userid] [nvarchar](50) NULL,
	[parentid] [nvarchar](50) NULL,
	[platform] [varchar](50) NULL) 


INSERT INTO #empl
           ([id],[dadd],[num],[tp],[name],[objid],[a],[lstupdt],[userid],[parentid],[platform])
     VALUES
           ('FFC39E50-8251-425F-89C3-C2210A8FB21A','2019-08-31 11:50:03','EMP66','BASE','OOO KLIMOVA_1','100','Y',N'2019-08-31 11:50:03','EBB8D29B-A7A2-4B2F-940A-1883146DD082',NULL,NULL),
		   ('FFFF0035-5EC9-487C-AC03-14B8B0AEBD8B','2019-09-19 14:47:43','EMP67','DEF','OOO IVANOVA','200','Y',N'2019-09-19 14:47:43','EBB8D29B-A7A2-4B2F-940A-1883146DD082',NULL,NULL),
		   ('FE91C04A-4CBF-494D-8EFE-5789A3484F79','2019-09-04 09:59:30','EMP68','DEF','OOO LUKOV','300','Y',N'2019-09-04 09:59:30','EBB8D29B-A7A2-4B2F-940A-1883146DD082',NULL,NULL)


if object_id('tempdb..#acc') is not null
	drop table #acc

CREATE TABLE #acc(
	[id] [nvarchar](50) NOT NULL,
	[dadd] [datetime] NOT NULL,
	[emplid] [nvarchar](50) NOT NULL,
	[num] [nvarchar](50) NOT NULL,
	[tp] [nvarchar](50) NULL,
	[balance] [money] NOT NULL,
	[hold] [money] NOT NULL,
	[limit] [money] NOT NULL,
	[balanceFree] [money] NOT NULL,
	[lstupdt] [datetime] NULL,
	[userid] [nvarchar](50) NULL,
	[dclose] [datetime] NULL
) ON [PRIMARY]
GO

INSERT INTO #acc
           ([id],[dadd],[emplid],[num],[tp],[balance],[hold],[limit],[balanceFree],[lstupdt],[userid],[dclose])
     VALUES 
('B1FB86E3-1D88-43FA-83E9-BA1057A72D4B',	'2020-08-13 01:44:17.033',	'FFC39E50-8251-425F-89C3-C2210A8FB21A',	'AC10135',	'DEF',	'0.00',	'0.00',	'0.00',	'0.00',	'2020-08-13 01:44:17.033',	'E1389E52-312E-40EB-A554-7AF0873CB7BC',	NULL),
('41AA0F76-CE1E-46F3-BB3C-641429FC0F2E',	'2020-08-13 01:44:17.287',	'FFC39E50-8251-425F-89C3-C2210A8FB21A',	'AC10136',	'BDD',	'0.00',	'0.00',	'0.00',	'0.00',	'2020-08-13 01:44:17.287',	'E1389E52-312E-40EB-A554-7AF0873CB7BC',	NULL),
('FB4A0E05-7C51-450A-A2AD-AA9426430118',	'2020-08-13 01:44:17.483',	'FFC39E50-8251-425F-89C3-C2210A8FB21A',	'AC10137',	'BSP',	'0.00',	'0.00',	'0.00',	'0.00',	'2020-08-13 01:44:17.483',	'E1389E52-312E-40EB-A554-7AF0873CB7BC',	NULL),
('D81570F3-A9D5-4B8E-ACC8-0FDE79E78CC5',	'2020-08-13 01:44:17.860',	'FFC39E50-8251-425F-89C3-C2210A8FB21A',	'AC10138',	'TEN',	'0.00',	'0.00',	'0.00',	'0.00',	'2020-08-13 01:44:17.860',	'E1389E52-312E-40EB-A554-7AF0873CB7BC',	NULL),
('E01205FC-96E8-43A0-BC06-7747DFFA9D72',	'2020-07-30 10:50:12.057',	'FFFF0035-5EC9-487C-AC03-14B8B0AEBD8B',	'AC2189',	'BDD',	'0.00',	'0.00',	'0.00',	'0.00',	'2020-07-30 10:50:12.057',	'63E45ED8-3A17-4B9C-8FF2-E421BB3898B4',	NULL),
('91B7DFBC-BFA6-43A0-92BD-237DCF455B67',	'2020-02-21 13:35:35.170',	'FFFF0035-5EC9-487C-AC03-14B8B0AEBD8B',	'AC674',	'DEF',	'0.00',	'0.00',	'0.00',	'0.00',	'2020-02-21 13:35:35.170',	'E1389E52-312E-40EB-A554-7AF0873CB7BC',	NULL),
('ED9255E8-68E6-4CA1-B4EB-54F47857BA50',	'2020-07-30 10:50:13.023',	'FE91C04A-4CBF-494D-8EFE-5789A3484F79',	'AC2209',	'DEF',	'0.00',	'0.00',	'0.00',	'0.00',	'2020-07-30 10:50:13.023',	'63E45ED8-3A17-4B9C-8FF2-E421BB3898B4',	NULL)

if object_id('tempdb..#acc_map') is not null
	drop table #acc_map


CREATE TABLE #acc_map(
	[id] [nvarchar](50) NOT NULL,
	[dadd] [datetime] NULL,
	[a_accid] [nvarchar](50) NOT NULL,
	[b_accid] [nvarchar](50) NOT NULL,
	[tp] [nvarchar](50) NOT NULL,
	[a] [char](1) NULL
) 


INSERT INTO #acc_map
           ([id],[dadd],[a_accid],[b_accid],[tp],[a])
     VALUES 
('82C637A1-1B6A-4B33-8972-1C9E44C799A0',	'2020-08-13 01:44:17.287',	'B1FB86E3-1D88-43FA-83E9-BA1057A72D4B',	'41AA0F76-CE1E-46F3-BB3C-641429FC0F2E',	'BDD',	'Y'),
('EFCD3A71-436C-4FF6-B7E5-C624FA644C1A',	'2020-08-13 01:44:17.483',	'B1FB86E3-1D88-43FA-83E9-BA1057A72D4B', 'FB4A0E05-7C51-450A-A2AD-AA9426430118',	'BSP',	'Y'),
('52D7E888-DF52-44BD-9706-45567F6FE352',	'2020-08-13 01:44:17.857',	'B1FB86E3-1D88-43FA-83E9-BA1057A72D4B',	'D81570F3-A9D5-4B8E-ACC8-0FDE79E78CC5',	'TEN',	'Y'),
('AB147F3E-7F47-4D7C-A14C-95C2AF3202C8',	'2020-07-30 10:50:12.057',	'91B7DFBC-BFA6-43A0-92BD-237DCF455B67',	'E01205FC-96E8-43A0-BC06-7747DFFA9D72',	'BDD',	'Y')

--Задание: получить сл джейсон
--1
--{"id":"FFFF0035-5EC9-487C-AC03-14B8B0AEBD8B","dadd":"2019-09-19T14:47:43.937","num":"EMP67","tp":"DEF","name":"OOO IVANOVA","objid":"200","a":"Y","lstupdt":"2019-09-19T14:47:43.937","userid":"EBB8D29B-A7A2-4B2F-940A-1883146DD082","accs_related":[{"id":"E01205FC-96E8-43A0-BC06-7747DFFA9D72","dadd":"2020-07-30T10:50:12.057","balance":0.0000,"userid":"63E45ED8-3A17-4B9C-8FF2-E421BB3898B4"}]},{"id":"FFFF0035-5EC9-487C-AC03-14B8B0AEBD8B","dadd":"2019-09-19T14:47:43.937","num":"EMP67","tp":"DEF","name":"OOO IVANOVA","objid":"200","a":"Y","lstupdt":"2019-09-19T14:47:43.937","userid":"EBB8D29B-A7A2-4B2F-940A-1883146DD082","accs_related":[{"id":"91B7DFBC-BFA6-43A0-92BD-237DCF455B67","dadd":"2020-02-21T13:35:35.170","balance":0.0000,"userid":"E1389E52-312E-40EB-A554-7AF0873CB7BC"}]}

	Select empl.*, 
	 (select accs_related.id,accs_related.dadd,accs_related.balance,accs_related.userid
	 for json path) as accs_related
	From #acc as accs_related
	inner join #empl as empl on accs_related.emplid = empl.[id]
	where 
    accs_related.emplid='FFFF0035-5EC9-487C-AC03-14B8B0AEBD8B'  and accs_related.[id] = 'E01205FC-96E8-43A0-BC06-7747DFFA9D72' 
	or
	accs_related.emplid='FFFF0035-5EC9-487C-AC03-14B8B0AEBD8B' and accs_related.[id] = '91B7DFBC-BFA6-43A0-92BD-237DCF455B67'
	for json auto,without_array_wrapper

--2
--{"id":"FE91C04A-4CBF-494D-8EFE-5789A3484F79","dadd":"2019-09-04T09:59:30.907","num":"EMP68","tp":"DEF","name":"OOO LUKOV","objid":"300","a":"Y","lstupdt":"2019-09-04T09:59:30.907","userid":"EBB8D29B-A7A2-4B2F-940A-1883146DD082","status":"ok","accs":[{"id":"ED9255E8-68E6-4CA1-B4EB-54F47857BA50","dadd":"2020-07-30T10:50:13.023","emplid":"FE91C04A-4CBF-494D-8EFE-5789A3484F79","num":"AC2209","tp":"DEF","balance":0.0000,"hold":0.0000,"limit":0.0000,"balanceFree":0.0000,"lstupdt":"2020-07-30T10:50:13.023","userid":"63E45ED8-3A17-4B9C-8FF2-E421BB3898B4","accs_related":[{}]}]}

	select empl.id, empl.dadd, empl.num, empl.tp, empl.[name], 
	empl.[objid], empl.a, empl.lstupdt, empl.userid,'ok' as status,
	(select  accs.*,(select accs_related.*  for json path)as accs_related for json path)as accs
	From #empl as empl
	left join #acc as accs on empl.id = accs.[emplid] 
	left join #acc_map accs_related on accs.id = accs_related.[a_accid] or  accs.id = accs_related.[b_accid] 
	where empl.id = 'FE91C04A-4CBF-494D-8EFE-5789A3484F79' 
	for json auto, WITHOUT_ARRAY_WRAPPER  
--3
--{"id":"FFC39E50-8251-425F-89C3-C2210A8FB21A","dadd":"2019-08-31T11:50:03.667","num":"EMP66","tp":"BASE","name":"OOO KLIMOVA_1","objid":"100","a":"Y","lstupdt":"2019-08-31T11:50:03.667","userid":"EBB8D29B-A7A2-4B2F-940A-1883146DD082","cnt_empl":1,"accs":[{"id":"B1FB86E3-1D88-43FA-83E9-BA1057A72D4B","dadd":"2020-08-13T01:44:17.033","emplid":"FFC39E50-8251-425F-89C3-C2210A8FB21A","num":"AC10135","tp":"DEF","balance":0.0000,"hold":0.0000,"limit":0.0000,"balanceFree":0.0000,"lstupdt":"2020-08-13T01:44:17.033","userid":"E1389E52-312E-40EB-A554-7AF0873CB7BC","accs_related":[{"id":"41AA0F76-CE1E-46F3-BB3C-641429FC0F2E","dadd":"2020-08-13T01:44:17.287","tp":"BDD","balance":0.0000,"userid":"E1389E52-312E-40EB-A554-7AF0873CB7BC"}]},{"id":"B1FB86E3-1D88-43FA-83E9-BA1057A72D4B","dadd":"2020-08-13T01:44:17.033","emplid":"FFC39E50-8251-425F-89C3-C2210A8FB21A","num":"AC10135","tp":"DEF","balance":0.0000,"hold":0.0000,"limit":0.0000,"balanceFree":0.0000,"lstupdt":"2020-08-13T01:44:17.033","userid":"E1389E52-312E-40EB-A554-7AF0873CB7BC","accs_related":[{"id":"FB4A0E05-7C51-450A-A2AD-AA9426430118","dadd":"2020-08-13T01:44:17.483","tp":"BSP","balance":0.0000,"userid":"E1389E52-312E-40EB-A554-7AF0873CB7BC"}]},{"id":"B1FB86E3-1D88-43FA-83E9-BA1057A72D4B","dadd":"2020-08-13T01:44:17.033","emplid":"FFC39E50-8251-425F-89C3-C2210A8FB21A","num":"AC10135","tp":"DEF","balance":0.0000,"hold":0.0000,"limit":0.0000,"balanceFree":0.0000,"lstupdt":"2020-08-13T01:44:17.033","userid":"E1389E52-312E-40EB-A554-7AF0873CB7BC","accs_related":[{"id":"D81570F3-A9D5-4B8E-ACC8-0FDE79E78CC5","dadd":"2020-08-13T01:44:17.860","tp":"TEN","balance":0.0000,"userid":"E1389E52-312E-40EB-A554-7AF0873CB7BC"}]},{"id":"41AA0F76-CE1E-46F3-BB3C-641429FC0F2E","dadd":"2020-08-13T01:44:17.287","emplid":"FFC39E50-8251-425F-89C3-C2210A8FB21A","num":"AC10136","tp":"BDD","balance":0.0000,"hold":0.0000,"limit":0.0000,"balanceFree":0.0000,"lstupdt":"2020-08-13T01:44:17.287","userid":"E1389E52-312E-40EB-A554-7AF0873CB7BC","accs_related":[{}]},{"id":"FB4A0E05-7C51-45
	
	select 
	empl.*, 1 as cnt_empl,
	accs.* ,
	json_query (iif( accs_related.[a_accid]  is not null,
	(select accs_related.b_accid as id, accs_related.dadd,
	accs_related.tp, accs.balance, accs.userid
	for json path),(select accs.[dclose] for json path))) as accs_related
	From #empl as empl
	left join #acc as accs on empl.id  = accs.[emplid] 
	left join #acc_map as accs_related on accs.id = accs_related.[a_accid] 
	left join #acc_map as x1 on empl.id = accs_related.[b_accid] 
	where empl.id = 'FFC39E50-8251-425F-89C3-C2210A8FB21A' --and
	for json auto,  WITHOUT_ARRAY_WRAPPER

