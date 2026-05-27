# Title: F-String Nested Quotes Syntax Error
[วันที่อัปเดต: 2026-05-26]

## 1. Summary & Current Implementation
ในสภาพแวดล้อมที่ใช้ Python เวอร์ชันต่ำกว่า 3.12 (เช่น Python 3.10 ในโปรเจกต์นี้) การเขียน f-string ที่มีคีย์ของ Dictionary ครอบด้วยเครื่องหมายคำพูดประเภทเดียวกับภายนอก (เช่น ใช้ double quotes ซ้อนกัน) จะส่งผลให้เกิด `SyntaxError: f-string: unmatched '['` 

## 2. Technical Code Snippet (Best Practice)
การหลีกเลี่ยงเครื่องหมายซ้ำซ้อนโดยสลับประเภทเครื่องหมายคำพูดด้านในนิพจน์ f-string:
```python
# ตัวอย่างที่ถูกต้อง: ด้านนอกเป็น double quotes ด้านในใช้ single quotes
logging.info(f"images desc: {img['description']} ")
logging.info(f"image_path : {metadata['image_path']}")
```

## 3. Knowledge Relationships (การเชื่อมโยงข้อมูล)
Depends On (ต้องพึ่งพา): None

Impacted By (ได้รับผลกระทบจาก): None

Contradicts (ข้อขัดแย้งที่เคยพบ): สคริปต์ `rag_pdf.py` บรรทัดที่ 204, 205 และ 311 มีการนำเครื่องหมายคำพูดคู่ไปซ้อนด้านใน ทำให้เกิด Error ทันทีเมื่อสตาร์ทรันในเวอร์ชัน 3.10
