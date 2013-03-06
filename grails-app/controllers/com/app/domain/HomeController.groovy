package com.app.domain

import com.app.services.ConfigurationService

import java.io.*
import java.io.FileInputStream
import com.mongodb.*
import com.mongodb.gridfs.*

class HomeController {
	
	static user = true

    def configurationService

    public static byte[] LoadImage(String filePath) throws Exception {
        File file = new File(filePath);
        file.getBytes()
    }

    def mongo() {
        //Load our image
        byte[] imageBytes = LoadImage("C:/test/favicon32.png");
        //Connect to database

        String server = "localhost"
        Integer port = 45297
        String database = "test"

        //MongoClient mongoClient = new MongoClient( "ds045297.mongolab.com" , 45297 );

        MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
        DB db = mongoClient.getDB(database)
        /*String user = "user1987"
        char[] password = 'user1987'
        boolean auth = db.authenticate(user,password);*/

        //Create GridFS object
        GridFS fs = new GridFS( db );
        //Save image into database
        GridFSInputFile ina = fs.createFile( imageBytes );
        ina.setFilename("favicon32.png");
        ina.save();

        //Find saved image
        GridFSDBFile out = fs.findOne( new BasicDBObject( "_id" , ina.getId() ) );

        //Save loaded image from database into new image file
        FileOutputStream outputImage = new FileOutputStream("C:/test/bearCopy.png");
        out.writeTo( outputImage );
        outputImage.close();

        //BasicDBObject query = new BasicDBObject("metadata.target_field", "abcdefg");
        DBCursor cursor = fs.getFileList();
        while (cursor.hasNext()) {
            System.out.println(cursor.next());
            println cursor.getFileName();
        }
    }

    def index() {
        println "NAME: "+configurationService.getSiteName()
		
	}


}
