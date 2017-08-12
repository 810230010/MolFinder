package com.mol.common.qiniu;

import com.mol.common.util.PropertyReader;
import com.qiniu.util.Auth;


/**
 * Created by 江建平 on 2017/8/1.
 */
public class QiniuUtil {
    private static final String ACCESS_KEY = PropertyReader.getProperty("accessKey");
    private static final String SECRET_KEY = PropertyReader.getProperty("secretKey");
    private static final String BUCKET = PropertyReader.getProperty("bucket");
    private static final String BASE_URL = PropertyReader.getProperty("baseUrl");

    //得到uploadToken
    public static String getUploadToken(){
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        String uploadToken = auth.uploadToken(BUCKET);
        return uploadToken;
    }

    //获得上传路径
    public static String getBaseUrl(){
        return BASE_URL;
    }
}
