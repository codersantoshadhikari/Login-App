bool isValiEmail(String email) {
  // Regular expression to match email addresses
  final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  return regex.hasMatch(email);
}
