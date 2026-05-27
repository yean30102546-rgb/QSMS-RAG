# Title: Gradio 6 Chatbot Initialization Error
[วันที่อัปเดต: 2026-05-26]

## 1. Summary & Current Implementation
เมื่อทำการอัปเกรด Gradio เป็นเวอร์ชัน 6.0+ การเรียกใช้ `gr.Chatbot(type="messages")` จะส่งผลให้แอปพลิเคชันล่มทันทีด้วยข้อผิดพลาด `TypeError: Chatbot.__init__() got an unexpected keyword argument 'type'` เนื่องจาก Gradio 6+ ตัดพารามิเตอร์ `type` ออกไปแล้ว และกำหนดให้แชทบอทประมวลผลข้อมูลในรูปแบบข้อความ (dictionary-based messages) เป็นมาตรฐานหลักเพียงแบบเดียว

## 2. Technical Code Snippet (Best Practice)
การสร้าง Chatbot ใน Gradio 6+ โดยไม่ต้องระบุอาร์กิวเมนต์ `type`:
```python
# แนวทางแก้ไข: นำคีย์เวิร์ด type ออกทั้งหมด
chatbot = gr.Chatbot()
```

## 3. Knowledge Relationships (การเชื่อมโยงข้อมูล)
Depends On (ต้องพึ่งพา): None

Impacted By (ได้รับผลกระทบจาก): [[tech-stack/environment-setup.md]] (เวอร์ชันของ Gradio ที่อัปเดตใหม่จากการดาวน์โหลดแพ็กเกจในปัจจุบัน)

Contradicts (ข้อขัดแย้งที่เคยพบ): โค้ดดั้งเดิมของโปรเจกต์มีการเขียน `type="messages"` ซึ่งเข้ากันไม่ได้กับไลบรารี Gradio เวอร์ชันใหม่ ทำให้เซิร์ฟเวอร์สตาร์ทไม่ขึ้น
