import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app/style/app_style.dart';

Widget NoteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc['note_title'],
            style: AppStyle.mainTitle,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            doc['note_content'],
            style: AppStyle.mainContent,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            doc['creation_date'],
            style: AppStyle.dateTitle,
          ),
        ],
      ),
    ),
  );
}
