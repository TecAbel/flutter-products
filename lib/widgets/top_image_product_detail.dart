import 'package:flutter/material.dart';

class TopImageProductDetail extends StatelessWidget {
  const TopImageProductDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: const FadeInImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://via.placeholder.com/400x300/green'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: IconButton(
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
