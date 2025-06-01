import 'package:flutter/material.dart';

class RepaintBoundaryExample extends StatelessWidget {
  const RepaintBoundaryExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RepaintBoundary Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* Without RepaintBoundary
            Container(
              width: 220,
              height: 80,
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: const Text('Without RepaintBoundary', style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 24),
            //* With RepaintBoundary and animation == the red box will not repaint
            const RepaintBoundary(
              child: AnimatedGreenBox(),
            ),
          ],
        ),
      ),
    );
  }
}

//* Animated green box with RepaintBoundary
class AnimatedGreenBox extends StatefulWidget {
  const AnimatedGreenBox({super.key});

  @override
  State<AnimatedGreenBox> createState() => _AnimatedGreenBoxState();
}

class _AnimatedGreenBoxState extends State<AnimatedGreenBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.7, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AnimatedGreenBox build (should only repaint itself)');
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
            width: 220,
            height: 80,
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('With RepaintBoundary', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Animated', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        );
      },
    );
  }
}
