
class PEP3156AsyncHandler(RequestHandler):
    @coroutine
    def get(self):
        http_client = SomeFutureHTTPClient()
        response = yield from http_client.fetch("http://example.com")
        do_something_with_response(response)
        self.render("template.html")
