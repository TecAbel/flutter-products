import 'package:flutter/material.dart';
import 'package:products_login/widgets/index.dart';

class LoginBackGround extends StatelessWidget {
  final Widget child;
  const LoginBackGround({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [const _TopBox(), AuthTop(), child],
      ),
    );
  }
}

class _TopBox extends StatelessWidget {
  const _TopBox();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: media.height * 0.4,
      decoration: _purpleBox(),
      child: Stack(children: [
        Positioned(
          top: 90,
          left: 20,
          child: _Bubble(),
        ),
        Positioned(
          top: 10,
          right: 20,
          child: _Bubble(),
        ),
        Positioned(
          bottom: -10,
          right: -10,
          child: _Bubble(),
        ),
      ]),
    );
  }

  BoxDecoration _purpleBox() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1),
          ],
        ),
      );
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.1),
      ),
      child: null,
    );
  }
}
