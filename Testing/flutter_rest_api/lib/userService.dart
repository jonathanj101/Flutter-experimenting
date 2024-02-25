//  import http package
import "package:http/http.dart" as http;
import "dart:convert"; // encode and decode data

// go to randomuser.me to see data results

// class that extract data from randomuser api, user's name specifically
class Name {
  final String first;
  final String last;

  const Name({required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(first: json['first'], last: json['last']);
  }
}

// class that extract user data email picture and the class Name

class User {
  final String email;
  final String picture;
  final Name name;
  const User({required this.email, required this.picture, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json["email"],
        picture: json['picture']['medium'],
        name: Name.fromJson(json['name']));
  }
}

class UserService {
  // Future is the similar to Javascript Promise, but in Flutter/Dart
  Future<List<User>> getUser() async {
    final response = await http
        .get(Uri.parse("https://randomuser.me/api?results=50"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<User> list = [];
      for (var i = 0; i < data['results'].length; i++) {
        final entry = data["results"][i];
        list.add(User.fromJson(entry));
      }
      return list;
    } else {
      throw Exception("HTTP Failed");
    }
  }
}
