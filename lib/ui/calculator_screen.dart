import 'package:calculator/provider/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CalculatorProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('String Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter numbers",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Examples:\n1,2,3\n1\n2,3\n//;\n1;2',
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      provider.calculate(_controller.text);
                    },

                    child: const Text('Calculate'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _controller.clear();
                      provider.clear();
                    },
                    child: const Text('Clear'),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            SizedBox(height: 20),
            if (provider.result.isNotEmpty)
              Center(
                child: Text(
                  provider.result,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),

            if (provider.error.isNotEmpty)
              Center(
                child: Text(
                  provider.error,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
