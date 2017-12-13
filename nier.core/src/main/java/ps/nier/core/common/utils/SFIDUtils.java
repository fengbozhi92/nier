package ps.nier.core.common.utils;

import ps.nier.core.common.generator.SnowFlakeGenerator;

public final class SFIDUtils {
    
    private static final SnowFlakeGenerator SNOW_FLAKE_GENERATOR = new SnowFlakeGenerator(0, 0);
    
    public static long getId(){
        return SNOW_FLAKE_GENERATOR.nextId();
    }
}
