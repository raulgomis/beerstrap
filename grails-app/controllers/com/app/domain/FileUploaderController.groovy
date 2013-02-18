package com.app.domain

import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

class FileUploaderController {
    static admin = true

    def fileUploaderService

    def index() {

    }

    private File getUploadDirectory(String path){
        File userDir
        try{
            userDir = new java.io.File(path)
            if(!userDir.exists()){
                if (!userDir.mkdirs()){
                    log.error("No se han podido crear los directorios: [${path}]")
                }
            }
        }
        catch(Exception ex){
            def message = "Error al crear el directorio"
            throw new RuntimeException(message)
        }
        return userDir
    }

    def ajaxGetFiles(){
        def results = []
        File folder = getUploadDirectory("/tmp");
        File[] listOfFiles = folder.listFiles();
        listOfFiles.each { file ->
            if (file.isFile()){
                results << [
                        name: file.name,
                        size: file.size(),
                        url: createLink(controller: 'home', action: 'fileGetUpload'),
                        thumbnail_url: createLink(controller: 'home', action: 'fileGetUpload'),
                        delete_url: createLink(controller: 'home', action: 'fileGetUpload'),
                        delete_type: "DELETE"
                ]
            }
        }
        render results as JSON
    }

    def fileupload() {
        def results = []
        if (request instanceof MultipartHttpServletRequest){
            for(filename in request.getFileNames()){
                MultipartFile file = request.getFile(filename)

                String newFileName = UUID.randomUUID().toString() + file.originalFilename.substring(file.originalFilename.lastIndexOf("."))
                File filePath = getUploadDirectory("/tmp/$newFileName")
                file.transferTo(filePath)

                results << [
                        name: file.originalFilename,
                        size: file.size,
                        url: createLink(controller: 'home', action: 'fileGetUpload'),
                        thumbnail_url: createLink(controller: 'home', action: 'fileGetUpload'),
                        delete_url: createLink(controller: 'home', action: 'fileGetUpload'),
                        delete_type: "DELETE"
                ]
            }
        }

        render results as JSON
    }

    def fileGetUpload() {
        def results = []
        render results as JSON
    }




    def upload() {
        try{
            if (params.file) {
                request.getFileNames().each { doc ->

                    def f = request.getFile(doc)
                    fileUploaderService.saveFile(f, null)

                    /*
                    currentUser.addToDocumentos(documentoInstance)

                    if(currentUser.save(flush:true)){
                        flash.message = "Documento adjuntado correctamente"
                    }
                    else{
                        flash.message = "Error subiendo el documento"
                    }
                    */
                }
            }
            else{
                flash.message = "Por favor, seleccione un fichero"
            }
        }
        catch (Exception ex) {
            flash.message = ex.message
            log.error(ex)
        }

        redirect(action:"index")
    }


    /*
     def fileupload2() {

          if (params["getfile"] != null && !params["getfile"].isEmpty()) {
              File file = new File(request.getServletContext().getRealPath("/")+"imgs/"+params["getfile"]);
              if (file.exists()) {

                  println "FILE EXISTS"
                  int bytes = 0;
                  ServletOutputStream op = response.getOutputStream();

                  response.setContentType(getMimeType(file));
                  response.setContentLength((int) file.length());
                  response.setHeader( "Content-Disposition", "inline; filename=\"" + file.getName() + "\"" );

                  byte[] bbuf = new byte[1024];
                  DataInputStream in = new DataInputStream(new FileInputStream(file));

                  while ((in != null) && ((bytes = in.read(bbuf)) != -1)) {
                      op.write(bbuf, 0, bytes);
                  }

                  in.close();
                  op.flush();
                  op.close();
              }
          } else if (params["delfile"] != null && !params["delfile"].isEmpty()) {
              File file = new File(request.getServletContext().getRealPath("/")+"imgs/"+ params["delfile"]);
              if (file.exists()) {
                  file.delete(); // TODO:check and report success
              }
          } else if (params["getthumb"] != null && !params["getthumb"].isEmpty()) {
              File file = new File(request.getServletContext().getRealPath("/")+"imgs/"+params["getthumb"]);

              if (file.exists()) {

                  System.out.println(file.getAbsolutePath());
                  String mimetype = getMimeType(file);
                  if (mimetype.endsWith("png") || mimetype.endsWith("jpeg")|| mimetype.endsWith("jpg") || mimetype.endsWith("gif")) {
                      BufferedImage im = ImageIO.read(file);
                      if (im != null) {
                          BufferedImage thumb = Scalr.resize(im, 75);
                          ByteArrayOutputStream os = new ByteArrayOutputStream();
                          if (mimetype.endsWith("png")) {
                              ImageIO.write(thumb, "PNG" , os);
                              response.setContentType("image/png");
                          } else if (mimetype.endsWith("jpeg")) {
                              ImageIO.write(thumb, "jpg" , os);
                              response.setContentType("image/jpeg");
                          } else if (mimetype.endsWith("jpg")) {
                              ImageIO.write(thumb, "jpg" , os);
                              response.setContentType("image/jpeg");
                          } else {
                              ImageIO.write(thumb, "GIF" , os);
                              response.setContentType("image/gif");
                          }
                          ServletOutputStream srvos = response.getOutputStream();
                          response.setContentLength(os.size());
                          response.setHeader( "Content-Disposition", "inline; filename=\"" + file.getName() + "\"" );
                          os.writeTo(srvos);
                          srvos.flush();
                          srvos.close();
                      }
                  }
              } // TODO: check and report success

          } else {
              PrintWriter writer = response.getWriter();
              writer.write("call POST with multipart form data");
          }
      }

    */



    private String getMimeType(File file) {
        String mimetype = "";
        if (file.exists()) {
            if (getSuffix(file.getName()).equalsIgnoreCase("png")) {
                mimetype = "image/png";
            }else if(getSuffix(file.getName()).equalsIgnoreCase("jpg")){
                mimetype = "image/jpg";
            }else if(getSuffix(file.getName()).equalsIgnoreCase("jpeg")){
                mimetype = "image/jpeg";
            }else if(getSuffix(file.getName()).equalsIgnoreCase("gif")){
                mimetype = "image/gif";
            }else {
                javax.activation.MimetypesFileTypeMap mtMap = new javax.activation.MimetypesFileTypeMap();
                mimetype  = mtMap.getContentType(file);
            }
        }
        return mimetype;
    }



    private String getSuffix(String filename) {
        String suffix = "";
        int pos = filename.lastIndexOf('.');
        if (pos > 0 && pos < filename.length() - 1) {
            suffix = filename.substring(pos + 1);
        }
        return suffix;
    }


}
