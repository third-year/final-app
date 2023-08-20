abstract class AccessoriesStates {}

class AccessoriesInitialState extends AccessoriesStates{}

class AccessoriesLodingHome extends AccessoriesStates{}

class AccessoriesSuccessHome extends AccessoriesStates{}

class AccessoriesErrorHome extends AccessoriesStates{
  final String? Error;
  AccessoriesErrorHome(this.Error);
}