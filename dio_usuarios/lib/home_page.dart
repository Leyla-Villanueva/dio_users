import 'package:dio_usuarios/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _api = ApiService();
  List<dynamic> posts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    //cargar los datos
    loadingData();
  }

  Future<void> loadingData() async {
    final result = await _api.getPosts();
    setState(() {
      posts = result;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo con dio- LEYLA")),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final item = posts[index];
                return ListTile(
                  title: Text(item['title']),
                  subtitle: Text(item['body']),
                );
              },
            ),
    );
  }
}
