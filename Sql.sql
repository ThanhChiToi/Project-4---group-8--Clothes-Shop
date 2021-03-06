USE [longvu]
GO
/****** Object:  Table [dbo].[brands]    Script Date: 12/26/2020 9:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](255) NULL,
	[BrandStatus] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/26/2020 9:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
	[CategoryStatus] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/26/2020 9:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[DoB] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[management_products]    Script Date: 12/26/2020 9:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[management_products](
	[MProductId] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NULL,
	[ProductId] [int] NULL,
	[CateogryId] [int] NULL,
 CONSTRAINT [PK_management_products] PRIMARY KEY CLUSTERED 
(
	[MProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 12/26/2020 9:51:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[ProductPrice] [float] NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductStatus] [int] NULL,
	[Image] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[management_products]  WITH CHECK ADD  CONSTRAINT [FK_management_products_brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[brands] ([BrandId])
GO
ALTER TABLE [dbo].[management_products] CHECK CONSTRAINT [FK_management_products_brands]
GO
ALTER TABLE [dbo].[management_products]  WITH CHECK ADD  CONSTRAINT [FK_management_products_categories] FOREIGN KEY([CateogryId])
REFERENCES [dbo].[categories] ([CategoryId])
GO
ALTER TABLE [dbo].[management_products] CHECK CONSTRAINT [FK_management_products_categories]
GO
ALTER TABLE [dbo].[management_products]  WITH CHECK ADD  CONSTRAINT [FK_management_products_products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[products] ([ProductId])
GO
ALTER TABLE [dbo].[management_products] CHECK CONSTRAINT [FK_management_products_products]
GO
