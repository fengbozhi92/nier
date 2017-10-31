package ps.nier.core.common.exception;
/**
 *  作用:	spring事务主动回滚异常
 *  作者:	冯博智
 *  时间:	2017/09/15
 *  版本:	1.0
 * */
public class AppException extends RuntimeException{
	private static final long serialVersionUID = 7690034539167074249L;
	
	public AppException(){}
	
	public AppException(String message){
		super(message);
	}
}
