/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author lhquan1
 */
public class UrlHelper {

    public static String getQueryParam(HashMap<String, String> params) {
        StringBuilder condition = new StringBuilder();
        boolean isFirst = true;
        for (Map.Entry<String, String> entry : params.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            if (isFirst) {
                condition.append("?");
            } else {
                condition.append("&");
            }
            isFirst = false;
            condition.append(key).append("=").append(value);

        }
        if (isFirst) {
            condition.append("?");
        } else {
            condition.append("&");
        }
        return condition.toString();
    }
}
