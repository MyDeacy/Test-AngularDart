import 'package:angular/angular.dart';

import 'src/querygetter/component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [QueryGetterComponent],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
