class ActivityData {
    List<Activity> activities;

    factory ActivityData.fromJson(List<dynamic> parsedJson) {
        List<Activity> activities = new List<Activity>();
        activities = parsedJson.map((i) => Activity.fromJson(i)).toList();

        return new ActivityData(activities);
    }

    ActivityData(this.activities);
}

class Activity {
    String category;
    String name;
    String description;
    double lat;
    double long;
    int points;
    bool completed;

    factory Activity.fromJson(Map<String, dynamic> json) {
        return new Activity(
            json['category'],
            json['name'],
            json['description'],
            json['lat'],
            json['long'],
            json['points'],
            json['completed']
        );
    } 

    Activity(
        this.category, 
        this.name, 
        this.description, 
        this.lat, 
        this.long, 
        this.points,
        this.completed
    );
}