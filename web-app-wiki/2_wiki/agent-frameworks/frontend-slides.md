# Title: Frontend Slides Skill
[วันที่อัปเดต: 2026-05-28]

## 1. Summary & Current Implementation
ทักษะ (Skill) สำหรับสร้างพรีเซนเตชัน HTML ที่มีอนิเมชันสวยงามจากศูนย์ หรือแปลงจากไฟล์ PowerPoint (.pptx) รองรับการแสดงผลแบบสัดส่วนคงที่ 16:9 (1920x1080 stage) โดยสามารถแสดงตัวอย่างดีไซน์แบบ visual ให้เลือกใช้ก่อนพัฒนาจริง เพื่อความสวยงามที่ทันสมัยและไม่ซ้ำซาก (Anti-AI-Slop)

ติดตั้งไว้ในระบบ `.Agent/frontend-slides/` ในโปรเจกต์นี้

## 2. Technical Code Snippet (Best Practice)
การใช้งานและการแปลงไฟล์ PowerPoint เป็น HTML:
```bash
# 1. การแปลงไฟล์ PPTX ในสภาพแวดล้อม
.venv/Scripts/python .Agent/frontend-slides/scripts/extract-pptx.py input.pptx output_dir/

# 2. การคอมไพล์สไลด์และการส่งออก PDF (ต้องการ node & playwright)
bash .Agent/frontend-slides/scripts/export-pdf.sh ./slides.html ./output.pdf
```

## 3. Knowledge Relationships (การเชื่อมโยงข้อมูล)
Depends On (ต้องพึ่งพา): [[tech-stack/environment-setup.md]] (ต้องใช้ python-pptx ซึ่งได้รับการบันทึกใน requirements.txt และติดตั้งใน .venv แล้ว)

Impacted By (ได้รับผลกระทบจาก): None

Contradicts (ข้อขัดแย้งที่เคยพบ): หลีกเลี่ยงการใช้ system fonts และ responsive breakpoints ที่ซับซ้อน โดยใช้การสเกล stage แบบ viewport-base.css เพื่อล็อกอัตราส่วน 16:9 เสมอ
