import 'package:flutter/material.dart';
import 'package:myapp/constants/api.dart';
import 'package:myapp/models/product.dart';

class ProductItem extends StatelessWidget {
  final double maxHeight;
  final Product product;
  const ProductItem(this.maxHeight, this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildImage(),
          _buildInfo(),
        ],
      ),
    );
  }

  Image _buildImage() {
    final height = maxHeight * 0.7;

    final productImage = product.image;
    return Image.network(
      '${API.IMAGE_URL}/$productImage',
      height: height,
    );
  }

  Column _buildInfo() => Column(
        children: [
          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('name'),
              Text('price'),
            ],
          ),
        ],
      );
}
