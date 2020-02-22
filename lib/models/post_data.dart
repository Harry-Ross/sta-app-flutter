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
            json['name'], 
            json['teamName'], 
            json['content'], 
            json['images'], 
            json['profileImg']
        );
    }

    Post(this.name, this.teamName, this.content, this.images, this.profileImg);
}