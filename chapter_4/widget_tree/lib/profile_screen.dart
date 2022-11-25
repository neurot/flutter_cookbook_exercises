import 'package:flutter/material.dart';
import 'package:widget_tree/star.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doggy Style')),
      body: Stack(
        children: <Widget>[
          Image.asset('assets/beach.jpg'),
          Transform.translate(
              offset: const Offset(0, 100),
              child: Column(
                children: <Widget>[
                  _buildProfileImage(context),
                  _buildProfileDetails(context),
                  _buildActions(context),
                ],
              ))
        ],
      ),
    );
  }
}

Widget _buildProfileImage(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: 200,
      height: 200,
      child: ClipOval(
        child: Image.asset(
          'assets/dog.jpg',
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
  );
}

Widget _buildProfileDetails(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Wolfram Barkovich',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
        const StarRating(
          value: 4,
        ),
        _buildDetailRow('Age', '4'),
        _buildDetailRow('Status', 'Good Boy'),
      ],
    ),
  );
}

Widget _buildDetailRow(String heading, String value) {
  return Row(
    children: <Widget>[
      Text(
        '$heading: ',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(value),
    ],
  );
}

Widget _buildActions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      _buildIcon(Icons.restaurant, 'Feed'),
      _buildIcon(Icons.favorite, 'Pet'),
      _buildIcon(Icons.directions_walk, 'Walk'),
    ],
  );
}

Widget _buildIcon(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: <Widget>[
        Icon(icon, size: 40),
        Text(text),
      ],
    ),
  );
}
