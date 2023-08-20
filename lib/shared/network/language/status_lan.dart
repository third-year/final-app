 import 'dart:ui';



abstract class LanStates{}
 class LanInitialState extends LanStates{}
 class ChangeLocaleState extends LanStates{
 final Locale locale;
  ChangeLocaleState({required this.locale});
}
 class ChangeModeState extends LanStates{}
