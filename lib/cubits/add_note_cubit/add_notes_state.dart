import 'package:flutter/material.dart';

@immutable
abstract class AddNotesState {}

class AddNotesInitial extends AddNotesState {}

class AddNotesLoading extends AddNotesState {}

class AddNotesSuccess extends AddNotesState {}

class AddNotesFailure extends AddNotesState {
  final String errormassage;
  AddNotesFailure(this.errormassage);
}
