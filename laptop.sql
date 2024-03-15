/*              create database laptop             */
USE laptop
CREATE TABLE Branch(
[id] nvarchar(255),    /*CN%*/
[address] nvarchar(255),
[name] nvarchar(255),
primary key(id),
)

/*nhân viên*/
CREATE TABLE [dbo].Employee(
	[id] nvarchar(255),             /*CN%E%*/
	[user] [nvarchar](max) NULL,
	[pass] [nvarchar](max) NULL,
	[isAdmin] [int] NULL,
	[sdt] [nvarchar](50) NULL,
	[diachi] [nvarchar](max) NULL,
	[ten] [nvarchar](50) NULL,
	[CN_id] [nvarchar](255) NULL,
	primary key(id),
)
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([CN_id])
REFERENCES [dbo].[Branch] ([id])
GO

/*khách hàng*/
CREATE TABLE [dbo].[Customer](
	[id] nvarchar(255) NOT NULL,     /*CN%C%*/
	[user] [nvarchar](max) NULL,
	[pass] [nvarchar](max) NULL,
	[isAdmin] [int] NULL,
	[sdt] [nvarchar](50) NULL,
	[diachi] [nvarchar](max) NULL,
	[ten] [nvarchar](50) NULL,
	primary key(id),
)
GO

/* category */
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[kind] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/*sản phẩm*/
CREATE TABLE [dbo].[Product](
	[id] nvarchar(255) NOT NULL,      /*CN%P%*/
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[soluong] [int] NULL,
	[cate_id] [int] NULL,
	[CN_id] [nvarchar](255) NULL,
	primary key(id),
) 
GO

ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cate_id])
REFERENCES [dbo].Category ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CN_id])
REFERENCES [dbo].Branch ([id])
GO

/*laptopdetail*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laptop_Details](
	[id] nvarchar(255) NOT NULL,           /*CN%LD%*/
	[pid] nvarchar(255) NOT NULL,
	[manhinh] [nvarchar](max) NULL,
	[cpu] [nvarchar](max) NULL,
	[ram] [nvarchar](max) NULL,
	[ocung] [nvarchar](max) NULL,
	[dohoa] [nvarchar](max) NULL,
	[khoiluong] [nvarchar](max) NULL,
	[kichthuoc] [nvarchar](max) NULL,
	primary key(id),
) 
GO
ALTER TABLE [dbo].[Laptop_Details]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
GO

/* oder */
CREATE TABLE [dbo].[Orders](
	[id] nvarchar(255) NOT NULL,   /*CN%O%*/
	[date] [date] NULL,
	[totalmoney] [int] NULL,
	[status] [int] NULL,
	[cid] nvarchar(255) NULL,
	[eid] nvarchar(255) NULL,
	primary key(id),
)
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([id])
GO

/* oderdetail */
CREATE TABLE [dbo].[Order_Details](
	[id] nvarchar(255) NOT NULL,      /*CN%OD%*/
	[price] [int] NULL,
	[quantity] [int] NULL,
	[order_id] nvarchar(255) NULL,
	[product_id] nvarchar(255) NULL,
	primary key(id),
) 
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO


/* add data */
INSERT INTO branch ([id], [address], [name]) VALUES ('CN1', N'3D, Tập thể dệt, Ao Sen, Mộ Lao, Hà Đông, Hà Nội', N'Hà Đông');
INSERT INTO branch ([id], [address], [name]) VALUES ('CN2', N'P. Duy Tân, Dịch Vọng, Cầu Giấy, Hà Nội, Việt Nam', N'Cầu Giấy');
INSERT INTO branch ([id], [address], [name]) VALUES ('CN3', N'2QHH+4G2, Phạm Hùng, Mỹ Đình, Từ Liêm, Hà Nội, Việt Nam', N'Từ Liêm');
INSERT INTO branch ([id], [address], [name]) VALUES ('CN4', N'1299 Giải Phóng, Hoàng Liệt, Hoàng Mai, Hà Nội 11000, Việt Nam', N'Hoàng Mai');

/*CN%E%*/
INSERT [dbo].[Employee] ([id], [user], [pass], [isAdmin], [sdt], [diachi], [ten], [CN_id]) VALUES ('CN1E01', N'admin', N'123', 2, N'0327243352', N'Thái Bình',N'admin_server_truong', N'CN1')
INSERT [dbo].[Employee] ([id], [user], [pass], [isAdmin], [sdt], [diachi], [ten], [CN_id]) VALUES ('CN2E01', N'CN2', N'123', 1, N'0327243352', N'Thái Bình',N'Tường', N'CN2')
INSERT [dbo].[Employee] ([id], [user], [pass], [isAdmin], [sdt], [diachi], [ten], [CN_id]) VALUES ('CN3E01', N'CN3', N'123', 1, N'0327243352', N'Thái Bình',N'Bảo', N'CN3')
INSERT [dbo].[Employee] ([id], [user], [pass], [isAdmin], [sdt], [diachi], [ten], [CN_id]) VALUES ('CN4E01', N'CN4', N'123', 1, N'0327243352', N'Thái Bình',N'Vũ', N'CN4')


/*CN%C%*/
INSERT [dbo].[Customer] ([id], [user], [pass], [isAdmin], [sdt], [diachi], [ten]) VALUES ('CN1C01', N'kh1', N'123', 0, N'03692952', N'Mỗ Lao - Hà Đông - Hà Nội', N'Nguyễn Văn Kiên')
INSERT [dbo].[Customer] ([id], [user], [pass], [isAdmin], [sdt], [diachi], [ten]) VALUES ('CN1C02', N'kh2', N'123', 0, N'03692952', N'Mỗ Lao - Hà Đông - Hà Nội', N'Nguyễn Văn Thắng')


INSERT [dbo].[Category] ([id], [name],[kind]) VALUES (1, N'Dell', 1)
INSERT [dbo].[Category] ([id], [name],[kind]) VALUES (2, N'Apple', 1)
INSERT [dbo].[Category] ([id], [name],[kind]) VALUES (3, N'Acer', 1)
INSERT [dbo].[Category] ([id], [name],[kind]) VALUES (4, N'Lenovo', 1)
INSERT [dbo].[Category] ([id], [name],[kind]) VALUES (5, N'Chuột', 2)
INSERT [dbo].[Category] ([id], [name],[kind]) VALUES (6, N'Bàn phím', 2)
INSERT [dbo].[Category] ([id], [name],[kind]) VALUES (7, N'Tai nghe', 2)



INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P01', 
N'Acer Nitro Gaming', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/12/15/637751569796016673_acer-nitro-gaming-an515-45-den-dd.jpg',
200.0000, 
N'laptop',
N'Acer TravelMate B3 được chế tác từ chất liệu nhựa cứng cáp, trọng lượng 1.4 kg và độ dày 20.99 mm, lúc cầm mình cảm thấy chiếc máy sẽ hơi nặng một xíu nhưng bù lại rất chắc tay, cứng cáp và không quá cồng kềnh.', 
10, 3, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P02', N'Acer TUF Gaming', N'https://laptopre.vn/upload/picture/picture-01635477879.jpg', 
200.0000, 
N'laptop', 
N'Acer TUF FX506 là chiếc laptop gaming nổi bật trong phân khúc tầm trung - tầm giá 20 triệu của hãng laptop Acer. Thiết đậm chất gaming, hiệu năng khỏe và tản mát đã giúp chiếc Acer TUF Gaming F15 trở thành laptop Asus core i5 đáng mua nhất hiện nay dành cho các game thủ.',
10, 3, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P03', 
N'Acer Zenbook Duo', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/9/21/637678404165582920_asus-zenbook-duo-ux482-xanh-dd.jpg', 
170.0000, 
N'laptop', 
N'ZenBook chính là dòng máy tính xách tay cao cấp nhà Acer, Acer ZenBook Duo UX481FL BM048T đương nhiên không nằm ngoài thực tế đó. Với các thành phần mạnh mẽ đi kèm và thiết lập 2 màn hình độc đáo hứa hẹn sẽ tận dụng đầy đủ sức mạnh sáng tạo của bạn khi làm việc.', 
10, 3, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P04', 
N'Laptop Acer Aspire',
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/11/18/637728596076020587_acer-aspire-gaming-a715-42g-r1sb-r5-5500u-den-dd.jpg', 
150.0000, 
N'laptop',
N'Acer Aspire 3 A315-57G-573F là sự lựa chọn giá rẻ cho những ai đang tìm kiếm một chiếc laptop sở hữu cấu hình thực sự tốt, trang bị card đồ họa rời và Windows 11 bản quyền mới nhất. Aspire 3 chắc chắn sẽ là người bạn đồng hành đáng tin cậy trong công việc của bạn.', 
10, 3, 'CN1')



/*DELL*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P05', 
N'Dell Gaming Alienware', 
N'https://bizweb.dktcdn.net/100/372/934/files/laptopnew-dell-alienware-m15-r6-gioi-thieu.jpg?v=1635329005492', 
130.0000, 
N'laptop', 
N'Dell Alienware là một trong những phân khúc laptop gaming cao cấp hiện nay của Dell. Được hoàn thiện bằng chất liệu cao cấp với sức mạnh nội tại siêu khủng, Dell Alienware đã và đang là cơn sốt của các game thủ chuyên nghiệp nói chung và các fan nhà Dell nói riêng.',
10, 1, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P06', 
N'Dell Inspiron N3510',
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/21/637704096245522041_dell-inspiron-n3510-black-dd.jpg', 
180.0000, 
N'laptop',
N'Dell Inspiron N3510 sở hữu bộ vi xử lý Intel Celeron N4020, con chip có 2 nhân 2 luồng, tốc độ 1.10 – 2.80 GHz, đủ khả năng để chạy tốt nhu cầu làm việc', 
10, 1, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P07', 
N'Laptop Dell XPS 13', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/3/22/637520284988683886_dell-xps-13-9310-bac-dd-evo.jpg', 
160.0000, 
N'laptop', 
N'Dell XPS 13 9315 (2022) được hãng sản xuất Dell nâng cấp toàn diện cả về thiết kế lẫn phần cứng bên trong biến nó trở thành phiên bản siêu mỏng nhẹ và tiết kiệm pin nhất trong số các dòng máy tính mà Dell từng tung ra thị trường. Đặc biệt thích hợp với những người dùng thường xuyên phải di chuyển hoặc làm việc từ xa. Hãy cùng Laptop 365 đi tìm hiểu qua về mẫu máy này nhé.',
10, 1, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P08', 
N'Laptop Dell Gaming G15', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/12/2/637740490696341842_dell-gaming-g15-5511-xam-dd.jpg', 
165.0000, 
N'laptop', 
N'Dell G15 thiết kế và tản nhiệt như Alienware. Chiến max setting game nặng, đồ họa 3D mượt. Trả góp ls thấp. Siêu bền yên tâm sử dụng lâu dài, ổn định. Quà lớn.', 
10, 1, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P09', N'Laptop Dell Gaming G15 5511', N'https://cdn.tgdd.vn/Products/Images/44/264354/Slider/vi-vn-dell-gaming-g15-5511-i5-70266676-11.jpg',
160.0000, 
N'laptop', 
N'Không những mang đến cho người dùng hiệu năng ấn tượng nhờ con chip Intel thế hệ 11 tân tiến, laptop Dell Gaming G15 5511 i5 11400H (70266676) còn sở hữu thiết kế thời thượng, lôi cuốn, hứa hẹn sẽ là người cộng sự lý tưởng cùng bạn chinh phục mọi chiến trường.
Thu hút mọi ánh nhìn cùng vẻ ngoài nổi bật Đến với chiếc laptop, ngôn ngữ thiết kế đã được thay đổi so với các phiên bản tiền nhiệm, hầm hố hơn, các đường nét cắt xẻ tăng thêm phần gaming cho chiếc máy. Lớp vỏ nhựa màu xám bao bọc bên ngoài chiếc laptop Dell Gaming này mang đến sự bền bỉ hoàn mỹ cùng trọng lượng 2.81 kg và dày 25 mm, với mình đây là một con số vừa đủ để có thể mang theo bên người, phục vụ cho nhu cầu làm việc cũng như giải trí cho bản thân. ', 
10, 1, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P10', N'Laptop Dell Gaming Alienware m15 R6', 
N'https://cdn.tgdd.vn/Products/Images/44/271090/Slider/dell-gaming-alienware-m15-r6-i7-70272633-fix-01-1020x570.jpg', 
160.0000, 
N'laptop', 
N'• Laptop Dell Gaming Alienware sở hữu CPU Intel Core i7 Tiger Lake 11800H mang lại hiệu năng xử lý vượt trội. Cùng bạn thoả sức sáng tạo hình ảnh, video với card tích hợp NVIDIA GeForce RTX 3070 8 GB hay giải trí với các tựa game hấp dẫn như CS:GO, GTAV,...

• Bộ nhớ RAM 32 GB cho khả năng đa nhiệm cực mượt mà, ổ cứng SSD 1 TB cho bạn thoải mái lưu trữ dữ liệu với khả năng truy xuất, khởi động máy cực nhanh.

• Laptop Dell sở hữu ngoại hình độc đáo mang lại độ nhận diện cao với chiếc logo nổi bật trên lớp vỏ nhựa bền chắc, trọng lượng 2.69 kg luôn trong tư thế sẵn sàng chiến đấu bất cứ khi nào bạn cần.

• Màn hình 15.6 inch có độ sáng lên đến 400 nits và 99% DCI-P3 cho hình ảnh hiển thị sống động, rực rỡ với độ tương phản cao.

• Công nghệ WVA mang đến cho màn hình laptop góc nhìn rộng lên đến 178 độ, tần số quét 240 Hz cho độ trễ cực thấp, mang lại trải nghiệm hình ảnh siêu mượt mà, không bị giật, xé khi chiến những trận game đỉnh cao.

• Đèn bàn phím chuyển màu RGB độc đáo hỗ trợ bạn gõ tốt, chiến game trong mọi điều kiện sáng.

• Trang bị các cổng kết nối tiện lợi như USB 3.2, HDMI, LAN (RJ45), USB Type-C.

• Công nghệ High Definition (HD) với tính năng khuếch đại âm thanh cùng Audio Nahimic Audio giả lập hệ thống âm vòm 3D sống động, lọc và khử tiếng ồn hiệu quả.',
10, 1, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P11', N'Laptop Dell Gaming G15 5515 R7',
N'https://cdn.tgdd.vn/Products/Images/44/269650/Slider/vi-vn-dell-gaming-g15-5515-r7-70266674-6.jpg', 
190.0000, 
N'laptop', 
N'• Laptop đồ họa - kỹ thuật sở hữu bộ vi xử lý AMD Ryzen 7 5800H​ cùng card đồ họa rời NVIDIA GeForce RTX 3050 4 GB, đáp ứng mạnh mẽ quá trình xử lý các tác vụ văn phòng hay chiến những trận game đầy kịch tính.

• Màn hình viền mỏng 15.6 inch ở laptop Dell được trang bị các công nghệ hiện đại như công nghệ WVA, Anti Glare, LED Backlit hỗ trợ chóng chói, tiết kiệm điện, mang đến khung hình rộng mở.

• Tần số quét 120 Hz mang đến cho bạn những chuyển động mượt mà. Hạn chế tình trạng giật, xé hình.

• Laptop Dell Gaming với trọng lượng 2.81 kg và dày 25 mm, cùng bàn phím có đèn nền đơn sắc dễ dàng cùng bạn chiến game ở mọi không gian một cách thuận lợi nhất.

• Chiếc laptop này còn được trang bị các cổng kết nối phổ biến như USB 3.2, 2 cổng USB 2.0, HDMI và USB Type-C hỗ trợ quá trình truyền xuất dữ liệu dễ dàng.

• RAM 8 GB xử lý đa nhiệm mượt mà mọi tác vụ cùng ổ cứng SSD 512 GB cho khả năng lưu trữ đủ dùng, truy xuất dữ liệu nhanh chóng.

• Hệ điều hành Windows 11 Home SL + Office Home & Student 2021 vĩnh viễn được cài đặt sẵn trên máy giúp bạn tối ưu nhu cầu sử dụng.

• Sự kết hợp giữa High Definition (HD) Audio và Realtek Nahimic 3D Audio mang đến chất âm vòm, tăng cường âm Bass cùng tính năng khuếch đại cho bạn đắm chìm trong thế giới đầy thư giãn.', 
10, 1, 'CN1')



/*LENOVO*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P12', 
N'Lenovo 100e Gen 2', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/11/30/637738603461090929_lenovo-100e-gen-2-n4020-win-10-pro-dd.jpg',
140.0000, 
N'laptop',
N'Lenovo 100e Gen 2 là chiếc laptop nhỏ gọn, bền bỉ, mức giá rất rẻ, được xây dựng phù hợp cho hoạt động học tập online của các em học sinh.', 
10, 4, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P13', 
N'Lenovo Ideapad Slim 3', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/4/21/637861584460182816_lenovo-ideapad-3-14itl6-vang-dd-1.jpg', 
180.0000, 
N'laptop', 
N'Lenovo IdeaPad Slim 3 15ITL6 là mẫu laptop 15,6 inch được thiết kế siêu mỏng nhẹ, phiên bản màu vàng độc đáo và có hiệu năng ấn tượng nhờ bộ vi xử lý Intel thế hệ thứ 11 mới nhất.',
10, 4, 'CN1')




/*MAC*/

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P14', N'MacBook Pro 16', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/20/637703174146015116_macbook-pro-16-2021-xam-dd.jpg', 
150.0000, 
N'laptop', 
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 16 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P15', N'MacBook Pro 13', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2020/11/13/637408530311831907_mbp-2020-m1-gray-dd-1.png', 
120.0000, 
N'laptop', 
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 13 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN1')
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P16', 
N'MacBook Pro 14', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/20/637703173013037856_macbook-pro-14-2021-xam-dd.jpg', 
150.0000,
N'laptop',
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 14 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN1')




/*tainghe*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P17', 
N'Tai nghe HyperX Cloud Stinger', 
N'https://images.fpt.shop/unsafe/fit-in/200x200/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2021/11/10/637721638521972942_anhdaidien-00779689.jpg', 
200.0000,
N'tai nghe',
N'Với mức giá rất đáng cân nhắc khi đong đếm về chất lượng/giá cả so với các dòng tai nghe khác, HyperX Cloud Stinger chắc chắn sẽ là một trong những tai nghe gaming nổi bật trong phân khúc Mid-end.', 
10, 7, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P18', 
N' tai có mic JBL QUANTUM50BLKAS', 
N'https://images.fpt.shop/unsafe/fit-in/200x200/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2021/10/29/637711178012905930_55687_tai_nghe_gaming_jbl_quantum_50_trang_0002_3.jpg', 
200.0000,
N'tai nghe',
N'Được đảm bảo bởi thương hiệu sản xuất thiết bị âm thanh lừng danh trên thị trường - JBL, mẫu tai nghe Quantum 50 ghi điểm nhờ thiết kế đầy vẻ năng động trẻ trung, đồng thời sở hữu chất âm ấn tượng với driver 8.6mm. Sự hỗ trợ của sản phẩm sẽ giúp cho mọi tác vụ từ giải trí đến học tập và làm việc trở nên trọn vẹn hơn nhiều.', 
10, 7, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P19', 
N'Tai nghe chụp tai Sennheiser HD206',
N'https://fptshop.com.vn/Uploads/Thumbs/2021/11/25/637734458601378209_3.jpg', 
669.0000, 
N'tainghe', 
N'Sennheiser HD 206 có thiết kế kiểu tai nghe closed back với các miếng đệm lót tai đặt bên trong chụp tai. Nhờ đó, trải nghiệm nghe sẽ luôn đạt được chất lượng cao và trọn vẹn nhất. Bên cạnh đó, chiếc tai nghe này còn có trọng lượng nhẹ, đặc biệt phù hợp cho những ai đang làm công việc tại phòng thu hoặc DJ.', 
10, 7, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P20', 
N'Tai nghe HyperX Cloud Stinger', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/11/10/637721639158716568_anhdaidien-00779689-2.jpg', 
1290.0000,
N'tainghe', 
N'HyperX Cloud Stinger được trang bị màng loa định hướng rộng 50mm, song song với tai nghe nhằm định vị âm thanh trực tiếp tới tai giúp mang lại chất lượng âm thanh đẳng cấp cho các game thủ',
10, 7, 'CN1')



/*chuột*/

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P21', 
N'Chuột không dây Logitech M221', 
N'https://images.fpt.shop/unsafe/fit-in/214x214/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2020/11/25/637418984502900576_M221.jpg', 
100.0000, 
N'chuot', 
N'Nhằm để giảm thiểu những sự phiền toái và giới hạn khoảng cách do chuột máy tính có dây thì chuột không dây Logitech M221 được ra đời. Với công nghệ không dây 2.4GHz, chuột Logitech M221 cho phép người dùng kết nối xa lên đến 10m.', 
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P22', 
N'Chuột có dây Rapoo N200 ', 
N'https://images.fpt.shop/unsafe/fit-in/214x214/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2018/11/7/636772096317963039_chuot-co-day-rapoo-n200-1o.png', 
120.0000,
N'chuot',
N'Chuột Có Dây Rapoo N200 thiết kế đơn giản, cân đối 2 bên, phù hợp cho cả người thuận tay trái và tay phải.', 
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P23', N'Chuột không dây Logitech M221', 
N'https://fptshop.com.vn/Uploads/Thumbs/2016/12/1/636161960541846703_HAPK-CHUOT-KHONG-DAY-LOGITECH-M221-3.JPG', 
319.0000,
N'chuot', 
N'Chuột Logitech M221với công nghệ không dây 2.4GHz cho phép người dùng kết nối xa lên đến 10m.', 
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P24', 
N'Chuột Gaming không dây Logitech G304', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/10/26/637393197109518808_G304-4.jpg', 
890.0000, 
N'chuot', 
N'Chuột không dây logitech G304 sở hữu thiết kế đột phá, cảm biến HERO 12.000 mức DPI, hệ thống 6 nút lập trình để tùy chỉnh tính năng và công nghệ tương tác không dây vượt trội LIGHTSPEED.', 
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P25', 
N'Chuột Gaming Logitech G102 Gen2', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/9/28/637369016836148422_G102%20Gen2-4.jpg', 
590.0000, 
N'chuot', 
N'Logitech G102 Gen 2 có tạo hình hết sức cổ điển với kiểu dáng đối xứng truyền thống. Công nghệ đèn LED RGB tạo điểm nhấn. Sự tinh tế của Logitech được thể hiện qua hệ thống 6 nút tiện lợi, cho phép bạn kích hoạt nhanh các tính năng được thiết lập ở các vị trí dễ nhấn khi cầm nắm.', 
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P26', 
N'Chuột không dây Xiaomi Mi Dual',
N'https://fptshop.com.vn/Uploads/Thumbs/2021/10/9/637693741650549361_00775587-1.jpg', 
350.0000,
N'chuot', 
N'Chuột không dây Mi Dual Mode Wireless hoạt động êm ái, không ồn ào, được thiết kế với màu trắng thanh lịch và vận hành mượt mà nhờ độ phân giải đạt mức 1.300 DPI, có hai chế độ kết nối, có nút bên hông, thiết kế gọn nhẹ.', 
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P27',
N'Chuột Gaming Logitech G502 Hero High Performance', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/10/26/637393203689499588_G502-2.jpg', 
1759.0000, 
N'chuot',
N'Chuột G502 HERO High Performance được Logitech trang bị cảm biến HERO 25K – cảm biến gaming có độ chính xác cao bậc nhất thế giới hiện nay. Công nghệ ánh sáng LIGHTSYNC RGB. Bộ quang phổ 16,8 triệu màu sẽ đem lại hiệu ứng ánh sáng sống động nhất trên G502 HERO High Performance.', 
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P28',
N'Chuột Gaming MSI Clutch GM20 Elite', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/24/637759609885464213_CHUOT-4.jpg', 
756.0000, 
N'Chuot', 
N'Chuột chơi game MSI Clutch GM20 Elite nổi bật ở thiết kế đậm chất gaming và hệ thống đèn LED RGB đa sắc màu. Ngoài ra, sản phẩm còn có tốc độ phản hồi siêu nhanh, chất lượng xây dựng bền bỉ và trọng lượng có thể điều chỉnh', 
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P29', 
N'Chuột gaming Corsair Iron claw RGB', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/9/13/637671646464389567_00772807-chuot-corsair-iron-claw-rgb-1.jpg', 
1600.0000, 
N'chuot', 
N'Corsair sử dụng cảm biến PMW3391 với mức mức CPI cao nhất lên tới 18.000 và mức IPS lên tới 450. Ngoài ra Corsair Iron claw RGB sử dụng switch Omron với độ bền 50 triệu lần nhấn, đảm bảo tuổi thọ của chuột sẽ vô cùng bền bỉ.', 
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P30',
N'Chuột không dây Logitech MX Master 3', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/9/24/637680744725377286_mxmaster3.jpg', 
2490.0000, 
N'chuot', 
N'Chuột không dây Logitech MX Master 3 được thiết kế với kiểu dáng hỗ trợ cử động cổ tay và bàn tay thoải mái nhất, có thể vận hành mượt mà trên nhiều bề mặt nhờ độ phân giải cảm biến lên tới 4000 DPI và hỗ trợ công nghệ Logitech Flow giúp duy trì tương tác với ba máy tính hoặc laptop riêng biệt.', 
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P31', 
N'Chuột Bluetooth Microsoft Modern', 
N'https://fptshop.com.vn/Uploads/Thumbs/2019/12/9/637114960259233430_Microsoft%20Modern%20(3).jpg', 
900.0000, 
N'chuot', 
N'Chuột Microsoft Modern có khả năng kết nối bluetooth với cùng lúc 3 thiết bị đầu ra, có trọng lượng nhẹ nhàng chỉ 190 gram với kích thước tổng thể là 14 x 13 x 6 cm, thời lượng pin lên đến 1 năm.', 
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P32', 
N'Chuột Bluetooth Microsoft Modern', 
N'https://fptshop.com.vn/Uploads/Thumbs/2019/12/9/637114960259233430_Microsoft%20Modern%20(3).jpg', 
900.0000, 
N'chuot', 
N'Chuột Microsoft Modern có khả năng kết nối bluetooth với cùng lúc 3 thiết bị đầu ra, có trọng lượng nhẹ nhàng chỉ 190 gram với kích thước tổng thể là 14 x 13 x 6 cm, thời lượng pin lên đến 1 năm.',
10, 5, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P33', N'chuột máy tính có dây LOGITECH G102 RBG',
N'https://vn-live-05.slatic.net/p/cc33cd4c00c5cf83df2960c9e9d0457b.jpg_525x525q80.jpg', 
215.0000,
N'chuot', 
N'Chuột gaming logitech G102 có hiệu suất cao. Nhanh hơn tới 8 lần: Giao tiếp ở mức lên tới 1000 báo cáo mỗi giây - hay nhanh hơn gấp 8 lần so với chuột tiêu chuẩn.', 
10, 5, 'CN1')




/*Bàn phím*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P34',
N'Bàn phím Prolink PKCM-2007', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/7/16/637620335967558201_PKCM-2007%20-%201.jpeg', 
200.0000, 
N'banphim', 
N'Với thiết kế full size và kiểu dáng chống tràn khi gõ, bàn phím Prolink PKCM-2007 là công cụ đắc lực cho những người làm việc văn phòng, thiết kế bàn phím PKCM-2007 nghiêng nhẹ dưới đáy, tạo nên tư thế gõ thuận lợi cho cả hai tay giúp soạn thảo văn bản dễ dàng hơn.', 
10, 6, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P35', 
N'Bàn phím giả cơ có dây Zadez G-850K', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/9/637746607810605486_1.jpg',
350.0000, 
N'banphim', 
N'Bàn phím có dây Gaming Zadez G-850K được làm từ chất liệu nhựa ABS cao cấp, phím khắc Laser,  full 104 phím, 11 phím đa phương tiện. Hỗ trợ 19 phím nhấn cùng lúc (N-Key Rollover), có đèn LED RGB nhiều màu sắc.', 
10, 6, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P36', 
N'Bàn phím giả cơ có dây MSI Vigor GK20 US', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/24/637759602815516534_BAN-PHIM-2.jpg', 
700.0000,
N'banphim', 
N'Bàn phím Gaming MSI Vigor GK20 hiệu ứng đèn nền tuyệt đẹp và thiết kế công thái học cũng như kháng nước.
', 10, 6, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P37', 
N'Bàn phím cơ có dây DARE-U EK1280 Black Brown', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/9/637746599017266731_2.jpg', 
999.0000, 
N'banphim', 
N'Bàn phím cơ Dareu EK1280 RGB được thiết kế với hệ thống đèn LED RGB đặc sắc, sống động, hỗ trợ 16,8 triệu màu sắc mang đến cho game thủ màn trình diễn ánh sáng ấn tượng, tạo phong cách cá tính cho góc gaming.
', 10, 6, 'CN1')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN1P38', 
N'Bàn phím cơ không dây Zadez GT-015DK',
N'https://fptshop.com.vn/Uploads/Thumbs/2022/4/18/637858933452880200_HASP-Zadek-GT-015DK-1.png', 
1490.0000, 
N'banphim', 
N'Bàn phím cơ Gaming không dây ZADEZ Blue Switch GT-015DK sở hữu một kiểu dáng thiết kế ấn tượng, mang lối cách điệu của các đường nét nằm tại cạnh bên và mặt trên. Ngoài ra, các phím được in rõ ràng tạo nên độ sắc nét, đồng thời với chất liệu cao cấp cùng lớp phủ bằng nhựa PVC giúp bàn phím ZADEZ Blue Switch GT-015DK có được độ chắc chắn đáng kinh ngạc.
', 10, 6, 'CN1')



/**LAPTOP DETAIL*/  /*CN%LD%*/

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD01', 
'CN1P01', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-glare LED-backlit', 
N'AMD, Ryzen 5, 5500U',
N'8 GB, DDR4, 3200 MHz', 
N'SSD 512 GB', 
N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics',
N'2.2 kg', 
N'363.4 x 255 x 23.9 mm')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD02', 
'CN1P02', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-glare LED-backlit', 
N'AMD, Ryzen 5, 5500U',
N'8 GB, DDR4, 3200 MHz',
N'SSD 512 GB', 
N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics',
N'2.2 kg', 
N'363.4 x 255 x 23.9 mm')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD03', 
'CN1P03', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Acer ComfyView Anti-glare LED-backlit
', N'AMD, Ryzen 5, 5500U
', N'8 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics
', N'2.1 kg
', N'363.4 x 254.5 x 22.9 mm')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD04', 
'CN1P04', 
N'14.0 inch, 1920 x 1080 Pixels, TN, 250 nits, Anti-glare LED-backlit
', N'Intel, Core i3, 1115G4
', N'8 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'1.41 kg
', N'324.2 x 215.6 x 19.89 ~ 19.90 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD05', 
'CN1P05', 
N'15.6 inch, 2560 x 1440 Pixels, WVA, 240 Hz, 400 nits, Wide-Viewing Angle (WVA)
', N'Intel, Core i7, 11800H
', N'NULL32 GB (2 thanh 16 GB), DDR4, 3200 MHz
', N'SSD 1 TB
', N'NVIDIA GeForce RTX 3070 8GB; Intel UHD Graphics
', N'2.7 kg', N'356 x 272 x 19 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD06', 
'CN1P06', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD07', 
'CN1P07', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD08', 
'CN1P08', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD09', 
'CN1P09', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD10', 
'CN1P10', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD11', 
'CN1P11',  
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD12', 
'CN1P12', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD13', 
'CN1P13', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD14', 
'CN1P14', 
N'14.2 inch, 3024 x 1964 Pixels

', N'Apple, M1 Pro

', N'32 GB

', N'SSD 512 GB

', N'Apple M1

', N'1.604 kg
', N'324.2 x 215.6 x 19.89 ~ 19.90 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD15', 
'CN1P15', 
N'13.3 inch, 2560 x 1600 Pixels, IPS, IPS LCD LED Backlit, True Tone
', N'Apple, M1
', N'16 GB, LPDDR4
', N'SSD 512 GB
', N'Apple M1 GPU 8 nhân
', N'1.4 kg
', N'304.1 x 212.4 x 15.6 mm
')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN1LD16', 
'CN1P16', 
N'16.2 inch, 3456 x 2234 Pixels
', N'Apple, M1 Pro
', N'32 GB
', N'SSD 512 GB
', N'Apple M1
', N'2.129 kg
', N'15.6 x 358.5 x 235 mm
')









/* CHINHANH 2 */

 /*CN%P%*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P01', 
N'Acer Nitro Gaming', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/12/15/637751569796016673_acer-nitro-gaming-an515-45-den-dd.jpg',
200.0000, 
N'laptop',
N'Acer TravelMate B3 được chế tác từ chất liệu nhựa cứng cáp, trọng lượng 1.4 kg và độ dày 20.99 mm, lúc cầm mình cảm thấy chiếc máy sẽ hơi nặng một xíu nhưng bù lại rất chắc tay, cứng cáp và không quá cồng kềnh.', 
10, 3, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P02', N'Acer TUF Gaming', N'https://laptopre.vn/upload/picture/picture-01635477879.jpg', 
200.0000, 
N'laptop', 
N'Acer TUF FX506 là chiếc laptop gaming nổi bật trong phân khúc tầm trung - tầm giá 20 triệu của hãng laptop Acer. Thiết đậm chất gaming, hiệu năng khỏe và tản mát đã giúp chiếc Acer TUF Gaming F15 trở thành laptop Asus core i5 đáng mua nhất hiện nay dành cho các game thủ.',
10, 3, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P03', 
N'Acer Zenbook Duo', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/9/21/637678404165582920_asus-zenbook-duo-ux482-xanh-dd.jpg', 
170.0000, 
N'laptop', 
N'ZenBook chính là dòng máy tính xách tay cao cấp nhà Acer, Acer ZenBook Duo UX481FL BM048T đương nhiên không nằm ngoài thực tế đó. Với các thành phần mạnh mẽ đi kèm và thiết lập 2 màn hình độc đáo hứa hẹn sẽ tận dụng đầy đủ sức mạnh sáng tạo của bạn khi làm việc.', 
10, 3, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P04', 
N'Laptop Acer Aspire',
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/11/18/637728596076020587_acer-aspire-gaming-a715-42g-r1sb-r5-5500u-den-dd.jpg', 
150.0000, 
N'laptop',
N'Acer Aspire 3 A315-57G-573F là sự lựa chọn giá rẻ cho những ai đang tìm kiếm một chiếc laptop sở hữu cấu hình thực sự tốt, trang bị card đồ họa rời và Windows 11 bản quyền mới nhất. Aspire 3 chắc chắn sẽ là người bạn đồng hành đáng tin cậy trong công việc của bạn.', 
10, 3, 'CN2')



/*DELL*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P05', 
N'Dell Gaming Alienware', 
N'https://bizweb.dktcdn.net/100/372/934/files/laptopnew-dell-alienware-m15-r6-gioi-thieu.jpg?v=1635329005492', 
130.0000, 
N'laptop', 
N'Dell Alienware là một trong những phân khúc laptop gaming cao cấp hiện nay của Dell. Được hoàn thiện bằng chất liệu cao cấp với sức mạnh nội tại siêu khủng, Dell Alienware đã và đang là cơn sốt của các game thủ chuyên nghiệp nói chung và các fan nhà Dell nói riêng.',
10, 1, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P06', 
N'Dell Inspiron N3510',
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/21/637704096245522041_dell-inspiron-n3510-black-dd.jpg', 
180.0000, 
N'laptop',
N'Dell Inspiron N3510 sở hữu bộ vi xử lý Intel Celeron N4020, con chip có 2 nhân 2 luồng, tốc độ 1.10 – 2.80 GHz, đủ khả năng để chạy tốt nhu cầu làm việc', 
10, 1, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P07', 
N'Laptop Dell XPS 13', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/3/22/637520284988683886_dell-xps-13-9310-bac-dd-evo.jpg', 
160.0000, 
N'laptop', 
N'Dell XPS 13 9315 (2022) được hãng sản xuất Dell nâng cấp toàn diện cả về thiết kế lẫn phần cứng bên trong biến nó trở thành phiên bản siêu mỏng nhẹ và tiết kiệm pin nhất trong số các dòng máy tính mà Dell từng tung ra thị trường. Đặc biệt thích hợp với những người dùng thường xuyên phải di chuyển hoặc làm việc từ xa. Hãy cùng Laptop 365 đi tìm hiểu qua về mẫu máy này nhé.',
10, 1, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P08', 
N'Laptop Dell Gaming G15', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/12/2/637740490696341842_dell-gaming-g15-5511-xam-dd.jpg', 
165.0000, 
N'laptop', 
N'Dell G15 thiết kế và tản nhiệt như Alienware. Chiến max setting game nặng, đồ họa 3D mượt. Trả góp ls thấp. Siêu bền yên tâm sử dụng lâu dài, ổn định. Quà lớn.', 
10, 1, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P09', N'Laptop Dell Gaming G15 5511', N'https://cdn.tgdd.vn/Products/Images/44/264354/Slider/vi-vn-dell-gaming-g15-5511-i5-70266676-11.jpg',
160.0000, 
N'laptop', 
N'Không những mang đến cho người dùng hiệu năng ấn tượng nhờ con chip Intel thế hệ 11 tân tiến, laptop Dell Gaming G15 5511 i5 11400H (70266676) còn sở hữu thiết kế thời thượng, lôi cuốn, hứa hẹn sẽ là người cộng sự lý tưởng cùng bạn chinh phục mọi chiến trường.
Thu hút mọi ánh nhìn cùng vẻ ngoài nổi bật Đến với chiếc laptop, ngôn ngữ thiết kế đã được thay đổi so với các phiên bản tiền nhiệm, hầm hố hơn, các đường nét cắt xẻ tăng thêm phần gaming cho chiếc máy. Lớp vỏ nhựa màu xám bao bọc bên ngoài chiếc laptop Dell Gaming này mang đến sự bền bỉ hoàn mỹ cùng trọng lượng 2.81 kg và dày 25 mm, với mình đây là một con số vừa đủ để có thể mang theo bên người, phục vụ cho nhu cầu làm việc cũng như giải trí cho bản thân. ', 
10, 1, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P10', N'Laptop Dell Gaming Alienware m15 R6', 
N'https://cdn.tgdd.vn/Products/Images/44/271090/Slider/dell-gaming-alienware-m15-r6-i7-70272633-fix-01-1020x570.jpg', 
160.0000, 
N'laptop', 
N'• Laptop Dell Gaming Alienware sở hữu CPU Intel Core i7 Tiger Lake 11800H mang lại hiệu năng xử lý vượt trội. Cùng bạn thoả sức sáng tạo hình ảnh, video với card tích hợp NVIDIA GeForce RTX 3070 8 GB hay giải trí với các tựa game hấp dẫn như CS:GO, GTAV,...

• Bộ nhớ RAM 32 GB cho khả năng đa nhiệm cực mượt mà, ổ cứng SSD 1 TB cho bạn thoải mái lưu trữ dữ liệu với khả năng truy xuất, khởi động máy cực nhanh.

• Laptop Dell sở hữu ngoại hình độc đáo mang lại độ nhận diện cao với chiếc logo nổi bật trên lớp vỏ nhựa bền chắc, trọng lượng 2.69 kg luôn trong tư thế sẵn sàng chiến đấu bất cứ khi nào bạn cần.

• Màn hình 15.6 inch có độ sáng lên đến 400 nits và 99% DCI-P3 cho hình ảnh hiển thị sống động, rực rỡ với độ tương phản cao.

• Công nghệ WVA mang đến cho màn hình laptop góc nhìn rộng lên đến 178 độ, tần số quét 240 Hz cho độ trễ cực thấp, mang lại trải nghiệm hình ảnh siêu mượt mà, không bị giật, xé khi chiến những trận game đỉnh cao.

• Đèn bàn phím chuyển màu RGB độc đáo hỗ trợ bạn gõ tốt, chiến game trong mọi điều kiện sáng.

• Trang bị các cổng kết nối tiện lợi như USB 3.2, HDMI, LAN (RJ45), USB Type-C.

• Công nghệ High Definition (HD) với tính năng khuếch đại âm thanh cùng Audio Nahimic Audio giả lập hệ thống âm vòm 3D sống động, lọc và khử tiếng ồn hiệu quả.',
10, 1, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P11', N'Laptop Dell Gaming G15 5515 R7',
N'https://cdn.tgdd.vn/Products/Images/44/269650/Slider/vi-vn-dell-gaming-g15-5515-r7-70266674-6.jpg', 
190.0000, 
N'laptop', 
N'• Laptop đồ họa - kỹ thuật sở hữu bộ vi xử lý AMD Ryzen 7 5800H​ cùng card đồ họa rời NVIDIA GeForce RTX 3050 4 GB, đáp ứng mạnh mẽ quá trình xử lý các tác vụ văn phòng hay chiến những trận game đầy kịch tính.

• Màn hình viền mỏng 15.6 inch ở laptop Dell được trang bị các công nghệ hiện đại như công nghệ WVA, Anti Glare, LED Backlit hỗ trợ chóng chói, tiết kiệm điện, mang đến khung hình rộng mở.

• Tần số quét 120 Hz mang đến cho bạn những chuyển động mượt mà. Hạn chế tình trạng giật, xé hình.

• Laptop Dell Gaming với trọng lượng 2.81 kg và dày 25 mm, cùng bàn phím có đèn nền đơn sắc dễ dàng cùng bạn chiến game ở mọi không gian một cách thuận lợi nhất.

• Chiếc laptop này còn được trang bị các cổng kết nối phổ biến như USB 3.2, 2 cổng USB 2.0, HDMI và USB Type-C hỗ trợ quá trình truyền xuất dữ liệu dễ dàng.

• RAM 8 GB xử lý đa nhiệm mượt mà mọi tác vụ cùng ổ cứng SSD 512 GB cho khả năng lưu trữ đủ dùng, truy xuất dữ liệu nhanh chóng.

• Hệ điều hành Windows 11 Home SL + Office Home & Student 2021 vĩnh viễn được cài đặt sẵn trên máy giúp bạn tối ưu nhu cầu sử dụng.

• Sự kết hợp giữa High Definition (HD) Audio và Realtek Nahimic 3D Audio mang đến chất âm vòm, tăng cường âm Bass cùng tính năng khuếch đại cho bạn đắm chìm trong thế giới đầy thư giãn.', 
10, 1, 'CN2')



/*LENOVO*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P12', 
N'Lenovo 100e Gen 2', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/11/30/637738603461090929_lenovo-100e-gen-2-n4020-win-10-pro-dd.jpg',
140.0000, 
N'laptop',
N'Lenovo 100e Gen 2 là chiếc laptop nhỏ gọn, bền bỉ, mức giá rất rẻ, được xây dựng phù hợp cho hoạt động học tập online của các em học sinh.', 
10, 4, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P13', 
N'Lenovo Ideapad Slim 3', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/4/21/637861584460182816_lenovo-ideapad-3-14itl6-vang-dd-1.jpg', 
180.0000, 
N'laptop', 
N'Lenovo IdeaPad Slim 3 15ITL6 là mẫu laptop 15,6 inch được thiết kế siêu mỏng nhẹ, phiên bản màu vàng độc đáo và có hiệu năng ấn tượng nhờ bộ vi xử lý Intel thế hệ thứ 11 mới nhất.',
10, 4, 'CN2')




/*MAC*/

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P14', N'MacBook Pro 16', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/20/637703174146015116_macbook-pro-16-2021-xam-dd.jpg', 
150.0000, 
N'laptop', 
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 16 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P15', N'MacBook Pro 13', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2020/11/13/637408530311831907_mbp-2020-m1-gray-dd-1.png', 
120.0000, 
N'laptop', 
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 13 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN2')
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P16', 
N'MacBook Pro 14', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/20/637703173013037856_macbook-pro-14-2021-xam-dd.jpg', 
150.0000,
N'laptop',
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 14 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN2')




/*tainghe*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P17', 
N'Tai nghe HyperX Cloud Stinger', 
N'https://images.fpt.shop/unsafe/fit-in/200x200/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2021/11/10/637721638521972942_anhdaidien-00779689.jpg', 
200.0000,
N'tai nghe',
N'Với mức giá rất đáng cân nhắc khi đong đếm về chất lượng/giá cả so với các dòng tai nghe khác, HyperX Cloud Stinger chắc chắn sẽ là một trong những tai nghe gaming nổi bật trong phân khúc Mid-end.', 
10, 7, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P18', 
N' tai có mic JBL QUANTUM50BLKAS', 
N'https://images.fpt.shop/unsafe/fit-in/200x200/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2021/10/29/637711178012905930_55687_tai_nghe_gaming_jbl_quantum_50_trang_0002_3.jpg', 
200.0000,
N'tai nghe',
N'Được đảm bảo bởi thương hiệu sản xuất thiết bị âm thanh lừng danh trên thị trường - JBL, mẫu tai nghe Quantum 50 ghi điểm nhờ thiết kế đầy vẻ năng động trẻ trung, đồng thời sở hữu chất âm ấn tượng với driver 8.6mm. Sự hỗ trợ của sản phẩm sẽ giúp cho mọi tác vụ từ giải trí đến học tập và làm việc trở nên trọn vẹn hơn nhiều.', 
10, 7, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P19', 
N'Tai nghe chụp tai Sennheiser HD206',
N'https://fptshop.com.vn/Uploads/Thumbs/2021/11/25/637734458601378209_3.jpg', 
669.0000, 
N'tainghe', 
N'Sennheiser HD 206 có thiết kế kiểu tai nghe closed back với các miếng đệm lót tai đặt bên trong chụp tai. Nhờ đó, trải nghiệm nghe sẽ luôn đạt được chất lượng cao và trọn vẹn nhất. Bên cạnh đó, chiếc tai nghe này còn có trọng lượng nhẹ, đặc biệt phù hợp cho những ai đang làm công việc tại phòng thu hoặc DJ.', 
10, 7, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P20', 
N'Tai nghe HyperX Cloud Stinger', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/11/10/637721639158716568_anhdaidien-00779689-2.jpg', 
1290.0000,
N'tainghe', 
N'HyperX Cloud Stinger được trang bị màng loa định hướng rộng 50mm, song song với tai nghe nhằm định vị âm thanh trực tiếp tới tai giúp mang lại chất lượng âm thanh đẳng cấp cho các game thủ',
10, 7, 'CN2')



/*chuột*/

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P21', 
N'Chuột không dây Logitech M221', 
N'https://images.fpt.shop/unsafe/fit-in/214x214/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2020/11/25/637418984502900576_M221.jpg', 
100.0000, 
N'chuot', 
N'Nhằm để giảm thiểu những sự phiền toái và giới hạn khoảng cách do chuột máy tính có dây thì chuột không dây Logitech M221 được ra đời. Với công nghệ không dây 2.4GHz, chuột Logitech M221 cho phép người dùng kết nối xa lên đến 10m.', 
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P22', 
N'Chuột có dây Rapoo N200 ', 
N'https://images.fpt.shop/unsafe/fit-in/214x214/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2018/11/7/636772096317963039_chuot-co-day-rapoo-n200-1o.png', 
120.0000,
N'chuot',
N'Chuột Có Dây Rapoo N200 thiết kế đơn giản, cân đối 2 bên, phù hợp cho cả người thuận tay trái và tay phải.', 
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P23', N'Chuột không dây Logitech M221', 
N'https://fptshop.com.vn/Uploads/Thumbs/2016/12/1/636161960541846703_HAPK-CHUOT-KHONG-DAY-LOGITECH-M221-3.JPG', 
319.0000,
N'chuot', 
N'Chuột Logitech M221với công nghệ không dây 2.4GHz cho phép người dùng kết nối xa lên đến 10m.', 
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P24', 
N'Chuột Gaming không dây Logitech G304', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/10/26/637393197109518808_G304-4.jpg', 
890.0000, 
N'chuot', 
N'Chuột không dây logitech G304 sở hữu thiết kế đột phá, cảm biến HERO 12.000 mức DPI, hệ thống 6 nút lập trình để tùy chỉnh tính năng và công nghệ tương tác không dây vượt trội LIGHTSPEED.', 
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P25', 
N'Chuột Gaming Logitech G102 Gen2', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/9/28/637369016836148422_G102%20Gen2-4.jpg', 
590.0000, 
N'chuot', 
N'Logitech G102 Gen 2 có tạo hình hết sức cổ điển với kiểu dáng đối xứng truyền thống. Công nghệ đèn LED RGB tạo điểm nhấn. Sự tinh tế của Logitech được thể hiện qua hệ thống 6 nút tiện lợi, cho phép bạn kích hoạt nhanh các tính năng được thiết lập ở các vị trí dễ nhấn khi cầm nắm.', 
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P26', 
N'Chuột không dây Xiaomi Mi Dual',
N'https://fptshop.com.vn/Uploads/Thumbs/2021/10/9/637693741650549361_00775587-1.jpg', 
350.0000,
N'chuot', 
N'Chuột không dây Mi Dual Mode Wireless hoạt động êm ái, không ồn ào, được thiết kế với màu trắng thanh lịch và vận hành mượt mà nhờ độ phân giải đạt mức 1.300 DPI, có hai chế độ kết nối, có nút bên hông, thiết kế gọn nhẹ.', 
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P27',
N'Chuột Gaming Logitech G502 Hero High Performance', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/10/26/637393203689499588_G502-2.jpg', 
1759.0000, 
N'chuot',
N'Chuột G502 HERO High Performance được Logitech trang bị cảm biến HERO 25K – cảm biến gaming có độ chính xác cao bậc nhất thế giới hiện nay. Công nghệ ánh sáng LIGHTSYNC RGB. Bộ quang phổ 16,8 triệu màu sẽ đem lại hiệu ứng ánh sáng sống động nhất trên G502 HERO High Performance.', 
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P28',
N'Chuột Gaming MSI Clutch GM20 Elite', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/24/637759609885464213_CHUOT-4.jpg', 
756.0000, 
N'Chuot', 
N'Chuột chơi game MSI Clutch GM20 Elite nổi bật ở thiết kế đậm chất gaming và hệ thống đèn LED RGB đa sắc màu. Ngoài ra, sản phẩm còn có tốc độ phản hồi siêu nhanh, chất lượng xây dựng bền bỉ và trọng lượng có thể điều chỉnh', 
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P29', 
N'Chuột gaming Corsair Iron claw RGB', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/9/13/637671646464389567_00772807-chuot-corsair-iron-claw-rgb-1.jpg', 
1600.0000, 
N'chuot', 
N'Corsair sử dụng cảm biến PMW3391 với mức mức CPI cao nhất lên tới 18.000 và mức IPS lên tới 450. Ngoài ra Corsair Iron claw RGB sử dụng switch Omron với độ bền 50 triệu lần nhấn, đảm bảo tuổi thọ của chuột sẽ vô cùng bền bỉ.', 
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P30',
N'Chuột không dây Logitech MX Master 3', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/9/24/637680744725377286_mxmaster3.jpg', 
2490.0000, 
N'chuot', 
N'Chuột không dây Logitech MX Master 3 được thiết kế với kiểu dáng hỗ trợ cử động cổ tay và bàn tay thoải mái nhất, có thể vận hành mượt mà trên nhiều bề mặt nhờ độ phân giải cảm biến lên tới 4000 DPI và hỗ trợ công nghệ Logitech Flow giúp duy trì tương tác với ba máy tính hoặc laptop riêng biệt.', 
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P31', 
N'Chuột Bluetooth Microsoft Modern', 
N'https://fptshop.com.vn/Uploads/Thumbs/2019/12/9/637114960259233430_Microsoft%20Modern%20(3).jpg', 
900.0000, 
N'chuot', 
N'Chuột Microsoft Modern có khả năng kết nối bluetooth với cùng lúc 3 thiết bị đầu ra, có trọng lượng nhẹ nhàng chỉ 190 gram với kích thước tổng thể là 14 x 13 x 6 cm, thời lượng pin lên đến 1 năm.', 
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P32', 
N'Chuột Bluetooth Microsoft Modern', 
N'https://fptshop.com.vn/Uploads/Thumbs/2019/12/9/637114960259233430_Microsoft%20Modern%20(3).jpg', 
900.0000, 
N'chuot', 
N'Chuột Microsoft Modern có khả năng kết nối bluetooth với cùng lúc 3 thiết bị đầu ra, có trọng lượng nhẹ nhàng chỉ 190 gram với kích thước tổng thể là 14 x 13 x 6 cm, thời lượng pin lên đến 1 năm.',
10, 5, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P33', N'chuột máy tính có dây LOGITECH G102 RBG',
N'https://vn-live-05.slatic.net/p/cc33cd4c00c5cf83df2960c9e9d0457b.jpg_525x525q80.jpg', 
215.0000,
N'chuot', 
N'Chuột gaming logitech G102 có hiệu suất cao. Nhanh hơn tới 8 lần: Giao tiếp ở mức lên tới 1000 báo cáo mỗi giây - hay nhanh hơn gấp 8 lần so với chuột tiêu chuẩn.', 
10, 5, 'CN2')




/*Bàn phím*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P34',
N'Bàn phím Prolink PKCM-2007', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/7/16/637620335967558201_PKCM-2007%20-%201.jpeg', 
200.0000, 
N'banphim', 
N'Với thiết kế full size và kiểu dáng chống tràn khi gõ, bàn phím Prolink PKCM-2007 là công cụ đắc lực cho những người làm việc văn phòng, thiết kế bàn phím PKCM-2007 nghiêng nhẹ dưới đáy, tạo nên tư thế gõ thuận lợi cho cả hai tay giúp soạn thảo văn bản dễ dàng hơn.', 
10, 6, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P35', 
N'Bàn phím giả cơ có dây Zadez G-850K', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/9/637746607810605486_1.jpg',
350.0000, 
N'banphim', 
N'Bàn phím có dây Gaming Zadez G-850K được làm từ chất liệu nhựa ABS cao cấp, phím khắc Laser,  full 104 phím, 11 phím đa phương tiện. Hỗ trợ 19 phím nhấn cùng lúc (N-Key Rollover), có đèn LED RGB nhiều màu sắc.', 
10, 6, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P36', 
N'Bàn phím giả cơ có dây MSI Vigor GK20 US', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/24/637759602815516534_BAN-PHIM-2.jpg', 
700.0000,
N'banphim', 
N'Bàn phím Gaming MSI Vigor GK20 hiệu ứng đèn nền tuyệt đẹp và thiết kế công thái học cũng như kháng nước.
', 10, 6, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P37', 
N'Bàn phím cơ có dây DARE-U EK1280 Black Brown', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/9/637746599017266731_2.jpg', 
999.0000, 
N'banphim', 
N'Bàn phím cơ Dareu EK1280 RGB được thiết kế với hệ thống đèn LED RGB đặc sắc, sống động, hỗ trợ 16,8 triệu màu sắc mang đến cho game thủ màn trình diễn ánh sáng ấn tượng, tạo phong cách cá tính cho góc gaming.
', 10, 6, 'CN2')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN2P38', 
N'Bàn phím cơ không dây Zadez GT-015DK',
N'https://fptshop.com.vn/Uploads/Thumbs/2022/4/18/637858933452880200_HASP-Zadek-GT-015DK-1.png', 
1490.0000, 
N'banphim', 
N'Bàn phím cơ Gaming không dây ZADEZ Blue Switch GT-015DK sở hữu một kiểu dáng thiết kế ấn tượng, mang lối cách điệu của các đường nét nằm tại cạnh bên và mặt trên. Ngoài ra, các phím được in rõ ràng tạo nên độ sắc nét, đồng thời với chất liệu cao cấp cùng lớp phủ bằng nhựa PVC giúp bàn phím ZADEZ Blue Switch GT-015DK có được độ chắc chắn đáng kinh ngạc.
', 10, 6, 'CN2')



/**LAPTOP DETAIL*/  /*CN%LD%*/

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD01', 
'CN2P01', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-glare LED-backlit', 
N'AMD, Ryzen 5, 5500U',
N'8 GB, DDR4, 3200 MHz', 
N'SSD 512 GB', 
N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics',
N'2.2 kg', 
N'363.4 x 255 x 23.9 mm')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD02', 
'CN2P02', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-glare LED-backlit', 
N'AMD, Ryzen 5, 5500U',
N'8 GB, DDR4, 3200 MHz',
N'SSD 512 GB', 
N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics',
N'2.2 kg', 
N'363.4 x 255 x 23.9 mm')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD03', 
'CN2P03', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Acer ComfyView Anti-glare LED-backlit
', N'AMD, Ryzen 5, 5500U
', N'8 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics
', N'2.1 kg
', N'363.4 x 254.5 x 22.9 mm')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD04', 
'CN2P04', 
N'14.0 inch, 1920 x 1080 Pixels, TN, 250 nits, Anti-glare LED-backlit
', N'Intel, Core i3, 1115G4
', N'8 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'1.41 kg
', N'324.2 x 215.6 x 19.89 ~ 19.90 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD05', 
'CN2P05', 
N'15.6 inch, 2560 x 1440 Pixels, WVA, 240 Hz, 400 nits, Wide-Viewing Angle (WVA)
', N'Intel, Core i7, 11800H
', N'NULL32 GB (2 thanh 16 GB), DDR4, 3200 MHz
', N'SSD 1 TB
', N'NVIDIA GeForce RTX 3070 8GB; Intel UHD Graphics
', N'2.7 kg', N'356 x 272 x 19 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD06', 
'CN2P06', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD07', 
'CN2P07', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD08', 
'CN2P08', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD09', 
'CN2P09', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD10', 
'CN2P10', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD11', 
'CN2P11',  
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD12', 
'CN2P12', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD13', 
'CN2P13', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD14', 
'CN2P14', 
N'14.2 inch, 3024 x 1964 Pixels

', N'Apple, M1 Pro

', N'32 GB

', N'SSD 512 GB

', N'Apple M1

', N'1.604 kg
', N'324.2 x 215.6 x 19.89 ~ 19.90 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD15', 
'CN2P15', 
N'13.3 inch, 2560 x 1600 Pixels, IPS, IPS LCD LED Backlit, True Tone
', N'Apple, M1
', N'16 GB, LPDDR4
', N'SSD 512 GB
', N'Apple M1 GPU 8 nhân
', N'1.4 kg
', N'304.1 x 212.4 x 15.6 mm
')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN2LD16', 
'CN2P16', 
N'16.2 inch, 3456 x 2234 Pixels
', N'Apple, M1 Pro
', N'32 GB
', N'SSD 512 GB
', N'Apple M1
', N'2.129 kg
', N'15.6 x 358.5 x 235 mm
')



/* CHINHANH 3 */

  /*CN%P%*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P01', 
N'Acer Nitro Gaming', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/12/15/637751569796016673_acer-nitro-gaming-an515-45-den-dd.jpg',
200.0000, 
N'laptop',
N'Acer TravelMate B3 được chế tác từ chất liệu nhựa cứng cáp, trọng lượng 1.4 kg và độ dày 20.99 mm, lúc cầm mình cảm thấy chiếc máy sẽ hơi nặng một xíu nhưng bù lại rất chắc tay, cứng cáp và không quá cồng kềnh.', 
10, 3, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P02', N'Acer TUF Gaming', N'https://laptopre.vn/upload/picture/picture-01635477879.jpg', 
200.0000, 
N'laptop', 
N'Acer TUF FX506 là chiếc laptop gaming nổi bật trong phân khúc tầm trung - tầm giá 20 triệu của hãng laptop Acer. Thiết đậm chất gaming, hiệu năng khỏe và tản mát đã giúp chiếc Acer TUF Gaming F15 trở thành laptop Asus core i5 đáng mua nhất hiện nay dành cho các game thủ.',
10, 3, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P03', 
N'Acer Zenbook Duo', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/9/21/637678404165582920_asus-zenbook-duo-ux482-xanh-dd.jpg', 
170.0000, 
N'laptop', 
N'ZenBook chính là dòng máy tính xách tay cao cấp nhà Acer, Acer ZenBook Duo UX481FL BM048T đương nhiên không nằm ngoài thực tế đó. Với các thành phần mạnh mẽ đi kèm và thiết lập 2 màn hình độc đáo hứa hẹn sẽ tận dụng đầy đủ sức mạnh sáng tạo của bạn khi làm việc.', 
10, 3, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P04', 
N'Laptop Acer Aspire',
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/11/18/637728596076020587_acer-aspire-gaming-a715-42g-r1sb-r5-5500u-den-dd.jpg', 
150.0000, 
N'laptop',
N'Acer Aspire 3 A315-57G-573F là sự lựa chọn giá rẻ cho những ai đang tìm kiếm một chiếc laptop sở hữu cấu hình thực sự tốt, trang bị card đồ họa rời và Windows 11 bản quyền mới nhất. Aspire 3 chắc chắn sẽ là người bạn đồng hành đáng tin cậy trong công việc của bạn.', 
10, 3, 'CN3')



/*DELL*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P05', 
N'Dell Gaming Alienware', 
N'https://bizweb.dktcdn.net/100/372/934/files/laptopnew-dell-alienware-m15-r6-gioi-thieu.jpg?v=1635329005492', 
130.0000, 
N'laptop', 
N'Dell Alienware là một trong những phân khúc laptop gaming cao cấp hiện nay của Dell. Được hoàn thiện bằng chất liệu cao cấp với sức mạnh nội tại siêu khủng, Dell Alienware đã và đang là cơn sốt của các game thủ chuyên nghiệp nói chung và các fan nhà Dell nói riêng.',
10, 1, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P06', 
N'Dell Inspiron N3510',
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/21/637704096245522041_dell-inspiron-n3510-black-dd.jpg', 
180.0000, 
N'laptop',
N'Dell Inspiron N3510 sở hữu bộ vi xử lý Intel Celeron N4020, con chip có 2 nhân 2 luồng, tốc độ 1.10 – 2.80 GHz, đủ khả năng để chạy tốt nhu cầu làm việc', 
10, 1, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P07', 
N'Laptop Dell XPS 13', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/3/22/637520284988683886_dell-xps-13-9310-bac-dd-evo.jpg', 
160.0000, 
N'laptop', 
N'Dell XPS 13 9315 (2022) được hãng sản xuất Dell nâng cấp toàn diện cả về thiết kế lẫn phần cứng bên trong biến nó trở thành phiên bản siêu mỏng nhẹ và tiết kiệm pin nhất trong số các dòng máy tính mà Dell từng tung ra thị trường. Đặc biệt thích hợp với những người dùng thường xuyên phải di chuyển hoặc làm việc từ xa. Hãy cùng Laptop 365 đi tìm hiểu qua về mẫu máy này nhé.',
10, 1, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P08', 
N'Laptop Dell Gaming G15', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/12/2/637740490696341842_dell-gaming-g15-5511-xam-dd.jpg', 
165.0000, 
N'laptop', 
N'Dell G15 thiết kế và tản nhiệt như Alienware. Chiến max setting game nặng, đồ họa 3D mượt. Trả góp ls thấp. Siêu bền yên tâm sử dụng lâu dài, ổn định. Quà lớn.', 
10, 1, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P09', N'Laptop Dell Gaming G15 5511', N'https://cdn.tgdd.vn/Products/Images/44/264354/Slider/vi-vn-dell-gaming-g15-5511-i5-70266676-11.jpg',
160.0000, 
N'laptop', 
N'Không những mang đến cho người dùng hiệu năng ấn tượng nhờ con chip Intel thế hệ 11 tân tiến, laptop Dell Gaming G15 5511 i5 11400H (70266676) còn sở hữu thiết kế thời thượng, lôi cuốn, hứa hẹn sẽ là người cộng sự lý tưởng cùng bạn chinh phục mọi chiến trường.
Thu hút mọi ánh nhìn cùng vẻ ngoài nổi bật Đến với chiếc laptop, ngôn ngữ thiết kế đã được thay đổi so với các phiên bản tiền nhiệm, hầm hố hơn, các đường nét cắt xẻ tăng thêm phần gaming cho chiếc máy. Lớp vỏ nhựa màu xám bao bọc bên ngoài chiếc laptop Dell Gaming này mang đến sự bền bỉ hoàn mỹ cùng trọng lượng 2.81 kg và dày 25 mm, với mình đây là một con số vừa đủ để có thể mang theo bên người, phục vụ cho nhu cầu làm việc cũng như giải trí cho bản thân. ', 
10, 1, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P10', N'Laptop Dell Gaming Alienware m15 R6', 
N'https://cdn.tgdd.vn/Products/Images/44/271090/Slider/dell-gaming-alienware-m15-r6-i7-70272633-fix-01-1020x570.jpg', 
160.0000, 
N'laptop', 
N'• Laptop Dell Gaming Alienware sở hữu CPU Intel Core i7 Tiger Lake 11800H mang lại hiệu năng xử lý vượt trội. Cùng bạn thoả sức sáng tạo hình ảnh, video với card tích hợp NVIDIA GeForce RTX 3070 8 GB hay giải trí với các tựa game hấp dẫn như CS:GO, GTAV,...

• Bộ nhớ RAM 32 GB cho khả năng đa nhiệm cực mượt mà, ổ cứng SSD 1 TB cho bạn thoải mái lưu trữ dữ liệu với khả năng truy xuất, khởi động máy cực nhanh.

• Laptop Dell sở hữu ngoại hình độc đáo mang lại độ nhận diện cao với chiếc logo nổi bật trên lớp vỏ nhựa bền chắc, trọng lượng 2.69 kg luôn trong tư thế sẵn sàng chiến đấu bất cứ khi nào bạn cần.

• Màn hình 15.6 inch có độ sáng lên đến 400 nits và 99% DCI-P3 cho hình ảnh hiển thị sống động, rực rỡ với độ tương phản cao.

• Công nghệ WVA mang đến cho màn hình laptop góc nhìn rộng lên đến 178 độ, tần số quét 240 Hz cho độ trễ cực thấp, mang lại trải nghiệm hình ảnh siêu mượt mà, không bị giật, xé khi chiến những trận game đỉnh cao.

• Đèn bàn phím chuyển màu RGB độc đáo hỗ trợ bạn gõ tốt, chiến game trong mọi điều kiện sáng.

• Trang bị các cổng kết nối tiện lợi như USB 3.2, HDMI, LAN (RJ45), USB Type-C.

• Công nghệ High Definition (HD) với tính năng khuếch đại âm thanh cùng Audio Nahimic Audio giả lập hệ thống âm vòm 3D sống động, lọc và khử tiếng ồn hiệu quả.',
10, 1, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P11', N'Laptop Dell Gaming G15 5515 R7',
N'https://cdn.tgdd.vn/Products/Images/44/269650/Slider/vi-vn-dell-gaming-g15-5515-r7-70266674-6.jpg', 
190.0000, 
N'laptop', 
N'• Laptop đồ họa - kỹ thuật sở hữu bộ vi xử lý AMD Ryzen 7 5800H​ cùng card đồ họa rời NVIDIA GeForce RTX 3050 4 GB, đáp ứng mạnh mẽ quá trình xử lý các tác vụ văn phòng hay chiến những trận game đầy kịch tính.

• Màn hình viền mỏng 15.6 inch ở laptop Dell được trang bị các công nghệ hiện đại như công nghệ WVA, Anti Glare, LED Backlit hỗ trợ chóng chói, tiết kiệm điện, mang đến khung hình rộng mở.

• Tần số quét 120 Hz mang đến cho bạn những chuyển động mượt mà. Hạn chế tình trạng giật, xé hình.

• Laptop Dell Gaming với trọng lượng 2.81 kg và dày 25 mm, cùng bàn phím có đèn nền đơn sắc dễ dàng cùng bạn chiến game ở mọi không gian một cách thuận lợi nhất.

• Chiếc laptop này còn được trang bị các cổng kết nối phổ biến như USB 3.2, 2 cổng USB 2.0, HDMI và USB Type-C hỗ trợ quá trình truyền xuất dữ liệu dễ dàng.

• RAM 8 GB xử lý đa nhiệm mượt mà mọi tác vụ cùng ổ cứng SSD 512 GB cho khả năng lưu trữ đủ dùng, truy xuất dữ liệu nhanh chóng.

• Hệ điều hành Windows 11 Home SL + Office Home & Student 2021 vĩnh viễn được cài đặt sẵn trên máy giúp bạn tối ưu nhu cầu sử dụng.

• Sự kết hợp giữa High Definition (HD) Audio và Realtek Nahimic 3D Audio mang đến chất âm vòm, tăng cường âm Bass cùng tính năng khuếch đại cho bạn đắm chìm trong thế giới đầy thư giãn.', 
10, 1, 'CN3')



/*LENOVO*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P12', 
N'Lenovo 100e Gen 2', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/11/30/637738603461090929_lenovo-100e-gen-2-n4020-win-10-pro-dd.jpg',
140.0000, 
N'laptop',
N'Lenovo 100e Gen 2 là chiếc laptop nhỏ gọn, bền bỉ, mức giá rất rẻ, được xây dựng phù hợp cho hoạt động học tập online của các em học sinh.', 
10, 4, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P13', 
N'Lenovo Ideapad Slim 3', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/4/21/637861584460182816_lenovo-ideapad-3-14itl6-vang-dd-1.jpg', 
180.0000, 
N'laptop', 
N'Lenovo IdeaPad Slim 3 15ITL6 là mẫu laptop 15,6 inch được thiết kế siêu mỏng nhẹ, phiên bản màu vàng độc đáo và có hiệu năng ấn tượng nhờ bộ vi xử lý Intel thế hệ thứ 11 mới nhất.',
10, 4, 'CN3')




/*MAC*/

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P14', N'MacBook Pro 16', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/20/637703174146015116_macbook-pro-16-2021-xam-dd.jpg', 
150.0000, 
N'laptop', 
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 16 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P15', N'MacBook Pro 13', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2020/11/13/637408530311831907_mbp-2020-m1-gray-dd-1.png', 
120.0000, 
N'laptop', 
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 13 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN3')
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P16', 
N'MacBook Pro 14', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/20/637703173013037856_macbook-pro-14-2021-xam-dd.jpg', 
150.0000,
N'laptop',
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 14 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN3')




/*tainghe*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P17', 
N'Tai nghe HyperX Cloud Stinger', 
N'https://images.fpt.shop/unsafe/fit-in/200x200/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2021/11/10/637721638521972942_anhdaidien-00779689.jpg', 
200.0000,
N'tai nghe',
N'Với mức giá rất đáng cân nhắc khi đong đếm về chất lượng/giá cả so với các dòng tai nghe khác, HyperX Cloud Stinger chắc chắn sẽ là một trong những tai nghe gaming nổi bật trong phân khúc Mid-end.', 
10, 7, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P18', 
N' tai có mic JBL QUANTUM50BLKAS', 
N'https://images.fpt.shop/unsafe/fit-in/200x200/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2021/10/29/637711178012905930_55687_tai_nghe_gaming_jbl_quantum_50_trang_0002_3.jpg', 
200.0000,
N'tai nghe',
N'Được đảm bảo bởi thương hiệu sản xuất thiết bị âm thanh lừng danh trên thị trường - JBL, mẫu tai nghe Quantum 50 ghi điểm nhờ thiết kế đầy vẻ năng động trẻ trung, đồng thời sở hữu chất âm ấn tượng với driver 8.6mm. Sự hỗ trợ của sản phẩm sẽ giúp cho mọi tác vụ từ giải trí đến học tập và làm việc trở nên trọn vẹn hơn nhiều.', 
10, 7, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P19', 
N'Tai nghe chụp tai Sennheiser HD206',
N'https://fptshop.com.vn/Uploads/Thumbs/2021/11/25/637734458601378209_3.jpg', 
669.0000, 
N'tainghe', 
N'Sennheiser HD 206 có thiết kế kiểu tai nghe closed back với các miếng đệm lót tai đặt bên trong chụp tai. Nhờ đó, trải nghiệm nghe sẽ luôn đạt được chất lượng cao và trọn vẹn nhất. Bên cạnh đó, chiếc tai nghe này còn có trọng lượng nhẹ, đặc biệt phù hợp cho những ai đang làm công việc tại phòng thu hoặc DJ.', 
10, 7, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P20', 
N'Tai nghe HyperX Cloud Stinger', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/11/10/637721639158716568_anhdaidien-00779689-2.jpg', 
1290.0000,
N'tainghe', 
N'HyperX Cloud Stinger được trang bị màng loa định hướng rộng 50mm, song song với tai nghe nhằm định vị âm thanh trực tiếp tới tai giúp mang lại chất lượng âm thanh đẳng cấp cho các game thủ',
10, 7, 'CN3')



/*chuột*/

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P21', 
N'Chuột không dây Logitech M221', 
N'https://images.fpt.shop/unsafe/fit-in/214x214/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2020/11/25/637418984502900576_M221.jpg', 
100.0000, 
N'chuot', 
N'Nhằm để giảm thiểu những sự phiền toái và giới hạn khoảng cách do chuột máy tính có dây thì chuột không dây Logitech M221 được ra đời. Với công nghệ không dây 2.4GHz, chuột Logitech M221 cho phép người dùng kết nối xa lên đến 10m.', 
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P22', 
N'Chuột có dây Rapoo N200 ', 
N'https://images.fpt.shop/unsafe/fit-in/214x214/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2018/11/7/636772096317963039_chuot-co-day-rapoo-n200-1o.png', 
120.0000,
N'chuot',
N'Chuột Có Dây Rapoo N200 thiết kế đơn giản, cân đối 2 bên, phù hợp cho cả người thuận tay trái và tay phải.', 
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P23', N'Chuột không dây Logitech M221', 
N'https://fptshop.com.vn/Uploads/Thumbs/2016/12/1/636161960541846703_HAPK-CHUOT-KHONG-DAY-LOGITECH-M221-3.JPG', 
319.0000,
N'chuot', 
N'Chuột Logitech M221với công nghệ không dây 2.4GHz cho phép người dùng kết nối xa lên đến 10m.', 
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P24', 
N'Chuột Gaming không dây Logitech G304', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/10/26/637393197109518808_G304-4.jpg', 
890.0000, 
N'chuot', 
N'Chuột không dây logitech G304 sở hữu thiết kế đột phá, cảm biến HERO 12.000 mức DPI, hệ thống 6 nút lập trình để tùy chỉnh tính năng và công nghệ tương tác không dây vượt trội LIGHTSPEED.', 
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P25', 
N'Chuột Gaming Logitech G102 Gen2', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/9/28/637369016836148422_G102%20Gen2-4.jpg', 
590.0000, 
N'chuot', 
N'Logitech G102 Gen 2 có tạo hình hết sức cổ điển với kiểu dáng đối xứng truyền thống. Công nghệ đèn LED RGB tạo điểm nhấn. Sự tinh tế của Logitech được thể hiện qua hệ thống 6 nút tiện lợi, cho phép bạn kích hoạt nhanh các tính năng được thiết lập ở các vị trí dễ nhấn khi cầm nắm.', 
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P26', 
N'Chuột không dây Xiaomi Mi Dual',
N'https://fptshop.com.vn/Uploads/Thumbs/2021/10/9/637693741650549361_00775587-1.jpg', 
350.0000,
N'chuot', 
N'Chuột không dây Mi Dual Mode Wireless hoạt động êm ái, không ồn ào, được thiết kế với màu trắng thanh lịch và vận hành mượt mà nhờ độ phân giải đạt mức 1.300 DPI, có hai chế độ kết nối, có nút bên hông, thiết kế gọn nhẹ.', 
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P27',
N'Chuột Gaming Logitech G502 Hero High Performance', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/10/26/637393203689499588_G502-2.jpg', 
1759.0000, 
N'chuot',
N'Chuột G502 HERO High Performance được Logitech trang bị cảm biến HERO 25K – cảm biến gaming có độ chính xác cao bậc nhất thế giới hiện nay. Công nghệ ánh sáng LIGHTSYNC RGB. Bộ quang phổ 16,8 triệu màu sẽ đem lại hiệu ứng ánh sáng sống động nhất trên G502 HERO High Performance.', 
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P28',
N'Chuột Gaming MSI Clutch GM20 Elite', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/24/637759609885464213_CHUOT-4.jpg', 
756.0000, 
N'Chuot', 
N'Chuột chơi game MSI Clutch GM20 Elite nổi bật ở thiết kế đậm chất gaming và hệ thống đèn LED RGB đa sắc màu. Ngoài ra, sản phẩm còn có tốc độ phản hồi siêu nhanh, chất lượng xây dựng bền bỉ và trọng lượng có thể điều chỉnh', 
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P29', 
N'Chuột gaming Corsair Iron claw RGB', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/9/13/637671646464389567_00772807-chuot-corsair-iron-claw-rgb-1.jpg', 
1600.0000, 
N'chuot', 
N'Corsair sử dụng cảm biến PMW3391 với mức mức CPI cao nhất lên tới 18.000 và mức IPS lên tới 450. Ngoài ra Corsair Iron claw RGB sử dụng switch Omron với độ bền 50 triệu lần nhấn, đảm bảo tuổi thọ của chuột sẽ vô cùng bền bỉ.', 
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P30',
N'Chuột không dây Logitech MX Master 3', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/9/24/637680744725377286_mxmaster3.jpg', 
2490.0000, 
N'chuot', 
N'Chuột không dây Logitech MX Master 3 được thiết kế với kiểu dáng hỗ trợ cử động cổ tay và bàn tay thoải mái nhất, có thể vận hành mượt mà trên nhiều bề mặt nhờ độ phân giải cảm biến lên tới 4000 DPI và hỗ trợ công nghệ Logitech Flow giúp duy trì tương tác với ba máy tính hoặc laptop riêng biệt.', 
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P31', 
N'Chuột Bluetooth Microsoft Modern', 
N'https://fptshop.com.vn/Uploads/Thumbs/2019/12/9/637114960259233430_Microsoft%20Modern%20(3).jpg', 
900.0000, 
N'chuot', 
N'Chuột Microsoft Modern có khả năng kết nối bluetooth với cùng lúc 3 thiết bị đầu ra, có trọng lượng nhẹ nhàng chỉ 190 gram với kích thước tổng thể là 14 x 13 x 6 cm, thời lượng pin lên đến 1 năm.', 
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P32', 
N'Chuột Bluetooth Microsoft Modern', 
N'https://fptshop.com.vn/Uploads/Thumbs/2019/12/9/637114960259233430_Microsoft%20Modern%20(3).jpg', 
900.0000, 
N'chuot', 
N'Chuột Microsoft Modern có khả năng kết nối bluetooth với cùng lúc 3 thiết bị đầu ra, có trọng lượng nhẹ nhàng chỉ 190 gram với kích thước tổng thể là 14 x 13 x 6 cm, thời lượng pin lên đến 1 năm.',
10, 5, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P33', N'chuột máy tính có dây LOGITECH G102 RBG',
N'https://vn-live-05.slatic.net/p/cc33cd4c00c5cf83df2960c9e9d0457b.jpg_525x525q80.jpg', 
215.0000,
N'chuot', 
N'Chuột gaming logitech G102 có hiệu suất cao. Nhanh hơn tới 8 lần: Giao tiếp ở mức lên tới 1000 báo cáo mỗi giây - hay nhanh hơn gấp 8 lần so với chuột tiêu chuẩn.', 
10, 5, 'CN3')




/*Bàn phím*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P34',
N'Bàn phím Prolink PKCM-2007', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/7/16/637620335967558201_PKCM-2007%20-%201.jpeg', 
200.0000, 
N'banphim', 
N'Với thiết kế full size và kiểu dáng chống tràn khi gõ, bàn phím Prolink PKCM-2007 là công cụ đắc lực cho những người làm việc văn phòng, thiết kế bàn phím PKCM-2007 nghiêng nhẹ dưới đáy, tạo nên tư thế gõ thuận lợi cho cả hai tay giúp soạn thảo văn bản dễ dàng hơn.', 
10, 6, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P35', 
N'Bàn phím giả cơ có dây Zadez G-850K', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/9/637746607810605486_1.jpg',
350.0000, 
N'banphim', 
N'Bàn phím có dây Gaming Zadez G-850K được làm từ chất liệu nhựa ABS cao cấp, phím khắc Laser,  full 104 phím, 11 phím đa phương tiện. Hỗ trợ 19 phím nhấn cùng lúc (N-Key Rollover), có đèn LED RGB nhiều màu sắc.', 
10, 6, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P36', 
N'Bàn phím giả cơ có dây MSI Vigor GK20 US', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/24/637759602815516534_BAN-PHIM-2.jpg', 
700.0000,
N'banphim', 
N'Bàn phím Gaming MSI Vigor GK20 hiệu ứng đèn nền tuyệt đẹp và thiết kế công thái học cũng như kháng nước.
', 10, 6, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P37', 
N'Bàn phím cơ có dây DARE-U EK1280 Black Brown', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/9/637746599017266731_2.jpg', 
999.0000, 
N'banphim', 
N'Bàn phím cơ Dareu EK1280 RGB được thiết kế với hệ thống đèn LED RGB đặc sắc, sống động, hỗ trợ 16,8 triệu màu sắc mang đến cho game thủ màn trình diễn ánh sáng ấn tượng, tạo phong cách cá tính cho góc gaming.
', 10, 6, 'CN3')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN3P38', 
N'Bàn phím cơ không dây Zadez GT-015DK',
N'https://fptshop.com.vn/Uploads/Thumbs/2022/4/18/637858933452880200_HASP-Zadek-GT-015DK-1.png', 
1490.0000, 
N'banphim', 
N'Bàn phím cơ Gaming không dây ZADEZ Blue Switch GT-015DK sở hữu một kiểu dáng thiết kế ấn tượng, mang lối cách điệu của các đường nét nằm tại cạnh bên và mặt trên. Ngoài ra, các phím được in rõ ràng tạo nên độ sắc nét, đồng thời với chất liệu cao cấp cùng lớp phủ bằng nhựa PVC giúp bàn phím ZADEZ Blue Switch GT-015DK có được độ chắc chắn đáng kinh ngạc.
', 10, 6, 'CN3')




/**LAPTOP DETAIL*/  /*CN%LD%*/

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD01', 
'CN3P01', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-glare LED-backlit', 
N'AMD, Ryzen 5, 5500U',
N'8 GB, DDR4, 3200 MHz', 
N'SSD 512 GB', 
N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics',
N'2.2 kg', 
N'363.4 x 255 x 23.9 mm')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD02', 
'CN3P02', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-glare LED-backlit', 
N'AMD, Ryzen 5, 5500U',
N'8 GB, DDR4, 3200 MHz',
N'SSD 512 GB', 
N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics',
N'2.2 kg', 
N'363.4 x 255 x 23.9 mm')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD03', 
'CN3P03', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Acer ComfyView Anti-glare LED-backlit
', N'AMD, Ryzen 5, 5500U
', N'8 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics
', N'2.1 kg
', N'363.4 x 254.5 x 22.9 mm')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD04', 
'CN3P04', 
N'14.0 inch, 1920 x 1080 Pixels, TN, 250 nits, Anti-glare LED-backlit
', N'Intel, Core i3, 1115G4
', N'8 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'1.41 kg
', N'324.2 x 215.6 x 19.89 ~ 19.90 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD05', 
'CN3P05', 
N'15.6 inch, 2560 x 1440 Pixels, WVA, 240 Hz, 400 nits, Wide-Viewing Angle (WVA)
', N'Intel, Core i7, 11800H
', N'NULL32 GB (2 thanh 16 GB), DDR4, 3200 MHz
', N'SSD 1 TB
', N'NVIDIA GeForce RTX 3070 8GB; Intel UHD Graphics
', N'2.7 kg', N'356 x 272 x 19 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD06', 
'CN3P06', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD07', 
'CN3P07', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD08', 
'CN3P08', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD09', 
'CN3P09', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD10', 
'CN3P10', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD11', 
'CN3P11',  
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD12', 
'CN3P12', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD13', 
'CN3P13', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD14', 
'CN3P14', 
N'14.2 inch, 3024 x 1964 Pixels

', N'Apple, M1 Pro

', N'32 GB

', N'SSD 512 GB

', N'Apple M1

', N'1.604 kg
', N'324.2 x 215.6 x 19.89 ~ 19.90 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD15', 
'CN3P15', 
N'13.3 inch, 2560 x 1600 Pixels, IPS, IPS LCD LED Backlit, True Tone
', N'Apple, M1
', N'16 GB, LPDDR4
', N'SSD 512 GB
', N'Apple M1 GPU 8 nhân
', N'1.4 kg
', N'304.1 x 212.4 x 15.6 mm
')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN3LD16', 
'CN3P16', 
N'16.2 inch, 3456 x 2234 Pixels
', N'Apple, M1 Pro
', N'32 GB
', N'SSD 512 GB
', N'Apple M1
', N'2.129 kg
', N'15.6 x 358.5 x 235 mm
')



/* CHINHANH 4 */

 /*CN%P%*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P01', 
N'Acer Nitro Gaming', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/12/15/637751569796016673_acer-nitro-gaming-an515-45-den-dd.jpg',
200.0000, 
N'laptop',
N'Acer TravelMate B3 được chế tác từ chất liệu nhựa cứng cáp, trọng lượng 1.4 kg và độ dày 20.99 mm, lúc cầm mình cảm thấy chiếc máy sẽ hơi nặng một xíu nhưng bù lại rất chắc tay, cứng cáp và không quá cồng kềnh.', 
10, 3, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P02', N'Acer TUF Gaming', N'https://laptopre.vn/upload/picture/picture-01635477879.jpg', 
200.0000, 
N'laptop', 
N'Acer TUF FX506 là chiếc laptop gaming nổi bật trong phân khúc tầm trung - tầm giá 20 triệu của hãng laptop Acer. Thiết đậm chất gaming, hiệu năng khỏe và tản mát đã giúp chiếc Acer TUF Gaming F15 trở thành laptop Asus core i5 đáng mua nhất hiện nay dành cho các game thủ.',
10, 3, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P03', 
N'Acer Zenbook Duo', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/9/21/637678404165582920_asus-zenbook-duo-ux482-xanh-dd.jpg', 
170.0000, 
N'laptop', 
N'ZenBook chính là dòng máy tính xách tay cao cấp nhà Acer, Acer ZenBook Duo UX481FL BM048T đương nhiên không nằm ngoài thực tế đó. Với các thành phần mạnh mẽ đi kèm và thiết lập 2 màn hình độc đáo hứa hẹn sẽ tận dụng đầy đủ sức mạnh sáng tạo của bạn khi làm việc.', 
10, 3, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P04', 
N'Laptop Acer Aspire',
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/11/18/637728596076020587_acer-aspire-gaming-a715-42g-r1sb-r5-5500u-den-dd.jpg', 
150.0000, 
N'laptop',
N'Acer Aspire 3 A315-57G-573F là sự lựa chọn giá rẻ cho những ai đang tìm kiếm một chiếc laptop sở hữu cấu hình thực sự tốt, trang bị card đồ họa rời và Windows 11 bản quyền mới nhất. Aspire 3 chắc chắn sẽ là người bạn đồng hành đáng tin cậy trong công việc của bạn.', 
10, 3, 'CN4')



/*DELL*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P05', 
N'Dell Gaming Alienware', 
N'https://bizweb.dktcdn.net/100/372/934/files/laptopnew-dell-alienware-m15-r6-gioi-thieu.jpg?v=1635329005492', 
130.0000, 
N'laptop', 
N'Dell Alienware là một trong những phân khúc laptop gaming cao cấp hiện nay của Dell. Được hoàn thiện bằng chất liệu cao cấp với sức mạnh nội tại siêu khủng, Dell Alienware đã và đang là cơn sốt của các game thủ chuyên nghiệp nói chung và các fan nhà Dell nói riêng.',
10, 1, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P06', 
N'Dell Inspiron N3510',
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/21/637704096245522041_dell-inspiron-n3510-black-dd.jpg', 
180.0000, 
N'laptop',
N'Dell Inspiron N3510 sở hữu bộ vi xử lý Intel Celeron N4020, con chip có 2 nhân 2 luồng, tốc độ 1.10 – 2.80 GHz, đủ khả năng để chạy tốt nhu cầu làm việc', 
10, 1, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P07', 
N'Laptop Dell XPS 13', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/3/22/637520284988683886_dell-xps-13-9310-bac-dd-evo.jpg', 
160.0000, 
N'laptop', 
N'Dell XPS 13 9315 (2022) được hãng sản xuất Dell nâng cấp toàn diện cả về thiết kế lẫn phần cứng bên trong biến nó trở thành phiên bản siêu mỏng nhẹ và tiết kiệm pin nhất trong số các dòng máy tính mà Dell từng tung ra thị trường. Đặc biệt thích hợp với những người dùng thường xuyên phải di chuyển hoặc làm việc từ xa. Hãy cùng Laptop 365 đi tìm hiểu qua về mẫu máy này nhé.',
10, 1, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P08', 
N'Laptop Dell Gaming G15', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/12/2/637740490696341842_dell-gaming-g15-5511-xam-dd.jpg', 
165.0000, 
N'laptop', 
N'Dell G15 thiết kế và tản nhiệt như Alienware. Chiến max setting game nặng, đồ họa 3D mượt. Trả góp ls thấp. Siêu bền yên tâm sử dụng lâu dài, ổn định. Quà lớn.', 
10, 1, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P09', N'Laptop Dell Gaming G15 5511', N'https://cdn.tgdd.vn/Products/Images/44/264354/Slider/vi-vn-dell-gaming-g15-5511-i5-70266676-11.jpg',
160.0000, 
N'laptop', 
N'Không những mang đến cho người dùng hiệu năng ấn tượng nhờ con chip Intel thế hệ 11 tân tiến, laptop Dell Gaming G15 5511 i5 11400H (70266676) còn sở hữu thiết kế thời thượng, lôi cuốn, hứa hẹn sẽ là người cộng sự lý tưởng cùng bạn chinh phục mọi chiến trường.
Thu hút mọi ánh nhìn cùng vẻ ngoài nổi bật Đến với chiếc laptop, ngôn ngữ thiết kế đã được thay đổi so với các phiên bản tiền nhiệm, hầm hố hơn, các đường nét cắt xẻ tăng thêm phần gaming cho chiếc máy. Lớp vỏ nhựa màu xám bao bọc bên ngoài chiếc laptop Dell Gaming này mang đến sự bền bỉ hoàn mỹ cùng trọng lượng 2.81 kg và dày 25 mm, với mình đây là một con số vừa đủ để có thể mang theo bên người, phục vụ cho nhu cầu làm việc cũng như giải trí cho bản thân. ', 
10, 1, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P10', N'Laptop Dell Gaming Alienware m15 R6', 
N'https://cdn.tgdd.vn/Products/Images/44/271090/Slider/dell-gaming-alienware-m15-r6-i7-70272633-fix-01-1020x570.jpg', 
160.0000, 
N'laptop', 
N'• Laptop Dell Gaming Alienware sở hữu CPU Intel Core i7 Tiger Lake 11800H mang lại hiệu năng xử lý vượt trội. Cùng bạn thoả sức sáng tạo hình ảnh, video với card tích hợp NVIDIA GeForce RTX 3070 8 GB hay giải trí với các tựa game hấp dẫn như CS:GO, GTAV,...

• Bộ nhớ RAM 32 GB cho khả năng đa nhiệm cực mượt mà, ổ cứng SSD 1 TB cho bạn thoải mái lưu trữ dữ liệu với khả năng truy xuất, khởi động máy cực nhanh.

• Laptop Dell sở hữu ngoại hình độc đáo mang lại độ nhận diện cao với chiếc logo nổi bật trên lớp vỏ nhựa bền chắc, trọng lượng 2.69 kg luôn trong tư thế sẵn sàng chiến đấu bất cứ khi nào bạn cần.

• Màn hình 15.6 inch có độ sáng lên đến 400 nits và 99% DCI-P3 cho hình ảnh hiển thị sống động, rực rỡ với độ tương phản cao.

• Công nghệ WVA mang đến cho màn hình laptop góc nhìn rộng lên đến 178 độ, tần số quét 240 Hz cho độ trễ cực thấp, mang lại trải nghiệm hình ảnh siêu mượt mà, không bị giật, xé khi chiến những trận game đỉnh cao.

• Đèn bàn phím chuyển màu RGB độc đáo hỗ trợ bạn gõ tốt, chiến game trong mọi điều kiện sáng.

• Trang bị các cổng kết nối tiện lợi như USB 3.2, HDMI, LAN (RJ45), USB Type-C.

• Công nghệ High Definition (HD) với tính năng khuếch đại âm thanh cùng Audio Nahimic Audio giả lập hệ thống âm vòm 3D sống động, lọc và khử tiếng ồn hiệu quả.',
10, 1, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P11', N'Laptop Dell Gaming G15 5515 R7',
N'https://cdn.tgdd.vn/Products/Images/44/269650/Slider/vi-vn-dell-gaming-g15-5515-r7-70266674-6.jpg', 
190.0000, 
N'laptop', 
N'• Laptop đồ họa - kỹ thuật sở hữu bộ vi xử lý AMD Ryzen 7 5800H​ cùng card đồ họa rời NVIDIA GeForce RTX 3050 4 GB, đáp ứng mạnh mẽ quá trình xử lý các tác vụ văn phòng hay chiến những trận game đầy kịch tính.

• Màn hình viền mỏng 15.6 inch ở laptop Dell được trang bị các công nghệ hiện đại như công nghệ WVA, Anti Glare, LED Backlit hỗ trợ chóng chói, tiết kiệm điện, mang đến khung hình rộng mở.

• Tần số quét 120 Hz mang đến cho bạn những chuyển động mượt mà. Hạn chế tình trạng giật, xé hình.

• Laptop Dell Gaming với trọng lượng 2.81 kg và dày 25 mm, cùng bàn phím có đèn nền đơn sắc dễ dàng cùng bạn chiến game ở mọi không gian một cách thuận lợi nhất.

• Chiếc laptop này còn được trang bị các cổng kết nối phổ biến như USB 3.2, 2 cổng USB 2.0, HDMI và USB Type-C hỗ trợ quá trình truyền xuất dữ liệu dễ dàng.

• RAM 8 GB xử lý đa nhiệm mượt mà mọi tác vụ cùng ổ cứng SSD 512 GB cho khả năng lưu trữ đủ dùng, truy xuất dữ liệu nhanh chóng.

• Hệ điều hành Windows 11 Home SL + Office Home & Student 2021 vĩnh viễn được cài đặt sẵn trên máy giúp bạn tối ưu nhu cầu sử dụng.

• Sự kết hợp giữa High Definition (HD) Audio và Realtek Nahimic 3D Audio mang đến chất âm vòm, tăng cường âm Bass cùng tính năng khuếch đại cho bạn đắm chìm trong thế giới đầy thư giãn.', 
10, 1, 'CN4')



/*LENOVO*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P12', 
N'Lenovo 100e Gen 2', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/11/30/637738603461090929_lenovo-100e-gen-2-n4020-win-10-pro-dd.jpg',
140.0000, 
N'laptop',
N'Lenovo 100e Gen 2 là chiếc laptop nhỏ gọn, bền bỉ, mức giá rất rẻ, được xây dựng phù hợp cho hoạt động học tập online của các em học sinh.', 
10, 4, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P13', 
N'Lenovo Ideapad Slim 3', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/4/21/637861584460182816_lenovo-ideapad-3-14itl6-vang-dd-1.jpg', 
180.0000, 
N'laptop', 
N'Lenovo IdeaPad Slim 3 15ITL6 là mẫu laptop 15,6 inch được thiết kế siêu mỏng nhẹ, phiên bản màu vàng độc đáo và có hiệu năng ấn tượng nhờ bộ vi xử lý Intel thế hệ thứ 11 mới nhất.',
10, 4, 'CN4')




/*MAC*/

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P14', N'MacBook Pro 16', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/20/637703174146015116_macbook-pro-16-2021-xam-dd.jpg', 
150.0000, 
N'laptop', 
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 16 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P15', N'MacBook Pro 13', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2020/11/13/637408530311831907_mbp-2020-m1-gray-dd-1.png', 
120.0000, 
N'laptop', 
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 13 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN4')
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P16', 
N'MacBook Pro 14', 
N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/20/637703173013037856_macbook-pro-14-2021-xam-dd.jpg', 
150.0000,
N'laptop',
N'Kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 14 inch sẽ là mẫu laptop làm cho giới công nghệ "phát sốt", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả. ', 
10, 2, 'CN4')




/*tainghe*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P17', 
N'Tai nghe HyperX Cloud Stinger', 
N'https://images.fpt.shop/unsafe/fit-in/200x200/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2021/11/10/637721638521972942_anhdaidien-00779689.jpg', 
200.0000,
N'tai nghe',
N'Với mức giá rất đáng cân nhắc khi đong đếm về chất lượng/giá cả so với các dòng tai nghe khác, HyperX Cloud Stinger chắc chắn sẽ là một trong những tai nghe gaming nổi bật trong phân khúc Mid-end.', 
10, 7, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P18', 
N' tai có mic JBL QUANTUM50BLKAS', 
N'https://images.fpt.shop/unsafe/fit-in/200x200/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2021/10/29/637711178012905930_55687_tai_nghe_gaming_jbl_quantum_50_trang_0002_3.jpg', 
200.0000,
N'tai nghe',
N'Được đảm bảo bởi thương hiệu sản xuất thiết bị âm thanh lừng danh trên thị trường - JBL, mẫu tai nghe Quantum 50 ghi điểm nhờ thiết kế đầy vẻ năng động trẻ trung, đồng thời sở hữu chất âm ấn tượng với driver 8.6mm. Sự hỗ trợ của sản phẩm sẽ giúp cho mọi tác vụ từ giải trí đến học tập và làm việc trở nên trọn vẹn hơn nhiều.', 
10, 7, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P19', 
N'Tai nghe chụp tai Sennheiser HD206',
N'https://fptshop.com.vn/Uploads/Thumbs/2021/11/25/637734458601378209_3.jpg', 
669.0000, 
N'tainghe', 
N'Sennheiser HD 206 có thiết kế kiểu tai nghe closed back với các miếng đệm lót tai đặt bên trong chụp tai. Nhờ đó, trải nghiệm nghe sẽ luôn đạt được chất lượng cao và trọn vẹn nhất. Bên cạnh đó, chiếc tai nghe này còn có trọng lượng nhẹ, đặc biệt phù hợp cho những ai đang làm công việc tại phòng thu hoặc DJ.', 
10, 7, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P20', 
N'Tai nghe HyperX Cloud Stinger', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/11/10/637721639158716568_anhdaidien-00779689-2.jpg', 
1290.0000,
N'tainghe', 
N'HyperX Cloud Stinger được trang bị màng loa định hướng rộng 50mm, song song với tai nghe nhằm định vị âm thanh trực tiếp tới tai giúp mang lại chất lượng âm thanh đẳng cấp cho các game thủ',
10, 7, 'CN4')



/*chuột*/

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P21', 
N'Chuột không dây Logitech M221', 
N'https://images.fpt.shop/unsafe/fit-in/214x214/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2020/11/25/637418984502900576_M221.jpg', 
100.0000, 
N'chuot', 
N'Nhằm để giảm thiểu những sự phiền toái và giới hạn khoảng cách do chuột máy tính có dây thì chuột không dây Logitech M221 được ra đời. Với công nghệ không dây 2.4GHz, chuột Logitech M221 cho phép người dùng kết nối xa lên đến 10m.', 
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P22', 
N'Chuột có dây Rapoo N200 ', 
N'https://images.fpt.shop/unsafe/fit-in/214x214/filters:quality(90):fill(white)/https://fptshop.com.vn/Uploads/Originals/2018/11/7/636772096317963039_chuot-co-day-rapoo-n200-1o.png', 
120.0000,
N'chuot',
N'Chuột Có Dây Rapoo N200 thiết kế đơn giản, cân đối 2 bên, phù hợp cho cả người thuận tay trái và tay phải.', 
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P23', N'Chuột không dây Logitech M221', 
N'https://fptshop.com.vn/Uploads/Thumbs/2016/12/1/636161960541846703_HAPK-CHUOT-KHONG-DAY-LOGITECH-M221-3.JPG', 
319.0000,
N'chuot', 
N'Chuột Logitech M221với công nghệ không dây 2.4GHz cho phép người dùng kết nối xa lên đến 10m.', 
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P24', 
N'Chuột Gaming không dây Logitech G304', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/10/26/637393197109518808_G304-4.jpg', 
890.0000, 
N'chuot', 
N'Chuột không dây logitech G304 sở hữu thiết kế đột phá, cảm biến HERO 12.000 mức DPI, hệ thống 6 nút lập trình để tùy chỉnh tính năng và công nghệ tương tác không dây vượt trội LIGHTSPEED.', 
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P25', 
N'Chuột Gaming Logitech G102 Gen2', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/9/28/637369016836148422_G102%20Gen2-4.jpg', 
590.0000, 
N'chuot', 
N'Logitech G102 Gen 2 có tạo hình hết sức cổ điển với kiểu dáng đối xứng truyền thống. Công nghệ đèn LED RGB tạo điểm nhấn. Sự tinh tế của Logitech được thể hiện qua hệ thống 6 nút tiện lợi, cho phép bạn kích hoạt nhanh các tính năng được thiết lập ở các vị trí dễ nhấn khi cầm nắm.', 
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P26', 
N'Chuột không dây Xiaomi Mi Dual',
N'https://fptshop.com.vn/Uploads/Thumbs/2021/10/9/637693741650549361_00775587-1.jpg', 
350.0000,
N'chuot', 
N'Chuột không dây Mi Dual Mode Wireless hoạt động êm ái, không ồn ào, được thiết kế với màu trắng thanh lịch và vận hành mượt mà nhờ độ phân giải đạt mức 1.300 DPI, có hai chế độ kết nối, có nút bên hông, thiết kế gọn nhẹ.', 
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P27',
N'Chuột Gaming Logitech G502 Hero High Performance', 
N'https://fptshop.com.vn/Uploads/Thumbs/2020/10/26/637393203689499588_G502-2.jpg', 
1759.0000, 
N'chuot',
N'Chuột G502 HERO High Performance được Logitech trang bị cảm biến HERO 25K – cảm biến gaming có độ chính xác cao bậc nhất thế giới hiện nay. Công nghệ ánh sáng LIGHTSYNC RGB. Bộ quang phổ 16,8 triệu màu sẽ đem lại hiệu ứng ánh sáng sống động nhất trên G502 HERO High Performance.', 
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P28',
N'Chuột Gaming MSI Clutch GM20 Elite', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/24/637759609885464213_CHUOT-4.jpg', 
756.0000, 
N'Chuot', 
N'Chuột chơi game MSI Clutch GM20 Elite nổi bật ở thiết kế đậm chất gaming và hệ thống đèn LED RGB đa sắc màu. Ngoài ra, sản phẩm còn có tốc độ phản hồi siêu nhanh, chất lượng xây dựng bền bỉ và trọng lượng có thể điều chỉnh', 
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P29', 
N'Chuột gaming Corsair Iron claw RGB', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/9/13/637671646464389567_00772807-chuot-corsair-iron-claw-rgb-1.jpg', 
1600.0000, 
N'chuot', 
N'Corsair sử dụng cảm biến PMW3391 với mức mức CPI cao nhất lên tới 18.000 và mức IPS lên tới 450. Ngoài ra Corsair Iron claw RGB sử dụng switch Omron với độ bền 50 triệu lần nhấn, đảm bảo tuổi thọ của chuột sẽ vô cùng bền bỉ.', 
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P30',
N'Chuột không dây Logitech MX Master 3', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/9/24/637680744725377286_mxmaster3.jpg', 
2490.0000, 
N'chuot', 
N'Chuột không dây Logitech MX Master 3 được thiết kế với kiểu dáng hỗ trợ cử động cổ tay và bàn tay thoải mái nhất, có thể vận hành mượt mà trên nhiều bề mặt nhờ độ phân giải cảm biến lên tới 4000 DPI và hỗ trợ công nghệ Logitech Flow giúp duy trì tương tác với ba máy tính hoặc laptop riêng biệt.', 
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P31', 
N'Chuột Bluetooth Microsoft Modern', 
N'https://fptshop.com.vn/Uploads/Thumbs/2019/12/9/637114960259233430_Microsoft%20Modern%20(3).jpg', 
900.0000, 
N'chuot', 
N'Chuột Microsoft Modern có khả năng kết nối bluetooth với cùng lúc 3 thiết bị đầu ra, có trọng lượng nhẹ nhàng chỉ 190 gram với kích thước tổng thể là 14 x 13 x 6 cm, thời lượng pin lên đến 1 năm.', 
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P32', 
N'Chuột Bluetooth Microsoft Modern', 
N'https://fptshop.com.vn/Uploads/Thumbs/2019/12/9/637114960259233430_Microsoft%20Modern%20(3).jpg', 
900.0000, 
N'chuot', 
N'Chuột Microsoft Modern có khả năng kết nối bluetooth với cùng lúc 3 thiết bị đầu ra, có trọng lượng nhẹ nhàng chỉ 190 gram với kích thước tổng thể là 14 x 13 x 6 cm, thời lượng pin lên đến 1 năm.',
10, 5, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P33', N'chuột máy tính có dây LOGITECH G102 RBG',
N'https://vn-live-05.slatic.net/p/cc33cd4c00c5cf83df2960c9e9d0457b.jpg_525x525q80.jpg', 
215.0000,
N'chuot', 
N'Chuột gaming logitech G102 có hiệu suất cao. Nhanh hơn tới 8 lần: Giao tiếp ở mức lên tới 1000 báo cáo mỗi giây - hay nhanh hơn gấp 8 lần so với chuột tiêu chuẩn.', 
10, 5, 'CN4')




/*Bàn phím*/
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P34',
N'Bàn phím Prolink PKCM-2007', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/7/16/637620335967558201_PKCM-2007%20-%201.jpeg', 
200.0000, 
N'banphim', 
N'Với thiết kế full size và kiểu dáng chống tràn khi gõ, bàn phím Prolink PKCM-2007 là công cụ đắc lực cho những người làm việc văn phòng, thiết kế bàn phím PKCM-2007 nghiêng nhẹ dưới đáy, tạo nên tư thế gõ thuận lợi cho cả hai tay giúp soạn thảo văn bản dễ dàng hơn.', 
10, 6, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P35', 
N'Bàn phím giả cơ có dây Zadez G-850K', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/9/637746607810605486_1.jpg',
350.0000, 
N'banphim', 
N'Bàn phím có dây Gaming Zadez G-850K được làm từ chất liệu nhựa ABS cao cấp, phím khắc Laser,  full 104 phím, 11 phím đa phương tiện. Hỗ trợ 19 phím nhấn cùng lúc (N-Key Rollover), có đèn LED RGB nhiều màu sắc.', 
10, 6, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P36', 
N'Bàn phím giả cơ có dây MSI Vigor GK20 US', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/24/637759602815516534_BAN-PHIM-2.jpg', 
700.0000,
N'banphim', 
N'Bàn phím Gaming MSI Vigor GK20 hiệu ứng đèn nền tuyệt đẹp và thiết kế công thái học cũng như kháng nước.
', 10, 6, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P37', 
N'Bàn phím cơ có dây DARE-U EK1280 Black Brown', 
N'https://fptshop.com.vn/Uploads/Thumbs/2021/12/9/637746599017266731_2.jpg', 
999.0000, 
N'banphim', 
N'Bàn phím cơ Dareu EK1280 RGB được thiết kế với hệ thống đèn LED RGB đặc sắc, sống động, hỗ trợ 16,8 triệu màu sắc mang đến cho game thủ màn trình diễn ánh sáng ấn tượng, tạo phong cách cá tính cho góc gaming.
', 10, 6, 'CN4')

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) VALUES (
'CN4P38', 
N'Bàn phím cơ không dây Zadez GT-015DK',
N'https://fptshop.com.vn/Uploads/Thumbs/2022/4/18/637858933452880200_HASP-Zadek-GT-015DK-1.png', 
1490.0000, 
N'banphim', 
N'Bàn phím cơ Gaming không dây ZADEZ Blue Switch GT-015DK sở hữu một kiểu dáng thiết kế ấn tượng, mang lối cách điệu của các đường nét nằm tại cạnh bên và mặt trên. Ngoài ra, các phím được in rõ ràng tạo nên độ sắc nét, đồng thời với chất liệu cao cấp cùng lớp phủ bằng nhựa PVC giúp bàn phím ZADEZ Blue Switch GT-015DK có được độ chắc chắn đáng kinh ngạc.
', 10, 6, 'CN4')




/**LAPTOP DETAIL*/  /*CN%LD%*/


INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD01', 
'CN4P01', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-glare LED-backlit', 
N'AMD, Ryzen 5, 5500U',
N'8 GB, DDR4, 3200 MHz', 
N'SSD 512 GB', 
N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics',
N'2.2 kg', 
N'363.4 x 255 x 23.9 mm')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD02', 
'CN4P02', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-glare LED-backlit', 
N'AMD, Ryzen 5, 5500U',
N'8 GB, DDR4, 3200 MHz',
N'SSD 512 GB', 
N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics',
N'2.2 kg', 
N'363.4 x 255 x 23.9 mm')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD03', 
'CN4P03', 
N'15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Acer ComfyView Anti-glare LED-backlit
', N'AMD, Ryzen 5, 5500U
', N'8 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics
', N'2.1 kg
', N'363.4 x 254.5 x 22.9 mm')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD04', 
'CN4P04', 
N'14.0 inch, 1920 x 1080 Pixels, TN, 250 nits, Anti-glare LED-backlit
', N'Intel, Core i3, 1115G4
', N'8 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'1.41 kg
', N'324.2 x 215.6 x 19.89 ~ 19.90 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD05', 
'CN4P05', 
N'15.6 inch, 2560 x 1440 Pixels, WVA, 240 Hz, 400 nits, Wide-Viewing Angle (WVA)
', N'Intel, Core i7, 11800H
', N'NULL32 GB (2 thanh 16 GB), DDR4, 3200 MHz
', N'SSD 1 TB
', N'NVIDIA GeForce RTX 3070 8GB; Intel UHD Graphics
', N'2.7 kg', N'356 x 272 x 19 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD06', 
'CN4P06', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD07', 
'CN4P07', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD08', 
'CN4P08', 
N'15.6 inch, 1920 x 1080 Pixels, WVA, 120 Hz, 250 nits, WVA Anti-glare LED Backlit Narrow Border
', N'Intel, Core i7, 11800H
', N'16 GB, DDR4, 3200 MHz
', N'SSD 512 GB
', N'Intel UHD Graphics
', N'2.81 kg
', N'25 x 357.2 x 272 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD09', 
'CN4P09', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD10', 
'CN4P10', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD11', 
'CN4P11',  
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD12', 
'CN4P12', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD13', 
'CN4P13', 
N'11.6 inch, 1366 x 768 Pixels, TN, 60 Hz, 250 nits, LED Backlit
', N'Intel, Celeron, N4020
', N'4 GB, LPDDR4, 2400 MHz
', N'eMMC 64 GB
', N'Intel UHD Graphics 600
', N'1.21 kg
', N'290 x 204.7 x 19.9 mm
')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD14', 
'CN4P14', 
N'14.2 inch, 3024 x 1964 Pixels

', N'Apple, M1 Pro

', N'32 GB

', N'SSD 512 GB

', N'Apple M1

', N'1.604 kg
', N'324.2 x 215.6 x 19.89 ~ 19.90 mm
')
INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD15', 
'CN4P15', 
N'13.3 inch, 2560 x 1600 Pixels, IPS, IPS LCD LED Backlit, True Tone
', N'Apple, M1
', N'16 GB, LPDDR4
', N'SSD 512 GB
', N'Apple M1 GPU 8 nhân
', N'1.4 kg
', N'304.1 x 212.4 x 15.6 mm
')

INSERT [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) VALUES (
'CN4LD16', 
'CN4P16', 
N'16.2 inch, 3456 x 2234 Pixels
', N'Apple, M1 Pro
', N'32 GB
', N'SSD 512 GB
', N'Apple M1
', N'2.129 kg
', N'15.6 x 358.5 x 235 mm
')

