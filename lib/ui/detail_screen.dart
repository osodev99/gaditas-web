import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                ),
              ),
            ],
          ),
          Center(child: Placeholder(fallbackHeight: 200)),
          Text(
            'Air Max 270 React',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Text('\$150'),
          Row(
            children: [
              for (int i = 0; i < 5; i++) Icon(Icons.star),
              Text('4,7'),
              Text('(147) Reviews'),
            ],
          ),
          Row(
            children: [
              Container(width: 30, height: 30, color: Colors.red),
              Container(width: 30, height: 30, color: Colors.green),
              Container(width: 30, height: 30, color: Colors.blue),
            ],
          ),
          Text('Select size'),
          Row(children: [for (int i = 7; i < 13; i++) Text('$i')]),
          FilledButton(onPressed: () {}, child: Text('Add to Bag')),
        ],
      ),
    );
  }
}
