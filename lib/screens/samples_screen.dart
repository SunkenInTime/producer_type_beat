import 'package:flutter/material.dart';

class SamplesScreen extends StatefulWidget {
  const SamplesScreen({super.key});

  @override
  State<SamplesScreen> createState() => _SamplesScreenState();
}

class _SamplesScreenState extends State<SamplesScreen> {
  @override
  Widget build(BuildContext context) {
    double fullScreenWidth = MediaQuery.of(context).size.width;

    double sampleWidth = (fullScreenWidth / 2) - (fullScreenWidth / 18);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Samples"),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
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
                      'Trees of House',
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
                    left: sampleWidth * 0.73,
                    top: sampleWidth * 0.777,
                    child: Text(
                      '1:30',
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
        },
      ),
    );
  }
}


// SizedBox(
//             width: sampleWidth,
//             height: sampleWidth,
//             child: Stack(
//               children: [
//                 Positioned(
//                   left: 0,
//                   top: 0,
//                   child: Container(
//                     width: sampleWidth,
//                     height: sampleWidth,
//                     decoration: ShapeDecoration(
//                       color: const Color(0xFF272727),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(33),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Positioned(
//                   left: 17,
//                   top: 30,
//                   child: Text(
//                     'Trees of House',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 21,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w400,
//                       height: 0,
//                     ),
//                   ),
//                 ),
//                 const Positioned(
//                   left: 163,
//                   top: 174,
//                   child: Text(
//                     '1:30',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 21,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w400,
//                       height: 0,
//                     ),
//                   ),
//                 ),
//                 const Positioned(
//                   left: 17,
//                   top: 174,
//                   child: Text(
//                     'wav',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 21,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w400,
//                       height: 0,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );