# User reviews as market signals: What's the next best business opportunity?

![Python](https://img.shields.io/badge/Python-3.9%2B-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Made with Jupyter](https://img.shields.io/badge/Made%20with-Jupyter-orange?logo=Jupyter)
![Database: PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-blue?logo=postgresql)
![NLP: Hugging Face](https://img.shields.io/badge/NLP-HuggingFace-yellow)

This project analyzes Yelp user reviews to uncover valuable business insights using state-of-the-art NLP techniques.
It combines BERTopic for topic modeling and RoBERTa for sentiment analysis to identify the most discussed themes and emotional tones in customer feedback.

![image](https://github.com/user-attachments/assets/807706a1-17ac-436f-937b-e652469dabf8)

### 🔗 View the Presentation here:

https://gamma.app/docs/Yelp-Final-Presentation-2406-z88kyp7qc3xe4x7

### 🎯 Key Goals

- Understand what customers talk about most

- Classify reviews by positive or negative sentiment

- Identify top-performing business categories and metro areas

- Ideal for exploring how Natural Language Processing (NLP) can drive data-driven decision-making in local businesses.

### ⚙️ Installation Instructions

- Make sure you have Python 3.9+ installed. Then clone the repo and install dependencies:

- pip install -r requirements.txt

### ▶️ Usage (How to Run Code or Notebooks)

- Explore the data and modeling in the notebooks/ directory.

- Connect to the database using your .env file (see .env.example).

### 🧠 NLP Implementation Overview
```python
from bertopic import BERTopic
from sentence_transformers import SentenceTransformer
from transformers import pipeline
```

### 🔍 Custom Embedding Model
- We use intfloat/e5-large-v2 from the sentence-transformers library to generate semantic embeddings:
```python
embedding_model = SentenceTransformer("intfloat/e5-large-v2")
topic_model = BERTopic(embedding_model=embedding_model)
```

### 💬 RoBERTa Sentiment Analysis
- Sentiment classification is performed using the pre-trained cardiffnlp/twitter-roberta-base-sentiment model:
```python
sentiment = pipeline("sentiment-analysis", model="cardiffnlp/twitter-roberta-base-sentiment")
```
### 🔄 Pipeline Logic

### 💡 Sentiment Analysis (RoBERTa)
- Each review is classified as **positive**, **neutral**, or **negative**  
- Long reviews (>512 tokens) are **split into chunks** before classification  
- A **random sample** of reviews is used for scalable processing  

### 🗂️ Topic Modeling (BERTopic)
- Performed on a **stratified sample** to preserve niche topics  
- Uses a **custom stop word list** to improve semantic clarity  
- Topics are built with a **minimum of 50 documents per cluster**  
- Final results are **filtered** to retain only meaningful, distinct topics  

### 📊 Example Results

### 📂 Category distribution tree map  
Shows how business categories are distributed across the dataset.

![image](https://github.com/user-attachments/assets/df9182de-5d39-4bbf-a2de-c986e3e1d93c)

### 📊 Topic distribution bar charts  
Top topics extracted via BERTopic with frequency.

![image](https://github.com/user-attachments/assets/80e9ddad-b6d8-4575-aed8-5c782a9ee466)

### 💼 Top business opportunities by key category  
Distribution of Categories within high sentiment metro areas.

![image](https://github.com/user-attachments/assets/0d34626f-ca15-44c0-a503-c6d8457d944f)

### 🏙️ Positive sentiment by metro area  
Topic sentiment mapping across cities based on review analysis.

![image](https://github.com/user-attachments/assets/e0bb2856-f299-4953-88a3-ecc94e269647)

📝 All visualizations are available in the project notebooks and final presentation.

### 🧰 Infrastructure

- Database: AWS RDS (PostgreSQL)
- Access Tools: DBeaver for manual SQL queries, SQLAlchemy for Python
- Environment Variables: Managed via .env and python-dotenv

### 👥 Author Info and Contact

Maria Badanova | [LinkedIn](https://www.linkedin.com/in/maria-badanova/)

Maximilian Wels | [LinkedIn](https://www.linkedin.com/in/maximilian-wels-76025810b/)

### 📄 License

This project is released under the MIT License.  
Please see the [LICENSE](./LICENSE) file for details.

### 🧠 Third-Party Libraries and Models

This project uses several open-source libraries and models, including:

- [BERTopic](https://github.com/MaartenGr/BERTopic) (MIT License)
- [sentence-transformers](https://github.com/UKPLab/sentence-transformers) (Apache 2.0 License)
- [transformers (by Hugging Face)](https://github.com/huggingface/transformers) (Apache 2.0 License)
- [cardiffnlp/twitter-roberta-base-sentiment](https://huggingface.co/cardiffnlp/twitter-roberta-base-sentiment) – Model licensed under MIT

Please refer to the respective repositories for full license terms.

