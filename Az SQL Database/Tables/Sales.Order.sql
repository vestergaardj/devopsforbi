CREATE TABLE [Sales].[Orders]
(
    [OrderID] [int] NOT NULL,
    [CustomerID] [int] NOT NULL,
    [SalespersonPersonID] [int] NOT NULL,
    [PickedByPersonID] [int] NULL,
    [ContactPersonID] [int] NOT NULL,
    [BackorderOrderID] [int] NULL,
    [OrderDate] [date] NOT NULL,
    [ExpectedDeliveryDate] [date] NOT NULL,
    [CustomerPurchaseOrderNumber] [nvarchar](20) NULL,
    [IsUndersupplyBackordered] [bit] NOT NULL,
    [Comments] [nvarchar](max) NULL,
    [DeliveryInstructions] [nvarchar](max) NULL,
    [InternalComments] [nvarchar](max) NULL,
    [PickingCompletedWhen] [datetime2](7) NULL,
    [LastEditedBy] [int] NOT NULL,
    [LastEditedWhen] [datetime2](7) NOT NULL,
    CONSTRAINT [PK_Sales_Orders]
        PRIMARY KEY CLUSTERED ([OrderID] ASC)
        WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [Sales].[Orders]
ADD CONSTRAINT [DF_Sales_Orders_OrderID]
    DEFAULT (NEXT VALUE FOR [Sequences].[OrderID]) FOR [OrderID]
GO

ALTER TABLE [Sales].[Orders]
ADD CONSTRAINT [DF_Sales_Orders_LastEditedWhen]
    DEFAULT (SYSDATETIME()) FOR [LastEditedWhen]
GO

ALTER TABLE [Sales].[Orders] WITH CHECK
ADD CONSTRAINT [FK_Sales_Orders_Application_People]
    FOREIGN KEY ([LastEditedBy])
    REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Sales_Orders_Application_People]
GO

ALTER TABLE [Sales].[Orders] WITH CHECK
ADD CONSTRAINT [FK_Sales_Orders_BackorderOrderID_Sales_Orders]
    FOREIGN KEY ([BackorderOrderID])
    REFERENCES [Sales].[Orders] ([OrderID])
GO

ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Sales_Orders_BackorderOrderID_Sales_Orders]
GO

ALTER TABLE [Sales].[Orders] WITH CHECK
ADD CONSTRAINT [FK_Sales_Orders_ContactPersonID_Application_People]
    FOREIGN KEY ([ContactPersonID])
    REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Sales_Orders_ContactPersonID_Application_People]
GO

ALTER TABLE [Sales].[Orders] WITH CHECK
ADD CONSTRAINT [FK_Sales_Orders_CustomerID_Sales_Customers]
    FOREIGN KEY ([CustomerID])
    REFERENCES [Sales].[Customers] ([CustomerID])
GO

ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Sales_Orders_CustomerID_Sales_Customers]
GO

ALTER TABLE [Sales].[Orders] WITH CHECK
ADD CONSTRAINT [FK_Sales_Orders_PickedByPersonID_Application_People]
    FOREIGN KEY ([PickedByPersonID])
    REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Sales_Orders_PickedByPersonID_Application_People]
GO

ALTER TABLE [Sales].[Orders] WITH CHECK
ADD CONSTRAINT [FK_Sales_Orders_SalespersonPersonID_Application_People]
    FOREIGN KEY ([SalespersonPersonID])
    REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Sales_Orders_SalespersonPersonID_Application_People]
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Numeric ID used for reference to an order within the database',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'OrderID'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Customer for this order',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'CustomerID'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Salesperson for this order',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'SalespersonPersonID'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Person who picked this shipment',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'PickedByPersonID'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Customer contact for this order',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'ContactPersonID'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'If this order is a backorder, this column holds the original order number',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'BackorderOrderID'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Date that this order was raised',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'OrderDate'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Expected delivery date',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'ExpectedDeliveryDate'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Purchase Order Number received from customer',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'CustomerPurchaseOrderNumber'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'If items cannot be supplied are they backordered?',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'IsUndersupplyBackordered'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Any comments related to this order (sent to customer)',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'Comments'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Any comments related to order delivery (sent to customer)',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'DeliveryInstructions'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Any internal comments related to this order (not sent to the customer)',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'InternalComments'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'When was picking of the entire order completed?',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders',
                                @level2type = N'COLUMN',
                                @level2name = N'PickingCompletedWhen'
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
                                @value = N'Detail of customer orders',
                                @level0type = N'SCHEMA',
                                @level0name = N'Sales',
                                @level1type = N'TABLE',
                                @level1name = N'Orders'
GO


