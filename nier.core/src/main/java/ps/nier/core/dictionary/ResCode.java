package ps.nier.core.dictionary;

public enum ResCode {
    Success(0, "请求成功"),
    Error(-1, "网络异常，请稍后重试");

    private int code;
    private String msg;

    ResCode(int code, String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }
    public String getMsg() {
        return msg;
    }
}
