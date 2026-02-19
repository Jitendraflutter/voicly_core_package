// import 'package:core/constants/app_colors.dart';
// import 'package:flutter/material.dart';

// class ScreenWrapper extends StatelessWidget {
//   final Widget child;
//   final String? title;
//   final bool visibleAppBar;
//   final bool backButton;
//   final bool centerTitle;
//   const ScreenWrapper({
//     super.key,
//     required this.child,
//     this.title,
//     this.visibleAppBar = false,
//     this.backButton = true,
//     this.centerTitle = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final statusBar = MediaQuery.of(context).padding.top;

//     return Stack(
//       children: [
//      Container(
//           decoration: const BoxDecoration(
//             gradient: AppColors.mainScreenBackground,
//           ),
//         ),

//         Container(
//           decoration: const BoxDecoration(gradient: AppColors.topLeftGlow),
//         ),

//         Container(
//           decoration: const BoxDecoration(gradient: AppColors.topRightGlow),
//         ),


//         Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: visibleAppBar
//               ? AppBar(
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   leading: backButton
//                       ? const BackButton(color: Colors.white)
//                       : null,

//                   title: Text(
//                     title ?? '',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   centerTitle: centerTitle,
//                 )
//               : null,
//           body: SafeArea(child: child),
//         ),
//         const Positioned(
//           bottom: 100,
//           left: 0,
//           right: 0,
//           child: MiniCallOverlay(),
//         ),
//       ],
//     );
//   }
// }
