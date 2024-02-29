import 'package:flutter/material.dart';

class RecordButton extends StatefulWidget {
  RecordButton({super.key, required this.isRecording});
  bool isRecording;
  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;

    // Calculate the dimensions for your widget based on the screen size
    double scaleRatio = 1;
    double outerCircleSize = 75 * scaleRatio; // Adjust as needed
    double innerCircleSize = 46 * scaleRatio; // Adjust as needed
    return widget.isRecording
        //Currently Recording
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: SizedBox(
                width: outerCircleSize,
                height: outerCircleSize,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration:
                            BoxDecoration(color: Colors.white.withOpacity(0)),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      top: 24,
                      child: Container(
                        width: 27,
                        height: 27,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFF0000),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        //Not Recording
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: SizedBox(
                width: outerCircleSize,
                height: outerCircleSize,
                child: Stack(
                  children: [
                    Positioned(
                      left: (outerCircleSize - innerCircleSize) / 2,
                      top: (outerCircleSize - innerCircleSize) / 2,
                      child: Container(
                        width: innerCircleSize,
                        height: innerCircleSize,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFF0000),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: outerCircleSize,
                        height: outerCircleSize,
                        decoration: const ShapeDecoration(
                          color: Color(0x47FF0000),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
