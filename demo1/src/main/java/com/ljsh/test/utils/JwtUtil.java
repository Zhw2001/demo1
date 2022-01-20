package com.ljsh.test.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.util.Date;

public class JwtUtil {
    private static final long EXPIRE_TIME = 15 * 60 * 1000;
    private static final String TOKEN_SECRET = UUIDGenerator.getPart(6).getMyuuid();  //密钥盐(随机生成的字符串:)

    public static String sign(String account) {

        String token = null;
        try {
            Date expiresAt = new Date(System.currentTimeMillis() + EXPIRE_TIME);
            token = JWT.create()
                    .withIssuer("auth0")//发行人
                    .withClaim("account", account)//荷载
                    .withExpiresAt(expiresAt)//有效时间
                    .sign(Algorithm.HMAC384(TOKEN_SECRET));//加密，采用HMAC384算法
        } catch (Exception e) {
            e.printStackTrace();
        }
        return token;

    }


    public static boolean verify(String token) {
        try {
            JWTVerifier verifier = JWT.require(Algorithm.HMAC384(TOKEN_SECRET)).withIssuer("auth0").build();
            DecodedJWT jwt = verifier.verify(token);
            System.out.println("认证通过: ");
            System.out.println("issuer: " + jwt.getIssuer());
            System.out.println("account: " + jwt.getClaim("account").asString());
            System.out.println("过期时间: " + jwt.getExpiresAt());
            return true;
        } catch (Exception e) {
            return false;
        }
    }


}
