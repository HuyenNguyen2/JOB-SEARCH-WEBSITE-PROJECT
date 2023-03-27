
CREATE DATABASE TAOBANGQUERY
GO 

USE TAOBANGQUERY
GO 

CREATE TABLE CongTy
(
  MA_CONG_TY CHAR(20) PRIMARY KEY,
  DIA_CHI NVARCHAR(500),
  SO_DIEN_THOAI CHAR(15),
  TEN_CONG_TY NVARCHAR(500)
)
GO

CREATE TABLE CongViec
(
  MA_CONG_VIEC CHAR(20) PRIMARY KEY,
  TEN_CONG_VIEC NVARCHAR(200),
  MO_TA_CONG_VIEC NVARCHAR(500),
  MUC_LUONG CHAR(100),
  THOI_GIAN_NOP DATE,
  MA_CONG_TY CHAR(20)

  FOREIGN KEY(MA_CONG_TY) REFERENCES dbo.CongTy(MA_CONG_TY)
)
GO

CREATE TABLE YeuCau
( 
  DO_TUOI CHAR(20) PRIMARY KEY,
  BANG_CAP NVARCHAR(100),
  SO_LUONG_CAN_TUYEN CHAR(100),
  KINH_NGHIEM NVARCHAR(500),
  GIOI_TINH NVARCHAR(20),
  MA_CONG_TY CHAR(20)

  FOREIGN KEY (MA_CONG_TY) REFERENCES dbo.CongTy(MA_CONG_TY)
)
GO

CREATE TABLE CVCaNhan
(
  MA_CV CHAR(20) PRIMARY KEY,
  HO_VA_TEN NVARCHAR(200),
  GIOI_TINH NVARCHAR(20),
  DIA_CHI NVARCHAR(500),
  SO_DIEN_THOAI CHAR(15),
  TRINH_DO_HOC_VAN NVARCHAR(200),
  CHUYEN_NGANH NVARCHAR(200),
  MA_CONG_TY CHAR(20),
 
  FOREIGN KEY (MA_CONG_TY) REFERENCES dbo.CongTy(MA_CONG_TY)
)
 ALTER TABLE CVCaNhan ADD MA_NGUOI_DUNG char(20) 
GO
 
 CREATE TABLE NguoiTrungTuyen
(
  CONG_VIEC_TRUNG_TUYEN NVARCHAR(200) PRIMARY KEY,
  MA_CONG_VIEC CHAR(20),
  MA_CV CHAR(20)

  FOREIGN KEY(MA_CONG_VIEC) REFERENCES dbo.CongViec(MA_CONG_VIEC),
  FOREIGN KEY(MA_CV) REFERENCES dbo.CVCaNhan(MA_CV)
)
GO

CREATE TABLE NguoiDung
(
  MA_NGUOI_DUNG CHAR(20) PRIMARY KEY,
  DANGKI NVARCHAR(500),
  DANGNHAP NVARCHAR(500),
  TAI_KHOAN NVARCHAR(500),
  DOI_MATKHAU NVARCHAR(500),
  MA_CONG_TY CHAR(20),
  MA_CV CHAR(20)
)
GO

ALTER TABLE CVCaNhan
  ADD CONSTRAINT fk_ND_CV
  FOREIGN KEY (MA_NGUOI_DUNG)
  REFERENCES dbo.NguoiDung (MA_NGUOI_DUNG)
GO

CREATE TABLE TimKiem
( 
  MA_CONG_TY CHAR(20),
  MA_NGUOI_DUNG CHAR(20)
)
GO

ALTER TABLE TimKiem
  ADD CONSTRAINT fk_CT_TK
  FOREIGN KEY (MA_CONG_TY)
  REFERENCES dbo.CongTy (MA_CONG_TY)
GO

ALTER TABLE TimKiem
  ADD CONSTRAINT fk_ND_TK
  FOREIGN KEY (MA_NGUOI_DUNG)
  REFERENCES dbo.NguoiDung (MA_NGUOI_DUNG)
GO

INSERT INTO CongTy(MA_CONG_TY,DIA_CHI,SO_DIEN_THOAI,TEN_CONG_TY) VALUES('01',N'1120C Tự Cường, Phường 4, Quận Tân Bình, Thành phố Hồ Chí Minh','0316917353',N'CÔNG TY TNHH ADEPT')
INSERT INTO CongTy(MA_CONG_TY,DIA_CHI,SO_DIEN_THOAI,TEN_CONG_TY) VALUES('02',N'49 Đường Trần Văn Kỷ, Phường 14, Quận Bình Thạnh, Thành phố Hồ Chí Minh','0316916416',N'CÔNG TY TNHH FOOD TECH VIỆT NAM')
INSERT INTO CongTy(MA_CONG_TY,DIA_CHI,SO_DIEN_THOAI,TEN_CONG_TY) VALUES('03',N'4/29 Đường 22, Phường Long Thạnh Mỹ, Thành phố Thủ Đức, Thành phố Hồ Chí Minh','0316918484',N'CÔNG TY TNHH ART & NUM')
INSERT INTO CongTy(MA_CONG_TY,DIA_CHI,SO_DIEN_THOAI,TEN_CONG_TY) VALUES('04',N'527 Xô Viết Nghệ Tĩnh, Phường 26, Quận Bình Thạnh, Thành phố Hồ Chí Minh','0316918244 ',N'CÔNG TY TNHH TÂY NAM MEDIA')
INSERT INTO CongTy(MA_CONG_TY,DIA_CHI,SO_DIEN_THOAI,TEN_CONG_TY) VALUES('05',N'343 Hoàng Sa, Phường Tân Định, Quận 1, Thành phố Hồ Chí Minh','0316919110',N'CÔNG TY TNHH PMI INTERNATIONAL VIETNAM')
INSERT INTO CongTy(MA_CONG_TY,DIA_CHI,SO_DIEN_THOAI,TEN_CONG_TY) VALUES('06',N'Số 1B, Đường 30, Khu phố 2, Phường An Phú, Thành phố Thủ Đức, Thành phố Hồ Chí Minh','0316918974',N'CÔNG TY TNHH PSH PARTNERS')
INSERT INTO CongTy(MA_CONG_TY,DIA_CHI,SO_DIEN_THOAI,TEN_CONG_TY) VALUES('07',N'36C3 Đường DN3, Khu Dân Cư An Sương, Phường Tân Hưng Thuận, Quận 12, Thành phố Hồ Chí Minh','0316918879',N'CÔNG TY TNHH HƯNG THỊNH DESICCANT')
INSERT INTO CongTy(MA_CONG_TY,DIA_CHI,SO_DIEN_THOAI,TEN_CONG_TY) VALUES('08',N'Số 8 Trang Tử, Phường 14, Quận 5, Thành phố Hồ Chí Minh','0316917106',N'CÔNG TY TNHH THỜI TRANG THÁI TUẤN')
INSERT INTO CongTy(MA_CONG_TY,DIA_CHI,SO_DIEN_THOAI,TEN_CONG_TY) VALUES('08',N'49/3 Lê Văn Duyệt, Phường 3, Quận Bình Thạnh, Thành phố Hồ Chí Minh','0316917233',N'CÔNG TY TNHH DOANH NGHIỆP XÃ HỘI HESTIA')
INSERT INTO CongTy(MA_CONG_TY,DIA_CHI,SO_DIEN_THOAI,TEN_CONG_TY) VALUES('10',N'Số 110 Đinh Bộ Lĩnh, Phường 26, Quận Bình Thạnh, Thành phố Hồ Chí Minh','0316918685',N'CÔNG TY CỔ PHẦN NAM MINH INVESTMENT')
 
INSERT INTO CongViec(MA_CONG_VIEC,TEN_CONG_VIEC,MO_TA_CONG_VIEC,MUC_LUONG,THOI_GIAN_NOP,MA_CONG_TY) VALUES('145',N'Senior Marketing Executive',N'Xây dựng các kế hoạch quảng cáo truyền thông, Quản lý hình ảnh hệ thống cửa hàng theo tiêu chuẩn đã ban hành,Phối hợp triển khai các chương trình Khuyến mãi trên toàn hệ thống,Lập kế hoạch và triển khai các chương trình, sự kiện của công ty','25000000','07/07/2021','03')
INSERT INTO CongViec(MA_CONG_VIEC,TEN_CONG_VIEC,MO_TA_CONG_VIEC,MUC_LUONG,THOI_GIAN_NOP,MA_CONG_TY) VALUES('548',N'Business Analyst',N'Phân tích và làm rõ các yêu cầu của khách hàng,Phân tích và đưa ra mô hình, giải pháp dựa trên yêu cầu đã thu thập được,Tham gia phân tích nghiệp vụ, đề xuất những giải pháp cho việc triển khai','40000000','27/06/2021','05') 
INSERT INTO CongViec(MA_CONG_VIEC,TEN_CONG_VIEC,MO_TA_CONG_VIEC,MUC_LUONG,THOI_GIAN_NOP,MA_CONG_TY) VALUES('876',N'Kế toán viên',N'Thực hiện và duy trì hệ thống thông tin kế toán,Thực hiện báo cáo thuế hàng tháng, Phối hợp với các phòng ban khác để cung cấp các tài liệu và thông tin kế toán theo yêu cầu,Quản lý tiền mặt, dự báo vòng quay tiền mặt bao gồm lập danh mục bán hàng, cân đối tiền mặt, lập báo cáo sử dụng tiền mặt hàng tuần','23000000','24/07/2021','07')
INSERT INTO CongViec(MA_CONG_VIEC,TEN_CONG_VIEC,MO_TA_CONG_VIEC,MUC_LUONG,THOI_GIAN_NOP,MA_CONG_TY) VALUES('485',N'Content Writer',N'Lên kế hoạch nội dung và viết nội dung cho toàn bộ website, các trang mạng xã hội,Hỗ trợ các công việc, sự kiện truyền thông,Viết nội dung cho các ẩn phẩm truyền thông như trang quảng cáo, tờ rơi, các tài liệu online, offline phục vụ hoạt động marketing, xây dựng thương hiệu, marketing truyền thông đối ngoại','20000000','14/07/2021','01')
INSERT INTO CongViec(MA_CONG_VIEC,TEN_CONG_VIEC,MO_TA_CONG_VIEC,MUC_LUONG,THOI_GIAN_NOP,MA_CONG_TY) VALUES('265',N'Junior Developer',N'Contribute as a team member on development projects carrying out assigned responsibilities in a timely, diligent, safe, and professional manner,Implement task lists, estimate deliver assignments as functional specifications, quality standards and project schedules,Ensure quality in a product’s design for usability, reliability, functionality, scalability, extensibility','26000000','05/07/2021','04')
INSERT INTO CongViec(MA_CONG_VIEC,TEN_CONG_VIEC,MO_TA_CONG_VIEC,MUC_LUONG,THOI_GIAN_NOP,MA_CONG_TY) VALUES('692',N'HR Executive',N'Ensure that the day-to-day administrative needs of the department are fulfilled,Perform the duties within the framework defined by the norms of the Company and within the Hotel’s internal regulations,Keep confidential information CONFIDENTIAL,Responsible for rendering secretarial and clerical services for the Human Resource Manager as required','30000000','08/07/2021','02')
INSERT  INTO CongViec(MA_CONG_VIEC,TEN_CONG_VIEC,MO_TA_CONG_VIEC,MUC_LUONG,THOI_GIAN_NOP,MA_CONG_TY) VALUES('365',N'Junior Designer',N'Sáng tạo và triển khai ý tưởng thiết kế hình ảnh/ video nhiều thể loại,Phối hợp làm việc với Content Writer, Marketer và Creative Director để định hướng concept và đưa ra sản phẩm thiết kế tốt nhất,Phối hợp cùng team trong việc xây dựng và biên tập nội dung','26000000','22/07/2021','06')
INSERT INTO CongViec(MA_CONG_VIEC,TEN_CONG_VIEC,MO_TA_CONG_VIEC,MUC_LUONG,THOI_GIAN_NOP,MA_CONG_TY) VALUES('724',N'Tester Leader',N'Tham gia quản lý team tester của Web services và Business software,Tiến hành liên lạc với khách hàng,Hiểu chính xác nội dung dự án và phân công-chỉ thị cho nhân viên','28000000','16/07/2021','08')

INSERT INTO YeuCau(DO_TUOI,BANG_CAP,SO_LUONG_CAN_TUYEN,KINH_NGHIEM,GIOI_TINH,MA_CONG_TY) VALUES('30-35',N'Tốt nghiệp nghành marketing','01','5 năm','Tất cả','03')
INSERT INTO YeuCau(DO_TUOI,BANG_CAP,SO_LUONG_CAN_TUYEN,KINH_NGHIEM,GIOI_TINH,MA_CONG_TY) VALUES('30-45',N'Có bằng tốt nghiệp các nghành kinh doanh, quản lý,...','01','5 năm','Nam','05')
INSERT INTO YeuCau(DO_TUOI,BANG_CAP,SO_LUONG_CAN_TUYEN,KINH_NGHIEM,GIOI_TINH,MA_CONG_TY) VALUES('25-35',N'Có bằng tốt nghiệp các nghành tài chính, ngân hàng','03','2 năm','Nữ','07')
INSERT INTO YeuCau(DO_TUOI,BANG_CAP,SO_LUONG_CAN_TUYEN,KINH_NGHIEM,GIOI_TINH,MA_CONG_TY) VALUES('25-30',N'Portfolip sản phẩm cá nhân','07','1 năm','Tất cả','01')
INSERT INTO YeuCau(DO_TUOI,BANG_CAP,SO_LUONG_CAN_TUYEN,KINH_NGHIEM,GIOI_TINH,MA_CONG_TY) VALUES('25-35',N'Có bằng tốt nghiệp các nghành IT','05','2 năm','Tất cả','04')
INSERT INTO YeuCau(DO_TUOI,BANG_CAP,SO_LUONG_CAN_TUYEN,KINH_NGHIEM,GIOI_TINH,MA_CONG_TY) VALUES('25-35',N'tốt nghiệp các nghành quản trị','01','4 năm','Tất cả','02')
INSERT INTO YeuCau(DO_TUOI,BANG_CAP,SO_LUONG_CAN_TUYEN,KINH_NGHIEM,GIOI_TINH,MA_CONG_TY) VALUES('25-30',N'Tốt nghiệp các nghành đồ họa/thiết kế','01','2 năm','Tất cả','06')
INSERT INTO YeuCau(DO_TUOI,BANG_CAP,SO_LUONG_CAN_TUYEN,KINH_NGHIEM,GIOI_TINH,MA_CONG_TY) VALUES('30-40',N'Tốt nghiệp các nghành IT','01','5 năm','08')

INSERT INTO CVCaNhan(MA_CV,HO_VA_TEN,GIOI_TINH,DIA_CHI,SO_DIEN_THOAI,TRINH_DO_HOC_VAN,CHUYEN_NGANH,MA_CONG_TY) VALUES('656',N'Nguyễn Bảo Nam','Nam',N'19/2B Đường Thạnh Lộc 08, Phường Thạnh Lộc, Quận 12, Thành phố Hồ Chí Minh','0946778945',N'Tốt nghiệp Đại Học Công nghệ Thông tin',N'Kỹ thuật phần mềm','04')
INSERT INTO CVCaNhan(MA_CV,HO_VA_TEN,GIOI_TINH,DIA_CHI,SO_DIEN_THOAI,TRINH_DO_HOC_VAN,CHUYEN_NGANH,MA_CONG_TY) VALUES('466',N'Hoàng Ngọc Thảo',N'Nữ',N'20/29 Đồng Xoài, Phường 13, Quận Tân Bình, Thành phố Hồ Chí Minh','0736614897',N'Tốt nghiệp đại học Mỹ thuật',N'Thiết kế đồ họa','06')
INSERT INTO CVCaNhan(MA_CV,HO_VA_TEN,GIOI_TINH,DIA_CHI,SO_DIEN_THOAI,TRINH_DO_HOC_VAN,CHUYEN_NGANH,MA_CONG_TY) VALUES('164',N'Ngô Thị Quỳnh Trang',N'Nữ',N'14 Hoàng Quốc Việt, Phường Phú Mỹ, Quận 7, Thành phố Hồ Chí Minh','0966478125',N'Tốt nghiệp đại học Ngân hàng',N'Tài chính kế toán','07')

INSERT INTO NguoiTrungTuyen(CONG_VIEC_TRUNG_TUYEN,MA_CONG_VIEC,MA_CV) VALUES('Junior Developer','265','656')
INSERT INTO NguoiTrungTuyen(CONG_VIEC_TRUNG_TUYEN,MA_CONG_VIEC,MA_CV) VALUES('Junior Designer','365','466')
INSERT INTO NguoiTrungTuyen(CONG_VIEC_TRUNG_TUYEN,MA_CONG_VIEC,MA_CV) VALUES('Kế toán viên','876','164')



