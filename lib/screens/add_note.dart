import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app/style/app_style.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  final TextEditingController _noteTitleController = TextEditingController();
  final TextEditingController _noteContentController = TextEditingController();
  String date = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        title: const Text('Add new note'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection('notes').add({
                'note_title': _noteTitleController.text,
                'note_content': _noteContentController.text,
                'creation_date': date,
                'color_id': color_id,
              }).then((value) => Navigator.pop(context));
            },
            icon: const Icon(Icons.done_all),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: AppStyle.mainTitle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _noteTitleController,
                decoration: const InputDecoration(
                  hintText: 'Type your note title here...',
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Text(
                'Content',
                style: AppStyle.mainTitle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _noteContentController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Type your note content here...',
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Text(
                'Created on: $date',
                style: AppStyle.dateTitle,
              ),
              const SizedBox(
                height: 18.0,
              ),
              Text(
                'Color',
                style: AppStyle.mainTitle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < AppStyle.cardsColor.length; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            color_id = i;
                          });
                        },
                        child: Container(
                          width: 34.0,
                          height: 34.0,
                          margin: const EdgeInsets.only(right: 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            color: AppStyle.cardsColor[i],
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
