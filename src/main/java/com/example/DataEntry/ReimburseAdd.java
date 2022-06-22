package com.example.DataEntry;

public class ReimburseAdd {
    public int getReimburseid() {
        return reimburseid;
    }

    public void setReimburseid(int reimburseid) {
        this.reimburseid = reimburseid;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public float getReimbursementamount() {
        return reimbursementamount;
    }

    public void setReimbursementamount(float reimbursementamount) {
        this.reimbursementamount = reimbursementamount;
    }

    public String getUser_job() {
        return user_job;
    }

    public void setUser_job(String user_job) {
        this.user_job = user_job;
    }

    int reimburseid;
    String user_id;
    float reimbursementamount;
    String user_job;

}
