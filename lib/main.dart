import 'package:flutter/material.dart';

void main() {
  runApp(const SmartCounterApp());
}

class SmartCounterApp extends StatelessWidget {
  const SmartCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7956D8),
        ),
        useMaterial3: true,
      ),
      home: const CounterHome(),
    );
  }
}

class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F2FF),
      appBar: AppBar(
        title: const Text(
          'Smart Counter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F2FF),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calculate_rounded,
                size: 70,
                color: Color(0xFF7956D8),
              ),
              const SizedBox(height: 20),
              const Text(
                'YOUR CURRENT COUNT',
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 2,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Text(
                  '$count',
                  key: ValueKey(count),
                  style: const TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7956D8),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _counterButton(
                    icon: Icons.remove,
                    color: Colors.deepOrange,
                    onPressed: () {
                      setState(() => count--);
                    },
                  ),
                  const SizedBox(width: 24),
                  _counterButton(
                    icon: Icons.add,
                    color: const Color(0xFF7956D8),
                    onPressed: () {
                      setState(() => count++);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 25),
              OutlinedButton.icon(
                onPressed: () {
                  setState(() => count = 0);
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reset Counter'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Tap + or − to change your count',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _counterButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 72,
      height: 72,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: color,
          shape: const CircleBorder(),
        ),
        child: Icon(icon, size: 32),
      ),
    );
  }
}