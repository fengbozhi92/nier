package ps.nier.service.user.imp;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import ps.nier.core.common.helper.QueryHelper;
import ps.nier.core.domain.user.User;
import ps.nier.core.domain.user.UserDetail;
import ps.nier.core.domain.user.UserQuery;
import ps.nier.service.user.UserDetailRepository;
import ps.nier.service.user.UserRepository;
import ps.nier.service.user.UserService;
@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserDetailRepository userDetailRepository;
	
	@Override
	public Page<User> findAll(UserQuery user, Pageable page) {
		Page<User> list = userRepository.findAll(new Specification<User>(){
			@Override
			public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate nameLike = null;
				if (user != null && StringUtils.isNotBlank(user.getUsername())) {
					nameLike = cb.like(root.<String>get("username"), QueryHelper.getFullImplict(user.getUsername()));
				}
				if (user != null && StringUtils.isNotBlank(user.getNickname())) {
					nameLike = cb.like(root.<String>get("nickname"), QueryHelper.getFullImplict(user.getNickname()));
				}
				if (nameLike != null) {
					query.where(nameLike);
				}
				return query.getRestriction();
			}		
		}, page);
		return list;
	}

	@Override
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public UserDetail getOne(String id) {
		return userDetailRepository.getOne(id);
	}

	@Override
	public User save(User user) {
		return userRepository.save(user);
	}

	@Override
	public boolean updatePassword(String id, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateImagePath(String id, String imagePath) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateNickname(String id, String nickname) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateFansCount(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateFollowedCount(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateStatus(String id, Integer status) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateRoles(String id, int roles) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UserDetail updateDetail(String id, UserDetail user) {
		UserDetail out = userDetailRepository.getOne(id);
		if (out != null) {
			if (user.getBirthday() != null) {
				out.setBirthday(user.getBirthday());
			}
			if (StringUtils.isNotBlank(user.getCompany())) {
				out.setCompany(user.getCompany());
			}
			if (StringUtils.isNotBlank(user.getHometown())) {
				out.setHometown(user.getHometown());
			}
			if (StringUtils.isNotBlank(user.getPhone())) {
				out.setPhone(user.getPhone());
			}
			if (StringUtils.isNotBlank(user.getPosition())) {
				out.setPosition(user.getPosition());
			}
			if (StringUtils.isNotBlank(user.getQq())) {
				out.setQq(user.getQq());
			}
			if (StringUtils.isNotBlank(user.getRealName())) {
				out.setRealName(user.getRealName());
			}
			if (StringUtils.isNotBlank(user.getResidence())) {
				out.setResidence(user.getResidence());
			}
			if (StringUtils.isNotBlank(user.getSinaMicroblog())) {
				out.setSinaMicroblog(user.getSinaMicroblog());
			}
			if (StringUtils.isNotBlank(user.getWechat())) {
				out.setWechat(user.getWechat());
			}
			if (user.getGender() != null) {
				out.setGender(user.getGender());
			}
			if (user.getMarriage() != null) {
				out.setMarriage(user.getMarriage());
			}
			if (user.getWorked() != null) {
				out.setWorked(user.getWorked());
			}
			out.setVersion(out.getVersion() + 1);
			
			return userDetailRepository.save(out);
		}
		return null;
	}

	@Override
	public boolean deleteOne(String id) {
		try {
			userRepository.delete(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public boolean deleteByIds(String[] ids) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean existsByUsername(String username) {
		return userRepository.existsByUsername(username);
	}

	@Override
	public boolean existsByNickname(String nickname) {
		return userRepository.existsByNickname(nickname);
	}

	@Override
	public boolean existsByEmail(String email) {
		return userRepository.existsByEmail(email);
	}

}
