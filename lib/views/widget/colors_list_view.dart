import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/cubits/add_note_cubit/add_notes_cubit.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int? currentindex = 2;
  List<Color> colors = const [
    Color(0xff93bedf),
    Color(0xff7f73cb),
    Color(0xff6d5a72),
    Color.fromARGB(255, 142, 153, 249),
    Color(0xff8EF9F3),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentindex = index;
              BlocProvider.of<AddNotesCubit>(context).color = colors[index];
              setState(() {});
            },
            child: ColorItem(
              isactivecolor: currentindex == index,
              color: colors[index],
            ),
          );
        },
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key, required this.isactivecolor, required this.color});
  final bool isactivecolor;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isactivecolor
        ? CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: CircleAvatar(radius: 27, backgroundColor: color),
          )
        : Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: color,
            ),
          );
  }
}
