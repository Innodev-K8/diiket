import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NumberSpinner extends HookWidget {
  final Function(int)? onChanged;
  final int initialValue;

  const NumberSpinner({
    Key? key,
    this.onChanged,
    this.initialValue = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final number = useState<int>(initialValue);

    return Container(
      width: 94,
      height: 28,
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        color: ColorPallete.numberSpinnerColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {
                number.value--;

                onChanged?.call(number.value);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorPallete.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                child: Icon(
                  Icons.remove,
                  color: ColorPallete.numberSpinnerColor,
                  size: 16.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: AbsorbPointer(
              child: Center(
                child: Text(
                  '${number.value}',
                  style: kTextTheme.caption!.copyWith(
                    color: ColorPallete.backgroundColor,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {
                number.value++;

                onChanged?.call(number.value);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorPallete.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: ColorPallete.numberSpinnerColor,
                  size: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
