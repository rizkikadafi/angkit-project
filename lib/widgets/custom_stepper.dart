import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    super.key,
    required this.step,
  });

  final int step;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 14.0,
              height: 14.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 4.0,
                ),
              ),
            ),
            Container(
              width: 48.0,
              height: 2.0,
              decoration: BoxDecoration(
                color: (step > 1)
                    ? Theme.of(context).colorScheme.secondary
                    : const Color(0xffAFAFAF),
              ),
            ),
            Container(
              width: 14.0,
              height: 14.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: (step > 1)
                      ? const Color(0xff66B357)
                      : const Color(0xffAFAFAF),
                  width: 4.0,
                ),
              ),
            ),
            Container(
              width: 48.0,
              height: 2.0,
              decoration: BoxDecoration(
                color: (step > 2)
                    ? const Color(0xff66B357)
                    : const Color(0xffAFAFAF),
              ),
            ),
            Container(
              width: 14.0,
              height: 14.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: (step > 2)
                      ? const Color(0xff66B357)
                      : const Color(0xffAFAFAF),
                  width: 4.0,
                ),
              ),
            ),
            Container(
              width: 48.0,
              height: 2.0,
              decoration: BoxDecoration(
                color: (step > 3)
                    ? const Color(0xff66B357)
                    : const Color(0xffAFAFAF),
              ),
            ),
            Container(
              width: 14.0,
              height: 14.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: (step > 3)
                      ? const Color(0xff66B357)
                      : const Color(0xffAFAFAF),
                  width: 4.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Step 1",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            SizedBox(width: 25),
            Text(
              "Step 2",
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 60, 60, 60)),
            ),
            SizedBox(width: 25),
            Text(
              "Step 3",
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 60, 60, 60)),
            ),
            SizedBox(width: 25),
            Text(
              "Selesai",
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 60, 60, 60)),
            ),
          ],
        ),
      ],
    );
  }
}
