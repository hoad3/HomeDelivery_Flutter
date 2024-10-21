import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_1/ui/DetailProduct.dart';
import 'package:test_1/ui/MenuScreen.dart';
import 'package:test_1/ui/HomeScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey[300]
      ),
    home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Gán key vào Scaffold
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.house), // Biểu tượng nhà
            onPressed: () {
              // Điều hướng đến trang HouseDetailPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HouseDetailPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: MenuScreen(), // Gọi MenuScreen trong Drawer
      ),
      body: SafeArea(child: HomeScreen(

      )
      )
    );
  }
}