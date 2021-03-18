import 'package:weeding_planner/protocol/request_result.dart';

RequestResult requestError(int statuSCode, String message) => RequestResult(
      statusCode: statuSCode,
      message: message,
    );

RequestResult requestSuccess({dynamic body}) =>
    RequestResult(statusCode: 200, body: body);
