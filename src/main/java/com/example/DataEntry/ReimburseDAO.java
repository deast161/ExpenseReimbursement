package com.example.DataEntry;
import java.sql.*;

public class ReimburseDAO {
    static Connection conn;
    static PreparedStatement pst;

    public static int insertCustomer(ReimburseAdd u){
        int status=0;
        try{
            conn=ConnectionProvider.getCon();
            pst=conn.prepareStatement("insert into reimbursements values(?,?,?,?) ");
            pst.setString(1,u.getUser_id());
            pst.setInt(2,u.getReimburseid());
            pst.setFloat(3,u.getReimbursementamount());
            pst.setString(4,u.getUser_job());
            status=pst.executeUpdate();
            conn.close();

        }catch(Exception ex){
            System.out.println(ex);
        }
        return status;
    }
}
