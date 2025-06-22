/// Checks if string is email.
String? validateEmail(String? inputString) {
  if (inputString?.isEmpty??true) {
    return 'Email cannot be empty';
  }

  const pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regExp = RegExp(pattern);

  return !regExp.hasMatch(inputString!) ? 'enter a valid Email' : null;
}

/// Checks if string is phone number
String? validateText(String? inputString, String? field){
  return (inputString?.isEmpty??true) ? '${field ?? 'This field'} ${'cannot be empty'}' : null;
}

String? validatePassword(String? inputString) {

  if (inputString?.isEmpty??true) {
    return '${'Password'} ${'cannot be empty'}';
  }

  return inputString!.length < 8 ? 'invalid password' : null;
}
String? validateConfPassword(String? inputString, bool match) {

  if (inputString?.isEmpty??true) {
    return '${'Password'} ${'cannot be empty'}';
  }

  return !match ? 'mismatch' : null;
}
