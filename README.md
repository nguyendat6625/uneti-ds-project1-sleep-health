---

# 📊 Sleep Health & Lifestyle Project — Data Science Group

## 1. Giới thiệu
Dự án phân tích dữ liệu sức khỏe giấc ngủ và lối sống, thực hiện theo mô hình làm việc nhóm chuyên nghiệp.  

Mục tiêu của file `README.md` này là hướng dẫn nhóm cách:
- Sử dụng Git trong quá trình phát triển dự án
- Quy tắc commit, push và merge để tránh xung đột code

---

## 2. Cấu trúc nhánh Git

- `main` → Nhánh chính thức, chỉ merge khi toàn bộ đã kiểm thử.
- `develop` → Nhánh phát triển chung, nơi tích hợp code từ các nhánh cá nhân.
- `feature/<ten-thanh-vien>-<nhiem-vu>` → Nhánh cá nhân theo nhiệm vụ (ví dụ: `feature/A-lamsachdulieu`, `feature/B-trucquanhoa`).

main
└── develop
└── feature/A-lamsachdulieu
└── feature/B-trucquanhoa
└── feature/C-thongke
└── feature/D-thuattoan

````

---

## 3. Quy trình làm việc chi tiết

### Bước 1: Clone dự án về máy

```bash
git clone <link_repo>
cd <ten_repo>
````

### Bước 2: Checkout nhánh cá nhân

```bash
# Luôn cập nhật develop mới nhất
git checkout develop
git pull origin develop

# Tạo nhánh cá nhân từ develop
git checkout -b feature/<ten-thanh-vien>-<nhiem-vu>
```

### Bước 3: Làm việc và commit

- Quy tắc commit: **ngắn gọn, rõ ràng, có prefix**

  - `feat:` thêm chức năng
  - `fix:` sửa lỗi
  - `docs:` cập nhật tài liệu
  - `refactor:` cải tiến code
  - `test:` thêm kiểm thử

Ví dụ:

```bash
git add .
git commit -m "feat: thêm biểu đồ histogram cho Sleep Duration"
```

### Bước 4: Push nhánh cá nhân

```bash
git push origin feature/<ten-thanh-vien>-<nhiem-vu>
```

### Bước 5: Tạo Pull Request (PR)

- Khi hoàn thành phần việc, tạo **Pull Request** (PR) từ nhánh cá nhân → `develop`.
- Thành viên khác **review code**:

  - Kiểm tra lỗi
  - Chạy thử notebook
  - Đóng góp ý kiến

### Bước 6: Merge vào `develop`

- Chỉ nhóm trưởng (hoặc người được ủy quyền) mới được **merge vào develop** sau khi review OK.
- Khi tất cả tính năng đã hoàn thiện, test OK → **merge `develop` → `main`**.

---

## 4. Quy tắc đồng bộ để tránh xung đột

1. **Luôn cập nhật develop trước khi code:**

   ```bash
   git checkout develop
   git pull origin develop
   git checkout feature/<branch>
   git merge develop
   ```

   → Giải quyết xung đột (nếu có) tại nhánh cá nhân, không để xung đột khi merge develop.

2. **Không commit trực tiếp lên develop hay main.**

3. **Mỗi commit/push nhỏ gọn**, không gom quá nhiều thay đổi vào một commit.

4. **Đặt tên file/thư mục rõ ràng**, tránh trùng lặp.

5. **Thành viên bận** → phải báo cho trưởng nhóm để điều chỉnh phân công.

---

## 5. Tips làm việc nhóm chuyên nghiệp

- Họp Zoom định kỳ 3 lần/tuần (ngày 24, 27, 29/09, 20h00).
- Check-in nhanh hàng ngày qua chat nhóm (22h00).
- Luôn viết mô tả ngắn trong PR để người khác dễ review.
- Nếu phát hiện lỗi sau khi merge → tạo nhánh `fix/<ten>` để sửa, tuyệt đối không sửa trực tiếp trên `develop`.

---
