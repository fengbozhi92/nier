package ps.nier.service.user;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import ps.nier.core.domain.user.User;
import ps.nier.core.domain.user.UserDetail;
import ps.nier.core.domain.user.UserQuery;

public interface UserService {
	
	Page<User> findAll(UserQuery user, Pageable page);
	
	User findByUsername(String username);
	
	UserDetail getDetail(String id);
	User get(String id);
	
	User save(User user);
	
	boolean updatePassword(String id, String password);
	boolean updateImagePath(String id, String imagePath);
	boolean updateNickname(String id, String nickname);
	boolean updateFansNum(String id);
	boolean updateFollowedNum(String id);
	boolean updateStatus(String id, Integer status);
	boolean updateRoles(String id, int roles);
	UserDetail updateDetail(String id, UserDetail user);
	
	boolean deleteOne(String id);
	boolean deleteByIds(String[] ids);
	
	boolean existsByUsername(String username);
	boolean existsByNickname(String nickname);
	boolean existsByEmail(String email);
}
