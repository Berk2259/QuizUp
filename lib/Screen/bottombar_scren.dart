import 'package:flutter/material.dart';
import 'package:quizup/Screen/screen.dart';

class BottombarScren extends StatefulWidget {
  BottombarScren({super.key});

  @override
  State<BottombarScren> createState() => _BottombarScrenState();
}

class _BottombarScrenState extends State<BottombarScren> {
  int selectedIndex = 0;
  final List<Widget> page = [
    HomeScreen(),
    LeaderboardScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: page[selectedIndex],
      bottomNavigationBar: customBottomNavBar(),
    );
  }

  Widget customBottomNavBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomBarItem(context, Icons.home, 0),
            bottomBarItem(context, Icons.leaderboard, 1),
            bottomBarItem(context, Icons.bookmark, 2),
            bottomBarItem(context, Icons.person, 3),
          ],
        ),
      ),
    );
  }

  Widget bottomBarItem(BuildContext context, IconData icon, int index) {
    bool isSelected = selectedIndex == index;
    double iconSize = MediaQuery.of(context).size.width * 0.08;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(isSelected ? 8 : 4),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.1 : 1.0, // seçili ikon büyür
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Icon(
                icon,
                size: iconSize,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
            if (isSelected)
              Positioned(
                top: -6,
                right: -2,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
