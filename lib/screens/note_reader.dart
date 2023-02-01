import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.note, {Key? key}) : super(key: key);
  QueryDocumentSnapshot note;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int color_id = widget.note['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        title: Text(widget.note['note_title']),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.note['note_title'],
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              widget.note['creation_date'],
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              widget.note['note_content'],
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
    );
  }
}