package com.app.taglib

/**
 * TagLib used to encapsulate some utility methods
 *
 * @author Raúl Gomis
 */
class UtilsTagLib {
    static namespace = 'bs'

    public static String humanReadableByteCount(long bytes, boolean si) {
        int unit = si ? 1000 : 1024;
        if (bytes < unit) return bytes + " B";
        int exp = (int) (Math.log(bytes) / Math.log(unit));
        String pre = ((String)(si ? "kMGTPE" : "KMGTPE").charAt(exp-1)).concat(si ? "" : "i");
        return String.format("%.1f %sB", bytes / Math.pow(unit, exp), pre);
    }

    def byteCountToDisplaySize = { attrs, body ->
        String sizeStr = attrs.size
        String outStr = ""
        if (sizeStr){
            try{
                long size = Long.parseLong(sizeStr)
                outStr = UtilsTagLib.humanReadableByteCount(size,false)
            }
            catch(Exception ex){
                log.error(ex)
            }
        }
        out << outStr
    }
}
