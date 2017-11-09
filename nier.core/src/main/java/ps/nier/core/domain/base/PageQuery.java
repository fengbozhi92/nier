package ps.nier.core.domain.base;

import java.io.Serializable;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

public class PageQuery implements Pageable, Serializable{
	
	private static final long serialVersionUID = 1L;
	
	public int page = 0;
	public int size = 10;
	
	public Sort sort;
	
	@Override
	public int getPageNumber() {
		return page;
	}

	@Override
	public int getPageSize() {
		return size;
	}

	@Override
	public int getOffset() {
		return page * size;
	}

	@Override
	public Sort getSort() {
		return sort;
	}

	@Override
	public Pageable next() {
		return null;
	}

	@Override
	public Pageable previousOrFirst() {
		return null;
	}

	@Override
	public Pageable first() {
		return null;
	}

	@Override
	public boolean hasPrevious() {
		return false;
	}

}
