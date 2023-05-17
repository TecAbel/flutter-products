import 'package:flutter/material.dart';

class TopImageProductDetail extends StatelessWidget {
  final String? imageUrl;
  const TopImageProductDetail({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: imageUrl == null || imageUrl == ''
                ? const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/no-image.png'),
                  )
                : FadeInImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl!),
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                  ),
          ),
          Opacity(
            opacity: 0.4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(45),
              ),
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
