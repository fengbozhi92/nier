package ps.nier.core.domain.base;

public class UploadResEntity {
	private int errno;
	private Object[] data;
	public int getErrno() {
		return errno;
	}
	public void setErrno(int errno) {
		this.errno = errno;
	}
	public Object[] getData() {
		return data;
	}
	public void setData(Object[] data) {
		this.data = data;
	}
	public UploadResEntity() {
		super();
	}
	public UploadResEntity(int errno, Object[] data) {
		super();
		this.errno = errno;
		this.data = data;
	}
	
}
