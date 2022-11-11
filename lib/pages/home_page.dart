import 'package:consumo_api/controllers/home_controllers.dart';
import 'package:consumo_api/models/post_model.dart';
import 'package:consumo_api/repositories/home_repository_imp.dart';
import 'package:consumo_api/services/prefs_service.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        actions: [
          IconButton(
              onPressed: () {
                PrefsService.logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (_) => true);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _controller.posts,
          builder: (_, list, __) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 10),
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (_, idx) => ListTile(
                leading: Text(list[idx].id.toString()),
                trailing: const Icon(
                  Icons.arrow_right_outlined,
                  size: 40,
                  color: Colors.blue,
                ),
                title: Text(list[idx].title),
                onTap: () => Navigator.of(context)
                    .pushNamed('/details', arguments: list[idx]),
              ),
              separatorBuilder: (_, __) => const Divider(),
            );
          }),
    );
  }
}
