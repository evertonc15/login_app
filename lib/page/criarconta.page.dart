import 'package:flutter/material.dart';
import 'package:login_app/page/home.page.dart';
import 'package:login_app/validators/textfieldvalidator.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  bool _visibilitypass = true;

  void _passwordVisibility(){
    setState(() {
      _visibilitypass = !_visibilitypass;
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final validators = TextFieldValidators();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Criar uma nova conta',
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
              _buildTextField(
                'Digite seu email', Icons.email,
                (value) {
                  if (value!.isEmpty) return 'Digite seu email';
                  if (!validators.isValidEmail(value)) return 'Email inválido';
                  return null;
                },
                _emailController
                ),
              SizedBox(height: 10),
              _buildTextField('Digite seu CPF', Icons.badge,
              (value) {
                if (value!.isEmpty) return 'Digite seu CPF';
                if (!validators.isValidCPF(value)) return 'CPF Inválido';
                return null;
              },
              _cpfController
              ),
              SizedBox(height: 10),
              _buildTextField('Digite seu telefone', Icons.phone,
              (value) {
                  if (value!.isEmpty) return 'Digite seu telefone';
                  if (!validators.isValidTelefone(value)) return 'Telefone Inválido';
                  return null;
                },
                _telefoneController
                ),
              SizedBox(height: 10),
              _buildPasswordField('Digite sua senha',
              (value) {
                if (value!.isEmpty) return 'Digite sua senha';
                if (validators.isValidPassword(value)) return 'Senha Inválida';
                return null;
              },
              _passwordController
              ),
              SizedBox(height: 10),
              _buildPasswordField('Confirme sua senha',
              (value) {
                if (value!.isEmpty) return 'Confirme sua senha';
                if (value != _passwordController.text) return 'Senha não conferem';
                return null;
              },
              _confirmPasswordController
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen()),
                  );
                  } else {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Formulário Inválido')
                        ),
                      );
                  }
                },
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(350, 58)),
                  backgroundColor: WidgetStatePropertyAll(Colors.lightGreenAccent),
                ),
                child: Text(
                  'Criar Conta e Entrar',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon, String? Function(String?) validate,
  TextEditingController controller) {
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

  Widget _buildPasswordField(String hintText, String? Function(String?) validate,
  TextEditingController controller) {
    return TextFormField(
      validator:  validate,
      controller: controller,
      obscureText: _visibilitypass,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: _passwordVisibility,
          icon: _visibilitypass 
          ? Icon(Icons.visibility) 
          : Icon(Icons.visibility_off)
          ),
      ),
    );
  }
}