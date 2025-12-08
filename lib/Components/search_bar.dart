import 'package:flutter/material.dart';

//arama çubuğu burada tanımlandı
class SearchBarWidget extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Center(
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Ara...",
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12, // ⬅ iç boşluk arttı → havada durmaz
              horizontal: 10,
            ),
          ),
        ),
      ),
    );
  }
}
