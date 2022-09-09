part of 'widgets.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton(
      {Key? key, this.onPressed, required this.label, this.color = Colors.blue})
      : super(key: key);
  final VoidCallback? onPressed;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
          primary: color, minimumSize: Size.fromHeight(Get.height * 0.05)),
    );
  }
}
