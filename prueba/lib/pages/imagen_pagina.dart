// ignore: file_names
import "package:flutter/material.dart";

// ignore: camel_case_types
class imagenPagina extends StatelessWidget {
  
  final String url;
  const imagenPagina({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                    
                  icon: const Icon(Icons.arrow_back_ios)
                  ),
            ),
            
            Hero(
              tag: url,
              child: Image.network(url)),

            const Divider(thickness: 0,
            color: Colors.black,)
          ],
        ),
      ),
    );
  }
}