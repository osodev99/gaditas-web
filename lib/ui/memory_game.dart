import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class MemoryGamePage extends StatefulWidget {
  const MemoryGamePage({super.key});

  @override
  State<MemoryGamePage> createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage>
    with SingleTickerProviderStateMixin {
  final List<String> images = [
    'assets/img/abraham.jpg',
    'assets/img/daniel.jpg',
    'assets/img/david.jpg',
    'assets/img/debora.jpg',
    'assets/img/ester.jpg',
    'assets/img/jesus.jpg',
    'assets/img/jose.jpg',
    'assets/img/maria.jpg',
    'assets/img/maria_magdalena.jpg',
    'assets/img/moises.jpg',
    'assets/img/noe.jpg',
    'assets/img/rebeca.jpg',
    'assets/img/rut.jpg',
    'assets/img/sara.jpg',
  ];

  late List<_CardModel> cards;
  List<int> flipped = [];
  List<int> matched = [];
  int lives = 5;
  int moves = 0;
  bool gameWon = false;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    final shuffled = [...images, ...images]..shuffle(Random());
    cards = List.generate(
      16,
      (index) => _CardModel(id: index, emoji: shuffled[index]),
    );

    setState(() {
      flipped.clear();
      matched.clear();
      lives = 5;
      moves = 0;
      gameWon = false;
      gameOver = false;
    });
  }

  void _handleCardTap(int index) {
    if (flipped.length == 2 ||
        flipped.contains(index) ||
        matched.contains(index) ||
        gameOver ||
        gameWon) {
      return;
    }

    setState(() {
      flipped.add(index);
    });

    if (flipped.length == 2) {
      final first = flipped[0];
      final second = flipped[1];
      moves++;

      if (cards[first].emoji == cards[second].emoji) {
        Future.delayed(const Duration(milliseconds: 400), () {
          setState(() {
            matched.addAll(flipped);
            flipped.clear();
            if (matched.length == cards.length) {
              gameWon = true;
            }
          });
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            flipped.clear();
            lives--;
            if (lives <= 0) {
              gameOver = true;
            }
          });
        });
      }
    }
  }

  bool _isFlipped(int index) =>
      flipped.contains(index) || matched.contains(index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Container(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [Color(0xFF9333EA), Color(0xFFEC4899), Color(0xFFEF4444)],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          image: DecorationImage(
            image: AssetImage('assets/img/fondo.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/img/gaditas.jpeg',
                      width: 60,
                      height: 60,
                    ),
                    FittedBox(
                      child: const Text(
                        'Juego de Memoria',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfff0960c),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(
                      'assets/img/gaditas.jpeg',
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Corazones y movimientos
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(5, (i) {
                        return Icon(
                          Icons.favorite,
                          size: 28,
                          color: i < lives
                              ? Colors.redAccent
                              : Colors.grey.shade300,
                        );
                      }),
                    ),
                    Text(
                      'Movimientos: $moves',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Mensaje de estado
                if (gameWon || gameOver)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: gameWon
                          ? Colors.green.shade100
                          : Colors.red.shade100,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: gameWon
                            ? Colors.green.shade500
                            : Colors.red.shade500,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          gameWon ? '🎉 ¡Felicitaciones!' : '😢 Fin del Juego',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: gameWon
                                ? Colors.green.shade700
                                : Colors.red.shade700,
                          ),
                        ),
                        Text(
                          gameWon
                              ? 'Completaste el juego en $moves movimientos'
                              : 'Te quedaste sin vidas',
                          style: TextStyle(
                            color: gameWon
                                ? Colors.green.shade600
                                : Colors.red.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 20),

                // Cuadrícula de cartas
                if (!gameWon && !gameOver)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 3 / 4,
                        ),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      final card = cards[index];
                      final flipped = _isFlipped(index);
                      return _AnimatedFlipCard(
                        img: card.emoji,
                        flipped: flipped,
                        onTap: () => _handleCardTap(index),
                      );
                    },
                  ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: _initializeGame,
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: const Text(
                    'Nuevo Juego',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Modelo de carta
class _CardModel {
  final int id;
  final String emoji;

  _CardModel({required this.id, required this.emoji});
}

/// Widget individual de carta con animación de volteo
class _AnimatedFlipCard extends StatefulWidget {
  final String img;
  final bool flipped;
  final VoidCallback onTap;

  const _AnimatedFlipCard({
    required this.img,
    required this.flipped,
    required this.onTap,
  });

  @override
  State<_AnimatedFlipCard> createState() => _AnimatedFlipCardState();
}

class _AnimatedFlipCardState extends State<_AnimatedFlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      value: widget.flipped ? 1 : 0,
    );
  }

  @override
  void didUpdateWidget(_AnimatedFlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.flipped != oldWidget.flipped) {
      widget.flipped ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * pi;
          final isFront = angle < pi / 2;
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: isFront
                ? _buildBack()
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: _buildFront(),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildFront() {
    return Container(
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [Color(0xfff0960c), Color(0xfff0960c), Color(0xff50265c)],
        // ),
        color: Color(0xfff0960c),
        borderRadius: BorderRadius.circular(16),

        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(widget.img, fit: BoxFit.cover),
    );
  }

  Widget _buildBack() {
    return Container(
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [Colors.blue.shade500, Colors.purple.shade600],
        // ),
        borderRadius: BorderRadius.circular(16),
        // boxShadow: const [
        //   BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 4)),
        // ],
        image: const DecorationImage(
          image: AssetImage('assets/img/card.webp'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
