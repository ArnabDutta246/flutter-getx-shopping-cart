import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Text(
            'Lets find your\nfavourite food!',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            margin: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Text(
            "Available Items",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
