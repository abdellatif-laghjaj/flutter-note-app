import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/style/app_style.dart';
import 'package:note_app/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        backgroundColor: AppStyle.mainColor,
        elevation: 0.0,
        title: const Text('Notify XD'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your recent notes',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Builder(
              builder: (context) {
                return StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('notes').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    /*checking the connection state,
                      if we still loading the data,
                      we will show a circular progress indicator*/
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    //if we have data, we will show it
                    if (snapshot.hasData) {
                      return GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                        ),
                        children: [
                          ListView(
                            children: snapshot.data!.docs
                                .map((note) => NoteCard(() => {}, note))
                                .toList(),
                          ),
                        ],
                      );
                    }

                    // if we don't have data, we will show a text
                    return Text(
                      'No notes yet',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    );
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
