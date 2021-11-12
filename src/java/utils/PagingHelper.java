/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author admin
 */
public class PagingHelper {

    public static int calculateTotalPage(int total, int pageSize) {
        int totalPage = 0;
        if (total == 0) {
            return 0;
        }
        totalPage = total / pageSize;

        if (totalPage * pageSize != total) {
            totalPage += 1;
        }
        return totalPage;
    }
}
