import 'package:eiboard_flutter/themes/light_standard_theme.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
              bottom: 0,
              right: 4,
              child: buildEditIcon(LightStandardTheme.colorSecondary)),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = AssetImage(imagePath);

    return InkWell(
        onTap: onClicked,
        child: ClipOval(
            child: Material(
                color: Colors.transparent,
                child: Image(
                  image: image,
                  fit: BoxFit.cover,
                  width: 110,
                  height: 110,
                ))));
  }

  Widget buildEditIcon(Color color) {
    return buildCircle(
        color: Colors.white,
        all: 2,
        child: buildCircle(
            color: color,
            all: 3,
            child: const Icon(Icons.edit, size: 15, color: Colors.white)));
  }

  Widget buildCircle(
      {required Color color, required double all, required Widget child}) {
    return ClipOval(
        child: Container(
      padding: EdgeInsets.all(all),
      color: color,
      child: child,
    ));
  }
}
