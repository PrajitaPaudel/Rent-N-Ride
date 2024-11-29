
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/message_model.dart';

Widget chatMessageWidget(ScrollController chatListScrollController,
    List<MessageModel> messageModel, String currentUserId) {
  return Expanded(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          controller: chatListScrollController,
          child: Column(
            children: [
              ...messageModel.map((e) => chatItemWidget(e, currentUserId )),
              SizedBox(
                height: 6,
              )
            ],
          ),
        ),
      ));
}

Widget chatItemWidget(MessageModel e, String currentUserId) {
  bool isMyChat = e.userId == currentUserId;
  return e.userId == 0
      ? systemMessageWidget(e.messageText!)
      : Padding(
    padding: const EdgeInsets.only(left: 12, right: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        messageTextAndName(isMyChat, e.messageText!, e.userName!),

      ],
    ),
  );
}

Widget systemMessageWidget(String text) {
  return Container(
    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
    margin: EdgeInsets.only(top: 8),
    decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.all(Radius.circular(25))),
    child: Text(
      text,
      style: TextStyle(color: Colors.grey, fontSize: 12),
    ),
  );
}

Widget userAvatar(String userId, String userName) {
  Color avatarColor = Colors.greenAccent;
  // if (userId < 10000) {
  //   avatarColor = Color(0xFFffadad);
  // } else if (userId < 100000) {
  //   avatarColor = Color(0xFFffd6a5);
  // } else if (userId < 200000) {
  //   avatarColor = Color(0xFFfdffb6);
  // } else if (userId < 700000) {
  //   avatarColor = Color(0xFFcaffbf);
  // } else if (userId < 1000000) {
  //   avatarColor = Colors.blueAccent;
  // }

  return Container(
    width: 40,
    height: 40,
    margin: EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(shape: BoxShape.circle, color: avatarColor),
    child: Center(
      child: Text(
        userName.substring(0, 1).toUpperCase(),
        style: TextStyle(

            fontSize: 18,
            color: Colors.black87),
      ),
    ),
  );
}

Widget messageTextAndName(bool isMyChat, String messageText, String userName) {
  return Expanded(
      child: Column(
        crossAxisAlignment:
        isMyChat ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(isMyChat ? 20 : 8, 6, 8, 6),
            padding: EdgeInsets.fromLTRB(16, isMyChat ? 6 : 14, 16, 12),
            decoration: BoxDecoration(
                color: isMyChat ? Color(0xffebebeb0) : Color(0xffedf4ff),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMyChat)
                  Text(
                    userName,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                Text(
                  messageText,
                  style: TextStyle(height: 1.7),
                ),
              ],
            ),
          ),
        ],
      ));
}


