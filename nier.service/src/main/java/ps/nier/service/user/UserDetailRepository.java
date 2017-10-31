package ps.nier.service.user;

import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.user.UserDetail;

public interface UserDetailRepository extends JpaRepository<UserDetail, String>{

}
