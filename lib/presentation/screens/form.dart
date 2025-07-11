import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormScreen extends ConsumerStatefulWidget {
  //We may need a onCreate

  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends ConsumerState<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController dniController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    dniController = TextEditingController();
    nameController = TextEditingController();
  }

  //TODO: Write a method for saving a new teacher

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    required IconData icon,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new teacher'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(
                    controller: dniController,
                    label: 'ID or DNI',
                    icon: Icons.account_circle_outlined),
                const SizedBox(height: 12),
                _buildTextField(
                    controller: dniController,
                    label: 'ID or DNI',
                    icon: Icons.account_circle_outlined),
                const SizedBox(height: 12),
                //Save teacher button
              ],
            )),
      ),
    );
  }
}
