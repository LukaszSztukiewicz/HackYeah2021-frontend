import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landify/app/core/const/icons.dart';
import 'package:landify/app/core/const/string.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 960.w,
      child: TextField(
        autofillHints: const [AutofillHints.streetAddressLevel1],
        style: Theme.of(context).textTheme.headline3,
        decoration: const InputDecoration(
            filled: true,
            hintText: sHintTextSearchBar,
            labelText: sLabelTextSearchBar,
            prefixIcon: Padding(
              padding: EdgeInsets.all(20.0),
              child: mapMaker,
            ),
            border: OutlineInputBorder()),
      ),
    );
  }
}
