package ps.nier.core.domain.user;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import ps.nier.core.domain.base.DefaultEntity;

@Entity
@Table(name="s_user")
@JsonIgnoreProperties({"handler", "hibernateLazyInitializer"})
public class User extends DefaultEntity{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private String 		id;
	private String 		username;			//用户名
	private String 		password;			//密码
	private int 		roles;				//身份
	private String 		nickname;			//昵称
	private String 		email;				//邮箱
	private String		imagePath;			//头像
	private String salt;

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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRoles() {
		return roles;
	}
	public void setRoles(int roles) {
		this.roles = roles;
	}	
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
    public String getSalt() {
        return salt;
    }
    public void setSalt(String salt) {
        this.salt = salt;
    }
}
