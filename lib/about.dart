import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text("About"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl:
                  "https://2.bp.blogspot.com/-Vqz9rlENhKU/WZqUQwgzSlI/AAAAAAAAAbs/x1fiWNQujEQ-J8gLSBBvaq8o7ml4Xxn5QCLcBGAs/s1600/Lambang_Kota_Denpasar_%25281%2529.png",
              height: 100,
              // placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 25),
            Text('Denpasar Mantap Penanggulangan Bencana'.toUpperCase()),
            Text('Dauh Puri Kaja, North Denpasar, Denpasar City, Bali 80233'),
            SizedBox(height: 25),
            Text('Versi 0.0.1')
          ],
        ),
      ),
    );
  }
}
