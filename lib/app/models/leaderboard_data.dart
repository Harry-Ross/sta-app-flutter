class LeaderboardData {
    String team;
    String names;
    dynamic points;

    LeaderboardData.fromJson(Map<String, dynamic> json) {
        this.team = json['team'];
        this.names = json['names'];
        this.points = json['points'];
    } 

    LeaderboardData(this.team, this.names, this.points);
}