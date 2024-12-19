import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:my_notes/cubits/add_note_cubit/add_notes_state.dart';
import 'package:my_notes/cubits/cubit/notes_cubit_cubit.dart';
import 'package:my_notes/views/widget/add_form.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddShowModelBottomSheet extends StatefulWidget {
  const AddShowModelBottomSheet({
    super.key,
  });

  @override
  State<AddShowModelBottomSheet> createState() =>
      _AddShowModelBottomSheetState();
}

class _AddShowModelBottomSheetState extends State<AddShowModelBottomSheet> {
  // bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: 12,
            left: 12.0,
            right: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocConsumer<AddNotesCubit, AddNotesState>(
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNotesLoading ? true : false,
                child: const SingleChildScrollView(child: AddForm()));
          },
          listener: (context, state) {
            if (state is AddNotesFailure) {}
            if (state is AddNotesSuccess) {
              BlocProvider.of<NotesCubitCubit>(context).fetchallnotes();
              Navigator.pop(context);
            }
          },
        ));
  }
}
