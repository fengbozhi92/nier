package ps.nier.core.domain.user;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import ps.nier.core.domain.base.BaseEntity;

@Entity
@Table(name="s_user")
public class UserDetail extends BaseEntity{
	private static final long serialVersionUID = -3830879916102951270L;
	
	@Id
	private String 		id;
	private String 		username;			//用户名
	private String 		password;			//密码
	private int 		roles;				//身份
	private String 		nickname;			//昵称
	private String 		imagePath;			//头像路径
	private String 		email;				//邮箱
	private String 		realName;			//姓名
	private Integer 	gender;				//性别
	private Date 		birthday;			//出生日期
	private String 		hometown;			//家乡
	private String 		residence;			//居住地
	private Integer 	marriage;			//婚姻状况
	private String 		position;			//职位
	private String 		company;			//单位
	private Integer 	worked;				//工作状况
	private String 		qq;					//QQ号
	private String 		wechat;				//微信号
	private String 		sinaMicroblog;		//新浪微博
	private String 		phone;				//电话
	private int 		fansCount;			//粉丝数量
	private int 		followedCount;		//关注数量
	private Integer 	status;				//账号状态

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRoles() {
		return roles;
	}

	public void setRoles(int roles) {
		this.roles = roles;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public Integer getMarriage() {
		return marriage;
	}

	public void setMarriage(Integer marriage) {
		this.marriage = marriage;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Integer getWorked() {
		return worked;
	}

	public void setWorked(Integer worked) {
		this.worked = worked;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public String getSinaMicroblog() {
		return sinaMicroblog;
	}

	public void setSinaMicroblog(String sinaMicroblog) {
		this.sinaMicroblog = sinaMicroblog;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getFansCount() {
		return fansCount;
	}

	public void setFansCount(int fansCount) {
		this.fansCount = fansCount;
	}

	public int getFollowedCount() {
		return followedCount;
	}

	public void setFollowedCount(int followedCount) {
		this.followedCount = followedCount;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
}
