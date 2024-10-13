import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: TColors.subPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                // Handle search query here
              },
            ),
            // Optionally display search results here
          ],
        ),
      ),
    );
  }
}
