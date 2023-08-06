import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showTimer = true;
  Color _color = Colors.primaries.first;

  @override
  void initState() {
    _color = Colors.primaries.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (_showTimer)
              TimerView(
                color: _color,
              ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) {
                  final color = Colors.primaries[index];
                  return GestureDetector(
                    onTap: () {
                      _color = color;
                      setState(() {});
                    },
                    child: Container(
                      color: color,
                      height: 50,
                    ),
                  );
                },
                itemCount: Colors.primaries.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTimer = !_showTimer;
          setState(() {});
        },
      ),
    );
  }
}

class TimerView extends StatefulWidget {
  const TimerView({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  State<TimerView> createState() {
    return TimerViewState();
  }
}

class TimerViewState extends State<TimerView> {
  int _time = 0;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        _time++;
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_time',
      style: TextStyle(
        fontSize: 50,
        color: widget.color,
      ),
    );
  }
}
