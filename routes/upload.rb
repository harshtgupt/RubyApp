options '/upload/:id' do
  200
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
