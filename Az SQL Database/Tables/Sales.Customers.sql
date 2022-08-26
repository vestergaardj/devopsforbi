CREATE TABLE [Sales].[Customers](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[BillToCustomerID] [int] NOT NULL,
	[CustomerCategoryID] [int] NOT NULL,
	[BuyingGroupID] [int] NULL,
	[PrimaryContactPersonID] [int] NOT NULL,
	[AlternateContactPersonID] [int] NULL,
	[DeliveryMethodID] [int] NOT NULL,
	[DeliveryCityID] [int] NOT NULL,
	[PostalCityID] [int] NOT NULL,
	[CreditLimit] [decimal](18, 2) NULL,
	[AccountOpenedDate] [date] NOT NULL,
	[StandardDiscountPercentage] [decimal](18, 3) NOT NULL,
	[IsStatementSent] [bit] NOT NULL,
	[IsOnCreditHold] [bit] NOT NULL,
	[PaymentDays] [int] NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[FaxNumber] [nvarchar](20) NOT NULL,
	[DeliveryRun] [nvarchar](5) NULL,
	[RunPosition] [nvarchar](5) NULL,
	[WebsiteURL] [nvarchar](256) NOT NULL,
	[DeliveryAddressLine1] [nvarchar](60) NOT NULL,
	[DeliveryAddressLine2] [nvarchar](60) NULL,
	[DeliveryPostalCode] [nvarchar](10) NOT NULL,
	[DeliveryLocation] [geography] NULL,
	[PostalAddressLine1] [nvarchar](60) NOT NULL,
	[PostalAddressLine2] [nvarchar](60) NULL,
	[PostalPostalCode] [nvarchar](10) NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Sales_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Sales_Customers_CustomerName] UNIQUE NONCLUSTERED 
(
	[CustomerName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Sales].[Customers_Archive])
)
GO

ALTER TABLE [Sales].[Customers] ADD  CONSTRAINT [DF_Sales_Customers_CustomerID]  DEFAULT (NEXT VALUE FOR [Sequences].[CustomerID]) FOR [CustomerID]
GO

ALTER TABLE [Sales].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customers_AlternateContactPersonID_Application_People] FOREIGN KEY([AlternateContactPersonID])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Customers] CHECK CONSTRAINT [FK_Sales_Customers_AlternateContactPersonID_Application_People]
GO

ALTER TABLE [Sales].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customers_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Customers] CHECK CONSTRAINT [FK_Sales_Customers_Application_People]
GO

ALTER TABLE [Sales].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customers_BillToCustomerID_Sales_Customers] FOREIGN KEY([BillToCustomerID])
REFERENCES [Sales].[Customers] ([CustomerID])
GO

ALTER TABLE [Sales].[Customers] CHECK CONSTRAINT [FK_Sales_Customers_BillToCustomerID_Sales_Customers]
GO

ALTER TABLE [Sales].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customers_PrimaryContactPersonID_Application_People] FOREIGN KEY([PrimaryContactPersonID])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Customers] CHECK CONSTRAINT [FK_Sales_Customers_PrimaryContactPersonID_Application_People]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a customer within the database' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s full name (usually a trading name)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'CustomerName'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Customer that this is billed to (usually the same customer but can be another parent company)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'BillToCustomerID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s category' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'CustomerCategoryID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s buying group (optional)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'BuyingGroupID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Primary contact' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'PrimaryContactPersonID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Alternate contact' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'AlternateContactPersonID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Standard delivery method for stock items sent to this customer' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'DeliveryMethodID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the delivery city for this address' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'DeliveryCityID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the postal city for this address' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'PostalCityID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Credit limit for this customer (NULL if unlimited)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'CreditLimit'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date this customer account was opened' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'AccountOpenedDate'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Standard discount offered to this customer' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'StandardDiscountPercentage'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is a statement sent to this customer? (Or do they just pay on each invoice?)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'IsStatementSent'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this customer on credit hold? (Prevents further deliveries to this customer)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'IsOnCreditHold'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Number of days for payment of an invoice (ie payment terms)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'PaymentDays'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Phone number' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Fax number  ' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'FaxNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Normal delivery run for this customer' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'DeliveryRun'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Normal position in the delivery run for this customer' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'RunPosition'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'URL for the website for this customer' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'WebsiteURL'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'First delivery address line for the customer' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'DeliveryAddressLine1'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Second delivery address line for the customer' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'DeliveryAddressLine2'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Delivery postal code for the customer' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'DeliveryPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Geographic location for the customer''s office/warehouse' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'DeliveryLocation'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'First postal address line for the customer' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'PostalAddressLine1'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Second postal address line for the customer' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'PostalAddressLine2'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Postal code for the customer when sending by mail' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'PostalPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Main entity tables for customers (organizations or individuals)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Customers'
GO


