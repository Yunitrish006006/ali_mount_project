
import 'package:flutter/material.dart';


// double fontSize = 20;
// FloatingActionButton settingButton(BuildContext context) {
//   return FloatingActionButton(
//     onPressed: () {
//       showGeneralDialog(
//         context: context,
//         barrierColor: Colors.black12.withOpacity(0.9), // 背景顏色
//         barrierDismissible: false,
//         barrierLabel: 'Dialog',
//         transitionDuration: const Duration(milliseconds: 400),
//         pageBuilder: (_, __, ___) {
//           return GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Material(
//               color: Colors.black.withOpacity(0.0),
//               child: Column(
//                 children: [
//                   Expanded(flex: 1, child: Row()),
//                   Expanded(
//                       flex: 1,
//                       child: SizedBox(
//                         height: 50,
//                         child: Slider(
//                             value: fontSize,
//                             min: 0.0,
//                             max: 100.0,
//                             onChanged: (n) {
//                               fontSize = n;
//                             }
//                         ),
//                       )
//                   ),
//                   Expanded(flex: 1, child: Row()),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     },
//     backgroundColor: Colors.black12,
//     mini: true,
//     child: const Icon(Icons.settings),
//   );
// }

class SetScreen extends StatefulWidget {
  const SetScreen({super.key});

  @override
  SetScreenState createState() => SetScreenState();
}

class SetScreenState extends State<SetScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/texture/logo.png'),
      ),
    );
  }
}