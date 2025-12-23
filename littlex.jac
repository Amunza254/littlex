# LittleX - Minimal Social App (JAC)

walker create_post(string text) {
    posts = file::read_json("posts.json");
    if posts == None {
        posts = [];
    }
    posts.append(text);
    file::write_json("posts.json", posts);
    report "Post added!";
}

walker view_feed {
    posts = file::read_json("posts.json");
    if posts == None or posts == [] {
        report "No posts yet.";
    }
    for p in posts {
        report p;
    }
}
