// import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
// import 'package:flutter/material.dart';
// import 'package:forexapp/constants/app_colors.dart';


// class CustomSliderButton extends StatefulWidget {
//   const CustomSliderButton({super.key});

//   @override
//   State<CustomSliderButton> createState() => _CustomSliderButtonState();
// }

// enum SegmentType { advice, analytics }

// class _CustomSliderButtonState extends State<CustomSliderButton> {
//   bool isToggled = false;
//   SegmentType _selectedSegment = SegmentType.advice;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: CustomSlidingSegmentedControl<SegmentType>(
//         initialValue: SegmentType.advice,
//         isStretch: true,
//         children: const {
//           SegmentType.advice: Text(
//             'Советы',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: AppColors.floatButtonColor,
//             ),
//           ),
//           SegmentType.analytics: Text(
//             'Аналитика',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: AppColors.floatButtonColor,
//             ),
//           ),
//         },
//         innerPadding: const EdgeInsets.all(4),
//         decoration: const BoxDecoration(
//           color: AppColors.innactiveColor,
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//         ),
//         thumbDecoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(15)),
//         ),
//         onValueChanged: (value) {
//           setState(() {
//             _selectedSegment = value;
//           });
//         },
//       ),
//     );
//   }
// }