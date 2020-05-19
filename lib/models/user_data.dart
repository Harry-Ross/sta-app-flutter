class User {
    final String firstname;
    final String lastname;
    final String profileImg;

    factory User.fromJson(Map<String, dynamic> json) {
        return new User(
            json['firstname'], 
            json['lastname'], 
            json['profile_img'], 
        );
    }

    User(this.firstname, this.lastname, this.profileImg);
}