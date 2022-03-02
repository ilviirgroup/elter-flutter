class Message {
  final int pk;
  final String? answer;
  final String date;
  final String message;
  final String? url;
  final String? userEmail;
  final String userPhone;

  Message({
    required this.pk,
    this.answer,
    required this.date,
    required this.message,
    this.url,
    this.userEmail,
    required this.userPhone,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        answer: json[MessageApiFields.answer],
        date: json[MessageApiFields.date],
        pk: json[MessageApiFields.pk],
        message: json[MessageApiFields.message],
        url: json[MessageApiFields.url],
        userEmail: json[MessageApiFields.userEmail],
        userPhone: json[MessageApiFields.userPhone],
      );
}

class MessageApiFields {
  static const pk = 'pk';
  static const answer = 'answer_text';
  static const date = 'date';
  static const message = 'question_text';
  static const url = 'url';
  static const userEmail = 'user_email';
  static const userPhone = 'user_phone';
}
