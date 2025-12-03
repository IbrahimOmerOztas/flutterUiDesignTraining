import 'package:flutter/material.dart';

class MinimalMobileApp extends StatefulWidget {
  const MinimalMobileApp({super.key});

  @override
  State<MinimalMobileApp> createState() => _MinimalMobileAppState();
}

class _MinimalMobileAppState extends State<MinimalMobileApp> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [_buildHomePage()],
        ),
      ),
    );
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 20), _builderHeader()],
        ),
      ),
    );
  }

  Widget _builderHeader() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: BoxBorder.all(color: Colors.black, width: 1),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("deneme deneme"),
                  SizedBox(height: 5),

                  Text("deneme deneme"),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),

          Container(
            decoration: BoxDecoration(
              border: BoxBorder.all(color: Colors.black, width: 1),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("deneme deneme"),
                  SizedBox(height: 5),

                  Text("deneme deneme"),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              border: BoxBorder.all(color: Colors.black, width: 1),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("deneme deneme"),
                  SizedBox(height: 5),

                  Text("deneme deneme"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
