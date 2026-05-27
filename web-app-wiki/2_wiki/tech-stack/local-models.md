# Title: Local Ollama Models Configuration
[วันที่อัปเดต: 2026-05-26]

## 1. Summary & Current Implementation
โปรเจกต์นี้ใช้งาน LLM ผ่าน Ollama สำหรับการประมวลผลข้อความจาก PDF (RAG) โดยมีการสร้าง Custom Models ท้องถิ่น ได้แก่ `pdf-qwen`, `pdf-llama` และ `pdf-gemma` ที่ผ่านการปรับแต่ง System Prompt ผ่าน Modelfiles เพื่อบังคับให้ตอบเฉพาะข้อมูลในบริบทภาษาไทย และส่งคืนรูปภาพประกอบในรูปแบบมาร์กดาวน์หากจำเป็น

## 2. Technical Code Snippet (Best Practice)
คำสั่งสคริปต์สำหรับการลบและสร้างโมเดลใหม่ในระบบ Windows:
```powershell
$ollama = "$env:LOCALAPPDATA\Programs\Ollama\ollama.exe"
# ดึง base model
& $ollama pull qwen2.5:1.5b
# สร้างโมเดลแบบกำหนดเองจาก Modelfile
& $ollama create pdf-qwen -f Modelfile-qwen
```

## 3. Knowledge Relationships (การเชื่อมโยงข้อมูล)
Depends On (ต้องพึ่งพา): None

Impacted By (ได้รับผลกระทบจาก): [[tech-stack/environment-setup.md]] (ต้องใช้ตัวโปรแกรม Ollama ที่ติดตั้งในเครื่องและเปิดบริการไว้ในเบื้องหลัง)

Contradicts (ข้อขัดแย้งที่เคยพบ): โมเดล `gemma3:1b` เกิดความล้มเหลวตอนดึงข้อมูล (EOF) จึงสลับมาให้โปรแกรมใช้งาน `pdf-qwen` เป็นหลักเพื่อความเสถียร
