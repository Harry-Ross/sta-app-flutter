class ActivityData {
    String category;
    String name;
    int lat;
    int long;
    int points;

    ActivityData.fromJson(Map<String, dynamic> json) {
        this.category = json['category'];
        this.name = json['name'];
        this.lat = json['lat'];
        this.long = json['long'];
        this.points = json['points'];
    } 

    ActivityData(
        this.category, 
        this.name, 
        this.lat, 
        this.long, 
        this.points
    );
}