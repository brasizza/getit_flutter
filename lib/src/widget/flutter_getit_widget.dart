import 'package:flutter/material.dart';

import '../../flutter_getit.dart';

class FlutterGetItWidget extends StatefulWidget {
  const FlutterGetItWidget({
    super.key,
    required this.name,
    required this.builder,
    this.binds = const [],
    this.onDispose,
  });

  final String name;
  final WidgetBuilder builder;
  final List<Bind> binds;
  final void Function()? onDispose;

  @override
  State<FlutterGetItWidget> createState() => _FlutterGetItWidgetState();
}

class _FlutterGetItWidgetState extends State<FlutterGetItWidget> {
  late final String id;
  late final FlutterGetItContainerRegister containerRegister;

  @override
  void initState() {
    super.initState();
    final FlutterGetItWidget(
      :name,
      :binds,
    ) = widget;
    containerRegister = Injector.get<FlutterGetItContainerRegister>();
    //Utilizado a hashCode para garantir que o id seja único, podendo ser utilizado em mais de um lugar
    id = '/WIDGET-$name-$hashCode';

    containerRegister
      ..register(
        id,
        binds,
      )
      ..load(id);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  @override
  void dispose() {
    containerRegister.unRegister(id);
    widget.onDispose?.call();
    super.dispose();
  }
}
