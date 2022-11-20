import 'package:flutter/material.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({Key? key}) : super(key: key);

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  final bool _isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_isEdit ? 'Edit Product' : 'Create Product'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: FlutterLogo(
          size: 140,
        ));
  }
}
