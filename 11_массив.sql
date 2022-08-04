--Задание: 
--1) добавить массив в json (название массива и данные в нем могут быть любые)
--2) добавить в model массив (название массива и данные в нем могут быть любые)
--3) заменить элемент tp на массив (название массива и данные в нем могут быть любые)

declare @js nvarchar(max)=
'{
  "status": "ok",
  "response": {
		"id": "13CA3476-7320-4E6D-A584-FC9ADA4204D4",
		"dadd": "2020-08-04T10:35:59.173",
		"drls": "2020-08-04T10:36:06.803",
		"num": "TR41428",
		"tp": "distributor",
		"userid": "8A5A8074-4440-47C7-91C1-AAEF19C83152",
		"status_tran": "wait_buyer",
		"model": {
					"buyer": "B6DCCC37-A7B4-4ED7-A0C4-E5EE3A8D70AF",
					"seller": "2E18C7A6-7D51-4FFB-BEF8-E3BCFC188059",
					"sum": "0.50",
					"orderid": "7801-220142-561517",
					"sum_distr": "2.00",
					"sum_full": 5,
					"promo": "1",
					"empls": [
								{
									"empl": "74B1259A-D8DF-4B67-9367-E230EAE823C2",
									"role": "buyer",
									"acc": "B6DCCC37-A7B4-4ED7-A0C4-E5EE3A8D70AF",
									"orderid": "7801-220142-561517"
								},
								{
									"empl": "52D39143-A5D3-4715-B7F5-FFDAF36BA2DF",
									"role": "seller",
									"acc": "2E18C7A6-7D51-4FFB-BEF8-E3BCFC188059",
									"orderid": "7801-220142-561517"
								}
							],
					"obj_tp": {
							"issms": "1",
							"flowid": "D134467F-7CC2-4A28-849C-B9A508607B13",
							"checksms_idWCF": "C2C81A00-683E-4DE9-8B12-B96645A55623",
							"confirm_idWCF": "D6B45F11-20E6-44C3-93AF-96FE1CD4CA70",
							"cancel_idWCF": "9BDEC355-52C9-41E1-B695-0E7B9998F08E",
							"close_idWCF": "DE1B7E46-3571-4606-8E8F-C76A8FBA4A0F"
							},
					"process_id": "EEBCE45A-8A89-483E-AA32-F81ACC1C7432",
					"mob": "79123456789",
					"history_deal": [
										{
											"dadd": "2020-08-04T10:37:24.187",
											"sum": "1.00",
											"sum_distr": "10.00"
										}
									]
				}
	  }
}'
--1) добавить массив в json (название массива и данные в нем могут быть любые)
select @js as образец

select 
JSON_VALUE(@js,'$.status') as [status] ,
json_query(@js,'$.response') as [response],
json_modify(json_query(json_modify(@js, '$.massiv',
				json_query('[{
				"Name": "Matt Prater",
				"YearsOfExperience": 14,
				"College": "Central Florida"
				 }]')),'$.massiv'),'append $.massiv',json_query('{"name": "AML_club", "leaque":"qazwsx"}'))
				 as massiv  for json path, without_array_wrapper	

--2) добавить в model массив (название массива и данные в нем могут быть любые)

	select 
	json_query(@js,'$.response.model') as [model],
	json_query(json_modify(json_modify(@js, ' $.response.model.massiv', json_query('[{
			"Sotrudnik":"Sasha",
			"Age":25,
			"phone":"89997107701"
		  }]')),'append $.response.model.massiv',json_query('{"name": "AML_club", "leaque":"qazwsx"}]')
		  ),'$.response.model.massiv')  as massiv for json path, without_array_wrapper
	

--3) заменить элемент tp на массив (название массива и данные в нем могут быть любые)
		
		select 
		--json_query(@js,'$.response') as [response]
		json_query(json_modify(
						json_modify(@js,'$.response.Sasha', json_query('[{"Name": "Alexandr",
						"Vozrast": 23,
						"College": "Central Florida"}]')),
						'$.response.tp', NULL),'$.response') as response for json path,without_array_wrapper
