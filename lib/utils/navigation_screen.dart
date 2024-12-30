
import 'package:flutter/cupertino.dart';

Future<void> nextScreen(BuildContext context, Widget page) async {
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (context) => FadePageWrapper(child: page),
    ),
  );
}

// Wrapper widget to add fade effect to any page
class FadePageWrapper extends StatelessWidget {
  final Widget child;
  const FadePageWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,  // Full opacity for the new screen
      duration: const Duration(milliseconds: 350),  // Fade-in effect duration
      curve: Curves.easeInOut,  // Smooth transition
      child: child,  // The page that is being pushed
    );
  }
}