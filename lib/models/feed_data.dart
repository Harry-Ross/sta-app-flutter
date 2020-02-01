class FeedData {
    String name;
    String teamName;
    String content;
    String images;

    FeedData.fromJson(Map<String, dynamic> json) {
        this.name = json['name'];
        this.teamName = json['teamname'];
        this.content = json['content'];
        this.images = json['images'];
    } 

    FeedData(this.name, this.teamName, this.content, this.images);
}