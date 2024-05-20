import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:prueba/Persistencia/Preferencias.dart';

part 'notificaciones_event.dart';
part 'notificaciones_state.dart';

class NotificacionesBloc
    extends Bloc<NotificacionesEvent, NotificacionesState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificacionesBloc() : super(NotificacionesInitial()) {
    _onForegroundMessage();
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: true,
        provisional: false,
        sound: true);
    settings.authorizationStatus;
    _getToken();
  }

  void _getToken() async {
    final seetings = await messaging.getNotificationSettings();

    if (seetings.authorizationStatus != AuthorizationStatus.authorized) return;
    final token = await messaging.getToken();
    if (token != null) {
      final prefs = Preferencias();
      prefs.token = token;
    }
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
  }

  void handleRemoteMessage(RemoteMessage message) {
    var mensaje = message.data;
    var body = mensaje['body'];
    var title = mensaje['title'];
  }
}
