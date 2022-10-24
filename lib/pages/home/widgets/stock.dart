import 'package:flutter/material.dart';
import 'package:myapp/models/post.dart';
import 'package:myapp/pages/home/widgets/product_item.dart';
import 'package:myapp/services/network_service.dart';

class Stock extends StatelessWidget {
  const Stock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: NetworkService().fetchPosts(0),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Post>? post = snapshot.data;
          if (post == null || post.isEmpty) {
            return Center(
              child: Text('No Data'),
            );
          }
          return _buildProductGridView(post);
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  GridView _buildProductGridView(List<Post> post) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return ProductItem(constraints.maxHeight);
        },
      ),
      itemCount: post.length,
    );
  }
}
