USE [WE_UIT_WORKSHOP]
GO
/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 18-Dec-23 9:27:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](200) NOT NULL,
	[Phone] [varchar](11) NULL,
	[Email] [varchar](max) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductCategory]    Script Date: 18-Dec-23 9:27:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](200) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Products]    Script Date: 18-Dec-23 9:27:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](200) NOT NULL,
	[Cost] [money] NULL,
	[RetailPrice] [money] NOT NULL,
	[Discount] [money] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SaleDetail]    Script Date: 18-Dec-23 9:27:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SaleDetail](
	[SDId] [int] IDENTITY(1,1) NOT NULL,
	[SMId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Qty] [float] NOT NULL,
	[Rate] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_SaleDetail] PRIMARY KEY CLUSTERED 
(
	[SDId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SaleMaster]    Script Date: 18-Dec-23 9:27:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SaleMaster](
	[SMId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[TotalAmount] [money] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tbl_SaleMaster] PRIMARY KEY CLUSTERED 
(
	[SMId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SalesPayment]    Script Date: 18-Dec-23 9:27:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SalesPayment](
	[SPId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[SMId] [int] NOT NULL,
	[PaymentMode] [varchar](50) NOT NULL,
	[Amount] [money] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tbl_SalesPayment] PRIMARY KEY CLUSTERED 
(
	[SPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[tbl_ProductCategory] ADD  CONSTRAINT [DF_Table_1_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[tbl_Products] ADD  CONSTRAINT [DF_tbl_Products_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[tbl_SalesPayment] ADD  CONSTRAINT [DF_tbl_SalesPayment_Status]  DEFAULT ((0)) FOR [Status]
GO
USE [master]
GO
ALTER DATABASE [WE_UIT_WORKSHOP] SET  READ_WRITE 
GO
