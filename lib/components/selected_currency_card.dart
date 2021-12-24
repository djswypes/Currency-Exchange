import 'package:flutter/material.dart';
class SelectedCurrencyCard extends StatelessWidget {
  const SelectedCurrencyCard({
    Key? key, required this.currencyTicker, required this.currencyImage, required this.onTap, this.package
  }) : super(key: key);
  final String currencyTicker;
  final String currencyImage;
  final VoidCallback onTap;
  final String? package;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0XFF5D5D5D), width: 3),
          color: const Color(0XFFFFFFFF),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(
                    currencyImage,
                    package: package,
                  ),
                ),
                const SizedBox(
                    width: 5
                ),
                Text(
                  currencyTicker,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            Row(
              children: const [
                  Icon(
                    Icons.arrow_drop_down,
                    size: 31,
                    color: Colors.black,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}