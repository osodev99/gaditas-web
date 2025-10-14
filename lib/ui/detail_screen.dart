import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
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
            Expanded(
              child: Image.asset(
                'assets/img/tennis.webp',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  Text(
                    'Air Max 270',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$150',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Icon(Icons.star, color: Colors.orange),
                      Text(
                        '4,7',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '(147) Reviews',
                        style: TextStyle(
                          color: Colors.purple,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.purple,
                          decorationThickness: 2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      CircleColorPicker(color: Colors.purple),
                      CircleColorPicker(color: Colors.green),
                      CircleColorPicker(color: Colors.blue),
                    ],
                  ),
                  Text(
                    'Select size',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      for (int i = 7; i < 13; i++) RectangleNumber(number: i),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        padding: EdgeInsets.all(24),
                        backgroundColor: Colors.orange,
                      ),
                      icon: Icon(Icons.collections),
                      label: Text('Add to Bag'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleColorPicker extends StatelessWidget {
  const CircleColorPicker({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class RectangleNumber extends StatelessWidget {
  const RectangleNumber({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 75,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text('$number'),
      ),
    );
  }
}
