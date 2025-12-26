// LittleX - Improved Minimal Social Media App
// Written entirely in JAC

walker create_post {
    has text;
    has author;

    can run {
        posts = read_json("posts.json");

        post = {
            "text": text,
            "author": author,
            "likes": 0
        };

        posts.append(post);
        write_json("posts.json", posts);

        report "Post created successfully";
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
                   str(post["likes"]);
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
