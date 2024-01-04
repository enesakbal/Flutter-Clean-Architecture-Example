import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin BaseBottomSheetMixin on StatelessWidget {
  Future<T?> show<T>(BuildContext context) {
    return showModalBottomSheet<T>(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: const Radius.circular(20).r)),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            0.05.sw,
            0.05.sw,
            0.05.sw,
            0,
          ).r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //* Drag Indicator
              Divider(
                thickness: 2.h,
                endIndent: 0.35.sw,
                indent: 0.35.sw,
                color: Theme.of(context).disabledColor,
              ),

              20.verticalSpace,

              //* Content
              this,
            ],
          ),
        );
      },
    );
  }
}
