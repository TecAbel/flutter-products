import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:products_login/services/index.dart';
import 'package:provider/provider.dart';

class TopImageProductDetail extends StatelessWidget {
  final String? imageUrl;
  const TopImageProductDetail({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    return SizedBox(
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: renderImage(productService.productSelected?.image)),
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
              onPressed: () async {
                //camera button click
                final picker = ImagePicker();
                final XFile? photo =
                    await picker.pickImage(source: ImageSource.gallery);
                print('tenemos file => ${photo?.path}');
                if (photo == null) return;
                productService.updateProductImage(photo.path);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget renderImage(String? imgUrl) {
  if (imgUrl == null || imgUrl.length == 0) {
    return const Image(
      fit: BoxFit.cover,
      image: AssetImage('assets/no-image.png'),
    );
  }

  if (imgUrl.startsWith('http')) {
    return FadeInImage(
      fit: BoxFit.cover,
      image: NetworkImage(imgUrl),
      placeholder: const AssetImage('assets/jar-loading.gif'),
    );
  }

  return Image.file(
    File(imgUrl),
    fit: BoxFit.cover,
  );
}
