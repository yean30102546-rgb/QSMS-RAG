# Title: Transformers MT5Tokenizer Import Issue
[วันที่อัปเดต: 2026-05-26]

## 1. Summary & Current Implementation
ในไลบรารี Hugging Face `transformers` เวอร์ชันใหม่ๆ คลาส `MT5Tokenizer` ได้ถูกดึงออกจากระดับบนสุดของไลบรารี ส่งผลให้การทำงานของโปรแกรมเก่าที่นำเข้าโดยตรงเกิด `ImportError: cannot import name 'MT5Tokenizer' from 'transformers'` ทางออกคือการใช้ `AutoTokenizer` หรือใช้ `T5Tokenizer` แทน หรือเพิ่มโค้ดป้องกันแบบ Fallback ในกรณีที่หา `MT5Tokenizer` ใน API สแตนดาร์ดไม่พบ

## 2. Technical Code Snippet (Best Practice)
ใช้การตรวจจับ ImportError เพื่อนำคลาส T5Tokenizer มาทดแทนพร้อมตั้งชื่อเล่นเป็น MT5Tokenizer:
```python
from transformers import MT5ForConditionalGeneration
try:
    from transformers import MT5Tokenizer
except ImportError:
    from transformers import T5Tokenizer as MT5Tokenizer
```

## 3. Knowledge Relationships (การเชื่อมโยงข้อมูล)
Depends On (ต้องพึ่งพา): [[tech-stack/environment-setup.md]] (จำเป็นต้องมีไลบรารี `sentencepiece` ติดตั้งอยู่ด้วย ไม่เช่นนั้น T5Tokenizer จะไม่ทำงาน)

Impacted By (ได้รับผลกระทบจาก): None

Contradicts (ข้อขัดแย้งที่เคยพบ): โค้ดต้นแบบของโครงการทำการนำเข้า `MT5Tokenizer` ทันทีที่บรรทัดที่ 13 ทำให้เกิดปัญหาหากใช้งานสภาพแวดล้อมแพ็กเกจแบบใหม่
