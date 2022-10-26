import 'package:flutter/material.dart';

class FadeTransitionDemo extends StatefulWidget {
  const FadeTransitionDemo({super.key});

  @override
  State<FadeTransitionDemo> createState() => _FadeTransitionDemoState();
}

class _FadeTransitionDemoState extends State<FadeTransitionDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FadeTransitionDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    // _controller.duration = widget.duration;
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      appBar: AppBar(title: const Text("FadeTransitionDemo")),
      body: Column(
        children: [
          FadeTransition(
            opacity: _animation,
            child: Container(
              width: 256,
              height: 256,
              color: Colors.blue,
              child: const Text("X"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => _controller.isCompleted
                  ? _controller.reverse()
                  : _controller.forward(),
              child: const Text("toggle"),
            ),
          ),
        ],
      ),
    );
  }
}
