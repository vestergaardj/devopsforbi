CREATE TABLE [Sales].[OrderLines](
	[OrderLineID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[StockItemID] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[PackageTypeID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[TaxRate] [decimal](18, 3) NOT NULL,
	[PickedQuantity] [int] NOT NULL,
	[PickingCompletedWhen] [datetime2](7) NULL,
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Sales_OrderLines] PRIMARY KEY CLUSTERED 
(
	[OrderLineID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Sales].[OrderLines] ADD  CONSTRAINT [DF_Sales_OrderLines_OrderLineID]  DEFAULT (NEXT VALUE FOR [Sequences].[OrderLineID]) FOR [OrderLineID]
GO

ALTER TABLE [Sales].[OrderLines] ADD  CONSTRAINT [DF_Sales_OrderLines_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO

ALTER TABLE [Sales].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_Sales_OrderLines_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[OrderLines] CHECK CONSTRAINT [FK_Sales_OrderLines_Application_People]
GO

ALTER TABLE [Sales].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_Sales_OrderLines_OrderID_Sales_Orders] FOREIGN KEY([OrderID])
REFERENCES [Sales].[Orders] ([OrderID])
GO

ALTER TABLE [Sales].[OrderLines] CHECK CONSTRAINT [FK_Sales_OrderLines_OrderID_Sales_Orders]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a line on an Order within the database' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'OrderLineID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Order that this line is associated with' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'OrderID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Stock item for this order line (FK not indexed as separate index exists)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'StockItemID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Description of the item supplied (Usually the stock item name but can be overridden)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Type of package to be supplied' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'PackageTypeID'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity to be supplied' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'Quantity'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unit price to be charged' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Tax rate to be applied' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'TaxRate'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity picked from stock' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'PickedQuantity'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'When was picking of this line completed?' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'PickingCompletedWhen'
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Detail lines from customer orders' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines'
GO


