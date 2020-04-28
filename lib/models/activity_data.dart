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
    String id;
    String name;
    String description;
    int points;
    double lat;
    double long;
    int categoryId;
    bool completed;

    factory Activity.fromJson(Map<String, dynamic> json) {
        return new Activity(
            json['id'],
            json['name'],
            json['description'],
            json['points'],
            json['lat'],
            json['long'],
            json['category_id'],
            json['completed']
        );
    } 

    Activity(
        this.id,
        this.name,
        this.description,
        this.points,
        this.lat,
        this.long,
        this.categoryId,
        this.completed
    );
}