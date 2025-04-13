import csv

# Đường dẫn file đầu vào và đầu ra
input_file = 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/monthly_views_2023_cleaned.csv'
output_file = 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/monthly_views_2023_cleaned_v2.csv'

# Hàm làm sạch ký tự không phải ASCII
def clean_non_ascii(text):
    if isinstance(text, str):
        # Chỉ giữ các ký tự ASCII (0x00-0x7F), thay thế ký tự không hợp lệ bằng ''
        return ''.join(char if ord(char) < 128 else '' for char in text)
    return text

# Đọc và ghi file từng dòng
with open(input_file, 'r', encoding='utf-8', errors='ignore') as infile:
    with open(output_file, 'w', encoding='utf-8-sig', newline='') as outfile:  # utf-8-sig để thêm BOM
        reader = csv.reader(infile)
        writer = csv.writer(outfile)
        
        # Đọc và ghi tiêu đề
        header = next(reader)
        writer.writerow(header)
        
        # Đếm số bản ghi hợp lệ và không hợp lệ
        valid_records = 0
        invalid_records = 0
        
        # Đọc và xử lý từng dòng
        for row in reader:
            try:
                # Làm sạch cột title (cột đầu tiên)
                if len(row) >= 1:
                    row[0] = clean_non_ascii(row[0])  # Làm sạch ký tự không phải ASCII trong cột title
                
                # Chuyển đổi cột month (cột thứ 1) từ "2023-04-01 00:00:00 UTC" thành "2023-04-01"
                if len(row) >= 2:
                    row[1] = row[1].split(' ')[0]  # Lấy phần ngày (bỏ giờ và UTC)
                
                # Thử mã hóa dòng bằng utf-8
                for field in row:
                    field.encode('utf-8')
                
                # Ghi dòng vào file đầu ra
                writer.writerow(row)
                valid_records += 1
            except UnicodeEncodeError:
                invalid_records += 1
                continue

print(f"Đã xử lý xong. Số bản ghi hợp lệ: {valid_records}. Số bản ghi bị loại bỏ: {invalid_records}.")
print(f"File đã được lưu tại: {output_file}")