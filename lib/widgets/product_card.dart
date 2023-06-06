import 'package:flutter/material.dart';
import 'package:products_login/config/index.dart';
import 'package:products_login/models/product.dart';
import 'package:products_login/services/index.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double borderRadius = 25;
    final productService = Provider.of<ProductService>(context);

    BoxDecoration productCardDecoration() {
      return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey,
            offset: Offset(0, 5),
          )
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20),
      child: InkWell(
        onTap: () {
          productService.productSelected = product.copyWith();
          Navigator.of(context).pushNamed('product_detail', arguments: product);
        },
        child: Container(
          height: 400,
          decoration: productCardDecoration(),
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              _BackgroudImage(
                borderRadius: borderRadius,
                imageUrl: product.image,
              ),
              _ProductDetails(
                product: product,
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: _PriceTag(
                    price: product.price,
                  )),
              if (!product.available)
                Positioned(
                  top: 0,
                  left: 0,
                  child: _NotAvailable(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _BackgroudImage extends StatelessWidget {
  final String? imageUrl;
  const _BackgroudImage({
    required this.borderRadius,
    this.imageUrl,
  });

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: imageUrl == null || imageUrl == ''
            ? const Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/no-image.png'),
              )
            : FadeInImage(
                fit: BoxFit.cover,
                placeholderFit: BoxFit.cover,
                image: NetworkImage(imageUrl!),
                placeholder: const AssetImage('assets/jar-loading.gif'),
              ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final Product product;
  const _ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: CustomTheme.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                product.id!,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double price;

  const _PriceTag({required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      decoration: const BoxDecoration(
        color: CustomTheme.primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$ ${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.yellow[900],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'No disponible',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
