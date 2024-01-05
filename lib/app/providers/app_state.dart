import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:movies_app/app/types/language.dart';

part 'app_state.g.dart';

@CopyWith()
class AppState {
  final Language language;
  final bool includeAdult;

  AppState({this.language = Language.es, this.includeAdult = false});
}
