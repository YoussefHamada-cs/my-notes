import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/cubits/cubit/notes_cubit_cubit.dart';
import 'package:my_notes/models/note_model.dart';

class EditNotesView extends StatefulWidget {
  const EditNotesView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesView> createState() => _EditNotesViewState();
}

class _EditNotesViewState extends State<EditNotesView> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Notes'),
          actions: [
            IconButton(
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = subtitle ?? widget.note.subtitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubitCubit>(context).fetchallnotes();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.check))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 30,
              ),
              TextFormField(
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(
                  
                  labelText: 'enter title',
                  labelStyle: const TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  //  filled: true,
                  //  fillColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                onChanged: (value) {
                  subtitle = value;
                },
                
                maxLines: 5,
                decoration: InputDecoration(
                  
                  labelText: 'enter your edit notes',
                  labelStyle: const TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  // filled: true,
                  // fillColor: Colors.grey,
                ),
              ),
            ],
          ),
        ));
  }
}
