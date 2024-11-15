
create database posdb

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
  [id] int PRIMARY KEY,
  [name] NVARCHAR(255),
  [contact_info_id] int,
  [client_id] int
)
GO

CREATE TABLE [client] (
  [id] int PRIMARY KEY,
  [username] NVARCHAR(255),
  [password] NVARCHAR(255),
  [is_active] BIT,
  [industry_id] int,
  [email] NVARCHAR(255),
  [phone_number] NVARCHAR(255),
  [business_name] NVARCHAR(255)
)
GO

CREATE TABLE [Additions] (
  [id] int PRIMARY KEY,
  [name] NVARCHAR(255),
  [price] BIT
)
GO

CREATE TABLE [order] (
  [id] int PRIMARY KEY,
  [subtotal_price] FLOAT,
  [tax_price] FLOAT,
  [total_price] FLOAT,
  [discount_price] FLOAT,
  [service_fee] FLOAT,
  [order_date] DATE,
  [shift_id] int,
  [order_status] int NOT NULL,
  [notes] NVARCHAR(255),
  [type] int NOT NULL,
  [delivery_info_id] int,
  [is_delivery_order] BIT,
  [cashier_id] int,
  [client_id] int,
  FOREIGN KEY ([order_status]) REFERENCES [order_status] ([id]),
  FOREIGN KEY ([type]) REFERENCES [order_type] ([id])
)
GO

CREATE TABLE [items_per_order] (
  [id] int PRIMARY KEY,
  [order_id] int,
  [menu_item_id] int,
  [quantity] int,
  [subtotal_price] FLOAT,
  [discount_price] FLOAT
)
GO

CREATE TABLE [item_add_ons] (
  [id] int PRIMARY KEY,
  [addition_id] int NOT NULL,
  [items_per_order_id] int NOT NULL,
  [additions_price] FLOAT,
  [quantity] int,
  FOREIGN KEY ([addition_id]) REFERENCES [Additions] ([id]),
  FOREIGN KEY ([items_per_order_id]) REFERENCES [items_per_order] ([id])
)
GO

CREATE TABLE [delivery_info] (
  [id] int PRIMARY KEY,
  [delivery_boy_id] int,
  [shipping_price] FLOAT,
  [notes] NVARCHAR(MAX),
  [customer_id] int
)
GO

CREATE TABLE [menu_item] (
  [id] int PRIMARY KEY,
  [category_id] int,
  [name] NVARCHAR(255),
  [is_available] BIT,
  [description] NVARCHAR(MAX),
  [client_id] int
)
GO

CREATE TABLE [item_size] (
  [id] int PRIMARY KEY,
  [item_id] int,
  [size] int NOT NULL,
  [price] FLOAT,
  FOREIGN KEY ([size]) REFERENCES [size] ([id])
)
GO

CREATE TABLE [shift] (
  [id] int PRIMARY KEY,
  [shift_date] DATE,
  [start_hour] TIME,
  [end_hour] TIME,
  [cashier_id] int,
  [balance] FLOAT,
  [client_id] int
)
GO

CREATE TABLE [credit_debit] (
  [id] int PRIMARY KEY,
  [amount] FLOAT,
  [type] int NOT NULL,
  [description] NVARCHAR(255) NOT NULL,
  [shift_id] int,
  [client_id] int,
  FOREIGN KEY ([type]) REFERENCES [credit_type] ([id])
)
GO

CREATE TABLE [supplier] (
  [id] int PRIMARY KEY,
  [name] NVARCHAR(255),
  [description] NVARCHAR(255),
  [contact_info_id] int,
  [client_id] int
)
GO

CREATE TABLE [cashier] (
  [id] int PRIMARY KEY,
  [name] NVARCHAR(255),
  [contact_info_id] int,
  [client_id] int,
  [username] NVARCHAR(255),
  [password] NVARCHAR(255)
)
GO

CREATE TABLE [delivery_boy] (
  [id] int PRIMARY KEY,
  [name] NVARCHAR(255),
  [contact_info_id] int,
  [client_id] int
)
GO

CREATE TABLE [contact_info] (
  [id] int PRIMARY KEY,
  [phone_number] NVARCHAR(255),
  [additional_number] NVARCHAR(255),
  [address] NVARCHAR(255)
)
GO

CREATE TABLE [category] (
  [id] int PRIMARY KEY,
  [name] NVARCHAR(255),
  [description] NVARCHAR(MAX),
  [parent_id] int,
  [client_id] int
)
GO

CREATE TABLE [industry] (
  [id] int PRIMARY KEY,
  [name] NVARCHAR(255),
  [description] NVARCHAR(MAX)
)
GO

CREATE TABLE [statistics] (
  [id] int PRIMARY KEY,
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

ALTER TABLE [customer] ADD FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id])
GO

ALTER TABLE [cashier] ADD FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id])
GO

ALTER TABLE [supplier] ADD FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id])
GO

ALTER TABLE [menu_item] ADD FOREIGN KEY ([category_id]) REFERENCES [category] ([id])
GO

ALTER TABLE [category] ADD FOREIGN KEY ([parent_id]) REFERENCES [category] ([id])
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

ALTER TABLE [shift] ADD FOREIGN KEY ([cashier_id]) REFERENCES [cashier] ([id])
GO

ALTER TABLE [credit_debit] ADD FOREIGN KEY ([shift_id]) REFERENCES [shift] ([id])
GO

ALTER TABLE [order] ADD FOREIGN KEY ([shift_id]) REFERENCES [shift] ([id])
GO

ALTER TABLE [items_per_order] ADD FOREIGN KEY ([order_id]) REFERENCES [order] ([id])
GO

ALTER TABLE [items_per_order] ADD FOREIGN KEY ([menu_item_id]) REFERENCES [menu_item] ([id])
GO

ALTER TABLE [item_size] ADD FOREIGN KEY ([item_id]) REFERENCES [menu_item] ([id])
GO

ALTER TABLE [customer] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [category] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [order] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [menu_item] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [supplier] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [shift] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [credit_debit] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [cashier] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [delivery_boy] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [statistics] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

-- Corrected references
ALTER TABLE [item_add_ons] ADD FOREIGN KEY ([addition_id]) REFERENCES [Additions] ([id])
GO

ALTER TABLE [item_add_ons] ADD FOREIGN KEY ([items_per_order_id]) REFERENCES [items_per_order] ([id])
GO
