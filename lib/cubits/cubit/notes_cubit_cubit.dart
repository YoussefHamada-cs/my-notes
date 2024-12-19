import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:my_notes/constent.dart';
import 'package:my_notes/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchallnotes()  {
    var notesBox = Hive.box<NoteModel>(kNoteBox);

    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
