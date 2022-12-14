USE [Perevozki]
GO
/****** Object:  UserDefinedFunction [dbo].[jv]    Script Date: 23.06.2022 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[jv]
(
  @js varchar(max),
  @token varchar(500)
)
RETURNS nvarchar(max)
AS
BEGIN
  
  return iif(isnull(json_value(@js,@token),'')='',null,json_value(@js,@token))


END
GO
/****** Object:  Table [dbo].[attach]    Script Date: 23.06.2022 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attach](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NOT NULL,
	[id_transport] [uniqueidentifier] NOT NULL,
	[id_empl] [uniqueidentifier] NOT NULL,
	[status] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[check_list]    Script Date: 23.06.2022 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[check_list](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NOT NULL,
	[id_product] [uniqueidentifier] NOT NULL,
	[id_waybill] [uniqueidentifier] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[status] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 23.06.2022 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[distance] [numeric](4, 1) NOT NULL,
	[travel] [int] NOT NULL,
	[status] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 23.06.2022 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[middle_name] [nvarchar](30) NOT NULL,
	[phone] [nvarchar](11) NOT NULL,
	[email] [nvarchar](30) NOT NULL,
	[status] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empl]    Script Date: 23.06.2022 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empl](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[middle_name] [nvarchar](30) NOT NULL,
	[passport] [varchar](10) NOT NULL,
	[age] [int] NOT NULL,
	[phone] [nvarchar](11) NOT NULL,
	[email] [nvarchar](30) NOT NULL,
	[status] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 23.06.2022 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[weight] [numeric](6, 1) NOT NULL,
	[price] [numeric](6, 1) NOT NULL,
	[status] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[traffic]    Script Date: 23.06.2022 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[traffic](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NOT NULL,
	[id_attach] [uniqueidentifier] NOT NULL,
	[id_city] [uniqueidentifier] NOT NULL,
	[id_client] [uniqueidentifier] NOT NULL,
	[id_waybill] [uniqueidentifier] NOT NULL,
	[date] [datetime] NOT NULL,
	[price] [real] NOT NULL,
	[dadd_end] [datetime] NULL,
	[status] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transport]    Script Date: 23.06.2022 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transport](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NOT NULL,
	[marka_model] [nvarchar](30) NOT NULL,
	[gos_nomer] [nvarchar](15) NOT NULL,
	[max_massa] [numeric](6, 1) NOT NULL,
	[status] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[waybill]    Script Date: 23.06.2022 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[waybill](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NOT NULL,
	[num] [int] NOT NULL,
	[price] [real] NOT NULL,
	[is_edit] [char](1) NOT NULL
) ON [PRIMARY]

/****** Object:  Index [nc_attach_id]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_attach_id] ON [dbo].[attach]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_attach_id_transport_id_empl]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_attach_id_transport_id_empl] ON [dbo].[attach]
(
	[id_transport] ASC,
	[id_empl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_check_list_id]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_check_list_id] ON [dbo].[check_list]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_check_list_id_product_id_waybill]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_check_list_id_product_id_waybill] ON [dbo].[check_list]
(
	[id_product] ASC,
	[id_waybill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_сity_id]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_сity_id] ON [dbo].[city]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nc_сity_name]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_сity_name] ON [dbo].[city]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_client_id]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_client_id] ON [dbo].[client]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nc_client_phone]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_client_phone] ON [dbo].[client]
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_empl_id]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_empl_id] ON [dbo].[empl]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nc_empl_passport]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_empl_passport] ON [dbo].[empl]
(
	[passport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nc_empl_phone]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_empl_phone] ON [dbo].[empl]
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_product_id]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_product_id] ON [dbo].[product]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nc_product_name]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_product_name] ON [dbo].[product]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_traffic_id]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_traffic_id] ON [dbo].[traffic]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_traffic_id_attach]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_traffic_id_attach] ON [dbo].[traffic]
(
	[id_attach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_traffic_id_city]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_traffic_id_city] ON [dbo].[traffic]
(
	[id_city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
GO
/****** Object:  Index [nc_traffic_id_client]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_traffic_id_client] ON [dbo].[traffic]
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_traffic_id_waybill]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_traffic_id_waybill] ON [dbo].[traffic]
(
	[id_waybill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nc_transport_gos_nomer]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_transport_gos_nomer] ON [dbo].[transport]
(
	[gos_nomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
GO
/****** Object:  Index [nc_transport_id]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_transport_id] ON [dbo].[transport]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_waybill_id]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_waybill_id] ON [dbo].[waybill]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nc_waybill_num]    Script Date: 23.06.2022 10:52:28 ******/
CREATE NONCLUSTERED INDEX [nc_waybill_num] ON [dbo].[waybill]
(
	[num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[attach] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[check_list] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[check_list] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[city] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[client] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[empl] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[traffic] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[traffic] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[transport] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[waybill] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[waybill] ADD  DEFAULT ((0)) FOR [price]
GO
/****** Object:  StoredProcedure [dbo].[ms_api]    Script Date: 23.06.2022 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ms_api]
	@action varchar(50),
	@js varchar(max),
	@rp varchar(max) out
as
begin

	SET NOCOUNT ON;

	begin try
		set dateformat dmy

        -- Настройки
		declare 
		 @s         varchar(50)     = db_name()
		,@sba       varchar(50)     = substring(@action, 1, charindex('.', @action) - 1)
		,@id        uniqueidentifier
		,@err       varchar(50)
        ,@errdesc   varchar(max)
		

		,@rp_       varchar(max)
		,@jsT       varchar(max)

		--Города
		if @sba in ('city')
			begin

				declare 
					 -- Основные переменные таблицы
					 @id_city	uniqueidentifier =	dbo.jv(@js, '$.id')
					,@name   	nvarchar(30)	 =  dbo.jv(@js, '$.name')
					,@distance	numeric(4,1) 	 =	dbo.jv(@js, '$.distance')
					,@travel    int				 =	dbo.jv(@js, '$.travel')

					-- Дополнительные переменные
					,@id_temp			uniqueidentifier
                    ,@name_temp			nvarchar(30)
                    ,@status_temp		char(1)

				
				if @action in ('city.get')
					begin
						-- Записываем результат
						set @rp = (
									select city.*
									from [dbo].[city] city with(nolock)
									where ( city.[id]  = @id_city or city.[name] = @name ) and city.[status] = 'Y'
									for json path, without_array_wrapper
									)

						goto ok
					end

				if @action in ('city.create')
					begin
						-- Проверка обязательных параметров на null
						if (  @name is null or @distance is null or @travel is null )
							begin
								set @err = 'err.city_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'
								goto err
							end

						-- Проверка формата расстояния
						if (@travel <=0) or (@distance <= 0)
							begin 
								set @err = 'err.city_edit.invalid_distance'
								set @errdesc = 'Неверный формат расстояния или времени'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @name [name] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'city.get', @jsT, @rp_ out	

						-- Проверка на уже существующего наименования города
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.city_edit.not_unique_name'
								set @errdesc = 'Город с таким наименованием уже существует'
								goto err
							end

						-- Генерируем новый ИД
						set @id_city = newid()

						--Cохранияем
						insert into [dbo].[city]( [id], [dadd], [name], [distance], [travel], [status])
						values 
						(
						 @id_city
						,getdate() 
						,@name
						,@distance
						,@travel
						,'Y'
						)
								
						-- Записываем результат
						set @rp = (
									select	 @id_city	[id]		
											,@name		[name]
											,@distance	[distance]
											,@travel	[travel]
									for json path, without_array_wrapper
									)
						goto ok

					end
				   
				if @action in ('city.edit')
					begin
						-- Проверка поля id на null
						if ( @id_city is null )
							begin
								set @err = 'err.city_edit.object_not_found'
								set @errdesc = 'Город не найден'
								goto err
							end

						-- Проверка выбора изменения
						if (@name is null) and (@distance is null) and (@travel is null)
							begin
								set @err = 'err.city_edit.not_unique_name'
								set @errdesc = 'Не выбранно изменение'
								goto err
							end

						-- Проверка формата расстояния и времени
						if (@travel is not null and @travel <= 0) or (@distance is not null and @distance <= 0)
							begin 
								set @err = 'err.city_edit.invalid_distance'
								set @errdesc = 'Неверный формат расстояния или времени'
								goto err
							end
						
						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @id_city [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'city.get', @jsT, @rp_ out

						-- Проверка id на существование в активном статусе
						if dbo.jv(@rp_, '$.response.id') is null
							begin
								set @err = 'err.client_edit.object_not_found'
								set @errdesc = 'Город не найден'
								goto err
							end

						if (@name is not null)
							begin
								-- Получаем необходимую информацию и записываем результат
								set @jsT = ( select @name [name] for json path, without_array_wrapper )
								set @rp_ = null
								exec [dbo].[ms_api] 'city.get', @jsT, @rp_ out	

									-- Проверка на уже существующего наименования города
									if dbo.jv(@rp_, '$.response.id') is not null
										begin 
											set @err = 'err.city_edit.not_unique_name'
											set @errdesc = 'Город с таким наименованием уже существует'
											goto err
										end
							end

						-- Вносим изменения
						update [dbo].[city] 
							set [name]		= isnull(@name, [name]),
								[distance]	= isnull(@distance, [distance]),
								[travel]	= isnull(@travel, [travel])
						where [id] = @id_city

						-- Записываем результат
						set @rp = (select city.*
									from [dbo].[city]  with(nolock) where city.[id] = @id_city
									for json path, without_array_wrapper)
						goto ok
					
					end

				if @action in ('city.active')
					begin
						 -- Проверка поля id на null
						 if ( @id_city is null )
							begin
								set @err = 'err.city_active.object_not_found'
								set @errdesc = 'Заполните поле'
								goto err
							end

						 select		@id_temp			= [id],
									@name_temp			= [name] ,
									@status_temp		= [status] 
						 from [dbo].[city] with(nolock)
						 where [id] = @id_city

						 -- Проверка существует ли город с таким id
						 if ( @id_temp is null )
							begin
	   							set @err = 'err.city_active.object_not_found'
								set @errdesc = 'Город не найден'
								goto err
							end

						 -- Проверка на то, что город уже активнен
						 if ( @status_temp = 'Y' )
							begin
	   							set @err = 'err.city_active.object_is_active'
								set @errdesc = 'Город уже активен'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
                        set @jsT = ( select @name_temp [name] for json path, without_array_wrapper )
                        set @rp_ = null
                        exec [dbo].[ms_api] 'city.get', @jsT, @rp_ out

						-- Проверка на уже существующего наименования города
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.city_edit.not_unique_name'
								set @errdesc = 'Город с таким наименованием уже существует'
								goto err
							end
				
						--Изменяем
						update [dbo].[city] 
							set [status] = 'Y'
						where [id] = @id_city

						--Выводим
						set @rp = (select   @id_city	[id]
											,'Y'		[status]
								   for json path, without_array_wrapper)
						goto ok
										
					end
				
				if @action in ('city.deactive')
					begin
						--Проверка ввода id   
						 if ( @id_city is null )
							begin
								set @err = 'err.city_deactiv.object_not_found'
								set @errdesc = 'Город не передан'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @id_city [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'city.get', @jsT, @rp_ out	

						-- Проверка на существующий город
						if dbo.jv(@rp_, '$.response.id') is null
							begin 
								set @err = 'err.city_deactiv.not_found'
								set @errdesc = 'Город не найден'
								goto err
							end

						 -- Проверяем не осуществляется ли в город перевозка
						 if  exists ( select top 1 1 from [dbo].[traffic] with(nolock) where [id_city] = @id_city and [status] = 'Y' )
							begin
								set @err = 'err.city_deactiv.object_not_found'
								set @errdesc = 'В город осуществляется перевозка'
								goto err
							end

						-- Меняем статус городу
						update [dbo].[city]
							set [status] = 'N'
						where [id] = @id_city
      
						--Выводим
						set @rp = (select   @id_city	[id]
											,'N'		[status]
								   for json path, without_array_wrapper)
						goto ok
					end
			
			end
		
		--Сотрудники
		if @sba in ('empl')
			begin
				
				declare
					-- Основные переменные таблицы
					 @empl_id				uniqueidentifier = dbo.jv(@js, '$.id')
					,@empl_last_name		nvarchar(30)	 = dbo.jv(@js, '$.last_name')
					,@empl_first_name		nvarchar(30)	 = dbo.jv(@js, '$.first_name')
					,@empl_middle_name		nvarchar(30)	 = dbo.jv(@js, '$.middle_name')
					,@empl_passport			nvarchar(10)	 = dbo.jv(@js, '$.passport')
					,@empl_age				int				 = dbo.jv(@js, '$.age')
					,@empl_phone	        nvarchar(11)	 = dbo.jv(@js, '$.phone')
					,@empl_email			nvarchar(30)	 = dbo.jv(@js, '$.email')
					
					-- Дополнительные переменные
					,@empl_id_temp			uniqueidentifier
					,@empl_passport_temp	nvarchar(10)
					,@empl_phone_temp		varchar(11)
					,@empl_status_temp		char(1)
			
				if @action in ('empl.get')
					begin
						-- Записываем результат
						set @rp = (
									select empl.*
										from [dbo].[empl] [empl] with(nolock)
									where ( empl.[id]  = @empl_id or empl.[phone] = @empl_phone 
											or empl.[passport] = @empl_passport) and empl.[status] = 'Y'
									for json path, without_array_wrapper
									)
						goto ok
					end

				if @action in ('empl.create')
					begin
						 -- Проверка обязательных параметров на null
						 if (  @empl_last_name		is null
							or @empl_first_name		is null
							or @empl_middle_name	is null
							or @empl_passport		is null
							or @empl_age			is null
							or @empl_phone			is null
							or @empl_email			is null)
							begin
								set @err = 'err.empl_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'
								goto err
							end

						 -- Проверка формата телефона
						 if ( len(@empl_phone) != 11 or isnumeric(@empl_phone) != 1 )
							begin 
								set @err = 'err.empl_create.invalid_phone'
								set @errdesc = 'Неверный формат номера телефона'
								goto err
							end

						 -- Проверка формата паспорта
						 if ( len(@empl_passport) != 10 or isnumeric(@empl_passport) != 1 )
							begin 
								set @err = 'err.empl_create.invalid_passport'
								set @errdesc = 'Неверный формат паспорта'
								goto err
							end

						 -- Проверка на возраст сотрудника
						 if (@empl_age) < 18 or (@empl_age) > 65
							begin 
								set @err = 'err.empl_create.invalid_passport'
								set @errdesc = 'Возраст сотрудника не может быть меньше 18 лет или больше 65 лет'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @empl_phone [phone] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'empl.get', @jsT, @rp_ out	

						-- Проверка на уже существующий номер телефона 
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.empl_create.not_unique_phone'
								set @errdesc = 'Сотрудник с таким номером телефона уже существует'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @empl_passport [passport] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'empl.get', @jsT, @rp_ out	

						-- Проверка на уже существующий номер телефона 
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.empl_create.not_unique_passport'
								set @errdesc = 'Сотрудник с таким паспортом уже существует'
								goto err
							end

						-- Генерируем новый ИД
						set @empl_id = newid()

						--Cохранияем
						insert into [dbo].[empl] ( [id], [dadd], [last_name], [first_name], [middle_name], [passport],
													 [age], [phone], [email], [status])
						values (
								 @empl_id
								,getdate() 
								,@empl_last_name
								,@empl_first_name
								,@empl_middle_name
								,@empl_passport
								,@empl_age
								,@empl_phone
								,@empl_email
								,'Y'
							   )

						--Выводим
						set @rp = (select	 @empl_id			[id]		
											,@empl_last_name	[last_name]
											,@empl_first_name	[first_name]
											,@empl_middle_name	[middle_name]
											,@empl_passport		[passport]
											,@empl_age			[age]
											,@empl_phone		[phone]
											,@empl_email		[email]
								   for json path, without_array_wrapper)
						goto ok

					end

				if @action in ('empl.edit')
					begin
						-- Проверка поля id на null
						if ( @empl_id is null )
							begin
								set @err = 'err.empl_edit.object_not_found'
								set @errdesc = 'Сотрудник не найден'
								goto err
							end
						
						-- Проверка выбора изменения
						if (@empl_last_name is null) and (@empl_first_name is null) and (@empl_middle_name is null)
							and (@empl_passport is null) and (@empl_age is null) and (@empl_phone is null)
							and (@empl_email is null)
							begin
								set @err = 'err.empl_edit.object_not_found'
								set @errdesc = 'Изменение не выбрано'
								goto err
							end
							
						-- Проверка телефона при его наличии
						if ( @empl_phone is not null )
							begin

								--Проверка форматa
								if ( len(@empl_phone) != 11 or isnumeric(@empl_phone) != 1 )
									begin 
										set @err = 'err.empl_edit.invalid_phone'
										set @errdesc = 'Неверный формат номера телефона'
										goto err
									end

								-- Получаем необходимую информацию и записываем результат
								set @jsT = ( select @empl_phone [phone] for json path, without_array_wrapper)
								set @rp_ = null
								exec [dbo].[ms_api] 'empl.get', @jsT, @rp_ out	

								-- Проверка на уже существующий номер телефона
								if dbo.jv(@rp_, '$.response.id') is not null
									begin 
										set @err = 'err.empl_edit.not_unique_phone'
										set @errdesc = 'Сотрудник с таким номером телефона уже существует'
										goto err
									end
							end

						-- Проверка формата паспорта при его наличии
						if ( @empl_passport is not null )
							begin
								--Проверка форматa паспорта
								if ( len(@empl_passport) != 10 or isnumeric(@empl_passport) != 1 )
									begin 
										set @err = 'err.empl_edit.invalid_passport'
										set @errdesc = 'Неверный формат паспорта'
										goto err
									end

								-- Получаем необходимую информацию и записываем результат
								set @jsT = ( select @empl_passport [passport] for json path, without_array_wrapper)
								set @rp_ = null
								exec [dbo].[ms_api] 'empl.get', @jsT, @rp_ out	

								-- Проверка на уже cуществующий паспорт
								if dbo.jv(@rp_, '$.response.id') is not null
									begin 
										set @err = 'err.empl_create.not_unique_passport'
										set @errdesc = 'Сотрудник с таким паспортом уже существует'
										goto err
									end
							end
	
						-- Проверка на возраст сотрудника
						if (@empl_age is not null) and ((@empl_age) < 18 or (@empl_age) > 65 )
							begin 
								set @err = 'err.empl_edit.invalid_age'
								set @errdesc = 'Возраст сотрудника не может быть меньше 18 лет'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @empl_id [id] for json path, without_array_wrapper)
						set @rp_ = null
						exec [dbo].[ms_api] 'empl.get', @jsT, @rp_ out	

						-- Проверка находится ли сотрудник в актином статусе
						if dbo.jv(@rp_, '$.response.id') is  null
							begin 
								set @err = 'err.empl_edit.object_not_found'
								set @errdesc = 'Сотрудник не найден'
								goto err
							end

						--Изменяем
						update [dbo].[empl] 
							set [last_name]		= isnull(@empl_last_name, [last_name]),
								[first_name]	= isnull(@empl_first_name, [first_name]),
								[middle_name]	= isnull(@empl_middle_name, [middle_name]),
								[passport]		= isnull(@empl_passport, [passport]),
								[age]			= isnull(@empl_age, [age]),
								[phone]			= isnull(@empl_phone, [phone]),
								[email]			= isnull(@empl_email, [email])
						where [id] = @empl_id

						--Выводим
						set @rp = (select *
									from [dbo].[empl] with(nolock) where [id] = @empl_id
									for json path, without_array_wrapper)
						goto ok

					end

				if @action in ('empl.active')
					begin
						-- Проверка поля id на null
						if ( @empl_id is null )
							begin
								set @err = 'err.empl_active.object_not_found'
								set @errdesc = 'Сотрудник не найден'
								goto err
							end
						
						select  @empl_id_temp			= [id],
								@empl_passport_temp		= [passport],
								@empl_phone_temp		= [phone],
								@empl_status_temp		= [status] 
						from [dbo].[empl] with(nolock)
						where [id] = @empl_id

						-- Проверка существует ли сотрудник с таким id
						if ( @empl_id_temp is null )
							begin
	   							set @err = 'err.empl_active.object_not_found'
								set @errdesc = 'Сотрудник не найден'
								goto err
							end
	
						-- Проверка на то, что сотруднк уже активнен
						if ( @empl_status_temp = 'Y' )
							begin
	   							set @err = 'err.empl_active.object_is_active'
								set @errdesc = 'Сотрудник уже активен'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @empl_phone_temp [phone] for json path, without_array_wrapper)
						set @rp_ = null
						exec [dbo].[ms_api] 'empl.get', @jsT, @rp_ out	

						-- Проверка на уже существующий номер телефона
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.empl_active.not_unique_phone'
								set @errdesc = 'Сотрудник с таким номером телефона уже существует'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @empl_passport_temp [passport] for json path, without_array_wrapper)
						set @rp_ = null
						exec [dbo].[ms_api] 'empl.get', @jsT, @rp_ out	

						-- Проверка на уже cуществующий паспорт
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.empl_create.not_unique_passport'
								set @errdesc = 'Сотрудник с таким паспортом уже существует'
								goto err
							end

						--Изменяем
						update [dbo].[empl] 
							set [status] = 'Y'
						where [id] = @empl_id_temp

						--Выводим
						set @rp = (select   @empl_id_temp    [id]
											,'Y'			 [status]
									for json path, without_array_wrapper)
						goto ok

					end

				if @action in ('empl.deactive')
					begin
						-- Проверка ввода id
						if ( @empl_id is null )
							begin
								set @err = 'err.empl_deactiv.object_not_found'
								set @errdesc = 'Сотрудник  не найден'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @empl_id [id] for json path, without_array_wrapper)
						set @rp_ = null
						exec [dbo].[ms_api] 'empl.get', @jsT, @rp_ out	

						-- Проверка на существование сотрудника в активном статусе
						if dbo.jv(@rp_, '$.response.id') is  null
							begin 
								set @err = 'err.empl_deactive.object_not_found'
								set @errdesc = 'Сотрудник не найден'
								goto err
							end

						--Проверяем задействован ли сотрудник в перевозке
						if exists ( select top 1 1 from [dbo].[traffic] with(nolock)
										join [attach] with(nolock) on [attach].[id] = [traffic].[id_attach]
									where [attach].[id_empl] = @empl_id and [attach].[status] = 'Y' and [traffic].[status] = 'Y')
							begin
								set @err = 'err.empl_deactiv.object_not_found'
								set @errdesc = 'Сотрудник задействован в перевозке'
								goto err
							end

						begin tran
							begin try
								-- Меняем статус сотруднику
								update [dbo].[empl]
									set [status] = 'N'
								where [id] = @empl_id

								-- Меняем статус привязанному транспорту
								update [dbo].[attach]
									set [status] = 'N'
								where [id_empl] = @empl_id
							end try

							begin catch
								--Откатываем транзакцию
								rollback tran 
								set @errdesc = 'Не удалось декативировать сотрудника'
								set @err = 'err.empl_deactive.tran_rollback'
								goto err
							end catch
						commit tran
        
						--Выводим
						set @rp = (select   @empl_id     [id]
											,'N'		 [status]
									for json path, without_array_wrapper)
						goto ok

					end
			
			end
		
		--Транспорт
		if @sba in ('transport')
			begin

				declare
					 -- Основные переменные таблицы
					 @transport_id				uniqueidentifier	= dbo.jv(@js, '$.id')
					,@transport_marka_model		nvarchar(30)		= dbo.jv(@js, '$.marka_model')
					,@transport_gos_nomer		nvarchar(15)		= dbo.jv(@js, '$.gos_nomer')
					,@transport_max_massa		numeric(6,1)		= dbo.jv(@js, '$.max_massa')

					-- Дополнительные переменные
					,@transport_id_temp					uniqueidentifier
					,@transport_marka_model_temp		nvarchar(30)
					,@transport_gos_nomer_temp			nvarchar(15)
					,@transport_status_temp				char(1)

				if @action in ('transport.get')
					begin
						-- Записываем результат
						set @rp = (
									select transport.*
										from [dbo].[transport] transport with(nolock)
									where ( transport.[id] = @transport_id or transport.[gos_nomer] = @transport_gos_nomer) and transport.[status] = 'Y'
									for json path, without_array_wrapper
									)
						goto ok
					end

				if @action in ('transport.create')
					begin
						-- Проверка обязательных параметров на null
						if ( @transport_marka_model	is null
							or @transport_gos_nomer	is null
							or @transport_max_massa	is null)
							begin
								set @err = 'err.transport_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'
								goto err
							end

						-- Проверка формата марка-модель
						if (charindex('-',@transport_marka_model) = 0) or (substring(@transport_marka_model,charindex('-',@transport_marka_model)+1,1) = '')
							begin
								set @err = 'err.transport_create.unset_field'
								set @errdesc = 'Не указана модель через - '
								goto err
							end

						--Проверка значения маскимальнной массы
						if (@transport_max_massa < 1000 or @transport_max_massa > 5000)
							begin
								set @err = 'err.transport_create.unset_field'
								set @errdesc = 'Недопустимое значение максимальной массы транспорта'
								goto err
							end

						-- Проверка формата гос номера
						if (len(@transport_gos_nomer) < 8 or len(@transport_gos_nomer) > 9)
							or (substring(@transport_gos_nomer,1,1)	not like '[а-я]')
							or (substring(@transport_gos_nomer,2,3) not like '[0-9][0-9][0-9]')
							or (substring(@transport_gos_nomer,5,2)	not like '[а-я][а-я]') 
							or (substring(@transport_gos_nomer,7,2)	not like '[0-9][0-9]')
							or (len(@transport_gos_nomer) = 9 and substring(@transport_gos_nomer,9,1) not like '[0-9]')
							begin
								set @err = 'err.transport_create.unset_field'
								set @errdesc = 'Неверный формат гос_номера'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @transport_gos_nomer [gos_nomer] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'transport.get', @jsT, @rp_ out
					
						-- Проверка cуществует ли гос номер
						if dbo.jv(@rp_, '$.response.id') is not null
							begin
								set @err = 'err.transport_create.not_unique_gos_nomer'
								set @errdesc = 'Транспорт с таким гос номером уже существует'
								goto err
							end

						-- Генерируем новый ИД
						set @transport_id = newid()

						--Cохранияем
						insert into [dbo].[transport] ([id], [dadd], [marka_model], [gos_nomer], [max_massa], [status]) 
						values (
								 @transport_id
								,getdate() 
								,@transport_marka_model
								,@transport_gos_nomer
								,@transport_max_massa
								,'Y'
								)

						--Выводим
						set @rp = (select @transport_id				[id]		
										 ,@transport_marka_model	[marka_model]
										 ,@transport_gos_nomer		[gos_nomer]
										 ,@transport_max_massa		[max_massa]
									for json path, without_array_wrapper)
						goto ok

					end

				if @action in ('transport.edit')
					begin
						-- Проверка обязательных параметров на null
						if (@transport_id) is null
							begin
								set @err = 'err.transport_create.unset_field'
								set @errdesc = 'Транспорт не найден'
								goto err
							end

						-- Проверка выбора изменения
						if (@transport_marka_model is null) and (@transport_gos_nomer is null) 
							and (@transport_max_massa is null)
							begin
								set @err = 'err.transport_create.unset_field'
								set @errdesc = 'Изменение не выбрано'
								goto err
							end
							
						-- Проверка формата марка-модель
						if ( @transport_marka_model is not null) and (charindex('-',@transport_marka_model) = 0)
							or (substring(@transport_marka_model,charindex('-',@transport_marka_model)+1,1) = '')
							begin
								set @err = 'err.transport_create.unset_field'
								set @errdesc = 'Не указана модель через - '
								goto err
							end

						-- Проверка значения маскимальнной массы
						if (@transport_max_massa is not null) and (@transport_max_massa < 1000 or @transport_max_massa > 5000)
							begin
								set @err = 'err.transport_create.unset_field'
								set @errdesc = 'Недопустимое значение максимальной массы транспорта'
								goto err
							end

						-- Проверка формата гос номера
						if (@transport_gos_nomer is not null) and (len(@transport_gos_nomer) < 8 or len(@transport_gos_nomer) > 9)
							or (substring(@transport_gos_nomer,1,1)	not like '[а-я]')
							or (substring(@transport_gos_nomer,2,3) not like '[0-9][0-9][0-9]')
							or (substring(@transport_gos_nomer,5,2)	not like '[а-я][а-я]') 
							or (substring(@transport_gos_nomer,7,2)	not like '[0-9][0-9]')
							or (len(@transport_gos_nomer) = 9 and substring(@transport_gos_nomer,9,1) not like '[0-9]')
							begin
								set @err = 'err.transport_create.unset_field'
								set @errdesc = 'Неверный формат гос_номера'
								goto err
							end
						
						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @transport_id [id] for json path, without_array_wrapper)
						set @rp_ = null
						exec [dbo].[ms_api] 'transport.get', @jsT, @rp_ out	

						-- Проверка находится ли транспорт в актином статусе
						if dbo.jv(@rp_, '$.response.id') is  null
							begin 
								set @err = 'err.transport_edit.object_not_found'
								set @errdesc = 'Транспорт не найден'
								goto err
							end

						if (@transport_gos_nomer is not null)
							begin
								-- Получаем необходимую информацию и записываем результат
								set @jsT = ( select @transport_gos_nomer [gos_nomer] for json path, without_array_wrapper)
								set @rp_ = null
								exec [dbo].[ms_api] 'transport.get', @jsT, @rp_ out	

								-- Проверка на уже существующий транспорт
								if dbo.jv(@rp_,'$.response.id') is not null
									begin
										set @err = 'err.transport_edit.object_not_found'
										set @errdesc = 'Транспорт с таким гос номером уже существует'
										goto err
									end
							end

						--Изменяем
						update [dbo].[transport] 
							set [marka_model]	= isnull(@transport_marka_model, [marka_model]),
								[gos_nomer]		= isnull(@transport_gos_nomer, [gos_nomer]),
								[max_massa]		= isnull(@transport_max_massa, [max_massa])
						where [id] = @transport_id

						--Выводим
						set @rp = (select *
									from [dbo].[transport] with(nolock) where [id] = @transport_id
									for json path, without_array_wrapper)
						goto ok

					end

				if @action in ('transport.active')
					begin
						-- Проверка поля id на null
						if ( @transport_id is null )
							begin
								set @err = 'err.transport_active.object_not_found'
								set @errdesc = 'Транспорт не найден'
								goto err
							end

						select	@transport_id_temp			= [id],
								@transport_marka_model_temp = [marka_model],
								@transport_gos_nomer_temp	= [gos_nomer],
								@transport_status_temp		= [status]
						from [transport] with(nolock)
						where [id] = @transport_id

							-- Проверка существует ли транспорт с таким id
						if ( @transport_id_temp is null )
							begin
								set @err = 'err.transport_active.object_not_found'
								set @errdesc = 'Транспорт не найден'
								goto err
							end

						-- Проверка на то, что транспорт уже активнен
						if ( @transport_status_temp = 'Y' )
							begin
								set @err = 'err.transport_active.object_is_active'
								set @errdesc = 'Транспорт уже активен'
								goto err
							end
						
						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @transport_gos_nomer_temp [gos_nomer] for json path, without_array_wrapper)
						set @rp_ = null
						exec [dbo].[ms_api] 'transport.get', @jsT, @rp_ out	

						-- Проверка на уже существующий транспорт
						if dbo.jv(@rp_,'$.response.id') is not null
							begin
								set @err = 'err.transport_edit.not_unique_gos_nomer'
								set @errdesc = 'Транспорт с таким гос номером уже существует'
								goto err
							end

						--Изменяем
						update [dbo].[transport] 
							set [status] = 'Y'
						where [id] = @transport_id

						--Выводим
						set @rp = (select	@transport_id	[id]
											,'Y'			[status]
									for json path, without_array_wrapper)
						goto ok

					end

				if @action in ('transport.deactive')
					begin
						-- Проверка ввода id
						if ( @transport_id is null )
							begin
								set @err = 'err.transport_deactiv.object_not_found'
								set @errdesc = 'Транспорт  не найден'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @transport_id [id] for json path, without_array_wrapper)
						set @rp_ = null
						exec [dbo].[ms_api] 'transport.get', @jsT, @rp_ out	

						-- Проверка активен ли транспорт
						if dbo.jv(@rp_,'$.response.id') is null
							begin
								set @err = 'err.transport_deactive.object_not_found'
								set @errdesc = 'Транспорт не активен'
								goto err
							end

						--Проверяем есть ли перевозка на закрепленном транспорте
						if exists ( select top 1 1 from [dbo].[traffic] with(nolock)
										join [attach] with(nolock) on [attach].[id] = [traffic].[id_attach]
									where [attach].[id_transport] = @transport_id and [attach].[status] = 'Y' and traffic.[status] = 'Y')
							begin
								set @err = 'err.transport_deactiv.object_not_found'
								set @errdesc = 'Транспорт используется в перевозке'
								goto err
							end

						begin tran
							begin try
								-- Меняем статус транспорту
								update [dbo].[transport]
									set [status] = 'N'
								where [transport].[id] = @transport_id

								-- Меняем статус закрепленному транспорту
								update [dbo].[attach]
									set [status] = 'N'
								where [attach].[id_transport] = @transport_id
							end try

							begin catch
								-- Откатываем транзакцию
								rollback tran 
								set @errdesc = 'Не удалось деактивировать транспорт '
								set @err = 'err.transport_deactiv.tran_rollback'
								goto err
							end catch
						commit tran

						--Выводим
						set @rp = (select   @transport_id	[id]
											,'N'			[status]
									for json path, without_array_wrapper)
						goto ok
					end
		
		end
		
		--Закрепление
		if @sba in ('attach')
			begin
				declare
				-- Основные переменные таблицы
				 @attach_id					uniqueidentifier	= dbo.jv(@js, '$.id')
				,@attach_id_transport		uniqueidentifier	= dbo.jv(@js, '$.id_transport')
				,@attach_id_empl			uniqueidentifier	= dbo.jv(@js, '$.id_empl')
			
				-- Дополнительные переменные
				,@attach_id_temp				uniqueidentifier
				,@attach_id_transport_temp		uniqueidentifier
				,@attach_id_empl_temp			uniqueidentifier

				if @action in ('attach.get')
					begin
					    -- Записываем результат
					    set @rp = (
                                    select att.*
                                        from [dbo].[attach] att with(nolock)
									where ( att.[id]  = @attach_id or att.[id_transport] = @attach_id_transport
											or att.[id_empl] = @attach_id_empl) and att.[status] = 'Y'
									for json path, without_array_wrapper
                                  )
					    goto ok
				    end

				if @action in ('attach.create')
					begin
						-- Проверка обязательных параметров на null
						if ( @attach_id_transport is null or @attach_id_empl is null)
							begin
								set @err = 'err.attach_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'
								goto err
							end
					
						-- Получаем необходимую информацию и записываем результат
                        set @jsT = ( select @attach_id_transport [id] for json path, without_array_wrapper )
                        set @rp_ = null
                        exec [dbo].[ms_api] 'transport.get', @jsT, @rp_ out

                        -- Проверка существует транспорт
                        if dbo.jv(@rp_, '$.response.id') is null
		                    begin
								set @err = 'err.atatch_create.not_unique_id_transport'
								set @errdesc = 'Транспорт не активен'
			                    goto err
		                    end

						-- Получаем необходимую информацию и записываем результат
                        set @jsT = ( select @attach_id_empl [id] for json path, without_array_wrapper )
                        set @rp_ = null
                        exec [dbo].[ms_api] 'empl.get', @jsT, @rp_ out

                        -- Проверка существует cотрудник
                        if dbo.jv(@rp_, '$.response.id') is null
		                    begin
								set @err = 'err.atatch_create.not_unique_id_empl'
								set @errdesc = 'Сотрудник не активен'
			                    goto err
		                    end

						-- Получаем необходимую информацию и записываем результат
                        set @jsT = ( select @attach_id_transport [id_transport], @attach_id_empl [id_empl] for json path, without_array_wrapper )
                        set @rp_ = null
                        exec [dbo].[ms_api] 'attach.get', @jsT, @rp_ out

						-- Проверка на закрепление
                        if dbo.jv(@rp_, '$.response.id') is not null
		                    begin
								set @err = 'err.atatch_create.not_unique_id_empl_and_id_transport'
								set @errdesc = 'Сотрудник или транспорт уже закреплен'
			                    goto err
		                    end
						
						--Генерируем id
						set @attach_id = newid()

						--Cохранияем
						insert into [dbo].[attach] ([id],[dadd],[id_empl],[id_transport],[status])
						values (
								@attach_id
								,getdate() 
								,@attach_id_empl
								,@attach_id_transport
								,'Y'
								)

						--Выводим
						set @rp = (select @attach_id			[id]		
										 ,@attach_id_empl		[id_empl]
										 ,@attach_id_transport	[id_transport]
									for json path, without_array_wrapper)
						goto ok

					end

				if @action in ('attach.active')
					begin
						-- Проверка поля id на null
						if ( @attach_id is null )
							begin
								set @err = 'err.attach_active.object_not_found'
								set @errdesc = 'Некорректный ввод данных'
								goto err
							end

						select  @attach_id_temp				= [id],
								@attach_id_empl_temp		= [id_empl],
								@attach_id_transport_temp	= [id_transport],
								@status_temp				= [status] 
						 from [dbo].[attach] with(nolock)
						 where [id] = @attach_id

						-- Проверка существует ли закрепление с таким id
						if ( @attach_id_temp is null )
							begin
								set @err = 'err.attach_active.object_not_found'
								set @errdesc = 'Закрепление не найдено'
								goto err
							end
	
						-- Проверка на то, что закрепление уже активно
						if ( @status_temp = 'Y' )
							begin
								set @err = 'err.attach_active.object_is_active'
								set @errdesc = 'Закрепление уже активно'
								goto err
							end
						
						-- Получаем необходимую информацию и записываем результат
                        set @jsT = ( select @attach_id_transport_temp [id] for json path, without_array_wrapper )
                        set @rp_ = null
                        exec [dbo].[ms_api] 'transport.get', @jsT, @rp_ out

						-- Проверка существует транспорт
                        if dbo.jv(@rp_, '$.response.id') is null
		                    begin
								set @err = 'err.atatch_create.not_unique_id_transport'
								set @errdesc = 'Транспорт не активен'
			                    goto err
		                    end

						-- Получаем необходимую информацию и записываем результат
                        set @jsT = ( select @attach_id_empl_temp [id] for json path, without_array_wrapper )
                        set @rp_ = null
                        exec [dbo].[ms_api] 'empl.get', @jsT, @rp_ out

                        -- Проверка существует cотрудник
                        if dbo.jv(@rp_, '$.response.id') is null
		                    begin
								set @err = 'err.atatch_create.not_unique_id_empl'
								set @errdesc = 'Сотрудник не активен'
			                    goto err
		                    end

						-- Получаем необходимую информацию и записываем результат
                        set @jsT = ( select @attach_id_transport_temp [id_attach], @attach_id_empl_temp [id_empl] for json path, without_array_wrapper )
                        set @rp_ = null
                        exec [dbo].[ms_api] 'attach.get', @jsT, @rp_ out

						-- Проверка на закрепление
                        if dbo.jv(@rp_, '$.response.id') is not null
		                    begin
								set @err = 'err.atatch_create.not_unique_id_empl_and_id_transport'
								set @errdesc = 'Сотрудник или транспорт уже закреплен'
			                    goto err
		                    end

						--Изменяем
						update [dbo].[attach] 
							set [status] = 'Y'
						where [id] = @attach_id

						--Выводим
						set @rp = (select @attach_id	 [id]
											,'Y'		 [status]
									for json path, without_array_wrapper)
						goto ok

					end
					
				if @action in ('attach.deactive')
					begin
						-- Проверка поля id на null
						if ( @attach_id is null )
							begin
								set @err = 'err.attach_active.object_not_found'
								set @errdesc = 'Некорректный ввод данных'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
                        set @jsT = ( select @attach_id [id] for json path, without_array_wrapper )
                        set @rp_ = null
                        exec [dbo].[ms_api] 'attach.get', @jsT, @rp_ out

						-- Проверка на закрепление
                        if dbo.jv(@rp_, '$.response.id') is null
		                    begin
								set @err = 'err.attach_deactiv.object_not_found'
								set @errdesc = 'Закрепление не найдено'
			                    goto err
		                    end

						--Проверяем есть ли активная перевозка 
						if exists ( select top 1 1 from [dbo].[traffic] with(nolock)
									where [traffic].[id_attach] = @attach_id and [traffic].[status] = 'Y')
							begin
								set @err = 'err.attach_deactiv.object_not_found'
								set @errdesc = 'Есть активная перевозка'
								goto err
							end

						-- Меняем статус транспорту
						update [dbo].[attach]
							set [status] = 'N'
						where [id] = @attach_id
        
						--Выводим
						set @rp = (select @attach_id	[id]
											,'N'		[status]
									for json path, without_array_wrapper)
						goto ok

					end

			end
		
		--Клиент
		if @sba in ('client')
			begin
				declare
				-- Основные переменные таблицы
				 @client_id				uniqueidentifier = json_value(@js, '$.id')
				,@client_last_name   	nvarchar(30)	 = json_value(@js, '$.last_name')
				,@client_first_name		nvarchar(30)	 = json_value(@js, '$.first_name')
				,@client_middle_name	nvarchar(30)	 = json_value(@js, '$.middle_name')
				,@client_phone	        nvarchar(11)	 = json_value(@js, '$.phone')
				,@client_email			nvarchar(30)	 = json_value(@js, '$.email')
					
				-- Дополнительные переменные
				,@client_id_temp			uniqueidentifier
				,@client_phone_temp			varchar(11)
				,@client_status_temp		char(1)

				if @action in ('client.get')
					begin
						-- Записываем результат
						set @rp = (
									select client.*
										from [dbo].[client] client with(nolock)
									where ( client.[id]  = @client_id or client.[phone] = @client_phone) and client.[status] = 'Y'
									for json path, without_array_wrapper
									)
						goto ok
					end

				if @action in ('client.create')
					begin
						-- Проверка обязательных параметров на null
						if ( @client_last_name	is null
							or @client_first_name   is null
							or @client_middle_name  is null
							or @client_phone        is null
							or @client_email        is null)
							begin
								set @err = 'err.empl_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'
								goto err
							end

						-- Проверка формата телефона
						if ( len(@client_phone) != 11 or isnumeric(@client_phone) != 1 )
							begin 
								set @err = 'err.client_create.invalid_phone'
								set @errdesc = 'Неверный формат номера телефона'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @client_phone [phone] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'client.get', @jsT, @rp_ out	

						-- Проверка на уже существующий номер телефона 
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.client_create.not_unique_phone'
								set @errdesc = 'Клиент с таким номером телефона уже существует'
								goto err
							end
							
						-- Генерируем новый ИД
						set @client_id = newid()

						--Cохранияем
						insert into [dbo].[client] ([id], [dadd], [last_name], [first_name], [middle_name],
														[phone], [email], [status])
						values (
								@client_id
								,getdate() 
								,@client_last_name
								,@client_first_name
								,@client_middle_name
								,@client_phone
								,@client_email
								,'Y'
								)

						--Выводим
						set @rp = (select	 @client_id 			[id]		
											,@client_last_name		[last_name]
											,@client_first_name		[first_name]
											,@client_middle_name	[middle_name]
											,@client_phone			[phone]
											,@client_email			[email]
             
									for json path, without_array_wrapper)
						goto ok
					end

				if @action in ('client.edit')
					begin
						-- Проверка поля id на null
						if ( @client_id is null )
							begin
								set @err = 'err.client_edit.object_not_found'
								set @errdesc = 'Клиент не найден'
								goto err
							end

						-- Проверка выбора изменения
						if (@client_last_name is null) and (@client_first_name is null) and (@client_middle_name is null) 
							and (@client_phone is null) and (@client_email is null)
							begin
								set @err = 'err.client_edit.object_not_found'
								set @errdesc = 'Изменение не выбрано'
								goto err
							end

						-- Проверка формата телефона при его наличии
						if ( @client_phone is not null )
							begin
								--Проверка формат
								if ( len(@client_phone) != 11 or isnumeric(@client_phone) != 1 )
									begin 
										set @err = 'err.client_edit.invalid_phone'
										set @errdesc = 'Неверный формат номера телефона'
										goto err
									end

								-- Получаем необходимую информацию и записываем результат
								set @jsT = ( select @client_phone [phone] for json path, without_array_wrapper )
								set @rp_ = null
								exec [dbo].[ms_api] 'client.get', @jsT, @rp_ out	

								-- Проверка на уже существующий номер телефона 
								if dbo.jv(@rp_, '$.response.id') is not null
									begin 
										set @err = 'err.client_edit.not_unique_phone'
										set @errdesc = 'Клиент с таким номером телефона уже существует'
										goto err
									end
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @client_id [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'client.get', @jsT, @rp_ out	

						-- Проверка id на существование в активном статусе 
						if dbo.jv(@rp_, '$.response.id') is null
							begin 
								set @err = 'err.client_edit.object_not_found'
								set @errdesc = 'Клиент не найден'
								goto err
							end
						
						--Изменяем
						update [dbo].[client] 
							set [last_name]		= isnull(@client_last_name, [last_name]),
								[first_name]	= isnull(@client_first_name, [first_name]),
								[middle_name]	= isnull(@client_middle_name, [middle_name]),
								[phone]			= isnull(@client_phone, [phone]),
								[email]			= isnull(@client_email, [email])
						where [id] = @client_id

						--Выводим
						set @rp = (select * from [dbo].[client] with(nolock) where [id] = @client_id 
									for json path, without_array_wrapper)
						goto ok
					end
				
				if @action in ('client.active')
					begin
						-- Проверка поля id на null
						if ( @client_id is null )
							begin
								set @err = 'err.client_active.object_not_found'
								set @errdesc = 'Клиент не найден'
								goto err
							end

						select	@client_id_temp			= [id],
								@client_phone_temp		= [phone],
								@client_status_temp		= [status] 
						from	[dbo].[client] with(nolock)
						where	[id] = @client_id

						-- Проверка существует ли клиент с таким id
						if ( @client_id_temp is null )
						begin
	   						set @err = 'err.client_active.object_not_found'
							set @errdesc = 'Клиент не найден'
							goto err
						end

						-- Проверка на то, что клиент уже активнен
						if ( @client_status_temp = 'Y' )
						begin
	   						set @err = 'err.empl_active.object_is_active'
							set @errdesc = 'клиент уже активен'
							goto err
						end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @client_phone_temp [phone] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'client.get', @jsT, @rp_ out	

						-- Проверка на уже существующий номер телефона 
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.client_create.not_unique_phone'
								set @errdesc = 'Клиент с таким номером телефона уже существует'
								goto err
							end
							
						--Изменяем
						update [dbo].[client] 
							set [status] = 'Y'
						where [id] = @client_id

						--Выводим
						set @rp = (select   @client_id		[id]
											,'Y'			[status]
									for json path, without_array_wrapper)
						goto ok

					end

				if @action in ('client.deactive')
					begin
						-- Проверка ввода id
						if ( @client_id is null )
							begin
								set @err = 'err.client_deactiv.object_not_found'
								set @errdesc = 'Клиент  не найден'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @client_id [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'client.get', @jsT, @rp_ out	

						-- Проверка id на существование в активном статусе 
						if dbo.jv(@rp_, '$.response.id') is  null
							begin 
								set @err = 'err.client_edit.object_not_found'
								set @errdesc = 'Клиент не найден'
								goto err
							end

						--Проверяем есть ли активные перевозки у клиента
						if  exists ( select top 1 1 from [dbo].[traffic] with(nolock) where [id_client] = @client_id and [status] = 'Y' )
							begin
								set @err = 'err.client_deactiv.object_not_found'
								set @errdesc = 'У клиента активна перевозка'
								goto err
							end

						-- Меняем статус самому клиенту
						update [dbo].[client]
							set [status] = 'N'
						where [id] = @client_id
       
						--Выводим
						set @rp = (select   @client_id      [id]
											,'N'			[status]
									for json path, without_array_wrapper)
						goto ok

					end

			end

		--Товар
		if @sba in ('product')
			begin
				
				declare 
					 -- Основные переменные таблицы
					 @product_id			uniqueidentifier	= dbo.jv(@js, '$.id')
					,@product_name			nvarchar(30)		= dbo.jv(@js, '$.name')
					,@product_weight		numeric(6,1)		= dbo.jv(@js, '$.weight')
					,@product_price			numeric(6,1)		= dbo.jv(@js, '$.price')
					
					-- Дополнительные переменные
					,@product_id_temp			uniqueidentifier
					,@product_name_temp			nvarchar(30)
					,@product_status_temp		char(1)
				
				if @action in ('product.get')
					begin
						-- Записываем результат
						set @rp = (
									select product.*
										from [dbo].[product] product with(nolock)
									where ( product.[id]  = @product_id or product.[name] = @product_name) and product.[status] = 'Y'
									for json path, without_array_wrapper
									)
						goto ok
					end

				if @action in ('product.create')
					begin
						-- Проверка обязательных параметров на null
						if ( @product_name		is null
							or @product_weight	is null
							or @product_price	is null)
							begin
								set @err = 'err.product_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'
								goto err
							end

						-- Проверка веса товара
						if (@product_weight < 1 or @product_weight > 1000)
							begin
								set @err = 'err.product_create.unset_field'
								set @errdesc = 'Недопустимое значение веса товара '
								goto err
							end

						-- Проверка цены товара
						if (@product_price < 1000 or @product_price > 500000)
							begin
								set @err = 'err.product_create.unset_field'
								set @errdesc = 'Недопустимое значение цены товара '
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @product_name [name] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'product.get', @jsT, @rp_ out	

						-- Проверка на уже существующий товар
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.product_create.not_unique_name'
								set @errdesc = 'Товар с таким наименованием уже существует'
								goto err
							end

						--Генерируем новый id
						set @product_id = newid()

						--Cохранияем
						insert into [dbo].[product] ([id], [dadd], [name], [weight], [price], [status])
						values (
								 @product_id
								,getdate() 
								,@product_name
								,@product_weight
								,@product_price
								,'Y'
								)

						--Выводим
						set @rp = (select @product_id		[id]		
										 ,@product_name		[name]
										 ,@product_weight	[weight]
										 ,@product_price	[price]
									for json path, without_array_wrapper)
						goto ok
					end

				if @action in ('product.edit')
					begin
						-- Проверка поля id на null
						if ( @product_id is null )
							begin
								set @err = 'err.product_edit.object_not_found'
								set @errdesc = 'Товар не найден'
								goto err
							end

						-- Проверка выбора изменения
						if (@product_weight is null) and (@product_name is null) and (@product_price is null) 
							begin
								set @err = 'err.product_edit.object_not_found'
								set @errdesc = 'Изменение не выбрано'
								goto err
							end

						-- Проверка веса товара
						if (@product_weight is not null) and (@product_weight < 1 or @product_weight > 1000)
							begin
								set @err = 'err.product_create.unset_field'
								set @errdesc = 'Недопустимое значение веса товара '
								goto err
							end

						-- Проверка цены товара
						if (@product_price is not null) and (@product_price < 1000 or @product_price > 500000)
							begin
								set @err = 'err.product_create.unset_field'
								set @errdesc = 'Недопустимое значение цены товара '
								goto err
							end
					
						--Проверка существует ли наименование товара
						if (@product_name is not null)
							begin
								-- Получаем необходимую информацию и записываем результат
								set @jsT = ( select @product_name [name] for json path, without_array_wrapper )
								set @rp_ = null
								exec [dbo].[ms_api] 'product.get', @jsT, @rp_ out	

								-- Проверка на уже существующий товар
								if dbo.jv(@rp_, '$.response.id') is not null
									begin 
										set @err = 'err.product_create.not_unique_name'
										set @errdesc = 'Товар с таким наименованием уже существует'
										goto err
									end
								end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @product_id [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'product.get', @jsT, @rp_ out
					
						-- Проверка id на существование в активном статусе
						if dbo.jv(@rp_, '$.response.id') is null
							begin 
								set @err = 'err.product_edit.object_not_found'
								set @errdesc = 'Товар не найден'
								goto err
							end

						--Изменяем
						update [dbo].[product] 
							set [name]		= isnull(@product_name, [name]),
								[weight]	= isnull(@product_weight, [weight]),
								[price]		= isnull(@product_price, [price])
						where [id] = @product_id

						--Выводим
						set @rp = (select *
									from [dbo].[product] with(nolock) where [id] = @product_id
									for json path, without_array_wrapper)
						goto ok
					
					end

				if @action in ('product.active')
					begin
						-- Проверка поля id на null
						if ( @product_id is null )
							begin
								set @err = 'err.product_active.object_not_found'
								set @errdesc = 'Товар не найден'
								goto err
							end

						select  @product_id_temp		= [id],
								@product_name_temp		= [name],
								@product_status_temp	= [status] 
						from [dbo].[product] 
						where [id] = @product_id

						-- Проверка существует ли товар с таким id
						if ( @product_id_temp is null )
							begin
								set @err = 'err.product_active.object_not_found'
								set @errdesc = 'Товар не найден'
								goto err
							end

						-- Проверка на то, что товар уже активнен
						if ( @product_status_temp = 'Y' )
							begin
								set @err = 'err.product_active.object_is_active'
								set @errdesc = 'Товар уже активен'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @product_name_temp [name] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'product.get', @jsT, @rp_ out	

						-- Проверка на уже существующий товар
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.product_create.not_unique_name'
								set @errdesc = 'Товар с таким наименованием уже существует'
								goto err
							end

						--Изменяем
						update [dbo].[product] 
							set [status] = 'Y'
						where [id] = @product_id

						--Выводим
						set @rp = (select	@product_id		[id]
											,'Y'			[status]
									for json path, without_array_wrapper)
						goto ok
					end

				if @action in ('product.deactive')
					begin
						-- Проверка ввода id
						if ( @product_id is null )
							begin
								set @err = 'err.product_deactiv.object_not_found'
								set @errdesc = 'Товар  не найден'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @product_id [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'product.get', @jsT, @rp_ out	

						-- Проверка на уже существующий товар
						if dbo.jv(@rp_, '$.response.id') is  null
							begin 
								set @err = 'err.product_deactiv.object_not_found'
								set @errdesc = 'Товар не найден'
								goto err
							end

						--Проверяем используется ли товар
						if exists ( select top 1 1  from traffic with(nolock)
										join waybill with(nolock) on waybill.id = traffic.id_waybill
										join check_list with(nolock) on check_list.id_waybill = waybill.id
										join product with(nolock) on product.id = check_list.id_product
									where check_list.id_product = @id and traffic.[status] = 'Y'
										and waybill.[is_edit] = 'Y')
							begin
								set @err = 'err.product_deactiv.object_not_found'
								set @errdesc = 'Товар используется'
								goto err
							end

						-- Меняем статус товару
						update [dbo].[product]
							set [status] = 'N'
						where [product].[id] = @product_id
        
						--Выводим
						set @rp = (select   @product_id		[id]
											,'N'			[status]
									for json path, without_array_wrapper)
						goto ok
					end

			end
		
		--Контрольный лист
		if @sba in ('check_list')
			begin
				declare
					-- Основные переменные таблицы
					 @check_list_id				uniqueidentifier = dbo.jv(@js, '$.id')
					,@check_list_id_product		uniqueidentifier = dbo.jv(@js, '$.id_product')
					,@check_list_id_waybill		uniqueidentifier = dbo.jv(@js, '$.id_waybill')
					,@check_list_quantity		int				 = dbo.jv(@js, '$.quantity')
					,@check_list_price			numeric(10,1)	 = dbo.jv(@js, '$.price')

					-- Дополнительные переменные
					,@check_list_id_temp				uniqueidentifier
					,@check_list_id_product_temp		uniqueidentifier 
					,@check_list_id_waybill_temp		uniqueidentifier 
					,@check_list_price_temp				numeric(10,1)
					,@check_list_status_temp			char(1)
				
				if @action in ('check_list.get')
					begin
						-- Записываем результат
						set @rp = (
									select check_list.*
										from [dbo].[check_list] check_list with(nolock)
									where ( check_list.[id]  = @check_list_id or check_list.[id_waybill] = @check_list_id_waybill) 
											 and check_list.[status] = 'Y'
											for json path
									)
						goto ok
					end

				if @action in ('check_list.create')
					begin
						-- Проверка обязательных параметров на null
						if ( @check_list_id_product		is null
							or @check_list_id_waybill	is null
							or @check_list_quantity		is null)
							begin
								set @err = 'err.check_list_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'
								goto err
							end

						select	@check_list_id_product_temp	 = [id],
								@check_list_price_temp		 = [price],
								@check_list_status_temp		 = [status] 
						from [dbo].[product] 
						where [id] = @check_list_id_product

						-- Проверка количества
						if ( @check_list_quantity < 1 or @check_list_quantity > 50)
							begin
								set @err = 'err.check_list_create.unset_quantity'
								set @errdesc = 'Неккоректный ввод количества товара'
								goto err
							end

						-- Проверка существующий товар
						if ( @check_list_id_product_temp  is null)
							begin 
								set @err = 'err.check_list_create.not_unique_name'
								set @errdesc = 'Товар не найден'
								goto err
							end

						-- Проверка на то,что товар активен
						if not ( @check_list_status_temp = 'Y')
							begin 
								set @err = 'err.check_list_create.not_unique_name'
								set @errdesc = 'Товар не активен для добавления'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @check_list_id_waybill [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'waybill.get', @jsT, @rp_ out

						-- Проверка на уже существующий товар
						if dbo.jv(@rp_, '$.response.id') is  null
							begin 
								set @err = 'err.check_list_create.not_unique_id_waybill'
								set @errdesc = 'Накладная не активна для изменений'
								goto err
							end

						if exists (select top 1 1 from [dbo].[check_list] with(nolock) where ([id_waybill] = @check_list_id_waybill and [id_product] = @check_list_id_product) and [status] = 'Y')
							begin 
								set @err = 'err.check_list_create.not_unique_id_product'
								set @errdesc = 'В выбранной накладной уже существует этот товар'
								goto err
							end

						--Генерируем новый id
						set @check_list_id = newid()

						--Получаем сумму
						set @check_list_price =  @check_list_price_temp * @check_list_quantity 
						
						begin tran
							begin try
								--Cохранияем
								insert into [dbo].[check_list] ([id], [dadd], [id_product], [id_waybill], [quantity],
																	[price], [status])
								values (
										@check_list_id
										,getdate() 
										,@check_list_id_product
										,@check_list_id_waybill
										,@check_list_quantity
										,@check_list_price
										,'Y'
										)

								--Изменяем общую сумму накладной
								update [dbo].[waybill] 
									set [price] = [price] + @check_list_price 
								where waybill.[id] = @check_list_id_waybill
							end try

							begin catch
								-- Откатываем транзакцию
								rollback tran
								set @errdesc = 'Не удалось создать запись'
								set @err = 'err.check_list_create.tran_rollback'
								goto err
							end catch
						commit tran
						
						--Выводим
						set @rp = (select @check_list_id			[id]		
										 ,@check_list_id_product	[id_product]
										 ,@check_list_id_waybill	[id_waybill]
										 ,@check_list_quantity		[quantity]
										 ,@check_list_price			[price]
									for json path, without_array_wrapper)
						goto ok

					end

				if @action in ('check_list.active')
					begin
						-- Проверка поля id на null
						if ( @check_list_id is null )
							begin
								set @err = 'err.check_list_active.object_not_found'
								set @errdesc = 'Некорректный ввод данных'
								goto err
							end

						select  @check_list_id_temp			= [id],
								@check_list_id_product_temp	= [id_product],
								@check_list_id_waybill_temp	= [id_waybill],
								@check_list_status_temp		= [status] 
						from [dbo].[check_list] with(nolock)
						where [id] = @check_list_id

						-- Проверка существует ли контрольный список с таким id
						if ( @check_list_id_temp is null )
							begin
								set @err = 'err.check_list_active.object_not_found'
								set @errdesc = 'Контрольный список не найден'
								goto err
							end

						-- Проверка на то, что контрольный список уже активнен
						if ( @check_list_status_temp = 'Y' )
							begin
								set @err = 'err.check_list_active.object_is_active'
								set @errdesc = 'Контрольный лист уже активен'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @check_list_id_product_temp [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'product.get', @jsT, @rp_ out	

						-- Проверка на уже существующий товар
						if dbo.jv(@rp_, '$.response.id') is  null
							begin 
								set @err = 'err.check_list_create.not_unique_id_product'
								set @errdesc = 'Товар не активен'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @check_list_id_waybill_temp [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'waybill.get', @jsT, @rp_ out	

						-- Проверка существует ли накладная
						if dbo.jv(@rp_, '$.response.id') is  null
							begin 
								set @err = 'err.check_list_create.not_unique_id_waybill'
								set @errdesc = 'Накладная не активна'
								goto err
							end

						---- Получаем необходимую информацию и записываем результат
						--set @jsT = ( select @check_list_id_waybill [id_waybill], @check_list_id_product [id_product] for json path, without_array_wrapper )
						--set @rp_ = null
						--exec [dbo].[ms_api] 'check_list.get', @jsT, @rp_ out	

						---- Проверка на уже сущуествующий товар в накладной
						--if dbo.jv(@rp_, '$.response.id') is not null
						--	begin 
						--		set @err = 'err.check_list_create.not_unique_id_product'
						--		set @errdesc = 'В накладной уже существует этот товар'
						--		goto err
						--	end

						if exists (select top 1 1 from [dbo].[check_list] where ([id_waybill] = @check_list_id_waybill_temp
										and [id_product] = @check_list_id_product_temp) and [status] = 'Y')
							begin 
								set @err = 'err.check_list_create.not_unique_id_waybill'
								set @errdesc = 'Товар для этой накладной уже существует!'
								goto err
							end

						--Изменяем
						update [dbo].[check_list] 
							set [status] = 'Y'
						where [id] = @check_list_id

						--Выводим
						set @rp = (select	@check_list_id	 [id]
											,'Y'			 [status]
									for json path, without_array_wrapper)
						goto ok

					end

				if @action in ('check_list.deactive')
					begin
						-- Проверка ввода id
						if ( @check_list_id is null )
							begin
								set @err = 'err.check_list_deactiv.object_not_found'
								set @errdesc = 'Контрольный список не найден'
								goto err
							end

						select  @check_list_id_temp			= [id],
								@check_list_id_product_temp	= [id_product],
								@check_list_id_waybill_temp	= [id_waybill],
								@check_list_status_temp		= [status] 
						from [dbo].[check_list] with(nolock)
						where [id] = @check_list_id

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @check_list_id [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'check_list.get', @jsT, @rp_ out	

						-- Проверка активен ли контрольный лист
						if dbo.jv(@rp_, '$.response[0].id') is  null
							begin 
								set @err = 'err.check_list_create.object_not_found'
								set @errdesc = 'Контрольный лист не активен'
								goto err
							end
						
						--Проверяем используется ли контрольный список
						if exists ( select top 1 1  from traffic
										join waybill on waybill.[id] = traffic.[id_waybill]
										join check_list on check_list.[id_waybill] = waybill.[id]
									where traffic.[id_waybill] = @check_list_id_waybill_temp   
										and traffic.[status] = 'Y' and waybill.[is_edit] = 'Y')
							begin
								set @err = 'err.check_list_deactiv.object_not_found'
								set @errdesc = 'Невозможно удалить контрольный лист, есть активные записи.'
								goto err
							end

						-- Меняем статус контрольному списку
						update [dbo].[check_list]
							set [status] = 'N'
						where [check_list].[id] = @check_list_id
        
						--Выводим
						set @rp = (select   @check_list_id	[id]
											,'N'			[status]
									for json path, without_array_wrapper)
						goto ok

					
					end

			end

		--Накладная
		if @sba in ('waybill')
			begin

				declare
					-- Основные переменные таблицы
					 @waybill_id		uniqueidentifier	= dbo.jv(@js, '$.id')
					,@waybill_num		int					= dbo.jv(@js, '$.num')

				if @action in ('waybill.get')
					begin
						-- Записываем результат
						set @rp = (
									select waybill.*
										from [dbo].[waybill] waybill with(nolock)
									where ( waybill.[id]  = @waybill_id or waybill.[num] = @waybill_num) and waybill.[is_edit] = 'Y'
									for json path, without_array_wrapper
									)
						goto ok
					end

				if @action in ('waybill.create')
					begin
						-- Проверка обязательных параметров на null
						if ( @waybill_num is null)
							begin
								set @err = 'err.waybill_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'
								goto err
							end

						-- Проверка формата номера
						if ( len(@waybill_num) > 15) or (@waybill_num < 0)
							begin
								set @err = 'err.waybill_create.unset_field'
								set @errdesc = 'Неверный формат номера накладной'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @waybill_num [num] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'waybill.get', @jsT, @rp_ out	

						-- Проверка на уже существующий номер накладной
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.waybill_create.not_unique_num'
								set @errdesc = 'Накладная с таким номером уже существует'
								goto err
							end

						--Генерируем новый id
						set @waybill_id = newid()


						--Cохранияем
						insert into [dbo].[waybill] ([id], [dadd], [num], [price], [is_edit])
						values (
								@waybill_id
								,getdate() 
								,@waybill_num
								,0
								,'Y'
								)

						--Выводим
						set @rp = (select	 @id			[id]		
											,@waybill_num	[num]
											,0				[price]
									for json path, without_array_wrapper)
						goto ok

					end

				if @action in ('waybill.edit')
					begin
						-- Проверка поля id на null
						if ( @waybill_id is null )
							begin
								set @err = 'err.waybill_edit.object_not_found'
								set @errdesc = 'Накладная не найдена'
								goto err
							end

						-- Проверка обязательных параметров на null
						if ( @waybill_num is null)
							begin
								set @err = 'err.waybill_create.unset_field'
								set @errdesc = 'Не указан параметр для изменения'
								goto err
							end

						-- Проверка формата номера
						if ( len(@waybill_num) > 15)
							begin
								set @err = 'err.waybill_create.unset_field'
								set @errdesc = 'Неверный формат номера накладной'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @waybill_id [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'waybill.get', @jsT, @rp_ out	

						-- Проверка id на существование в активном статусе
						if dbo.jv(@rp_, '$.response.id') is null
							begin 
								set @err = 'err.waybill_edit.object_not_found'
								set @errdesc = 'Накладная не найдена'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @waybill_num [num] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'waybill.get', @jsT, @rp_ out	

						-- Проверка на уже существующий номер накладной
						if dbo.jv(@rp_, '$.response.id') is not null
							begin 
								set @err = 'err.waybill_create.not_unique_num'
								set @errdesc = 'Накладная с таким номером уже существует'
								goto err
							end

						--Изменяем
						update [dbo].[waybill] 
							set [num]	= isnull(@waybill_num, [num])
						where [id] = @waybill_id

						--Выводим
						set @rp = (select *
									from [dbo].[waybill] with(nolock) where [id] = @waybill_id
									for json path, without_array_wrapper)
						goto ok
					end	
			
			end

		--Перевозки
		if @sba in ('traffic')
			begin
				declare
					--Основные переменные таблицы
					 @traffic_id					uniqueidentifier	= dbo.jv(@js, '$.id')
					,@traffic_id_attach   			uniqueidentifier	= dbo.jv(@js, '$.id_attach')
					,@traffic_id_city				uniqueidentifier	= dbo.jv(@js, '$.id_city')
					,@traffic_id_client				uniqueidentifier	= dbo.jv(@js, '$.id_client')
					,@traffic_id_waybill			uniqueidentifier	= dbo.jv(@js, '$.id_waybill')
					,@traffic_date					datetime			= dbo.jv(@js, '$.date')
					,@traffic_time_start_temp		time
					,@traffic_time_end_temp			time
					,@traffic_date_end_temp			datetime
					,@traffic_price					float(24)
					
					-- Дополнительные переменные
					,@traffic_id_temp				uniqueidentifier 
					,@traffic_id_city_temp			uniqueidentifier
					,@traffic_id_waybill_temp		uniqueidentifier
					,@traffic_distance_temp			float(24)
					,@traffic_treval_temp			int
					,@traffic_status_temp			char(1)

				if @action in ('traffic.get')
					begin
						-- Записываем результат
						set @rp = (
									select traffic.*
										from [dbo].[traffic] traffic with(nolock)
									where ( traffic.[id]  = @traffic_id or traffic.[id_attach] = @traffic_id_attach 
											or traffic.[id_city] = @traffic_id_city or traffic.[id_client] = @traffic_id_client 
											or traffic.[id_waybill] = @traffic_id_waybill) and traffic.[status] = 'Y'
									for json path
									)
						goto ok
					end

				if @action in ('traffic.create')
					begin
						-- Проверка обязательных параметров на null
						if ( @traffic_id_attach		is null
							or @traffic_id_city		is null
							or @traffic_id_client	is null
							or @traffic_id_waybill	is null
							or @traffic_date		is null)
							begin
								set @err = 'err.traffic_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'
								goto err
							end

						select	@traffic_id_city_temp	 = [id],
								@traffic_distance_temp	 = [distance],
								@traffic_treval_temp	 = [travel],
								@traffic_status_temp	 = [status] 
						from [dbo].[city] 
						where [id] = @traffic_id_city

						-- Проверка существует ли город
						if (@traffic_id_city_temp is null)
							begin 
								set @err = 'err.traffic_create.not_unique_id_city'
								set @errdesc = 'Город не найден'
								goto err
							end

						-- Проверка активен ли город
						if not (@traffic_status_temp = 'Y')
							begin 
								set @err = 'err.traffic_create.not_unique_id_city'
								set @errdesc = 'Город не активен'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @traffic_id_attach [id] for json path,  without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'attach.get', @jsT, @rp_ out	

						-- Проверка существует закрепленный транспорт
						if dbo.jv(@rp_, '$.response.id') is  null
							begin 
								set @err = 'err.traffic_create.not_unique_id_attach'
								set @errdesc = 'Закрепленный трансорт не активен'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @traffic_id_client [id] for json path,  without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'client.get', @jsT, @rp_ out	

						--- Проверка существует ли клиент
						if dbo.jv(@rp_, '$.response.id') is  null
							begin 
								set @err = 'err.traffic_create.not_unique_id_client'
								set @errdesc = 'Клиент не активен'
								goto err
							end

						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @traffic_id_waybill [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'waybill.get', @jsT, @rp_ out	

						--Проверка существует ли накладная
						if dbo.jv(@rp_, '$.response.id') is  null
							begin 
								set @err = 'err.traffic_create.not_unique_id_waybill'
								set @errdesc = 'Накладная не активна'
								goto err
							end

						-- Проверка используется ли накладная
						if exists (select top 1 1 from [dbo].[traffic] tr with(nolock)
										join waybill as wa with(nolock) on wa.[id] = tr.[id_waybill]
									where tr.[id_waybill] = @traffic_id_waybill and tr.[status] = 'Y' and wa.[is_edit] = 'Y')
							begin 
								set @err = 'err.traffic_create.not_unique_id_waybill'
								set @errdesc = 'Накладная уже используется'
								goto err
							end

						set @traffic_time_start_temp = cast(@traffic_date as time)
						set @traffic_date_end_temp = cast(dateadd(mi,(@traffic_treval_temp*2 + (@traffic_treval_temp*2) * 0.20),@traffic_date)as datetime)
						set @traffic_time_end_temp = cast(@traffic_date_end_temp as time)
						
						-- Проверка возможно ли осуществить в указанный день
						if (day(@traffic_date_end_temp)) != day((@traffic_date)) 
							begin 
								set @err = 'err.traffic_create.not_unique_id_waybill'
								set @errdesc = 'Перевозку невозможно завершить в указанный день'
								goto err
							end

						if object_id('tempdb..#time_traffic') is not null
						drop table #time_traffic

						select [time_start], [time_end],
							iif(@traffic_time_start_temp between [time_start] and [time_end], 1, 0) [time_start_contact],
							iif(@traffic_time_end_temp between [time_start] and [time_end], 1, 0) [time_end_contact],
							iif(@traffic_time_start_temp < [time_start] and @traffic_time_end_temp  > [time_end], 1, 0) [time_startend_contact]
						into #time_traffic
						from
						(
							select [time_start],
								dateadd(mi,(tr.[travel]*2) + (tr.[travel]*2) * 0.20, [time_start]) [time_end]
								from
								(
									select cast([date] as time) [time_start], ct.[travel] 
									from traffic tr with(nolock)
										join city ct with(nolock) on ct.[id] = tr.[id_city]
									where tr.[id_attach] = @traffic_id_attach 
										and cast(tr.[date] as date) = cast(@traffic_date as date)
										and tr.[status] = 'Y'
								) tr
						) trr

						-- Проверка возможно ли осуществить перевозку на закрепленном траспорте	
						if  exists(select top 1 1 from #time_traffic  with(nolock)
										where [time_start_contact] = 1 or [time_end_contact] = 1 or [time_startend_contact] = 1) 												
							begin 
								set @err = 'err.traffic_create.not_unique_id_attach'
								set @errdesc = 'Закрепленный трансорт не может быть использован'
								goto err
							end
						
						--Генерируем новый id
						set @traffic_id = newid()

						--Формируем цену за перевозку
						set @traffic_price = @traffic_distance_temp * 20 --  20 рублей за километр

						--Cохранияем
						insert into [dbo].[traffic] ([id], [dadd], [id_attach], [id_city], [id_client], [id_waybill],
														[date], [price], [dadd_end], [status] )
						values (
								 @traffic_id
								,getdate() 
								,@traffic_id_attach
								,@traffic_id_city
								,@traffic_id_client
								,@traffic_id_waybill
								,@traffic_date
								,@traffic_price
								,null  -- завершена / в пути / не завершена
								,'Y'  -- статус перевозки
								)

						--Выводим
						set @rp = (select @traffic_id			[id]		
										 ,@traffic_id_attach	[id_attach]
										 ,@traffic_id_city		[id_city]
										 ,@traffic_id_client	[id_client]
										 ,@traffic_id_waybill	[id_waybill]
										 ,@traffic_date			[date]
										 ,@traffic_price		[price]
									for json path, without_array_wrapper)
						goto ok
					
					end

				if @action in ('traffic.cancel')
					begin
						-- Проверка ввода id
						if ( @traffic_id is null )
							begin
								set @err = 'err.traffic_cancell.object_not_found'
								set @errdesc = 'Перевозка не найдена.'
								goto err
							end
						
						-- Получаем необходимую информацию и записываем результат
						set @jsT = ( select @traffic_id [id] for json path, without_array_wrapper )
						set @rp_ = null
						exec [dbo].[ms_api] 'traffic.get', @jsT, @rp_ out	

						--Проверяем существует ли перевозка 
						if dbo.jv(@rp_, '$.response[0].id') is  null
							begin 
								set @err = 'err.traffic_cancell.object_not_found'
								set @errdesc = 'Перевозка  не найдена'
								goto err
							end

						-- Меняем статус перевозки
						update [dbo].[traffic]
							set [status] = 'N', -- Закрыта
								[dadd_end] = null -- отмена
						where [id] = @traffic_id

						--Выводим
						set @rp = (select *
									from [dbo].[traffic] with(nolock) where [id] = @traffic_id
									for json path)
						goto ok
					end

				if @action in ('traffic.complete')
					begin
						-- Проверка ввода id
						if ( @traffic_id is null )
							begin
								set @err = 'err.traffic_deactiv.object_not_found'
								set @errdesc = 'Перевозка  не найдена'
								goto err
							end

						select	@traffic_id_temp			= [id],
								@traffic_id_waybill_temp	= [id_waybill],
								@traffic_status_temp		= [status] 
						from [dbo].[traffic] 
						where [id] = @traffic_id

						--Проверяем существует ли перевозка 
						if ( @traffic_id_temp is null)
							begin
								set @err = 'err.traffic_deactiv.object_not_found'
								set @errdesc = 'Перевозка  не найдена'
								goto err
							end

						--Проверяем на то перевозка активна
						if not ( @traffic_status_temp = 'Y')
							begin
								set @err = 'err.traffic_deactiv.object_not_found'
								set @errdesc = 'Перевозка  не активна'
								goto err
							end
						
						begin tran
							begin try
								-- Меняем статус перевозки
								update [dbo].[traffic]
									set [dadd_end]	= getdate(),  -- Завершена
										[status]	= 'N'		  -- Закрыта
								where [id] = @traffic_id_temp

								-- Меняем статус накладной
								update [dbo].[waybill]
									set [is_edit] = 'N'			 -- Нельзя изменять
								where [id] = @traffic_id_waybill_temp
							end try

							begin catch
								-- Откатываем транзакцию
								rollback tran
								set @errdesc = 'Не удалось завершить перевозку'
								set @err = 'err.traffic_deactiv.tran_rollback'
								goto err
							end catch
						commit tran

							--Выводим
							set @rp = (select *
										from [dbo].[traffic] with(nolock) where [id] = @traffic_id_temp
										for json path )
							goto ok
					
					end

			
			end


	end try

	begin catch
		
		set @errdesc = ERROR_MESSAGE()
		set @err = 'err.sys'

		goto err

	end catch 




    err:
	    set @rp = ( select 'err' [status], lower(@s + '.' + @err) err, @errdesc errdesc for json path, without_array_wrapper )
	    return

    ok:
		set @rp = ( select 'ok' [status], json_query(@rp) response for json path, without_array_wrapper )
	    return

end
GO
