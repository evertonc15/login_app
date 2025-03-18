import 'package:flutter/material.dart';
import 'package:login_app/main.dart';
import 'package:login_app/validators/textfieldvalidator.dart';

class RecoverAccountScreen extends StatefulWidget {
  const RecoverAccountScreen({Key? key}) : super(key: key);

  @override
  State<RecoverAccountScreen> createState() => _RecoverAccountScreenState();
}

class _RecoverAccountScreenState extends State<RecoverAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final validators = TextFieldValidators();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Recuperar conta',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              _buildTextField('Digite seu email', Icons.email, (value) {
                if (value!.isEmpty) return 'Digite seu email';
                if (!validators.isValidEmail(value)) return 'Email Inválido';
                return null;
              }, _emailController),
              SizedBox(height: 10),
              _buildTextField('Digite seu CPF', Icons.badge, (value) {
                if (value!.isEmpty) return 'Digite seu CPF';
                if (!validators.isValidCPF(value)) return 'CPF Inválido';
                return null;
              }, _cpfController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Formulário Inválido')),
                    );
                  }
                },
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(350, 58)),
                  backgroundColor:
                      WidgetStatePropertyAll(Colors.lightBlueAccent),
                ),
                child: Text(
                  'Recuperar Senha',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon,
      String? Function(String?) validate, TextEditingController controller) {
    return TextFormField(
      validator: validate,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
