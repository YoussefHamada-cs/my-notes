import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_notes/constent.dart';
import 'package:my_notes/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:my_notes/cubits/cubit/notes_cubit_cubit.dart';
import 'package:my_notes/models/note_model.dart';
import 'package:my_notes/simple_bloc_observer.dart';
import 'package:my_notes/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);

  runApp(BlocProvider(
    create: (context) => AddNotesCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubitCubit(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
          home: const NotesView()),
    );
  }
}
