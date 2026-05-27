# 🛠️ Agent Skills Registry
[วันที่อัปเดต: 2026-05-28]

คลังรวบรวมทักษะ (Skills) ที่ติดตั้งในโครงการเพื่อเลือกใช้งานตามลักษณะของภารกิจ (Task)

---

## 📂 Categories & Mappings

### 1. พัฒนาและออกแบบ (Development & Design)

| สกิล (Skill) | ตำแหน่งไฟล์อ้างอิง | ภารกิจที่เหมาะสม (Suitable Tasks) |
| :--- | :--- | :--- |
| **Fullstack Developer** | `.Agent/Fullstack Developer/FullStack-Skill.md`<br>`.Agent/Fullstack Developer/FullStack-Agent.md` | การเพิ่มฟีเจอร์ใหม่แบบ end-to-end, แก้ไข API/GAS backend, การทำ data model หรือเชื่อม Google Sheets, จัดการระบบ Roles & Permissions (RBAC) หรือ Image flow |
| **Frontend Design** | `.Agent/Frontend-Design/SKILL.md` | พัฒนาและปรับปรุงความสวยงามของเว็บ (UI/UX), การสร้าง component, การจัดธีม (Minimal monochrome, Apple-style) |
| **Frontend Slides** | `.Agent/frontend-slides/SKILL.md` | สร้างพรีเซนเตชัน HTML ที่มีอนิเมชันสวยงาม, แปลงไฟล์ PowerPoint (.pptx) เป็นหน้าเว็บสไลด์อัตราส่วน 16:9, ส่งออกสไลด์เป็น PDF |
| **MCP Builder** | `.Agent/mcp-builder/SKILL.md` | พัฒนา Model Context Protocol (MCP) server ใน Python หรือ Node/TypeScript เพื่อเชื่อมต่อ API ภายนอก |

### 2. การทดสอบและแก้ไขจุดบกพร่อง (Testing & Debugging)

| สกิล (Skill) | ตำแหน่งไฟล์อ้างอิง | ภารกิจที่เหมาะสม (Suitable Tasks) |
| :--- | :--- | :--- |
| **Bug Reviewer** | `.Agent/Bug Reviewer/Bug-Skill.md`<br>`.Agent/Bug Reviewer/Bug-Agent.md` | วิเคราะห์และแก้ไขบั๊กเฉพาะเจาะจงในระบบ QSMS Rework (เช่น build-time error, API payload mismatch, state, persistence, auth) |
| **Debugger Agent** | `.Agent/Debugger/Debugger.md.md` | ดีบั๊กปัญหาซับซ้อนในเชิงระบบ, concurrency (race conditions, deadlocks), memory leaks, performance profiling |
| **Webapp Testing** | `.Agent/webapp-testing/SKILL.md` | เขียนและรันการทดสอบ UI / End-to-End (E2E) automation ด้วย Playwright ในโปรเจกต์เว็บ |

### 3. ความปลอดภัยและการตรวจสอบ (Security & QA)

| สกิล (Skill) | ตำแหน่งไฟล์อ้างอิง | ภารกิจที่เหมาะสม (Suitable Tasks) |
| :--- | :--- | :--- |
| **Security Auditor** | `.Agent/Security Auditor/security-auditor.md` | ตรวจประเมินความปลอดภัย, compliance assessment (SOC 2, ISO 27001), ตรวจสอบความแข็งแกร่งของ access control, การเข้ารหัสข้อมูล |
| **Grill with Docs** | `.Agent/grill with docs.md` | stress-test แผนงานพัฒนากับผู้ใช้, ท้าทายความเข้าใจด้วย domain language และ glossary ใน CONTEXT.md, การเขียน ADR (Architectural Decision Records) |
| **Skill Creator** | `.Agent/skill-creator/SKILL.md` | สร้างทักษะใหม่, แก้ไขหรือเพิ่มประสิทธิภาพทักษะเดิม, ทดสอบและรัน eval ทักษะ |

### 4. กระบวนการเวิร์กโฟลว์ (Workflow & Process - Superpowers)

ทักษะระดับระบบเพื่อจัดการขั้นตอนการพัฒนาและเพิ่มความน่าเชื่อถือของการส่งมอบงาน:

- **brainstorming** — ใช้ระดมสมอง คิดไอเดีย ออกแบบสถาปัตยกรรมก่อนลงมือโค้ดจริง
- **writing-plans** — เขียนแผนการพัฒนาระบบที่มีรายละเอียดเป็นขั้นตอน พร้อมจุดตรวจสอบ
- **executing-plans** — ดำเนินการและติดตามงานตามแผนงานที่เขียนไว้อย่างเป็นขั้นตอน
- **systematic-debugging** — แก้บั๊กทั่วไปอย่างเป็นระบบตามหลักวิจัยหา root cause
- **test-driven-development** — พัฒนาแบบเน้นการเขียนชุดทดสอบก่อนเขียนโค้ดฟีเจอร์
- **verification-before-completion** — ตรวจสอบความถูกต้องและรันคอมมานด์ทดสอบก่อนรายงานความสำเร็จ หรือก่อน commit/PR
- **finishing-a-development-branch** — ขั้นตอนการจบฟีเจอร์และรวมงานเข้าสู่ branch หลัก
- **dispatching-parallel-agents** — แบ่งงานที่ไม่เกี่ยวข้องกันให้เอเจนต์ตัวอื่นรันขนานกัน
- **using-git-worktrees** — แยกการทำงานฟีเจอร์เพื่อไม่ให้กระทบ workspace หลักด้วย Git Worktree
