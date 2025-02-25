USE [master]
GO
/****** Object:  Database [BscDB]    Script Date: 11/12/2024 10:34:51 p. m. ******/
CREATE DATABASE [BscDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BscDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\BscDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BscDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\BscDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BscDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BscDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BscDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BscDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BscDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BscDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BscDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BscDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BscDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BscDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BscDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BscDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BscDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BscDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BscDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BscDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BscDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BscDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BscDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BscDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BscDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BscDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BscDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BscDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BscDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BscDB] SET  MULTI_USER 
GO
ALTER DATABASE [BscDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BscDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BscDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BscDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BscDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BscDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BscDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [BscDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BscDB]
GO
/****** Object:  Table [dbo].[productos_Bsc]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos_Bsc](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [nvarchar](15) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Existencia] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_productos_Bsc] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes_Bsc]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes_Bsc](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Razon_Social] [nvarchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_clientes_Bsc] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidosP_Bsc]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidosP_Bsc](
	[IdPedidoP] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[FechaP] [smalldatetime] NOT NULL,
	[Estado] [smallint] NOT NULL,
 CONSTRAINT [PK_PedidosP_Bsc] PRIMARY KEY CLUSTERED 
(
	[IdPedidoP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidosM_Bsc]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidosM_Bsc](
	[IdPedidoM] [int] IDENTITY(1,1) NOT NULL,
	[IdPedidoP] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_PedidosM_Bsc] PRIMARY KEY CLUSTERED 
(
	[IdPedidoM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Reporte_consultaPedidos]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Reporte_consultaPedidos]
AS
SELECT        ppr.IdPedidoP AS Pedido, cli.Razon_Social AS Cliente, pro.Nombre, ppm.Cantidad, ppr.ClienteId, ppr.FechaP AS Fecha, 
                         CASE WHEN ppr.Estado = 0 THEN 'Creado' WHEN ppr.Estado = 1 THEN 'Surtido' WHEN ppr.Estado = 0 THEN 'Cancelado' END AS Estatus
FROM            dbo.PedidosP_Bsc AS ppr INNER JOIN
                         dbo.PedidosM_Bsc AS ppm ON ppr.IdPedidoP = ppm.IdPedidoP INNER JOIN
                         dbo.productos_Bsc AS pro ON pro.ProductId = ppm.ProductId INNER JOIN
                         dbo.clientes_Bsc AS cli ON cli.Id_Cliente = ppr.ClienteId
GO
/****** Object:  View [dbo].[Reporte_existencias]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Reporte_existencias]
AS
SELECT        ProductId AS ID, Clave, Nombre, Existencia AS Cantidad, Activo
FROM            dbo.productos_Bsc
GO
/****** Object:  Table [dbo].[roles_Bsc]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles_Bsc](
	[Id_rol] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre_Rol] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_roles_Bsc] PRIMARY KEY CLUSTERED 
(
	[Id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_Bsc]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_Bsc](
	[userId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[passwordU] [nvarchar](8) NOT NULL,
	[rol] [tinyint] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_users_Bsc] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[clientes_Bsc] ADD  CONSTRAINT [DF_clientes_Bsc_Activo]  DEFAULT ((0)) FOR [Activo]
GO
ALTER TABLE [dbo].[PedidosP_Bsc] ADD  CONSTRAINT [DF_PedidosP_Bsc_Estado]  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[productos_Bsc] ADD  CONSTRAINT [DF_productos_Bsc_Activo]  DEFAULT ((0)) FOR [Activo]
GO
ALTER TABLE [dbo].[users_Bsc] ADD  CONSTRAINT [DF_users_Bsc_active]  DEFAULT ((0)) FOR [active]
GO
/****** Object:  StoredProcedure [dbo].[OptionAdminUser]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
	CREATE PROCEDURE [dbo].[OptionAdminUser]

    @userId smallint,
	@name NVARCHAR(50),
    @Email NVARCHAR(50),
    @Password NVARCHAR(50),
	@rol NVARCHAR(50),
	@option tinyint,
	@active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Crea usuario
	if @option = 0
	begin
    insert into  [BscDB].[dbo].[users_Bsc] ([name]
      ,[email]
      ,[passwordU]
      ,[rol]) values (@name, @Email, @Password, case
	  when @rol = 'Admin' then 0
	   when @rol = 'Personal' then 1
	    when @rol = 'Vendedor' then 2
		when @rol is null then 0
		end)
		SELECT SCOPE_IDENTITY() AS NewUserId;
	end

	--Edita Usuario
	else if @option = 1
	begin
	update [BscDB].[dbo].[users_Bsc] set [name] = @name , [Email] = @Email , [passwordU] = @Password, [rol] = case
	  when @rol = 'Admin' then 0
	   when @rol = 'Personal' then 1
	    when @rol = 'Vendedor' then 2
		when @rol is null then 0
		end
	where [userId] = @userId

	end

	--Inactiva usuario o reactiva usuario
	else if @option = 2
	begin
	update [BscDB].[dbo].[users_Bsc] set [active] = @active
	where [userId] = @userId
	end


		--Vista usuarios
	else if @option = 3
	begin
	SELECT  [userId]
      ,[name] as 'Nombre'
      ,[email] as 'Correo'
      ,[passwordU] as 'Contraseña'
      ,[rol] as 'Rol'
      ,[active] as 'Estatus'
  FROM [BscDB].[dbo].[users_Bsc]

	end


END
GO
/****** Object:  StoredProcedure [dbo].[OptionPedidos]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OptionPedidos]
@option tinyint,
@idPedidoP int,
@clave nvarchar(15),
@nombre nvarchar(50),
@cantidad int,
@productId int,
@idcliente int
AS
BEGIN


	SET NOCOUNT ON;

	--Verifica la existencia del producto, crea el pedido y lanza el trigger que actualiza la cantidad en la tabla productos_Bsc
	if @option = 0
	begin

	if (select top 1 Existencia from  [BscDB].[dbo].[productos_Bsc] where Nombre = @nombre) > 0 and (select top 1 Existencia from  [BscDB].[dbo].[productos_Bsc] where Nombre = @nombre) >= @cantidad 
	begin
	insert into [BscDB].[dbo].[PedidosP_Bsc] ([ClienteId] ,[FechaP]) values (@idcliente, getdate())
	insert into [BscDB].[dbo].[PedidosM_Bsc] ([IdPedidoP],[ProductId],[Cantidad]) values
	((select top 1 idPedidoP from [BscDB].[dbo].[PedidosP_Bsc] order by idPedidoP desc)
	, (select top 1 productId from  [BscDB].[dbo].[productos_Bsc] where Nombre = @nombre), @cantidad)
	SELECT SCOPE_IDENTITY() AS NewUserId;	
	end


	end

	--El estado del pedido cambia a surtido
	else if @option = 1
	begin

    update [BscDB].[dbo].[PedidosP_Bsc] set Estado = @option
	where idPedidoP = @idPedidoP
	end

		--El estado del pedido cambia a cancelado
	else if @option = 2
	begin

    update [BscDB].[dbo].[PedidosP_Bsc] set Estado = @option
	where idPedidoP = @idPedidoP
	end

			--Consulta de pedidos
	else if @option = 3
	begin
SELECT  [Pedido]
,Nombre
,Cantidad
      ,[Cliente]
      ,[Fecha]
      ,[Estatus]
  FROM [BscDB].[dbo].[Reporte_consultaPedidos]
	end

				--Consulta de existencias
	else if @option = 4
	begin
SELECT TOP (1000) [ID]
      ,[Clave]
      ,[Nombre]
      ,[Cantidad]
      ,[Activo]
  FROM [BscDB].[dbo].[Reporte_existencias]
  where Nombre = @nombre

	end





END
GO
/****** Object:  StoredProcedure [dbo].[OptionProducts]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OptionProducts]
@option tinyint,
@activo bit,
@clave nvarchar(15),
@nombre nvarchar(50),
@existencia int,
@productId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  --Crea producto
	if @option = 0
	begin
    insert into  [BscDB].[dbo].[productos_Bsc] ([Clave]
      ,[Nombre]
      ,[Existencia]) values (CONCAT('COP', (SELECT TOP 1 [ProductId] + 1 FROM [BscDB].[dbo].[productos_Bsc] ORDER BY [ProductId] desc)), upper(@nombre), @existencia)
	  SELECT SCOPE_IDENTITY() AS NewUserId;
	end

	--Edita nombre del producto
	else if @option = 1
	begin
	update [BscDB].[dbo].[productos_Bsc] set [Nombre] = @nombre
	where [ProductId] = @productId
	end

	--Inactiva producto o reactiva producto
	else if @option = 2
	begin
	update [BscDB].[dbo].[productos_Bsc] set [Activo] = @activo
	where [ProductId] = @productId
	end

	--Vista de productos en activo
	else if @option = 3
	begin
	select ID,
	[Clave]
      ,[Nombre]
      ,[Cantidad] from [BscDB].[dbo].[Reporte_existencias]
	  where activo = 0
	  end


	  	--Vista de productos inactivos
	else if @option = 4
	begin
	select  ID,
	[Clave]
      ,[Nombre]
      ,[Cantidad] from [BscDB].[dbo].[Reporte_existencias]
	  where activo = 1
	  end


END
GO
/****** Object:  StoredProcedure [dbo].[ValidateUserLogin]    Script Date: 11/12/2024 10:34:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ValidateUserLogin]
    @Email NVARCHAR(50),
    @Password NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT userId
    FROM  [BscDB].[dbo].[users_Bsc]
    WHERE email = @Email AND passwordU = @Password
	and active = 0;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ppr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ppm"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pro"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cli"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Reporte_consultaPedidos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Reporte_consultaPedidos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "productos_Bsc"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Reporte_existencias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Reporte_existencias'
GO
USE [master]
GO
ALTER DATABASE [BscDB] SET  READ_WRITE 
GO
