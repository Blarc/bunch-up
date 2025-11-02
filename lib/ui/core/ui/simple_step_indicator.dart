import 'package:flutter/material.dart';

class SimpleStepIndicator extends StatelessWidget {
  const SimpleStepIndicator({
    required this.currentStep,
    required this.steps,
    super.key,
  });

  final int currentStep;
  final int steps;

  static const width = 100.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (final step in List.generate(steps, (index) => index))
                  Icon(
                    Icons.circle,
                    color: step == currentStep
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                    size: step == currentStep ? 16.0 : 16.0,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
