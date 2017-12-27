package com.bdqn.tools;

/**
 * Created by hp on 2017/12/12.
 */
public class Comm {
    public static final int MAX_STUDENT_NUM_N = 15;
    private String code;
    private String msg;
    public static Comm message(String code,String msg){
        Comm comm = new Comm();
        comm.setCode(code);
        comm.setMsg(msg);
        return  comm;
    }
    public static Comm success(){
        Comm comm = new Comm();
        comm.setCode("0000");
        comm.setMsg("操作成功");
        return comm;
    }
    public static Comm failed(){
        Comm comm = new Comm();
        comm.setCode("0001");
        comm.setMsg("操作失败");
        return comm;
    }
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
