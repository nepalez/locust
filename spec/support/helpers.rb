def local_path(content)
  file = Tempfile.create
  File.write file, content
  file.path
end

def remote_path(content)
  path = "https://www.example.com/source"
  stub_request(:get, path).to_return(body: content)
  path
end
