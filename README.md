---

````markdown
# 📊 Sleep Health & Lifestyle Project — Data Science Group

## 1. Giới thiệu
Dự án phân tích dữ liệu sức khỏe giấc ngủ và lối sống, thực hiện theo mô hình làm việc nhóm chuyên nghiệp.  
Mục tiêu của file `README.md` này: hướng dẫn **cài đặt môi trường**, **quy trình làm việc với Git**, và **quy tắc commit/push/merge** để đảm bảo dự án diễn ra trơn tru, không xung đột.

---

## 2. Yêu cầu môi trường

- **Python 3.10+**
- **Git** (cài đặt trên máy tính)
- **Anaconda/Miniconda** (khuyến nghị) hoặc `venv`
- Các thư viện chính:
  - `pandas`, `numpy`, `matplotlib`, `seaborn`
  - `scikit-learn`
  - `jupyter` / `notebook`

---

## 3. Hướng dẫn cài đặt môi trường

### Cách 1: Sử dụng `conda`

```bash
# Tạo môi trường mới
conda create -n sleep_env python=3.10 -y
conda activate sleep_env

# Cài đặt thư viện cần thiết
pip install -r requirements.txt
```

### Cách 2: Sử dụng `venv`

```bash
# Tạo môi trường ảo
python -m venv venv
# Kích hoạt
source venv/bin/activate   # Mac/Linux
venv\Scripts\activate      # Windows

# Cài đặt thư viện
pip install -r requirements.txt
```

> **Lưu ý:** Mọi người chỉ chỉnh sửa và cập nhật file `requirements.txt` khi thêm thư viện mới, sau đó push lên repo để các thành viên khác đồng bộ.

---

## 4. Cấu trúc nhánh Git

- `main` → Nhánh chính thức, chỉ merge khi toàn bộ đã kiểm thử.
- `develop` → Nhánh phát triển chung, nơi tích hợp code từ các nhánh cá nhân.
- `feature/<ten-thanh-vien>-<nhiem-vu>` → Nhánh cá nhân theo nhiệm vụ (ví dụ: `feature/A-EDA`, `feature/B-clean-data`).

```
main
└── develop
    └── feature/A-EDA
    └── feature/B-clean-data
    └── feature/C-visualization
    └── feature/D-ML
```

---

## 5. Quy trình làm việc chi tiết

### Bước 1: Clone dự án về máy

```bash
git clone <link_repo>
cd <ten_repo>
```

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

## 6. Quy tắc đồng bộ để tránh xung đột

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

## 7. Tips làm việc nhóm chuyên nghiệp

- Họp Zoom định kỳ 3 lần/tuần (ngày 24, 27, 29/09, 20h00).
- Check-in nhanh hàng ngày qua chat nhóm (22h00).
- Luôn viết mô tả ngắn trong PR để người khác dễ review.
- Nếu phát hiện lỗi sau khi merge → tạo nhánh `fix/<ten>` để sửa, tuyệt đối không sửa trực tiếp trên `develop`.

---
