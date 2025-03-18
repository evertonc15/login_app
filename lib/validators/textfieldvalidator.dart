class TextFieldValidators {
  bool isValidCPF(String cpf) {
    // Remove caracteres não numéricos
    cpf = cpf.replaceAll(RegExp(r'\D'), '');

    // Verifica se o CPF tem 11 dígitos
    if (cpf.length != 11) return false;

    // Verifica se todos os dígitos são iguais (CPF inválido)
    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) return false;

    // Validação dos dígitos verificadores
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(cpf[i]) * (10 - i);
    }
    int firstDigit = (sum * 10) % 11;
    if (firstDigit == 10) firstDigit = 0;

    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += int.parse(cpf[i]) * (11 - i);
    }
    int secondDigit = (sum * 10) % 11;
    if (secondDigit == 10) secondDigit = 0;

    return cpf[9] == firstDigit.toString() && cpf[10] == secondDigit.toString();
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidTelefone(String telefone) {
    final telefoneRegex = RegExp(r'^\([1-9]{2}\) [9]{0,1}[0-9]{4}\-[0-9]{4}$');
    return telefoneRegex.hasMatch(telefone);
  }

  bool isValidPassword(String password) {
    // Mínimo de 8 caracteres, pelo menos uma letra maiúscula, uma minúscula e um número
    final passwordRegex = RegExp(r'^(?=.[A-Z])(?=.[a-z])(?=.*\d).{8,}$');
    return passwordRegex.hasMatch(password);
  }
}