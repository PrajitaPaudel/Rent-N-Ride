class MessageModel {
  String? userId;
  String? userName;
  String? messageText;
   DateTime? timestamp;

  MessageModel({
    this.userId,
    this.userName,
    this.messageText,
    this.timestamp,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    userId = json["senderId"]?.toString();
    userName = json["recipientUserName"]?.toString();
    messageText = json["content"]?.toString();
    timestamp= DateTime.parse(json['SentAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      "SenderId": userId,
      "RecipientUserName": userName,
      "Content": messageText,

    };
  }
}

