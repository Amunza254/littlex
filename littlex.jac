// LittleX - AI-Powered Minimal Social Media App
// Written entirely in JAC
// Features: Posts, Likes, AI Moderation, Sentiment Analysis, AI Summary

walker create_post {
    has text;
    has author;

    can run {
        posts = read_json("posts.json");

        // 🛡️ AI CONTENT MODERATION
        moderation = llm.complete(
            model="gpt-4",
            prompt="Is this content safe for a social media platform? Answer YES or NO:\n" + text
        );

        if "NO" in moderation {
            report "Post rejected due to unsafe content";
            exit;
        }

        // 😊 AI SENTIMENT ANALYSIS
        sentiment = llm.complete(
            model="gpt-4",
            prompt="Classify the sentiment as Positive, Neutral, or Negative:\n" + text
        );

        post = {
            "text": text,
            "author": author,
            "likes": 0,
            "sentiment": sentiment
        };

        posts.append(post);
        write_json("posts.json", posts);

        report "Post created successfully (" + sentiment + ")";
    }
}

walker view_feed {
    can run {
        posts = read_json("posts.json");

        if len(posts) == 0 {
            report "No posts yet";
        }

        for post in posts {
            report post["author"] + ": " +
                   post["text"] + " ❤️ " +
                   str(post["likes"]) +
                   " [" + post["sentiment"] + "]";
        }
    }
}

walker like_post {
    has index;

    can run {
        posts = read_json("posts.json");

        if index < 0 or index >= len(posts) {
            report "Invalid post index";
        } else {
            posts[index]["likes"] += 1;
            write_json("posts.json", posts);
            report "Post liked successfully";
        }
    }
}

walker ai_comment {
    has index;

    can run {
        posts = read_json("posts.json");

        if index < 0 or index >= len(posts) {
            report "Invalid post index";
            exit;
        }

        reply = llm.complete(
            model="gpt-4",
            prompt="Write a friendly short reply to this post:\n" + posts[index]["text"]
        );

        report "AI Comment: " + reply;
    }
}

walker summarize_feed {
    can run {
        posts = read_json("posts.json");

        if len(posts) == 0 {
            report "No posts to summarize";
            exit;
        }

        content = "";
        for post in posts {
            content += post["author"] + ": " + post["text"] + "\n";
        }

        summary = llm.complete(
            model="gpt-4",
            prompt="Summarize these social media posts:\n" + content
        );

        report summary;
    }
}
