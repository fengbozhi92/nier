package ps.nier.core.common.utils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;

public final class XmlUtils {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(XmlUtils.class);
    
    public static Document loadXml(String fileName){
        Document doc = null;
        InputStream is = null;
        try {   
            is = Thread.currentThread().getContextClassLoader().getResourceAsStream(fileName);
            if (is == null) {
                throw new FileNotFoundException(fileName + "file is not found");
            }
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();   
            DocumentBuilder builder = factory.newDocumentBuilder();  
            doc = builder.parse(is);
           } catch (Exception e) {   
               LOGGER.error("load xml failure", e);   
           } finally {
               if (is != null) {
                   try {
                       is.close();
                   } catch (IOException e) {
                       LOGGER.error("close input stream failure", e);
                   }
               }
           }
        return doc;
    }
}
