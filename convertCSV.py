import pandas as pd
import os

# Đường dẫn đến thư mục chứa các file CSV
csv_folder = "C:/Users/ASUS/Downloads/archive/wikipedia_people_views_data/views_data"
output_file = "C:/Users/ASUS/Downloads/archive/CSV/combined_wiki_views.csv"

# Xóa file đầu ra nếu đã tồn tại
if os.path.exists(output_file):
    os.remove(output_file)

# Lặp qua tất cả file CSV và ghi trực tiếp vào file đầu ra
for i, filename in enumerate(os.listdir(csv_folder)):
    if filename.endswith(".csv"):
        file_path = os.path.join(csv_folder, filename)
        df = pd.read_csv(file_path)
        
        # Ghi header chỉ cho file đầu tiên
        if i == 0:
            df.to_csv(output_file, index=False, mode='w', header=True)
        else:
            df.to_csv(output_file, index=False, mode='a', header=False)

print(f"Đã hợp nhất thành {output_file}")