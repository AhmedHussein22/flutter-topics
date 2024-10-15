import 'package:flutter/material.dart';

class MagnifierExample extends StatelessWidget {
  const MagnifierExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Magnifier Example')),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              // *********** Image Magnifier ***********
              const Text('Image Magnifier', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

              CustomMagnifier(
                size: const Size(100, 100),
                scale: 2,
                child: Image.network(
                  'https://farm2.staticflickr.com/1533/26541536141_41abe98db3_z_d.jpg', // Replace with your image URL
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),

              // *********** Text Magnifier ***********
              const Text(
                'Text Magnifier',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const CustomMagnifier(
                size: Size(80, 80),
                scale: 1.5,
                child: Text(
                  'Drag to magnify this text! Drag to magnify this text! Drag to magnify this text! Drag to magnify this text! Drag to magnify this text! Drag to magnify this text! Drag to magnify this text! Drag to magnify this text! Drag to magnify this text! Drag to magnify this text! Drag to magnify this text! 🧐   ',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomMagnifier extends StatefulWidget {
  final Size size;
  final double scale;
  final Widget? child;

  const CustomMagnifier({super.key, required this.size, required this.scale, this.child});

  @override
  State<CustomMagnifier> createState() => _CustomMagnifierState();
}

class _CustomMagnifierState extends State<CustomMagnifier> {
  Offset dragGesturePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                dragGesturePosition = details.localPosition;
              });
            },
            child: widget.child,
          ),
          if (dragGesturePosition != Offset.zero)
            Positioned(
              left: dragGesturePosition.dx,
              top: dragGesturePosition.dy,
              child: RawMagnifier(
                decoration: const MagnifierDecoration(
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.blueAccent, width: 3),
                  ),
                ),
                size: widget.size,
                magnificationScale: widget.scale,
              ),
            ),
        ],
      ),
    );
  }
}
