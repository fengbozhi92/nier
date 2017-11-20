package ps.nier.service.banner;

import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.banner.Banner;

public interface BannerRepository extends JpaRepository<Banner, String>{

}
