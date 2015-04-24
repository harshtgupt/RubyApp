# post '/uploadk' do
    # tempfile = params['myfile'][:tempfile] 
    # filename = params['myfile'][:filename] 
    # cp(tempfile.path, "uploads/#{filename}")
    # 'Yeaaup'
# end
# 
# post '/uploadl' do
  # unless params['myfile'] &&
         # (tmpfile = params['myfile'][:tempfile]) &&
         # (name = params['myfile'][:filename])
    # @error = "No file selected"
    # return haml(:upload)
    # # erb :AddCompany
  # end
  # STDERR.puts "Uploading file, original name #{name.inspect}"
  # while blk = tmpfile.read(65536)
    # # here you would write it to its final location
    # STDERR.puts blk.inspect
  # end
  # "Upload complete"
# end

# post '/upload' do
    # unless params['myfile'] &&
           # (tmpfile = params['myfile'][:tempfile]) &&
           # (name = params['myfile'][:filename])
      # @error = "No file selected"
      # # return haml(:upload)
    # end
      # directory = "public/uploads"
      # path = File.join(directory, name)
      # File.open(path, "wb") { |f| f.write(tmpfile.read) }
# end

 post '/upload' do
  name = params['filename']
  directory = "public/uploads"
  path = File.join(directory, name)
  File.open(path, "wb") { |f| f.write(params['tempfile'].read) }
end

 post '/upload/:id' do
    unless params['myfile'] &&
           (tmpfile = params['myfile'][:tempfile]) &&
           (name = params['myfile'][:filename])
      @error = "No file selected"
      return "Upload Failed"
    end
    updateDirectorFileData(params[:id],name)
    finalFileName = params[:id] + '_' + name 
      directory = "public/uploads"
      path = File.join(directory, finalFileName)
      File.open(path, "wb") { |f| f.write(tmpfile.read) }
      return "Upload Successful"
end

def updateDirectorFileData(directorId,fileName)
    director ||= Director.get(directorId) || halt(404)
    deleteFileIfExist(director[:id].to_s ,director[:fileLoc])
    halt 500 unless director.update(
    fileLoc: fileName
    )
end

def deleteFileIfExist(directorId,fileName)
  fileToDelete = directorId + '_' + fileName
  directory = "public/uploads"
  path = File.join(directory, fileToDelete)
  File.delete(path) if File.exist?(path)
end
# post '/upload' do
 # if params['myfile'].class == String
      # name = params['myfile']
#       
      # string_io = request.body # will return a StringIO
#       
      # data_bytes = string_io.read # read the stream as bytes
#       
      # # create the file path
      # path = File.join(directory, name)
#       
      # # Write it to disk...
      # File.open(path, 'w') {|f| f.write(data_bytes) }
    # else #regular file upload
      # name = params['myfile'][:filename]
#       
      # # create the file path
      # path = File.join(directory, name)
      # # write the file
      # File.open(path, "wb") { |f| f.write(params['myfile'][:tempfile].read) }
    # end
  # end
