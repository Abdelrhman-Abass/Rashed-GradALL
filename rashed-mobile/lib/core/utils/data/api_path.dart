class ApiPaths {
  static const String base = 'https://rashed-server.vercel.app';


  static const String auth = '/auth';
  static const String login = '$auth/login';
  static const String logout = '$auth/logout';
  static const String register = '$auth/register';
  static const String changePass = '$auth/reset-password';

  static const String messages = '/messages';
  static const String startSession = '$messages/session';
  static String getMessages(String id) => '$messages/get-message/$id';
  static String sendMessage(String id) => '$messages/send-message/$id';

  static const String list = '/list';
  static const String sessions = '/$list/chat-sessions';

}
