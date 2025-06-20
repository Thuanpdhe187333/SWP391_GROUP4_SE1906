/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Label;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author daidu
 */
public class LabelDAO extends DBContext{
    public List<Label> getAllLabels() {
    List<Label> list = new ArrayList<>();
    String sql = "SELECT * FROM productlabels"; 

    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Label(
                rs.getInt("LabelID"),
                rs.getString("LabelName")
            ));
        }
    } catch (Exception e) {
        System.out.println("Lỗi khi truy vấn labels: " + e);
    }

    return list;
}

}
