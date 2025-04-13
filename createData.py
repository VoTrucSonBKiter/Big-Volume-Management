import csv

# Đường dẫn file đầu vào và đầu ra
input_file = 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/monthly_views_2023_cleaned_v2.csv'
output_file = 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/monthlyview2023_1tr.csv'

# Số bản ghi tối đa muốn lấy
max_records = 1000000

# Đọc và ghi file
with open(input_file, 'r', encoding='utf-8') as infile:
    with open(output_file, 'w', encoding='utf-8-sig', newline='') as outfile:
        reader = csv.reader(infile)
        writer = csv.writer(outfile)
        
        # Đọc và ghi tiêu đề
        header = next(reader)
        writer.writerow(header)
        
        # Đọc và ghi 1 triệu bản ghi đầu tiên
        record_count = 0
        for row in reader:
            if record_count >= max_records:
                break
            writer.writerow(row)
            record_count += 1

print(f"Đã tạo file {output_file} với {record_count} bản ghi.")