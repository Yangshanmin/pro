package com.nba.mgr.pro.util;

public class ImageUtil {

    private static String[] IMAGE_FILE_EXT = new String[] {"bmp", "jpg", "jpeg", "png", "gif"};

    public static String IMAGE_DIR = "G:/j2eeworkspace/nba/pro/src/main/webapp/static/uploadImages/";

    public static String IMAGE_DOMAIN = "http://localhost:8787/pro/image/";

    public static boolean isImageAllowed(String imageExt) {
        for (String ext : IMAGE_FILE_EXT) {
            if (ext.equals(imageExt)) {
                return true;
            }
        }
        return false;
    }
}
