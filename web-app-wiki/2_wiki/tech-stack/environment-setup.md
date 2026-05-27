# Title: Python and CUDA PyTorch Environment Setup
[วันที่อัปเดต: 2026-05-26]

## 1. Summary & Current Implementation
การรันโมเดล RAG PDF บนเครื่องผู้ใช้ที่ใช้งาน GPU NVIDIA GeForce RTX 4060 จำเป็นต้องตั้งค่า PyTorch ด้วย CUDA 12.1 เพื่อเร่งการทำงานของโมเดล SentenceTransformer (`intfloat/multilingual-e5-base`) และ MT5 Summarizer ในการทำความเข้าใจข้อความภาษาไทยและสร้างเวกเตอร์ความหมาย

## 2. Technical Code Snippet (Best Practice)
```powershell
# สร้าง virtual environment และติดตั้งแพ็กเกจด้วย CUDA GPU
python -m venv .venv
.venv\Scripts\activate
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
pip install -r requirements.txt sentence-transformers sentencepiece
```

## 3. Knowledge Relationships (การเชื่อมโยงข้อมูล)
Depends On (ต้องพึ่งพา): [[tech-stack/local-models.md]] (ใช้ Ollama เพื่อรันโมเดลสร้างคำตอบ)

Impacted By (ได้รับผลกระทบจาก): None

Contradicts (ข้อขัดแย้งที่เคยพบ): requirements.txt ดั้งเดิมขาด `sentence-transformers` และ `sentencepiece` ทำให้เกิด ImportError ตอนประมวลผลข้อความด้วยโมเดลท้องถิ่น
