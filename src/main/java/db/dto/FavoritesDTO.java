package db.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FavoritesDTO {
    private int favor_fk_user_num;
    private int favor_fk_post_num;
    private int favor_fk_proj_num;
}
