import 'package:firstflutterproject/models/econo_app/quintityModel.dart';

import '../../../../models/econo_app/rivewModel.dart';


abstract class DitailsStates {

}

class ShopIniteilState extends DitailsStates{}

class DitailsLoding extends DitailsStates{}

class DitailsSuccses extends DitailsStates{}

class DitailsError extends DitailsStates{}
/////////////////////////////////////////////////////
class RivewStatesSuccses extends DitailsStates{

  final RivewModel Rivew;
  RivewStatesSuccses(this.Rivew);
}

class RivewStatesError extends DitailsStates{

  final String error;
  RivewStatesError(this.error);
}
//////////////////////////////////////////////////////////
class GetRivewStateLoding extends DitailsStates{

}

class GetRivewStateSuccess extends DitailsStates{

}
class GetRivewStateError extends DitailsStates{

}
///////////////////////////////////////////////////////////
class QuintityStatesSuccses extends DitailsStates{

  final QuintityModel quintityModel;
  QuintityStatesSuccses(this.quintityModel);
}

class QuintityStatesError extends DitailsStates{

  final String error;
  QuintityStatesError(this.error);
}
/////////////////////////////////////////
class CounterPluseState extends DitailsStates{}
class CounterMinueState extends DitailsStates{}