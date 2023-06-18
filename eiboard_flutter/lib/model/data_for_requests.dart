class DataForRequests {
  final String? token;
  final String endpoint;
  final Map<String, dynamic> data;

  DataForRequests.requestToken(this.endpoint, this.data) : token = null;

  DataForRequests(this.endpoint, this.data, this.token);
}
