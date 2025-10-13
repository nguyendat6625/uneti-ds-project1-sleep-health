library(tidyverse)
library(dplyr)
##Đọc dữ liệu file
sleep_data <- read.csv("D:/Projects_1/uneti-ds-project1-sleep-health/data/raw/Sleep_health_and_lifestyle_dataset.csv")
##Kiểm tra và đánh giá sơ bộ về dữ liệu
cat("\n2. Kiểm tra kiểu dữ liệu của các cột:\n")
print(glimpse(sleep_data))
cat("1. Kích thước ban đầu của tập dữ liệu:\n")
print(dim(sleep_data))
#Kiểm tra dữ liệu hợp lệ và giá trị bị thiếu
cat("\n3. Kiểm tra giá trị thiếu:\n")
missing_values <- colSums(is.na(sleep_data))
print(missing_values)
#Kiểm tra giá trị trùng lặp
cat("\n4. Kiểm tra và xử lý giá trị trùng lặp:\n")
dup_count <- sum(duplicated(sleep_data))
cat("Số dòng trùng lặp:", dup_count, "\n")
#Kiểm tra dữ liệu không hợp lệ
# Kiểm tra dữ liệu Age không hợp lệ
invalid_age <- subset(sleep_data, Age <= 18 | Age > 80)
# Kiểm tra Sleep.Duration bất hợp lý
invalid_sleep <- subset(sleep_data, Sleep.Duration < 4 | Sleep.Duration > 10)
#Kiểm tra Quality.of.Sleep
invalid_quality <-subset(sleep_data,Quality.of.Sleep <1 |Quality.of.Sleep >10)
# Kiểm tra Physical.Activity.Level 
invalid_activity <- subset(sleep_data, Physical.Activity.Level < 0 | Physical.Activity.Level > 300)
# Kiểm tra Stress.Level (thang 1-10)
invalid_stress <- subset(sleep_data, Stress.Level < 1 | Stress.Level > 10)
# Kiểm tra Heart.Rate 
invalid_hr <- subset(sleep_data, Heart.Rate < 40 | Heart.Rate > 120)
# Kiểm tra Daily.Steps 
invalid_steps <- subset(sleep_data, Daily.Steps < 0 | Daily.Steps > 20000)
##Tách cột Blood.Pressure
sleep_data_processed <- separate(sleep_data, Blood.Pressure, c("Systolic", "Diastolic"), sep = "/", convert = TRUE)
# Kiểm tra mâu thuẫn sinh học
invalid_bp_consistency <- subset(sleep_data_processed, Systolic <= Diastolic)
##Chuẩn hóa dữ liệu
sleep_data_final_typed <-mutate(sleep_data_processed,
    Age = as.integer(Age),                          
    Sleep.Duration = as.numeric(Sleep.Duration),  
    Heart.Rate = as.integer(Heart.Rate),          
    Daily.Steps = as.integer(Daily.Steps),        
    Physical.Activity.Level = as.integer(Physical.Activity.Level),
    Systolic = as.integer(Systolic),          
    Diastolic = as.integer(Diastolic),            
    Gender = as.factor(Gender),
    Occupation = as.factor(Occupation),
    BMI.Category=as.factor(BMI.Category),
    Sleep.Disorder=as.factor(Sleep.Disorder),
    Quality.of.Sleep = as.integer(Quality.of.Sleep),
    Stress.Level = as.integer(Stress.Level)
  )
cat("\n--- Cấu trúc Dữ liệu Sau Khi Chuẩn hóa --- \n")
str(sleep_data_final_typed)
#Lưu dataframe 
sleep_data_final <-sleep_data_final_typed
### Chuyển đổi dữ liệu
cat("--- KIỂM TRA ĐỊNH DẠNG TIDY DATA --- \n")
cat("Số quan sát (hàng, mỗi hàng là một cá nhân): ", nrow(sleep_data_final), "\n")
cat("Số biến (cột, mỗi cột là một quan sát): ", ncol(sleep_data_final), "\n")
cat("\n5 Hàng đầu tiên (Mỗi hàng là một cá nhân):\n")
print(head(sleep_data_final, 5))
cat("\nTên các biến (cột):\n")
print(colnames(sleep_data_final))
## Mã hóa dữ liệu
# Thống nhất "Normal Weight" thành "Normal
sleep_data_final$BMI.Category <- case_when(sleep_data_final$BMI.Category == "Normal Weight" ~ "Normal",TRUE ~ sleep_data_final$BMI.Category)
# 1. Thực hiện việc Mã hóa BMI.Category
sleep_data_final$BMI.Category <- as.integer(factor(sleep_data_final$BMI.Category,ordered = TRUE))
#2.Thực hiện mã hóa Slepp.Disorder (None = 0, Insomnia = 1, Sleep Apnea = 2)
sleep_data_final$Sleep.Disorder<- as.integer(factor(sleep_data_final$Sleep.Disorder,levels = c("None", "Insomnia", "Sleep Apnea"),ordered = TRUE)) - 1
###Tạo biến dẫn xuất
# 1. Tạo biến ShortSleep
sleep_data_final$Short.Sleep <- ifelse(sleep_data_final$Sleep.Duration < 7.0, 1, 0)
# 2. Tạo biến HighStress
sleep_data_final$High.Stress <- ifelse(sleep_data_final$Stress.Level >= 8, 1, 0)
# 3. Tạo biến tương tác BMI_Category_HighStress
sleep_data_final$BMI.Category.HighStress <- ifelse(sleep_data_final$BMI.Category == 3 & sleep_data_final$High.Stress == 1, 1, 0)
du_lieu_sleep_da_xu_li<- sleep_data_final 
write.csv(
  x = du_lieu_sleep_da_xu_li, 
  file = "du_lieu_sleep_da_xu_ly.csv", 
  row.names = FALSE
)