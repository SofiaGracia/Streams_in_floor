import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeacherWidget extends ConsumerWidget {
  final String name;
  final String dni;
  final Future<void> Function() onDelete;

  const TeacherWidget(
      {super.key,
      required this.name,
      required this.dni,
      required this.onDelete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [Text(name), Text(dni)],
              )),
              IconButton(
                  onPressed: () async {
                    await onDelete();
                  },
                  icon: Icon(Icons.delete))
            ],
          ),
        ));
  }
}
