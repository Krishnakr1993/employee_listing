class User {
  
  var name;
  var username;
  var email;
  var profileImage;
  Address? address;
 
  var website;
  Company? company;

  User(
      {
      this.name,
      this.username,
      this.email,
      this.profileImage,
      this.address,
      
      this.website,
      this.company});

  User.fromJson(Map<String, dynamic> json) {
   
    name = json['name'];
    username = json['username'];
    email = json['email'];
    profileImage = json['profile_image'] != null ? json["profile_image"] : "";
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    
    website = json['website'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }else{ data['address'] = "";}
   
    data['website'] = this.website;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }else{
       data['company'] = "";
    }
    return data;
  }
}
class Address {
  var street;
  var suite;
  var city;
  var zipcode;
 

  Address({this.street, this.suite, this.city, this.zipcode,});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'] != null ? json["street"] : "";
    suite = json['suite']!= null ? json["suite"] : "";
    city = json['city']!= null ? json["city"] : "";
    zipcode = json['zipcode']!= null ? json["zipcode"] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
   
    return data;
  }
}
class Company {
  var name;
  var catchPhrase;
  var bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? json["name"] : "";
    catchPhrase = json['catchPhrase'] != null ? json["catchPhrase"] : "";
    bs = json['bs'] != null ? json["bs"] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['catchPhrase'] = this.catchPhrase;
    data['bs'] = this.bs;
    return data;
  }
}
class UserList {
  final List<User> list;
  UserList({required this.list});

  factory UserList.fromJson(List<dynamic> parsedJson) {
    var user =
    parsedJson.map((i) => User.fromJson(i)).toList();
    return new UserList(list: user);
  }
}