import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para construir a interface do usuário
import 'package:login_app/page/home.page.dart';
import 'package:login_app/page/recuperarconta.page.dart';
import 'package:login_app/utils/image.utils.dart'; // Importa um utilitário que contém o caminho da imagem do perfil
import 'package:login_app/page/criarconta.page.dart';
import 'package:login_app/validators/textfieldvalidator.dart';

void main() {
  runApp(
      const MyApp()); // Executa o aplicativo e define MyApp como a raiz da aplicação
}

// Classe principal do aplicativo, que define a estrutura básica
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Remove a faixa de depuração do canto superior direito
      title: 'Tela de Login', // Define o título do aplicativo
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors
                .deepPurple), // Define um esquema de cores baseado no roxo
        useMaterial3: true, // Ativa o uso do Material 3
      ),
      home: LoginScreen(), // Define a tela de login como a tela inicial
    );
  }
}

// Classe que representa a tela de login
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState(); // Cria o estado da tela de login
}

class _LoginScreenState extends State<LoginScreen> {

  bool _visibilitypass = true;

  void _passwordVisibility(){
    setState(() {
      _visibilitypass = !_visibilitypass;
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final validators = TextFieldValidators();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(255, 156, 230, 1), // Define a cor de fundo da AppBar
        title: Text('Entrar na sua conta',
            style: TextStyle(color: Color.fromRGBO(45, 45, 45, 1))), // Define o título da AppBar
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0), // Adiciona espaçamento em toda a tela
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .center, // Alinha os widgets ao centro na horizontal
            children: [
              SizedBox(height: 20), // Espaço antes da imagem de perfil
              CircleAvatar(
                radius: 50, // Define o tamanho do avatar (imagem de perfil)
                backgroundImage: AssetImage(ImageUtils
                    .IMG_PERFIL), // Define a imagem do perfil usando o caminho salvo em ImageUtils
              ),
              SizedBox(height: 20), // Espaço entre a imagem e o campo de e-mail
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) return 'Digite seu email';
                  if (!validators.isValidEmail(value)) return 'Email Inválido';
                  return null;
                },
                decoration: InputDecoration(
                  labelText:
                      'Digite seu email', // Define o texto do rótulo dentro do campo
                  border:
                      OutlineInputBorder(), // Define uma borda para o campo de entrada
                ),
              ),
              SizedBox(height: 10), // Espaço entre os campos
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) return 'Digite seu password';
                  if (validators.isValidPassword(value)) return 'Password Inválido';
                  return null;
                },
                obscureText: _visibilitypass, // Oculta o texto para senhas
                decoration: InputDecoration(
                  labelText:
                      'Digite sua senha', // Define o texto do rótulo do campo de senha
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock), // Adiciona uma borda ao campo
                  suffixIcon: IconButton(
                    onPressed: _passwordVisibility,
                    icon: _visibilitypass 
                    ? Icon(Icons.visibility) 
                    : Icon(Icons.visibility_off)
                   ), // Ícone de "olho fechado" para indicar senha oculta
                ),
              ),
              SizedBox(height: 20), // Espaço antes do botão de login
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen()),
                  );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Formulário Inválido')
                        ),
                      );
                  }
                }, // Define a ação ao pressionar o botão (ainda sem funcionalidade)
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                      Size(350, 58)), // Define o tamanho do botão
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(147, 197, 255, 1)), // Define a cor de fundo do botão
                ),
                child: Text('Entrar',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white)), // Define o texto do botão
              ),
              SizedBox(height: 20), // Espaço antes do texto "Ou"
              Text('Ou',
                  style: TextStyle(fontSize: 16)), // Exibe um separador textual
              SizedBox(height: 20), // Espaço antes do botão de criar conta
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountScreen()),
                  );
                }, // Ainda sem funcionalidade
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                      Size(350, 58)), // Define o tamanho do botão
                  backgroundColor: WidgetStatePropertyAll(
                    Color.fromRGBO(255, 125, 125, 1)), // Cor vermelha para o botão de criação de conta
                ),
                child: Text('Criar uma nova conta',
                    style: TextStyle(
                        fontSize: 16, color: Colors.white)), // Texto do botão
              ),
              SizedBox(
                  height: 20), // Espaço antes do botão de recuperação de conta
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecoverAccountScreen()),
                  );
                }, // Ainda sem funcionalidade
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                      Size(350, 58)), // Define o tamanho do botão
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(255, 192, 129, 1)), // Define a cor de fundo do botão
                ),
                child: Text('Recuperar conta',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(45, 45, 45, 1))), // Texto do botão
              ),
            ],
          ),
        ),
      ),
    );
  }
}
