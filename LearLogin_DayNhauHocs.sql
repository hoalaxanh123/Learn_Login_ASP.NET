USE [PhanQuyen]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 8/14/2018 3:06:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Role] [int] NULL,
	[Controller] [nvarchar](150) NULL,
	[Action] [nvarchar](150) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RememberTokens]    Script Date: 8/14/2018 3:06:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RememberTokens](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NULL,
	[Token] [nvarchar](500) NULL,
	[UserAgent] [nvarchar](500) NULL,
 CONSTRAINT [PK_RememberTokens] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/14/2018 3:06:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID_Role] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/14/2018 3:06:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Role] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[PassWord] [nvarchar](500) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (1, 1, N'Home', N'Index')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (2, 1, N'Home', N'Products')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (3, 1, N'Home', N'User')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (4, 2, N'Home', N'Index')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (5, 2, N'Home', N'Products')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (6, 3, N'Home', N'Index')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (7, 1, N'Home', N'Login')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (8, 2, N'Home', N'Login')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (9, 3, N'Home', N'Login')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (1002, 1, N'Home', N'Index2')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (1003, 1, N'Home', N'Users')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (1004, 1, N'Home', N'Logout')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (1005, 3, N'Home', N'Index2')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (1006, 3, N'Home', N'Logout')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (1007, 2, N'Home', N'Logout')
INSERT [dbo].[Permissions] ([ID], [ID_Role], [Controller], [Action]) VALUES (1008, 2, N'Home', N'Index2')
SET IDENTITY_INSERT [dbo].[Permissions] OFF
SET IDENTITY_INSERT [dbo].[RememberTokens] ON 

INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (2, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (3, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (4, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1002, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1003, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1004, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1005, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1006, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1007, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1008, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1009, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1010, 3, N'member⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1011, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1012, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1013, 2, N'manager⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1014, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1015, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1016, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1017, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1018, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1019, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1020, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1021, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1022, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1023, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1024, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1025, 1, N'admin⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1026, 3, N'member⌂123456', N'Chrome')
INSERT [dbo].[RememberTokens] ([ID], [ID_User], [Token], [UserAgent]) VALUES (1027, 1, N'admin⌂123456', N'Chrome')
SET IDENTITY_INSERT [dbo].[RememberTokens] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID_Role], [Name]) VALUES (1, N'Admin     ')
INSERT [dbo].[Roles] ([ID_Role], [Name]) VALUES (2, N'Manager   ')
INSERT [dbo].[Roles] ([ID_Role], [Name]) VALUES (3, N'Member    ')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [ID_Role], [UserName], [PassWord]) VALUES (1, 1, N'admin', N'123456')
INSERT [dbo].[Users] ([ID], [ID_Role], [UserName], [PassWord]) VALUES (2, 2, N'manager', N'123456')
INSERT [dbo].[Users] ([ID], [ID_Role], [UserName], [PassWord]) VALUES (3, 3, N'member', N'123456')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Roles] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Roles] ([ID_Role])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Roles]
GO
ALTER TABLE [dbo].[RememberTokens]  WITH CHECK ADD  CONSTRAINT [FK_RememberTokens_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[RememberTokens] CHECK CONSTRAINT [FK_RememberTokens_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Roles] ([ID_Role])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
