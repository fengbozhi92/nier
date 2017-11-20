package ps.nier.core.domain.banner;

import javax.persistence.Entity;
import javax.persistence.Table;

import ps.nier.core.domain.base.DefaultEntity;
@Entity
@Table(name="b_banner")
public class Banner extends DefaultEntity{

	private static final long serialVersionUID = -6097583576847320560L;
	
	private String name;
	private int width;
	private int height;
	private int validNum;
	private Integer autoplay;
	private int autoplayInterval;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getValidNum() {
		return validNum;
	}
	public void setValidNum(int validNum) {
		this.validNum = validNum;
	}
	public Integer getAutoplay() {
		return autoplay;
	}
	public void setAutoplay(Integer autoplay) {
		this.autoplay = autoplay;
	}
	public int getAutoplayInterval() {
		return autoplayInterval;
	}
	public void setAutoplayInterval(int autoplayInterval) {
		this.autoplayInterval = autoplayInterval;
	}
	
}
