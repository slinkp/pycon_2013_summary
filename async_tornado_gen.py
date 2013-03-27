 
class GenAsyncHandler(RequestHandler):
    @asynchronous
    @gen.engine
    def get(self):
        http_client = AsyncHTTPClient()
        response = yield gen.Task(http_client.fetch,
                                  "http://example.com")
        do_something_with_response(response)
        self.render("template.html")
