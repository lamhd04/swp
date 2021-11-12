/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author admin
 */
public class RequestHelper {

    public static void setAttributes(Map<String, Object> data, HttpServletRequest request) {
        for (String key : data.keySet()) {
            Object x = data.get(key);
            if (x != null) {
                request.setAttribute(key, x);
            }
        }
    }

    public static Integer paramToIntegerValue(HttpServletRequest request, String paramName) {
        try {
            String value = request.getParameter(paramName);
            return Integer.parseInt(value);
        } catch (Exception e) {
            return null;
        }
    }

    public static void displayParam(HttpServletRequest request) {
        Map<String, String[]> param = request.getParameterMap();
        for (String key : param.keySet()) {
            System.out.println(key + " = " + param.get(key)[0]);
        }
    }
}
