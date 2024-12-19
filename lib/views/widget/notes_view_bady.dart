import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/cubits/cubit/notes_cubit_cubit.dart';

import 'package:my_notes/views/widget/notes_item_listview.dart';

class NotesViewbady extends StatefulWidget {
  const NotesViewbady({super.key});

  @override
  State<NotesViewbady> createState() => _NotesViewbadyState();
}

class _NotesViewbadyState extends State<NotesViewbady> {
  @override
  void initState() {
    BlocProvider.of<NotesCubitCubit>(context).fetchallnotes();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const NotesItemListview();
  }
}
