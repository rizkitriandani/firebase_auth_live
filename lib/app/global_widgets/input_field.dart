part of 'widgets.dart';

class InputField extends StatelessWidget {
  InputField(
      {Key? key,
      this.prefixIcon,
      this.obscureText = false,
      required this.textEditingController,
      this.errorMsg,
      required this.hintText,
      this.color = Colors.blue,
      this.suffixIcon,
      required this.onChanged})
      : super(key: key);

  final TextEditingController textEditingController;
  final Function(String) onChanged;
  final String? errorMsg;
  final String hintText;
  final Color color;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      controller: textEditingController,
      cursorColor: Color.fromRGBO(0, 0, 0, 0.122),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        errorText: errorMsg,
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.blue,
        hoverColor: Colors.blue,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }
}
