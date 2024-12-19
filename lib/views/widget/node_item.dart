import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_notes/cubits/cubit/notes_cubit_cubit.dart';
import 'package:my_notes/models/note_model.dart';
import 'package:my_notes/views/edit_notes_view.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: Color(widget.note.color), borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            ListTile(
              title: Text(
                widget.note.title,
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  widget.note.subtitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                  color: Colors.black,
                  onPressed: () {
                    widget.note.delete();
                    BlocProvider.of<NotesCubitCubit>(context).fetchallnotes();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    size: 23,
                  )),
            ),
            Positioned(
                bottom: 12,
                right: 24,
                child: Text(
                  widget.note.date,
                  style: TextStyle(color: Colors.black.withOpacity(.4)),
                )),
            Positioned(
                bottom: 0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return EditNotesView(note: widget.note,);
                      },
                    ));
                  },
                  child: Text('Edit'),
                ))
          ],
        ),
      ),
    );
  }
}
