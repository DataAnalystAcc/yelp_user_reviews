# yelp_user_reviews

yelp_user_reviews

📝 Project Title and Description

User reviews as market signals: What's the next best business opportunity?

This project analyzes Yelp user reviews to uncover valuable business insights using state-of-the-art NLP techniques.
It combines BERTopic for topic modeling and RoBERTa for sentiment analysis to identify the most discussed themes and emotional tones in customer feedback.

🎯 Key Goals

Understand what customers talk about most

Classify reviews by positive or negative sentiment

Identify top-performing business categories and metro areas

Ideal for exploring how Natural Language Processing (NLP) can drive data-driven decision-making in local businesses.

⚙️ Installation Instructions

Make sure you have Python 3.9+ installed. Then clone the repo and install dependencies:

pip install -r requirements.txt

▶️ Usage (How to Run Code or Notebooks)

Explore the data and modeling in the notebooks/ directory.

Connect to the database using your .env file (see .env.example).

Example entry point:

from bertopic import BERTopic
from sentence_transformers import SentenceTransformer
from transformers import pipeline

# Load custom embedding model
embedding_model = SentenceTransformer("intfloat/e5-large-v2")
topic_model = BERTopic(embedding_model=embedding_model)

# Load sentiment analysis pipeline
sentiment = pipeline("sentiment-analysis", model="cardiffnlp/twitter-roberta-base-sentiment")

📊 Example Results or Screenshots

Topic distribution bar charts

Positive vs. negative sentiment by metro area

Top business opportunities by key category

Visualizations available in the notebooks and final report.

🧰 Infrastructure

Database: AWS RDS (PostgreSQL)

Access Tools: DBeaver for manual SQL queries, SQLAlchemy for Python

Environment Variables: Managed via .env and python-dotenv

👥 Author Info and Contact

Maria Badanova – badanovamaria1@gmail.com

Maximilian Wels – maximilian.wels91@gmail.com

🔗 Link to Presentation

View the final presentation
https://gamma.app/docs/Yelp-Final-Presentation-2406-z88kyp7qc3xe4x7
