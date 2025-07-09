import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final IconData settingsIcon;
  const SearchFilter({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.settingsIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (16)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              width: 308,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // bo tròn
              ),

              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    icon,
                    color: Colors.grey, // màu icon tìm kiếm
                  ),

                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Colors.yellow[500],
              borderRadius: BorderRadius.circular(16), // bo nhẹ góc
            ),
            child: Icon(settingsIcon, color: Colors.white), // icon tuỳ chỉnh
          ),
        ],
      ),
    );
  }
}
