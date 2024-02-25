import 'package:flutter/material.dart';
import 'package:flutter_rest_api/detailsPage.dart';
import 'package:flutter_rest_api/userService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = UserService().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Apis home page")),
        body: RefreshIndicator( // just to refresh page per say
            onRefresh: () async {
              var users = await UserService().getUser();
              // if want to change the state of our view then we have to use setState or otherwiser it wont re-render
              setState(() {
                futureUsers = Future.value(users);


              });
            },
            child: Center(
              child: FutureBuilder<List<User>>(
                future: futureUsers,
                builder: ((context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          User user = snapshot.data?[index];
                          return ListTile(
                            title: Text(user.email),
                            subtitle: Text(user.name.first),
                            onTap: (() => {openPage(context, user)}),
                            trailing: const Icon(Icons.chevron_right_outlined),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(color: Colors.black26);
                        },
                        itemCount: snapshot.data!.length);
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                }),
              ),
            )));
  }

  openPage(context, User user) {
    print("clicked open page button");
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailsPage(user: user)));
  }
}

// class HomePage extends StatelessWidget {
//   final items = List.generate(50, (index) => index);

// // constructor
//   HomePage({Key? key}) : super(key: key);

//   // testing getting access to the userService API
//   // LoadUser() is only a random name, not necessarily from Flutter
//   // HomePage({Key? key}) : super(key: key) {
//   //   loadUser();
//   // }

//   // loadUser() async {
//   //   final results = await UserService().getUser();
//   //   print(results.length);
//   //   results.forEach((element) {
//   //     print(element.email);
//   //   })
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Apis home page")),
//       body: ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             final item = items[index];
//             // return const Text('Test');
//             return ListTile(
//               title: Text('Item $item'),
//               subtitle: const Text("my subtitle"),
//               onTap: () => openPage(context),
//               trailing: const Icon(Icons.chevron_right_outlined),
//             );
//           }),
//     );
//   }

//   openPage(context) {
//     print("clicked open page button");
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => const DetailsPage()));
//   }
// }
