import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/cubits/cubit/notes_cubit_cubit.dart';
import 'package:my_notes/models/note_model.dart';
import 'package:my_notes/views/widget/node_item.dart';

class NotesItemListview extends StatelessWidget {
  const NotesItemListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubitCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteItem(
                  note: notes[index],
                );
              }),
        );
      },
    );
  }
}
