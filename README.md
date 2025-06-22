# RASHED: AI-Powered Fake News Detection System

RASHED is an intelligent and automated fake news detection system designed to combat digital misinformation across various media formats. Leveraging state-of-the-art NLP technologies like BERT and large language models (LLMs), RASHED can analyze text, images, and PDF files in real time, providing users with accurate, trustworthy insights.

---

## 🔍 Project Overview

In today's digital world, misinformation spreads rapidly, affecting public opinion, trust, and safety. RASHED addresses this by providing a scalable, multi-modal solution that detects fake news and suggests fact-based corrections.

Key features include:

- Multi-format input support (Text, Images, PDFs)
- Real-time misinformation detection
- Correction suggestions with confidence scores
- OCR integration for text extraction from images and documents
- Multi-language support
- Downloadable reports
- User feedback and history tracking
- Admin dashboard for model management

---

## 🎯 Project Goals

- **Accurate Detection**: Detect misinformation in various formats with high precision.
- **Real-Time Feedback**: Offer instant detection and corrective suggestions.
- **Scalable & User-Friendly**: Deliver a responsive, cross-platform system.
- **Advanced AI Integration**: Use models like BERT and LLMs for deep contextual analysis.

---

## 🧠 Technologies Used

### Frontend
- Next.js (React Framework)
- Tailwind CSS
- Redux Toolkit
- React Hook Form
- Socket.IO for real-time updates

### Backend
- Node.js with Express.js
- PostgreSQL (via Prisma ORM)
- FastAPI for ML microservices
- Redis for caching
- JWT for authentication
- Multer for file uploads

### Machine Learning & NLP
- BERT (fine-tuned for fake news detection)
- GPT-4 / Gemini LLM (for logical corrections)
- EasyOCR for image/PDF text extraction
- LIAR dataset for training and evaluation

---

## 🛠️ Key Features

- 🔤 **Multi-Modal Input**: Accepts text, images, and PDF files
- 🧠 **AI-Powered Detection**: Uses BERT and LLMs to analyze and verify content
- 📝 **Highlight & Correct**: Flags fake content and offers corrections
- 📊 **Confidence Scoring**: Shows likelihood (e.g., 87% fake)
- 🌍 **Multi-Language Support**: Designed for diverse language inputs
- 📂 **Downloadable Reports**: PDF exports of analysis
- 🔒 **Secure & Private**: SSL/TLS encryption + GDPR compliance
- 🧑‍💼 **Admin Tools**: Dashboard for managing data, users, and model updates

---

## 🚀 Installation

### Prerequisites
- Node.js
- Python 3.8+
- PostgreSQL
- Redis

### Clone the repository
```bash
git clone https://github.com/your-username/rashed-fake-news-detection.git
cd rashed-fake-news-detection
