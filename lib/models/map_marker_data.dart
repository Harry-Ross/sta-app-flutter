class MapMarkerData {
    String name;
    int lat;
    int long;

    MapMarkerData.fromJson(Map<String, dynamic> json) {
        this.name = json['name'];
        this.lat = json['lat'];
        this.long = json['long'];
    } 

    MapMarkerData(this.name, this.lat, this.long);
}