import 'dart:convert';

ExpertInformationModel ExpertInformationModelFromJson(String str) =>
    ExpertInformationModel.fromJson(json.decode(str));

String ExpertInformationModelToJson(ExpertInformationModel data) => json.encode(
  data.toJson(
    ExpertInformationModel(experienc: '', experity: ''),
  ),
);

class ExpertInformationModel {
  ExpertInformationModel({
    required this.experienc,
    required this.experity,
  });

  final String experienc;
  final String experity;

  factory ExpertInformationModel.fromJson(Map<String, dynamic> json) => ExpertInformationModel(
    experienc: json['email'],
    experity: json['experity'],
  );

  Map<String, dynamic> toJson(ExpertInformationModel log) {
    return {
      "email": log.experienc,
      "experity": log.experity,
    };
  }
}
