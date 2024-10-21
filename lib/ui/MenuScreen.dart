



import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea( // Thêm SafeArea để tránh tràn
      child: Container(
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const MenuItem(icon: Icons.home, label: "Home", isSelected: true),
            const MenuItem(icon: Icons.person, label: "Profile"),
            const MenuItem(icon: Icons.location_on, label: "Nearby"),
            const Divider(color: Colors.white, height: 30),
            const MenuItem(icon: Icons.bookmark, label: "Bookmark"),
            const MenuItem(icon: Icons.notifications, label: "Notification"),
            const MenuItem(icon: Icons.message, label: "Message"),
            const Divider(color: Colors.white, height: 30),
            const MenuItem(icon: Icons.settings, label: "Setting"),
            const MenuItem(icon: Icons.help, label: "Help"),
            const MenuItem(icon: Icons.logout, label: "Logout"),
          ],
        ),
      ),
    );
  }
}

// Mục menu
class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.label,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white70,
          ),
          SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 16,
            ),
          ),
          if (isSelected) Spacer(), // Tạo khoảng trống giữa icon và indicator
          if (isSelected)
            Container(
              width: 6,
              height: 40,
              decoration: const BoxDecoration(
                 color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                ),
              ),
            ),
        ],
      ),
    );
  }
}