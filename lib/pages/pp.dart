import 'package:flutter/material.dart';

class testApi extends StatefulWidget {
  const testApi({super.key});

  @override
  State<testApi> createState() => _testApiState();
}

class _testApiState extends State<testApi> {
  void getData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    // http.Response response = await http.get(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
