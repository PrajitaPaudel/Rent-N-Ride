class MessageModel {
  String? userId;
  String? userName;
  String? messageText;



  MessageModel({
    this.userId,
    this.userName,
    this.messageText,


  });
  MessageModel.fromJson(Map<String, dynamic> json) {
    userId = json["senderId"];
    userName = json["recipientUserName"]?.toString();
    messageText = json["content"]?.toString();

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["SenderId"] = userId;
    data["RecipientUserName"] = userName;
    data["Content"] = messageText;


    return data;
  }
}
