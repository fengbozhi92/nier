package ps.nier.service.group;

import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.group.Group;

public interface GroupRepository extends JpaRepository<Group, String>{

}
