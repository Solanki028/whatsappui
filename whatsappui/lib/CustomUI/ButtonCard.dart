import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key, required this.name, required this.icon}) : super(key: key);

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          child: Icon(
            icon,
            size: 26,
            color: Colors.white, // Fix: Set the color of the icon here
          ),
          backgroundColor: Color(0xFF25D366),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
