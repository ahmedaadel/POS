use posdb;


-- Enumeration Section
CREATE TABLE [credit_type] (
  [id] int PRIMARY KEY IDENTITY(1,1), 
  [type] NVARCHAR(255) NOT NULL
)
GO

INSERT INTO [credit_type] ([type]) VALUES ('Addition'), ('Subtraction')
GO

CREATE TABLE [order_type] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [type] NVARCHAR(255) NOT NULL
)
GO

INSERT INTO [order_type] ([type]) VALUES ('Delivery'), ('Dine in'), ('Takeaway')
GO

CREATE TABLE [order_status] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [status] NVARCHAR(255) NOT NULL
)
GO

INSERT INTO [order_status] ([status]) VALUES ('Placed'), ('Canceled')
GO

CREATE TABLE [size] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [size] NVARCHAR(255) NOT NULL
)
GO

INSERT INTO [size] ([size]) VALUES ('Small'), ('Medium'), ('Large'), ('Single'), ('Double'), ('Triple')
GO

-- Constraints Section

CREATE TABLE [customer] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] NVARCHAR(255) not null,
  [contact_info_id] int,
  [client_id] int not null
)
GO

CREATE TABLE [client] (
  [id] int PRIMARY KEY IDENTITY(1,1) ,
  [username] NVARCHAR(255) unique not null,
  [password] NVARCHAR(255) not null,
  [is_active] BIT,
  [industry_id] int,
  [email] NVARCHAR(255),
  [phone_number] NVARCHAR(255),
  [business_name] NVARCHAR(255),
  CONSTRAINT chk_password_length CHECK (LEN(password) >= 8),
)
GO

CREATE TABLE [Addition] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] NVARCHAR(255) not null,
  [price] BIT,
  [client_id] int not null 
)
GO

CREATE TABLE [order] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [subtotal_price] FLOAT default 0, 
  [tax_price] FLOAT default 0,
  [total_price] FLOAT not null,
  [discount_price] FLOAT default 0,
  [service_fee] FLOAT default 0,
  [order_date] DATE DEFAULT GETDATE(),
  [shift_id] int not null,
  [order_status] int NOT NULL default 0,
  [notes] NVARCHAR(255),
  [type] int NOT NULL,
  [delivery_info_id] int,
  [is_delivery_order] BIT,
  [cashier_id] int not null,
  [client_id] int not null,
  FOREIGN KEY ([order_status]) REFERENCES [order_status] ([id]),
  FOREIGN KEY ([type]) REFERENCES [order_type] ([id])
)
GO

CREATE TABLE [items_per_order] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [order_id] int not null,
  [menu_item_id] int not null,
  [quantity] int  not null default 1 ,
  [subtotal_price] FLOAT  not null ,
  [discount_price] FLOAT default 0
)
GO

CREATE TABLE [item_add_ons] (
  [id] int PRIMARY KEY IDENTITY(1,1) ,
  [addition_id] int NOT NULL,
  [items_per_order_id] int NOT NULL,
  [additions_price] FLOAT not null ,
  [quantity] int not null ,
  FOREIGN KEY ([addition_id]) REFERENCES [Addition] ([id]),
  FOREIGN KEY ([items_per_order_id]) REFERENCES [items_per_order] ([id])
)
GO

CREATE TABLE [delivery_info] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [delivery_boy_id] int,
  [shipping_price] FLOAT not null,
  [notes] NVARCHAR(MAX),
  [customer_id] int not null
)
GO

CREATE TABLE [menu_item] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [category_id] int not null,
  [name] NVARCHAR(255) not null,
  [is_available] BIT default 1,
  [description] NVARCHAR(MAX),
  [client_id] int not null
)
GO

CREATE TABLE [item_size] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [item_id] int not null,
  [size] int NOT NULL,
  [price] FLOAT not null,
  FOREIGN KEY ([size]) REFERENCES [size] ([id])
)
GO

CREATE TABLE [shift] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [shift_date] DATE not null default  GETDATE() ,
  [start_hour] TIME not null,
  [end_hour] TIME not null,
  [cashier_id] int not null,
  [balance] FLOAT ,
  [client_id] int not null,
)
GO

CREATE TABLE [credit_debit] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [amount] FLOAT NOT NULL,
  [type] int NOT NULL,
  [description] NVARCHAR(255) NOT NULL,
  [shift_id] int NOT NULL,
  [client_id] int NOT NULL,
  FOREIGN KEY ([type]) REFERENCES [credit_type] ([id])
)
GO

CREATE TABLE [supplier] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] NVARCHAR(255) NOT NULL,
  [description] NVARCHAR(255),
  [contact_info_id] int,
  [client_id] int NOT NULL
)
GO

CREATE TABLE [cashier] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] NVARCHAR(255) NOT NULL,
  [contact_info_id] int,
  [client_id] int NOT NULL,
  [username] NVARCHAR(255) unique not null,
  [password] NVARCHAR(255) NOT NULL,
  CONSTRAINT chk_password_length2 CHECK (LEN(password) >= 8),
)
GO

CREATE TABLE [delivery_boy] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] NVARCHAR(255) NOT NULL,
  [contact_info_id] int,
  [client_id] int NOT NULL,
)
GO

CREATE TABLE [contact_info] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [phone_number] NVARCHAR(255),
  [additional_number] NVARCHAR(255),
  [address] NVARCHAR(255)
)
GO

CREATE TABLE [category] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] NVARCHAR(255) NOT NULL,
  [description] NVARCHAR(MAX),
  [parent_id] int,
  [client_id] int NOT NULL
)
GO

CREATE TABLE [industry] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] NVARCHAR(255) NOT NULL,
  [description] NVARCHAR(MAX)
)
GO

CREATE TABLE [statistics] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [date] DATE,
  [target_per_day] FLOAT,
  [actual_balance_per_day] FLOAT,
  [variance] FLOAT,
  [variance_type] NVARCHAR(255),
  [client_id] int
)
GO


ALTER TABLE [delivery_boy] ADD FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id])
GO
ALTER TABLE [delivery_boy] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [customer] ADD FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id])
GO
ALTER TABLE [customer] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [cashier] ADD FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id])
GO
ALTER TABLE [cashier] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [supplier] ADD FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id])
GO
ALTER TABLE [supplier] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [menu_item] ADD FOREIGN KEY ([category_id]) REFERENCES [category] ([id])
GO
ALTER TABLE [menu_item] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [category] ADD FOREIGN KEY ([parent_id]) REFERENCES [category] ([id])
GO
ALTER TABLE [category] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [client] ADD FOREIGN KEY ([industry_id]) REFERENCES [industry] ([id])
GO
ALTER TABLE [delivery_info] ADD FOREIGN KEY ([customer_id]) REFERENCES [customer] ([id])
GO
ALTER TABLE [delivery_info] ADD FOREIGN KEY ([delivery_boy_id]) REFERENCES [delivery_boy] ([id])
GO
ALTER TABLE [order] ADD FOREIGN KEY ([delivery_info_id]) REFERENCES [delivery_info] ([id])
GO
ALTER TABLE [order] ADD FOREIGN KEY ([cashier_id]) REFERENCES [cashier] ([id])
GO
ALTER TABLE [order] ADD FOREIGN KEY ([shift_id]) REFERENCES [shift] ([id])
GO
ALTER TABLE [order] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [shift] ADD FOREIGN KEY ([cashier_id]) REFERENCES [cashier] ([id])
GO
ALTER TABLE [shift] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [credit_debit] ADD FOREIGN KEY ([shift_id]) REFERENCES [shift] ([id])
GO

ALTER TABLE [credit_debit] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [items_per_order] ADD FOREIGN KEY ([order_id]) REFERENCES [order] ([id])
GO

ALTER TABLE [items_per_order] ADD FOREIGN KEY ([menu_item_id]) REFERENCES [menu_item] ([id])
GO

ALTER TABLE [item_size] ADD FOREIGN KEY ([item_id]) REFERENCES [menu_item] ([id])
GO




ALTER TABLE [Addition] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [statistics] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

-- Corrected references
ALTER TABLE [item_add_ons] ADD FOREIGN KEY ([addition_id]) REFERENCES [Addition] ([id])
GO

ALTER TABLE [item_add_ons] ADD FOREIGN KEY ([items_per_order_id]) REFERENCES [items_per_order] ([id])
GO
