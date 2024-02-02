import 'package:flutter/material.dart';

// entry point of app, main() is the main function
void main() {
  runApp(const MyApp());
}

// statelesswidget is that this widget does not have state
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // Widget is what Flutter uses for doing all of its drwaing and pretty much handling everything within the framework
  Widget build(BuildContext context) {
    // set up our app for us and defines the homepage for our application
    return MaterialApp(
      // MaterialApp,
      // you could hover MaterialApp and you could see all parameters to use
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.orange,
        // useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

// dart is a typed language so you need to define all the type of your parameters

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // Scaffold sets up a basic structure of a page
    // also can hold other widgets
    return Scaffold(
        appBar: AppBar(title: const Text("Hello World")),
        // Column would display widgets on top of each other
        // Row would display widgets next to each other
        // To display multiple widgets then you could use Wiidget>[here goes widgets]
        body: Column(
          children: <Widget>[TestWidget(), TestWidget(), TestWidget()],
        ));
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("Hello world test widget");
  }
}
