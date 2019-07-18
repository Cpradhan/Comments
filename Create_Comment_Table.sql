USE [CommentsDb]
GO

/****** Object:  Table [dbo].[Comment]    Script Date: 18/07/2019 13:12:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppId] [varchar](max) NULL,
	[SheetId] [varchar](max) NULL,
	[Username] [varchar](50) NULL,
	[UserSelections] [varchar](max) NULL,
	[CommentText] [varchar](max) NULL,
	[Mode] [varchar](50) NULL,
	[Importance] [varchar](50) NULL,
	[Created] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_Created]  DEFAULT (getdate()) FOR [Created]
GO


