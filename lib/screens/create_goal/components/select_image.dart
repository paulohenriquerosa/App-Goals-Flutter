import 'package:flutter/material.dart';
import '../../../utils/app_routes.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.SELECT_IMAGE);
      },
      child: Container(
        height: 175,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selecionar uma imagem',
              style: TextStyle(
                color: Color(0xFF797E88),
                fontWeight: FontWeight.w400,
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
            Icon(
              Icons.cloud_download_outlined,
              color: Color(0xFF797E88),
            ),
          ],
        ),
      ),
    );
  }
}
