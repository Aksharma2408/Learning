CREATE DATABASE [ODTTool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ODTTool', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ODTTool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ODTTool_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ODTTool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ODTTool] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ODTTool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ODTTool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ODTTool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ODTTool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ODTTool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ODTTool] SET ARITHABORT OFF 
GO
ALTER DATABASE [ODTTool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ODTTool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ODTTool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ODTTool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ODTTool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ODTTool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ODTTool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ODTTool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ODTTool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ODTTool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ODTTool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ODTTool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ODTTool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ODTTool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ODTTool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ODTTool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ODTTool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ODTTool] SET RECOVERY FULL 
GO
ALTER DATABASE [ODTTool] SET  MULTI_USER 
GO
ALTER DATABASE [ODTTool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ODTTool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ODTTool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ODTTool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ODTTool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ODTTool] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ODTTool', N'ON'
GO
ALTER DATABASE [ODTTool] SET QUERY_STORE = OFF
GO
USE [ODTTool]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Application](
	[App_Id] [int] IDENTITY(1,1) NOT NULL,
	[App_Nm] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Master_Application] PRIMARY KEY CLUSTERED 
(
	[App_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Master_Application] UNIQUE NONCLUSTERED 
(
	[App_Nm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_ODT_Connection_Information]    Script Date: 3/10/2022 5:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_ODT_Connection_Information](
	[App_Mstr_Id] [int] IDENTITY(1,1) NOT NULL,
	[App_Id] [int] NOT NULL,
	[App_Nm] [varchar](50) NULL,
	[Bank_Id] [varchar](4) NOT NULL,
	[Org_Nm] [varchar](max) NULL,
	[Proxy_Id] [varchar](40) NULL,
	[Proxy_Pwd] [varchar](40) NULL,
	[Host_Addr_Core] [varchar](50) NULL,
	[Host_Addr_Corp] [varchar](50) NULL,
	[Listener_Port] [int] NULL,
	[Server_Id] [varchar](50) NULL,
	[Network_Id] [varchar](50) NULL,
	[Initial] [varchar](50) NULL,
 CONSTRAINT [PK_Master_ODT_Connection_Information] PRIMARY KEY CLUSTERED 
(
	[App_Id] ASC,
	[Bank_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_User]    Script Date: 3/10/2022 5:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_User](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Lan_Id] [varchar](100) NOT NULL,
	[User_Nm] [varchar](50) NOT NULL,
	[Email] [varchar](60) NULL,
	[User_Role] [char](1) NOT NULL,
	[Active_Fl] [bit] NOT NULL,
	[Admin_Fl] [bit] NOT NULL,
	[Create_Dt] [datetime2](7) NOT NULL,
	[Create_User_Id] [varchar](50) NOT NULL,
	[Update_User_Id] [varchar](50) NOT NULL,
	[Update_Dt] [datetime2](7) NOT NULL,
	[Deleted_User_Id] [varchar](50) NOT NULL,
	[Deleted_Dt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Master_User] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Master_User_LanId] UNIQUE NONCLUSTERED 
(
	[User_Lan_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_User_Application]    Script Date: 3/10/2022 5:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_User_Application](
	[User_App_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[App_Id] [int] NULL,
	[Create_Dt] [datetime2](7) NOT NULL,
	[Create_User_Id] [varchar](50) NOT NULL,
	[Update_User_Id] [varchar](50) NOT NULL,
	[Update_Dt] [datetime2](7) NOT NULL,
	[Deleted_User_Id] [varchar](100) NOT NULL,
	[Deleted_Dt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Master__User_Application] PRIMARY KEY CLUSTERED 
(
	[User_App_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Master_User] ADD  CONSTRAINT [DF_Master_User_UserRole]  DEFAULT ('U') FOR [User_Role]
GO
ALTER TABLE [dbo].[Master_User] ADD  CONSTRAINT [DF_Master_User_Active_Fl]  DEFAULT ((1)) FOR [Active_Fl]
GO
ALTER TABLE [dbo].[Master_User] ADD  CONSTRAINT [DF_Master_User_Admin_Fl]  DEFAULT ((0)) FOR [Admin_Fl]
GO
ALTER TABLE [dbo].[Master_User] ADD  DEFAULT (sysdatetime()) FOR [Create_Dt]
GO
ALTER TABLE [dbo].[Master_User] ADD  DEFAULT (suser_sname()) FOR [Create_User_Id]
GO
ALTER TABLE [dbo].[Master_User] ADD  DEFAULT (suser_sname()) FOR [Update_User_Id]
GO
ALTER TABLE [dbo].[Master_User] ADD  DEFAULT (sysdatetime()) FOR [Update_Dt]
GO
ALTER TABLE [dbo].[Master_User_Application] ADD  DEFAULT (sysdatetime()) FOR [Create_Dt]
GO
ALTER TABLE [dbo].[Master_User_Application] ADD  DEFAULT (suser_sname()) FOR [Create_User_Id]
GO
ALTER TABLE [dbo].[Master_User_Application] ADD  DEFAULT (suser_sname()) FOR [Update_User_Id]
GO
ALTER TABLE [dbo].[Master_User_Application] ADD  DEFAULT (sysdatetime()) FOR [Update_Dt]
GO
ALTER TABLE [dbo].[Master_User_Application]  WITH CHECK ADD  CONSTRAINT [FK_App_Id] FOREIGN KEY([App_Id])
REFERENCES [dbo].[Master_Application] ([App_Id])
GO
ALTER TABLE [dbo].[Master_User_Application] CHECK CONSTRAINT [FK_App_Id]
GO
ALTER TABLE [dbo].[Master_User_Application]  WITH CHECK ADD  CONSTRAINT [FK_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Master_User] ([User_Id])
GO
ALTER TABLE [dbo].[Master_User_Application] CHECK CONSTRAINT [FK_User_Id]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[p_DeleteUserDetails]
	(
		@UserId		INT,
		@UpdatedBy	Varchar(50)
	)
AS
/***
============================================================================================
Name								: p_DeleteUserDetails
Purpose								: Delete User
Description							: SP wil be used to delete the user information
Database							: ODTTool
Called by Application				: ODT Web Tool
Upstream System/Database			: NA
Upstream System/Database			: NA
Dependent Objects					: Master_User
Author								: Amit Kumar Sharma
Date								: 20190312
============================================================================================
Paramaters :
Name								[I/O]					Description	
--------------------------------------------------------------------------------------------
@UserId								  I						User Id
@UpdatedBy							  I						User Id updated (deleted) the record
--------------------------------------------------------------------------------------------
Returns:
--------------------------------------------------------------------------------------------
Return Value: Return Code
	Sucess: 0
	Failure: Error Number and desciption
--------------------------------------------------------------------------------------------
Execute Command: Exec p_DeleteUserDetails 'aksharma', 'aksharma1'
--------------------------------------------------------------------------------------------
Revision History:
--------------------------------------------------------------------------------------------
Ini						|	Date	  |		Desciption
Amit Kumar Sharma			20190212  |		Initial
=============================================================================================
**/
BEGIN
	SET NOCOUNT ON;

	DECLARE @Error_Cd			INT		
			,@Error_Msg			NVARCHAR(2048)
			,@Error_State		INT
			,@Error_Severity	INT
			,@Updated_On		DATETIME;
	
	SET @Updated_On	=	GETDATE()
	SET @Error_Cd	=	0;
	
	BEGIN TRY

	BEGIN TRAN DELUSER;
		BEGIN
			UPDATE dbo.Master_User
				SET	Active_Fl		= 0
					,Update_User_Id = @UpdatedBy
					,Update_Dt		= @Updated_On
			WHERE User_Id = @UserId
				AND	Active_Fl = 1;
		END;
		COMMIT TRAN DELUSER;
	END TRY

	BEGIN CATCH
	IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION DELUSER;

		SET	@Error_Msg		=	ERROR_MESSAGE();
		SET	@Error_State	=	ERROR_STATE();
		SET @Error_Severity =	ERROR_SEVERITY();
		SET @Error_Cd		=	ERROR_NUMBER();

		RAISERROR (@Error_msg, @Error_Severity, @Error_State);
	END CATCH;

	RETURN @Error_Cd;

END
GO
/****** Object:  StoredProcedure [dbo].[p_Exist_UserLanId]    Script Date: 3/10/2022 5:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[p_Exist_UserLanId]
	(
		@UserLanId	varchar(50)
	)
AS
/***
============================================================================================
Name								: p_Exist_UserLanId
Purpose								: Check If Lan Id exists
Description							: SP wil be used to check if Lan Id already exists 
Database							: ODTTool
Called by Application				: ODT Web Tool
Upstream System/Database			: NA
Upstream System/Database			: NA
Dependent Objects					: Master_User
Author								: Amit Kumar Sharma
Date								: 20190312
============================================================================================
Paramaters :
Name								[I/O]					Description	
--------------------------------------------------------------------------------------------
@UserLanId							  I						User Lan Id
--------------------------------------------------------------------------------------------
Returns:
--------------------------------------------------------------------------------------------
Return Value: Return Code
	Sucess: 0
	Failure: Error Number and desciption
--------------------------------------------------------------------------------------------
Execute Command: Exec p_Exist_UserLanId 'aksharma'
--------------------------------------------------------------------------------------------
Revision History:
--------------------------------------------------------------------------------------------
Ini						|	Date	  |		Desciption
Amit Kumar Sharma			20190212  |		Initial
=============================================================================================
**/
BEGIN
	SET NOCOUNT ON;

	DECLARE @Error_Cd			INT		
			,@Error_Msg			NVARCHAR(2048)
			,@Error_State		INT
			,@Error_Severity	INT;

	SET @Error_Cd =	0;
	
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM dbo.Master_User WHERE User_Lan_Id = @UserLanId AND Active_Fl = 1)
		BEGIN
			SELECT 1 AS Result;
		END;
		ELSE
		BEGIN
			SELECT 0 AS Result;
		END;

	END TRY

	BEGIN CATCH
		SET	@Error_Msg		=	ERROR_MESSAGE();
		SET	@Error_State	=	ERROR_STATE();
		SET @Error_Severity =	ERROR_SEVERITY();
		SET @Error_Cd		=	ERROR_NUMBER();

		RAISERROR (@Error_msg, @Error_Severity, @Error_State);
	END CATCH;

	RETURN @Error_Cd;

END
GO
/****** Object:  StoredProcedure [dbo].[p_Get_UserDetails]    Script Date: 3/10/2022 5:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[p_Get_UserDetails]
	(
		@UserLanId	varchar(100) = NULL
	)
AS
/***
============================================================================================
Name								: p_Get_UserDetails
Purpose								: Return user information
Description							: SP wil be used to retrieve the user details
Database							: ODTTool
Called by Application				: ODT Web Tool
Upstream System/Database			: NA
Upstream System/Database			: NA
Dependent Objects					: Master_User, Master_User_Application_Master_Application
Author								: Amit Kumar Sharma
Date								: 20190312
============================================================================================
Paramaters :
Name								[I/O]					Description	
--------------------------------------------------------------------------------------------
@UserLanId							  I						User Id
--------------------------------------------------------------------------------------------
Returns:
--------------------------------------------------------------------------------------------
Return Value: Return Code
	Sucess: 0
	Failure: Error Number and desciption
--------------------------------------------------------------------------------------------
Execute Command: Exec p_Get_UserDetails 'aksharma'
--------------------------------------------------------------------------------------------
Revision History:
--------------------------------------------------------------------------------------------
Ini						|	Date	  |		Desciption
Amit Kumar Sharma			20190212  |		Initial
=============================================================================================
**/
BEGIN
	SET NOCOUNT ON;

	DECLARE @Error_Cd			INT		
			,@Error_Msg			NVARCHAR(2048)
			,@Error_State		INT
			,@Error_Severity	INT
			,@One				INT
			,@Active_Fl			INT;

	SET	@Error_Cd	=	0;
	SET @One		=   1;
	SET @Active_Fl	=	1;

	BEGIN TRY
		SELECT USERID
			,UserLanId
			,UserName
			,Admin_Fl
			,Email
			,CASE(Admin_Fl)
				WHEN 1 THEN 'Yes'
				WHEN 0 THEN 'No'
			END as IsAdminText
			,UserRole
			,Applications
		FROM
		(
			SELECT	 User_id as 'UserId'
					,User_Lan_Id as 'UserLanId'
					,User_Nm as 'UserName'
					,Admin_Fl as 'Admin_Fl'
					,Email
					,Active_Fl
					,CASE (Admin_Fl)
						WHEN @One Then 'Yes'
						WHEN 0 Then	'No'
					END AS IsAdminText,
					User_Role as 'UserRole',
					STUFF((SELECT ',' + Convert(varchar(250), ma.APP_Nm)
							FROM dbo.Master_User_Application MU
							INNER JOIN dbo.Master_Application MA
							ON MU.App_id = MA.App_Id
							WHERE mu.User_id = tu.user_id
							FOR XML PATH (''), TYPE).value('.','varchar(4000)'),@One,@One,'') Applications
			FROM dbo.Master_user TU
			WHERE Active_Fl = @Active_Fl
		 ) drvtable
		 WHERE (UserLanId ! = @UserLanId OR @UserLanId IS NULL)
		 AND Active_Fl = @Active_Fl
		 ORDER BY UserLanId
		 	
	END TRY

	BEGIN CATCH
		SET	@Error_Msg		=	ERROR_MESSAGE();
		SET	@Error_State	=	ERROR_STATE();
		SET @Error_Severity =	ERROR_SEVERITY();
		SET @Error_Cd		=	ERROR_NUMBER();

		RAISERROR (@Error_msg, @Error_Severity, @Error_State);
	END CATCH;

	RETURN @Error_Cd;

END
GO
/****** Object:  StoredProcedure [dbo].[p_Insert_UserDetails]    Script Date: 3/10/2022 5:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[p_Insert_UserDetails]
	(
		@Username		varchar(50),
		@UserLanId		varchar(50),
		@Admin			bit,
		@Email			varchar(100),
		@CreatedBy		varchar(50),
		@AppIds			varchar(255)
	)
AS
/***
============================================================================================
Name								: p_Insert_UserDetails
Purpose								: Insert User
Description							: SP wil be used to insert user details
Database							: ODTTool
Called by Application				: ODT Web Tool
Upstream System/Database			: NA
Upstream System/Database			: NA
Dependent Objects					: Master
Author								: Amit Kumar Sharma
Date								: 20190312
============================================================================================
Paramaters :
Name							[I/O]					Description	
--------------------------------------------------------------------------------------------
@UserName						 I						User Name
@LanId							 I						User Lan Id
@Admin							 I						Flag Indicates if user is admin or not
@Email							 I						User Email Address
@CreatedBy						 I						User Lan Id adding the user
@AppIds							 I						List of App Ids
--------------------------------------------------------------------------------------------
Returns:
--------------------------------------------------------------------------------------------
Return Value: Return Code
	Sucess: 0
	Failure: Error Number and desciption
--------------------------------------------------------------------------------------------
Execute Command: Exec p_Insert_UserDetails 'aksharma', 'aksharma',1,aksharma@gmail.com,
				 'aksharma1', '1,2'
--------------------------------------------------------------------------------------------
Revision History:
--------------------------------------------------------------------------------------------
Ini						|	Date	  |		Desciption
Amit Kumar Sharma			20190212  |		Initial
=============================================================================================
**/
BEGIN
	SET NOCOUNT ON;

	DECLARE @Error_Cd			INT		
			,@Error_Msg			NVARCHAR(2048)
			,@Error_State		INT
			,@Error_Severity	INT
			,@User_Id			INT
			,@Character			CHAR(1)
			,@StartIndex		INT
			,@EndIndex			INT;

	SET @Error_Cd = 0;
	SET	@User_Id  = ','
	SET @StartIndex = 1;

   /* Table will contain less than 1000 records so it is advisable to use table variable instead of temp table */
	DECLARE @App_Table table
	(
		Id Int Identity
	    ,Item varchar(4)
	);

BEGIN TRY	 

    IF SUBSTRING(@AppIds, LEN(@AppIds) - 1, LEN(@AppIds)) <> @Character
    BEGIN
        SET @AppIds = @AppIds + @Character
    END
 
    WHILE CHARINDEX(@Character, @AppIds) > 0
    BEGIN
        SET @EndIndex = CHARINDEX(@Character, @AppIds)
         
        INSERT INTO @App_Table(Item)
        SELECT SUBSTRING(@AppIds, @StartIndex, @EndIndex - 1)
         
        SET @AppIds = SUBSTRING(@AppIds, @EndIndex + 1, LEN(@AppIds))
    END 
    RETURN

	BEGIN TRAN InsertUser;
		BEGIN
		INSERT INTO dbo.Master_User
				(User_Lan_Id
				,User_Nm
				,Admin_Fl
				,Active_Fl
				,Email
				,Create_User_Id
				,Create_Dt
				)
		VALUES
			(
				@UserLanId
				,@Username
				,@Admin
				,1
				,@Email
				,@CreatedBy
				,GETDATE()
			);

			SET @User_Id = SCOPE_IDENTITY();

		END;
	
		COMMIT TRAN InsertUser;
	END TRY

	BEGIN CATCH
	IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION InsertUser;

		SET	@Error_Msg		=	ERROR_MESSAGE();
		SET	@Error_State	=	ERROR_STATE();
		SET @Error_Severity =	ERROR_SEVERITY();
		SET @Error_Cd		=	ERROR_NUMBER();

		RAISERROR (@Error_msg, @Error_Severity, @Error_State);
	END CATCH;

	RETURN @Error_Cd;

END
GO
USE [master]
GO
ALTER DATABASE [ODTTool] SET  READ_WRITE 
GO
