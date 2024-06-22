import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

import '../Constent/Colors.dart';



class Wid_Con {
  static iconButton(
      {required VoidCallback onPressed,
        required Icon BIcon,
        Color? Button_color,
        double? Iconsize,
        double? splashRadius}) {
    return IconButton(
      onPressed: onPressed,
      icon: BIcon,
      color: Button_color,
      iconSize: Iconsize,
      splashRadius: splashRadius,
    );
  }

  static textfield(
      {
        var suffixIcon,
        var prefixIcon,
        var controller,
        bool? obscureText,
        bool? filled,
        Color? filledColor,
        double? paddingtop,
        double? contenthorizontal,
        double? contentvertical,
        double? paddingbottom,
        double? paddingleft,
        double? paddingright,
        double? borderwidth,
        var focusedBorder,
        errorBorder,
        key,
        errorText,
        String? labelText,
        var validator,
        var inputFormatters,
        String? hintText,
        var keyboardType,
        // ignore: use_function_type_syntax_for_parameters
        Function(String)? onChanged,
        var maxLines,double? width,double? height,
        var borderSide}) {
    return SizedBox(
      height:height??60,
      width: width,
      child: TextFormField(
        validator: validator,
        obscureText: obscureText??false,
        style: TextStyle(fontWeight: FontWeight.w500,color: themeDarkColor),
        key: key,
        inputFormatters: inputFormatters,
        maxLines:maxLines??1,
        keyboardType: keyboardType??TextInputType.text,
        controller: controller,
        onChanged: onChanged,
        cursorColor: themeDarkColor,
        decoration: InputDecoration(
            labelText: labelText,
            contentPadding:EdgeInsets.symmetric(horizontal: contenthorizontal??15,vertical: contentvertical??15),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            filled: filled??false,
            fillColor: filledColor??grey,
            hintText: hintText??'',
            hintStyle: TextStyle(
                color: grey,
                fontSize: 15,
                fontWeight: FontWeight.w600,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: themeDarkColor,width: borderwidth??1)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide( color: white,width:borderwidth?? 1),
            ),
            errorBorder: OutlineInputBorder(
              gapPadding: 50,
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide( color: red,width: 2),
            ),
            errorText: errorText,
            floatingLabelStyle: TextStyle(
                color: themeDarkColor,
            ),
            labelStyle: TextStyle(
                fontSize: 15,
            ),
            border: OutlineInputBorder(
    borderSide: borderSide??BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }

  static button({String? ButtonName,
    Color? titelcolor,
    Color? Bordercolor,
    required VoidCallback onPressed,
    double? ButtonRadius,
    double? fontSize,
    Color? ButtonColor,
    double? width,
    double? height,
    var child,
    double? elevation,
    double? borderWidth
  }) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color?>(Colors.grey.withOpacity(0.5)),
          elevation: MaterialStateProperty.all<double?>(elevation),
          minimumSize:
          MaterialStateProperty.all<Size?>( Size(width??double.infinity,height?? 50)),
          // fixedSize: ,

          backgroundColor: MaterialStateProperty.all<Color?>(ButtonColor??themeDarkColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(

                side: BorderSide(color:Bordercolor??transparent,width: borderWidth??0),
                borderRadius: BorderRadius.circular(ButtonRadius??10.0),
              ))),
      onPressed: onPressed,
      child:child ?? Text(
        ButtonName??'',
        style: TextStyle(
            color:titelcolor?? white,
            fontSize:fontSize??20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Light'
        ),
      ),
    );
  }


  static App_Bar({
    String? titel,
    var leading,
    var Status,
    bool? centerTitle,
    var titelwidget,
    List<Widget>? actions,
    var arrowNearText
  }) {
    return AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        centerTitle: centerTitle,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Status??
                Container(),
            titelwidget??Container(),
            titel!=null?
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text( titel??'',
                    style: TextStyle(fontFamily: 'Medium',
                        color: white,
                        fontSize: 18, fontWeight: FontWeight.w500)),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(arrowNearText,size: 20,),
                ),
              ],
            ):Container(),
          ],
        ),
        leading: leading,
        actions: actions
    );
  }

  static Text_Style({var fontWeight,shadows,Color? color,double? fontSize,String? fontFamily}){
    return TextStyle(
    fontWeight: fontWeight??FontWeight.w500,
      color: color??black,
      fontSize: fontSize??16,
      fontFamily: fontFamily??'PlaywriteNGModern',
      shadows: shadows
    );
}

  static keyPadButton({String? ButtonName,
    Color? titelcolor,
    Color? Bordercolor,
    required VoidCallback onPressed,
     VoidCallback? onLongPress,
    double? ButtonRadius,
    double? fontSize,
    Color? ButtonColor,
    double? width,
    double? height,
    var child,
    double? elevation,
    double? borderWidth
  }) {
    return ElevatedButton(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color?>(Colors.grey.withOpacity(0.1)),
          elevation: MaterialStateProperty.all<double?>(elevation??0),
          minimumSize:
          MaterialStateProperty.all<Size?>( Size(width??100,height?? 100)),
          // fixedSize: ,

          backgroundColor: MaterialStateProperty.all<Color?>(ButtonColor??white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ButtonRadius??10.0),
              ))),
      onLongPress: onLongPress??() {},
      onPressed: onPressed,
      child:child ?? Text(
        ButtonName??'',
        style: TextStyle(
            color:titelcolor?? themeDarkColor,
            fontSize:fontSize??20,
            fontWeight: FontWeight.w400,
            fontFamily: 'Light'
        ),
      ),
    );
  }


  static NavigationTo(var NavigatClass){
    return Get.to(NavigatClass,
    duration: Duration(milliseconds: 700),
    transition: Transition.native,);
}

static NavigationOff(var NavigatClass){
    return Get.off(NavigatClass,
    duration: Duration(milliseconds: 700),
    transition: Transition.native,);
}

static NavigationOffAll(var NavigatClass){
    return Get.offAll(NavigatClass,
    duration: Duration(milliseconds: 700),
    transition: Transition.native,);
}

}
