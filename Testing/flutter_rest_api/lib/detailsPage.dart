import 'package:flutter/material.dart';
import 'package:flutter_rest_api/homePage.dart';
import 'package:flutter_rest_api/userService.dart';

class DetailsPage extends StatelessWidget {
  final User user;
  const DetailsPage({Key? key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('${user.name.first} ${user.name.last}'),
        ),
        body: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            //creates an Image widget obtained from the network
            Image.network(user.picture),
            const SizedBox(
              height: 30,
            ),
            Text(user.email)
          ],
        )));
  }

  goBack(context) {
    print("test");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
