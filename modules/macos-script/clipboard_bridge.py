import subprocess
from http.server import BaseHTTPRequestHandler, HTTPServer


class H(BaseHTTPRequestHandler):
    def do_POST(self):
        n = int(self.headers.get("Content-Length", 0))
        data = self.rfile.read(n)
        subprocess.run(["pbcopy"], input=data)
        self.send_response(204)  # No Content
        self.end_headers()

    def do_GET(self):
        out = subprocess.run(["pbpaste"], capture_output=True).stdout
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(out)))
        self.end_headers()
        self.wfile.write(out)


if __name__ == "__main__":
    HTTPServer(("127.0.0.1", 8377), H).serve_forever()
