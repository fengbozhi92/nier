package ps.nier.core.common.utils;

import java.lang.reflect.Type;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

public final class GsonUtils {
	public static <T> T fromJson(String json, Class<T> classOfT){
		Gson g = new Gson();
		return g.fromJson(json, classOfT);
	}
	
	public static String toJson(Object src) {
		Gson g = new Gson();
		return g.toJson(src);
	}
	
	public static <T> T fromJson(JsonElement json, Class<T> classOfT){
		Gson g = new Gson();
		return g.fromJson(json, classOfT);
	}
	
	public static String toJson(JsonElement jsonElement) {
		Gson g = new Gson();
		return g.toJson(jsonElement);
	}
	
	public static <T> T fromJson(String json, Type typeOfT) {
		Gson g = new Gson();
		return g.fromJson(json, typeOfT);
	}
}
