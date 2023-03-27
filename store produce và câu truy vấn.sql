CREATE PROCEDURE up_Update_CongTy
(
	@CongTy nvarchar(50),
	@Tencongty nvarchar(500),
	@Diachi  nvarchar(500),
	@SoDienThoai char(15),
	@MaCongTy int 

)
AS 
BEGIN
UPDATE tbl_CongTy
SET   @TenCongTy= @TenCongTy,Diachi= @Diachi, SoDienThoai= @SoDienThoai
WHERE MaCongTy = @MaCongTy
END  

---load toàn bộ thông tin cv ứng viên-----
CREATE PROC loadinfocv
AS
BEGIN 
    Select * From CVCaNhan
END

----Lấy cv đã đậu ----
CREATE PROC loadcvpassed 
AS
BEGIN
    Select * From NguoiTrungTuyen where CONG_VIEC_TRUNG_TUYEN is not null
END 

---Tìm kiếm công ty---
CREATE PROC searcty
(@TEN_CONG_TY Nvarchar(50))
AS
BEGIN
    select * from CongTy where TEN_CONG_TY = @TEN_CONG_TY
END

---Lấy thông tin CV do người dùng nhập vào----
CREATE PROC get_insertcv1
(

 @MA_CV int 
 
 )
 AS 
 BEGIN 
 IF (@MA_CV != 0)
 
     Select * From CVCaNhan where MA_CV=@MA_CV
 ELSE 
 
     Select * From CVCaNhan
 END
 exec get_insertcv '164'
 
	--THEM VIECLAM
	--Store Produce 
	go
	CREATE PROC get_CONGVIEC
	(
	@TEN_CONG_VIEC NVARCHAR(200) 
	)
	AS
	BEGIN
	IF(@TEN_CONG_VIEC IS NOT NULL)
	Select * from CongViec   where CongViec.TEN_CONG_VIEC like '%'+ @TEN_CONG_VIEC + '%'
	ELSE
	Select * from CongViec 
	END
	
	//exec get_CONGVIEC 'Senior'
	