package ps.nier.service.banneritem;

import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.banneritem.BannerItem;

public interface BannerItemRepository extends JpaRepository<BannerItem, String>{

}
