import 'package:flutter/material.dart';

import '../model/jens/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  late DecorationImage image;

  ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    _loadImage();

    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 120,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                  ),
                  image: image,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.articleName!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'PZN: ${product.pzn!}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 2),
                      // short to 28 chars

                      Text(
                        product.manufacturer!.length > 26
                            ? product.manufacturer!.substring(0, 26)
                            : product.manufacturer!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${product.mengenangabe!} ${product.mengeneinheit!}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DecorationImage _loadImage() {
    try {
      image = DecorationImage(
        image: NetworkImage(product.linkToProductPicture!),
        fit: BoxFit.contain,
        onError: (exception, stackTrace) {
          print("error catch for image loading");
          image = DecorationImage(
            image: AssetImage('assets/images/noImageAvailable.png'),
            fit: BoxFit.contain,
          );
        },
      );
    } catch (e) {
      image = const DecorationImage(
        image: AssetImage('assets/images/noImageAvailable.png'),
        fit: BoxFit.contain,
      );
    }
    return image;
  }
}
