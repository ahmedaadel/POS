Create database posdb

use posdb;



--enumeration section 

Create table credit_type (
[id] int primary key identity(1,1), 
[type] varchar(255) not null
)
insert into credit_type([type]) Values ('Addion') , ('Subtraction')

Create table order_type (
[id] int primary key identity(1,1),
[type] varchar(255) not null
)

insert into order_type ([type]) Values ('Delivery'),('Dine in'),('Takeaway')

Create table order_status (
[id] int primary key identity(1,1),
[status] varchar(255) not null
)

insert into order_status ([status]) Values ('Placed'),('Cancled')

Create table size(
[id] int primary key identity(1,1),
[size] varchar(255) not null
)
insert into size([size]) Values ('Small') , ('Medium' ), ('Large' ),('Single' ), ('Double') , ('Trible' )
--constraint section 


CREATE TABLE [contact_info] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [phone_number] nvarchar(255),
  [additional_number] nvarchar(255),
  [address] nvarchar(255)
)
GO

CREATE TABLE [industry] (
  [id] int PRIMARY KEY IDENTITY(1,1) ,
  [name] nvarchar(255),
  [description] varchar(255)
)
GO

CREATE TABLE [client] (
  [id] int PRIMARY KEY IDENTITY(1,1) ,
  [username] nvarchar(255) not null,
  [password] nvarchar(255) not null,
  [is_active] bit not null,
  [industry_id] int FOREIGN KEY ([industry_id]) REFERENCES [industry] ([id]),
  [email] nvarchar(255),
  [phone_number] nvarchar(255),
  [business_name] nvarchar(255)
)
GO

CREATE TABLE [customer] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] nvarchar(255) not null,
  [contact_info_id] int FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id]),
  [client_id] int not null FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
)
GO


CREATE TABLE [cashier] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] nvarchar(255) not null,
  [contact_info_id] int FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id]),
  [client_id] int  not null FOREIGN KEY ([client_id]) REFERENCES [client] ([id]),
  [username] nvarchar(255) not null,
  [password] nvarchar(255) not null
)
GO


CREATE TABLE [shift] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [shift_date] date,
  [start_hour] time,
  [end_hour] time,
  [cashier_id] int not null FOREIGN KEY ([cashier_id]) REFERENCES [cashier] ([id]),
  [balance] float,
  [client_id] int  not null FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
)
GO


CREATE TABLE [delivery_boy] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] varchar(255) not null,
  [contact_info_id] int FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id]),
  [client_id] int  not null FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
)
GO

CREATE TABLE [delivery_info] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [delivery_boy_id] int FOREIGN KEY ([delivery_boy_id]) REFERENCES [delivery_boy] ([id]),
  [shipping_price] float not null ,
  [notes] text,
  [customer_id] int FOREIGN KEY ([customer_id]) REFERENCES [customer] ([id])
)
GO


CREATE TABLE [category] (
  [id] int PRIMARY KEY IDENTITY(1,1), 
  [name] varchar(255) not null,
  [description] varchar(255),
  [parent_id] int FOREIGN KEY ([parent_id]) REFERENCES [category] ([id]),
  [client_id] int not null FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
)
GO


CREATE TABLE [menu_item] (
  [id] int PRIMARY KEY IDENTITY(1,1) ,
  [category_id] int  FOREIGN KEY ([category_id]) REFERENCES [category] ([id]),
  [name] nvarchar(255) not null,
  [is_available] bit,
  [description] text,
  [client_id] int not null FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
)
GO


CREATE TABLE [order] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [subtotal_price] float, 
  [tax_price] float ,
  [total_price] float ,
  [discount_price] float ,
  [service_fee] float ,
  [order_date] date,
  [shift_id] int not null FOREIGN KEY ([shift_id]) REFERENCES [shift] ([id]),
  [status] int not null foreign key ([status]) references [order_status] ([id]),
  [notes] nvarchar(255),
  [type] int not null foreign key ([type]) references [order_type] ([id]),
  [delivery_info_id] int FOREIGN KEY ([delivery_info_id]) REFERENCES [delivery_info] ([id]),
  [is_delivery_order] bit,
  [cashier_id] int not null FOREIGN KEY ([cashier_id]) REFERENCES [cashier] ([id]),
  [client_id] int not null FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
)
GO


CREATE TABLE [items_per_order] (
  [order_id] int not null FOREIGN KEY ([order_id]) REFERENCES [order] ([id]),
  [menu_item_id] int not null FOREIGN KEY ([menu_item_id]) REFERENCES [menu_item] ([id]),
  [quantity] int,
  [subtotal_price] float,
  [discount_price] float 
)
GO




CREATE TABLE [item_size] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [item_id] int not null FOREIGN KEY ([item_id]) REFERENCES [menu_item] ([id]),
  [size] int  not null FOREIGN KEY ([size]) REFERENCES [size]([id]),
  [price] float 
)
GO


CREATE TABLE [credit_debit] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [amount] float not null ,
  [type] int not null FOREIGN KEY ([type]) REFERENCES [credit_type] ([id]),
  [description] nvarchar(255) NOT NULL,
  [shift_id] int not null FOREIGN KEY ([shift_id]) REFERENCES [shift] ([id]),
  [client_id] int not null FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
)
GO

CREATE TABLE [supplier] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] nvarchar(255),
  [description] nvarchar(255),
  [contact_info_id] int FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id]),
  [client_id] int not null FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
)
GO



CREATE TABLE [statistics] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [date] date,
  [target_per_day] float ,
  [actual_balance_per_day] float ,
  [variance] float ,
  [variance_type] nvarchar(255),
  [client_id] int FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
)
GO
