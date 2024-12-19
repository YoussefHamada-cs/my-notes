import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_notes/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:my_notes/models/note_model.dart';
import 'package:my_notes/views/widget/colors_list_view.dart';

class AddForm extends StatefulWidget {
  const AddForm({
    super.key,
  });

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            onSaved: (newValue) {
              title = newValue;
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
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onSaved: (newValue) {
              subtitle = newValue;
            },
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'enter your notes',
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
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          const ColorListView(),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                var currentDate = DateTime.now();
                var formattedCurrentDate =
                    DateFormat.yMEd().format(currentDate);
                var noteModel = NoteModel(
                    title: title!,
                    subtitle: subtitle!,
                    date: formattedCurrentDate,
                    color: const Color.fromARGB(230, 58, 117, 226).value);
                BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}
