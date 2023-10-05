import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJson(response.data);

    final yesNoText = yesNoModel.answer=="yes" ? 'Si' : 'No';

    return Message(text: yesNoText, fromWho: FromWho.hers,imageUrl: yesNoModel.image);
  }
}
