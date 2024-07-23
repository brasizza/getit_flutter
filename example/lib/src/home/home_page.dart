import 'package:example/application/session/model/user_model.dart';
import 'package:example/application/session/user_session.dart';
import 'package:example/src/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _home = Injector.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          UserSession.updateMe(
            UserModel(
              name: 'Leo ${DateTime.now().second}',
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<UserModel?>(
              stream: UserSession.me,
              builder: (context, user) {
                return Text(user.data?.name ?? 'No User');
              },
            ),
            /*  ElevatedButton(
              onPressed: () async {
                await showModalBottomSheet(
                  routeSettings: const RouteSettings(name: '/Auth/Login'),
                  useRootNavigator: true,
                  context: context,
                  builder: (context) => FlutterGetItPageBuilder(
                    path: '/Auth/Login',
                    binding: () => Bind.lazySingleton(
                      (i) => LoginController(
                        name: 'By HomePage showModalBottomSheet Bindings',
                      ),
                    ),
                    page: (context) => LoginPage(
                      controller: context.get(),
                    ),
                  ),
                );
              },
              child: const Text(
                'Chamar bottom sheet',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pushNamed('/Auth/LoginERROR');
              },
              child: const Text(
                'Ir a uma rota errada.',
              ),
            ),
            const SizedBox(
              height: 16,
            ), */
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pushNamed('/Auth/Login');
              },
              child: const Text(
                'Abrir Auth Module',
              ),
            ),
            /*   const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pushNamed('/RandomPage');
              },
              child: const Text(
                'Ir a uma rota "normal".',
              ),
            ),
             */
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pushNamed('/Detail/Factories/One');
              },
              child: const Text(
                'Detail One Page',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context)
                    .pushNamed('/Detail/Factories/One/Internal/Page');
              },
              child: const Text(
                'Detail One Internal',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context)
                    .pushNamed('/Detail/Factories/One/Internal/Page/Child');
              },
              child: const Text(
                'Detail One Internal Child',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pushNamed('/Detail/Factories/Two');
              },
              child: const Text(
                'Detail Two Page',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
