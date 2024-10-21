import 'package:flutter/material.dart';

class BaselineDemo extends StatelessWidget {
  const BaselineDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // *********** Baseline Example ***********
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.purple,
              alignment: Alignment.center,
              child: Baseline(
                baseline: 200, // y-position of the baseline Change it to see the effect of baseline

                baselineType: TextBaseline.alphabetic,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  width: double.infinity,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 200),
            // *********** Baseline Row  Example ***********
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Using Baseline with Text
                Baseline(
                  baseline: 100, // y-position of the baseline
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    'Text1',
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  ),
                ),
                Baseline(
                  baseline: 100, // Align with the same baseline
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    'Text2',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
                Baseline(
                  baseline: 100, // Aligning at the same baseline
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    'Text3',
                    style: TextStyle(fontSize: 60, color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
