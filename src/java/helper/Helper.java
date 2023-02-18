package helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

    public static boolean deleteFile(String path) {
        boolean status = false;

        try {
            File file = new File(path);
            status = file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static boolean uploadFile(InputStream is, String path) {
        boolean status = false;
        
        try {
            
            // Creating btyes for read the File...
            byte bytes[] = new byte[is.available()];
            is.read(bytes);
 
            // Creating FileOutputStream for write the File...
            FileOutputStream fos = new FileOutputStream(path);

            fos.write(bytes);
            fos.flush();
            fos.close();
            status = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
}
