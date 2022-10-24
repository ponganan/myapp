import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final double maxHeight;
  const ProductItem(this.maxHeight, {super.key});

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
    final height = maxHeight * 0.8;
    final productImage =
        'https://res.cloudinary.com/dk-find-out/image/upload/q_80,w_1920,f_auto/MA_00824519_xiqkt7_abbewy.jpg';
    return Image.network(
      productImage,
      height: height,
    );
  }

  Column _buildInfo() => Column(
        children: [
          const Text(
            'There are two species of hippos — the large/common hippo and the smaller relative, the pygmy hippo. Hippos are the third-largest living land mammal, after elephants and white rhinos. Despite their large and bulky appearance, they have adaptations to their semi-aquatic environments allowing them to move swiftly on both water and land. Their feet have four-webbed toes that splay out to distribute weight evenly and therefore adequately support them on land, and their short legs provide powerful propulsion through the water. The pygmy hippos digits are more spread out and have less webbing and, proportionally, their legs are longer relative to its body size. ',
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
