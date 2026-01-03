🧠 LittleX – AI-Powered Minimal Social Media App (JAC)

📌 Project Overview
LittleX is a minimal social media application built entirely using the JAC programming language.
The project demonstrates how Artificial Intelligence (AI) can be integrated into a social platform to enhance safety, interaction, and content understanding.

This project was developed as part of an academic requirement, focusing on:
Workflow-oriented programming
AI-assisted decision making
Persistent data handling
Ethical content moderation

🚀 Features

📝 Post Creation
Users can create social media posts
Posts are stored persistently in a JSON file

🛡️ AI Content Moderation
Every post is checked using an AI model
Unsafe or inappropriate content is automatically rejected

😊 AI Sentiment Analysis
Approved posts are analyzed as:
Positive
Neutral
Negative
Sentiment is stored and displayed in the feed

❤️ Like System
Users can like posts
Likes are stored and updated persistently

💬 AI-Generated Comments
AI can generate friendly replies to any post
Demonstrates AI-driven engagement

🧠 AI Feed Summary
AI summarizes all posts in the feed
Useful for quickly understanding platform activity

🧠 AI Technologies Used
LLM Integration using llm.complete
AI used for:
Content moderation
Sentiment classification
Comment generation
Feed summarization
All AI logic is embedded directly inside JAC walkers.

🛠️ Technologies
Language: JAC
AI Engine: Built-in LLM interface
Storage: JSON (posts.json)
Environment: Python + Jaclang

📂 Project Structure

littlex/
│
├── littlex.jac      # Main JAC application
├── posts.json       # Persistent post storage
└── README.md        # Project documentation

▶️ How to Run the Project

1️⃣ Install Requirements
pip install jaclang

2️⃣ Run the Application
jac run littlex.jac

🧪 Example Walkers
create_post – Create a post with AI moderation & sentiment analysis
view_feed – Display all posts
like_post – Like a post
ai_comment – Generate AI replies
summarize_feed – Summarize all posts using AI

🎓 Learning Outcomes
This project demonstrates:
Practical use of AI in software systems
Workflow-based programming using walkers
Safe AI decision-making
Persistent data handling
Ethical content moderation

🔮 Future Improvements
User authentication
Comment storage
Toxicity scoring
Trending post detection
Web or mobile interface

👨‍💻 Author
Sam Amunza
GitHub: https://github.com/Amunza254
