# GoodbyeDPI - Cấu hình chỉ dành riêng cho Steam (Vietnam ISP Bypass)

Giải pháp vượt chặn Steam tại Việt Nam (Viettel, VNPT, FPT) **chỉ áp dụng cho Steam** và **không thay đổi DNS của toàn bộ máy tính** (giữ nguyên DNS mạng nội bộ, cty, trường học và không ảnh hưởng game khác).

---

## 🎯 Tính năng nổi bật
* **Không đổi DNS toàn máy:** Sử dụng cơ chế **NRPT (Name Resolution Policy Table)** tích hợp sẵn trong Windows. Chỉ các tên miền Steam (`*.steampowered.com`, `*.steamcommunity.com`,...) mới được phân giải qua Google DNS (`8.8.8.8` / `1.1.1.1`). Các phần mềm khác và card mạng vẫn dùng nguyên vẹn DNS cũ.
* **Chỉ can thiệp gói tin Steam:** GoodbyeDPI chạy ở chế độ `--blacklist steam-blacklist.txt`. Toàn bộ lưu lượng web khác, game khác (LMHT, Valorant, ping game) hoàn toàn không bị can thiệp.
* **Tự động xin quyền Admin (UAC):** Nhấp đúp là chạy, không cần mất công chuột phải chọn Run as Administrator.

---

## 🚀 Hướng dẫn sử dụng

### Bước 1: Kích hoạt DNS riêng cho Steam (Chỉ cần làm 1 lần)
* Nhấp đúp file `setup_steam_dns_rule.cmd` -> Chọn **Yes** khi được hỏi quyền Admin.
* File này sẽ cấu hình Windows tự động chuyển hướng truy vấn DNS của riêng Steam sang `8.8.8.8` / `1.1.1.1`.
* *(Nếu muốn khôi phục về mặc định, nhấp đúp file `remove_steam_dns_rule.cmd`)*.

### Bước 2: Chạy GoodbyeDPI cho Steam

Chọn **1 trong 2 cách** sau:

#### Cách 1: Chạy khi cần (Cửa sổ CMD)
* Nhấp đúp mở `1_steam_only.cmd`.
* Cửa sổ CMD sẽ mở và chỉ lọc các kết nối đến Steam.
* Khi chơi xong, chỉ cần đóng cửa sổ CMD là ứng dụng dừng hoàn toàn.

#### Cách 2: Cài đặt tự chạy ngầm cùng Windows (Khuyên dùng)
* Nhấp đúp chạy `service_install_steam_only.cmd`.
* GoodbyeDPI sẽ được đăng ký thành Windows Service tự khởi động ngầm cùng máy tính.
* *(Gỡ cài đặt bằng `service_remove.cmd`)*.

---

## 📂 Danh sách file
* `1_steam_only.cmd`: Trình khởi chạy GoodbyeDPI ở chế độ cửa sổ (chỉ lọc Steam).
* `service_install_steam_only.cmd`: Trình cài đặt dịch vụ chạy ngầm GoodbyeDPI cho Steam.
* `setup_steam_dns_rule.cmd`: Thiết lập quy tắc phân giải DNS riêng cho Steam qua Windows NRPT.
* `remove_steam_dns_rule.cmd`: Xóa bỏ quy tắc DNS riêng của Steam, đưa hệ thống về ban đầu.
* `steam-blacklist.txt`: Danh sách đầy đủ các tên miền và CDN của Valve/Steam.
