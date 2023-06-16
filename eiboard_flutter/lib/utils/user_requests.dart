import '../model/data_for_requests.dart';

class UserRequests {
  static final requestToken = DataForRequests.requestToken(
      'realms/eiBoardKeycloak/protocol/openid-connect/token', {
    'client_id': 'eiclient',
    'username': 'user',
    'password': 'test',
    'grant_type': 'password',
    'client_secret': 'iJur3UqVPUMj9VCpK8uh1gP9djoRMJpN'
  });
}
