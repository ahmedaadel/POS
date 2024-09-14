CREATE TABLE [customer] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [contact_info_id] int,
  [client_id] int
)
GO

CREATE TABLE [client] (
  [id] int PRIMARY KEY,
  [username] nvarchar(255),
  [password] nvarchar(255),
  [is_active] boolean,
  [industry_id] int,
  [email] nvarchar(255),
  [phone_number] nvarchar(255),
  [business_name] nvarchar(255)
)
GO

CREATE TABLE [order] (
  [id] int PRIMARY KEY,
  [subtotal_price] double,
  [tax_price] double,
  [total_price] double,
  [discount_price] double,
  [service_fee] double,
  [order_date] date,
  [shift_id] int,
  [order_status] nvarchar(255),
  [notes] nvarchar(255),
  [type] Varchar,
  [delivery_info_id] int,
  [is_delivery_order] boolean,
  [cashier_id] int,
  [client_id] int
)
GO

CREATE TABLE [items_per_order] (
  [order_id] int,
  [menu_item_id] int,
  [quantity] int,
  [subtotal_price] double,
  [discount_price] double
)
GO

CREATE TABLE [delivery_info] (
  [id] int PRIMARY KEY,
  [delivery_boy_id] int,
  [shipping_price] double,
  [notes] text,
  [customer_id] int
)
GO

CREATE TABLE [menu_item] (
  [id] int PRIMARY KEY,
  [category_id] int,
  [name] nvarchar(255),
  [is_available] boolean,
  [description] text,
  [client_id] int
)
GO

CREATE TABLE [item_size] (
  [id] int PRIMARY KEY,
  [item_id] int,
  [size] nvarchar(255),
  [price] double
)
GO

CREATE TABLE [shift] (
  [id] int PRIMARY KEY,
  [shift_date] date,
  [start_hour] time,
  [end_hour] time,
  [cashier_id] int,
  [balance] double,
  [client_id] int
)
GO

CREATE TABLE [credit_debit] (
  [id] int PRIMARY KEY,
  [amount] double,
  [type] nvarchar(255),
  [description] nvarchar(255) NOT NULL,
  [shift_id] int,
  [client_id] int
)
GO

CREATE TABLE [supplier] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [description] nvarchar(255),
  [contact_info_id] int,
  [client_id] int
)
GO

CREATE TABLE [cashier] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [contact_info_id] int,
  [client_id] int,
  [username] nvarchar(255),
  [password] nvarchar(255)
)
GO

CREATE TABLE [delivery_boy] (
  [id] int PRIMARY KEY,
  [name] varchar2,
  [contact_info_id] int,
  [client_id] int
)
GO

CREATE TABLE [contact_info] (
  [id] int PRIMARY KEY,
  [phone_number] nvarchar(255),
  [additional_number] nvarchar(255),
  [address] nvarchar(255)
)
GO

CREATE TABLE [category] (
  [id] int PRIMARY KEY,
  [name] varchar2,
  [description] varchar2,
  [parent_id] int,
  [client_id] int
)
GO

CREATE TABLE [industry] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [description] varchar2
)
GO

CREATE TABLE [statistics] (
  [id] int PRIMARY KEY,
  [date] date,
  [target_per_day] double,
  [actual_balance_per_day] double,
  [variance] double,
  [variance_type] nvarchar(255),
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
