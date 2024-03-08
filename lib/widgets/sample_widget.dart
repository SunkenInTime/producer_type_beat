import 'package:flutter/material.dart';
import 'package:producer_type_beat/sample.dart';

class SampleWidget extends StatelessWidget {
  const SampleWidget(
      {super.key, required this.sampleWidth, required this.currentSample});
  final double sampleWidth;
  final Sample currentSample;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      child: SizedBox(
        width: sampleWidth,
        height: sampleWidth,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: sampleWidth,
                height: sampleWidth,
                decoration: ShapeDecoration(
                  color: const Color(0xFF272727),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33),
                  ),
                ),
              ),
            ),
            Positioned(
              left: sampleWidth * 0.076,
              top: sampleWidth * 0.135,
              child: Text(
                currentSample.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: sampleWidth * 0.085,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: sampleWidth * 0.65,
              top: sampleWidth * 0.777,
              child: Text(
                currentSample.formatDuration(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: sampleWidth * 0.085,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: sampleWidth * 0.076,
              top: sampleWidth * 0.777,
              child: Text(
                'wav',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: sampleWidth * 0.085,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
