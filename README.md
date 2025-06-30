### User reviews as market signals: What's the next best business opportunity?
![image](https://github.com/user-attachments/assets/9f25b774-1a14-4ea2-be1f-d02bf97a65b2)


This project analyzes Yelp user reviews to uncover valuable business insights using state-of-the-art NLP techniques.
It combines BERTopic for topic modeling and RoBERTa for sentiment analysis to identify the most discussed themes and emotional tones in customer feedback.

![image](https://github.com/user-attachments/assets/807706a1-17ac-436f-937b-e652469dabf8)

### 🔗 View the Presentation here:

https://gamma.app/docs/Yelp-Final-Presentation-2406-z88kyp7qc3xe4x7

### 🎯 Key Goals

Understand what customers talk about most

Classify reviews by positive or negative sentiment

Identify top-performing business categories and metro areas

Ideal for exploring how Natural Language Processing (NLP) can drive data-driven decision-making in local businesses.

### ⚙️ Installation Instructions

Make sure you have Python 3.9+ installed. Then clone the repo and install dependencies:

pip install -r requirements.txt

### ▶️ Usage (How to Run Code or Notebooks)

Explore the data and modeling in the notebooks/ directory.

Connect to the database using your .env file (see .env.example).

Example entry point:

from bertopic import BERTopic
from sentence_transformers import SentenceTransformer
from transformers import pipeline

Load custom embedding model
embedding_model = SentenceTransformer("intfloat/e5-large-v2")
topic_model = BERTopic(embedding_model=embedding_model)

Load sentiment analysis pipeline
sentiment = pipeline("sentiment-analysis", model="cardiffnlp/twitter-roberta-base-sentiment")

### 📊 Example Results

Category distribution tree map

![image](https://github.com/user-attachments/assets/df9182de-5d39-4bbf-a2de-c986e3e1d93c)

Topic distribution bar charts

![image](https://github.com/user-attachments/assets/80e9ddad-b6d8-4575-aed8-5c782a9ee466)

Top business opportunities by key category

![image](https://github.com/user-attachments/assets/0d34626f-ca15-44c0-a503-c6d8457d944f)

Positive vs. negative sentiment by metro area

![image](https://github.com/user-attachments/assets/e0bb2856-f299-4953-88a3-ecc94e269647)

Visualizations available in the notebooks and final report.

### 🧰 Infrastructure

Database: AWS RDS (PostgreSQL)

Access Tools: DBeaver for manual SQL queries, SQLAlchemy for Python

Environment Variables: Managed via .env and python-dotenv

### 👥 Author Info and Contact

Maria Badanova | [LinkedIn](https://www.linkedin.com/in/maria-badanova/)

Maximilian Wels | [LinkedIn](https://www.linkedin.com/in/maximilian-wels-76025810b/)

