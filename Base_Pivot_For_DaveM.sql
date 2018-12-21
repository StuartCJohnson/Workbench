/*
Account -- Rows
[BUSINESS_UNIT] -- Columns
Sum == Amount
*/

With
	Base_Query_cte
As
	(
	SELECT 
		[ACCOUNT],
		BUSINESS_UNIT,
		Case	
			When 
				BUSINESS_UNIT	= 20101
					then 
					Cast ([MONETARY_AMOUNT] as money)
			End 
				As Amount_For_20101,
		Case	
			When 
				BUSINESS_UNIT	= 20103
					then 
					Cast ([MONETARY_AMOUNT] as money)
			End 
				As Amount_For_20103



	 FROM 
		[NFActCorp].[GLEDGER].[Parallel_Ledger] where
	  (PRODUCT like 'B12132') and
	  (ACCOUNT like '15210000%') and
	  (JOURNAL_DATE = '2018-09-30') and
	  (Journal_ID like 'GGY%') and
	  (BOOK_CODE like 'GPRE%') 

	) 
Select
	Account, 
	Sum(Amount_For_20101) As '20101' ,
	Sum(Amount_For_20103) As '20103'
					
From

Base_Query_cte

Group by
	Account
