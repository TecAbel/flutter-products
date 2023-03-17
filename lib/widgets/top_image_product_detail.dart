import 'package:flutter/material.dart';

class TopImageProductDetail extends StatelessWidget {
  const TopImageProductDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: FadeInImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://via.placeholder.com/400x300/green'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            ),
          ),
        ],
      ),
    );
  }
}
