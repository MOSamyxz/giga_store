bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}

bool isValidUsername(String username) {
  final RegExp regex = RegExp(r'^[a-zA-Z0-9أ-ي_ ]+$');
  return regex.hasMatch(username);
}

validInput(String val, min, max, String type, context) {
  if (type == 'empty') {
    if (val.isEmpty) {
      return 'Please enter your email';
    }
  }
  if (type == 'email') {
    if (val.isEmpty) {
      return 'pleaseEnterAValidEmail';
    } else if (!isEmail(val)) {
      return 'Please enter a valid Email!';
    }
  }
  if (type == 'password') {
    if (val.isEmpty) {
      return 'Please enter a Password';
    } else if (val.length < min) {
      return 'Password can\'t be less than 6';
    } else if (val.length > max) {
      return 'Password can\'t be more than 16';
    }
  }

  if (type == 'username') {
    if (val.isEmpty) {
      return 'Please enter your username!';
    } else if (!isValidUsername(val)) {
      return 'Please enter a valid username!';
    }
  }
}
