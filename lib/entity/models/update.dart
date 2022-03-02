class Update {
  final bool update;
  Update({required this.update});

  factory Update.fromJson(Map<String, dynamic> json) =>
      Update(update: json[UpdateApiField.update]);
}

class UpdateApiField {
  static String update = 'update_product';
}
