package com.ischoolbar.programmer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ischoolbar.programmer.model.Page;
import com.ischoolbar.programmer.model.Student;
import com.ischoolbar.programmer.util.StringUtil;

public class StudentDao extends BaseDao {
    // 添加操作
    public boolean addStudent(Student student) {
        String sql = "insert into s_student values(null,'" + student.getSn() + "','" + student.getName() + "'";
        sql += ",'" + student.getPassword() + "','" + student.getClazzId() + "'";
        sql += ",'" + student.getSex() + "','" + student.getBirth() + "','" + student.getMobile() + "'";
        sql += ",'" + student.getNat() + "','" + student.getNat() + "',null)";
        return update(sql);
    }

    // 修改操作
    public boolean editStudent(Student student) {
        // TODO Auto-generated method stub
        String sql = "update s_student set sn = '" + student.getSn() + "'";
        sql += ",name = '" + student.getName() + "'";
        sql += ",sex = '" + student.getSex() + "'";
        sql += ",birth = '" + student.getBirth() + "'";
        sql += ",mobile = '" + student.getMobile() + "'";
        sql += ",dep = '" + student.getDep() + "'";
        sql += ",nat = '" + student.getNat() + "'";
        sql += ",clazz_id = " + student.getClazzId();
        sql += " where id = " + student.getId();
        return update(sql);
    }

    // 设置头像
    public boolean setStudentPhoto(Student student) {
        // TODO Auto-generated method stub
        String sql = "update s_student set photo = ? where id = ?";
        Connection connection = getConnection();
        try {
            PreparedStatement prepareStatement = connection.prepareStatement(sql);
            prepareStatement.setBinaryStream(1, student.getPhoto());
            prepareStatement.setInt(2, student.getId());
            return prepareStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return update(sql);
    }

    // 删除操作
    public boolean deleteStudent(String ids) {
        // TODO Auto-generated method stub
        String sql = "delete from s_student where id in(" + ids + ")";
        return update(sql);
    }

    public Student getStudent(int id) {
        String sql = "select * from s_student where id = " + id;
        Student student = null;
        ResultSet resultSet = query(sql);
        try {
            if (resultSet.next()) {
                student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setClazzId(resultSet.getInt("clazz_id"));
                student.setBirth(resultSet.getString("birth"));
                student.setMobile(resultSet.getString("mobile"));
                student.setName(resultSet.getString("name"));
                student.setPassword(resultSet.getString("password"));
                student.setPhoto(resultSet.getBinaryStream("photo"));
                student.setDep(resultSet.getString("dep"));
                student.setNat(resultSet.getString("nat"));
                student.setSex(resultSet.getString("sex"));
                student.setSn(resultSet.getString("sn"));
                return student;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return student;
    }

    public List<Student> getStudentList(Student student, Page page) {
        List<Student> ret = new ArrayList<Student>();
        String sql = "select * from s_student ";
        if (!StringUtil.isEmpty(student.getName())) {
            sql += "and name like '%" + student.getName() + "%'";
        }
        if (student.getClazzId() != 0) {
            sql += " and clazz_id = " + student.getClazzId();
        }
        if (student.getId() != 0) {
            sql += " and id = " + student.getId();
        }
        sql += " limit " + page.getStart() + "," + page.getPageSize();
        ResultSet resultSet = query(sql.replaceFirst("and", "where"));
        try {
            while (resultSet.next()) {
                Student s = new Student();
                s.setId(resultSet.getInt("id"));
                s.setClazzId(resultSet.getInt("clazz_id"));
                s.setBirth(resultSet.getString("birth"));
                s.setMobile(resultSet.getString("mobile"));
                s.setName(resultSet.getString("name"));
                s.setPassword(resultSet.getString("password"));
                s.setPhoto(resultSet.getBinaryStream("photo"));
                s.setDep(resultSet.getString("dep"));
                s.setNat(resultSet.getString("nat"));
                s.setSex(resultSet.getString("sex"));
                s.setSn(resultSet.getString("sn"));
                ret.add(s);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ret;
    }

    public int getStudentListTotal(Student student) {
        int total = 0;
        String sql = "select count(*)as total from s_student ";
        if (!StringUtil.isEmpty(student.getName())) {
            sql += "and name like '%" + student.getName() + "%'";
        }
        if (student.getClazzId() != 0) {
            sql += " and clazz_id = " + student.getClazzId();
        }
        if (student.getId() != 0) {
            sql += " and id = " + student.getId();
        }
        ResultSet resultSet = query(sql.replaceFirst("and", "where"));
        try {
            while (resultSet.next()) {
                total = resultSet.getInt("total");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return total;
    }

    public Student login(String sn, String password) {
        String sql = "select * from s_student where sn = '" + sn + "' and password = '" + password + "'";
        ResultSet resultSet = query(sql);
        try {
            if (resultSet.next()) {
                Student student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setPassword(resultSet.getString("password"));
                student.setClazzId(resultSet.getInt("clazz_id"));
                student.setBirth(resultSet.getString("birth"));
                student.setMobile(resultSet.getString("mobile"));
                student.setPhoto(resultSet.getBinaryStream("photo"));
                student.setDep(resultSet.getString("dep"));
                student.setNat(resultSet.getString("nat"));
                student.setSex(resultSet.getString("sex"));
                student.setSn(resultSet.getString("sn"));
                return student;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    public boolean editPassword(Student student, String newPassword) {
        // TODO Auto-generated method stub
        String sql = "update s_student set password = '" + newPassword + "' where id = " + student.getId();
        return update(sql);
    }
}
