import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
        child: Column(
          children: [
            Row(children: [
              Text(
                "Explore",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ]),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
cursorColor: Color(0xfffd894f),
                    decoration: InputDecoration(
                      isDense: true,

                      filled: true,
                      fillColor: Color(0xfff2f2f7),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                      hintText: 'Search...',
                      prefixIconConstraints: BoxConstraints(
                          minWidth: 30,
                          minHeight: 30,
                          maxHeight: 31,
                          maxWidth: 31),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),

                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                TextButton(
                    onPressed: () {
                      
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Color(0xfffd894f)),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
