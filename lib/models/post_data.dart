class PostData {
    List<Post> posts;

    factory PostData.fromJson(List<dynamic> parsedJson) {
        List<Post> posts = new List<Post>();
        posts = parsedJson.map((i) => Post.fromJson(i)).toList();

        return new PostData(posts);
    }

    PostData(this.posts);
}

class Post {
    final String name;
    final String teamName;
    final String content;
    final String images;
    final String profileImg;

    factory Post.fromJson(Map<String, dynamic> json) {
        return new Post(
            json['user_id'], 
            json['team_id'], 
            json['content'], 
            json['images'], 
            json['id']
        );
    }

    Post(this.name, this.teamName, this.content, this.images, this.profileImg);
}