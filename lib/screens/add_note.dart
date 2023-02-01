import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_app/style/app_style.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  TextEditingController _noteTitleController = TextEditingController();
  TextEditingController _noteContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        title: const Text('Add new note'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                hintText: 'Enter title',
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
              decoration: const InputDecoration(
                hintText: 'Enter content',
                border: InputBorder.none,
              ),
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
                          color: AppStyle.cardsColor[i],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 42.0),
                ),
                child: const Text('Add note'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
