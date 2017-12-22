package ps.nier.core.common.helper;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieHelper {
    
    /**
     * 设置cookie有效期[30天]
     */
    private final static int COOKIE_MAX_AGE = 60 * 60 * 24 * 30;
    
    public final static int  OnyDay         = 60 * 60 * 24;
    
    /**
     * 删除指定Cookie
     * 
     * @param response
     * @param cookie
     */
    public static void removeCookie(HttpServletRequest request, HttpServletResponse response, Cookie cookie) {
        if (cookie != null) {
            cookie.setPath(request.getContextPath());
            cookie.setValue("");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }
    
    public static void removeCookie(HttpServletRequest request, HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, "");
        cookie.setPath(request.getContextPath());
        cookie.setValue("");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }
    
    /**
     * 删除指定Cookie
     * 
     * @param response
     * @param cookie
     * @param domain
     */
    public static void removeCookie(HttpServletRequest request, HttpServletResponse response, Cookie cookie, String domain) {
        if (cookie != null) {
            cookie.setPath(request.getContextPath());
            cookie.setValue("");
            cookie.setMaxAge(0);
            cookie.setDomain(domain);
            response.addCookie(cookie);
        }
    }
    
    /**
     * 根据Cookie名称得到Cookie的值，没有返回null
     * 
     * @param request
     * @param name
     * @return
     */
    public static String getCookieValue(HttpServletRequest request, String name) {
        Cookie cookie = getCookie(request, name);
        if (cookie != null) {
            return cookie.getValue();
        } else {
            return null;
        }
    }
    
    /**
     * 根据Cookie名称得到Cookie对象，不存在该对象则返回null
     * 
     * @param request
     * @param name
     * @return
     */
    public static Cookie getCookie(HttpServletRequest request, String name) {
        Cookie cookies[] = request.getCookies();
        if (cookies == null || name == null || name.length() == 0) {
            return null;
        }
        for (int i = 0; i < cookies.length; i++) {
            if (!cookies[i].getName().equals(name)) {
                continue;
            }
            return cookies[i];
        }
        
        return null;
    }
    
    /**
     * 添加一条新的Cookie信息
     * 
     * @param response
     * @param name
     * @param value
     */
    public static void setCookie(HttpServletResponse response, HttpServletRequest request, String name, String value) {
        setCookie(response, request, name, value, COOKIE_MAX_AGE);
    }
    
    /**
     * 添加一条新的Cookie信息
     * 
     * @param response
     * @param name
     * @param value
     * @param maxAge
     */
    public static void setCookie(HttpServletResponse response,HttpServletRequest request, String name, String value, int maxAge) {
        if (value == null) {
            value = "";
        }
        Cookie cookie = new Cookie(name, value);
        if (maxAge != 0) {
            cookie.setMaxAge(maxAge);
        } else {
            cookie.setMaxAge(COOKIE_MAX_AGE);
        }
        cookie.setPath(request.getContextPath());
        response.addCookie(cookie);
    }
}